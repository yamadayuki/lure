function __redis_stop \
    --argument-names name image

    echo "==> Stopping server"
    docker stop $name
end

function __redis_destroy \
    --argument-names name image

    echo "==> Destroying server"
    docker rm $name
end

function __redis_create \
    --argument-names name image

    echo "==> Creating server"
    docker run \
        -p 6379:6379 \
        --name $name \
        -v ~/docker/redis:/data \
        -d $image
end

function __redis_start \
    --argument-names name image

    echo "==> Starting server"
    docker start $name || __redis_create $name $image
end

function __redis_cli \
    --argument-names name image

    docker exec -it $name redis-cli
end

function __redis_logs \
    --argument-names name image

    docker logs -f $name
end

function __redis_help
    set -l commands start stop destroy cli logs help

    echo "redis <command>"
    echo
    echo "COMMANDS:"
    for c in $commands
        echo "  redis $c"
    end
end

function redis \
    --argument-names cmd

    set -l name the-redis
    set -l image redis:alpine

    switch "$cmd"
        case start
            __redis_start $name $image
        case stop
            __redis_stop $name $image
        case destroy
            __redis_destroy $name $image
        case cli
            __redis_cli $name $image
        case logs
            __redis_logs $name $image
        case help
            __redis_help
        case '*'
            echo "Undefined command: $cmd"
            __redis_help
    end
end
