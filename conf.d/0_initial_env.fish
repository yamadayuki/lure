# Setup for anyenv
set -x PATH $PATH $HOME/.anyenv/bin

if which anyenv >/dev/null >&1
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
