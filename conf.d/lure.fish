function _lure_set_default -S -a var default
    if not set -q $var
        set -g $var $default
    end
end

# Colors
_lure_set_default lure_color_primary (set_color blue)
_lure_set_default lure_color_info (set_color cyan)
_lure_set_default lure_color_mute (set_color brblack)
_lure_set_default lure_color_success (set_color green)
_lure_set_default lure_color_normal (set_color normal)
_lure_set_default lure_color_danger (set_color red)
_lure_set_default lure_color_light (set_color white)
_lure_set_default lure_color_warning (set_color yellow)
_lure_set_default lure_color_dark (set_color black)

_lure_set_default lure_symbol_prompt ">"
_lure_set_default lure_color_prompt_on_error $lure_color_danger
_lure_set_default lure_color_prompt_on_success $lure_color_success
_lure_set_default lure_color_current_directory $lure_color_primary

_lure_set_default lure_symbol_git_unpulled_commits "⇣"
_lure_set_default lure_symbol_git_unpushed_commits "⇡"
_lure_set_default lure_symbol_git_dirty "*"
_lure_set_default lure_color_git_unpulled_commits $lure_color_info
_lure_set_default lure_color_git_unpushed_commits $lure_color_info
_lure_set_default lure_color_git_branch $lure_color_mute
_lure_set_default lure_color_git_dirty $lure_color_mute

_lure_set_default lure_color_command_duration $lure_color_warning

set --global _lure_fresh_session true

functions -q _lure_prompt_newline

alias g=git
