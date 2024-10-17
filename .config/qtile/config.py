# Qtile config done by vmk; @vmkxyz on github and gitlab
# made for Wayland, some stuff might be broken on X11
# WARNING: Qtile doesn't support the ext-session-lock-v1 protocol meaning screenlockers can not work properly

# TODO:
# locked keys,
# make m&s layout work correctly and fix its binds,
# custom layout lables,
# responsive mic icon in sb
# other fixes (search for TODO)

# Imports
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile import bar, layout, qtile, widget, hook
from libqtile.backend.wayland import InputConfig
from libqtile.lazy import lazy
import subprocess
import iwlib
import os

# Autostart
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

# Vars, commands
mod = "mod4"
alt = "mod1"

terminal = "foot"
browser = "firefox"
cb = "sh -c 'cliphist list | rofi -dmenu | cliphist decode | wl-copy'"
areascr = "sh -c 'filename=$HOME/Pictures/grim/$(date +%F_%T).png && slurp | grim -g - $filename && wl-copy -t image/png < $filename'"
fullscr = "sh -c 'filename=$HOME/Pictures/grim/$(date +%F_%T).png && grim $filename && wl-copy -t image/png < $filename'"

# Binds
keys = [
    Key([mod],              "Return",   lazy.spawn(terminal),               desc="Launch terminal"),
    Key([mod],              "v",        lazy.spawn(browser),                desc="Launch web browser"),
    Key([mod],              "p",        lazy.spawn("rofi -show drun"),      desc="Launch rofi"),
    Key([mod, alt],         "p",        lazy.spawn("wmenu-run"),            desc="Launch wmenu"),
    Key([mod, "Control"],   "p",        lazy.spawncmd(),                    desc="Spawn a command using a prompt widget"),
    Key([mod, "Shift"],     "v",        lazy.spawn(cb),                     desc="Open clipboard manager"),
    Key([],                 "Print",    lazy.spawn(areascr),                desc="Take area acreenshot"),
    Key([alt],              "Print",    lazy.spawn(fullscr),                desc="Take fullscreen screenshot"),

	Key([],             "XF86AudioRaiseVolume",		lazy.spawn("amixer sset Master 5%+"),		desc="Raise master volume by 5%"),
	Key([],             "XF86AudioLowerVolume",		lazy.spawn("amixer sset Master 5%-"),		desc="Lower master volume by 5%"),
	Key(["Shift"],      "XF86AudioRaiseVolume",     lazy.spawn("amixer sset Master 1%+"),		desc="Raise master volume by 1%"),
	Key(["Shift"],      "XF86AudioLowerVolume",	    lazy.spawn("amixer sset Master 1%-"),		desc="Lower master volume by 1%"),
	Key([],             "XF86AudioMute",			lazy.spawn("amixer sset Master toggle"),	desc="Toggle mute for master volume"),

	Key([alt],          "XF86AudioRaiseVolume",		lazy.spawn("amixer sset Capture 5%+"),  	desc="Raise microphone volume by 5%"),
	Key([alt],          "XF86AudioLowerVolume",		lazy.spawn("amixer sset Capture 5%-"),	    desc="Lower microphone volume by 5%"),
	Key([alt, "Shift"], "XF86AudioRaiseVolume",	    lazy.spawn("amixer sset Capture 1%+"),	    desc="Raise microphone volume by 1%"),
	Key([alt, "Shift"], "XF86AudioLowerVolume",	    lazy.spawn("amixer sset Capture 1%-"),	    desc="Lower microphone volume by 1%"),
	Key([],             "XF86AudioMicMute",			lazy.spawn("amixer sset Capture toggle"),	desc="Toggle mute for microphone"),

	Key([],             "XF86AudioPlay",	        lazy.spawn("playerctl play-pause"),		    desc="Play or pause media playback"),
	Key([],             "XF86AudioNext",            lazy.spawn("playerctl next"),			    desc="Play the next media track"),
	Key([],             "XF86AudioPrev",		    lazy.spawn("playerctl previous"),		    desc="Play the previous media track"),
	Key([],             "Cancel",				    lazy.spawn("playerctl play-pause"),		    desc="Play or pause media playback"),
	Key([],             "XF86Favourites",		    lazy.spawn("playerctl next"),			    desc="Play the next media track"),
	Key([],             "XF86Go",				    lazy.spawn("playerctl previous"),		    desc="Play the previous media track"),

	Key([],             "XF86MonBrightnessUp",		lazy.spawn("brightnessctl s +10%"),	        desc="Increase screen brightness by 10%"),
	Key([],             "XF86MonBrightnessDown",	lazy.spawn("brightnessctl s 10%-"),	        desc="Decrease screen brightness by 10%"),
	Key(["Shift"],      "XF86MonBrightnessUp",	    lazy.spawn("brightnessctl s +1%"),          desc="Increase screen brightness by 1%"),
	Key(["Shift"],      "XF86MonBrightnessDown",	lazy.spawn("brightnessctl s 1%-"),	        desc="Decrease screen brightness by 1%"),

    Key([mod, "Shift"],     "t",        lazy.shutdown(),                    desc="Shutdown Qtile"),
    Key([mod],              "F12",      lazy.spawn("systemctl poweroff"),   desc="Shutdown device"),
    Key([mod],              "F11",      lazy.spawn("systemctl reboot"),     desc="Reboot device"),
    Key([mod],              "F10",      lazy.spawn("systemctl suspend"),    desc="Suspend device"),
    Key([mod],              "F9",       lazy.spawn("hyprlock"),             desc="Execute Hyprlock"),

    Key([mod],              "n",        lazy.layout.normalize(),            desc="Reset all window sizes"),
    Key([mod, "shift"],     "Return",   lazy.layout.toggle_split(),         desc="Toggle between split and unsplit sides of stack"),
    Key([mod],              "Tab",      lazy.next_layout(),                 desc="Toggle between layouts"),
    Key([mod],              "x",        lazy.window.kill(),                 desc="Kill focused window"),
    Key([mod],              "f",        lazy.window.toggle_fullscreen(),    desc="Toggle fullscreen on the focused window"),
    Key([mod],              "t",        lazy.window.toggle_floating(),      desc="Toggle floating on the focused window"),
    Key([mod, "control"],   "r",        lazy.reload_config(),               desc="Reload the config"),

    Key([mod],              "h",        lazy.layout.left(),                 desc="Move focus to left"),
    Key([mod],              "l",        lazy.layout.right(),                desc="Move focus to right"),
    Key([mod],              "j",        lazy.layout.down(),                 desc="Move focus down"),
    Key([mod],              "k",        lazy.layout.up(),                   desc="Move focus up"),

    Key([mod],              "space",    lazy.layout.next(),                 desc="Move window focus to other window"),
    Key([mod, "shift"],     "h",        lazy.layout.shuffle_left(),         desc="Move window to the left"),
    Key([mod, "shift"],     "l",        lazy.layout.shuffle_right(),        desc="Move window to the right"),
    Key([mod, "shift"],     "j",        lazy.layout.shuffle_down(),         desc="Move window down"),

    Key([mod, "shift"],     "k",        lazy.layout.shuffle_up(),           desc="Move window up"),
    Key([mod, "control"],   "h",        lazy.layout.grow_left(),            desc="Grow window to the left"),
    Key([mod, "control"],   "l",        lazy.layout.grow_right(),           desc="Grow window to the right"),
    Key([mod, "control"],   "j",        lazy.layout.grow_down(),            desc="Grow window down"),
    Key([mod, "control"],   "k",        lazy.layout.grow_up(),              desc="Grow window up"),
]

