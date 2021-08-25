function __lure_z_directories
    zoxide query -l | string replace -r '(.*/([^/]+))' '$2\t$1'
end

complete -f -c z -a '(__lure_z_directories)'
