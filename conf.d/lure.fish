function _lure_set_default -S -a var default
    if not set -q $var
        set -g $var $default
    end
end

# Prompt Colors
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
_lure_set_default lure_color_current_time $lure_color_success

_lure_set_default lure_symbol_node_version "⬢"
_lure_set_default lure_color_node_version $lure_color_success

_lure_set_default lure_symbol_rust_version 𝗥
_lure_set_default lure_color_rust_version $lure_color_warning

# Command Colors
set --global fish_color_normal brwhite
# set --global fish_color_autosuggestion brblack
# set --global fish_color_cancel         brcyan
set --global fish_color_command brblue
set --global fish_color_comment brblack
# set --global fish_color_cwd            brred
# set --global fish_color_end            brwhite
set --global fish_color_error brred
# set --global fish_color_escape         brcyan
# set --global fish_color_host           brgreen
# set --global fish_color_host_remote    bryellow
# set --global fish_color_match          brcyan --underline
set --global fish_color_operator brcyan
set --global fish_color_param brgreen
set --global fish_color_quote bryellow
set --global fish_color_redirection brcyan
# set --global fish_color_search_match   --background=brblack
# set --global fish_color_selection      --background=brblack
# set --global fish_color_user           brblue

set --global fish_pager_color_progress brcyan --reverse
# set --global fish_pager_color_background
set --global fish_pager_color_prefix brwhite --underline
set --global fish_pager_color_completion brwhite
set --global fish_pager_color_description bryellow
# set --global fish_pager_color_secondary_background  # null
# set --global fish_pager_color_secondary_completion  brblack
# set --global fish_pager_color_secondary_description brblack
# set --global fish_pager_color_secondary_prefix      brblack
# set --global fish_pager_color_selected_background   --background=brblack
# set --global fish_pager_color_selected_completion   bryellow
# set --global fish_pager_color_selected_description  bryellow
# set --global fish_pager_color_selected_prefix brblack

# Global variables
set --global lure_skim_default_option --tiebreak=index --inline-info
set --global _lure_fresh_session true

# Key Bindings
bind \ct __sk_go_src
bind \cg __sk_code
bind \cr __sk_history
