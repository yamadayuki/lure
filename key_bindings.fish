bind \ct '__fzf_go_src'
bind \cg '__fzf_code'
if bind -M insert >/dev/null ^/dev/null
    bind -M insert \ct '__fzf_go_src'
    bind -M insert \cg '__fzf_code'
end
