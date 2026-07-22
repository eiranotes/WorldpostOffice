#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE="$ROOT/AssetSources"
CATALOG="$ROOT/WorldPostOfficeHome/Assets.xcassets"
RAW_DIR="$(mktemp -d)"
trap 'rm -rf "$RAW_DIR"' EXIT

ASSETS=(
  HeartEnvelope
  MascotPostman
  PlantPolaroid
  ProfileCatAvatar
  TokyoPostcard
  TravelerRabbitAvatar
)

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
  setdir="$CATALOG/${asset}.imageset"
  raw_output="$RAW_DIR/${asset}.png"
  normalized_output="$setdir/${asset}.png"
  mkdir -p "$setdir"

  python3 - "$SOURCE" "$asset" "$raw_output" <<'PY'
import base64
from pathlib import Path
import sys

source_dir = Path(sys.argv[1])
asset = sys.argv[2]
target = Path(sys.argv[3])
parts = sorted(source_dir.glob(f"{asset}.png.b64.part*"))
if parts:
    text = "".join(part.read_text(encoding="utf-8") for part in parts)
    label = "+".join(part.name for part in parts)
else:
    source = source_dir / f"{asset}.png.b64"
    if not source.exists():
        raise SystemExit(f"Missing generated asset source: {source}")
    text = source.read_text(encoding="utf-8")
    label = source.name
text = "".join(text.split())
raw = base64.b64decode(text, validate=True)
if not raw.startswith(b"\x89PNG\r\n\x1a\n"):
    raise SystemExit(f"Decoded file is not PNG: {asset}")
target.write_bytes(raw)
print(f"Decoded {asset} from {label}: {len(raw)} bytes")
PY

  normalize_arguments+=("$raw_output" "$normalized_output")
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

echo "Materialized ${#ASSETS[@]} generated image assets in $CATALOG"
