function is_m1
    set -l architecture (arch)

    switch $architecture
        case "arm64"
            return 0
        case "*"
            return 1
    end
end
