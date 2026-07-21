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
  mkdir -p "$setdir"

  if base64 --decode "$encoded" > "$setdir/${asset}.png" 2>/dev/null; then
    :
  else
    base64 -D "$encoded" > "$setdir/${asset}.png"
  fi

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
