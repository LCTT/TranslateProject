FSSlc Translating
Flameshot – A Simple, Yet Powerful Feature-rich Screenshot Tool
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Flameshot-720x340.png)

Capturing screenshots is part of my job. I have been using Deepin-screenshot tool for taking screenshots. It’s a simple, light-weight and quite neat screenshot tool. It comes with all options such as mart window identification, shortcuts supporting, image editing, delay screenshot, social sharing, smart saving, and image resolution adjusting etc. Today, I stumbled upon yet another screenshot tool that ships with many features. Say hello to **Flameshot** , a simple and powerful, feature-rich screenshot tool for Unix-like operating systems. It is easy to use, customizable and has an option to upload your screenshots to **imgur** , an online image sharing website. And also, Flameshot has a CLI version, so you can take screenshots from commandline as well. Flameshot is completely free and open source tool. In this guide, we will see how to install Flameshot and how to take screenshots using it.

### Install Flameshot

**On Arch Linux:**

Flameshot is available [community] repository in Arch Linux. Make sure you have enabled community repository and install Flameshot using pacman as shown below.
```
$ sudo pacman -S flameshot

```

It is also available in [**AUR**][1], so you can install it using any AUR helper programs, for example [**Yay**][2], in Arch-based systems.
```
$ yay -S flameshot-git

```

**On Fedora:**
```
$ sudo dnf install flameshot

```

On **Debian 10+** and **Ubuntu 18.04+** , install it using APT package manager.
```
$ sudo apt install flameshot

```

**On openSUSE:**
```
$ sudo zypper install flameshot

```

On other distributions, compile and install it from source code. The compilation requires **Qt version 5.3** or higher and **GCC 4.9.2** or higher.

### Usage

Launch Flameshot from menu or application launcher. On MATE desktop environment, It usually found under **Applications - > Graphics**.

Once you opened it, you will see Flameshot systray icon in your system’s panel.

**Note:**

If you are using Gnome you need to install the [TopIcons][3] extension in order to see the systemtray icon.

Right click on the tray icon and you’ll see some menu items to open the configuration window and the information window or quit the application.

To capture screenshot, just click on the tray icon. You will see help window that says how to use Flameshot. Choose an area to capture and hit **ENTER** key to capture the screen. Press right click to show the color picker, hit spacebar to view the side panel. You can use increase or decrease the pointer’s thickness by using the Mouse scroll button.

Flameshot comes with quite good set of features, such as,

  * Free hand writing
  * Line drawing
  * Rectangle / Circle drawing
  * Rectangle selection
  * Arrows
  * Marker to highlight important points
  * Add text
  * Blur the image/text
  * Show the dimension of the image
  * Undo/Redo the changes while editing images
  * Copy the selection to the clipboard
  * Save the selection
  * Leave the capture screen
  * Choose an app to open images
  * Upload the selection to imgur site
  * Pin image to desktop



Here is a sample demo:

<http://www.ostechnix.com/wp-content/uploads/2018/09/Flameshot-demo.mp4>

**Keyboard shortcuts**

Frameshot supports keyboard shortcuts. Right click on Flameshot tray icon and click **Information** window to see all the available shortcuts in the graphical capture mode. Here is the list of available keyboard shortcuts in GUI mode.

| Keys                   | Description                  |
|------------------------|------------------------------|
| ←, ↓, ↑, →         | Move selection 1px           |
| Shift + ←, ↓, ↑, → | Resize selection 1px         |
| Esc                    | Quit capture                 |
| Ctrl + C               | Copy to clipboard            |
| Ctrl + S               | Save selection as a file     |
| Ctrl + Z               | Undo the last modification   |
| Right Click            | Show color picker            |
| Mouse Wheel            | Change the tool’s thickness |

Shift + drag a handler of the selection area: mirror redimension in the opposite handler.

**Command line options**

Flameshot also has a set of command line options to delay the screenshots and save images in custom paths.

To capture screen with Flameshot GUI, run:
```
$ flameshot gui

```

To capture screen with GUI and save it in a custom path of your choice:
```
$ flameshot gui -p ~/myStuff/captures

```

To open GUI with a delay of 2 seconds:
```
$ flameshot gui -d 2000

```

To capture fullscreen with custom save path (no GUI) with a delay of 2 seconds:
```
$ flameshot full -p ~/myStuff/captures -d 2000

```

To capture fullscreen with custom save path copying to clipboard:
```
$ flameshot full -c -p ~/myStuff/captures

```

To capture the screen containing the mouse and print the image (bytes) in **PNG** format:
```
$ flameshot screen -r

```

To capture the screen number 1 and copy it to the clipboard:
```
$ flameshot screen -n 1 -c

```

What do you need? Flameshot has almost all features for capturing pictures, adding annotations, editing images, blur or highlight important points and a lot more. I think I will stick with Flameshot for a while as find it best replacement for my current screenshot tool. Give it a try and you won’t be disappointed.

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/flameshot-a-simple-yet-powerful-feature-rich-screenshot-tool/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://aur.archlinux.org/packages/flameshot-git
[2]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[3]: https://extensions.gnome.org/extension/1031/topicons/
