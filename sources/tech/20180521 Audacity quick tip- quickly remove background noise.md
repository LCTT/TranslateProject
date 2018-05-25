translating---geekpi

Audacity quick tip: quickly remove background noise
======

![](https://fedoramagazine.org/wp-content/uploads/2018/03/audacity-noise-816x345.png)
When recording sounds on a laptop — say for a simple first screencast — many users typically use the built-in microphone. However, these small microphones also capture a lot of background noise. In this quick tip, learn how to use [Audacity][1] in Fedora to quickly remove the background noise from audio files.

### Installing Audacity

Audacity is an application in Fedora for mixing, cutting, and editing audio files. It supports a wide range of formats out of the box on Fedora — including MP3 and OGG. Install Audacity from the Software application.

![][2]

If the terminal is more your speed, use the command:
```
sudo dnf install audacity

```

### Import your Audio, sample background noise

After installing Audacity, open the application, and import your sound using the **File > Import** menu item. This example uses a [sound bite from freesound.org][3] to which noise was added:

Next, take a sample of the background noise to be filtered out. With the tracks imported, select an area of the track that contains only the background noise. Then choose **Effect > Noise Reduction** from the menu, and press the **Get Noise Profile** button.

![][4]

### Filter the Noise

Next, select the area of the track you want to filter the noise from. Do this either by selecting with the mouse, or **Ctrl + a** to select the entire track. Finally, open the **Effect > Noise Reduction** dialog again, and click OK to apply the filter.

![][5]

Additionally, play around with the settings until your tracks sound better. Here is the original file again, followed by the noise reduced track for comparison (using the default settings):

https://ryanlerch.fedorapeople.org/sidebyside.ogg?_=2

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/audacity-quick-tip-quickly-remove-background-noise/

作者：[Ryan Lerch][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/introducing-flatpak/
[1]:https://www.audacityteam.org/
[2]:https://fedoramagazine.org/wp-content/uploads/2018/03/audacity-software.jpg
[3]:https://freesound.org/people/levinj/sounds/8323/
[4]:https://fedoramagazine.org/wp-content/uploads/2018/03/select-noise-profile.gif
[5]:https://fedoramagazine.org/wp-content/uploads/2018/03/apply-filter.gif
