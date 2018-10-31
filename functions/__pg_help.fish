#> postgres <command>
#>
#> COMMANDS:
#>     postgres start
#>     postgres stop
#>     postgres destroy
#>     postgres psql
#>     postgres createdb $dbname
#>     postgres status
#>     postgres logs

function __pg_help
    cat (string join '' (pwd) (status -f | string replace '.' '')) | grep '^#>' | sed -e 's/#> //g' -e 's/#>//g'
    exit 0
end
