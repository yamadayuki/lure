function __pg_ping
    set -l name $argv[1]

    docker exec -it $name psql --username=$USER -c 'select 1;' >/dev/null 2>&1
end
