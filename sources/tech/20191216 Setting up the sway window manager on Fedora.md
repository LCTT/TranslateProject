[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Setting up the sway window manager on Fedora)
[#]: via: (https://fedoramagazine.org/setting-up-the-sway-window-manager-on-fedora/)
[#]: author: (George Luiz Maluf https://fedoramagazine.org/author/georgelmaluf/)

Setting up the sway window manager on Fedora
======

![][1]

Sometimes during a critical activity, working with overlapping windows becomes counterproductive. You might find a tiled window manager like sway to be a good alternative.

Sway is a tiling Wayland compositor. It has the advantage of compatibility with an existing [i3 configuration][2], so you can use it to replace i3 and use Wayland as the display protocol.

### Installing sway

To setup sway, open a new terminal and type the following command

```
sudo dnf install sway
```

Once the installation is completed, log out of your user session. At the login screen, select your user account. Before you enter your password, choose _Sway_ from the menu, as shown in the following image.

![][3]

After login, your desktop looks like this:

![][4]

### Configuration

To begin configuration, copy the default config into your user directory. Do that using the following commands.

```
mkdir -p .config/sway
cp /etc/sway/config ~/.config/sway/
```

Sway is highly configurable. It’s suggested you read the project’s [wiki page][5] to fine tune your settings. For example, to change the keyboard layout, open a new terminal and run this command:

```
$ swaymsg -t get_inputs
[george@mrwhite ~]$ swaymsg -t get_inputs
 Input device: VirtualPS/2 VMware VMMouse
   Type: Mouse
   Identifier: 2:19:VirtualPS/2_VMware_VMMouse
   Product ID: 19
   Vendor ID: 2
   Libinput Send Events: enabled
 Input device: VirtualPS/2 VMware VMMouse
   Type: Mouse
   Identifier: 2:19:VirtualPS/2_VMware_VMMouse
   Product ID: 19
   Vendor ID: 2
   Libinput Send Events: enabled
 Input device: AT Translated Set 2 keyboard
   Type: Keyboard
   Identifier: 1:1:AT_Translated_Set_2_keyboard
   Product ID: 1
   Vendor ID: 1
   Active Keyboard Layout: Portuguese (Brazil)
   Libinput Send Events: enabled
```

Copy the identifier keyboard code. Open your _~/.config/sway/config file_ with your text editor and edit the configuration accordingly:

```
## Input configuration
input "1:1:AT_Translated_Set_2_keyboard" {
  xkb_layout br
}
```

Save the settings. To reload the configurations, press **Super+Shift+c**. (Typically the **Super** key is mapped to the logo key on a PC.)

### Waybar

Sway’s default status bar may not have all the functions you want. Fortunately Waybar is a good replacement. To install, run the follow commands. _(Note, however, that COPR is not an official Fedora repository and not supported by the Fedora Project.)_

```
sudo dnf copr enable alebastr/waybar
sudo dnf install waybar
```

Open your _~/.config/sway/config_ file. Edit the bar configuration like this:

```
bar {
  swaybar_command waybar
}
```

Reload the configuration and you’ll now see the waybar in action, as shown below.

![][6]

To customize the waybar, you can visit this [wiki page][7] for more details and ideas.

### Alacritty

Alacritty is a terminal emulator that uses the GPU for rendering, and a good replacement for _urxvt_. To install run the following lines

```
sudo dnf copr enable pschyska/alacritty
sudo dnf install alacritty
```

To enable it as default terminal emulator edit your _~/.config/sway/config_. Change this line:

```
set $term urxvt256c-ml
```

To:

```
set $term alacritty
```

Reload your configuration.

When you open a new terminal with **Super+C**, alacritty will be open as seen in the following image:

![][8]

* * *

_Photo by [Ivan Vranić][9] on [Unsplash][10]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/setting-up-the-sway-window-manager-on-fedora/

作者：[George Luiz Maluf][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/georgelmaluf/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/12/sway-816x345.jpg
[2]: https://fedoramagazine.org/getting-started-i3-window-manager/
[3]: https://fedoramagazine.org/wp-content/uploads/2019/11/sway_login_menu-1024x522.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/11/sway_desktop_default-1024x522.png
[5]: https://github.com/swaywm/sway/wiki
[6]: https://fedoramagazine.org/wp-content/uploads/2019/11/sway_waybar_default-1024x522.png
[7]: https://github.com/Alexays/Waybar/wiki/Configuration
[8]: https://fedoramagazine.org/wp-content/uploads/2019/11/sway_alacritty-1024x522.png
[9]: https://unsplash.com/@hvranic?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[10]: https://unsplash.com/s/photos/sway?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
