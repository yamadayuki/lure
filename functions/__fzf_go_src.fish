function __fzf_go_src
  set -l query (commandline)

  if test -n query
    set fzf_flags -q "$query"
  end

  ghq list | fzf $fzf_flags | read line

  if [ $line ]
    ghq root | read dir
    cd "$dir/$line"
    commandline -f repaint
  end
end
