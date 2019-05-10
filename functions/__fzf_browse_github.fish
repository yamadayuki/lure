function __fzf_browse_github -d "Browse remote repository on github"
    set -l query (commandline)

    if test -n query
        set fzf_flags -q "$query"
    end

    ghq list | eval (__fzfcmd) --tiebreak=index --toggle-sort=ctrl-r $FZF_DEFAULT_OPTS $FZF_REVERSE_ISEARCH_OPTS -q '(commandline)' | perl -pe 'chomp if eof' | read line

    if [ $line ]
        set -l repo_name (string split -m1 "/" $line)[2]
        hub browse $repo_name
        commandline -f repaint
    end
end
