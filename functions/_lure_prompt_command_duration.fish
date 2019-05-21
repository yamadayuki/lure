function _lure_prompt_command_duration
    set --local command_duration

    if test -n "$CMD_DURATION"
        set command_duration (_lure_format_time $CMD_DURATION)
    end

    echo "$lure_color_command_duration$command_duration"
end
