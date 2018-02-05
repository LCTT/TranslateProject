translating by lujun9972
How to Play Sound Through Two or More Output Devices in Linux
======

![](https://www.maketecheasier.com/assets/uploads/2018/01/output-audio-multiple-devices-featured.jpg)

Handling audio in Linux can be a pain. Pulseaudio has made it both better and worse. While some things work better than they did before, other things have become more complicated. Handling audio output is one of those things.

If you want to enable multiple audio outputs from your Linux PC, you can use a simple utility to enable your other sound devices on a virtual interface. It's a lot easier than it sounds.

In case you're wondering why you'd want to do this, a pretty common instance is playing video from your computer on a TV and using both the PC and TV speakers.

### Install Paprefs

The easiest way to enable audio playback from multiple sources is to use a simple graphical utility called "paprefs." It's short for PulseAudio Preferences.

It's available through the Ubuntu repositories, so just install it with Apt.
```
sudo apt install paprefs
```

When the install finishes, you can just launch the program.

### Enable Dual Audio Playback

Even though the utility is graphical, it's still probably easier to launch it by typing `paprefs` in the command line as a regular user.

The window that opens has a few tabs with settings that you can tweak. The tab that you're looking for is the last one, "Simultaneous Output."

![Paprefs on Ubuntu][1]

There isn't a whole lot on the tab, just a checkbox to enable the setting.

Next, open up the regular sound preferences. It's in different places on different distributions. On Ubuntu it'll be under the GNOME system settings.

![Enable Simultaneous Audio][2]

Once you have your sound preferences open, select the "Output" tab. Select the "Simultaneous output" radio button. It's now your default output.

### Test It

To test it, you can use anything you like, but music always works. If you are using a video, like suggested earlier, you can certainly test it with that as well.

If everything is working well, you should hear audio out of all connected devices.

That's all there really is to do. This works best when there are multiple devices, like the HDMI port and the standard analog output. You can certainly try it with other configurations, too. You should also keep in mind that there will only be a single volume control, so adjust the physical output devices accordingly.


--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/play-sound-through-multiple-devices-linux/

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/nickcongleton/
[1]:https://www.maketecheasier.com/assets/uploads/2018/01/sa-paprefs.jpg (Paprefs on Ubuntu)
[2]:https://www.maketecheasier.com/assets/uploads/2018/01/sa-enable.jpg (Enable Simultaneous Audio)
[3]:https://depositphotos.com/89314442/stock-photo-headphones-on-speakers.html
