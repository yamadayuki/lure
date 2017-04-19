function ip -d "Display ip info. If you pass the ip, Display info about that ip."
  curl "ipinfo.io/$argv"
end
