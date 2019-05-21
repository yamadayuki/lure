function _lure_current_directory
    set --local current_directory (string replace $HOME '~' $PWD | string split -m 1 -r '/' | string replace -ar '(\.?[^/])[^/]*/' '$1/' | string join '/')
    echo "$lure_color_current_directory$current_directory"
end
