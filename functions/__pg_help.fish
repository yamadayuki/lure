function __pg_help
    set -l commands start stop destroy psql "createdb [dbname]" status logs help

    echo "pg <command>"
    echo
    echo "COMMANDS:"
    for c in $commands
        echo "  pg $c"
    end
end
