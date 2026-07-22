#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE="$ROOT/AssetSources"
CATALOG="$ROOT/WorldPostOfficeHome/Assets.xcassets"
PACK="$SOURCE/generated-home-assets.json"

python3 - "$SOURCE" "$PACK" "$CATALOG" <<'PY'
import base64
import json
from pathlib import Path
import shutil
import sys

source = Path(sys.argv[1])
pack = Path(sys.argv[2])
catalog = Path(sys.argv[3])
parts = sorted(source.glob("generated-home-assets.json.part*"))
if not parts:
    raise SystemExit("Generated home asset pack parts are missing")
text = "".join(part.read_text(encoding="utf-8") for part in parts)
data = json.loads(text)
expected = {
    "ProfileCatAvatar", "HeroScene", "PlantPolaroid", "EnergyStamp",
    "BunnyAvatar", "HeartEnvelope", "TokyoPostcard", "QuickChecklist",
    "QuickStampAlbum", "QuickGift", "QuickShop"
}
missing = expected.difference(data)
if missing:
    raise SystemExit(f"Missing generated assets: {sorted(missing)}")
if catalog.exists():
    shutil.rmtree(catalog)
catalog.mkdir(parents=True)
(catalog / "Contents.json").write_text(
    json.dumps({"info": {"author": "xcode", "version": 1}}, indent=2),
    encoding="utf-8",
)
for name in sorted(expected):
    raw = base64.b64decode(data[name], validate=True)
    if not raw.startswith(b"\x89PNG\r\n\x1a\n"):
        raise SystemExit(f"Decoded asset is not PNG: {name}")
    image_set = catalog / f"{name}.imageset"
    image_set.mkdir()
    png = image_set / f"{name}.png"
    png.write_bytes(raw)
    (image_set / "Contents.json").write_text(
        json.dumps({
            "images": [{"filename": png.name, "idiom": "universal", "scale": "1x"}],
            "info": {"author": "xcode", "version": 1},
        }, indent=2),
        encoding="utf-8",
    )
    print(f"Materialized {name}: {len(raw)} bytes")
print(f"Materialized {len(expected)} generated assets in {catalog}")
PY
