#!/bin/bash

get_icon() {
    case "$1" in
        firefox|firefox-esr)            echo $'\uf269'  ;;
        chromium|google-chrome)         echo $'\ue743'  ;;
        brave-browser)                  echo $'\uf07c'  ;;
        kitty)                          echo $'\ue795'  ;;
        alacritty)                      echo $'\ue795'  ;;
        foot)                           echo $'\ue795'  ;;
        wezterm)                        echo $'\ue795'  ;;
        code|code-oss|vscodium)         echo $'\ue70c'  ;;
        neovide|nvim)                   echo $'\ue62b'  ;;
        thunar|nautilus|dolphin|org.gnome.nautilus) echo $'\uf07b' ;;
        spotify)                        echo $'\uf1bc'  ;;
        mpv)                            echo $'\uf144'  ;;
        vlc)                            echo $'\uf144'  ;;
        discord)                        echo $'\ufb6e'  ;;
        telegram-desktop)               echo $'\uf2c6'  ;;
        steam)                          echo $'\uf1b6'  ;;
        gimp)                           echo $'\uf17d'  ;;
        obsidian)                       echo $'\uf036'  ;;
        *)                              echo $'\uf17c'  ;;
    esac
}

print_window() {
    data=$(hyprctl activewindow -j 2>/dev/null)
    title=$(echo "$data" | jq -r '.title // empty')
    class=$(echo "$data" | jq -r '.class // empty' | tr '[:upper:]' '[:lower:]')

    if [ -z "$title" ]; then
        echo '{"text": "", "class": "empty"}'
    else
        icon=$(get_icon "$class")
        jq -cn --arg text "$icon  $title" '{"text": $text}'
    fi
}

print_window

socat -u UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" - | \
while read -r line; do
    event="${line%%>>*}"
    case "$event" in
        activewindow|activewindowv2|closewindow|workspace)
            print_window
            ;;
    esac
done
