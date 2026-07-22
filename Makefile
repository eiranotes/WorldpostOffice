.PHONY: generate assets test clean

assets:
	bash Scripts/materialize-assets.sh

generate: assets
	xcodegen generate

test: generate
	xcodebuild -project WorldPostOfficeHome.xcodeproj -scheme WorldPostOfficeHome -destination 'platform=iOS Simulator,name=iPhone 16 Pro' CODE_SIGNING_ALLOWED=NO test

clean:
	rm -rf WorldPostOfficeHome.xcodeproj DerivedData TestResults.xcresult
	rm -rf WorldPostOfficeHome/Assets.xcassets
