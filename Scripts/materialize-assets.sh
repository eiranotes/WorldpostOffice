#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE_DIR="$ROOT/DesignAssets/Generated/App"
CATALOG="$ROOT/WorldPostOfficeHome/Assets.xcassets"
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

for asset in "${ASSETS[@]}"; do
  test -s "$SOURCE_DIR/${asset}.png" || {
    echo "Missing actual image asset: $SOURCE_DIR/${asset}.png" >&2
    exit 1
  }
done

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

for asset in "${ASSETS[@]}"; do
  setdir="$CATALOG/${asset}.imageset"
  mkdir -p "$setdir"
  cp "$SOURCE_DIR/${asset}.png" "$setdir/${asset}.png"
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

echo "Materialized ${#ASSETS[@]} actual PNG assets in $CATALOG"
