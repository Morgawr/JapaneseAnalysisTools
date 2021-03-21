#!/bin/bash

WORDS=$1
FILE=$2
LINECOUNT=$(wc -l $FILE | cut -d' ' -f1)

for WORD in $(cat $WORDS) ; do
  #WORD="黙る"
  #REGEX="${WORD::-1}$(./print_verb_conjugations.sh)" # Use this for verbs
  #REGEX="$(./print_hiragana_hash.sh)$WORD$(./print_hiragana_hash.sh)" # use this for single-kanji words
  REGEX="$WORD" # use this for normal words
  FOUND=$(grep -En -m 1 "$REGEX" $FILE)
  if [[ ! -z "$FOUND" ]] ; then
    LINES=$(echo $(grep -En "$REGEX" $FILE | cut -d':' -f1) | tr ' ' ',')
    echo "$LINES:$WORD"
  fi
done
