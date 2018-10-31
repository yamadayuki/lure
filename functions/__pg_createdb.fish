function __pg_createdb
    set -l name $argv[1]
    set -l image $argv[2]

    docker exec -it $name createdb --username=$USER "$image"
end
