[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Easily Convert Audio File Formats with SoundConverter in Linux)
[#]: via: (https://itsfoss.com/sound-converter-linux/)
[#]: author: (Abhishek Prakash  https://itsfoss.com/author/abhishek/)
[#]: url: ( )

Easily Convert Audio File Formats with SoundConverter in Linux
======

**If you are looking for converting audio file formats to wav, mp3, ogg or any other format, SoundConverter is the tool you need in Linux.**

![Audio Converter in Linux][1]

So recently I purchased some DRM-free music. I got it from [SaReGaMa][2], the oldest and the largest music labels in India. The downloaded files were in HD quality and in WAV format.

Unfortunately, Rhythmbox doesn’t play the WAV files. On top of that, a single file was around 70 MB in size. Imagine transferring such large music files to smartphones. It would eat up a lot of space unnecessarily.

So I thought it was time to convert the WAV files to MP3, the evergreen and the most popular music file format.

And for this task, I needed an audio converter in Linux. In this quick tutorial, I’ll show you how can you convert your audio files from one format to another easily with a GUI tool called SoundCoverter.

### Installing SoundConverter in Linux

[SoundConverter][3] is a popular free and open source software. It should be available in the official repository of most Linux distributions.

Ubuntu/Linux Mint users can simply search for SoundConverter in the software center and install it from there.

![SoundConverter application in Software Center of Ubuntu][4]SoundConverter can be installed from Software Center

Alternatively, you can use the command line way. In Debian and Ubuntu based systems, you can use the following command:

```
sudo apt install soundconverter
```

For Arch, Fedora and other non-Debian based distributions, you can use the software center or the package manager of your distribution.

### Using SoundConverter to convert audio file formats in Linux

Once you have installed SoundConverter, search for it in the menu and start it.

The default interface looks like this and it cannot be more simple than this:

![SoundConverter application interface in Linux][5]Simple Interface

Converting audio file format is as easy as selecting the file and clicking on convert.

However, I would advise you to check the default settings at least on the first run. By default it converts the audio file to OGG file format and you may not want that.

![Preferences in SoundConverter][6]Default output settings can be changed in Preferences

To change the default output settings, click on the Preferences icon visible on the interface. You’ll see plenty of options to change here.

You can change the default output format, bitrate, quality etc. You can also choose if you want to keep the converted files in the same folder as the original or not.

There is also an option of automatically deleting the original file after conversion. I don’t think you should use that option.

You can also change the output file name. By default, it will just change the suffix but you can also choose to name it based on track number, title, artist etc. For that to happen, you should have proper metadata on the original file.

Speaking of metadata, have you heard of [MusicBrainz Picard][7]? This tool helps you automatically updates the metadata of your local music files.

### Conclusion

I have discussed [recording audio in Linux][8] previously with a similar tiny application. Such nifty tools actually make life easier with their focused aim of completing a certain task. You may use full-fledged and a lot better audio editing tool like [Audacity][9] but that may be complicated to use for smaller tasks like converting audio file formats.

I hope you like SoundConverter. If you use some other tool, do mention that in the comments and I may cover it here on It’s FOSS. Enjoy!

--------------------------------------------------------------------------------

via: https://itsfoss.com/sound-converter-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/Convert-audio-file-format-linux.png?resize=800%2C450&ssl=1
[2]: https://en.wikipedia.org/wiki/Saregama
[3]: http://soundconverter.org/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/sound-converter-software-center.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/sound-converter-app-linux.jpeg?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/sound-converter-app-linux-preferences.jpeg?resize=800%2C431&ssl=1
[7]: https://itsfoss.com/musicbrainz-picard/
[8]: https://itsfoss.com/record-streaming-audio/
[9]: https://www.audacityteam.org/
