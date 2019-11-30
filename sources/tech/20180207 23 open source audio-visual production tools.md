23 open source audio-visual production tools
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-photo-camera-blue.png?itok=AsIMZ9ga)

Open source is well established in cloud infrastructure, web hosting, embedded devices, and many other areas. Fewer people know that open source is a great option for producing professional-level audio-visual materials.

As a product owner and sometimes marketing support person, I produce a lot of content for end users: documentation, web articles, video tutorials, event booth materials, white papers, interviews, and more. I have found plenty of great open source software that helps me do my job producing audio, video, print, and screen graphics. There are a lot of [reasons][1] that people choose open source over proprietary options, and I've compiled this list of open source audio and video tools for people who:

  * want to switch to GNU/Linux, but need to start slowly with cross-platform software on their regular operating system;
  * are already open source enthusiasts, but are new to open source A/V software and want to know which options to trust;
  * want to discover new tools to fuel their creativity and don't want to use the same approaches or software everyone else uses; or
  * have some other reason to use open source A/V solutions (if this is you, share your reason in the comments).



Fortunately, there is a lot of open source software available for A/V creators, as well as hardware that supports those applications. All of the software on this list meets the following criteria:

  * cross-platform
  * open source (for software and drivers)
  * stable
  * actively maintained
  * well documented and supported



I've divided this list into graphics, audio, video, and animation solutions. Note that the software applications in this article are not exact equivalents of well-known proprietary software, they'll require you to learn new applications, and you may need to modify your workflow, but learning new tools enables you to create differently.

### Graphics

I create a lot of graphics for print and web, including logos, banners, video titles, and mockups. Here are some of the open source applications I use, as well as the hardware I use with them.

#### Software

**1.[Inkscape][2]** (vector graphics)
Inkscape is a good vector graphics editor for creating SVG and PDF files in the RGB color space. (It can create CMYK images, but that's not the main aim.) It's a lifesaver for manipulating SVG maps and charts for web applications; not only can you open files with the integrated XML editor, you can also see all of an object's parameters. One drawback: it is not well optimized on Mac. For examples, see [Inkscape's gallery][3].

**2.[GIMP][4]** (picture editor)
GIMP is my favorite application to edit images, including manipulating color, cropping and resizing, and (especially) optimizing file size for the web (many of my Photoshop-using colleagues ask me to do that last step for them). You can also create and draw images from scratch, but GIMP is not my favorite tool for that. See [GIMP Artists on DeviantArt][5] for examples.

