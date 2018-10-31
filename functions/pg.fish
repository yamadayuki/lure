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
        case '*'
            __pg_help
    end
end
