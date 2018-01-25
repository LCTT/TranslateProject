Translating by filefi

# Scrot: Linux command-line screen grabs made simple

by [Scott Nesbitt][a] · November 30, 2017

> Scrot is a basic, flexible tool that offers a number of handy options for taking screen captures from the Linux command line.

[![Original photo by Rikki Endsley. CC BY-SA 4.0](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A)][1]



There are great tools on the Linux desktop for taking screen captures, such as [KSnapshot][2] and [Shutter][3]. Even the simple utility that comes with the GNOME desktop does a pretty good job of capturing screens. But what if you rarely need to take screen captures? Or you use a Linux distribution without a built-in capture tool, or an older computer with limited resources?

Turn to the command line and a little utility called [Scrot][4]. It does a fine job of taking simple screen captures, and it includes a few features that might surprise you.

### Getting started with Scrot
Many Linux distributions come with Scrot already installed—to check, type `which scrot`. If it isn't there, you can install Scrot using your distro's package manager. If you're willing to compile the code, grab it [from GitHub][5].

To take a screen capture, crack open a terminal window and type `scrot [filename]`, where `[filename]` is the name of file to which you want to save the image (for example, `desktop.png`). If you don't include a name for the file, Scrot will create one for you, such as `2017-09-24-185009_1687x938_scrot.png`. (That filename isn't as descriptive it could be, is it? That's why it's better to add one to the command.)

Running Scrot with no options takes a screen capture of your entire desktop. If you don't want to do that, Scrot lets you focus on smaller portions of your screen.

### Taking a screen capture of a single window

Tell Scrot to take a screen capture of a single window by typing `scrot -u [filename]`.

The `-u` option tells Scrot to grab the window currently in focus. That's usually the terminal window you're working in, which might not be the one you want.

To grab another window on your desktop, type `scrot -s [filename]`.

The `-s` option lets you do one of two things:

*   select an open window, or

*   draw a rectangle around a window or a portion of a window to capture it.

You can also set a delay, which gives you a little more time to select the window you want to capture. To do that, type `scrot -u -d [num] [filename]`.

The `-d` option tells Scrot to wait before grabbing the window, and `[num]` is the number of seconds to wait. Specifying `-d 5` (wait five seconds) should give you enough time to choose a window.

### More useful options

Scrot offers a number of additional features (most of which I never use). The ones I find most useful include:

*   `-b` also grabs the window's border

*   `-t` grabs a window and creates a thumbnail of it. This can be useful when you're posting screen captures online.

*   `-c` creates a countdown in your terminal when you use the `-d` option.

To learn about Scrot's other options, check out the its documentation by typing `man scrot` in a terminal window, or [read it online][6]. Then start snapping images of your screen.

It's basic, but Scrot gets the job done nicely.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/taking-screen-captures-linux-command-line-scrot

作者：[Scott Nesbitt][a]
译者：[filefi](https://github.com/filefi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A
[2]:https://www.kde.org/applications/graphics/ksnapshot/
[3]:https://launchpad.net/shutter
[4]:https://github.com/dreamer/scrot
[5]:http://manpages.ubuntu.com/manpages/precise/man1/scrot.1.html
[6]:https://github.com/dreamer/scrot
