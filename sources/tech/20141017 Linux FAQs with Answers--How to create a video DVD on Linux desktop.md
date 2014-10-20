How to create a video DVD on Linux desktop
================================================================================
> **Question**: I want to create a video DVD from MP4 movie files. Is there an open-source DVD authoring tool that I can use to create a video DVD in the Linux desktop environment? 

[DeVeDe][1] is an open-source (GPLv3) DVD authoring software that allows you to create video DVD, VCD, SVCD or DivX from any number of video files. DeVeDe relies on other software such as Mplayer, FFMpeg, MEncoder, DVDAuthor, VCDImager and MKisofs for format conversion. As such, it supports a variety of popular input video/audio formats (e.g., .mp4, .avi, .mpg, .mkv). You can choose between PAL and NTSC video formats, and can add menus or subtitles.

DeVeDe can come in handy if you want to preserve or give away a copy of your vacation, family or entertainment videos.

### Installing Devede ###

#### Debian, Ubuntu and derivatives: ####

    # aptitude install devede

#### RHEL or CentOS: ####

Enable [EPEL][2] and [Nux Dextop][3] repositories, and then run:

    # yum install devede 

#### Fedora: ####

Enable [RPM Fusion][4] repository, and then run:

    # yum install devede 

### Creating a Video DVD with DeVeDe ###

Launch DeVeDe and choose Video DVD from the menu.

![](https://farm4.staticflickr.com/3930/15366785019_b5fe164573_z.jpg)

On the next screen, a title is automatically added to the collection by DeVeDe. You can edit its caption (1), add a file (2), and then add another title. Repeat this process as many times as needed.

![](https://farm4.staticflickr.com/3955/15550730461_e9d830ac64_z.jpg)

The "Title properties" box allows you to choose between six actions to be performed when the current title ends. Click OK when you're done:

![](https://farm4.staticflickr.com/3928/15554250892_061ef87db3_o.png)

The "File properties" box is used to add a file to the current title. Click on the folder icon (upper right corner), and browse your computer for a desired file. You can also add a subtitle file by clicking the Add button right next to the subtitles box. Once you have selected a video file (and alternatively a subtitle file as well), click on OK at the bottom right corner.

![](https://farm6.staticflickr.com/5608/15367271798_800a7ff9e9_z.jpg)

You can add as many files as needed (only limited by the DVD capacity).

![](https://farm4.staticflickr.com/3949/15550730511_7c3ca04026_z.jpg)

Next, edit the menu options. You can choose a background image and audio file to play while the main menu is displayed (which is as soon as the DVD is inserted into the player).

![](https://farm6.staticflickr.com/5614/15367271808_a4d3ba5639_z.jpg)

Finally, click on OK in the Menu options box to go back to the main disk structure, where you will need to click Forward in order to begin creating an .iso image with a video DVD structure.

![](https://farm4.staticflickr.com/3951/15550730531_c51e64feb9_o.png)

![](https://farm6.staticflickr.com/5602/15366785109_c9663eb0d5_o.png)

When DeVeDe is done creating a video DVD, we will be presented with the following box:

![](https://farm4.staticflickr.com/3936/15550730551_0c140ea276_o.png)

Now we can burn the .iso file (which contains a video DVD) to a disk, using [growisofs][5] or another DVD burning tool.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/create-video-dvd-linux-desktop.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.rastersoft.com/programas/devede.html
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[3]:http://ask.xmodulo.com/enable-nux-dextop-repository-centos-rhel.html
[4]:http://xmodulo.com/how-to-install-rpm-fusion-on-fedora.html
[5]:http://ask.xmodulo.com/burn-iso-nrg-image-dvd-command-line.html