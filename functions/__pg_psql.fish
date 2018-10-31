function __pg_psql
    set -l name $argv[1]

    docker exec -it $name psql --username=$USER
end
