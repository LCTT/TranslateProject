[#]: subject: "Play the drums on Linux with Hydrogen"
[#]: via: "https://opensource.com/article/21/12/open-source-drum-hydrogen"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Play the drums on Linux with Hydrogen
======
Create looping beats using Hydrogen, an open source drum machine.
![Man playing drums][1]

Much of today's music features the exacting work of a drum machine. The term might make you think of a drum set with mechanical levers and cranks armed with drumsticks, but all it actually refers to is a synthesizer programmed to play drum sounds. A good drum machine programmer (often also a drummer) can make a drum machine sound either hyper-robotic (if that's the sound the producer's going for) or almost human, with nuance and swing. Drum machines can be physical devices, like the famous Roland TR-808, TR-909, Alesis HR-16, and many others, but lately, they've been implemented as software. The excellent [LMMS][2] application contains a drum machine, and there's the drumkv1 plugin for DAWs like [Ardour][3], [Qtractor][4], and [Rosegarden][5]. But there's also the dedicated [Hydrogen][6] drum machine that has just one job, which it does very well, and has done for the past 20 years: be a great, fully-featured, and open source drum machine.

### Install Hydrogen on Linux

Hydrogen is available on most Linux distributions from your package manager. On Fedora, Mageia, and similar distributions:


```
`$ sudo dnf install hydrogen`
```

On Elementary, Mint, and other Debian-based distributions:


```
`$ sudo apt install hydrogen`
```

You may also use Hydrogen as a [Flatpak][7].

BSD and [Pkgsrc users][8] can install Hydrogen from the ports collection.

For macOS and Windows, download an installer from [hydrogen-music.org][9].

### How to create a loop

A drum loop consists of individual beats. You can construct a loop by placing drum beats in the _pattern_ chart at the bottom of the Hydrogen interface. Here's a screenshot of a basic loop, with a kick drum sound on beats 1 and 3 and some lively snare work on beats 2, 2-and, and 4.

![Hydrogen's pattern chart][10]

(Seth Kenlon, CC BY-SA 4.0)

To hear the pattern, click the **Play** button at the top of the window.

![Play pattern][11]

(Seth Kenlon, CC BY-SA 4.0)

By default, Hydrogen's beat chart gives you a pretty high-level view of a measure: there are four beats, with just half-beats in between. If you don't play drums or play with drum machines often, that might be enough to get you started, but a real drummer would get pretty bored if all they could do was hit a drum on the beat and upbeat. You can give yourself more flexibility by increasing the resolution of the chart.

![Better resolution for more flexibility][12]

(Seth Kenlon, CC BY-SA 4.0)

Once you can see 32nd and 64th notes, you can create dynamic beats that would be fun to play or, potentially, as impossible to play as dubstep.

### How to build a loop

A _pattern_ is a single entity within Hydrogen, and it's designed to be looped for as long as you need it to play. If you're just jamming, then you may not need much more than a single loop, but if you're creating a song with structure, then you can build many different patterns and string them together as a song. The top half of the Hydrogen interface displays patterns. The highlighted box represents the pattern you're currently creating.

![Pattern matrix and song builder][13]

(Seth Kenlon, CC BY-SA 4.0)

You've got an entity called **Pattern 1** right now, and it's looping endlessly because Hydrogen is set to play just a pattern. To switch Hydrogen over to song mode, click the **Song** button at the top of the window.

![Song mode][14]

(Seth Kenlon, CC BY-SA 4.0)

In song mode, Hydrogen loops over as many patterns as you have highlighted in the song matrix. You can build a different pattern by highlighting **Pattern 2** and including that in your song.

### Loops as building blocks

It's not uncommon to have one loop serve as an unchanging foundation, with new loops adding variation on top. For instance, you might want a steady kick drum beat through your entire song, but you want the ability to change the beats of the snare and hi-hat and to add in more cowbell to meet the demands of a producer who has a fever for more cowbell. By default, Hydrogen plays one pattern at a time, but you can make it treat patterns as layers so you can have several patterns playing over one another.

![Play pattern stack][15]

(Seth Kenlon, CC BY-SA 4.0)

### Fix it in the mix

Once you've got a fun pattern or song going, you may find that you need to adjust the levels of certain sounds. Hi-hat samples especially can be wildly variable in level, with some hi-hats sounding like keys on a keychain and others sounding like a ceremonial gong. To adjust the volume of each instrument individually, click the **Mixer** button in the top right of the Hydrogen window. In the mixer interface that opens, you can adjust the stereo position and level of each component in your drum kit.

![Hydrogen mixer][16]

(Seth Kenlon, CC BY-SA 4.0)

### The audio pipeline

If all you want to do is make beats, the Hydrogen on its own is all you need. Should you want to integrate it with other music applications, though, you need to build a pipeline, which on Linux can be done with JACK or, if you're running Pipewire, [Helvum][17]. Using one of these applications for routing audio lets you have Hydrogen play along with the music you're composing in a digital audio workstation.

Alternatively, you can export your loop or song as a MIDI file, a Lilypond file, or an audio recording. Do this from the **File** menu.

### Making noise

You don't have to be a drummer or a musician to have fun with the Hydrogen drum machine. But if you are a drummer, you're sure to find Hydrogen to be a useful and versatile emulation of hardware drum machines. Hydrogen has just one bank of sounds, but many more are available online. Using the **Drumkits** menu, you can import drumkits from Hydrogen's website, and you can even [build your own drumkits][18] and import them from local files. There's no end to what fun you can have with Hydrogen, so download it and start making some noise.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/open-source-drum-hydrogen

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/michael-dobrinski-unsplash.jpg?itok=ykmFxbjM (Man playing drums)
[2]: https://opensource.com/life/16/2/linux-multimedia-studio
[3]: https://ardour.org/
[4]: https://opensource.com/article/17/6/qtractor-audio
[5]: https://opensource.com/article/18/3/make-sweet-music-digital-audio-workstation-rosegarden
[6]: http://hydrogen-music.org/
[7]: https://opensource.com/article/21/11/install-flatpak-linux
[8]: https://opensource.com/article/19/11/pkgsrc-netbsd-linux
[9]: http://hydrogen-music.org/downloads/
[10]: https://opensource.com/sites/default/files/hydrogen-pattern-chart.jpg (Hydrogen's pattern chart)
[11]: https://opensource.com/sites/default/files/hydrogen-play-pattern.jpg (Play pattern)
[12]: https://opensource.com/sites/default/files/hydrogen-resolution.jpg (Better resolution for more flexibility)
[13]: https://opensource.com/sites/default/files/hydrogen-pattern.jpg (Pattern matrix and song builder)
[14]: https://opensource.com/sites/default/files/hydrogen-song-mode.jpg (Song mode)
[15]: https://opensource.com/sites/default/files/hydrogen-pattern-stack.jpg (Play pattern stack)
[16]: https://opensource.com/sites/default/files/hydrogen-mixer.jpg (Hydrogen mixer)
[17]: https://gitlab.freedesktop.org/ryuukyu/helvum
[18]: https://opensource.com/article/17/11/how-create-hydrogen-drumkit-fun-and-profit
