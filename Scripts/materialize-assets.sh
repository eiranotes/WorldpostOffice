#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE="$ROOT/AssetSources"
CATALOG="$ROOT/WorldPostOfficeHome/Assets.xcassets"

mkdir -p "$CATALOG"
cat > "$CATALOG/Contents.json" <<'JSON'
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON

for asset in HeartEnvelope MascotPostman PlantPolaroid ProfileCatAvatar TokyoPostcard TravelerRabbitAvatar; do
  setdir="$CATALOG/${asset}.imageset"
  output="$setdir/${asset}.png"
  mkdir -p "$setdir"

  python3 - "$SOURCE" "$asset" "$output" <<'PY'
import base64
from pathlib import Path
import sys

source_dir = Path(sys.argv[1])
asset = sys.argv[2]
target = Path(sys.argv[3])
parts = sorted(source_dir.glob(f"{asset}.png.b64.part*"))
if parts:
    text = ''.join(part.read_text(encoding='utf-8') for part in parts)
    label = '+'.join(part.name for part in parts)
else:
    source = source_dir / f"{asset}.png.b64"
    text = source.read_text(encoding='utf-8')
    label = source.name
text = ''.join(text.split())
print(f"Decoding {asset} from {label} ({len(text)} chars)")
try:
    raw = base64.b64decode(text, validate=True)
except Exception as exc:
    raise SystemExit(f"Invalid Base64 for {asset}: {exc}")
if not raw.startswith(b'\x89PNG\r\n\x1a\n'):
    raise SystemExit(f"Decoded file is not PNG: {asset}, bytes={len(raw)}")
target.write_bytes(raw)
print(f"Wrote {target.name}: {len(raw)} bytes")
PY

  cat > "$setdir/Contents.json" <<JSON
{
  "images" : [
    {
      "filename" : "${asset}.png",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON

done

echo "Materialized generated PNG assets in $CATALOG"
