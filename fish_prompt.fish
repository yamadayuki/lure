function _lure_prompt_beginning
    set --local clear_line "\r\033[K"
    echo $clear_line
end

function _lure_print_prompt
    set --local prompt

    for part in $argv
        if test (string replace -ar '\e\[[^m]*m' '' $part | string length) -gt 0
            set prompt "$prompt $part"
        end
    end

    echo (string trim -l $prompt)
end

function _lure_current_directory
    set --local current_directory (string replace $HOME '~' $PWD | string split -m 1 -r '/' | string replace -ar '(\.?[^/])[^/]*/' '$1/' | string join '/')
    echo "$lure_color_current_directory$current_directory"
end

function _lure_prompt_git
    set --local is_git_repository (command git rev-parse --is-inside-work-tree 2>/dev/null)
    if test -n "$is_git_repository"
        set --local git_branch (command git symbolic-ref --short HEAD 2>/dev/null; or echo (command git show-ref --head -s --abbrev HEAD)[1])
        set --local git_branch_color "$lure_color_git_branch"
        set --local git_dirty_symbol
        set --local git_dirty_color
        set --local is_git_dirty (command git status --porcelain --ignore-submodules 2>/dev/null)
        if test -n "$is_git_dirty"
            set git_dirty_symbol "$lure_symbol_git_dirty"
            set git_dirty_color "$lure_color_git_dirty"
        end
        set --local git_prompt "$git_branch_color$git_branch$git_dirty_color$git_dirty_symbol"

        set --local git_unpushed_commits
        set --local git_unpulled_commits
        set --local has_upstream (command git rev-parse --abbrev-ref '@{upstream}' 2>/dev/null)
        if test -n "$has_upstream"
            command git rev-list --left-right --count 'HEAD...@{upstream}' | read --local --array git_status
            set --local commit_to_push $git_status[1]
            set --local commit_to_pull $git_status[2]
            if test $commit_to_push -gt 0
                set git_unpushed_commits "$lure_color_git_unpushed_commits$lure_symbol_git_unpushed_commits"
            end
            if test $commit_to_pull -gt 0
                set git_unpulled_commits "$lure_color_git_unpulled_commits$lure_symbol_git_unpulled_commits"
            end
        end
        set --loca git_pending_commits "$git_unpushed_commits$git_unpulled_commits"

        if test (string replace -ar '\e\[[^m]*m' '' $git_pending_commits | string length) -ne 0
            set git_prompt $git_prompt $git_pending_commits
        end

        echo $git_prompt
    end
end

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


function _lure_prompt_command_duration
    set --local command_duration

    if test -n "$CMD_DURATION"
        set command_duration (_lure_format_time $CMD_DURATION)
    end

    echo "$lure_color_command_duration$command_duration"
end

function _lure_prompt_first_line
    echo (_lure_print_prompt (_lure_current_directory) (_lure_prompt_git) (_lure_prompt_command_duration))
end

function _lure_prompt_symbol \
    --argument-names exit_code

    set --local color_symbol $lure_color_prompt_on_success
    set --local command_succeed 0
    if test $exit_code -ne $command_succeed
        set color_symbol "$lure_color_prompt_on_error$lure_symbol_prompt$lure_color_prompt_on_success"
    end

    echo "$color_symbol$lure_symbol_prompt"
end

function _lure_prompt_ending
    echo "$lure_color_normal "
end

function _lure_prompt_new_line \
    --on-event fish_prompt

    set --local new_line
    if test $_lure_fresh_session = false
        set new_line "\n"
    end

    echo -e -n "$new_line"
end

function fish_prompt
    set -l previous_status $status

    echo -e -n (_lure_prompt_beginning)
    echo -e (_lure_prompt_first_line)
    echo -e -n (_lure_prompt_symbol $previous_status)
    echo -e (_lure_prompt_ending)

    set _lure_fresh_session false
end
