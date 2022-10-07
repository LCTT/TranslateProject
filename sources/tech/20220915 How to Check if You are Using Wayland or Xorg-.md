[#]: subject: "How to Check if You are Using Wayland or Xorg?"
[#]: via: "https://itsfoss.com/check-wayland-or-xorg/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Check if You are Using Wayland or Xorg?
======
There is a technical transition taking place in the desktop Linux world.

Most mainstream distros have started to move to the Wayland [display server][1] by default.

But not all legacy components are compatible with the newer Wayland. They work only with the good old X or Xorg display server.

So, when you are having trouble with your Linux system, it would be wise to check if the problem is coming because of the display server.

Let me show you how to check which display server you are using.

### Check whether Wayland or Xorg is in use

The simplest and perhaps the most reliable way is to use the following command in a terminal:

```
echo $XDG_SESSION_TYPE
```

If you are using Wayland, you should get ‘wayland’ in the output:

```
[email protected]:~$ echo $XDG_SESSION_TYPE 
wayland
```

![waylnd][2]

If you use xorg (X display server), you should get x11 in the output.

```
[email protected]:~$ echo $XDG_SESSION_TYPE 
x11
```

![x 11][3]

To summarize:

* Check the value of $XDG_SESSION_TYPE variable in terminal
* For Wayland, you get wayland and for Xorg you get in the output.

#### A ridiculous but fun way to know if you are using Wayland on GNOME

I found it on [Fedora Subreddit][4]. If you are using GNOME, press Alt+F2, type r in the dialogue box and press enter. Normally it restarts the GNOME shell. But it won’t work in Wayland. It will display ‘restart is not available on Wayland’.

![wayland in gnome][5]

### To Wayland or not?

GNOME has put so much emphasis on Wayland to provide a modern desktop experience. Ubuntu, Fedora and many other distros have switched to Wayland by default but many applications are lagging behind in Wayland support.

Many screen recorders and screenshot software don’t work with Wayland. Switching back to Xorg is the only option at times. Thankfully, it is quite easy to [switch between Xorg and Wayland][6]. Just log out and click the user profile and then click the gear symbol at the bottom to choose the session you want.

Personally, I suggest sticking with what your distribution provides. Only switch to the other when it is required.

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-wayland-or-xorg/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/display-server/
[2]: https://itsfoss.com/wp-content/uploads/2022/09/waylnd.png
[3]: https://itsfoss.com/wp-content/uploads/2022/09/x-11.png
[4]: https://www.reddit.com/r/Fedora/comments/6omauc/the_quickest_and_fun_way_to_check_if_you_are/
[5]: https://itsfoss.com/wp-content/uploads/2022/09/wayland-in-gnome.png
[6]: https://itsfoss.com/switch-xorg-wayland/
