[#]: subject: "Convert audio in batches on Linux with SoundConverter"
[#]: via: "https://opensource.com/article/21/12/soundconverter-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Convert audio in batches on Linux with SoundConverter
======
SoundConverter is a useful application not just because it does exactly
what its name says it does, but because it does it in batches and in
parallel.
![radio communication signals][1]

There are many file formats used to store digital audio, and they're good for different purposes. Digital audio is, of course, only a representation of sound, a rendering of soundwaves that get translated into sound by a decoder and a set of speakers. Some audio formats, generically called _lossless_ formats, aim to encode audio close to its original analog form. Still, there's a lot of data in the real world, and as yet, digital can only approximate it in very large files. Other audio formats, called _lossy_ formats, balance file size with a reasonable representation of sound.

There are plenty of great terminal commands for audio conversion. There's `sox` and `ffmpeg` and a handful of format-specific encoders, like `opusenc`, `flac`, `oggenc`, `fdkaac`, `wavpack`, and countless others.

### Install SoundConverter on Linux

SoundConverter is available on most Linux distributions from your package manager. On Fedora, Mageia, and similar distributions:


```
`$ sudo dnf install kdenlive`
```

On Elementary, Mint, and other Debian-based distributions:


```
`$ sudo apt install kdenlive`
```

However, I use SoundConverter as a [Flatpak][2].

### Converting audio

Once you encode audio into a lossy format, you've lost data. Whether that data matters or not depends on the ears of its audience. Some people can't hear the difference between a low-bitrate MP3 and a full quality FLAC file, and even those who can often don't notice the difference between a 320kbps Ogg Vorbis podcast and a 128 kbps Ogg Vorbis podcast. Converting audio from a compressed format to an uncompressed format doesn't recover lost data, but it's not uncommon to need to convert audio from one format to another. You might want to upload a file to a website that accepts only a specific format, or your mobile device might only play a specific format, or to email a file that's too large for your host, or you might just want to save space on your drive.

SoundConverter lets you convert audio in batches with ease. To convert audio with SoundConverter:

  1. Launch SoundConverter from your Applications or Activities menu.
  2. Click the **Add Files** button in the top left corner of the SoundConverter window, and select the files you want to convert.
  3. Once you've added files, click the **Preferences** button (the gear icon) in the top right corner of the window, and select the format you want to convert to. You can also set the file naming convention, the destination folder, and other options.
  4. When you're ready, click the **Convert** button in the top left corner.



![SoundConverter window][3]

(Seth Kenlon, [CC BY-SA 4.0][4])

### Parallel processing

SoundConverter is a useful application not just because it does exactly what its name says it does, but because it does it in batches and in parallel. Because modern computers have more than just CPU core, it's a waste of power and time to place each file in a queue to encode them one by one. SoundConverter can take several files at once and encode them simultaneously, meaning that converting 12 files can take the same time it would normally take to convert two—one after the other. You can do the same thing with a good terminal command, but only if you understand how to [launch parallel processes][5].

![SoundConverter preferences][6]

(Seth Kenlon, [CC BY-SA 4.0][4])

You can also convert stereo audio into mono files. This can be especially useful for podcasts and audiobooks. These usually consist of a person speaking from a singular location (the microphone) and don't require a sense of spatial location. In fact, reducing stereo files to mono makes the audio easier to hear should you have just one earbud and cuts the file size in half.

### The SoundConverter advantage

It's a great feature to have different file formats for audio, and yet it seems that whenever I've saved audio in one format, I inevitably need it in another format. There are several great Linux commands to [convert audio files][7], but sometimes you might want an application you can leave open on your desktop and drag and drop files to, and so there's [SoundConverter][8]. A simple, single-purpose application, SoundConverter does exactly, and only, what its name says: It converts sound from one format to another.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/soundconverter-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/sound-radio-noise-communication.png?itok=KMNn9QrZ (radio communication signals)
[2]: https://opensource.com/article/21/11/install-flatpak-linux
[3]: https://opensource.com/sites/default/files/uploads/soundconverter_0.jpg (SoundConverter window)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/article/18/5/gnu-parallel
[6]: https://opensource.com/sites/default/files/uploads/soundconvert-preferences.jpg (SoundConverter preferences)
[7]: https://opensource.com/article/17/6/ffmpeg-convert-media-file-formats
[8]: https://soundconverter.org/
