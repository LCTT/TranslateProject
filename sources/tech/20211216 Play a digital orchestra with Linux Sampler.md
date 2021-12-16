[#]: subject: "Play a digital orchestra with Linux Sampler"
[#]: via: "https://opensource.com/article/21/12/linux-sampler"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Play a digital orchestra with Linux Sampler
======
Linux Sampler is a specialized multimedia tool aimed at musicians. You
can play the whole orchestra with just a few gigs of samples.
![William Kenlon conducting an orchestra][1]

Synthesizers have been attempting to emulate real-world musical instruments for decades. Famous synthesist Wendy Carlos worked hard to understand (and document, in her [Secrets of Synthesis][2] album) how synthesizers could capture the intent of music initially written for physical instruments. Musicians came to understand, though, that if you wanted to capture the exact sound and feel of an instrument, you had to record it, and the Mellotron famously pioneered this idea with tape loops connected to a keyboard. When synthesizer technology transitioned from analog to digital, sampling became a standard practice.

In the context of musical synthesis, sampling is the process of recording a real instrument and then using that recording to make new music. It's an important idea in music because few people have access to every instrument they happen to want to compose music for. And if you want to write a score featuring a full symphonic orchestra for a video game, it's likely out of your budget to hire an orchestra, a studio, and engineers. However, with open source, you can certainly afford to hook your MIDI keyboard up to [Linux Sampler][3].

### Install Linux Sampler

Linux Sampler is a specialized multimedia tool aimed at musicians, so not all distributions package it in their repositories.

On Fedora, CentOS, Mageia, and similar, you can download Linux Sampler from the [Planet CCRMA][4] repository, or use a build from COPR:


```


$ sudo dnf copr enable klaatu/linuxsampler
$ sudo dnf install linuxsampler

```

On Debian and similar, download the DEB installer from [linuxsampler.org][5] and install:


```
`$ sudo dpkg -i linuxsampler*deb`
```

For macOS and Windows, download installers from [linuxsampler.org][5] and launch the installer.

Linux Sampler is actually just the _engine_ to play sample files.

![Linux Sampler engine][6]

(Seth Kenlon, [CC BY-SA 4.0][7])

You also need a front-end application so that you can interact with it. There are two user interfaces provided on the Linux Sampler website: Qsampler and Fantasia. Fantasia is a Java desktop application, so it works regardless of your operating system. You can [download Fantasia][8] from the Linux Sampler website.

### Getting samples

Linux Sampler plays three different kinds of sample files:

  * `.gig` (also known as Gigastudio or Gigasample files)
  * `.sf2` (also known as Soundfont)
  * `.sfz` (an open standard with no relation to the `.sf2` Soundfont format)



There are several sources for free and open source sound banks in all of these formats, including the [Virtual Playing Orchestra][9] project, the [Versil Studio][10] collection, [Flame Studios][11] guitar samples, and many more. You can also purchase bundles of Gigasamples from a number of sample bank companies. As long as you have Linux Sampler, you have a way to play Gigasamples, Soundfonts, and SFZ files.

### Making music with Linux Sampler

The Fantasia interface for Linux Sampler has a three-column configuration.

![Linux Sampler UI][12]

(Seth Kenlon, [CC BY-SA 4.0][7])

  * On the right is the main configuration panel. This is where you select audio and MIDI devices.
  * In the middle is the rack. This is where you add virtual synths, each with a unique sample bank loaded.
  * On the left is the Orchestra and Instrument panel. This is largely an optional panel to build a collection of instruments you often use for quick access.



### Audio configuration

To set your audio output, click the **Power** button on the left of the **Audio Devices** entry in the right column. For Linux, you can use Advanced Linux Sound Architecture (ALSA) or Jack Audio Connection Kit (JACK). The JACK system allows you to route sound from different applications as if they were all coming from the same application.

JACK is a powerful system, but it does take time to learn. If you want to use ALSA instead, you must suspend Pulse Audio so that Linux Sampler can lay claim to your audio output device.

To set Linux Sampler to use ALSA:


```


$ cat &lt;&lt; EOF  &gt;&gt; fantasia.sh
&gt; #!/bin/sh
&gt; java -jar $HOME/Downloads/Fantasia-0.9.jar
&gt; EOF
$ chmod +x ./fastasia.sh

```

Each time you launch Fantasia, use this command:


```
`$ pasuspender ./fastasia.sh`
```

### MIDI configuration

Linux Sampler responds to MIDI signals. To create a new MIDI device, click the **Power** button on the left of the **MIDI Devices** entry in the right column. On Linux, you can use ALSA or JACK to manage MIDI.

Personally, I use ALSA for MIDI even when I'm using JACK.

### Adding instruments

To play your samples, you need a synthesizer (a **sampler channel**, in Fantasia's terminology) in your rack with a sample bank loaded. To add a sampler channel, click the **Power** button on the left of the **MIDI Devices** entry in the middle column.

Linux Sampler defaults to GIG, but you can click the **GIG** button on the rack unit to choose a different format. Click the **Load instrument** button to select the file you want to load.

### Playing sound

To play your samples, you can use the virtual keyboard at the bottom of the window. Click on an instrument in the middle column to make it active, and then click on the keyboard at the bottom of the window. Alternately, if you're using a USB MIDI keyboard, you can use it to trigger sounds.

### Advanced MIDI setup

The virtual piano keyboard at the bottom of the screen uses MIDI channel 1 by default, and that's what all of your instruments in the middle rack are set to when you create them. Suppose you want to trigger sounds over a specific MIDI channel, either because you're using a MIDI keyboard that sends signals over that channel or because you're triggering sounds from a separate application. In that case, you can change the MIDI channel of each instrument. To see an instrument's MIDI settings, click the **Options** button on the right of the rack unit. You can set your MIDI input, port, channel, and more in the drop-down panel that appears.

![Linux Sampler MIDI][13]

(Seth Kenlon, [CC BY-SA 4.0][7])

### Open source orchestration 

I love a good cinematic score, with a full orchestra, swelling crescendos, and plucky arpeggios when it comes to movies and video games. I also really enjoy old music, and it's amazing how many MIDI files are out there that provide a sort of "digital sheet music" for old classics. I don't have access to a full chamber orchestra myself, but I do have access to a lot of great open source technology and open culture work that, when combined, allows me to compose and play a digital orchestra. Linux Sampler doesn't have a sequencer built into it. It's just a player. Combine it with a digital audio workstation such as [Ardour][14], [Qtractor][15], or [Rosegarden][16] to create your own scores, songs, or just use it as a sound source for MIDI files. If you close your eyes, you might just convince yourself a real live band is serenading you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/linux-sampler

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kenlon-music-conducting-orchestra.png?itok=BK_RB39X (William Kenlon conducting an orchestra)
[2]: http://www.wendycarlos.com/+sos.html
[3]: http://linuxsampler.org/
[4]: http://ccrma.stanford.edu/planetccrma/mirror/fedora/linux/planetccrma/
[5]: https://download.linuxsampler.org/packages/debian/
[6]: https://opensource.com/sites/default/files/uploads/linuxsampler-engine.jpg (Linux Sampler engine)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: http://downloads.sourceforge.net/jsampler/Fantasia-0.9.jar
[9]: http://virtualplaying.com/virtual-playing-orchestra/
[10]: https://vis.versilstudios.com/vsco-community.html
[11]: https://www.flamestudios.org/free/GigaSamples
[12]: https://opensource.com/sites/default/files/uploads/linuxsampler-ui.jpg (Linux Sampler UI)
[13]: https://opensource.com/sites/default/files/uploads/linuxsampler-midi.jpg (Linux Sampler MIDI)
[14]: https://opensource.com/article/21/12/making-music-ardour-advent-2021-18
[15]: https://opensource.com/article/17/6/qtractor-audio
[16]: https://opensource.com/article/18/3/make-sweet-music-digital-audio-workstation-rosegarden
