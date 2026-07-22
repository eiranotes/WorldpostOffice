import CoreGraphics
import Foundation
import ImageIO
import UniformTypeIdentifiers

func fail(_ message: String) -> Never {
    FileHandle.standardError.write(Data((message + "\n").utf8))
    exit(1)
}

let arguments = Array(CommandLine.arguments.dropFirst())
guard !arguments.isEmpty, arguments.count.isMultiple(of: 2) else {
    fail("Usage: NormalizePNG.swift <input> <output> [<input> <output> ...]")
}

for index in stride(from: 0, to: arguments.count, by: 2) {
    let inputURL = URL(fileURLWithPath: arguments[index])
    let outputURL = URL(fileURLWithPath: arguments[index + 1])

    guard let source = CGImageSourceCreateWithURL(inputURL as CFURL, nil),
          let sourceImage = CGImageSourceCreateImageAtIndex(source, 0, nil) else {
        fail("Unable to decode PNG: \(inputURL.path)")
    }

    let width = sourceImage.width
    let height = sourceImage.height
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let bitmapInfo = CGBitmapInfo.byteOrder32Big.rawValue |
        CGImageAlphaInfo.premultipliedLast.rawValue

    guard let context = CGContext(
        data: nil,
        width: width,
        height: height,
        bitsPerComponent: 8,
        bytesPerRow: width * 4,
        space: colorSpace,
        bitmapInfo: bitmapInfo
    ) else {
        fail("Unable to create RGBA context for: \(inputURL.path)")
    }

    context.interpolationQuality = .high
    context.clear(CGRect(x: 0, y: 0, width: width, height: height))
    context.draw(sourceImage, in: CGRect(x: 0, y: 0, width: width, height: height))

    guard let normalizedImage = context.makeImage(),
          let destination = CGImageDestinationCreateWithURL(
              outputURL as CFURL,
              UTType.png.identifier as CFString,
              1,
              nil
          ) else {
        fail("Unable to create normalized PNG: \(outputURL.path)")
    }

    CGImageDestinationAddImage(destination, normalizedImage, [
        kCGImagePropertyPNGInterlaceType: 0
    ] as CFDictionary)

    guard CGImageDestinationFinalize(destination) else {
        fail("Unable to finalize normalized PNG: \(outputURL.path)")
    }

    print("Normalized \(inputURL.lastPathComponent) -> \(outputURL.lastPathComponent) [\(width)x\(height), RGBA]")
}
