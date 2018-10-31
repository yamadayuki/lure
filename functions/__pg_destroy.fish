function __pg_stop
    set -l name $argv[1]

    echo "==> Destroying server"
    docker rm $name
end
