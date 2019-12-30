function __mongo_stop \
    --argument-names name image

    echo "==> Stopping server"
    docker stop $name
end

function __mongo_destroy \
    --argument-names name image

    echo "==> Destroying server"
    docker rm $name
end

function __mongo_create \
    --argument-names name image

    echo "==> Creating server"
    docker run \
        -p 27017:27017 \
        --name $name \
        -v ~/docker/mongo:/data \
        -d $image
end

function __mongo_start \
    --argument-names name image

    echo "==> Starting server"
    docker start $name || __mongo_create $name $image
end

function __mongo_cli \
    --argument-names name image

    docker exec -it $name mongo
end

function __mongo_logs \
    --argument-names name image

    docker logs -f $name
end

function __mongo_help
    set -l commands start stop destroy cli logs help

    echo "mongo <command>"
    echo
    echo "COMMANDS:"
    for c in $commands
        echo "  mongo $c"
    end
end

function mongo \
    --argument-names cmd

    set -l name the-mongo
    set -l image mongo:4.2.2-bionic

    switch "$cmd"
        case start
            __mongo_start $name $image
        case stop
            __mongo_stop $name $image
        case destroy
            __mongo_destroy $name $image
        case cli
            __mongo_cli $name $image
        case logs
            __mongo_logs $name $image
        case help
            __mongo_help
        case '*'
            echo "Undefined command: $cmd"
            __mongo_help
    end
end
