[#]: subject: "Make music on Linux with Ardour"
[#]: via: "https://opensource.com/article/21/12/music-linux-ardour"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Make music on Linux with Ardour
======
Anyone can be a musician with this open source digital audio tool.
![Woman programming][1]

If ever you've been curious about making music, you'll be pleased to know that the open source digital audio workstation [Ardour][2] makes it easy and fun, regardless of your level of experience. Ardour is one of those unique applications that manages to span beginner-level hobbyists all the way to production-critical professionals and serves both equally well. Part of what makes it great is its flexibility in how you can accomplish any given task and how most common tasks have multiple levels of possible depth. This article introduces you to Ardour for making your own music, assuming that you have no musical experience and no knowledge of music production software. If you have musical experience, it's easy to build on what this article covers. If you're used to other music production applications, then this quick introduction to how the Ardour interface is structured ought to be plenty for you to explore it in depth at your own pace.

### Install Ardour

Ardour's developer, Paul Davis, is a luminary in Linux audio, and much of his work now is funded by loyal users of his software. If you're able to help support Paul's work on Ardour, you can purchase a subscription for as little as US$ 1. It doesn't feel like it, but according to the Ardour website, I've been a paying Ardour community member for eight years and four weeks (at the time of this writing), and I've never regretted it.

To be clear, though, Ardour is completely open source, and the subscription is not for access to the code itself. Instead, an Ardour subscription supports its development and gives you access to the latest stable builds. You can always, of course, [build it from source code][3] yourself.

Personally, I pay for Ardour on the website and then download and use it as a [Flatpak][4].

### Launch Ardour

Launch Ardour from your Applications or Activities menu or click on its icon in the directory where you downloaded it.

When you first launch Ardour, you get a warning about memory limitations. You can ignore this warning if you want or follow my extra configuration steps.

### Configure Ardour

I like to do a little extra configuration to get the very best performance. This isn't strictly required, but it does let Ardour take full advantage of your system resources when it needs to.

First, add your user to the `audio` group. For example, assume your username is `tux`:


```
`$ sudo usermod --append --groups audio tux`
```

Set memory lock to unlimited by editing the `limits.conf` configuration file:


```
`$ sudo gedit /etc/security/limits.conf`
```

Add these two lines to the file, and then save it:


```


@audio    - rtprio 95
@audio    - memlock unlimited

```

Log out and then log back in, or just reboot.

### Importing sound

Ardour starts in the **Editor** view, and it's where you spend most of your time making music. This is your workspace, where you can add sounds and mix them.

This raises the question of where you can find sounds. Music production has a considerable cottage industry dedicated to creating loops that you can use, remix, and release as parts of new compositions. To some, this might seem like "cheating," but in my experience, creativity is primarily reworking ideas that already exist. Many great artists working with companies like Q-up Arts and Producer Loops contribute to royalty-free loops, ranging in style from cinematic to pop. Paid loop packs come up pretty regularly on Humble Bundle, but Creative Commons loopers exist, too, at [FreeSound.org][5], [Free-loops.com][6], [Looperman.com][7], and many others.

Once you've acquired a stash of loops, you can drag and drop a loop you like into Ardour.

![Drag-and-drop import][8]

(Seth Kenlon, [CC BY-SA 4.0][9])

Tracks in Ardour refer to tracks on a soundboard or mixing desk, but you can think of them as layers. Sounds placed on separate tracks above or below one another are heard just like sounds happening simultaneously in the real world. You hear both. By combining different loops and changing what loop comes next, you can compose your own music through audio construction.

### Snapping to the beat

A loop gets called a loop because that's what they're designed to do: Loop seamlessly from the end of the phrase back to the beginning, with no distinguishable break. You hear loops in nearly all modern music, but you probably don't think of them as loops. For a loop to work, it must get aligned with the beat. If a loop starts a quarter beat too late, the loop sounds broken, and the timing of your song gets thrown off.

To help you line up audio regions in your workspace, you can click the **Snap** button in the top toolbar and set its strictness in the drop-down menu to the button's right.

![Activate snapping][10]

(Seth Kenlon, [CC BY-SA 4.0][9])

It makes sense to start with a snap sensitivity of a **Bar** with many professional loops. By default, that constrains where you can drag a loop to every four beats. For loops that aren't aligned exactly to 4/4 bars, you can set your snap sensitivity to a quarter-note (1/4 note), which gives you a little bit of room to adjust where you want loops to start. Whatever you use, snapping helps prevent tiny microsecond interruptions in sounds that are meant to be continuous.

### The mix

In music, I often find that less is more. It's a tough lesson to internalize, especially if you're a fan of orchestral music and are used to seeing a 90-piece band. But most modern music is produced by just a few musicians, so you probably don't need many tracks. Even with just three or four tracks, though, some instruments naturally dominate. For that reason, each track has a volume setting on the left side of the Ardour editor interface.

![Ardour quick mixer][11]

(Seth Kenlon, [CC BY-SA 4.0][9])

There's no right or wrong way to mix your music. Whatever sounds pleasant to your ear is the right choice.

After some practice with a basic mix, you can explore automating the mix. Activate mixing automation by clicking the **A** button in the music track you want to mix. Select **Fader** from the pop-up menu. A new track appears under the one you want to mix, and there's a line graph through it. The line graph is currently flat, but you can double-click on it to add a node and drag the node to a new volume. Do this a few times throughout the track, and you can adjust the sound levels on that track. Once again, less is usually more—small adjustments are often all you need.

![Ardour quick mixer][12]

(Seth Kenlon, [CC BY-SA 4.0][9])

### Recording sound

If you play a musical instrument, you can record directly into Ardour. **Before recording into a microphone, make sure you're wearing headphones to avoid feedback!**

  1. Add a new track by selecting **Add Track, Bus or VCA** from the **Track** menu or pressing **Ctrl+Shift+N** on your keyboard. Accept the default settings for an Audio Track.
  2. On the track, click the Record (a red circle) button. This "arms" the track for recording.
  3. Click the Record (a red circle) button in the top toolbar. This readies Ardour itself to record.
  4. If your distribution uses Pulse (most do), go to the **Window** menu, select **Audio/MIDI Setup**, and switch your Audio System to Advanced Linux Sound Architecture (ALSA). This gives Ardour direct access to your input device. Click the **Start** button on the right, and now you can record. After recording, switch back to Pulse Audio.



![Setting your input for recording][13]

(Seth Kenlon, [CC BY-SA 4.0][9])

If you're a JACK Audio Connection Kit (JACK) user, you only have to switch your audio setup to JACK once. If you don't know JACK, that's OK. Just remember to switch over to ALSA before recording.

### Export your music

Sharing your music with friends is as easy as going to the **File** menu and selecting **Export to Audio Files**. Everything in your workspace is, essentially, recorded to a file in the format of your choosing. Supported formats include FLAC for high-quality lossless music, uncompressed WAV for archival purposes, Ogg Vorbis for posting on the Internet, and MP3 for sending to friends.

### Music is fun

You don't have to over-think making music. It's a lot easier than you might think, and it doesn't have to be a month- or year-long process. You can drum up some tunes in an afternoon and listen to them with satisfaction the following day as you work. Ardour makes it a trivial and fun process, and there's lots more to explore, including effects (reverbs, phasers, bitcrushers, and many more with even weirder names), more automation, esoteric time signatures, and MIDI. Download Ardour, grab some samples and loops and start making noise.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/music-linux-ardour

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: http://ardour.org
[3]: https://opensource.com/article/21/11/compiling-code
[4]: https://opensource.com/article/21/11/install-flatpak-linux
[5]: http://freesound.org
[6]: http://free-loops.com
[7]: http://looperman.com
[8]: https://opensource.com/sites/default/files/uploads/ardour-import-drag.jpg (Drag-and-drop import)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/ardour-snap.jpg (Activate snapping)
[11]: https://opensource.com/sites/default/files/uploads/ardour-mixer.jpg (Ardour quick mixer)
[12]: https://opensource.com/sites/default/files/uploads/ardour-mix-automation.jpg (Ardour quick mixer)
[13]: https://opensource.com/sites/default/files/uploads/ardour-setup-audio-midi.jpg (Setting your input for recording)
