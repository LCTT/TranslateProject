5 reasons the i3 window manager makes Linux better
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-windows.png?itok=jd5sBNQH)

One of the nicest things about Linux (and open source software in general) is the freedom to choose among different alternatives to address our needs.

I've been using Linux for a long time, but I was never entirely happy with the desktop environment options available. Until last year, [Xfce][1] was the closest to what I consider a good compromise between features and performance. Then I found [i3][2], an amazing piece of software that changed my life.

I3 is a tiling window manager. The goal of a window manager is to control the appearance and placement of windows in a windowing system. Window managers are often used as part a full-featured desktop environment (such as GNOME or Xfce), but some can also be used as standalone applications.

A tiling window manager automatically arranges the windows to occupy the whole screen in a non-overlapping way. Other popular tiling window managers include [wmii][3] and [xmonad][4].

![i3 tiled window manager screenshot][6]

Screenshot of i3 with three tiled windows

Following are the top five reasons I use the i3 window manager and recommend it for a better Linux desktop experience.

### 1\. Minimalism

I3 is fast. It is neither bloated nor fancy. It is designed to be simple and efficient. As a developer, I value these features, as I can use the extra capacity to power my favorite development tools or test stuff locally using containers or virtual machines.

In addition, i3 is a window manager and, unlike full-featured desktop environments, it does not dictate the applications you should use. Do you want to use Thunar from Xfce as your file manager? GNOME's gedit to edit text? I3 does not care. Pick the tools that make the most sense for your workflow, and i3 will manage them all in the same way.

### 2\. Screen real estate

As a tiling window manager, i3 will automatically "tile" or position the windows in a non-overlapping way, similar to laying tiles on a wall. Since you don't need to worry about window positioning, i3 generally makes better use of your screen real estate. It also allows you to get to what you need faster.

There are many useful cases for this. For example, system administrators can open several terminals to monitor or work on different remote systems simultaneously; and developers can use their favorite IDE or editor and a few terminals to test their programs.

In addition, i3 is flexible. If you need more space for a particular window, enable full-screen mode or switch to a different layout, such as stacked or tabbed.

### 3\. Keyboard-driven workflow

I3 makes extensive use of keyboard shortcuts to control different aspects of your environment. These include opening the terminal and other programs, resizing and positioning windows, changing layouts, and even exiting i3. When you start using i3, you need to memorize a few of those shortcuts to get around and, with time, you'll use more of them.

The main benefit is that you don't often need to switch contexts from the keyboard to the mouse. With practice, it means you'll improve the speed and efficiency of your workflow.

For example, to open a new terminal, press `<SUPER>+<ENTER>`. Since the windows are automatically positioned, you can start typing your commands right away. Combine that with a nice terminal-driven text editor (e.g., Vim) and a keyboard-focused browser for a fully keyboard-driven workflow.

In i3, you can define shortcuts for everything. Here are some examples:

  * Open terminal
  * Open browser
  * Change layouts
  * Resize windows
  * Control music player
  * Switch workspaces



Now that I am used to this workflow, I can't see myself going back to a regular desktop environment.

### 4\. Flexibility

I3 strives to be minimal and use few system resources, but that does not mean it can't be pretty. I3 is flexible and can be customized in several ways to improve the visual experience. Because i3 is a window manager, it doesn't provide tools to enable customizations; you need external tools for that. Some examples:

  * Use `feh` to define a background picture for your desktop.
  * Use a compositor manager such as `compton` to enable effects like window fading and transparency.
  * Use `dmenu` or `rofi` to enable customizable menus that can be launched from a keyboard shortcut.
  * Use `dunst` for desktop notifications.



I3 is fully configurable, and you can control every aspect of it by updating the default configuration file. From changing all keyboard shortcuts, to redefining the name of the workspaces, to modifying the status bar, you can make i3 behave in any way that makes the most sense for your needs.

![i3 with rofi menu and dunst desktop notifications][8]

i3 with `rofi` menu and `dunst` desktop notifications

Finally, for more advanced users, i3 provides a full interprocess communication ([IPC][9]) interface that allows you to use your favorite language to develop scripts or programs for even more customization options.

### 5\. Workspaces

In i3, a workspace is an easy way to group windows. You can group them in different ways according to your workflow. For example, you can put the browser on one workspace, the terminal on another, an email client on a third, etc. You can even change i3's configuration to always assign specific applications to their own workspaces.

Switching workspaces is quick and easy. As usual in i3, do it with a keyboard shortcut. Press `<SUPER>+num` to switch to workspace `num`. If you get into the habit of always assigning applications/groups of windows to the same workspace, you can quickly switch between them, which makes workspaces a very useful feature.

In addition, you can use workspaces to control multi-monitor setups, where each monitor gets an initial workspace. If you switch to that workspace, you switch to that monitor—without moving your hand off the keyboard.

Finally, there is another, special type of workspace in i3: the scratchpad. It is an invisible workspace that shows up in the middle of the other workspaces by pressing a shortcut. This is a convenient way to access windows or programs that you frequently use, such as an email client or your music player.

### Give it a try

If you value simplicity and efficiency and are not afraid of working with the keyboard, i3 is the window manager for you. Some say it is for advanced users, but that is not necessarily the case. You need to learn a few basic shortcuts to get around at the beginning, but they'll soon feel natural and you'll start using them without thinking.

This article just scratches the surface of what i3 can do. For more details, consult [i3's documentation][10].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/i3-tiling-window-manager

作者：[Ricardo Gerardi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rgerardi
[1]:https://xfce.org/
[2]:https://i3wm.org/
[3]:https://code.google.com/archive/p/wmii/
[4]:https://xmonad.org/
[5]:/file/406476
[6]:https://opensource.com/sites/default/files/uploads/i3_screenshot.png (i3 tiled window manager screenshot)
[7]:/file/405161
[8]:https://opensource.com/sites/default/files/uploads/rofi_dunst.png (i3 with rofi menu and dunst desktop notifications)
[9]:https://i3wm.org/docs/ipc.html
[10]:https://i3wm.org/docs/userguide.html
