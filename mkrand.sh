#!/bin/bash

PURPOSE="Simple but convenient script to create a bunch of random strings (which may also be used as passwords)"

# REFS:
# - https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/
# - https://unix.stackexchange.com/questions/230673/how-to-generate-a-random-string

function usage {
	mybasename=$(basename $0)
	echo "$PURPOSE

Usage: $mybasename OPTIONS
Options
  -c|--count        set number of random strings (default 1)
  -l|--length       set length of random strings (default 12)
  -s|--simple       use only alphanumeric chars ()
  -n|--normal       use easy symbols + alphanumeric chars ()
  -h|--hard         use symbols + alphanumeric ()
  --help            show usage

Examples:
  $mybasename -c 10 -l 14 -s
  $mybasename --count 10 --length 14 --simple
"
	exit 1
}

CHARSET_SIMPLE='A-Za-z0-9'
CHARSET_NORMAL='A-Za-z0-9.#+!$?_-'
CHARSET_HARD='A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~'
# CHARSET_XXX='A-Za-z0-9!#%()*+,.?_-'
# CHARSET_LEFT='12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' # Can be typed with only left hand

until (($#==0)); do
    case "$1" in
        -c|--count)            shift; RAND_COUNT=$1             ;;
        -l|--length)           shift; RAND_LENGHT=$1            ;;
        -s|--simple)           RAND_CHARSET=$CHARSET_SIMPLE     ;;
        -n|--normal)           RAND_CHARSET=$CHARSET_NORMAL     ;;
        -h|--hard)             RAND_CHARSET=$CHARSET_HARD       ;;
        --help|*)              usage                            ;;
    esac
    shift
done

: ${RAND_COUNT:=1}
: ${RAND_LENGHT:=12}
: ${RAND_CHARSET:=$CHARSET_NORMAL}

# RAND_STR=$(LC_ALL=C tr -dc $RAND_CHARSET </dev/urandom | head -c $RAND_LENGHT); echo $RAND_STR
LC_ALL=C tr -dc $RAND_CHARSET </dev/urandom | fold -w $RAND_LENGHT | head -n $RAND_COUNT
