#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE_DIR="$ROOT/AssetSources"
CATALOG="$ROOT/WorldPostOfficeHome/Assets.xcassets"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

ASSETS=(
  BunnyAvatar
  EnergyStamp
  HeartEnvelope
  HeroScene
  PlantPolaroid
  ProfileCatAvatar
  QuickChecklist
  QuickGift
  QuickShop
  QuickStampAlbum
  TokyoPostcard
)

python3 - "$SOURCE_DIR" "$WORK_DIR/assets.zip" "$WORK_DIR/extracted" <<'PY'
import base64
from pathlib import Path
import sys
import zipfile

source_dir = Path(sys.argv[1])
archive = Path(sys.argv[2])
output = Path(sys.argv[3])
parts = sorted(source_dir.glob('GeneratedAssetsHQ.zip.b64.part*'))
if not parts:
    raise SystemExit('No high-quality generated asset bundle parts were found')

chunks = []
for part in parts:
    chunk = ''.join(part.read_text(encoding='utf-8').split())
    print(f'{part.name}: {len(chunk)} base64 chars')
    chunks.append(chunk)
text = ''.join(chunks)
expected_chars = 180_644
print(f'Combined bundle length: {len(text)} base64 chars')
if len(text) != expected_chars:
    raise SystemExit(f'Unexpected bundle length: expected {expected_chars}, got {len(text)}')

raw = base64.b64decode(text, validate=True)
if not raw.startswith(b'PK'):
    raise SystemExit('Generated asset bundle is not a ZIP archive')
archive.write_bytes(raw)
output.mkdir(parents=True, exist_ok=True)
with zipfile.ZipFile(archive) as bundle:
    names = sorted(bundle.namelist())
    print('ZIP members: ' + ', '.join(names))
    bundle.extractall(output)
print(f'Decoded high-quality generated asset bundle: {len(raw)} bytes')
PY

rm -rf "$CATALOG"
mkdir -p "$CATALOG"
cat > "$CATALOG/Contents.json" <<'JSON'
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON

normalize_arguments=()
for asset in "${ASSETS[@]}"; do
  input="$WORK_DIR/extracted/${asset}.png"
  setdir="$CATALOG/${asset}.imageset"
  output="$setdir/${asset}.png"
  test -s "$input"
  mkdir -p "$setdir"
  normalize_arguments+=("$input" "$output")
  cat > "$setdir/Contents.json" <<JSON
{
  "images" : [
    {
      "filename" : "${asset}.png",
      "idiom" : "universal",
      "scale" : "1x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON
done

xcrun swift "$ROOT/Scripts/NormalizePNG.swift" "${normalize_arguments[@]}"
for asset in "${ASSETS[@]}"; do
  test -s "$CATALOG/${asset}.imageset/${asset}.png"
done

echo "Materialized ${#ASSETS[@]} high-quality generated image assets in $CATALOG"
