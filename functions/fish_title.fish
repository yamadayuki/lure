function fish_title
    set --local is_git_repository (command git rev-parse --is-inside-work-tree 2>/dev/null)
    set --local current_directory (string replace $HOME '~' $PWD | string split -m 1 -r '/' | string replace -ar '(\.?[^/])[^/]*/' '$1/' | string join '/')
    set --local git_branch
    if test -n "$is_git_repository"
        set git_branch (command git symbolic-ref --short HEAD 2>/dev/null; or echo (command git show-ref --head -s --abbrev HEAD)[1])
    end
    set --local current_command (status current-command 2>/dev/null; or echo $_)

    echo (_lure_print_prompt $current_directory $git_branch $current_command)
end
