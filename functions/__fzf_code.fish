function __fzf_code
    set -l query (commandline)

    if test -n query
        set fzf_flags -q "$query"
    end

    ghq list | fzf $fzf_flags | read line

    if [ $line ]
        ghq root | read dir
        code "$dir/$line"
        commandline -f repaint
    end
end
