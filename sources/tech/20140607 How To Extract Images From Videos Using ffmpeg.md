linuhap翻译中
How To Extract Images From Videos Using ffmpeg
================================================================================
Hi unixmen readers,

Have you ever wanted to extract images from a video file? It is possible to do such thing in Linux and for this tutorial I will use ffmpeg to get images from a video.

### What is ffmpeg? ###

ffmpeg is a very useful command line program which can be used to transcode media files. It is part of the FFmpeg leading multimedia framework that has many functionalities such as the ability to  decode, encode, transcode, mux, demux, stream, filter and play pretty much anything that humans and machines have created.

There are many various tools included in the framework each of which has a specific role. For example the ffserver is used to stream multimedia for live broadcasts, ffprobe is used to analyze multimedia stream, ffplay can be used as a simple media player and **ffmpeg** has the ability to convert multimedia files between formats.

If you are interested the followings are the developer libraries included in the FFmpeg framework:

- libavutil is a library containing functions for simplifying programming, including random number generators, data structures, mathematics routines, core multimedia utilities, and much more.
- libavcodec is a library containing decoders and encoders for audio/video codecs.
- libavformat is a library containing demuxers and muxers for multimedia container formats.
- libavdevice is a library containing input and output devices for grabbing from and rendering to many common multimedia input/output software frameworks, including Video4Linux, Video4Linux2, VfW, and ALSA.
- libavfilter is a library containing media filters.
- libswscale is a library performing highly optimized image scaling and color space/pixel format conversion operations.
- libswresample is a library performing highly optimized audio resampling, rematrixing and sample format conversion operations.

**Note**: ffmpeg and FFmpeg are not the same. FFmpeg is the framework and the ffmpeg one of the utilities included on it.

### Let the action begin ###

In order to follow this tutorial you need to install the ffmpeg command line utility in your linux machine. Ubuntu users can easily install the ffmpeg utility by typing and running the following command in their terminal.

    sudo apt-get install ffmpeg

Fedora users can install ffmpeg directly from the repos.

    yum install ffmpeg

Or you can compile it from source. Before compiling and installing it from source you need to download it from the official website with the help of the following command.

    wget http://www.ffmpeg.org/releases/ffmpeg-2.2.3.tar.bz2

Extract the archive with the following command.

    tar -xvjf ffmpeg-2.2.3.tar.bz2

Once the archive is extracted run the following command.

    ./configure
    make

Once the compile is finished run the following command to install ffmpeg.

    su -c 'make install'

Not that everything is set up, all you have to is type a few commands in your terminal and you will be able to extract images from any type of video file.

Before going any further make sure you are in the same directory with the video file from which you want to extract images from. Use the cd command to navigate to the right directory. Since the video I am using for the purpose of this tutorial is in my Desktop i use the following command to navigate to my desktop.

    cd /home/oltjano/Desktop

Then I use the following command to extract images from my video file.

    ffmpeg -i "Тимати - Рентген ( Альбом '13')-C9Plztvv8ac.mp4" -r 1 -q:v 2 -f image2 image-3%d.jpeg

The **-i** option serves to get the input which in my case is the video file named **Тимати – Рентген ( Альбом ’13′)-C9Plztvv8ac.mp4**, the -r option sets the number of frames to be extracted as images every second. I like to extract one frame every second.

Then a very important option that should be mentioned and I like to use is the -q:v which is used to set the image quality of the images being extracted. I always get high quality images when extracting them from a video by using the value of 2.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/extract-images-videos-using-ffmpeg/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
