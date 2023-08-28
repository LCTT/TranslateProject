[#]: subject: "Using Your Phone as Camera and Mic in Ubuntu Linux"
[#]: via: "https://itsfoss.com/ubuntu-phone-camera-mic/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using Your Phone as Camera and Mic in Ubuntu Linux
======

Like many other Linux users, I use a desktop and unlike a laptop, you don't get a camera and mic pre-installed.

And you have to invest in a premium webcam to match the quality of your modern smartphone.

Well, in this tutorial, I will walk you through step-by-step how you can use your phone as a mic and camera which can be used in online meetings.

### Use the phone's camera and mic in Ubuntu

🚧

This tutorial utilizes a third-party website <https://vdo.ninja/> to host audio and video. Thus, it is not a completely open source solution.

Here, I will guide you through the following:

  * Installation of OBS (if you haven't)
  * Generate invite through `vdo.ninja`
  * Setup virtual audio cable (for audio output)
  * Configure OBS to redirect audio and video from `vdo.ninja`



So let's start with the first one.

📋

I have used Ubuntu in the tutorial. However, I believe that the same can be achieved on other distributions as well. You just have to install the needed packages for your distro and it should work. I let you experiment.

#### 1\. Install OBS in Ubuntu

OBS (Open Broadcaster Software) is one of the best software for recording and streaming videos and most streamers use OBS to live stream on digital platforms.

The good thing is OBS is available in the default repository of Ubuntu and can be installed using the following command:

```

    sudo apt install obs-studio

```

#### 2\. Generate an invite through VDO.ninja

In this section, I will show you how you can generate an invite to stream your audio and video over vdo.ninja and how you can start streaming from your phone.

First, go to [VDO.ninja][1] and click on `Create Reusable Invite`:

![][2]

It will show you multiple options such as quality settings, adding video effects, etc. I recommend using the default settings as you may need faster processing and more bandwidth for high-quality videos:

And to create a link, all you have to do is click on `GENERATE THE INVITE LINK` button:

![][3]

And it will show you the following:

  * A QR code that you have to scan through your phone (alternatively, you can also use the link).
  * Link for the OBS.



**I will cover the OBS part later on this tutorial so please don't close the window.**

First, scan the QR code from your smartphone and it will redirect you to another page of the VDO.ninja where you have to select the following:

  * Select `Share your Camera` option.
  * You can choose a front or rear camera from the video source (the front will be selected by default).
  * Hit the `Start` button and it will start the streaming on the OBS link.



![][4]

#### 3\. Setup a virtual cable for OBS on Ubuntu

🚧

The method will only work with the PulseAudio and the virtual cable will be flushed out once you reboot.

First, let's talk about what is virtual cable and why you need it to use your phone as a camera and mic.

The virtual cable is software used for transfering audio streams from one application to another.

But the sad part is that it is only available for Windows and macOS.

Hmmmm???? So why am I writing this?

The answer is simple. I found a workaround to this where you can have the same functionality as a virtual cable for **the current session**.

To set up a virtual cable, first, you have to load the `module-null-sink` module using the following command:

```

    pactl load-module module-null-sink sink_name=Source

```

And then, execute the given command to create a virtual audio source named `VirtualMic`:

```

    pactl load-module module-virtual-source source_name=VirtualMic master=Source.monitor

```

Both commands will return some numbers that you don't have to worry about.

Now, go to the system settings, and there you will find settings for sound:

![][5]

Next, go to the `Input` section and there, you will find the option to choose an input device.

Chose `VirtualMic` as an input device:

![][6]

That's it!

But as I said earlier, once you reboot the effect of virtual audio will be flushed and if you regularly want to use your phone as a camera and mic, it can be inconvenient.

To cater to this, you can [create an alias][7] for those two commands. For example, you can create aliases for both commands: vc1 and vc2.

Once done, you can [execute both commands at once][8] like this: `vc1 && vc2`.

#### 4\. Setup OBS to stream audio and video from the phone

First, open the VDO.ninja tab that I told you not to close and copy the OBS link:

![][9]

Once copied, open OBS, and under the `Sources` section, you will find a ➕ (plus) button. Click that button and select `Browser`.

It will open a little prompt to create/select a source. Simply press the `OK` button:

![][10]

Finally, paste the link in the `URL` field:

![][11]

And soon, you will see OBS using your phone's camera:

![][12]

But there are a few extra steps to get audio from your phone.

First, click on the `File` and choose `Settings`:

![][13]

There, Choose `Audio` and look for the `Advanced` section.

In the Advanced section, you will find an option for `Monitoring Device` and there you have to choose `Souce Audio/Sink sink`:

![][14]

Apply the changes.

For most users, the audio should be working by now. But if yours don't then here's how you can make it work.

In the Audio Mixer section, it will be either the `Browser` or the `Desktop Audio` , or you may also see both of them.

Click on those three dots for Desktop Audio or Browser (in my case, it's Desktop Audio) and choose `Advanced Audio Properties`:

![][15]

From there, choose `Monitor and Output` for the Browser and Desktop Audio:

![][16]

And that's it! You can enjoy the camera and mic from your phone.

#### 5\. Test the whole setup

To test this, I used my phone as a camera and mic in our book club's weekly meeting and it worked flawlessly.

![][17]

As you can see, the above image indicates a working mic and camera (which brought a smile to my face 😸).

The video quality depends on the internet bandwidth so make sure you have a good connection before starting an important meeting.

### Wrapping Up...

I'm one of those desktop users who don't have access to a camera and mic and have to rely on a laptop or mobile for office meetings and I was irritated by that.

Remember, you have to create a virtual cable every time you reboot, but it won't take much time as it takes two command executions.

Have used this solution multiple times and it worked every time I put it to the test. I really hope you will have the same output.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-phone-camera-mic/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://vdo.ninja/
[2]: https://itsfoss.com/content/images/2023/08/Click-on-create-reusable-Invite-button.png
[3]: https://itsfoss.com/content/images/2023/08/Click-on-the-generate-invite-link-button.png
[4]: https://itsfoss.com/content/images/2023/08/setup-vdo.ninja-on-phone.png
[5]: https://itsfoss.com/content/images/2023/08/Open-sound-settings.png
[6]: https://itsfoss.com/content/images/2023/08/Choose-virtul-mic-as-an-audio-input-in-Linux-to-use-phone-s-camera-and-mic-.png
[7]: https://linuxhandbook.com/linux-alias-command/
[8]: https://linuxhandbook.com/run-multiple-commands/
[9]: https://itsfoss.com/content/images/2023/08/Copy-link-for-OBS.png
[10]: https://itsfoss.com/content/images/2023/08/Create-new-source-for-streaming-in-OBS-to-use-camera-and-mic-of-your-phone-in-Ubuntu-1.png
[11]: https://itsfoss.com/content/images/2023/08/Paste-VDO.ninja-link-in-OBS-to-use-your-phone-s-camera-and-mic-in-Ubuntu-Linux.png
[12]: https://itsfoss.com/content/images/2023/08/Stream-audio-and-video-from-your-phone-to-Ubuntu-Linux-using-OBS.png
[13]: https://itsfoss.com/content/images/2023/08/Open-settings-in-OBS.png
[14]: https://itsfoss.com/content/images/2023/08/Choose-virtual-audio-in-OBS-to-use-phone-s-mic-in-ubuntu-Linux.png
[15]: https://itsfoss.com/content/images/2023/08/Choose-advanced-option-to-use-audio-from-phone-in-Ubuntu-linux-using-OBS.png
[16]: https://itsfoss.com/content/images/2023/08/Enable-monitor-and-output-for-OBS.png
[17]: https://itsfoss.com/content/images/2023/08/Using-phone-s-camera-and-mic-in-Ubuntu-Linux.png
