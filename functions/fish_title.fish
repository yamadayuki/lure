function fish_title
    set --local current_directory (string replace $HOME '~' $PWD | string split -m 1 -r '/' | string replace -ar '(\.?[^/])[^/]*/' '$1/' | string join '/')
    set --local current_command (status current-command 2>/dev/null; or echo $_)

    if test $current_command = fish
        echo (_lure_print_prompt $current_directory)
    else
        echo (_lure_print_prompt $current_command)
    end
end