**3.[Krita][6]** (digital painting)
So you have this beautiful Wacom drawing tablet on your desk, and you want to try a true digital painting application? Krita is what you need to create beautiful drawings and paintings. See [Krita's Gallery][7] to see what I mean.

**4.[Scribus][8]** (desktop publishing)
You can use Scribus to create a complete document, or just to convert a PDF from Inkscape or Libre Office from RGB to CMYK. One feature I really like: You can simulate and check what people with visual disabilities will experience with a Scribus document. I count on Scribus when I send PDF files to a commercial printer. While printing companies may be used to files created with proprietary solutions like InDesign, if your Scribus file is done correctly, your printer won't have any issues. Free trick: The first time you send a file, don't tell the printer the name of the software you used to create it. See [Made with Scribus][9] for examples of documents created with this software.

**5.[RawTherapee][10]** (RAW image photo development)
RawTherapee is the only completely cross-platform alternative to Lightroom I know of. You can use your camera in RAW mode, and then use RawTherapee to  "develop" your picture. It provides a very powerful engine and a non-destructive editor. For examples, see [RawTherapee screenshots][11].

**6.[LibreOffice Draw][12]** (desktop publishing)
Although you may not think of LibreOffice Draw as a professional desktop publishing solution, it can save you in many situations; for example, if you are creating whitepapers, diagrams, or posters that other people (even those who don't know graphics software) can update later. Not only is it easy to use, it's also a great alternative to Impress or PowerPoint for creating interesting documents.

#### Graphics hardware

**Graphics tablets**
[Wacom][13] tablets (and compatibles) are usually well supported on all operating systems.

**Color calibration**
Color calibration products are available on all operating systems, including GNU/Linux. The [Spyder][14] products by Datacolor are well supported with applications for all platforms.

**Scanners and printers**
Graphic artists need the colors they output (whether print or electronic) to be accurate. But devices that are truly cross-platform, with easy-to-install drivers for all platform, are not as common as you'd think. Your best choices are scanners that are compatible with TWAIN and printers that are compatible with Postscript. In my experience, professional-range printers and scanners from Epson and Xerox are less likely to have driver issues, and they always work out of the box, with beautiful and accurate colors.

### Audio

There are plenty of open source audio software options for musicians, video makers, game makers, music publishers, and others. Here are the ones that I've used for content creation and audio recording.

#### Software

**7. [Ardour][15] **(digital audio recording)
For recording and editing audio, the best alternative to the professional Pro Tools music-creation software is, hands down, Ardour. It sounds great, the mixer section is complete and flexible, it supports your favorite plugins, and it makes it very easy to edit, listen, and compare your modifications. I use it a lot for audio recording or mixing sound on videos. It's not easy to find music recorded with Ardour, because musicians rarely credit the software they use. However, you can get an idea of its capabilities by looking at its [features and screenshots][16].

(If you are looking for an "analog feeling" in term of sound and workflow, you can try [Harrison Mixbus][17], which is not an open source project, but is heavily based on Ardour, with Harrison's analog console emulator. I really like to work with it and my customers like the sound. Mixbus is cross platform.)

**8.[Audacity][18]** (audio editing)
Audacity is the  "Swiss Army knife" of audio software. It's not perfect, but you can do almost everything with it. Plus it's very easy to use, and anyone can learn it in a few minutes. Like Ardour, it's hard to find work credited to Audacity, but you can find ways to use it on these [screenshots][19].

**9.[LMMS][20]** (music production)
LMMS, designed as an alternative to FL Studio, might not be as popular, but it is very complete and easy to use. You can use your favorite plugins, edit instruments using  "piano roll" sequencing, play drum samples with a step sequencer, mix your tracks ... almost anything is possible. I use it to create audio loops for videos when I don't have the time to record musicians. See [The Best of LMMS][21] playlists for examples.

**10.[Mixxx][22]** (DJ, music mixing)
If you need powerful software to mix music and play DJ, Mixx is the one to use. It's compatible with most MIDI controllers, timecoded discs, and dedicated sound cards. You can manage your music library, add effects, and have fun. Take a look at the [features][23] to see how it works.

#### Audio interface hardware

While you can record audio with any computer's sound card, to record well, you need an audio interface—a specialized type of external sound card that records high-quality audio input. For cross-platform compatibility, most "USB Class Compliant" or "compatible with iOS" audio interface devices should work for MIDI or other audio. Below is a list of cross-platform devices I use and know well.

**[Behringer U-PHORIA UMC22][24]**
The UMC22 is the cheapest option you should consider. With less expensive options, the preamps are too noisy and the quality of the box is very low.

**[Presonus AudioBox USB][25]**
The AudioBox USB is one of the first USB Class Compliant (and thereby cross-platform) recording systems out there. It is very robust and available on the second-hand market.

**[Focusrite Scarlett][26]**
The Scarlett range is, in my opinion, the highest quality cross-platform sound card available. The various options range from devices with two to 18 input/outputs. You can find first-version models on the second-hand market, and the new second version offers better preamps and specs. I've worked a lot with the [2i2][27] model.

**[Arturia AudioFuse][28]**
The AudioFuse allows you to plug in nearly anything, from a microphone to a vinyl disc player to various digital inputs. It provides both great sound and great design, and it's what I'm using the most now. It is cross-platform, but the configuration software is not yet available for GNU/Linux. It remembers my configuration even after I unplug it from my Windows PC, but really, Arturia, please be serious and make the software available for GNU/Linux.

#### MIDI controllers

A MIDI controller is a musical instrument—e.g., keyboards, drum pads, etc.—that allow you to control music software and hardware. Most of the recent USB MIDI controllers are cross-platform and compatible with the main software used to record and edit audio. Web-based tutorials will help you configure them for different software; although it may be harder to find info on GNU/Linux configurations, they will work. I've used many Akai and M-Audio devices without any issues. It's best to try a musical instrument before you buy, at least to listen to the sound quality or to touch the buttons.

#### Audio codecs

Audio codecs compress and decompress digital audio to deliver the best-quality audio at the smallest possible file size. Fortunately, the best codec for listening and streaming happens to be open source: [FLAC][29]. [Ogg Vorbis][30] is another open source audio codec worth checking out; it's far better than MP3 at the same bitrate. If you need to export audio in different file formats, I recommend always exporting and archiving audio at the best possible quality, then compressing a specific version if it's needed.

### Video

The impact of video in brand communications is significant. Even if you are not a video specialist, it's smart to learn the basics.

#### Software

**11.[VLC][31]** (video player and converter)
Originally developed for media streaming, VLC is now known for its ability to read all video formats on all devices. It's very useful; for example, you can also use it to convert a video into another codec or container or to recover a broken video.

**12.[OpenShot][32]** (video editor)
OpenShot is simple software that produces great results, especially for short videos. (It is a bit limited in terms of editing or improving the sound of a video, but it will do the job.) I especially like the tool to move, resize, or crop a clip; it's perfect to create intros and outros that you can export, then use in a more complex editor. You can see [examples][33] (and get more information) on OpenShot's website.

**13.[Shotcut][34]** (video editor)
I think Shotcut is a bit more complete than OpenShot—it's a very good competitor to the basic editors in your operating system, and it supports 4K and professional codecs. Give it a try, I think you will love it. You can see examples in these [video tutorials][35].

**14.[Blender Velvets][36]** (vdeo editing, compositing, effects)
While the learning curve is not the lightest on this list, Blender Velvets is one of the most powerful solutions you will find. It is a collection of extensions and scripts, created by movie makers, that transform the Blender 3D creation software into a 2D video editor. While it's complexity means it's not my top choice for video editing, you can find plenty of tutorials on YouTube and other sites, and once you learn it, you can do everything with this software. Watch this [tutorial video][37] to see its functions and how it works.

**15.[Natron][38]** (compositing)
I don't use Natron, but I've gotten great feedback from people who do. It's an alternative to Adobe's After Effects, but works differently. To learn more, watch a few video tutorials, like these on [Natron's YouTube][39] channel.

**16.[OBS][40]** (live editing, recording, and streaming)
Open Broadcaster Software (OBS) is the leading solution for recording or [livestreaming][41] e-sports and video games on YouTube or Twitch. I use it a lot to record users' screens, conferences, meetups, etc. For more information, see the tutorial I wrote for Opensource.com about recording live presentations, [Part 1: Choosing your equipment][42] and [Part 2: Software setup][43].

#### Video hardware

First things first: You will need a powerful workstation with a fast hard drive and updated software and drivers.

**Graphics processing unit (GPU)**
Some software on this list, including Blender and Shotcut, use OpenGL and hardware acceleration, which have high GPU demands. I recommend the most powerful GPU you can afford. I've had good experience with AMD and Nvidia, depending on the platform. Don't forget to install the latest drivers.

**Hard drives**
In general, the faster and bigger the hard drive, the better it is for video. Don't forget to configure your software to use the right path.

**Video capture hardware**

  * [Blackmagic Design][44]: Blackmagic provides very good, professional-grade video capture and playback hardware. Drivers are available for Mac, Windows, and GNU/Linux (but not all distributions).
  * [Epiphan][45]: Among Epiphan's professional USB video capture devices is a new USB Class Compliant model for HDMI and high screen resolutions. However, you can find the older VGA devices on the secondhand market, for which they continue to provide dedicated drivers for GNU/Linux and Windows.



#### Video codecs

Unfortunately, it is still difficult to work with open source codecs. For example, many cameras use proprietary codecs to record videos in H.264 and sound in AC3, in a format called AVCHD. Therefore, we have to be pragmatic and use what is available.

The good news is that the content industry is moving to open source codecs to avoid fees and to use open standards. For distribution and streaming, [Google'][46][s WebM][46] is a good open source codec, and most video editors can export in that format. Also, [GoPro's][47][Cineform][47] codec for very high resolution and 360° video is now open source. Hopefully more devices and vendors will use it soon.

### 2D and 3D animation

Animation is not my field of expertise, so I've asked my friends who are working on animated content, including movies and series for kids, for their recommendations to compile this list.

#### Software

**17. [Blender][48] **(3D modeling and rendering)
Blender is the top open source and cross-platform software for 3D modeling and rendering. You can do your entire project directly in Blender, or use it to create 3D effects for a movie or video. You will find a lot of video tutorials on the web, so even though it isn't simple software, it's very easy to get started. Blender is a very active project and regularly produces short movies to showcase the technology. You can see some of them on [Blender Open Movies][49].

**18.[Synfig Studio][50]** (2D animation)
The first time I used Synfig, it reminded me of the good, old Macromedia Flash editor. Since then, it has grown into a full-featured 2D animation studio. You can use it to produce promotional stories, commercials, presentations, or original intros, outros, and transitions for your videos, or even to work on full animated movies. See [Synfig's portfolio][51] for some examples.

**19.[TupiTube][52]** (stop-motion, 2D animation)
TupiTube is an excellent way to learn the basics of 2D animation. You can transform a set of drawings or other pictures into a video or create an animated GIF or small loops. It's quite simple software, but very complete. Check out [TupiTube's YouTube][53] channel for some tutorials and examples.

#### Hardware

Animation uses the same hardware as graphic design, so look at the hardware list in the first section of this article for recommendations.

One additional note: You will need a powerful GPU for 3D modeling and rendering. The choices can be limited, depending on your platform or PC maker, but don't forget to install the latest drivers. Carefully choose your graphics card: they are expensive and critical for big 3D projects, particularly in the rendering step.

### Linux options

If you are a GNU/Linux user, I have some more good options for you. They aren't fully cross-platform, but some of them have a Windows installer, and some can be installed on Mac with Macports.

**20.[Kdenlive][54]** (video editor)
With its last release (a few months ago), Kdenlive became my favorite video editor, especially when I work on a long video on my Linux machine. If you are a regular user of popular non-linear video editors, Kdenlive (which stands for KDE Non-Linear Video Editor) will be easy for you to use. It has good video and audio effects, is great when you need to work on details, and works on BSD and MacOS (although it's aimed at GNU/Linux) and is being ported to Windows.

**21.[Darktable][55]** (RAW development)
Darktable is a very complete alternative to DxO that is made by photographers for photographers. Some research projects are using it as a platform for development and testing of new image processing algorithms. It is a very active project, and I can't wait until it becomes truly cross-platform.

**22.[MyPaint][56]** (digital painting)
MyPaint is like a light table for digital painting. It works well with Wacom devices, and its brush engine is particularly appreciated, so GIMP developers are looking closely at it.

**23.[Shutter][57]** (desktop screenshots)
When I create tutorials, I use a lot of screenshots to illustrate them. My favorite screenshot tool for GNU/Linux is Shutter; actually, I can't find an equivalent in terms of features for Windows or Mac. One missing piece: I would like to see Shutter add a feature to create animated GIF screenshots over a few seconds.

I hope this has convinced you that open source software is an excellent, viable solution for A/V content producers. If you are using other open source software—or have advice about using cross-platform software and hardware—for audio and video projects, please share your ideas in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/open-source-audio-visual-production-tools

作者：[Antoine Thomas][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ttoine
[1]:https://opensource.com/resources/what-open-source
[2]:https://inkscape.org/
[3]:https://inkscape.org/en/gallery/
[4]:https://www.gimp.org/
[5]:https://gimp-artists.deviantart.com/gallery/
[6]:https://krita.org/
[7]:https://krita.org/en/features/gallery/
[8]:https://www.scribus.net/
[9]:https://www.scribus.net/category/made-with-scribus/
[10]:http://rawtherapee.com/
[11]:http://rawtherapee.com/blog/screenshots
[12]:https://www.libreoffice.org/discover/draw/
[13]:http://www.wacom.com/en-us
[14]:http://www.datacolor.com/photography-design/product-overview/#workflow_2
[15]:https://www.ardour.org/
[16]:http://ardour.org/features.html
[17]:http://harrisonconsoles.com/site/mixbus.html
[18]:http://www.audacityteam.org/
[19]:http://www.audacityteam.org/about/screenshots/
[20]:https://lmms.io/
[21]:https://lmms.io/showcase/
[22]:https://www.mixxx.org/
[23]:https://www.mixxx.org/features/
[24]:http://www.musictri.be/Categories/Behringer/Computer-Audio/Interfaces/UMC22/p/P0AUX
[25]:https://www.presonus.com/products/audiobox-usb
[26]:https://us.focusrite.com/scarlett-range
[27]:https://us.focusrite.com/usb-audio-interfaces/scarlett-2i2
[28]:https://www.arturia.com/products/audio/audiofuse/overview
[29]:https://en.wikipedia.org/wiki/FLAC
[30]:https://xiph.org/vorbis/
[31]:https://www.videolan.org/
[32]:https://www.openshot.org/
[33]:https://www.openshot.org/videos/
[34]:https://shotcut.com/
[35]:https://shotcut.org/tutorials/
[36]:http://blendervelvets.org/
[37]:http://blendervelvets.org/video-tutorial-new-functions-for-the-blender-velvets/
[38]:https://natron.fr/
[39]:https://www.youtube.com/playlist?list=PL2n8LbT_b5IeMwi3AIzqG4Rbg8y7d6Amk
[40]:https://obsproject.com/
[41]:https://opensource.com/article/17/7/obs-studio-pro-level-streaming
[42]:https://opensource.com/article/17/9/equipment-recording-presentations
[43]:https://opensource.com/article/17/9/equipment-setup-live-presentations
[44]:https://www.blackmagicdesign.com/
[45]:https://www.epiphan.com/
[46]:https://www.webmproject.org/
[47]:https://fr.gopro.com/news/gopro-open-sources-the-cineform-codec
[48]:https://www.blender.org/
[49]:https://www.blender.org/about/projects/
[50]:https://www.synfig.org/
[51]:https://www.synfig.org/#portfolio
[52]:https://maefloresta.com/
[53]:https://www.youtube.com/channel/UCBavSfmoZDnqZalr52QZRDw
[54]:https://kdenlive.org/
[55]:https://www.darktable.org/
[56]:http://mypaint.org/
[57]:http://shutter-project.org/
