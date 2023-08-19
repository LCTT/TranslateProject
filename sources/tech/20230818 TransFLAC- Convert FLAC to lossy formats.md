[#]: subject: "TransFLAC: Convert FLAC to lossy formats"
[#]: via: "https://fedoramagazine.org/transflac-convert-flac-to-lossy-formats/"
[#]: author: "Gerald B. Cox https://fedoramagazine.org/author/gbcox/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

TransFLAC: Convert FLAC to lossy formats
======

![][1]

### **FLAC: The Lossless Audio Compression Format**

[FLAC][2], or Free Lossless Audio Codec, is a lossless audio compression format that preserves all the original audio data. This means that FLAC files can be decoded to an identical copy of the original audio file, without any loss in quality. However, lossless compression typically results in larger file sizes than lossy compression, which is why a method to convert FLAC to lossy formats is desirable. This is where TransFLAC can help.

FLAC is a popular format for archiving digital audio files, as well as for storing music collections on home computers. It is also becoming increasingly common for music streaming services to offer FLAC as an option for high-quality audio.

For portable devices, where storage space is limited, lossy audio formats such as MP3, AAC, and OGG Vorbis are often used. These formats can achieve much smaller file sizes than lossless formats, while still providing good sound quality.

In general, FLAC is a good choice for applications where lossless audio quality is important, such as archiving, mastering, and critical listening. Lossy formats are a good choice for applications where file size is more important, such as storing music on portable devices or streaming music over the internet.

### TransFLAC: Convert FLAC to lossy formats

[TransFLAC][3] is a command-line application that converts FLAC audio files to a lossy format at a specified quality level. It can keep both the FLAC and lossy libraries synchronized, either partially or fully. TransFLAC also synchronizes album art stored in the directory structure, such as cover, albumart, and folder files. You can run TransFLAC interactively in a terminal window, or you can schedule it to run automatically using applications such as cron or systemd.

The following four parameters must be specified:

  1. **Input FLAC Directory** : The directory to recursively search for FLAC audio files. The case of the directory name matters. TransFLAC will convert all FLAC audio files in the directory tree to the specified lossy codec format. The program will resolve any symlinks encountered and display the physical path.
  2. **Output Lossy Directory:** The directory to store the lossy audio files. The case of the directory name matters. The program will resolve any symlinks encountered and display the physical path.
  3. **Lossy Codec:** The codec used to convert the FLAC audio files. The case of the codec name does not matter. OPUS generally provides the best sound quality for a given file size or bitrate, and is the recommended codec.
Valid values are: [OPUS][4] | [OGG][5] | [AAC][6] | [MP3][7]
  4. **Codec Quality:** The quality preset used to encode the lossy audio files. The case of the quality name does not matter. **OPUS STANDARD** quality provides full bandwidth, stereo music, good audio quality approaching transparency, and is the recommended setting.
Valid values are: LOW | MEDIUM | STANDARD | HIGH | PREMIUM



**TransFLAC** allows for [customization][8] of certain items in the configuration. The project [wiki][9] provides additional information.

**Installation** on [Fedora Linux][10]:

```

    $ sudo dnf install transflac

```

![][11]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/transflac-convert-flac-to-lossy-formats/

作者：[Gerald B. Cox][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gbcox/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/08/transflac-816x345.jpg
[2]: https://xiph.org/flac/
[3]: https://bitbucket.org/gbcox/transflac/wiki/Home
[4]: https://opus-codec.org/
[5]: https://xiph.org/vorbis/
[6]: https://en.wikipedia.org/wiki/Fraunhofer_FDK_AAC
[7]: https://lame.sourceforge.io/
[8]: https://bitbucket.org/gbcox/transflac/wiki/src-tf-conf-override.sh
[9]: https://bitbucket.org/gbcox/transflac/wiki/TransFLAC
[10]: https://fedoraproject.org/
[11]: https://fedoramagazine.org/wp-content/uploads/2023/08/transflac_demo-2.svg
