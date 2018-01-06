How To Create A Video From PDF Files In Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2017/10/Video-1-720x340.jpg)

I have a huge collection of PDF files, mostly Linux tutorials, in my tablet PC. Sometimes I feel too lazy to read them from the tablet. I thought It would be better If I can be able to create a video from PDF files and watch it in a big screen devices like a TV or a Computer. Though I have a little working experience with [**FFMpeg**][1], I am not aware of how to create a movie file using it. After a bit of Google searches, I came up with a good solution. For those who wanted to make a movie file from a set of PDF files, read on. It is not that difficult.

### Create A Video From PDF Files In Linux

For this purpose, you need to install **" FFMpeg"** and **" ImageMagick"** software in your system.

To install FFMpeg, refer the following link.

Imagemagick is available in the official repositories of most Linux distributions.

On **Arch Linux** and derivatives such as **Antergos** , **Manjaro Linux** , run the following command to install it.
```
sudo pacman -S imagemagick
```

**Debian, Ubuntu, Linux Mint:**
```
sudo apt-get install imagemagick
```

**Fedora:**
```
sudo dnf install imagemagick
```

**RHEL, CentOS, Scientific Linux:**
```
sudo yum install imagemagick
```

**SUSE, openSUSE:**
```
sudo zypper install imagemagick
```

After installing ffmpeg and imagemagick, convert your PDF file image format such as PNG or JPG like below.
```
convert -density 400 input.pdf picture.png
```

Here, **-density 400** specifies the horizontal resolution of the output image file(s).

The above command will convert all pages in the given PDF file to PNG format. Each page in the PDF file will be converted into a PNG file and saved in the current directory with file name **picture-1.png** , **picture-2.png** … and so on. It will take a while depending on the number of pages in the input PDF file.

Once all pages in the PDF converted into PNG format, run the following command to create a video file from the PNG files.
```
ffmpeg -r 1/10 -i picture-%01d.png -c:v libx264 -r 30 -pix_fmt yuv420p video.mp4
```

Here,

  * **-r 1/10** : Display each image for 10 seconds.
  * **-i picture-%01d.png** : Reads all pictures that starts with name **" picture-"**, following with 1 digit (%01d) and ending with **.png**. If the images name comes with 2 digits (I.e picture-10.png, picture11.png etc), use (%02d) in the above command.
  * **-c:v libx264** : Output video codec (i.e h264).
  * **-r 30** : framerate of output video
  * **-pix_fmt yuv420p** : Output video resolution
  * **video.mp4** : Output video file with .mp4 format.



Hurrah! The movie file is ready!! You can play it on any devices that supports .mp4 format. Next, I need to find a way to insert a cool music to my video. I hope it won't be difficult either.

If you wanted it in higher pixel resolution, you don't have to start all over again. Just convert the output video file to any other higher/lower resolution of your choice, say 720p, as shown below.
```
ffmpeg -i video.mp4 -vf scale=-1:720 video_720p.mp4
```

Please note that creating a video using ffmpeg requires a good configuration PC. While converting videos, ffmpeg will consume most of your system resources. I recommend to do this in high-end system.

And, that's all for now folks. Hope you find this useful. More good stuffs to come. Stay tuned!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/create-video-pdf-files-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/20-ffmpeg-commands-beginners/
