function fish_prompt
  set -g __fish_prompt_char »

  set -l last_status $status
  set -l normal (set_color normal)
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l bpurple (set_color -o purple)
  set -l bred (set_color -o red)
  set -l bcyan (set_color -o cyan)
  set -l bwhite (set_color -o white)

  set -g __fish_git_prompt_show_informative_status true
  set -g __fish_git_prompt_show_color_hints true

  set -l pcolor $bpurple
  if [ $last_status -ne 0 ]
    set pcolor $bred
  end

  echo -n $cyan$USER$normal in $bred(prompt_pwd)$normal
  __fish_git_prompt

  echo

  echo -n $pcolor$__fish_prompt_char $normal
end
