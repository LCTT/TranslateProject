eSpeak: Text To Speech Tool For Linux
================================================================================
![Text to speech tool in Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/Text-to-speech-Linux.jpg)

[eSpeak][1] is a command line tool for Linux that converts text to speech. This is a compact speech synthesizer that provides support to English and many other languages. It is written in C.

eSpeak reads the text from the standard input or the input file. The voice generated, however, is nowhere close to a human voice. But it is still a compact and handy tool if you want to use it in your projects.

Some of the main features of eSpeak are:

- A command line tool for Linux and Windows
- Speaks text from a file or from stdin
- Shared library version for use by other programs
- SAPI5 version for Windows, so it can be used with screen-readers and other programs that support the Windows SAPI5 interface.
- Ported to other platforms, including Android, Mac OSX etc.
- Several voice characteristics to choose from
- speech output can be saved as [.WAV file][2]
- SSML ([Speech Synthesis Markup Language][3]) is supported partially along with HTML
- Tiny in size, the complete program with language support etc is under 2 MB.
- Can translate text into phoneme codes, so it could be adapted as a front end for another speech synthesis engine.
- Development tools available for producing and tuning phoneme data.

### Install eSpeak ###

To install eSpeak in Ubuntu based system, use the command below in a terminal:

    sudo apt-get install espeak

eSpeak is an old tool and I presume that it should be available in the repositories of other Linux distributions such as Arch Linux, Fedora etc. You can install eSpeak easily using dnf, pacman etc.

To use eSpeak, just use it like: espeak  and press enter to hear it aloud. Use Ctrl+C to close the running program.

![eSpeak command line](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/eSpeak-example.png)

There are several other options available. You can browse through them through the help section of the program.

### GUI version: Gespeaker ###

If you prefer the GUI version over the command line, you can install Gespeaker that provides a GTK front end to eSpeak.

Use the command below to install Gespeaker:

    sudo apt-get install gespeaker

The interface is straightforward and easy to use. You can explore it all by yourself.

![eSpeak GUI tool for text to speech in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/11/eSpeak-GUI.png)

While such tools might not be useful for general computing need, it could be handy if you are working on some projects where text to speech conversion is required. I let you decide the usage of this speech synthesizer.

--------------------------------------------------------------------------------

via: http://itsfoss.com/espeak-text-speech-linux/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://espeak.sourceforge.net/
[2]:http://en.wikipedia.org/wiki/WAV
[3]:http://en.wikipedia.org/wiki/Speech_Synthesis_Markup_Language