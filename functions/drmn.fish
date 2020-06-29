function drmn
    if type docker >/dev/null 2<&1
        docker network rm (docker network ls -q)
    else
        echo "docker command not installed"
    end
end
