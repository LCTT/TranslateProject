How to set GNOME to display a custom slideshow
======
A very cool, yet lesser known, feature in GNOME is its ability to display a slideshow as your wallpaper. You can select a wallpaper slideshow from the background settings panel in the [GNOME Control Center][1]. Wallpaper slideshows can be distinguished from static wallpapers by a small clock emblem displayed in the lower-right corner of the preview.

Some distributions come with pre-installed slideshow wallpapers. For example, Ubuntu includes the stock GNOME timed wallpaper slideshow, as well as one of Ubuntu wallpaper contest winners.

What if you want to create your own custom slideshow to use as a wallpaper? While GNOME doesn't provide a user interface for this, it's quite simple to create one using some simple XML files in your home directory. Fortunately, the background selection in the GNOME Control Center honors some common directory paths, which makes it easy to create a slideshow without having to edit anything provided by your distribution.

### Getting started

Using your favorite text editor, create an XML file in `$HOME/.local/share/gnome-background-properties/`. Although the filename isn't important, the directory name matters (and you'll probably have to create the directory). For my example, I created `/home/ken/.local/share/gnome-background-properties/osdc-wallpapers.xml `with the following content:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
 <wallpaper deleted="false">
   <name>Opensource.com Wallpapers</name>
   <filename>/home/ken/Pictures/Wallpapers/osdc/osdc.xml</filename>
   <options>zoom</options>
 </wallpaper>
</wallpapers>
```

The above XML file needs a `<wallpaper>` stanza for each slideshow or static wallpaper you want to include in the `backgrounds` panel of the GNOME Control Center.

In this example, my `osdc.xml` file looks like this:

```
<?xml version="1.0" ?>
<background>
  <static>
    <!-- Duration in seconds to display the background -->
    <duration>30.0</duration>
    <file>/home/ken/Pictures/Wallpapers/osdc/osdc_2.png</file>
  </static>
  <transition>
    <!-- Duration of the transition in seconds, default is 2 seconds -->
    <duration>0.5</duration>
    <from>/home/ken/Pictures/Wallpapers/osdc/osdc_2.png</from>
    <to>/home/ken/Pictures/Wallpapers/osdc/osdc_1.png</to>
  </transition>
  <static>
    <duration>30.0</duration>
    <file>/home/ken/Pictures/Wallpapers/osdc/osdc_1.png</file>
  </static>
  <transition>
    <duration>0.5</duration>
    <from>/home/ken/Pictures/Wallpapers/osdc/osdc_1.png</from>
    <to>/home/ken/Pictures/Wallpapers/osdc/osdc_2.png</to>
  </transition>
</background>
```

There are a few important pieces in the above XML. The `<background>` node in the XML is your outer node. Each background supports multiple `<static>` and `<transition>` nodes.

The `<static>` node defines an image to be displayed and the duration to display it with `<duration>` and `<file>` nodes, respectively.

The `<transition>` node defines the `<duration>`, the `<from>` image, and the `<to>` image for each transition.

### Changing wallpaper throughout the day

Another cool GNOME feature is time-based slideshows. You can define the start time for the slideshow and GNOME will calculate times based on it. This is useful for setting different wallpapers based on the time of day. For example, you could set the start time to 06:00 and display one wallpaper until 12:00, then change it for the afternoon, and again at 18:00.

This is accomplished by defining the `<starttime>` in your XML like this:
```
<starttime>
    <!-- A start time in the past is fine -->
    <year>2017</year>
    <month>11</month>
    <day>21</day>
    <hour>6</hour>
    <minute>00</minute>
    <second>00</second>
  </starttime>
```

The above XML started the animation at 06:00 on November 21, 2017, with a duration of 21,600.00, equal to six hours. This displays your morning wallpaper until 12:00, at which time it changes to your next wallpaper. You can continue in this manner to change the wallpaper at any intervals you'd like throughout the day, but ensure the total of all your durations is 86,400 seconds (equal to 24 hours).

GNOME will calculate the delta between the start time and the current time and display the correct wallpaper for the current time. For example, if you select your new wallpaper at 16:00, GNOME will display the proper wallpaper for 36,000 seconds past the start time of 06:00.

For a complete example, see the adwaita-timed slideshow provided by the gnome-backgrounds package in most distributions. It's usually found in `/usr/share/backgrounds/gnome/adwaita-timed.xml`.

### For more information

Hopefully this encourages you to take a dive into creating your own slideshow wallpapers. If you would like to download complete versions of the files referenced in this article, they can be found on [GitHub][2].

If you're interested in utility scripts for generating the XML files, you can do an internet search for gnome-background-generator.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/create-your-own-wallpaper-slideshow-gnome

作者：[Ken Vandine][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/kenvandine
[1]:http://manpages.ubuntu.com/manpages/xenial/man1/gnome-control-center.1.html
[2]:https://github.com/kenvandine/misc/tree/master/articles/osdc/gnome/slide-show-backgrounds/osdc
