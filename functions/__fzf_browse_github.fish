function __fzf_browse_github -d "Browse remote repository on github"
    set -l query (commandline)

    if test -n query
        set fzf_flags -q "$query"
    end

    ghq list | fzf $fzf_flags | read line

    if [ $line ]
        set -l repo_name (string split -m1 "/" $line)[2]
        hub browse $repo_name
        commandline -f repaint
    end
end
