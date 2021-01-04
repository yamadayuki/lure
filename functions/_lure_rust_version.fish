function _lure_rust_version
    set -l rust_version (rustc --version | string split ' ')[2]

    echo "$lure_color_rust_version$lure_symbol_rust_version $rust_version"
end
