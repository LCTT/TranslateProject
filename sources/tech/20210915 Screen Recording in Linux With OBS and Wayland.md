[#]: subject: "Screen Recording in Linux With OBS and Wayland"
[#]: via: "https://itsfoss.com/screen-record-obs-wayland/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Screen Recording in Linux With OBS and Wayland
======

There are [tons of screen recorders available for Linux][1]. But when it comes to supporting [Wayland][2], almost all of them do not work.

This is problematic because many new distribution releases are switching to Wayland display manager by default once again. And if something as basic as a screen recorder does not work, it leaves a bad experience.

[GNOME’s built-in screen recorder][3] works but it is hidden, has no GUI and no way to configure and control the recordings. There is another tool called [Kooha][4] but it keeps on displaying a timer on the screen.

[Switching between Xorg and Wayland][5] just for screen recording is not very convenient.

Amidst all this, I was happy to learn that Wayland support landed in OBS Studio with version 27 release thanks to Pipewire. But even there, it’s not straightforward and hence I am going to show you the steps for screen recording on Wayland using [OBS Studio][6].

### Using OBS to screen record on Wayland

![][7]

Let’s see how it is done.

#### Step 1: Install OBS Studio

You should install OBS Studio version 27 first. It is already included in Ubuntu 21.10 which I am suing in this tutorial.

To install OBS Studio 27 on Ubuntu 18.04, 20.04, Linux Mint 20 etc, use the [official OBS Studio][8] [][8][PPA][8].

Open a terminal and use the following commands one by one:

```
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install obs-studio
```

If there is an older version of OBS Studio installed already, it will be upgraded to the newer version.

For Fedora, Arch and other distributions, please check your package manager or unofficial repositories for installing the latest version of OBS Studio.

#### Step 2: Check if Wayland capture is working

Please make sure that you are using Wayland. Now start OBS Studio and go through all the stuff it shows on the first run. I am not going to show that.

The main step is to add Pipewire as a screen capture source. Click on the + symbol under the Sources list.

![Add screen capture source in OBS Studio][9]

Do you see anything that reads Screen Capture (PipeWire)?

![Do you see PipeWire option in the screen sources?][10]

**If the answer is no, quit OBS Studio**. This is normal. OBS Studio does not switch to use Wayland automatically in Ubuntu at least. There is a fix for that.

Open a terminal and use the following command:

```
export QT_QPA_PLATFORM=wayland
```

In the same terminal, run the following command to start OBS Studio:

```
obs
```

It will show some message on the terminal. Ignore them. Your focus should be on the OBS Studio GUI. Try to add screen capture once again. You should see the PipeWire option now.

![][10]

You explicitly asked OBS Studio to use Wayland this time with the QT_QPA_PLATFORM variable.

Select PipeWire as the source and then it asks you to choose a display screen. Select it and click on the Share button.

![][11]

Now it should show your screen recursively infinite number of times. If you see that, you could start recording the screen in Wayland now.

![][12]

#### Step 3: Make changes permanent

That was good. You just verified that you can record your screen on Wayland. But setting the environment variable and starting OBS from the terminal each time is not convenient.

What you can do is to **export the variable to your ~/.bash_profile (for you) or /etc/profile (for all users on the system).**

```
export QT_QPA_PLATFORM=wayland
```

Log out and log back in. Now OBS will automatically start using this parameter and you can use it to record your screen in Wayland.

I hope you find this quick tip helpful. If you still have questions or suggestions, please let me know in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/screen-record-obs-wayland/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-screen-recorders/
[2]: https://wayland.freedesktop.org/
[3]: https://itsfoss.com/gnome-screen-recorder/
[4]: https://itsfoss.com/kooha-screen-recorder/
[5]: https://itsfoss.com/switch-xorg-wayland/
[6]: https://obsproject.com/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/obs-screen-record-wayland.webp?resize=800%2C450&ssl=1
[8]: https://launchpad.net/~obsproject/+archive/ubuntu/obs-studio
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/obs-studio-add-screen-capture-source.png?resize=800%2C537&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/obs-studio-wayland-support.png?resize=800%2C538&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/obs-studio-screen.png?resize=800%2C578&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/start-screen-recording-obs-wayland.jpg?resize=800%2C537&ssl=1
