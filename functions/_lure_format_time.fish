function _lure_format_time \
    --argument-names milliseconds

    if test $milliseconds -lt 0
        return 1
    end

    set --local seconds (math -s0 "$milliseconds / 1000 % 60")
    set --local minutes (math -s0 "$milliseconds / 60000 % 60")
    set --local hours (math -s0 "$milliseconds / 3600000 % 24")
    set --local days (math -s0 "$milliseconds / 86400000")
    set --local time

    if test $days -gt 0
        set time $time (printf "%sd" $days)
    end

    if test $hours -gt 0
        set time $time (printf "%sh" $hours)
    end

    if test $minutes -gt 0
        set time $time (printf "%sm" $minutes)
    end

    if test $seconds -gt 0
        set time $time (printf "%ss" $seconds)
    end

    set time $time (printf "%sms" (math -s0 "$milliseconds % 1000"))

    echo -e (string join ' ' $time)
end
