function __sk_go_src
    set -l query (commandline)

    ghq list | sk $lure_skim_default_option -q $query | perl -pe 'chomp if eof' | read line

    if [ $line ]
        ghq root | read dir
        cd "$dir/$line"
        commandline -f repaint
    end
end
