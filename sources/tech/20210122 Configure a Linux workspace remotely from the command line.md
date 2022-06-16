[#]: collector: (lujun9972)
[#]: translator: (Donke-Hao)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Configure a Linux workspace remotely from the command line)
[#]: via: (https://opensource.com/article/21/1/remote-configuration-xfce4)
[#]: author: (David Both https://opensource.com/users/dboth)

Configure a Linux workspace remotely from the command line
======
Nearly everything can be done from the Linux command line, including
remote configuration of Xfce4.
![Coding on a computer][1]

One of the things I appreciate about Linux versus proprietary operating systems is that almost everything can be managed and configured from the command line. That means that nearly everything can be configured locally or even remotely via an SSH login connection. Sometimes it takes a bit of time spent on Internet searches, but if you can think of a task, it can probably be done from the command line.

### The problem

Sometimes it is necessary to make remote modifications to a desktop using the command line. In this particular case, I needed to reduce the number of workspaces on the [Xfce][2] panel from four to three at the request of a remote user. This configuration only required about 20 minutes of searching on the Internet.

The default workspace count and many other settings for **xfwm4** can be found and changed in the **/usr/share/xfwm4/defaults** file. So setting _workspace_count=4_ to _workspace_count=2_ changes the default for all users on the host. Also, the **xfconf-query** command can be run by non-root users to query and set various attributes for the **xfwm4** window manager. It should be used by the user account that requires the change and not by root.

In the sample below, I have first verified the current setting of _four_ workspaces, then set the number to _two_, and finally confirmed the new setting.


```
[user@test1 ~]# xfconf-query -c xfwm4 -p /general/workspace_count
4
[user@test1 ~]# xfconf-query -c xfwm4 -p /general/workspace_count -s 2
[user@test1 ~]# xfconf-query -c xfwm4 -p /general/workspace_count
2
[user@test1 ~]#
```

This change takes place immediately and is visible to the user without a reboot or even logging out and back in. I had a bit of fun with this on my workstation by watching the workspace switcher change as I entered commands to set different numbers of workspaces. I get my amusements where I can these days. ;-)

### More exploration

Now that I fixed the problem, I decided to explore the **xfconf-query** command in a bit more detail. Unfortunately, there are no man or info pages for this tool, nor is there any documentation in **/usr/share**. The usual fallback of using the **-h** option resulted in little helpful information.


```
$ xfconf-query -h
 Usage:
   xfconf-query [OPTION…] - Xfconf commandline utility
 Help Options:
   -h, --help            Show help options
 Application Options:
   -V, --version         Version information
   -c, --channel         The channel to query/modify
   -p, --property        The property to query/modify
   -s, --set             The new value to set for the property
   -l, --list            List properties (or channels if -c is not specified)
   -v, --verbose         Verbose output
   -n, --create          Create a new property if it does not already exist
   -t, --type            Specify the property value type
   -r, --reset           Reset property
   -R, --recursive       Recursive (use with -r)
   -a, --force-array     Force array even if only one element
   -T, --toggle          Invert an existing boolean property
   -m, --monitor         Monitor a channel for property changes
```

This is not a lot of help, but we can figure out a good bit from it anyway. First, _channels_ are groupings of properties that can be modified. I made the change above to the **general** channel, and the property is **workspace_count**. Let’s look at the complete list of channels.


```
$ xfconf-query -l
Channels:
  xfwm4
  xfce4-keyboard-shortcuts
  xfce4-notifyd
  xsettings
  xfdashboard
  thunar
  parole
  xfce4-panel
  xfce4-appfinder
  xfce4-settings-editor
  xfce4-power-manager
  xfce4-session
  keyboards
  displays
  keyboard-layout
  ristretto
  xfcethemer
  xfce4-desktop
  pointers
  xfce4-settings-manager
  xfce4-mixer
```

The properties for a given channel can also be viewed using the following syntax. I have used the **less** pager because the result is a long stream of data. I have pruned the listing below but left enough to see the type of entries you can expect to find.


```
$ xfconf-query -c xfwm4 -l | less
/general/activate_action
/general/borderless_maximize
/general/box_move
/general/box_resize
/general/button_layout
/general/button_offset
&lt;SNIP&gt;
/general/workspace_count
/general/workspace_names
/general/wrap_cycle
/general/wrap_layout
/general/wrap_resistance
/general/wrap_windows
/general/wrap_workspaces
/general/zoom_desktop
(END)
```

You can explore all the channels in this manner. I discovered that the channels generally correspond to the various settings in the **Settings Manager**. The properties are the ones that you would set in those dialogs. Note that not all the icons you will find in the **Settings Manager** dialog window are part of the **Xfce** desktop, so there are no corresponding channels for them. The **Screensaver** is one example because it is a generic GNU screensaver and not unique to **Xfce**. The **Settings Manager** is just a good central place for **Xfce** to locate many of these configuration tools.

### Documentation

As mentioned previously, there do not appear to be any man or info pages for the **xconf-query** command, and I found a lot of incorrect and poorly documented information on the Internet. The best documentation I found for **Xfce4** is on the [Xfce website][2], and some specific information on **xconf-query** can be found here.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/remote-configuration-xfce4

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://www.xfce.org/
