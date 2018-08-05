translating---geekpi

4 open source media conversion tools for the Linux desktop
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_newmedia.png?itok=imgehG2v)

Ah, so many file formats—especially audio and video ones—can make for fun times if you get a file with an extension you don't recognize, if your media player doesn't play a file in that format, or if you want to use an open format.

So, what can a Linux user do? Turn to one of the many open source media conversion tools for the Linux desktop, of course. Let's take a look at four of them.

### Gnac

![](https://opensource.com/sites/default/files/uploads/gnac.png)

[Gnac][1] is one of my favorite audio converters and has been for years. It's easy to use, it's powerful, and it does one thing well—as any top-notch utility should.

How easy? You click a toolbar button to add one or more files to convert, choose a format to convert to, and then click **Convert**. The conversions are quick, and they're clean.

How powerful? Gnac can handle all the audio formats that the [GStreamer][2] multimedia framework supports. Out of the box, you can convert between Ogg, FLAC, AAC, MP3, WAV, and SPX. You can also change the conversion options for each format or add new ones.

### SoundConverter

![](https://opensource.com/sites/default/files/uploads/soundconverter.png)

If simplicity with a few extra features is your thing, then give [SoundConverter][3] a look. As its name states, SoundConverter works its magic only on audio files. Like Gnac, it can read the formats that GStreamer supports, and it can spit out Ogg Vorbis, MP3, FLAC, WAV, AAC, and Opus files.

Load individual files or an entire folder by either clicking **Add File** or dragging and dropping it into the SoundConverter window. Click **Convert** , and the software powers through the conversion. It's fast, too—I've converted a folder containing a couple dozen files in about a minute.

SoundConverter has options for setting the quality of your converted files. You can change the way files are named (for example, include a track number or album name in the title) and create subfolders for the converted files.

### WinFF

![](https://opensource.com/sites/default/files/uploads/winff.png)

[WinFF][4], on its own, isn't a converter. It's a graphical frontend to FFmpeg, which [Tim Nugent looked at][5] for Opensource.com. While WinFF doesn't have all the flexibility of FFmpeg, it makes FFmpeg easier to use and gets the job done quickly and fairly easily.

Although it's not the prettiest application out there, WinFF doesn't need to be. It's more than usable. You can choose what formats to convert to from a dropdown list and select several presets. On top of that, you can specify options like bitrates and frame rates, the number of audio channels to use, and even the size at which to crop videos.

The conversions, especially video, take a bit of time, but the results are generally quite good. Once in a while, the conversion gets a bit mangled—but not often enough to be a concern. And, as I said earlier, using WinFF can save me a bit of time.

### Miro Video Converter

![](https://opensource.com/sites/default/files/uploads/miro-main-window.png)

Not all video files are created equally. Some are in proprietary formats. Others look great on a monitor or TV screen but aren't optimized for a mobile device. That's where [Miro Video Converter][6] comes to the rescue.

Miro Video Converter has a heavy emphasis on mobile. It can convert video that you can play on Android phones, Apple devices, the PlayStation Portable, and the Kindle Fire. It will convert most common video formats to MP4, [WebM][7] , and [Ogg Theora][8] . You can find a full list of supported devices and formats [on Miro's website][6]

To use it, either drag and drop a file into the window or select the file that you want to convert. Then, click the Format menu to choose the format for the conversion. You can also click the Apple, Android, or Other menus to choose a device for which you want to convert the file. Miro Video Converter resizes the video for the device's screen resolution.

Do you have a favorite Linux media conversion application? Feel free to share it by leaving a comment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/media-conversion-tools-linux

作者：[Scott Nesbitt][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:http://gnac.sourceforge.net
[2]:http://www.gstreamer.net/
[3]:http://soundconverter.org/
[4]:https://www.biggmatt.com/winff/
[5]:https://opensource.com/article/17/6/ffmpeg-convert-media-file-formats
[6]:http://www.mirovideoconverter.com/
[7]:https://en.wikipedia.org/wiki/WebM
[8]:https://en.wikipedia.org/wiki/Ogg_theora
