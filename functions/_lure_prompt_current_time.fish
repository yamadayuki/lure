function _lure_prompt_current_time
    set --local current_time (date "+%Y/%m/%d %a %H:%M:%S %Z")
    echo "$lure_color_current_time$current_time"
end
