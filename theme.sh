#!/usr/local/bin/zsh

tm_icon="TMUX"
tm_color_background=colour0
tm_color_active=colour30
tm_color_inactive=colour241
tm_color_feature=colour24
tm_color_music=colour106

# separators
tm_left_separator=''
tm_left_separator_black=''
tm_right_separator=''
tm_right_separator_black=''
tm_session_symbol=''

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5


# default statusbar colors
# set-option -g status-bg colour0
set-option -g status-fg $tm_color_active
set-option -g status-bg colour0
set-option -g status-attr default
set-option -g status-position bottom

# default window title colors
set-window-option -g window-status-fg colour12
set-window-option -g window-status-bg default
set -g window-status-format "#I #W"

# active window title colors
set-window-option -g  window-status-current-format "#[fg=$tm_color_background,bg=$tm_color_active]$tm_left_separator_black #[fg=colour7,bg=$tm_color_active,bold]#I #W #[bg=$tm_color_background,fg=$tm_color_active,nobold]$tm_left_separator_black"
# pane border
set-option -g pane-border-fg $tm_color_inactive
set-option -g pane-active-border-fg $tm_color_active

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

cpu_icon=''
tm_spotify="#[fg=$tm_color_music,bg=$tm_color_background]#(osascript ~/.tmux/scripts/spotify.scpt)"

cpu_color=colour167
tm_cpu="#[bg=default,fg=$cpu_color]$tm_right_separator_black#[bg=$cpu_color,fg=colour7] CPU #(istats cpu temperature --no-graphs --no-labels | python ~/.tmux/scripts/trim.py) #[fg=$tm_color_background,bg=$cpu_color]$tm_right_separator_black"

battery_icon=''
# tm_battery="#[fg=colour10,nobold]#{battery_status_bg} #{battery_icon} #{battery_percentage} #{battery_remain} | %a %h/%d %H:%M "
battery_color=colour65
battery="#[bg=default,fg=$battery_color]$tm_right_separator_black#[bg=$battery_color,fg=colour7] #(pmset -g batt | ruby ~/.tmux/scripts/battery.rb) #[fg=$tm_color_background,bg=$battery_color]$tm_right_separator_black"

time_color=colour67
tm_time="#[bg=default,fg=$time_color]$tm_right_separator_black#[bg=$time_color,fg=colour7]%h/%d(%a) %H:%M #[fg=$tm_color_background,bg=$time_color]$tm_right_separator_black"
# tm_todo_n="#(osascript ~/.tmux/scripts/reminder_count.scpt)"
# tm_todo_bg="#(~/.tmux/scripts/todo_with_color.sh)"

# tm_todo="#[bg=$tm_color_background,fg=$tm_todo_bg]$tm_right_separator_black#[bg=$tm_todo_bg,fg=colour7,bold] $tm_todo_n TODOs "
# tm_host="#[bg=$tm_color_background,fg=$tm_color_feature]$tm_right_separator_black#[bg=$tm_color_feature,fg=colour7,bold]#h $tm_todos"
#
tm_session_name="#[bg=$tm_color_feature,fg=colour7,bold] #S #[fg=$tm_color_feature,bg=default,nobold]$tm_left_separator_black "

lc_color=colour137
tm_lc="#[bg=default,fg=$lc_color]$tm_right_separator_black#[bg=$lc_color,fg=colour7]  #(python ~/.tmux/scripts/lc.py) #[fg=$tm_color_background,bg=$lc_color]$tm_right_separator_black"


set -g status-left $tm_session_name
set -g status-right "$tm_spotify  $tm_lc$tm_cpu$battery$tm_time"
# set -g status-right " $tm_cpu $battery$tm_time"

