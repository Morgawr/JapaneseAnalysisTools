#!/bin/bash

WORDS=$1
FILE=$2
LINECOUNT=$(wc -l $FILE | cut -d' ' -f1)

for WORD in $(cat $WORDS) ; do
#WORD="終わ"
  FOUND=$(grep -n -m 1 $WORD $FILE)
  if [[ ! -z "$FOUND" ]] ; then
    #LINES=$(echo $(grep -En "$(./print_hiragana_hash.sh)$WORD$(./print_hiragana_hash.sh)" $FILE | cut -d':' -f1) | tr ' ' ',') # use this for single-kanji words
    #LINES=$(echo $(grep -En "${WORD::-1}$(./print_verb_conjugations.sh)" $FILE | cut -d':' -f1) | tr ' ' ',') # use this for verb words
    LINES=$(echo $(grep -n $WORD $FILE | cut -d':' -f1) | tr ' ' ',') # use this for normal words
    echo "$LINES:$WORD"
  fi
done
