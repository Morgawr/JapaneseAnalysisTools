#!/bin/bash

WORDS=$1
FILE=$2

for WORD in $(cat $WORDS) ; do
  FOUND=$(grep -n -m 1 $WORD $FILE)
  if [[ ! -z "$FOUND" ]] ; then
    FIRST=$(echo $FOUND | cut -d':' -f1)
    FOUND=$(echo $FOUND | sed "s/$FIRST\://")
    echo "$FIRST:$WORD:$(echo $FOUND | xargs | sed 's/　//g')"
  fi
done
