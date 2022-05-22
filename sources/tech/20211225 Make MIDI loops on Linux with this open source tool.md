[#]: subject: "Make MIDI loops on Linux with this open source tool"
[#]: via: "https://opensource.com/article/21/12/midi-loops-seq24"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Make MIDI loops on Linux with this open source tool
======
With Seq24, you can record MIDI phrases and then build a song by
activating them in different combinations during jam sessions or live
performances.
![Person using a laptop][1]

There are many great synthesizers for Linux, and like synthesizers in real life, most of them can be controlled using the MIDI protocol. Digital audio workstations like [Ardour][2], [Qtractor][3], and [Rosegarden][4] can send and receive MIDI, and they have a plugin structure that permits loading most synthesizers as a component of the application. I'm a fan of modularity, though, and sometimes a big all-in-one audio workstation is more than what I need. Thanks to the combination of JACK, ALSA, and MIDI, it's entirely possible to open a synth as a stand-alone application and use a stand-alone sequencer to play and record that synth. There aren't many modular sequencers out there, but I use [Seq24][5].

### Install Seq24

Seq24 is a loop-based MIDI sequencer inspired by the Alesis MMT-8 and Akai MPC series of hardware. That means it essentially combines two ideas from the history of music: the player piano and the tape loop. With Seq24, you can record MIDI phrases and then build a song by activating them in different combinations during jam sessions or live performances.

Seq24 isn't actively developed right now, but it is being maintained on [Launchpad][6].

A build for Fedora, CentOS, and other RPM-based distributions is available on [Copr][7]:


```


$ sudo dnf copr enable klaatu/seq24
$ sudo dnf install seq24

```

You also need something to sequence, such as [Linux Sampler][8] or [Zyn-Fusion][9].

### MIDI setup on Linux

There are many great tools to help you set up MIDI on Linux, including QJackCtl and Patchage. For a simple modular setup, though, I find it just as easy to configure my rig from the terminal. Even if you don't normally use the terminal, the commands can help you understand what connections are being made, making you better informed should you need to troubleshoot. Whether you're using the terminal or a GUI helper application, the process is always the same: start JACK, then start your sequencer and synth.

#### 1\. Start JACK

JACK is an audio connection kit for Linux that routes sound between different and ostensibly unrelated applications. It runs in the background as a _daemon_.

First, you must identify your audio output device so that JACK knows where you want it to play sound (probably your computer speakers or headphones plugged into your computer) using `aplay`. Don't worry about deciphering (yet) the information you get back from this command:


```


$ aplay --list-devices | grep card
card 0: NVidia [HDA NVidia], device 3: HDMI 0 [HDMI 0]
card 0: NVidia [HDA NVidia], device 7: HDMI 1 [HDMI 1]
[...]
card 1: Generic [HD-Audio Generic], device 0: ALC897 Analog [ALC897 Analog]
card 2: DSP [Plantronics .Audio 626 DSP], device 0: USB Audio [USB Audio]

```

What does it all mean? Well, on my computer, I've got HDMI outputs that I don't use, and I know that those exist on my NVidia graphics card, so I ignore those entries. I also have a Plantronics brand USB headset attached, but I only use that for online gaming, so I can ignore that entry. The only output left is `card 1`, which must be my computer speakers (or headphones, which plug into the same audio port as speakers). This is probably different than your system, but by using the same process of elimination, you can find your desired sound output.

In technical JACK terminology, `card 1` is `hw:1`.

Once you have the device name of your preferred sound card, start the JACK daemon using the `alsa` driver for sound output and the `seq` driver for MIDI interaction:


```


$ jackd --realtime \
-d alsa \
\--midi seq \
\--playback hw:1 &amp;

```

I use the `&` symbol at the end of the command to force my terminal to give me a new prompt after it has started JACK.

#### 2\. Start the synth modules

Now you can start the synthesizer you want to sequence and the sequencer you want to use to do it. In this example, I use Zyn-Fusion and Seq24, both of which have options (such as `--auto-connect` and `--jack-master`) to specify their roles in my setup. Zyn-Fusion auto connects to JACK, and Seq24 auto-connects as the MIDI controller. Again, I use the `&` symbol at the end of the command to force my terminal to give me a new prompt after it has started my applications.


```


$ zyn-fusion --auto-connect &amp;
$ seq24 --jack_master &amp;

```

![Modular synth setup][10]

(Seth Kenlon, CC BY-SA 4.0)

### Composing music in Seq24

Seq24 is divided into eight columns and four rows. That means you can have a total of 32 loops in one project. Right-click in a column and select **New** to create a loop. This opens a classic "piano roll" editor, with a piano keyboard on the left and a grid representing each note over the course of four bars of four beats on the right.

First, you must set your MIDI target, so your loop knows what synth to trigger and what MIDI channel to use for communication. Click the three-dot button in the top toolbar and select your synth to choose your target. Click the MIDI plug to the right to select a channel.

![Select a target][11]

(Seth Kenlon, CC BY-SA 4.0)

(For your target to be meaningful, of course, you must assign an instrument to MIDI channel 1 in your synth.)

Seq24 has a unique convention for entering and editing notes that seems confusing at first but quickly makes sense once you use it once or twice.

  * Right-click to activate the pen tool, and left-click (while still holding the right-click button) to draw a note.
  * Left-click to select a note. Left-click and drag to draw a selection box.
  * Middle-click and drag to modify the length of a selected note.



I've tried using the alternate mouse controls available in the **Options** panel, and I can attest that my workflow suffered for it, so give the default a try.

### Playing loops

Once you've composed a loop, you can play it back from the main interface. Click the **Play** button in the bottom left of the Seq24 window, and then click on the loop to activate its sound. When you build up a few loops in your project, you can have different loops selected together to build a song.

![Play patch loop][12]

(Seth Kenlon, CC BY-SA 4.0)

By default, Seq24 is in **Live** mode, meaning that you can select and deselect loops dynamically. You can click on loops to activate them, or you can use keyboard shortcuts. Keyboard shortcuts follow the QWERTY keyboard layout as much as it can, so `1`, `Q`, `A`, `Z` toggle the first column of loops, `2`, `W`, `S`, `X` toggle the second column, and so on. Keyboard shortcuts are documented in the **Options** panel (available in the **File** menu), so you can change them (as a Dvorak keyboard user, I especially appreciate this).

### Song editor

Seq24 also has a **Song mode** that lets you map out the order loops are played to form a structured song. Go to the **File** menu and open the **Options** panel to switch between modes. In the **Options** panel, select the **Jack Sync** tab. Choose **Song Mode**, click **Connect**, and close the **Options** window.

Select **Song Editor** from the **View** menu or press **Ctrl+E** on your keyboard to see the song editor interface. The song editor is functionally the same as the loop editor, except that you draw loops instead of notes. Available loops are listed along the left side of the window, and you can schedule them in the grid on the right using the same mouse controls as you use to create loops.

![Song editor][13]

(Seth Kenlon, CC BY-SA 4.0)

Click the **Play** button when you're ready to hear your song.

### Simple studio

Opening Seq24 and a good synth is the virtual equivalent of throwing an MMT-8, an MC-303, and some MIDI cables into a messenger bag and heading to your friend's garage to jam. It's easy, it's minimal, but it's 32 patches and 16 channels of raw power. Next time you're bored of your music collection and need something different, do yourself a favor and make some noise of your own. You might be surprised at how long you can be entertained by just a few looped bars when you make the music.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/midi-loops-seq24

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/21/12/music-linux-ardour
[3]: https://opensource.com/article/17/6/qtractor-audio
[4]: https://opensource.com/article/18/3/make-sweet-music-digital-audio-workstation-rosegarden
[5]: https://filter24.org/seq24/
[6]: https://launchpad.net/~seq24team
[7]: http://copr.fedorainfracloud.org/coprs/klaatu/seq24/
[8]: https://opensource.com/article/21/12/linux-sampler
[9]: https://opensource.com/article/21/12/zyn-fusion
[10]: https://opensource.com/sites/default/files/seq24-desktop.jpg (Modular synth setup)
[11]: https://opensource.com/sites/default/files/seq24-midi-target.jpg (Select a target)
[12]: https://opensource.com/sites/default/files/seq24-patch-loop.jpg (Play patch loop)
[13]: https://opensource.com/sites/default/files/seq24-song-editor.jpg (Song editor)
