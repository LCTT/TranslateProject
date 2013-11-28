bazz2 领了
How to convert video to animated gif image on Linux
================================================================================
Once thought of as outdated art forms, animated GIF images have now come back. If you haven't noticed, quite a few online sharing and social networking sites are now supporting animated GIF images, for example, on [Tumblr][1], [Flickr][2], [Google+][3], and [partly on Facebook][4]. Due to their ease of consumption and sharing, GIF-ed animations are now part of mainstream Internet culture.

So some of you may wonder how you can create such animated GIF images. There are various online or offline tools dedicated to create animated GIF images. Another option is to create an animated GIF image off of an existing video clip. In this tutorial, I will describe **how to convert a video file to an animated GIF image on Linux**.

As a more useful example, let me demonstrate how to **convert a YouTube video to an animated GIF image**.

### Step 1: Download a YouTube Video ###

First, download a YouTube video that you would like to convert. You can use [youtube-dl][5] tool to save a YouTube video as an MP3 file. Suppose you saved your favorite YouTube video as "funny.mp3".

### Step 2: Extract Video Frames from a Video ###

Next, [install FFmpeg][5] on your Linux system, which I will use to extract video frames from the video.

The following command will extract individual video frames, and save them as GIF images. Make sure to use the output file format ("out%04d.gif") as is. That way, individual frames will be named and saved properly.

    ffmpeg -t <duration> -ss <starting position in hh:mm:ss format> -i <input_video> out%04d.gif

For example, if you want to extract the video frames of input video, for 5 seconds, starting at 10 seconds from the beginning, run the following command. 

    $ ffmpeg -t 5 -ss 00:00:10 -i funny.mp4 out%04d.gif 

After FFmpeg is completed, you will see a list of GIF files created, which are named as "out[\d+].gif".

### Step 3: Merge Video Frames into an Animated GIF ###

The next step is to merge individual GIF files into one animated GIF image. For that, you can use ImageMagick.

First, [install ImageMagick][7] on your Linux system if you haven't done so.

Then, run the following command to merge created GIF images into a single animated GIF file.

    convert -delay <ticks>x<ticks-per-second> -loop 0 out*gif <output-gif-file>

In the command, "-delay" is an option that controls the animation speed. This option indicates that [ticks/ticks-per-second] seconds must elapse before the display of the next frame. The "-loop 0" option indicates infinite loops of animation. If you want, you can specify "-loop N", in which case the animation will repeat itself N times.

For example, to create an animated GIF image with 20 frames-per-second and infinite loop, use the following command.

    $ convert -delay 1x20 -loop 0 out*.gif animation.gif 

### Step 4 (Optional): Reduce the Size of an Animated GIF ###

The last (optional) step is to reduce the size of the created GIF file, by using ImageMagick's GIF optimizer.

Use the following command to reduce the GIF size.

    convert -layers Optimize animation.gif animation_small.gif 

Now you are ready to share the GIF image on your social networks. The following shows a sample GIF image that I created from a cute YouTube video.

Enjoy. :-)

[![](http://farm8.staticflickr.com/7372/10988763123_4e89a18085_o.gif)][8]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/convert-video-animated-gif-image-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://staff.tumblr.com/post/15623140287/1mb-gifs
[2]:http://www.flickr.com/photos/markus-weldon-imagebank/4439159924/sizes/o/in/photostream/
[3]:https://plus.google.com/communities/110524851358723545415
[4]:http://mashable.com/2013/08/29/gifs-return-to-facebook/
[5]:http://xmodulo.com/2013/03/how-to-save-youtube-videos-on-linux.html
[6]:http://xmodulo.com/2013/06/how-to-install-ffmpeg-on-linux.html
[7]:http://ask.xmodulo.com/install-imagemagick-linux.html
[8]:http://www.flickr.com/photos/xmodulo/10988763123/
