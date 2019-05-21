function _lure_print_prompt
    set --local prompt

    for part in $argv
        if test (string replace -ar '\e\[[^m]*m' '' $part | string length) -gt 0
            set prompt "$prompt $part"
        end
    end

    echo (string trim -l $prompt)
end
