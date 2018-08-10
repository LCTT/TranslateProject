Automatically Switch To Light / Dark Gtk Themes Based On Sunrise And Sunset Times With AutomaThemely
======
If you're looking for an easy way of automatically changing the Gtk theme based on sunrise and sunset times, give [AutomaThemely][3] a try.

![](https://4.bp.blogspot.com/-LS0XNNflbp0/W2q8zAwhUdI/AAAAAAAABUY/l8fVbjt-tHExYxPHsyVv74iUhV4O9UXLwCLcBGAs/s640/automathemely-settings.png)

**AutomaThemely is a Python application that automatically changes Gnome themes according to light and dark hours, useful if you want to use a dark Gtk theme at night and a light Gtk theme during the day.**

**While the application is made for the Gnome desktop, it also works with Unity**. AutomaThemely does not support changing the Gtk theme for desktop environments that don't make use of the `org.gnome.desktop.interface Gsettings` , like Cinnamon, or changing the icon theme, at least not yet. It also doesn't support setting the Gnome Shell theme.

Besides automatically changing the Gtk3 theme, **AutomaThemely can also automatically switch between dark and light themes for Atom editor and VSCode, as well as between light and dark syntax highlighting for Atom editor.** This is obviously also done based the time of day.

[![AutomaThemely Atom VSCode][1]][2] 
AutomaThemely Atom and VSCode theme / syntax settings

The application uses your IP address to determine your location in order to retrieve the sunrise and sunset times, and requires a working Internet connection for this. However, you can disable automatic location from the application user interface, and enter your location manually.

From the AutomaThemely user interface you can also enter a time offset (in minutes) for the sunrise and sunset times, and enable or disable notifications on theme changes.

### Downloading / installing AutomaThemely

**Ubuntu 18.04** : using the link above, download the Python 3.6 DEB which includes dependencies (python3.6-automathemely_1.2_all.deb).

**Ubuntu 16.04:** you'll need to download and install the AutomaThemely Python 3.5 DEB which DOES NOT include dependencies (python3.5-no_deps-automathemely_1.2_all.deb), and install the dependencies (`requests` , `astral` , `pytz` , `tzlocal` and `schedule`) separately, using PIP3:
```
sudo apt install python3-pip
python3 -m pip install --user requests astral pytz tzlocal schedule

```

The AutomaThemely download page also includes RPM packages for Python 3.5 or 3.6, with and without dependencies. Install the package appropriate for your Python version. If you download the package that includes dependencies and they are not available on your system, grab the "no_deps" package and install the Python3 dependencies using PIP3, as explained above.

### Using AutomaThemely to change to light / dark Gtk themes based on Sun times

Once installed, run AutomaThemely once to generate the configuration file. Either click on the AutomaThemely menu entry or run this in a terminal:
```
automathemely

```

This doesn't run any GUI, it only generates the configuration file.

Using AutomaThemely is a bit counter intuitive. You'll get an AutomaThemely icon in your menu but clicking it does not open any window / GUI. If you use Gnome or some other Gnome-based desktop that supports jumplists / quicklists, you can right click the AutomaThemely icon in the menu (or you can pin it to Dash / dock and right click it there) and select Manage Settings to launch the GUI:

![](https://2.bp.blogspot.com/-7YWj07q0-M0/W2rACrCyO_I/AAAAAAAABUs/iaN_LEyRSG8YGM0NB6Aw9PLKmRU4NxzMACLcBGAs/s320/automathemely-jumplists.png)

You can also launch the AutomaThemely GUI from the command line, using:
```
automathemely --manage

```

**Once you configure the themes you want to use, you'll need to update the Sun times and restart the AutomaThemely scheduler**. You can do this by right clicking on the AutomaThemely icon (should work in Unity / Gnome) and selecting `Update sun times` , and then `Restart the scheduler` . You can also do this from a terminal, using these commands:
```
automathemely --update
automathemely --restart

```


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/automatically-switch-to-light-dark-gtk.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://4.bp.blogspot.com/-K2-1K_MIWv0/W2q9GEWYA6I/AAAAAAAABUg/-z_gTMSHlxgN-ZXDvUGIeTQ8I72WrRq0ACLcBGAs/s640/automathemely-settings_2.png (AutomaThemely Atom VSCode)
[2]:https://4.bp.blogspot.com/-K2-1K_MIWv0/W2q9GEWYA6I/AAAAAAAABUg/-z_gTMSHlxgN-ZXDvUGIeTQ8I72WrRq0ACLcBGAs/s1600/automathemely-settings_2.png
[3]:https://github.com/C2N14/AutomaThemely
