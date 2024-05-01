#!/usr/bin/env zsh

# Updated rendered manpage content in README.md.
#
# Requires GNU sed.

setopt errexit

# On MacOS you may have GNU sed as 'gsed' - if so, use it
if type gsed &> /dev/null; then
  sed_program="gsed"
else
  sed_program="sed"
fi

here=$0:A:h
root=$here:h

tmpfile=$(mktemp)
echo '\n```' >>$tmpfile
man $root/ets.1 | sed -r 's/.\x08//g' >>$tmpfile
echo '```\n' >>$tmpfile

$sed_program -i "/<!-- begin manpage -->/,/<!-- end manpage -->/ {
  /<!-- begin manpage -->/ {
    r $tmpfile
    n
  }
  /<!-- end manpage -->/!d
}" $root/README.md
