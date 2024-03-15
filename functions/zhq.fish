function zhq
    ghq list | fzf --height 40% --layout reverse --ansi --tiebreak index --info inline | perl -pe 'chomp if eof' | read line

    if [ $line ]
        ghq root | read dir
        cd "$dir/$line"
    end

    commandline -f repaint
end
