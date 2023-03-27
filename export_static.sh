#!/usr/bin/env bash
set -e

rm -rf outputs_static
mkdir -p outputs_static
mkdir -p outputs_static/sources
mkdir -p outputs_static/images

NUM_MAZES=200

ACC="./acc/acc"
if [ ! -f $ACC ]; then
	echo "File $ACC does not exist, compiling..."
	make -C ./acc
fi

for FILE in content2/*.acs; do
	$ACC -i ./acc $FILE "outputs_static/$(basename ${FILE%.*}).o"
done

for SIZE in $(seq -s ' ' 7 2 13); do
	PREFIX="./outputs_static/sources/$SIZE"
	python maze.py $PREFIX -r $SIZE -c $SIZE -n $NUM_MAZES
	python wad.py "${PREFIX}_TRAIN" "outputs_static/${SIZE}_TRAIN.wad" -b outputs_static/static_goal2_${SIZE}.o
	python wad.py "${PREFIX}_TEST" "outputs_static/${SIZE}_TEST.wad" -b outputs_static/static_goal_${SIZE}.o
done
echo "Success."
