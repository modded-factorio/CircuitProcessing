#!/bin/bash
FACTORIO=~/factorio18

mkdir -p graphics/icons
mkdir -p graphics/technology

convert -background transparent $FACTORIO/data/base/graphics/icons/processing-unit.png -extent 64x64 \
    \( -clone 0 -modulate 30,0 \) \
    \( -clone 0 -fill "#AAAAAA" -colorize 100 \) \
    \( -clone 0 -colorspace HSL -channel Hue -separate +colorspace +channel \) \
    \( -clone 2,3 -channel R -separate -compose difference -composite -negate -level 50%,100% \) -delete 2,3 \
    \( -clone 0,1,2 -compose src-over -composite \) -delete 1,2 \
    +swap -compose copy-opacity -composite \
    \( +clone -scale '50%' \) \
    \( +clone -scale '50%' \) \
    \( +clone -scale '50%' \) \
    +append graphics/icons/advanced-processing-unit.png

convert -background transparent \
  $FACTORIO/data/base/graphics/icons/electronic-circuit.png \
  $FACTORIO/data/base/graphics/icons/advanced-circuit.png \
  $FACTORIO/data/base/graphics/icons/processing-unit.png \
  graphics/icons/advanced-processing-unit.png -extent 64x64 \
  \( -clone 0,1 +append \) -delete 0,1 \
  \( -clone 0,1 +append \) -delete 0,1 \
  -append -gravity center -extent 144x144 thumbnail.png

declare -A hueshift
hueshift["speed-module"]="60,50,98"
hueshift["effectivity-module"]="50,40,98"
hueshift["productivity-module"]="70,50,78"
declare -A techfill
techfill["speed-module"]="16,54"
techfill["effectivity-module"]="50,69"
techfill["productivity-module"]="25,56"
declare -A techroll
techroll["speed-module"]="-9-3"
techroll["effectivity-module"]="-11-3"
techroll["productivity-module"]="-10-3"

for f in speed-module effectivity-module productivity-module; do
  convert -background transparent $FACTORIO/data/base/graphics/icons/$f.png -extent 64x64 \
    \( -clone 0 -modulate ${hueshift[$f]} \) \
    \( module-lamp.png -blur 1 \) \
    -compose src-over -composite \
    \( -clone 0 -scale '50%' \) \
    \( -clone 1 -scale '50%' \) \
    \( -clone 2 -scale '50%' \) \
    +append graphics/icons/$f-0.png

  convert $FACTORIO/data/base/graphics/technology/$f-1.png \
    \( -clone 0 -roll ${techroll[$f]} \) \
    \( -clone 0 -channel Saturation -separate \
      \( +clone -fill black -fuzz '15%' -draw "color ${techfill[$f]} floodfill" \) \
      -compose difference -composite -blur 1 -level 1%,1% \
    \) \
    -compose src-over -composite graphics/technology/$f-0.png

  for l in "-0" "" "-2" "-3"; do
    infile=$FACTORIO/data/base/graphics/icons/$f$l.png
    if [ "$l" == "-0" ];  then
      infile=graphics/icons/$f$l.png
    fi
    convert -background transparent module-mask.png -alpha copy $infile \
      -extent 64x64 -compose multiply -channel RGB -composite \
      -distort SRT 28\
      \( -clone 0 -scale '50%' \) \
      \( -clone 1 -scale '50%' \) \
      \( -clone 2 -scale '50%' \) \
      +append graphics/icons/$f$l-harness.png
  done
done

mkdir -p graphics/beacon
convert $FACTORIO/data/base/graphics/entity/beacon/hr-beacon-module-lights-1.png \
  -crop 56x42 -clone 0 -insert 0 +append graphics/beacon/hr-beacon-module-lights-1.png
convert $FACTORIO/data/base/graphics/entity/beacon/hr-beacon-module-lights-2.png \
  -crop 66x46 -clone 0 -insert 0 +append graphics/beacon/hr-beacon-module-lights-2.png
convert $FACTORIO/data/base/graphics/entity/beacon/hr-beacon-module-mask-box-1.png \
  -crop 36x32 -clone 0 -insert 0 +append graphics/beacon/hr-beacon-module-mask-box-1.png
convert $FACTORIO/data/base/graphics/entity/beacon/hr-beacon-module-mask-box-2.png \
  -crop 36x26 -clone 0 -insert 0 +append graphics/beacon/hr-beacon-module-mask-box-2.png
convert $FACTORIO/data/base/graphics/entity/beacon/hr-beacon-module-mask-lights-1.png \
  -crop 26x12 +repage \( \
    -clone 0 -crop 8x12 +repage -delete 0 \( -clone 0 -roll +0+2 \) \
    -insert 0 +append \) \
  -insert 0 +append graphics/beacon/hr-beacon-module-mask-lights-1.png
