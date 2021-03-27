#!/bin/bash

WORDS=$1
FILE=$2

for WORD in $(cat $WORDS) ; do
  LINES=$(echo $(./find_first_line.sh $FILE $WORD | cut -d':' -f1) | tr ' ' ',')
  echo "$LINES:$WORD"
done
