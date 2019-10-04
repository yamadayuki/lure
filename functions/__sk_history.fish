function __sk_history
    history merge
    history -z | sk --read0 $lure_skim_default_option | perl -pe 'chomp if eof' | read -lz result
    and commandline -- $result
    commandline -f repaint
end
