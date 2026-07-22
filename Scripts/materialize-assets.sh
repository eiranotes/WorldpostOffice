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
  encoded="$SOURCE/${asset}.png.b64"
  setdir="$CATALOG/${asset}.imageset"
  output="$setdir/${asset}.png"
  mkdir -p "$setdir"

  echo "Decoding ${asset} ($(wc -c < "$encoded" | tr -d ' ') chars)"
  python3 - "$encoded" "$output" <<'PY'
import base64
from pathlib import Path
import sys

source = Path(sys.argv[1])
target = Path(sys.argv[2])
text = ''.join(source.read_text(encoding='utf-8').split())
try:
    raw = base64.b64decode(text, validate=True)
except Exception as exc:
    raise SystemExit(f"Invalid Base64 in {source.name}: {exc}")
if not raw.startswith(b'\x89PNG\r\n\x1a\n'):
    raise SystemExit(f"Decoded file is not PNG: {source.name}, bytes={len(raw)}")
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
