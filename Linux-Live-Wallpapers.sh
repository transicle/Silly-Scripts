#
# * YOU MUST OWN WALLPAPER ENGINE TO BE ABLE TO USE THIS SCRIPT !! *
#
#   Run live wallpaper engine wallpapers on Linux environments, all powered by `linux-wallpaperengine`.
#
# - Install on Arch Linux: `yay -S linux-wallpaperengine-git`
# - Their Official GitHub: https://github.com/Almamu/linux-wallpaperengine
#

# Adjust the wallpapers and display options to your monitor settings!

WALLPAPER_LEFT="3524095060" # https://steamcommunity.com/sharedfiles/filedetails/?id=3524095060
DISPLAY_LEFT="DP-3"

WALLPAPER_RIGHT="3350475895" # https://steamcommunity.com/sharedfiles/filedetails/?id=3350475895
DISPLAY_RIGHT="HDMI-A-1"

#							   for 1920x1080
linux-wallpaperengine --screen-root ${DISPLAY_LEFT}  --scaling stretch   ${WALLPAPER_LEFT} &
linux-wallpaperengine --screen-root ${DISPLAY_RIGHT} --scaling stretch   ${WALLPAPER_RIGHT} &

wait
