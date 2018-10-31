function __pg_stop
    set -l name $argv[1]

    echo "==> Stopping server"
    docker stop $name
end
