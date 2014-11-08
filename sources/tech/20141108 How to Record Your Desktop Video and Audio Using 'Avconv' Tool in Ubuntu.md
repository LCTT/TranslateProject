How to Record Your Desktop Video and Audio Using “Avconv” Tool in Ubuntu
================================================================================
**Libav** is a set of cross-platform libraries and tools that are used to deal with multimedia files, streams and protocols, it was originally forked from the ffmpeg project. Libav includes many sub-tools like:

- **Avplay**: a video & audio player.
- **Avconv**: a multimedia converter plus a video & audio recorder from different sources.
- **Avprobe**: a tool that connects to the multimedia file stream and returns many useful information and statistics about it.
- **Libavfilter**: a filtering API for different Libav tools.

In this article, we’ll explain how to record the Linux desktop’s video & audio using the ‘Avconv’ program on **Debian/Ubuntu/Linux Mint** distributions.

### Step 1: Installing Avconv Tool ###

**1.** **avconv** is a part from the “**libav-tools**” package, which is available to install from the official repositories for all Debian-based distributions like Ubuntu and Mint, using following commands.

    $ sudo apt-get update
    $ sudo apt-get install libav-tools

![Install Avconv Tool](http://www.tecmint.com/wp-content/uploads/2014/11/Install-avconv-tool.jpeg)

Install Avconv Tool

**Note**: Installing packages from default repositories, might give you a little older version of ‘**avconv**‘ tool. Thus, we recommend you to get the latest version from the official git repository, as shown below.

    $ sudo apt-get install yasm
    $ git clone git://git.libav.org/libav.git
    $ cd libav
    $ ./configure
    $ make
    $ sudo make install

**Note**: You will have to run “**./configure –help**” in order to list all the available options for the configuration file and install codecs and libraries that you want, you will also need to do a lot of work in order to install the dependencies.

Also note, if you’re used the compile-from-source way, you’ll always have to use “**sudo avconv**” instead of “**avconv**” to run the tool.

### Step 2: Start Video Recording of Desktop ###

**2.** You’re ready now, all what you have to do is to record your desktop video by issuing following command.

    $ avconv -f x11grab -r 25 -s 1920x1080 -i :0.0 -vcodec libx264 -threads 4 $HOME/output.avi

Now let’s explain the command in short:

- **avconv -f x11grab** is the default command to capture video from the X server.
- **-r 25** is the frame rate you want, you may change it if you like.
- **-s 1920×1080** is your system’s screen resolution, change it to your current system resolution, it’s very important to do this.
- **-i :0.0** is where we want to set our recording start point, leave it like this.
- **-vcodec libx264** is the video codec that we’re using to record the desktop.
- **-threads 4** is the number of threads, you may change it as well if you like.
- **$HOME/output** is the destination path where you want to save the file.
- **.avi** is the video format, you may change it to “flv”, “mp4″, “wmv”, “mov”, “mkv”.

**3.** After you enter the command, the recording will start automatically as a process running from the terminal, in order to stop it, hit “Ctrl + C” keys inside the terminal window.

![Record Desktop Screen](http://www.tecmint.com/wp-content/uploads/2014/11/Record-Desktop-Screen.jpeg)

Record Desktop Screen

**4.** Now, you may run the file using VLC or any other multimedia player, or you may run it using “avplay” tool which is a multimedia player from the same Libav package.

    $ avplay $HOME/output.avi

**Note:** Don’t forget to replace the destination file path. The recording’s quality is pretty good.

![Play Recorded Video](http://www.tecmint.com/wp-content/uploads/2014/11/Play-Recorded-Video.jpeg)

Play Recorded Video

Here’s a video that I’ve recorded using the “**avconv**” tool.

注：youtube 地址，发布的时候不行做个链接
<iframe width="640" height="380" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/g1FEh4wByGE"></iframe>

### Step 3: Start Video & Audio Recording of Desktop ###

**5.** If you want to record the audio as well, first run this command to list all the available input sources for the audio.

    $ arecord -l

It will give you some output like this.

![Check Audio Input](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Audio-Input.png)

Check Audio Input

In my case, I’ve one input source for audio only, and its number is “**1**”, that’s why I am going to use the following command to capture both video & microphone audio.

    $ avconv -f alsa -i hw:1 -f x11grab -r 25 -s 1920x1080 -i :0.0 -vcodec libx264 -threads 4 output-file2.avi

You see that part which is colored in yellow? It’s the only modification that I did for the command. Now let’s explain the command in short:

- **-f** alsa is an option to capture the sound from the alsa device.
- **-i** hw:1 is an option to take the audio input source from the “hw:1” device which is the first – and the only – input sound device in my computer.

**Note**: Don’t forget to replace the “**1**” number with the number of the input device that you want when you list the available audio input sources using the **arecord -l** command.

To stop the recording, you may hit the “**Ctrl + C**” keys again.

### Step 4: Start Audio Recording of Desktop ###

**6.** If you want to record the audio only, you may use the following command.

    $ avconv -f alsa -i hw:1 out.wav

**7.** You may replace **.mp3** with any supported audio format by Libav, you can now play the **out.wav** using any mutlimedia player like VLC.

![Record Desktop Audio](http://www.tecmint.com/wp-content/uploads/2014/11/Record-Desktop-Audio.png)

Record Desktop Audio

### Conclusion ###

“**avconv**” tool can be used to do many other things, not just to record the desktop’s video and audio. For further usage and details about the “avconv” tool, you may visit the official guide at.

- [https://libav.org/avconv.html][1]

Have you used the “avconv” tool before to record your desktop? What do you think about it? Is there any other tools that you use to record your desktop? Share them with us in the comments.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/record-ubuntu-desktop-screen-using-avconv/

作者：[Hanny Helal][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/hannyhelal/
[1]:https://libav.org/avconv.html