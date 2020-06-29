function drmc
    if type docker >/dev/null 2<&1
        docker rm -f (docker ps -aq)
    else
        echo "docker command not installed"
    end
end
