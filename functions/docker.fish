function drmc
    if type docker >/dev/null 2<&1
        docker rm -f (docker ps -aq)
    else
        echo "docker command not installed"
    end
end

function drmi
    if type docker >/dev/null 2<&1
        docker rmi -f (docker ps -aq)
    else
        echo "docker command not installed"
    end
end

function drmn
    if type docker >/dev/null 2<&1
        docker network rm (docker network ls -q)
    else
        echo "docker command not installed"
    end
end
