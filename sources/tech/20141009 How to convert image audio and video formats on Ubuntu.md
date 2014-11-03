How to convert image, audio and video formats on Ubuntu
================================================================================
If you need to work with a variety of image, audio and video files encoded in all sorts of different formats, you are probably using more than one tools to convert among all those heterogeneous media formats. If there is a versatile all-in-one media conversion tool that is capable of dealing with all different image/audio/video formats, that will be awesome.

[Format Junkie][1] is one such all-in-one media conversion tool with an extremely user-friendly GUI. Better yet, it is free software! With Format Junkie, you can convert image, audio, video and archive files of pretty much all the popular formats simply with a few mouse clicks.

### Install Format Junkie on Ubuntu 12.04, 12.10 and 13.04 ###

Format Junkie is available for installation via Ubuntu PPA format-junkie-team. This PPA supports Ubuntu 12.04, 12.10 and 13.04. To install Format Junkie on one of those Ubuntu releases, simply run the following.

    $ sudo add-apt-repository ppa:format-junkie-team/release
    $ sudo apt-get update
    $ sudo apt-get install formatjunkie
    $ sudo ln -s /opt/extras.ubuntu.com/formatjunkie/formatjunkie /usr/bin/formatjunkie

### Install Format Junkie on Ubuntu 13.10 ###

If you are running Ubuntu 13.10 (Saucy Salamander), you can download and install .deb package for Ubuntu 13.04 as follows. Since the .deb package for Format Junkie requires quite a few dependent packages, install it using [gdebi deb installer][2].

On 32-bit Ubuntu 13.10:

    $ wget https://launchpad.net/~format-junkie-team/+archive/release/+files/formatjunkie_1.07-1~raring0.2_i386.deb
    $ sudo gdebi formatjunkie_1.07-1~raring0.2_i386.deb
    $ sudo ln -s /opt/extras.ubuntu.com/formatjunkie/formatjunkie /usr/bin/formatjunkie 

On 64-bit Ubuntu 13.10:

    $ wget https://launchpad.net/~format-junkie-team/+archive/release/+files/formatjunkie_1.07-1~raring0.2_amd64.deb
    $ sudo gdebi formatjunkie_1.07-1~raring0.2_amd64.deb
    $ sudo ln -s /opt/extras.ubuntu.com/formatjunkie/formatjunkie /usr/bin/formatjunkie 

### Install Format Junkie on Ubuntu 14.04 or Later ###

The currently available official Format Junkie .deb file requires libavcodec-extra-53 which has become obsolete starting from Ubuntu 14.04. Thus if you want to install Format Junkie on Ubuntu 14.04 or later, you can use the following third-party PPA repositories instead.

    $ sudo add-apt-repository ppa:jon-severinsson/ffmpeg
    $ sudo add-apt-repository ppa:noobslab/apps
    $ sudo apt-get update
    $ sudo apt-get install formatjunkie 

### How to Use Format Junkie ###

To start Format Junkie after installation, simply run:

    $ formatjunkie 

#### Convert audio, video, image and archive formats with Format Junkie ####

The user interface of Format Junkie is pretty simple and intuitive, as shown below. To choose among audio, video, image and iso media, click on one of four tabs at the top. You can add as many files as you want for batch conversion. After you add files, and select output format, simply click on "Start Converting" button to convert.

![](http://farm9.staticflickr.com/8107/8643695905_082b323059.jpg)

Format Junkie supports conversion among the following media formats:

- **Audio**: mp3, wav, ogg, wma, flac, m4r, aac, m4a, mp2.
- **Video**: avi, ogv, vob, mp4, 3gp, wmv, mkv, mpg, mov, flv, webm.
- **Image**: jpg, png, ico, bmp, svg, tif, pcx, pdf, tga, pnm.
- **Archive**: iso, cso. 

#### Subtitle encoding with Format Junkie ####

Besides media conversion, Format Junkie also provides GUI for subtitle encoding. Actual subtitle encoding is done by MEncoder. In order to do subtitle encoding via Format Junkie interface, first you need to install MEencoder.

    $ sudo apt-get install mencoder

Then click on "Advanced" tab on Format Junkie. Choose AVI/subtitle files to use for encoding, as shown below.

![](http://farm9.staticflickr.com/8100/8644791396_bfe602cd16.jpg)

Overall, Format Junkie is an extremely easy-to-use and versatile media conversion tool. One drawback, though, is that it does not allow any sort of customization during conversion (e.g., bitrate, fps, sampling frequency, image quality, size). So this tool is recommended for newbies who are looking for an easy-to-use simple media conversion tool.

Enjoyed this post? I will appreciate your like/share buttons on Facebook, Twitter and Google+.

--------------------------------------------------------------------------------

via: http://xmodulo.com/how-to-convert-image-audio-and-video-formats-on-ubuntu.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://launchpad.net/format-junkie
[2]:http://xmodulo.com/how-to-install-deb-file-with-dependencies.html
