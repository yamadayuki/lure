set -l name the-postgres
set -l image postgres:9.6.1-alpine

echo $name
echo $image

function pg
    set -l cmd $argv[1]

    switch "$cmd"
        case start stop destroy psql createdb status logs
            echo "not implemented $cmd"
        case '*'
            __pg_help
    end
end
