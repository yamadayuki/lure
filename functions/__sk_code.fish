function __sk_code
    set -l query (commandline)

    ghq list | sk $lure_skim_default_option -q $query | perl -pe 'chomp if eof' | read line

    if [ $line ]
        ghq root | read dir
        code "$dir/$line"
    end

    commandline -f repaint
end
