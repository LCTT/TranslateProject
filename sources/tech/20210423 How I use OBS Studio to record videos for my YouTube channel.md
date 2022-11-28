[#]: subject: (How I use OBS Studio to record videos for my YouTube channel)
[#]: via: (https://opensource.com/article/21/4/obs-youtube)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How I use OBS Studio to record videos for my YouTube channel
======
Install, configure, and use Open Broadcaster Software to record how-to,
promotional, and other types of videos.
![Person using a laptop][1]

I manage a [YouTube channel for the FreeDOS Project][2], where I record "how-to" videos with FreeDOS running inside the [QEMU][3] PC emulator software. When I started the channel in August 2019, I didn't know anything about recording videos. But with [Open Broadcaster Software][4], also called OBS Studio, I've found recording these videos to be pretty straightforward. Here's how you can do it, too.

### Install OBS Studio

I run Fedora Linux, which doesn't include the OBS Studio software by default. Fortunately, the OBS Studio website has an [installation guide][5] that walks you through the steps to install OBS Studio via the RPM Fusion alternative repository.

If you don't already have RPM Fusion set up on your system, you can add the repository on Fedora using this one-line command:


```
`$ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`
```

Once the RPM Fusion repo is set up, you can install OBS Studio with this command:


```
`$ sudo dnf install obs-studio`
```

If you have an NVIDIA graphics card, there's an extra step in the installation guide to install hardware-accelerated video support. But my graphics card is from Intel, so I don't need to run the extra steps.

However, OBS Studio does not support [Wayland][6], at least not in the Fedora build. That means when I want to record videos with OBS Studio, I need to log into my GNOME desktop [using an Xorg session][7]. On the login screen, enter your password, click on the gear-shaped icon in the lower-right corner, and select **GNOME on Xorg**.

### Configure OBS Studio

The first time you launch OBS Studio, the software runs an auto-configuration wizard to determine the best settings for recording videos. This makes setup a breeze. If you're recording videos on the desktop, like I am, then click the **Optimize just for recording** radio button and click **Next**.

![OBS Studio configuration][8]

(Jim Hall, [CC BY-SA 4.0][9])

OBS Studio will run through a series of automated tests before it confirms the best video settings for your system. On my system, that's 1920x1080 at 30 frames per second (fps), which is good enough for recording my videos.

![OBS Studio configuration][10]

(Jim Hall, [CC BY-SA 4.0][9])

#### My setup

The default OBS Studio interface shows the video front and center and positions the controls at the bottom of the screen. While this is not a bad default arrangement, you can see in my early videos that I occasionally look away from the camera as I change from a full-screen webcam video to my QEMU screen. That's because the default OBS Studio configuration places the **Scene controls** in the lower-left corner.

![OBS Studio configuration][11]

(Jim Hall, [CC BY-SA 4.0][9])

Breaking virtual eye contact like this is distracting, so I wanted another way to change scenes without looking for the scene controls. I discovered that I could click and drag the OBS Studio controls to different areas on the screen. By positioning the scene controls at the top of the screen, near my computer's webcam, I don't need to look away from the camera to change scenes.

![OBS Studio configuration][12]

(Jim Hall, [CC BY-SA 4.0][9])

So, my first step whenever I set up OBS Studio is to drag the controls to the top of the screen. I like to place the **Scene selector panel** in the middle, so I don't have to look very far away from my camera to change scenes. I keep the recording controls to one side because I'm never on camera when I start or stop the video, so it doesn't matter if I look away to start or stop my video recording.

![OBS Studio configuration][13]

(Jim Hall, [CC BY-SA 4.0][9])

### Setting up scenes

You can set up OBS Studio to support your preferred video style. When I started recording videos, I watched other how-to videos to see how they were organized. Most start with a brief introduction by the host, then switch to a hands-on demonstration, and end with a "thank you" screen to advertise the channel. I wanted to create my videos similarly, and you can do that with scenes.

Each scene is a different arrangement of **sources**, or elements in the video. Each source is like a layer, so if you have multiple image or video sources, they will appear to stack on top of one another.

How you define your scenes depends on the kind of video you want to make. I do a lot of hands-on demonstration videos, so I have one scene with a full-screen webcam video, another scene that's just a QEMU window, and yet another scene that's "picture-in-picture" with me over my QEMU screen. I can also set up separate scenes that show a "thank you" image and links to subscribe to my channel or to join the project on social media.

With these scenes, I can record my videos as Live—meaning I don't need to edit them afterward. I can use the Scene controls in OBS Studio to switch from the **QEMU** scene to the **Full-screen webcam** screen and back to the **QEMU** screen before wrapping up with separate scenes that thank my supporters and share information about my channel. That may sound like a lot of work, but once you have the scenes set up, changing scenes is just clicking an item in the Scenes menu. That's why I like to center the Scene selector at the top of the screen, so I can easily select the scene I need.

Here's what I use to record my videos and how I set up the sources in each:

  * **Full-screen webcam:** I set up a webcam source from my Vitade webcam as a **video capture device** (V4L) and use the **Transform** menu (right-click) to fit the webcam to the screen. This also uses my Yeti microphone for sound as an **audio input capture** (PulseAudio).

  * **QEMU:** This is where I spend most of my time in my videos. OBS Studio can use any window as a source, and I define my QEMU window as a **window capture** (Xcomposite) source. In case I need to reboot the virtual machine while I'm recording a video, I also set a Color Bars image as a background image on a layer that's "behind" the window. This also uses my Yeti microphone for sound as an **audio input capture** (PulseAudio).

  * **QEMU + webcam:** My viewers tell me they like to see me on camera while I'm showing things in my QEMU window, so I defined another scene that combines the **QEMU** and **Full-screen webcam** scenes. My webcam is a small rectangle in one corner of the screen.

  * **Patreon card:** At the end of my videos, I thank the people who support me on Patreon. I created a striped pattern in GIMP and set that as my background image. I then defined a **text** source where I entered a "thank you" message and a list of my patrons. As before, I set my Yeti microphone for sound as an **audio input capture** (PulseAudio).

  * **End card:** As I wrap up the video, I want to encourage viewers to visit our website or join us on social media. Similar to the Patreon card scene, I use a background pattern that already includes my text and icons. But to add a little visual flair, I created a blinking cursor after our URL, as though someone had typed it in. This cursor is not actually an animation but an **image slideshow** source that uses two images: a blank rectangle and a rectangle with a cursor. The image slideshow flips between these two images, creating the appearance of a blinking cursor.




![OBS Studio configuration][14]

(Jim Hall, [CC BY-SA 4.0][9])

### And action!

Once I create my scene collection, I'm ready to record my videos. I usually start by talking over my QEMU window, so I click on the **QEMU** scene and then click the **Start Recording** button. After I've said a few words to set the stage for my video, I click on the **Full-screen webcam** scene to fully introduce the topic.

After sharing some information about whatever I'm talking about in the video, I click on the **QEMU** scene or the **QEMU + webcam** scene. Which scene I choose depends on whether I need to be seen during the video or if the "picture-in-picture" video will obscure important text on the screen. I spend most of the how-to video in this scene, usually while playing a game, demonstrating a program, or writing a sample program.

When I'm ready to wrap up, I click on the **Patreon card** scene to thank everyone who supports me on Patreon. Some patrons support me at a higher level, and they get a specific mention and their name listed on the screen. Then, I click on the **End card** scene to encourage viewers to visit our website, join us on Facebook, follow us on Twitter, and consider supporting me on Patreon. Finally, I click the **Stop Recording** button, and OBS Studio stops the video.

Using OBS Studio is a great way to record videos. I've used this same method to record other videos, including pre-recorded conference talks, welcome videos for a remote symposium, and virtual lecture videos when I teach an online class.

The next time you need to record a video, try OBS Studio. I think you'll find it easy to learn and use.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/obs-youtube

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://www.youtube.com/freedosproject
[3]: https://www.qemu.org/
[4]: https://obsproject.com/
[5]: https://obsproject.com/wiki/install-instructions#linux
[6]: https://wayland.freedesktop.org/
[7]: https://docs.fedoraproject.org/en-US/quick-docs/configuring-xorg-as-default-gnome-session/
[8]: https://opensource.com/sites/default/files/uploads/obs-setup-02.png (OBS Studio configuration)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/obs-setup-09.png (OBS Studio configuration)
[11]: https://opensource.com/sites/default/files/uploads/obs-setup-10.png (OBS Studio configuration)
[12]: https://opensource.com/sites/default/files/uploads/obs-setup-11.png (OBS Studio configuration)
[13]: https://opensource.com/sites/default/files/uploads/obs-setup-12.png (OBS Studio configuration)
[14]: https://opensource.com/sites/default/files/uploads/obs-setup-18.png (OBS Studio configuration)
