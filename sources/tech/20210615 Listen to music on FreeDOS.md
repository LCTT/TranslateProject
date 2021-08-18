[#]: subject: (Listen to music on FreeDOS)
[#]: via: (https://opensource.com/article/21/6/listen-music-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Listen to music on FreeDOS
======
Mplayer is an open source media player that's usually found on Linux,
Windows, Mac, and DOS.
![Woman programming][1]

Music is a great way to relax. On Linux, I listen to music using Rhythmbox. But did you know you can listen to music on FreeDOS, as well? Let's take a look at two popular programs to listen to music:

### Listen to music with Mplayer

[Mplayer][2] is an open source media player that's usually found on Linux, Windows, and Mac—but there's a DOS version available, too. And that's the version we include in FreeDOS. While the DOS port is based on an older version (version 1.0rc2-3-3-2 from 2007) it is perfectly serviceable for playing media on DOS.

I use Mplayer to listen to music files on FreeDOS. For this example, I've copied one of my favorite audiobooks, Doctor Who: Flashpoint by [Big Finish Productions][3], and saved it as `C:\MUSIC\FLASHPNT.MP3` on my FreeDOS computer. To listen to Flashpoint on FreeDOS, I launch Mplayer from the FreeDOS command line and specify the MP3 filename to play. The basic usage of Mplayer is `mplayer [options] filename` so if the default settings work well for you, then you can just launch Mplayer with the filename. In this case, I ran these commands to change my working directory to `\MUSIC` and then run Mplayer with my MP3 audiobook file:


```
CD \MUSIC
MPLAYER FLASHPNT.MP3
```

FreeDOS is _case insensitive_, so it will accept uppercase or lowercase letters for DOS commands and any files or directories. You could also type `cd \music` or `Cd \Music` to move into the Music directory, and that would work the same.

![mplayer on FreeDOS][4]

You can use Mplayer to listen to MP3 files
(Jim Hall, [CC-BY SA 4.0][5])

Using Mplayer is a "no frills" way to listen to music files on FreeDOS. But at the same time, it's not distracting, so I can leave FreeDOS to play the MP3 file on my DOS computer while I use my other computer to do something else. However, FreeDOS runs tasks one at a time (in other words, DOS is a "single-tasking" operating system) so I cannot run Mplayer in the "background" on FreeDOS while I work on something else _on the same FreeDOS computer_.

Note that Mplayer is a big program that requires a lot of memory to run. While DOS itself doesn't require much RAM to operate, I recommend at least 16 megabytes of memory to run Mplayer.

### Listen to audio files with Open Cubic Player

FreeDOS offers more than just Mplayer for playing media. We also include the [Open Cubic Player][6], which supports a variety of file formats including Midi and WAV files.

In 1999, I recorded a short audio file of me saying, "Hello, this is Jim Hall, and I pronounce 'FreeDOS' as _FreeDOS_." This was meant as a joke, riffing off of a [similar audio file][7] (`english.au`, included in the Linux source code tree in 1994) recorded by Linus Torvalds to demonstrate how he pronounces "Linux." We don't distribute the _FreeDOS_ audio clip in FreeDOS itself, but you are welcome to download it from our [Silly Sounds][8] directory, found in the FreeDOS files archive at [Ibiblio][9].

You can listen to the _FreeDOS_ audio clip using the Open Cubic Player. To run Open Cubic Player, you normally would run `CP` from the `\APPS\OPENCP` directory. However, Open Cubic Player is a 32-bit application that requires a 32-bit DOS extender. A common DOS extender is DOS/4GW. While free to use, DOS/4GW is not an open source program, so we do not distribute it as a FreeDOS package.

Instead, FreeDOS provides another open source 32-bit extender called DOS/32A. If you did not install everything when you installed FreeDOS, you may need to install it using [FDIMPLES][10]. I used these two commands to move into the `\APPS\OPENCP` directory, and to run Open Cubic Player using the DOS/32A extender:


```
CD \APPS\OPENCP
DOS32A CP
```

Open Cubic Player doesn't sport a fancy user interface, but you can use the arrow keys to navigate the _File Selector_ to the directory that contains the media file you want to play.

![Open Cubic Player][11]

Open Cubic Player opens with a file selector
(Jim Hall, [CC-BY SA 4.0][5])

The text appears smaller than in other DOS applications because Open Cubic Player automatically changes the display to use 50 lines of text, instead of the usual 25 lines. Open Cubic Player will reset the display back to 25 lines when you exit the program.

When you have selected your media file, Open Cubic Player will play it in a loop. (Press the Esc key on your keyboard to quit.) As the file plays over the speakers, Open Cubic Player displays a spectrum analyzer so you can see the audio for the left and right channels. The _FreeDOS_ audio clip is recorded in mono, so the left and right channels are the same.

![Open Cubic Player][12]

Open Cubic Player playing the "FreeDOS" audio clip
(Jim Hall, [CC-BY SA 4.0][5])

DOS may be from an older era, but that doesn't mean you can't use FreeDOS to run modern tasks or play current media. If you like to listen to digital music, try using Open Cubic Player or Mplayer on FreeDOS.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/listen-music-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://en.wikipedia.org/wiki/MPlayer
[3]: https://bigfinish.com/
[4]: https://opensource.com/sites/default/files/uploads/mplayer.png (You can use Mplayer to listen to MP3 files)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://www.cubic.org/player/
[7]: https://commons.wikimedia.org/wiki/File:Linus-linux.ogg
[8]: https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/util/sillysounds/
[9]: https://www.ibiblio.org/
[10]: https://opensource.com/article/21/6/freedos-package-manager
[11]: https://opensource.com/sites/default/files/uploads/opencp1.png (Open Cubic Player opens with a file selector)
[12]: https://opensource.com/sites/default/files/uploads/opencp2.png (Open Cubic Player playing the "FreeDOS" audio clip)
