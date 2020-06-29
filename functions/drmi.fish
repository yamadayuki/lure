function drmi
    if type docker >/dev/null 2<&1
        docker rmi -f (docker images -aq)
    else
        echo "docker command not installed"
    end
end
