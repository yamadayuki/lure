function wttr -d "Display weather"
    set -l region (ip | jq -r .region)
    curl "wttr.in/$region"
end
