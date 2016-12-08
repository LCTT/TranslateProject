Mir is not only about Unity8
============================================================

 ![mir](https://insights.ubuntu.com/wp-content/uploads/2cf2/MIR.png) 

_This is a guest post by Alan Griffiths, Software engineer at Canonical. If you would like to contribute a guest post, please contact ubuntu-devices@canonical.com_

Mir is a project to support the management applications on the display(s) of a computer. It can be compared to the more familiar X-Windows used on the current Ubuntu desktop (and many others). I’ll discuss some of the motivation for Mir below, but the point of this post is to clarify the relationship between Mir and Unity8.

Most of the time you hear about Mir it is mentioned alongside Unity8\. This is not surprising as Unity8 is Canonical’s new user interface shell and the thing end-users interact with. Mir “only” makes this possible. Unity8 is currently used on phones and tablets and is also available as a “preview” on the Ubuntu 16.10 desktop.

Here I want to explain that Mir is available to use without Unity8\. Either for an alternative shell, or as a simpler interface for embedded environments: information kiosks, electronic signage, etc. The evidence for this is proved by the Mir “Abstraction Layer” which provides three important elements:

1.libmiral.so – a stable interface to Mir providing basic window management;
2\. miral-shell – a sample shell offering both “traditional” and “tiling” window management; and,
3\. miral-kiosk – a sample “kiosk” offering only basic window management.

The miral-shell and miral-kiosk sample servers are available from the zesty archive and Kevin Gunn has been [blogging][1] about providing a miral-kiosk based “kiosk” snap on “Voices”. I’ll give a bit more detail about using these examples below, but there is more (including “how to” develop your own alternative Mir server) on [my “voices” blog][2].

**USING MIR**

Mir is a set of programming libraries, not an application in its own right. That means it needs applications to use it for anything to happen. There are two ways to use the Mir libraries: as a “client” when writing an application, or as a “server” when implementing a shell. Clients (as with X11) typically use a toolkit rather than using Mir (or X11) directly.

There’s Mir support available in GTK, Qt and SDL2\. This means that applications using these toolkits should “just work” on Mir when that support is enabled in the toolkit (which is the default in Ubuntu). In addition there’s Xmir: an X11 server that runs on Mir, this allows X based applications to run on Mir servers.

But a Mir client needs a corresponding Mir server before anything can happen. Over the last development cycle the Mir team has produced MirAL as the recommended way to write Mir servers and a package “miral-examples” by way of demonstration. For zesty, the development version of Ubuntu, you can install from the archive:

```
$ sudo apt install miral-examples mir-graphics-drivers-desktop qtubuntu-desktop
```

_For other platforms you would need to build MirAL this yourself (see An Example Mir Desktop Environment for details)._

With miral-examples installed you can run a Mir server as a window on your Unity7 desktop and start clients (such as gedit) within it as follows:

```
$ miral-shell&
$ miral-run gedit
```

This will give you (very basic) “traditional” desktop window management. Alternatively, you can try “tiling” window management:

```
$ miral-shell --window-manager tiling&
$ miral-run qterminal
```

Or the (even more basic) kiosk:

```
$ miral-kiosk&
$ miral-run 7kaa
```

None of these Mir servers provide a complete “desktop” with support for a “launcher”, notifications, etc. but they demonstrate the potential to use Mir without Unity8.

**THE PROBLEM MIR SOLVES**

The X-Windows system has been, and remains, immensely successful in providing a way to interact with computers. It provides a consistent abstraction across a wide range of hardware and drivers. This underlies many desktop environments and graphical user interface toolkits and lets them work together on an enormous range of computers.

But it comes from an era when computers were used very differently from now, and there are real concerns today that are hard to meet given the long legacy that X needs to support.
In 1980 most computers were big things managed by specialists and connecting them to one another was “bleeding edge”. In that era the cost of developing software was such that any benefit to be gained by one application “listening in” on another was negligible: there were few computers, they were isolated, and the work they did was not open to financial exploitation.

X-Windows developed in this environment and, through a series of extensions, has adapted to many changes. But it is inherently insecure: any application can find out what happening on the display (and affect it). You can write applications like Xeyes (that tracks the cursor with its “eyes”) or “Tickeys” (that listens to the keyboard to generate typewriter noises). The reality is that any and all applications can track and manipulate almost all of what is happening. That is how X based desktops like Unity7, Gnome, KDE and the rest work.

The open nature of window management in X-Windows is poorly adapted to a world with millions of computers connected to the Internet, being used for credit card transactions and online banking, and managed by non-experts who willingly install programs from complete strangers. There has been a growing realization that adapting X-Windows to the new requirements of security and graphics performance isn’t feasible.

There are at least two open source projects aimed at providing a replacement: Mir and Wayland. While some see these as competing, there are a lot of areas where they have common interests: They both need to interact with other software that previously assumed X11, and much of the work needed to introduce support alternatives benefits both projects.

Canonical’s replacement for X-Windows, Mir, only exposes the information to an application that it needs to have (so no snooping on keystrokes, or tracking the cursor). It can meet the needs of the current age and can exploit modern hardware such as graphics processors.

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2016/11/28/mir-is-not-only-about-unity8/

作者：[ Guest][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/guest/
[1]:http://voices.canonical.com/kevin.gunn/
[2]:http://voices.canonical.com/alan.griffiths/
