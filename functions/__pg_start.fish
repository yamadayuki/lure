function __pg_start
    set -l name $argv[1]
    set -l image $argv[2]

    echo "==> Starting server"
    docker start $NAME 2>/dev/null
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