convert $FACTORIO/data/base/graphics/entity/beacon/hr-beacon-module-mask-lights-2.png \
  -crop 24x14 +repage \( \
    -clone 0 -crop 8x14 +repage -delete 0 \( -clone 0 -roll +0-3 \) \
    -insert 0 +append \) \
  -insert 0 +append graphics/beacon/hr-beacon-module-mask-lights-2.png
magick $FACTORIO/data/base/graphics/entity/beacon/hr-beacon-module-slot-1.png \
  -crop 50x66 \( -clone 1 \) -insert 1 +append \
  \( -clone 0 -roll -7+2 \) \
  \( -clone 0 -fill "#00000000" -colorize 100 -fill "#FFFFFFFF" \
    -draw 'polygon 59,36 59,28 66,27 66,35' -channel R -separate +channel \) \
  -composite graphics/beacon/hr-beacon-module-slot-1.png
magick $FACTORIO/data/base/graphics/entity/beacon/hr-beacon-module-slot-2.png \
  -crop 46x44 \( -clone 1 \) -insert 1 +append \
  \( -clone 0 -roll -8-3 \) \
  \( -clone 0 -fill "#00000000" -colorize 100 -fill "#FFFFFFFF" \
    -draw 'polygon 64,9 71,9 71,16 64,13' -channel R -separate +channel \) \
  -composite graphics/beacon/hr-beacon-module-slot-2.png

convert $FACTORIO/data/base/graphics/entity/beacon/beacon-module-lights-1.png \
  -crop 28x22 -clone 0 -insert 0 +append graphics/beacon/beacon-module-lights-1.png
convert $FACTORIO/data/base/graphics/entity/beacon/beacon-module-lights-2.png \
  -crop 34x24 -clone 0 -insert 0 +append graphics/beacon/beacon-module-lights-2.png
convert $FACTORIO/data/base/graphics/entity/beacon/beacon-module-mask-box-1.png \
  -crop 18x16 -clone 0 -insert 0 +append graphics/beacon/beacon-module-mask-box-1.png
convert $FACTORIO/data/base/graphics/entity/beacon/beacon-module-mask-box-2.png \
  -crop 18x14 -clone 0 -insert 0 +append graphics/beacon/beacon-module-mask-box-2.png
convert $FACTORIO/data/base/graphics/entity/beacon/beacon-module-mask-lights-1.png \
  -crop 14x6 +repage \( \
    -clone 0 -crop 4x6 +repage -delete 0 \( -clone 0 -roll +0+1 \) \
    -insert 0 +append \) \
  -insert 0 +append graphics/beacon/beacon-module-mask-lights-1.png
convert $FACTORIO/data/base/graphics/entity/beacon/beacon-module-mask-lights-2.png \
  -crop 12x8 +repage \( \
    -clone 0 -crop 4x8 +repage -delete 0 \( -clone 0 -roll +0-2 \) \
    -insert 0 +append \) \
  -insert 0 +append graphics/beacon/beacon-module-mask-lights-2.png
magick $FACTORIO/data/base/graphics/entity/beacon/beacon-module-slot-1.png \
  -crop 26x34 \( -clone 1 \) -insert 1 +append \
  \( -clone 0 -roll -4+1 \) \
  \( -clone 0 -fill "#00000000" -colorize 100 -fill "#FFFFFFFF" \
    -draw 'polygon 30,18 30,14 33,13 33,17' -channel R -separate +channel \) \
  -composite graphics/beacon/beacon-module-slot-1.png
magick $FACTORIO/data/base/graphics/entity/beacon/beacon-module-slot-2.png \
  -crop 24x22 \( -clone 1 \) -insert 1 +append \
  \( -clone 0 -roll -4-2 \) \
  \( -clone 0 -fill "#00000000" -colorize 100 -fill "#FFFFFFFF" \
    -draw 'polygon 32,4 35,4 35,8 32,6' -channel R -separate +channel \) \
  -composite graphics/beacon/beacon-module-slot-2.png

locales=$(cd $FACTORIO/data/base/locale; echo *)
for locale in $locales; do
  mkdir -p locale/$locale
  echo "[item-name]" > locale/$locale/CircuitProcessing.cfg
  grep 'electronic-circuit=\|advanced-circuit=\|processing-unit=' $FACTORIO/data/base/locale/$locale/* | sed -e 's/^/cp-/' >> locale/$locale/CircuitProcessing.cfg
  if [ -f locale.in/$locale/item-names.cfg ]; then
    cat locale.in/$locale/item-names.cfg >> locale/$locale/CircuitProcessing.cfg
  fi
  if [ -f locale.in/$locale/settings.cfg ]; then
    cat locale.in/$locale/settings.cfg >> locale/$locale/CircuitProcessing.cfg
  fi
done
