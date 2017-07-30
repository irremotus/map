#!/bin/bash

##########################################
# Set MAP_FOLDER and FASTQ_FOLDER in env #
##########################################

if [ -z "$MAP_FOLDER" ]; then
	echo "Need MAP_FOLDER"
	exit 1
fi
if [ -z "$FASTQ_FOLDER" ]; then
	echo "Need FASTQ_FOLDER"
	exit 1
fi


rm ${MAP_FOLDER}/*_new_map.txt
for f in $(ls ${MAP_FOLDER}/*_map.txt); do
	F=$(basename $f); awk -v DIR=${FASTQ_FOLDER}/Group_${F%%_*}_fastq -f script.awk $f > ${MAP_FOLDER}/${F%_map.txt}_new_map.txt
done
