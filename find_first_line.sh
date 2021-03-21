#!/bin/bash

WORD=$1
FILE=$2

REGEX="${WORD::-1}$(./print_verb_conjugations.sh)" # Use this for verbs
#REGEX="$(./print_hiragana_hash.sh)$WORD$(./print_hiragana_hash.sh)" # use this for single-kanji words
#REGEX="$WORD" # use this for normal words
FOUND=$(grep -n -m 1 $WORD $FILE)

if [[ ! -z "$FOUND" ]] ; then
  #LINES=$(echo $(grep -En "$REGEX" $FILE | cut -d':' -f1) | tr ' ' ',')
  grep -En --color "$REGEX" $FILE
  #echo "$LINES"
fi
