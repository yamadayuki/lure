function mtog
    ffmpeg -i $argv[1] -vf scale=800:-1 -vf eq=brightness=0.05 -r 10 -f image2pipe -vcodec ppm - | convert -delay 5 -layers Optimize -loop 0 - $argv[2]
end
