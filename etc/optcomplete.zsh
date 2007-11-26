#!/bin/sh
# optcomplete harness for zsh shell. You then need to tell 
# zsh to invoke this shell function with a command like 
# this::
#
#   compctl -K _optcomplete <program>
#
# Submitted by: Chris Lesniewski-Laas (MIT).
#

function _optcomplete {
  local line point words cword
  read -l line
  read -ln point
  read -Ac words
  read -cn cword
  reply=( $( COMP_LINE="$line" COMP_POINT=$(( point-1 )) \
             COMP_WORDS="$words[*]" COMP_CWORD=$(( cword-1 )) \
             OPTPARSE_AUTO_COMPLETE=1 python $words[1] ) )
}

