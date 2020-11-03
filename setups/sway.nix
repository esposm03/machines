{ pkgs, config, ... }:

{
  xdg.configFile."sway/config".text =
    ''
      ### Variables
      set $mod Mod4
      set $term "alacritty"
      set $kb_layout "it"
      set $menu "rofi -show run"

      set $left h
      set $down j
      set $up k
      set $right l

      input * xkb_layout $kb_layout
      default_border pixel 5
      gaps inner 10
      gaps outer 10

      ### Colors configuration
      # class                 border  backgr. text    indicator child_border
      client.focused    #e6b450  #0a0e14  #b3b1ad  #4d5566    #e6b450

      ### Idle configuration
      exec swayidle -w \
         timeout 300 'swaylock -f -c 000000' \
         timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
         before-sleep 'swaylock -f -c 000000'

      ### Key bindings
      #
      # Basics:
      #
          # Start a terminal
          bindsym $mod+Return exec $term

          # Kill focused window
          bindsym $mod+Shift+q kill

          # Start your launcher
          bindsym $mod+d exec $menu

          # Drag floating windows by holding down $mod and left mouse button.
          floating_modifier $mod normal

          # Reload the configuration file
          bindsym $mod+Shift+c reload

          # Exit sway (logs you out of your Wayland session)
          bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'
      #
      # Moving around:
      #
          # Move your focus around
          bindsym $mod+$left focus left
          bindsym $mod+$down focus down
          bindsym $mod+$up focus up
          bindsym $mod+$right focus right

          # Move the focused window around
          bindsym $mod+Shift+$left move left
          bindsym $mod+Shift+$down move down
          bindsym $mod+Shift+$up move up
          bindsym $mod+Shift+$right move right
      #
      # Workspaces:
      #
          # Switch to workspace
          bindsym $mod+1 workspace number 1
          bindsym $mod+2 workspace number 2
          bindsym $mod+3 workspace number 3
          bindsym $mod+4 workspace number 4
          bindsym $mod+5 workspace number 5
          bindsym $mod+6 workspace number 6
          bindsym $mod+7 workspace number 7
          bindsym $mod+8 workspace number 8
          bindsym $mod+9 workspace number 9
          bindsym $mod+0 workspace number 10
          # Move focused container to workspace
          bindsym $mod+Shift+1 move container to workspace number 1
          bindsym $mod+Shift+2 move container to workspace number 2
          bindsym $mod+Shift+3 move container to workspace number 3
          bindsym $mod+Shift+4 move container to workspace number 4
          bindsym $mod+Shift+5 move container to workspace number 5
          bindsym $mod+Shift+6 move container to workspace number 6
          bindsym $mod+Shift+7 move container to workspace number 7
          bindsym $mod+Shift+8 move container to workspace number 8
          bindsym $mod+Shift+9 move container to workspace number 9
          bindsym $mod+Shift+0 move container to workspace number 10
      #
      # Layout stuff:
      #
          bindsym $mod+b splith
          bindsym $mod+v splitv

          # Switch the current container between different layout styles
          bindsym $mod+s layout stacking
          bindsym $mod+w layout tabbed
          bindsym $mod+e layout toggle split

          # Make the current focus fullscreen
          bindsym $mod+f fullscreen

          # Toggle the current focus between tiling and floating mode
          bindsym $mod+Shift+space floating toggle

          # Swap focus between the tiling area and the floating area
          bindsym $mod+space focus mode_toggle

          # Move focus to the parent container
          bindsym $mod+a focus parent
      #
      # Scratchpad:
      #
          # Sway has a "scratchpad", which is a bag of holding for windows.
          # You can send windows there and get them back later.

          # Move the currently focused window to the scratchpad
          bindsym $mod+Shift+minus move scratchpad

          # Show the next scratchpad window or hide the focused scratchpad window.
          # If there are multiple scratchpad windows, this command cycles through them.
          bindsym $mod+minus scratchpad show
      #
      # Resizing containers:
      #
          mode "resize" {
                    bindsym $left resize shrink width 10px
                    bindsym $down resize grow height 10px
                    bindsym $up resize shrink height 10px
                    bindsym $right resize grow width 10px

                    # Return to default mode
                    bindsym Return mode "default"
                    bindsym Escape mode "default"
              bindsym $mod+r mode "default"
                }
          bindsym $mod+r mode "resize"

      #
      # Status Bar:
      #
      # Read `man 5 sway-bar` for more information about this section.
      bar {
          position top

          # When the status_command prints a new line to stdout, swaybar updates.
          # The default just shows the current date and time.
          status_command while date +'%Y-%m-%d %l:%M:%S %p'; do sleep 1; done

          colors {
        statusline #ffffff
        background #323232
        inactive_workspace #32323200 #32323200 #5c5c5c
          }
      }
    '';
}
