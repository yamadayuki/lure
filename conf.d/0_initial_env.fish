# Setup for anyenv
set -x PATH $PATH $HOME/.anyenv/bin

if [ which anyenv ]
  # Setup *env managed by anyenv
  set -l envs (anyenv envs)
  for e in $envs
    set -l upper (echo $e | tr a-z A-Z)
    set -l root (anyenv root)/envs/$e

    set -x "$upper"_ROOT $root
    set -x "$upper"_SHELL fish
    set -x PATH $PATH $root/bin
  end
end

if [ which goenv ]
  # Setup Go using goenv
  set -x GOPATH $HOME/dev
  set -x PATH $PATH $GOENV_ROOT/bin $GOPATH/bin
end
