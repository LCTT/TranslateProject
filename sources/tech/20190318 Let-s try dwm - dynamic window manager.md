[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Let’s try dwm — dynamic window manager)
[#]: via: (https://fedoramagazine.org/lets-try-dwm-dynamic-window-manger/)
[#]: author: (Adam Šamalík https://fedoramagazine.org/author/asamalik/)

Let’s try dwm — dynamic window manager
======

![][1]

If you like efficiency and minimalism, and are looking for a new window manager for your Linux desktop, you should try _dwm_ — dynamic window manager. Written in under 2000 standard lines of code, dwm is extremely fast yet powerful and highly customizable window manager.

You can dynamically choose between tiling, monocle and floating layouts, organize your windows into multiple workspaces using tags, and quickly navigate through using keyboard shortcuts. This article helps you get started using dwm.

## **Installation**

To install dwm on Fedora, run:

```
$ sudo dnf install dwm dwm-user
```

The _dwm_ package installs the window manager itself, and the _dwm-user_ package significantly simplifies configuration which will be explained later in this article.

Additionally, to be able to lock the screen when needed, we’ll also install _slock_ — a simple X display locker.

```
$ sudo dnf install slock
```

However, you can use a different one based on your personal preference.

## **Quick start**

To start dwm, choose the _dwm-user_ option on the login screen.

![][2]

After you log in, you’ll see a very simple desktop. In fact, the only thing there will be a bar at the top listing our nine tags that represent workspaces and a _[]=_ symbol that represents the layout of your windows.

### Launching applications

Before looking into the layouts, first launch some applications so you can play with the layouts as you go. Apps can be started by pressing _Alt+p_ and typing the name of the app followed by _Enter_. There’s also a shortcut _Alt+Shift+Enter_ for opening a terminal.

Now that some apps are running, have a look at the layouts.

### Layouts

There are three layouts available by default: the tiling layout, the monocle layout, and the floating layout.

The tiling layout, represented by _[]=_ on the bar, organizes windows into two main areas: master on the left, and stack on the right. You can activate the tiling layout by pressing _Alt+t._

![][3]

The idea behind the tiling layout is that you have your primary window in the master area while still seeing the other ones in the stack. You can quickly switch between them as needed.

To swap windows between the two areas, hover your mouse over one in the stack area and press _Alt+Enter_ to swap it with the one in the master area.

![][4]

The monocle layout, represented by _[N]_ on the top bar, makes your primary window take the whole screen. You can switch to it by pressing _Alt+m_.

Finally, the floating layout lets you move and resize your windows freely. The shortcut for it is _Alt+f_ and the symbol on the top bar is _> <>_.

### Workspaces and tags

Each window is assigned to a tag (1-9) listed at the top bar. To view a specific tag, either click on its number using your mouse or press _Alt+1..9._ You can even view multiple tags at once by clicking on their number using the secondary mouse button.

Windows can be moved between different tags by highlighting them using your mouse, and pressing _Alt+Shift+1..9._

## **Configuration**

To make dwm as minimalistic as possible, it doesn’t use typical configuration files. Instead, you modify a C header file representing the configuration, and recompile it. But don’t worry, in Fedora it’s as simple as just editing one file in your home directory and everything else happens in the background thanks to the _dwm-user_ package provided by the maintainer in Fedora.

First, you need to copy the file into your home directory using a command similar to the following:

```
$ mkdir ~/.dwm
$ cp /usr/src/dwm-VERSION-RELEASE/config.def.h ~/.dwm/config.h
```

You can get the exact path by running _man dwm-start._

Second, just edit the _~/.dwm/config.h_ file. As an example, let’s configure a new shortcut to lock the screen by pressing _Alt+Shift+L_.

Considering we’ve installed the _slock_ package mentioned earlier in this post, we need to add the following two lines into the file to make it work:

Under the _/* commands */_ comment, add:

```
static const char *slockcmd[] = { "slock", NULL };
```

And the following line into _static Key keys[]_ :

```
{ MODKEY|ShiftMask, XK_l, spawn, {.v = slockcmd } },
```

In the end, it should look like as follows: (added lines are highlighted)

```
...
 /* commands */
 static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
 static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
 static const char *termcmd[]  = { "st", NULL };
 static const char *slockcmd[] = { "slock", NULL };

 static Key keys[] = {
     /* modifier                     key        function        argument */
     { MODKEY|ShiftMask,             XK_l,      spawn,          {.v = slockcmd } },
     { MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
     { MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
 ...
```

Save the file.

Finally, just log out by pressing _Alt+Shift+q_ and log in again. The scripts provided by the _dwm-user_ package will recognize that you have changed the _config.h_ file in your home directory and recompile dwm on login. And becuse dwm is so tiny, it’s fast enough you won’t even notice it.

You can try locking your screen now by pressing _Alt+Shift+L_ , and then logging back in again by typing your password and pressing enter.

## **Conclusion**

If you like minimalism and want a very fast yet powerful window manager, dwm might be just what you’ve been looking for. However, it probably isn’t for beginners. There might be a lot of additional configuration you’ll need to do in order to make it just as you like it.

To learn more about dwm, see the project’s homepage at <https://dwm.suckless.org/>.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/lets-try-dwm-dynamic-window-manger/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/03/dwm-magazine-image-816x345.png
[2]: https://fedoramagazine.org/wp-content/uploads/2019/03/choosing-dwm-1024x469.png
[3]: https://fedoramagazine.org/wp-content/uploads/2019/03/dwm-desktop-1024x593.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-2019-03-15-at-11.12.32-1024x592.png
