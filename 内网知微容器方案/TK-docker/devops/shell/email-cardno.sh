#!/bin/sh
cd $1
startTime="$2"
endTime="$3"
git log $5 --since="${startTime}" --until="${endTime}" --grep="\#[0-9]\{1,\}" --oneline --author=$4 
