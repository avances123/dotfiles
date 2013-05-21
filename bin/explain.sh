#!/usr/bin/env bash
explain="$( cat - )"
 
google-chrome "$( curl --silent --include --data-urlencode "plan=$explain" http://explain.depesz.com/ | perl -ne 'print if s/\ALocation:\s*(\S+)\s*\z/$1/' )"
