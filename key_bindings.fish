bind \ct '__fzf_go_src'
bind \cg '__fzf_code'
bind \cw '__fzf_browse_github'
if bind -M insert >/dev/null ^/dev/null
    bind -M insert \ct '__fzf_go_src'
    bind -M insert \cg '__fzf_code'
    bind -M insert \cw '__fzf_browse_github'
end
