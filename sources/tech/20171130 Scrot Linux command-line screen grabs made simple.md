Scrot: Linux command-line screen grabs made simple
============================================================

### Scrot is a basic, flexible tool that offers a number of handy options for taking screen captures from the Linux command line.

![Scrot: Screen grabs made simple](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A "Scrot: Screen grabs made simple")
Image credits : Original photo by Rikki Endsley. [CC BY-SA 4.0][13]

There are great tools on the Linux desktop for taking screen captures, such as [KSnapshot][14] and [Shutter][15]. Even the simple utility that comes with the GNOME desktop does a pretty good job of capturing screens. But what if you rarely need to take screen captures? Or you use a Linux distribution without a built-in capture tool, or an older computer with limited resources?

Turn to the command line and a little utility called [Scrot][16]. It does a fine job of taking simple screen captures, and it includes a few features that might surprise you.

### Getting started with Scrot

More Linux resources

*   [What is Linux?][1]

*   [What are Linux containers?][2]

*   [Download Now: Linux commands cheat sheet][3]

*   [Advanced Linux commands cheat sheet][4]

*   [Our latest Linux articles][5]

Many Linux distributions come with Scrot already installed—to check, type `which scrot`. If it isn't there, you can install Scrot using your distro's package manager. If you're willing to compile the code, grab it [from GitHub][22].

To take a screen capture, crack open a terminal window and type `scrot [filename]`, where `[filename]` is the name of file to which you want to save the image (for example, `desktop.png`). If you don't include a name for the file, Scrot will create one for you, such as `2017-09-24-185009_1687x938_scrot.png`. (That filename isn't as descriptive it could be, is it? That's why it's better to add one to the command.)

Running Scrot with no options takes a screen capture of your entire desktop. If you don't want to do that, Scrot lets you focus on smaller portions of your screen.

### Taking a screen capture of a single window

Tell Scrot to take a screen capture of a single window by typing `scrot -u [filename]`.

The `-u` option tells Scrot to grab the window currently in focus. That's usually the terminal window you're working in, which might not be the one you want.

To grab another window on your desktop, type `scrot -s [filename]`.

The `-s` option lets you do one of two things:

*   select an open window, or

*   draw a rectangle around a window or a portion of a window to capture it.

You can also set a delay, which gives you a little more time to select the window you want to capture. To do that, type `scrot -u -d [num] [filename]`.

The `-d` option tells Scrot to wait before grabbing the window, and `[num]` is the number of seconds to wait. Specifying `-d 5` (wait five seconds) should give you enough time to choose a window.

### More useful options

Scrot offers a number of additional features (most of which I never use). The ones I find most useful include:

*   `-b` also grabs the window's border

*   `-t` grabs a window and creates a thumbnail of it. This can be useful when you're posting screen captures online.

*   `-c` creates a countdown in your terminal when you use the `-d` option.

To learn about Scrot's other options, check out the its documentation by typing `man scrot` in a terminal window, or [read it online][17]. Then start snapping images of your screen.

It's basic, but Scrot gets the job done nicely.

### Topics

 [Linux][23]

### About the author

 [![That idiot Scott Nesbitt ...](https://opensource.com/sites/default/files/styles/profile_pictures/public/scottn-cropped.jpg?itok=q4T2J4Ai)][18] 
 
 Scott Nesbitt - I'm a long-time user of free/open source software, and write various things for both fun and profit. I don't take myself too seriously and I do all of my own stunts. You can find me at these fine establishments on the web: [Twitter][7], [Mastodon][8], [GitHub][9], and... [more about Scott Nesbitt][10][More about me][11]

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/taking-screen-captures-linux-command-line-scrot

作者：[ Scott Nesbitt  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/article/17/11/taking-screen-captures-linux-command-line-scrot?rate=H43kUdawjR0GV9D0dCbpnmOWcqw1WekfrAI_qKo8UwI
[7]:http://www.twitter.com/ScottWNesbitt
[8]:https://mastodon.social/@scottnesbitt
[9]:https://github.com/ScottWNesbitt
[10]:https://opensource.com/users/scottnesbitt
[11]:https://opensource.com/users/scottnesbitt
[12]:https://opensource.com/user/14925/feed
[13]:https://creativecommons.org/licenses/by-sa/4.0/
[14]:https://www.kde.org/applications/graphics/ksnapshot/
[15]:https://launchpad.net/shutter
[16]:https://github.com/dreamer/scrot
[17]:http://manpages.ubuntu.com/manpages/precise/man1/scrot.1.html
[18]:https://opensource.com/users/scottnesbitt
[19]:https://opensource.com/users/scottnesbitt
[20]:https://opensource.com/users/scottnesbitt
[21]:https://opensource.com/article/17/11/taking-screen-captures-linux-command-line-scrot#comments
[22]:https://github.com/dreamer/scrot
[23]:https://opensource.com/tags/linux
