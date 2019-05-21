function fish_prompt
    set -l previous_status $status

    echo -e -n (_lure_prompt_beginning)
    echo -e (_lure_prompt_first_line)
    echo -e -n (_lure_prompt_symbol $previous_status)
    echo -e (_lure_prompt_ending)

    set _lure_fresh_session false
end
