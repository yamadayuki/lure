function __kb_help
    set -l clusters sandbox qa prod
    set -l commands po

    echo "kb <cluster> <command>"
    echo
    echo "CLUSTERS:"
    for c in $clusters
        echo "  kb $c <command>"
    end
    echo
    echo "COMMANDS:"
    for c in $commands
        echo "  kb <cluster> $c"
    end
end


function kb
    set -l cluster $argv[1]
    set -l cmd $argv[2]

    switch "$cmd"
        case po
            kube $cluster get po \
                | sk $lure_skim_default_option \
                | perl -pe 'chomp if eof' \
                | awk '{ print $1 }' \
                | read line

            echo $line
        case '*'
            echo "Undefined command: $cmd"
            __kb_help
    end
end
