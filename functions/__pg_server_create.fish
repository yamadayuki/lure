function __pg_server_create
    set -l name $argv[1]
    set -l image $argv[2]

    echo "==> Creating server"
    docker run -p 5432:5432 --name $name -e POSTGRES_USER=$USER -e POSTGRES_PASSWORD= -v ~/docker/postgres:/var/lib/postgresql/data -d $image
end
