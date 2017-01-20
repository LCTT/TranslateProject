[Improve your sleep by using Redshift on Fedora][1]
===============================================

 ![redshift](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/redshift-945x400.png) 

The blue light emitted by most electronic devices, is known for having a negative impact on our sleep. We could simply quit using each of our electronic devices after dark, as an attempt to improve our sleep. However, since that is not really convenient for most of us, a better way is to adjusts the color temperature of your screen according to your surroundings. One of the most popular ways to achieve this is with the Redshift utility. Jon Lund Steffensen , the creator of Redshift, describes his program in the following way:

> Redshift adjusts the color temperature of your screen according to your surroundings. This may help your eyes hurt less if you are working in front of the screen at night.

The Redshift utility only works in the X11 session on Fedora Workstation. So if you’re using Fedora 24, Redshift will work with the default login session. However, on Fedora 25, the default session at login is Wayland, so you will have to use the GNOME shell extension instead. Note, too that the GNOME Shell extension also works with X11 sessions.

### **Redshift utility**

#### Installation

Redshift is in the Fedora’s repos, and thus, all we have to do to install is run this command:

```
sudo dnf install redshift
```

The package also provides a GUI. To use this, install `redshift-gtk` instead. Remember, though, that the utility only works on X11 sessions.

#### Using the Redshift utility

Run the utility from the command line with a command like the following:

```
redshift -l 23.6980:133.8807 -t 5600:3400
```

In the above command, the_ -l 23.6980:133.8807 _means we are informing Redshift that our current location is 23.6980° S, 133.8807° E. The_ -t 5600:3400_ declares that during the day you want a colour temperature of 5600, and 3400 at night.

The temperature is proportional to the amount of blue light emitted: a lower temperature, implies a lower amount of blue light.  I prefer to use 5600K (6500K is neutral daylight) during the day, and 3400K at night (anything lower makes me feel like I’m staring at a tomato), but feel free to experiment with it.

If you don’t specify a location, Redshift attempts to use the Geoclue method in order to determine your location coordinates. If this method doesn’t work, you could use multiple [websites][2] and online maps to find the coordinates.

 ![screenshot1](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/screenshot1.png) 

Don’t forget to set Redshift as an autostart command, and to check [Jon’s website][3] for more information.

### Redshift GNOME Shell extension

The utility does not work when running the Wayland display server (which is standard in Fedora 25). Fortunately, there is a handy GNOME Shell extension that will do the same job. To install, run the the following commands`:`

```
sudo dnf copr enable mystro256/gnome-redshift
sudo dnf install gnome-shell-extension-redshift
```

After installing from the COPR repo, log out and log back in of your Fedora Workstation, then enable it in the GNOME Tweak tool. For more information, check the gnome-redshift [copr repo][4], or the [github repo][5].

After enabling the extension, a little sun (or moon) icon appears in the top right of your GNOME shell. The extension also provides a settings dialog to tweak the times of the redshift and the temperature.

 ![screenshot-from-2017-01-18-15-21-47](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/Screenshot-from-2017-01-18-15-21-47.jpg) 

### Relative software

#### F.lux

Redshift could be seen as the open-source variant of F.lux. There is a [linux version of F.lux][6] now. You could consider using it if you don’t mind using closed-source software, or if Redshift doesn’t work properly.

#### Twilight for Android

Twilight is similar to Redshift, but for Android. It makes reading on your smartphone or tablet late at night more comfortable.

#### Redshift plasmoid

This is the Redshift GUI version for KDE. You can find more information on [github][7].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/safe-eyes-redshift/

作者：[novel][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://novel.id.fedoraproject.org/
[1]:https://fedoramagazine.org/safe-eyes-redshift/
[2]:http://www.latlong.net/
[3]:http://jonls.dk/redshift/
[4]:https://copr.fedorainfracloud.org/coprs/mystro256/gnome-redshift/
[5]:https://github.com/benzea/gnome-shell-extension-redshift
[6]:https://justgetflux.com/linux.html
[7]:https://github.com/simgunz/redshift-plasmoid
