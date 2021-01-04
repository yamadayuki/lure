function _lure_tmuxpopup
    set -l width '80%'
    set -l height '80%'
    set -l session (tmux display-message -p -F "#{session_name}")

    if contains "popup" $session
        tmux detach-client
    else
        tmux popup -d '#{pane_current_path}' \
            -xC \
            -yC \
            -w$width \
            -h$height \
            -KER "tmux attach -t popup || tmux new -s popup"
    end
end
