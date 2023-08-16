[#]: subject: "Use Split Screen in Ubuntu to View Multiple Application Windows at Once"
[#]: via: "https://itsfoss.com/ubuntu-split-screen/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use Split Screen in Ubuntu to View Multiple Application Windows at Once
======

The ability to split screen and view two applications simultaneously is a lifesaver.

It helps me in situations where I have to follow documentation and use the commands from the documentation.

![][1]

If you have a monitor with a large screen capable enough to show multiple windows simultaneously, then splitting the screen to fit multiple windows becomes mandatory.

**Splitting** the **screen is as simple as dragging an application to the left or right edge of the screen.**

I'll show that in detail in this tutorial. I'll also discuss keyboard shortcuts and dedicated extensions to enhance this experience.

To summarise, you'll learn to split screen in GNOME

  * Using the mouse (easy)
  * Using keyboard shortcuts
  * Using a GNOME extension (for more options to split windows and control)



📋

Though this tutorial is written using Ubuntu, the steps should be valid for other distributions using GNOME desktop environment.

### Split screen in Ubuntu using mouse (easy)

By far, this is the easiest method to split screen.

To split screen, all you have to do is drag the window to the extreme left and you'd see a selected area in which the window will be placed:

💡

If you don't want to drag the window by bonding the header always, then you can press and hold the super key and the window will be selected and can be dragged from anywhere.

Still confused? Follow two simple steps:

  * Hover your cursor on the window header select and drag it to the extreme left or right, based on where you want to place the window.
  * Repeat the same step for the other window in the opposite direction (if the first was on the left then this one should be on the right).



Here's a simple example of how I split Firefox and file manager in the entire screen:

0:00

/0:05

1×

split screen using a mouse

But you may not want to allocate half of the screen to that specific window.

Such as in my case, the browser window should be larger than the file managers'.

To resize the windows, hover your cursor on the split and then, press and hold the cursor and change the size of window panes accordingly:

0:00

/0:10

1×

resize split windows using the mouse

### Split screen in Ubuntu using keyboard

If you [prefer using the keyboard][2] as much as possible, then you can have the same result as above but with the keyboard.

To split screen, all you have to do is follow two simple steps:

  * Use `Alt + tab` to focus on a window that needs to be splitted
  * Press `Shift + right/left arrow key` to split the focused window



Some people also use the super key in Ubuntu instead of Shift.

For your reference, here, I split the screen between the file manager and Firefox:

0:00

/0:05

1×

And if you want to resize two windows, here's what you have to follow:

  * Press `Alt + F8` to enable resize mode
  * Use arrow keys to resize the windows
  * Press the `Esc` or the `Enter` key to get out of the resize mode



Looks confusing? Here's what those three steps look like in real life:

0:00

/0:05

1×

🚧

Some rare applications may not respond to keyboard shortcuts for screen splitting. You can use the drag and drop in such cases.

![][3]

### Split the screen into multiple portions using the GNOME extension

If you want to see even more application windows simultaneously, you can use some GNOME extensions and split the screen in four, six or eight parts.

If you don't know how you install and manage extensions in GNOME, I would highly recommend [our detailed guide on using GNOME extensions.][4]

While many extensions exist for this purpose, I found Tactile the easiest yet the most effective.

Install Tactlie from the [official extension page][5].

Once done, you have to follow simple steps to split screen:

  * Press `Supet + t` to start Tactile extension and will divide the screen into 6 parts written with alphabets.
  * **You press one alphabet twice to split the focused window in the shown section.**
  * Furthermore, you can also use area from two or more alphabets by pressing them once in sequence.
  * For example, if I want to allocate an area shown by `A` and `S` to Firefox, then, I will keep Firefox in focus, press `Super + t` and press `A` and `S` (in sequence).



For your reference, here, I split the screen between 4 windows:

0:00

/0:15

1×

#### Customizing the Tactile area

As I explained earlier, by default, you can divide your screen into 8 parts.

But let's be honest. Unless you have a very large display, dividing your screen between 8 windows is not practical (at all).

The good thing is Tactile allows you to customize the area with the option to have multiple layouts so you tweak each and use them as per the workload demands.

First, open the `Extension` (if you installed gnome-shell-extension) or `Extension Manager`.

Then, open the settings of the `Tactile`:

![][6]

Here, you can remove/add rows and columns to create a perfect split-screen for your use case.

For example, I wanted to have only 3 columns to I can split the screen into 3 windows, so, I went with the following configuration:

![][7]

#### Switching between layouts in Tactile

Customizing layouts, check ✅.

But how would you switch between them? The answer is pretty simple.

By following the given steps:

  * Start the Tactile by pressing `Super + t`
  * Press the number of the layout you want to select (press 3 for the 3rd layout)



Here's a visual representation:

0:00

/0:07

1×

Changing layouts in Tactile

### Productivity hacks for handling multiple applications

If you run several applications simultaneously, grouping them in different workspaces could be a good idea. Learn about [using workspaces in Ubuntu][8].

![][3]

Love the splitting screen idea? How about implementing it inside a terminal with [Terminator][9]?

![][3]

I can't say I should call it a productivity hack. You can watch videos all the time using the '[always on top][10]' feature in GNOME.

![][3]

And if you loved the idea of multiple application views in one screen, you may like the tiling windows. Explore the [Regolith project][11].

![][3]

Small things like these often remain hidden. But once you discover them, you realize what you were missing on.

I hope you like the split screen feature enough to use it regularly. Subscribe to It's FOSS, if you haven't already, for more such desktop Linux tips and tutorials.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-split-screen/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/split-screen-ubuntu.png
[2]: https://itsfoss.com/ubuntu-shortcuts/
[3]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[4]: https://itsfoss.com/gnome-shell-extensions/
[5]: https://extensions.gnome.org/extension/4548/tactile/?ref=itsfoss.com
[6]: https://itsfoss.com/content/images/2023/08/Open-the-settings-of-Tactile.png
[7]: https://itsfoss.com/content/images/2023/08/customize-Tactile-extension.png
[8]: https://itsfoss.com/ubuntu-workspaces/
[9]: https://itsfoss.com/terminator/
[10]: https://itsfoss.com/always-on-top/
[11]: https://itsfoss.com/regolith-linux-desktop/
