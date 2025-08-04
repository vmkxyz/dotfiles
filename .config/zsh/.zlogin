[ "$(tty)" = "/dev/tty1" ] && start-dwl
[ "$(tty)" = "/dev/tty2" ] && startx

# to safly lauch processes in new subshells if they're not running already and suppress output
safe_run() {
	for r in "$@"; do
		if ! pgrep -xf "$(basename $r)" > /dev/null 2>&1; then
			/usr/bin/env sh -c "$r" >/dev/null 2>&1 &
		fi
	done
}
safe_run \
	"pipewire" \
	"pipewire-pulse" \
	"wireplumber" \
	"mpd" \
	"syncthing serve --no-browser"
	"otd-daemon"
