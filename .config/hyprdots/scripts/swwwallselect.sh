#!/usr/bin/env sh

# set variables
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh
RofiConf="q/.config/rofi/config.rasi"

ctlLine=`grep '^1|' "$ThemeCtl"`
if [ `echo $ctlLine | wc -l` -ne "1" ] ; then
    echo "ERROR : $ThemeCtl Unable to fetch theme..."
    exit 1
fi

fullPath=$(echo "$ctlLine" | awk -F '|' '{print $NF}' | sed "s+~+$HOME+")
wallPath=$(dirname "$fullPath")
if [ ! -d "${wallPath}" ] && [ -d "q/.config/swww/${gtkTheme}" ] && [ ! -z "${gtkTheme}" ] ; then
    wallPath="q/.config/swww/${gtkTheme}"
fi


# launch rofi menu
currentWall=`basename $fullPath`
RofiSel=$( find "${wallPath}" -type f \( -iname "*.gif" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort | while read rfile
do
    echo -en "$rfile\x00icon\x1f${cacheDir}/${gtkTheme}/${rfile}\n"
done | rofi -dmenu -theme-str "${r_override}" -select "${currentWall}")


# apply wallpaper
if [ ! -z "${RofiSel}" ] ; then
    "${ScrDir}/swwwallpaper.sh" -s "${wallPath}/${RofiSel}"
    notify-send -a "t1" -i "${cacheDir}/${gtkTheme}/${RofiSel}" " ${RofiSel}"
fi

