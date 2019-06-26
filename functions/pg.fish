function __pg_createdb
    set -l name $argv[1]
    set -l image $argv[2]

    docker exec -it $name createdb --username=$USER "$image"
end

function __pg_stop
    set -l name $argv[1]

    echo "==> Destroying server"
    docker rm $name
end

function __pg_help
    set -l commands start stop destroy psql "createdb dbname" status logs help

    echo "pg <command>"
    echo
    echo "COMMANDS:"
    for c in $commands
        echo "  pg $c"
    end
end

function __pg_logs
    set -l name $argv[1]

    docker logs -f $name
end

function __pg_ping
    set -l name $argv[1]

    docker exec -it $name psql --username=$USER -c 'select 1;' >/dev/null 2>&1
end

function __pg_psql
    set -l name $argv[1]

    docker exec -it $name psql --username=$USER
end

function __pg_server_create
    set -l name $argv[1]
    set -l image $argv[2]

    echo "==> Creating server"
    docker run \
        -p 5432:5432 \
        --name $name \
        -e POSTGRES_USER=$USER \
        -e POSTGRES_PASSWORD= \
        -v ~/docker/postgres:/var/lib/postgresql/data \
        -d $image
end

function __pg_start
    set -l name $argv[1]
    set -l image $argv[2]

    echo "==> Starting server"
    docker start $name 2>/dev/null
    or __pg_server_create $name $image

    echo "==> Waiting for ready"
    while true
        sleep 5
        if __pg_ping $name
            echo
            echo "ready"
            break
        else
            printf '.'
        end
    end
end

function __pg_status
    set -l name $argv[1]
    if docker ps | grep $name >/dev/null
        __pg_ping $name
        and echo 'ready'
        or echo 'not ready'
    else
        echo 'not running'
    end
end

function __pg_stop
    set -l name $argv[1]

    echo "==> Stopping server"
    docker stop $name
end

function pg
    set -l name the-postgres
    set -l image postgres:9.6.1-alpine
    set -l cmd $argv[1]

    switch "$cmd"
        case start
            __pg_start $name $image
        case stop
            __pg_stop $name $image
        case destroy
            __pg_destroy $name $image
        case psql
            __pg_psql $name $image
        case createdb
            __pg_createdb $name $image
        case status
            __pg_status $name $image
        case logs
            __pg_logs $name $image
        case help
            __pg_help
        case '*'
            echo "Undefined command: $cmd"
            __pg_help
    end
end
