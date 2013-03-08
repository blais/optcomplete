# optcomplete harness for bash shell. You then need to tell
# bash to invoke this shell function with a command like
# this:
#
#   complete -F _optcomplete <your command>
#

_optcomplete()
{
    # needed to let it return _filedir based commands
    local cur prev quoted
    _get_comp_words_by_ref cur prev
    _quote_readline_by_ref "$cur" quoted
    _expand || return 0

    # call the command with the completion information, then eval it's results so it can call _filedir or similar
    # this does have the potential to be a security problem, especially if running as root, but we should trust
    # the completions as we're planning to run this script anyway
    eval $( \
            COMP_LINE=$COMP_LINE  COMP_POINT=$COMP_POINT \
            COMP_WORDS="${COMP_WORDS[*]}"  COMP_CWORD=$COMP_CWORD \
            OPTPARSE_AUTO_COMPLETE=1 $1
        )
}
