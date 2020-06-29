function _lure_current_directory_internal
    echo (string replace $HOME '~' $PWD | string split -m 1 -r '/' | string replace -ar '(\.?[^/])[^/]*/' '$1/' | string join '/')
end
