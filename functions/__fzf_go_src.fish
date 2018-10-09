function __fzf_go_src
    set -l query (commandline)

    if test -n query
        set fzf_flags -q "$query"
    end

    ghq list | eval (__fzfcmd) --read0 --tiebreak=index --toggle-sort=ctrl-r $FZF_DEFAULT_OPTS $FZF_REVERSE_ISEARCH_OPTS -q '(commandline)' | perl -pe 'chomp if eof' | read line

    if [ $line ]
        ghq root | read dir
        cd "$dir/$line"
        commandline -f repaint
    end
end
