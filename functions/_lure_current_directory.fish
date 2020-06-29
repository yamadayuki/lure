function _lure_current_directory
    set --local current_directory (_lure_current_directory_internal)
    echo "$lure_color_current_directory$current_directory"
end
