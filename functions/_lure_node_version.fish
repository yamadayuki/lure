function _lure_node_version
    set -l node_version (nodenv version-name 2>/dev/null)

    echo "$lure_color_node_version$lure_symbol_node_version $node_version"
end
