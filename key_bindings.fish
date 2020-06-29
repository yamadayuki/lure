bind \ct '__sk_go_src'
bind \cg '__sk_code'
# bind \cw '__sk_browse_github'
bind \cr '__sk_history'
if bind -M insert >/dev/null ^/dev/null
    bind -M insert \ct '__sk_go_src'
    bind -M insert \cg '__sk_code'
    # bind -M insert \cw '__sk_browse_github'
    bind -M insert \cr '__sk_history'
end
