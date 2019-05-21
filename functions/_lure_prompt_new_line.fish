function _lure_prompt_new_line \
    --on-event fish_prompt

    set --local new_line
    if test $_lure_fresh_session = false
        set new_line "\n"
    end

    echo -e -n "$new_line"
end
