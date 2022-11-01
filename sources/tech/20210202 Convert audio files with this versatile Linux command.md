[#]: collector: (lujun9972)
[#]: translator: (FYJNEVERFOLLOWS )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Convert audio files with this versatile Linux command)
[#]: via: (https://opensource.com/article/20/2/linux-sox)
[#]: author: (Klaatu https://opensource.com/users/klaatu)

Convert audio files with this versatile Linux command
======
SoX Sound Exchange can even add effects to your audio files.
![HiFi vintage stereo][1]

I work with media, and when you work with any kind of media, you learn pretty quickly that standardization is a valuable tool. Just as you wouldn't try to add a fraction to a decimal without converting one or the other, I've learned that it's not ideal to combine media of differing formats. Most hobbyist-level applications make the conversion process invisible to the user as a convenience. Flexible software aimed at users needing control over the fine details of their assets, however, often leave it up to you to convert your media to your desired format in advance. I have a few favorite tools for conversion, and one of those is the so-called _Swiss army knife of sound_, [SoX][2].

### Installing

On Linux or BSD, you can install the **sox** command (and some helpful symlinks) from your software repository or ports tree.

You can also install SoX from its home on [Sourceforge.net][3]. It doesn't release often, but its codebase tends to be stable, so if you want the latest features (such as Opus support), it's easy and safe to build.

SoX provides primarily the **sox** command, but installation also creates a few useful symlinks: **play**, **rec**, and **soxi**.

### Getting information about files with SoX

SoX reads and rewrites audio data. Whether it stores the rewritten audio data is up to you. There are use cases in which you don't need to store the converted data, for instance, when you're sending the output directly to your speakers for playback. Before doing any conversion, however, it's usually a good idea to determine exactly what you're dealing with in the first place.

To gather information about an audio file, use the **soxi** command. This is a symlink to **sox --info**.


```
$ soxi countdown.mp3
Input File     : '/home/tux/countdown.mp3'
Channels       : 1
Sample Rate    : 44100
Precision      : 16-bit
Duration       : 00:00:11.21 = 494185 samples...
File Size      : 179k
Bit Rate       : 128k
Sample Encoding: MPEG audio (layer I, II or III)
```

This output gives you a good idea of what codec the audio file is encoded in, the file length, file size, sample rate, and the number of channels. Some of these you might _think_ you already know, but I never trust assumptions when media is brought to me by a client. Verify media attributes with **soxi**.

### Converting files

In this example, the audio of a game show countdown has been delivered as an MP3 file. While nearly all editing applications accept compressed audio, none of them actually edit the compressed data. Conversion is happening somewhere, whether it's a secret background task or a prompt for you to save a copy. I generally prefer to do the conversion myself, in advance. This way, I can control what format I'm using. I can do lots of media in batches overnight instead of wasting valuable production time waiting for an editing application to churn through them on demand.

The **sox** command is meant for converting audio files. There are a few stages in the **sox** pipeline:

  * input
  * combine
  * effects
  * output



In command syntax, the effects step is, confusingly, written _last_. That means the pipeline is composed this way:


```
`input → combine → output → effects`
```

### Encoding

The simplest conversion command involves only an input file and an output file. Here's the command to convert an MP3 file to a lossless FLAC file:


```
$ sox countdown.mp3 output.flac
$ soxi output.flac

Input File     : 'output.flac'
Channels       : 1
Sample Rate    : 44100
Precision      : 16-bit
Duration       : 00:00:11.18 = 493056 samples...
File Size      : 545k
Bit Rate       : 390k
Sample Encoding: 16-bit FLAC
Comment        : 'Comment=Processed by SoX'
```

#### Effects

The effects chain is specified at the end of a command. It can alter audio prior to sending the data to its final destination. For instance, sometimes audio that's too loud can cause problems during conversion:


```
$ sox bad.wav bad.ogg
sox WARN sox: `bad.ogg' output clipped 126 samples; decrease volume?
```

Applying a **gain** effect can often solve this problem:


```
`$ sox bad.wav bad.ogg gain -1`
```

#### Fade

Another useful effect is **fade**. This effect lets you define the shape of a fade-in or fade-out, along with how many seconds you want the fade to span.

Here's an example of a six-second fade-in using an inverted parabola:


```
`$ sox intro.ogg intro.flac fade p 6`
```

This applies a three-second fade-in to the head of the audio and a fade-out starting at the eight-second mark (the intro music is only 11 seconds, so the fade-out is also three-seconds in this case):


```
`$ sox intro.ogg intro.flac fade p 3 8`
```

The different kinds of fades (sine, linear, inverted parabola, and so on), as well as the options **fade** offers (fade-in, fade-out), are listed in the **sox** man page.

#### Effect syntax

Each effect plugin has its own syntax, so refer to the man page for details on how to invoke each one.

Effects can be daisy-chained in one command, at least to the extent that you want to combine them. In other words, there's no syntax to apply a **flanger** effect only during a six-second fade-out. For something that precise, you need a graphical sound wave editor or a digital audio workstation such as [LMMS][4] or [Rosegarden][5]. However, if you just have effects that you want to apply once, you can list them together in the same command.

This command applies a -1 **gain** effect, a tempo **stretch** of 1.35, and a **fade-out**:


```
$ sox intro.ogg output.flac gain -1 stretch 1.35 fade p 0 6
$ soxi output.flac

Input File     : 'output.flac'
Channels       : 1
Sample Rate    : 44100
Precision      : 16-bit
Duration       : 00:00:15.10 = 665808 samples...
File Size      : 712k
Bit Rate       : 377k
Sample Encoding: 16-bit FLAC
Comment        : 'Comment=Processed by SoX'
```

### Combining audio

SoX can also combine audio files, either by concatenating them or by mixing them.

To join (or _concatenate_) files into one, provide more than one input file in your command:


```
`$ sox countdown.mp3 intro.ogg output.flac`
```

In this example, **output.flac** now contains **countdown** audio, followed immediately by **intro** music.

If you want the two tracks to play over one another at the same time, though, you can use the **\--combine mix** option:


```
`$ sox --combine mix countdown.mp3 intro.ogg output.flac`
```

Imagine, however, that the two input files differed in more than just their codecs. It's not uncommon for vocal tracks to be recorded in mono (one channel), but for music to be recorded in at least stereo (two channels). SoX won't default to a solution, so you have to standardize the format of the two files yourself first.

#### Altering audio files

Options related to the file name listed _after_ it. For instance, the **\--channels** option in this command applies _only_ to **input.wav** and NOT to **example.ogg** or **output.flac**:


```
`$ sox --channels 2 input.wav example.ogg output.flac`
```

This means that the position of an option is very significant in SoX. Should you specify an option at the start of your command, you're essentially only overriding what SoX gleans from the input files on its own. Options placed immediately before the _output_ file, however, determine how SoX writes the audio data.

To solve the previous problem of incompatible channels, you can first standardize your inputs, and then mix:


```
$ sox countdown.mp3 --channels 2 countdown-stereo.flac gain -1
$ soxi countdown-stereo.flac

Input File     : 'countdown-stereo.flac'
Channels       : 2
Sample Rate    : 44100
Precision      : 16-bit
Duration       : 00:00:11.18 = 493056 samples...
File Size      : 545k
Bit Rate       : 390k
Sample Encoding: 16-bit FLAC
Comment        : 'Comment=Processed by SoX'

$ sox --combine mix \
countdown-stereo.flac \
intro.ogg \
output.flac
```

SoX absolutely requires multiple commands for complex actions, so it's normal to create several temporary and intermediate files as needed.

### Multichannel audio

Not all audio is constrained to one or two channels, of course. If you want to combine several audio channels into one file, you can do that with SoX and the **\--combine merge** option:


```
$ sox --combine merge countdown.mp3 intro.ogg output.flac
$ soxi output.flac

Input File     : 'output.flac'
Channels       : 3
[...]
```

### Easy audio manipulation

It might seem strange to work with audio using no visual interface, and for some tasks, SoX definitely isn't the best tool. However, for many tasks, SoX provides an easy and lightweight toolkit. SoX is a simple command with powerful potential. With it, you can convert audio, manipulate channels and waveforms, and even generate your own sounds. This article has only provided a brief overview of its capabilities, so go read its man page or [online documentation][2] and then see what you can create.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/linux-sox

作者：[Klaatu][a]
选题：[lujun9972][b]
译者：[FYJNEVERFOLLOWS](https://github.com/FYJNEVERFOLLOWS)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/klaatu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/hi-fi-stereo-vintage.png?itok=KYY3YQwE (HiFi vintage stereo)
[2]: http://sox.sourceforge.net/sox.html
[3]: http://sox.sourceforge.net
[4]: https://opensource.com/life/16/2/linux-multimedia-studio
[5]: https://opensource.com/article/18/3/make-sweet-music-digital-audio-workstation-rosegarden