# Add key bindings to switch VTs in Wayland.
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# Input (wayland)
# broken, TODO: fix
wl_input_rules = {
    "type:keyboard": InputConfig(
		kb_repeat_delay=300,
		kb_repeat_rate=50
	),
}

# Workspaces (groups)
groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

# Layouts
layouts = [
    layout.MonadTall(border_focus="#fab387", border_normal="#1e1e2e", border_width=2, ratio=0.55, margin=4, single_margin=0), # master and slave
    layout.Max(border_focus="#fab387", border_normal="#1e1e2e", border_width=2, only_focused=False), # monocle
]

# Status bar (widgets), screens
# Wlan widget is broken, TODO: fix
widget_defaults = dict(
    font="Saucecodepronf",
    foreground="#cdd6f4",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(highlight_method="block", this_current_screen_border="#1e1e2e", this_screen_border="#1e1e2e", active="#cdd6f4"),
                widget.CurrentLayout(),
                widget.WindowName(background="#1e1e2e"),
                widget.Volume(unmute_format="|   {volume}%", mute_format="|  "),
                widget.ThermalSensor(format="|  {temp:.0f}{unit}"),
                widget.Wlan(format="|   {percent:2.0%}"),
                widget.Battery(format="|   {percent:2.0%}"),
                widget.Clock(format="|  %F   %T"),
            ],
            18,
            background="#11111b"
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# else: input switches, rules, floating etc.
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
