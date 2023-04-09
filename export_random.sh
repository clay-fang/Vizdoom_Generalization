#!/usr/bin/env bash
set -e

rm -rf outputs_random
mkdir -p outputs_random
mkdir -p outputs_random/sources
mkdir -p outputs_random/images

NUM_MAZES=100

ACC="./acc/acc"
if [ ! -f $ACC ]; then
	echo "File $ACC does not exist, compiling..."
	make -C ./acc
fi

for FILE in content/*.acs; do
	$ACC -i ./acc $FILE "outputs_random/$(basename ${FILE%.*}).o"
done

for SIZE in $(seq -s ' ' 9 2 13); do
	PREFIX="./outputs_random/sources/$SIZE"
	python maze.py $PREFIX -r $SIZE -c $SIZE -n $NUM_MAZES
	python wad.py "${PREFIX}_TRAIN" "outputs_random/${SIZE}_TRAIN.wad" -b outputs_random/static_goal2.o
	python wad.py "${PREFIX}_TEST" "outputs_random/${SIZE}_TEST.wad" -b outputs_random/static_goal.o
done
echo "Success."
