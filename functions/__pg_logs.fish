function __pg_logs
    set -l name $argv[1]

    docker logs -f $name
end
