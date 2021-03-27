#!/bin/bash

WORD=$2
FILE=$1

REGEX="$(./print_hiragana_hash.sh)${WORD::-1}$(./print_verb_conjugations.sh)" # Use this for verbs
#REGEX="$(./print_hiragana_hash.sh)$WORD$(./print_hiragana_hash.sh)" # use this for single-kanji words
#REGEX="$WORD" # use this for normal words
FOUND=$(grep -En -m 1 "$REGEX" $FILE)

if [[ ! -z "$FOUND" ]] ; then
  grep -En --color "$REGEX" $FILE
fi
