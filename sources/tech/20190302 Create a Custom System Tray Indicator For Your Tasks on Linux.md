[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create a Custom System Tray Indicator For Your Tasks on Linux)
[#]: via: (https://fosspost.org/tutorials/custom-system-tray-icon-indicator-linux)
[#]: author: (M.Hanny Sabbagh https://fosspost.org/author/mhsabbagh)

Create a Custom System Tray Indicator For Your Tasks on Linux
======

System Tray icons are still considered to be an amazing functionality today. By just right-clicking on the icon, and then selecting which actions you would like to take, you may ease your life a lot and save many unnecessary clicks on daily basis.

When talking about useful system tray icons, examples like Skype, Dropbox and VLC do come to mind:

![Create a Custom System Tray Indicator For Your Tasks on Linux 11][1]

However, system tray icons can actually be quite a lot more useful; By simply building one yourself for your own needs. In this tutorial, we’ll explain how to do that for you in very simple steps.

### Prerequisites

We are going to build a custom system tray indicator using Python. Python is probably installed by default on all the major Linux distributions, so just check it’s there (version 2.7). Additionally, we’ll need the gir1.2-appindicator3 package installed. It’s the library allowing us to easily create system tray indicators.

To install it on Ubuntu/Mint/Debian:

```
sudo apt-get install gir1.2-appindicator3
```

On Fedora:

```
sudo dnf install libappindicator-gtk3
```

For other distributions, just search for any packages containing appindicator.

On GNOME Shell, system tray icons are removed starting from 3.26. You’ll need to install the [following extension][2] (Or possibly other extensions) to re-enable the feature on your desktop. Otherwise, you won’t be able to see the indicator we are going to create here.

### Basic Code

Here’s the basic code of the indicator:

```
#!/usr/bin/python
import os
from gi.repository import Gtk as gtk, AppIndicator3 as appindicator

def main():
 indicator = appindicator.Indicator.new("customtray", "semi-starred-symbolic", appindicator.IndicatorCategory.APPLICATION_STATUS)
 indicator.set_status(appindicator.IndicatorStatus.ACTIVE)
 indicator.set_menu(menu())
 gtk.main()

def menu():
 menu = gtk.Menu()

 command_one = gtk.MenuItem('My Notes')
 command_one.connect('activate', note)
 menu.append(command_one)

 exittray = gtk.MenuItem('Exit Tray')
 exittray.connect('activate', quit)
 menu.append(exittray)

 menu.show_all()
 return menu

def note(_):
 os.system("gedit $HOME/Documents/notes.txt")

def quit(_):
 gtk.main_quit()

if __name__ == "__main__":
 main()
```

We’ll explain how the code works later. But for know, just save it in a text file under the name tray.py, and run it using Python:

```
python tray.py
```

You’ll see the indicator working as follows:

![Create a Custom System Tray Indicator For Your Tasks on Linux 13][3]

Now, to explain how we did the magic:

  * The first 3 lines of the code are nothing more than just specifying the Python path and importing the libraries we are going to use in our indicator.

  * def main() : This is the main function of the indicator. Under it we write the code to initialize and build the indicator.

  * indicator = appindicator.Indicator.new(“customtray”, “semi-starred-symbolic”, appindicator.IndicatorCategory.APPLICATION_STATUS) : Here we are specially creating a new indicator and calling it `customtray` . This is the special name of the indicator so that the system doesn’t mix it with other indicators that may be running. Also, we used the `semi-starred-symbolic` icon name as the default icon for our indicator. You could possibly change thing to any other things; Say `firefox` (if you want to see Firefox icon being used for the indicator), or any other icon name you would like. The last part regarding the `APPLICATION_STATUS` is just ordinary code for the categorization/scope of that indicator.

  * `indicator.set_status(appindicator.IndicatorStatus.ACTIVE)` : This line just turns the indicator on.

  * `indicator.set_menu(menu())` : Here, we are saying that we want to use the `menu()` function (which we’ll define later) for creating the menu items of our indicator. This is important so that when you click on the indicator, you can see a list of possible actions to take.

  * `gtk.main()` : Just run the main GTK loop.

  * Under `menu()` you’ll see that we are creating the actions/items we want to provide using our indicator. `command_one = gtk.MenuItem(‘My Notes’)` simply initializes the first menu item with the text “My notes”, and then `command_one.connect(‘activate’, note)` connects the `activate` signal of that menu item to the `note()` function defined later; In other words, we are telling our system here: “When this menu item is clicked, run the note() function”. Finally, `menu.append(command_one)` adds that menu item to the list.

  * The lines regarding `exittray` are just for creating an exit menu item to close the indicator any time you want.

  * `menu.show_all()` and `return menu` are just ordinary codes for returning the menu list to the indicator.

  * Under `note(_)` you’ll see the code that must be executed when the “My Notes” menu item is clicked. Here, we just wrote `os.system(“gedit $HOME/Documents/notes.txt”)` ; The `os.system` function is a function that allows us to run shell commands from inside Python, so here we wrote a command to open a file called `notes.txt` under the `Documents` folder in our home directory using the `gedit` editor. This for example can be your daily notes taking program from now on!

### Adding your Needed Tasks

There are only 2 things you need to touch in the code:

  1. Define a new menu item under `menu()` for your desired task.

  2. Create a new function to run a specific action when that menu item is clicked.


So, let’s say that you want to create a new menu item, which when clicked, plays a specific video/audio file on your hard disk using VLC? To do it, simply add the following 3 lines in line 17:

```
command_two = gtk.MenuItem('Play video/audio')
command_two.connect('activate', play)
menu.append(command_two)
```

And the following lines in line 30:

```
def play(_):
 os.system("vlc /home/<username>/Videos/somevideo.mp4")
```

Replace /home/<username>/Videos/somevideo.mp4 with the path to the video/audio file you want. Now save the file and run the indicator again:

```
python tray.py
```

This is how you’ll see it now:

![Create a Custom System Tray Indicator For Your Tasks on Linux 15][4]

And when you click on the newly-created menu item, VLC will start playing!

To create other items/tasks, simply redo the steps again. Just be careful to replace command_two with another name, like command_three, so that no clash between variables happen. And then define new separate functions like what we did with the play(_) function.

The possibilities are endless from here; I am using this way for example to fetch some data from the web (using the urllib2 library) and display them for me any time. I am also using it for playing an mp3 file in the background using the mpg123 command, and I am defining another menu item to killall mpg123 to stop playing that audio whenever I want. CS:GO on Steam for example takes a huge time to exit (the window doesn’t close automatically), so as a workaround for this, I simply minimize the window and click on a menu item that I created which will execute killall -9 csgo_linux64.

You can use this indicator for anything: Updating your system packages, possibly running some other scripts any time you want.. Literally anything.

### Autostart on Boot

We want our system tray indicator to start automatically on boot, we don’t want to run it manually each time. To do that, simply add the following command to your startup applications (after you replace the path to the tray.py file with yours):

```
nohup python /home/<username>/tray.py &
```

The very next time you reboot your system, the indicator will start working automatically after boot!

### Conclusion

You now know how to create your own system tray indicator for any task that you may want. This method should save you a lot of time depending on the nature and number of tasks you need to run on daily basis. Some users may prefer creating aliases from the command line, but this will require you to always open the terminal window or have a drop-down terminal emulator available, while here, the system tray indicator is always working and available for you.

Have you used this method to run your tasks before? Would love to hear your thoughts.


--------------------------------------------------------------------------------

via: https://fosspost.org/tutorials/custom-system-tray-icon-indicator-linux

作者：[M.Hanny Sabbagh][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fosspost.org/author/mhsabbagh
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/Screenshot-at-2019-02-28-0808.png?resize=407%2C345&ssl=1 (Create a Custom System Tray Indicator For Your Tasks on Linux 12)
[2]: https://extensions.gnome.org/extension/1031/topicons/
[3]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/03/Screenshot-at-2019-03-02-1041.png?resize=434%2C140&ssl=1 (Create a Custom System Tray Indicator For Your Tasks on Linux 14)
[4]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/03/Screenshot-at-2019-03-02-1141.png?resize=440%2C149&ssl=1 (Create a Custom System Tray Indicator For Your Tasks on Linux 16)
