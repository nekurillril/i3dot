[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xrandr -s 1920x1080 &
exec i3
