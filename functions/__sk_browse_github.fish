function __sk_browse_github -d "Browse remote repository on github"
    set -l query (commandline)

    ghq list | sk $lure_skim_default_option -q $query | perl -pe 'chomp if eof' | read line

    if [ $line ]
        set -l repo_name (string split -m1 "/" $line)[2]
        hub browse $repo_name
        commandline -f repaint
    end
end
