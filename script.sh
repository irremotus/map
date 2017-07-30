#!/bin/bash

MAP_FOLDER="path of the map files"
FASTQ_FOLDER="path of the fastq files"


for f in $(ls ${MAP_FOLDER}/*_map.txt); do
	F=$(basename $f); awk -v DIR=${FASTQ_FOLDER}/Group_${F%%_*}_fastq -f script.awk $f > ${f}.new
done
