# mkrand

Simple but convenient script to create a bunch of random strings (which may also be used as passwords)

Usage: mkrand.sh OPTIONS
Options
  -c|--count        set number of random strings (default 1)
  -l|--length       set length of random strings (default 12)
  -s|--simple       use only alphanumeric chars ()
  -n|--normal       use easy symbols + alphanumeric chars ()
  -h|--hard         use symbols + alphanumeric ()
  --help            show usage

Examples:
  mkrand.sh -c 10 -l 14 -s
  mkrand.sh --count 10 --length 14 --simple
