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
