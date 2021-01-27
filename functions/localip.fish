function localip
    ifconfig en0 | rg inet | rg -v inet6 | sd "inet ([0-9]{1,3}.[0-9]{1,3}.[0-9].{1,3}.[0-9]{1,3}) .*" '$1' | sd '\s+' ''
end
