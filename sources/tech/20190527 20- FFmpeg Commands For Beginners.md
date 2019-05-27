[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (20+ FFmpeg Commands For Beginners)
[#]: via: (https://www.ostechnix.com/20-ffmpeg-commands-beginners/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

20+ FFmpeg Commands For Beginners
======

![FFmpeg Commands][1]

In this guide, I will be explaining how to use FFmpeg multimedia framework to do various audio, video transcoding and conversion operations with examples. I have compiled most commonly and frequently used 20+ FFmpeg commands for beginners. I will keep updating this guide by adding more examples from time to time. Please bookmark this guide and come back in a while to check for the updates. Let us get started, shall we? If you haven’t installed FFmpeg in your Linux system yet, refer the following guide.

  * [**Install FFmpeg in Linux**][2]



### 20+ FFmpeg Commands For Beginners

The typical syntax of the FFmpeg command is:

```
ffmpeg [global_options] {[input_file_options] -i input_url} ...
 {[output_file_options] output_url} ...
```

We are now going to see some important and useful FFmpeg commands.

##### **1\. Getting audio/video file information**

To display your media file details, run:

```
$ ffmpeg -i video.mp4
```

**Sample output:**

```
ffmpeg version n4.1.3 Copyright (c) 2000-2019 the FFmpeg developers
built with gcc 8.2.1 (GCC) 20181127
configuration: --prefix=/usr --disable-debug --disable-static --disable-stripping --enable-fontconfig --enable-gmp --enable-gnutls --enable-gpl --enable-ladspa --enable-libaom --enable-libass --enable-libbluray --enable-libdrm --enable-libfreetype --enable-libfribidi --enable-libgsm --enable-libiec61883 --enable-libjack --enable-libmodplug --enable-libmp3lame --enable-libopencore_amrnb --enable-libopencore_amrwb --enable-libopenjpeg --enable-libopus --enable-libpulse --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libv4l2 --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxcb --enable-libxml2 --enable-libxvid --enable-nvdec --enable-nvenc --enable-omx --enable-shared --enable-version3
libavutil 56. 22.100 / 56. 22.100
libavcodec 58. 35.100 / 58. 35.100
libavformat 58. 20.100 / 58. 20.100
libavdevice 58. 5.100 / 58. 5.100
libavfilter 7. 40.101 / 7. 40.101
libswscale 5. 3.100 / 5. 3.100
libswresample 3. 3.100 / 3. 3.100
libpostproc 55. 3.100 / 55. 3.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'video.mp4':
Metadata:
major_brand : isom
minor_version : 512
compatible_brands: isomiso2avc1mp41
encoder : Lavf58.20.100
Duration: 00:00:28.79, start: 0.000000, bitrate: 454 kb/s
Stream #0:0(und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(tv, smpte170m/bt470bg/smpte170m), 1920x1080 [SAR 1:1 DAR 16:9], 318 kb/s, 30 fps, 30 tbr, 15360 tbn, 60 tbc (default)
Metadata:
handler_name : ISO Media file produced by Google Inc. Created on: 04/08/2019.
Stream #0:1(eng): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 128 kb/s (default)
Metadata:
handler_name : ISO Media file produced by Google Inc. Created on: 04/08/2019.
At least one output file must be specified
```

As you see in the above output, FFmpeg displays the media file information along with FFmpeg details such as version, configuration details, copyright notice, build and library options etc.

If you don’t want to see the FFmpeg banner and other details, but only the media file information, use **-hide_banner** flag like below.

```
$ ffmpeg -i video.mp4 -hide_banner
```

**Sample output:**

![][3]

View audio, video file information using FFMpeg

See? Now, it displays only the media file details.

** **Recommended Download** – [**Free Guide: “Spotify Music Streaming: The Unofficial Guide”**][4]

##### **2\. Converting video files to different formats**

FFmpeg is powerful audio and video converter, so It’s possible to convert media files between different formats. Say for example, to convert **mp4 file to avi file** , run:

```
$ ffmpeg -i video.mp4 video.avi
```

Similarly, you can convert media files to any format of your choice.

For example, to convert youtube **flv** format videos to **mpeg** format, run:

```
$ ffmpeg -i video.flv video.mpeg
```

If you want to preserve the quality of your source video file, use ‘-qscale 0’ parameter:

```
$ ffmpeg -i input.webm -qscale 0 output.mp4
```

To check list of supported formats by FFmpeg, run:

```
$ ffmpeg -formats
```

##### **3\. Converting video files to audio files**

To convert a video file to audio file, just specify the output format as .mp3, or .ogg, or any other audio formats.

The above command will convert **input.mp4** video file to **output.mp3** audio file.

```
$ ffmpeg -i input.mp4 -vn output.mp3
```

Also, you can use various audio transcoding options to the output file as shown below.

```
$ ffmpeg -i input.mp4 -vn -ar 44100 -ac 2 -ab 320 -f mp3 output.mp3
```

Here,

  * **-vn** – Indicates that we have disabled video recording in the output file.
  * **-ar** – Set the audio frequency of the output file. The common values used are 22050, 44100, 48000 Hz.
  * **-ac** – Set the number of audio channels.
  * **-ab** – Indicates the audio bitrate.
  * **-f** – Output file format. In our case, it’s mp3 format.



##### **4\. Change resolution of video files**

If you want to set a particular resolution to a video file, you can use following command:

```
$ ffmpeg -i input.mp4 -filter:v scale=1280:720 -c:a copy output.mp4
```

Or,

```
$ ffmpeg -i input.mp4 -s 1280x720 -c:a copy output.mp4
```

The above command will set the resolution of the given video file to 1280×720.

Similarly, to convert the above file to 640×480 size, run:

```
$ ffmpeg -i input.mp4 -filter:v scale=640:480 -c:a copy output.mp4
```

Or,

```
$ ffmpeg -i input.mp4 -s 640x480 -c:a copy output.mp4
```

This trick will help you to scale your video files to smaller display devices such as tablets and mobiles.

##### **5\. Compressing video files**

It is always an good idea to reduce the media files size to lower size to save the harddrive’s space.

The following command will compress and reduce the output file’s size.

```
$ ffmpeg -i input.mp4 -vf scale=1280:-1 -c:v libx264 -preset veryslow -crf 24 output.mp4
```

Please note that you will lose the quality if you try to reduce the video file size. You can lower that **crf** value to **23** or lower if **24** is too aggressive.

You could also transcode the audio down a bit and make it stereo to reduce the size by including the following options.

```
-ac 2 -c:a aac -strict -2 -b:a 128k
```

** **Recommended Download** – [**Free Guide: “PLEX, a Manual: Your Media, With Style”**][5]

##### **6\. Compressing Audio files**

Just like compressing video files, you can also compress audio files using **-ab** flag in order to save some disk space.

Let us say you have an audio file of 320 kbps bitrate. You want to compress it by changing the bitrate to any lower value like below.

```
$ ffmpeg -i input.mp3 -ab 128 output.mp3
```

The list of various available audio bitrates are:

  1. 96kbps
  2. 112kbps
  3. 128kbps
  4. 160kbps
  5. 192kbps
  6. 256kbps
  7. 320kbps



##### **7. Removing audio stream from a video file

**

If you don’t want to a audio from a video file, use **-an** flag.

```
$ ffmpeg -i input.mp4 -an output.mp4
```

Here, ‘an’ indicates no audio recording.

The above command will undo all audio related flags, because we don’t audio from the input.mp4.

##### **8\. Removing video stream from a media file**

Similarly, if you don’t want video stream, you could easily remove it from the media file using ‘vn’ flag. vn stands for no video recording. In other words, this command converts the given media file into audio file.

The following command will remove the video from the given media file.

```
$ ffmpeg -i input.mp4 -vn output.mp3
```

You can also mention the output file’s bitrate using ‘-ab’ flag as shown in the following example.

```
$ ffmpeg -i input.mp4 -vn -ab 320 output.mp3
```

##### **9. Extracting images from the video **

Another useful feature of FFmpeg is we can easily extract images from a video file. This could be very useful, if you want to create a photo album from a video file.

To extract images from a video file, use the following command:

```
$ ffmpeg -i input.mp4 -r 1 -f image2 image-%2d.png
```

Here,

  * **-r** – Set the frame rate. I.e the number of frames to be extracted into images per second. The default value is **25**.
  * **-f** – Indicates the output format i.e image format in our case.
  * **image-%2d.png** – Indicates how we want to name the extracted images. In this case, the names should start like image-01.png, image-02.png, image-03.png and so on. If you use %3d, then the name of images will start like image-001.png, image-002.png and so on.



##### **10\. Cropping videos**

FFMpeg allows to crop a given media file in any dimension of our choice.

The syntax to crop a vide ofile is given below:

```
ffmpeg -i input.mp4 -filter:v "crop=w:h:x:y" output.mp4
```

Here,

  * **input.mp4** – source video file.
  * **-filter:v** – Indicates the video filter.
  * **crop** – Indicates crop filter.
  * **w** – **Width** of the rectangle that we want to crop from the source video.
  * **h** – Height of the rectangle.
  * **x** – **x coordinate** of the rectangle that we want to crop from the source video.
  * **y** – y coordinate of the rectangle.



Let us say you want to a video with a **width of 640 pixels** and a **height of 480 pixels** , from the **position (200,150)** , the command would be:

```
$ ffmpeg -i input.mp4 -filter:v "crop=640:480:200:150" output.mp4
```

Please note that cropping videos will affect the quality. Do not do this unless it is necessary.

##### **11\. Convert a specific portion of a video**

Sometimes, you might want to convert only a specific portion of the video file to different format. Say for example, the following command will convert the **first 50 seconds** of given video.mp4 file to video.avi format.

```
$ ffmpeg -i input.mp4 -t 10 output.avi
```

Here, we specify the the time in seconds. Also, it is possible to specify the time in **hh.mm.ss** format.

##### **12\. Set the aspect ratio to video**

You can set the aspect ration to a video file using **-aspect** flag like below.

```
$ ffmpeg -i input.mp4 -aspect 16:9 output.mp4
```

The commonly used aspect ratios are:

  * 16:9
  * 4:3
  * 16:10
  * 5:4
  * 2:21:1
  * 2:35:1
  * 2:39:1



##### **13\. Adding poster image to audio files**

You can add the poster images to your files, so that the images will be displayed while playing the audio files. This could be useful to host audio files in Video hosting or sharing websites.

```
$ ffmpeg -loop 1 -i inputimage.jpg -i inputaudio.mp3 -c:v libx264 -c:a aac -strict experimental -b:a 192k -shortest output.mp4
```

##### **14. Trim a media file using start and stop times

**

To trim down a video to smaller clip using start and stop times, we can use the following command.

```
$ ffmpeg -i input.mp4 -ss 00:00:50 -codec copy -t 50 output.mp4
```

Here,

  * –s – Indicates the starting time of the video clip. In our example, starting time is the 50th second.
  * -t – Indicates the total time duration.



This is very helpful when you want to cut a part from an audio or video file using starting and ending time.

Similarly, we can trim down the audio file like below.

```
$ ffmpeg -i audio.mp3 -ss 00:01:54 -to 00:06:53 -c copy output.mp3
```

##### **15\. Split video files into multiple parts**

Some websites will allow you to upload only a specific size of video. In such cases, you can split the large video files into multiple smaller parts like below.

```
$ ffmpeg -i input.mp4 -t 00:00:30 -c copy part1.mp4 -ss 00:00:30 -codec copy part2.mp4
```

Here, **-t 00:00:30** indicates a part that is created from the start of the video to the 30th second of video. **-ss 00:00:30** shows the starting time stamp for the next part of video. It means that the 2nd part will start from the 30th second and will continue up to the end of the original video file.

** **Recommended Download** – [**Free Guide: “How to Start Your Own Successful Podcast”**][6]

##### **16\. Joining or merging multiple video parts into one**

FFmpeg will also join the multiple video parts and create a single video file.

Create **join.txt** file that contains the exact paths of the files that you want to join. All files should be same format (same codec). The path name of all files should be mentioned one by one like below.

```
file /home/sk/myvideos/part1.mp4
file /home/sk/myvideos/part2.mp4
file /home/sk/myvideos/part3.mp4
file /home/sk/myvideos/part4.mp4
```

Now, join all files using command:

```
$ ffmpeg -f concat -i join.txt -c copy output.mp4
```

If you get an error something like below;

```
[concat @ 0x555fed174cc0] Unsafe file name '/path/to/mp4'
join.txt: Operation not permitted
```

Add **“-safe 0”** :

```
$ ffmpeg -f concat -safe 0 -i join.txt -c copy output.mp4
```

The above command will join part1.mp4, part2.mp4, part3.mp4, and part4.mp4 files into a single file called “output.mp4”.

##### **17\. Add subtitles to a video file**

We can also add subtitles to a video file using FFmpeg. Download the correct subtitle for your video and add it your video as shown below.

```
$ fmpeg -i input.mp4 -i subtitle.srt -map 0 -map 1 -c copy -c:v libx264 -crf 23 -preset veryfast output.mp4
```

##### **18\. Preview or test video or audio files**

You might want to preview to verify or test whether the output file has been properly transcoded or not. To do so, you can play it from your Terminal with command:

```
$ ffplay video.mp4
```

[![][1]][7]

Similarly, you can test the audio files as shown below.

```
$ ffplay audio.mp3
```

[![][1]][8]

##### **19\. Increase/decrease video playback speed**

FFmpeg allows you to adjust the video playback speed.

To increase the video playback speed, run:

```
$ ffmpeg -i input.mp4 -vf "setpts=0.5*PTS" output.mp4
```

The command will double the speed of the video.

To slow down your video, you need to use a multiplier **greater than 1**. To decrease playback speed, run:

```
$ ffmpeg -i input.mp4 -vf "setpts=4.0*PTS" output.mp4
```

##### **20. Create Animated GIF

**

We use GIF images on almost all social and professional networks for various purposes. Using FFmpeg, we can easily and quickly create animated video files. The following guide explains how to create an animated GIF file using FFmpeg and ImageMagick in Unix-like systems.

  * [**How To Create Animated GIF In Linux**][9]



##### **21.** Create videos from PDF files

I collected many PDF files, mostly Linux tutorials, over the years and saved in my Tablet PC. Sometimes I feel too lazy to read them from the tablet. So, I decided to create a video from PDF files and watch it in a big screen devices like a TV or a Computer. If you ever wondered how to make a movie file from a collection of PDF files, the following guide will help.

  * [**How To Create A Video From PDF Files In Linux**][10]



##### **22\. Getting help**

In this guide, I have covered the most commonly used FFmpeg commands. It has a lot more different options to do various advanced functions. To learn more about it, refer the man page.

```
$ man ffmpeg
```

And, that’s all. I hope this guide will help you to getting started with FFmpeg. If you find this guide useful, please share it on your social, and professional networks. More good stuffs to come. Stay tuned!

Cheers!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/20-ffmpeg-commands-beginners/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2017/05/FFmpeg-Commands-720x340.png
[2]: https://www.ostechnix.com/install-ffmpeg-linux/
[3]: http://www.ostechnix.com/wp-content/uploads/2017/05/sk@sk_001.png
[4]: https://ostechnix.tradepub.com/free/w_make141/prgm.cgi
[5]: https://ostechnix.tradepub.com/free/w_make75/prgm.cgi
[6]: https://ostechnix.tradepub.com/free/w_make235/prgm.cgi
[7]: http://www.ostechnix.com/wp-content/uploads/2017/05/Menu_004.png
[8]: http://www.ostechnix.com/wp-content/uploads/2017/05/Menu_005-3.png
[9]: https://www.ostechnix.com/create-animated-gif-ubuntu-16-04/
[10]: https://www.ostechnix.com/create-video-pdf-files-linux/
