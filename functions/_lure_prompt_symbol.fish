function _lure_prompt_symbol \
    --argument-names exit_code

    set --local color_symbol $lure_color_prompt_on_success
    set --local command_succeed 0
    if test $exit_code -ne $command_succeed
        set color_symbol "$lure_color_prompt_on_error$lure_symbol_prompt$lure_color_prompt_on_success"
    end

    echo "$color_symbol$lure_symbol_prompt"
end
