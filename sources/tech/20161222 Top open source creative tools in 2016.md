Top open source creative tools in 2016
============================================================

### Whether you want to manipulate images, edit audio, or animate stories, there's a free and open source tool to do the trick.

 ![Top 34 open source creative tools in 2016 ](https://opensource.com/sites/default/files/styles/image-full-size/public/u23316/art-yearbook-paint-draw-create-creative.png?itok=KgEF_IN_ "Top 34 open source creative tools in 2016 ") 

>Image by : opensource.com

A few years ago, I gave a lightning talk at Red Hat Summit that took attendees on a tour of the [2012 open source creative tools][12] landscape. Open source tools have evolved a lot in the past few years, so let's take a tour of 2016 landscape.

### Core applications

These six applications are the juggernauts of open source design tools. They are well-established, mature projects with full feature sets, stable releases, and active development communities. All six applications are cross-platform; each is available on Linux, OS X, and Windows, although in some cases the Linux versions are the most quickly updated. These applications are so widely known, I've also included highlights of the latest features available that you may have missed if you don't closely follow their development.

If you'd like to follow new developments more closely, and perhaps even help out by testing the latest development versions of the first four of these applications—GIMP, Inkscape, Scribus, and MyPaint—you can install them easily on Linux using [Flatpak][13]. Nightly builds of each of these applications are available via Flatpak by [following the instructions][14] for _Nightly Graphics Apps_. One thing to note: If you'd like to install brushes or other extensions to each Flatpak version of the app, the directory to drop the extensions in will be under the directory corresponding to the application inside the **~/.var/app** directory.

### GIMP

[GIMP][15] [celebrated its 20th anniversary in 2015][16], making it one of the oldest open source creative applications out there. GIMP is a solid program for photo manipulation, basic graphic creation, and illustration. You can start using GIMP by trying simple tasks, such as cropping and resizing images, and over time work into a deep set of functionality. Available for Linux, Mac OS X, and Windows, GIMP is cross-platform and can open and export to a wide breadth of file formats, including those popularized by its proprietary analogue, Photoshop.

The GIMP team is currently working toward the 2.10 release; [2.8.18][17] is the latest stable version. More exciting is the unstable version, [2.9.4][18], with a revamped user interface featuring space-saving symbolic icons and dark themes, improved color management, more GEGL-based filters with split-preview, MyPaint brush support (shown in screenshot below), symmetrical drawing, and command-line batch processing. For more details, check out [the full release notes][19].

 ![GIMP screenshot](https://opensource.com/sites/default/files/gimp_520.png "GIMP screenshot") 

### Inkscape

[Inkscape][20] is a richly featured vector-based graphic design workhorse. Use it to create simple graphics, diagrams, layouts, or icon art.

The latest stable version is [0.91][21]; similarly to GIMP, more excitement can be found in a pre-release version, 0.92pre3, which was released November 2016\. The premiere feature of the latest pre-release is the [gradient mesh feature][22](demonstrated in screenshot below); new features introduce in the 0.91 release include [power stroke][23] for fully configurable calligraphic strokes (the "open" in "opensource.com" in the screenshot below uses powerstroke), the on-canvas measure tool, and [the new symbols dialog][24] (shown in the right side of the screenshot below). (Many symbol libraries for Inkscape are available on GitHub; [Xaviju's inkscape-open-symbols set][25] is fantastic.) A new feature available in development/nightly builds is the _Objects_ dialog that catalogs all objects in a document and provides tools to manage them.

 ![Inkscape screenshot](https://opensource.com/sites/default/files/inkscape_520.png "Inkscape screenshot") 

### Scribus

[Scribus][26] is a powerful desktop publishing and page layout tool. Scribus enables you to create sophisticated and beautiful items, including newsletters, books, and magazines, as well as other print pieces. Scribus has color management tools that can handle and output CMYK and spot colors for files that are ready for reliable reproduction at print shops.

[1.4.6][27] is the latest stable release of Scribus; the [1.5.x][28] series of releases is the most exciting as they serve as a preview to the upcoming 1.6.0 release. Version 1.5.3 features a Krita file (*.KRA) file import tool; other developments in the 1.5.x series include the _Table_ tool, text frame welding, footnotes, additional PDF formats for export, improved dictionary support, dockable palettes, a symbols tool, and expanded file format support.

 ![Scribus screenshot](https://opensource.com/sites/default/files/scribus_520.png "Scribus screenshot") 

### MyPaint

[MyPaint][29] is a drawing tablet-centric expressive drawing and illustration tool. It's lightweight and has a minimal interface with a rich set of keyboard shortcuts so that you can focus on your drawing without having to drop your pen.

[MyPaint 1.2.0][30] is the latest stable release and includes new features, such as the [intuitive inking tool][31] for tracing over pencil drawings, new flood fill tool, layer groups, brush and color history panel, user interface revamp including a dark theme and small symbolic icons, and editable vector layers. To try out the latest developments in MyPaint, I recommend installing the nightly Flatpak build, although there have not been significant feature additions since the 1.2.0 release.

 ![MyPaint screenshot](https://opensource.com/sites/default/files/mypaint_520.png "MyPaint screenshot") 

### Blender

Initially released in January 1995, [Blender][32], like GIMP, has been around for more than 20 years. Blender is a powerful open source 3D creation suite that includes tools for modeling, sculpting, rendering, realistic materials, rigging, animation, compositing, video editing, game creation, and simulation.

The latest stable Blender release is [2.78a][33]. The 2.78 release was a large one and includes features such as the revamped _Grease Pencil_ 2D animation tool; VR rendering support for spherical stereo images; and a new drawing tool for freehand curves.

 ![Inkscape screenshot](https://opensource.com/sites/default/files/blender_520.png "Inkscape screenshot") 

To try out the latest exciting Blender developments, you have many options, including:

*   The Blender Foundation makes [unstable daily builds][2] available on the official Blender website.
*   If you're looking for builds that include particular in-development features, [graphicall.org][3] is a community-moderated site that provides special versions of Blender (and occasionally other open source creative apps) to enable artists to try out the latest available code and experiments.
*   Mathieu Bridon has made development versions of Blender available via Flatpak. See his blog post for details: [Blender nightly in Flatpak][4].

### Krita

[Krita][34] is a digital drawing application with a deep set of capabilities. The application is geared toward illustrators, concept artists, and comic artists and is fully loaded with extras, such as brushes, palettes, patterns, and templates.

The latest stable version is [Krita 3.0.1][35], released in September 2016\. Features new to the 3.0.x series include 2D frame-by-frame animation; improved layer management and functionality; expanded and more usable shortcuts; improvements to grids, guides, and snapping; and soft-proofing.

 ![Krita screenshot](https://opensource.com/sites/default/files/krita_520.png "Krita screenshot") 

### Video tools

There are many, many options for open source video editing tools. Of the members of the pack, [Flowblade][36] is a newcomer and Kdenlive is the established, newbie-friendly, and most fully featured contender. The main criteria that may help you eliminate some of this array of options is supported platforms—some of these only support Linux. These all have active upstreams and the latest stable versions of each have been released recently, within weeks of each other.

### Kdenlive

[Kdenlive][37], which was initially released back in 2002, is a powerful non-linear video editor available for Linux and OS X (although the OS X version is out-of-date). Kdenlive has a user-friendly drag-and-drop-based user interface that accommodates beginners, and with the depth experts need.

Learn how to use Kdenlive with an [multi-part Kdenlive tutorial series][38] by Seth Kenlon.

*   Latest Stable: 16.08.2 (October 2016)

 ![](https://opensource.com/sites/default/files/images/life-uploads/kdenlive_6_leader.png) 

### Flowblade

Released in 2012, [Flowblade][39], a Linux-only video editor, is a relative newcomer.

*   Latest Stable: 1.8 (September 2016)

### Pitivi

[Pitivi][40] is a user-friendly free and open source video editor. Pitivi is written in [Python][41] (the "Pi" in Pitivi), uses the [GStreamer][42] multimedia framework, and has an active community.

*   Latest stable: 0.97 (August 2016)
*   Get the [latest version with Flatpak][5]

### Shotcut

[Shotcut][43] is a free, open source, cross-platform video editor that started [back in 2004][44] and was later rewritten by current lead developer [Dan Dennedy][45].

*   Latest stable: 16.11 (November 2016)
*   4K resolution support
*   Ships as a tarballed binary



### OpenShot Video Editor

Started in 2008, [OpenShot Video Editor][46] is a free, open source, easy-to-use, cross-platform video editor.

*   Latest stable: [2.1][6] (August 2016)


### Utilities

### SwatchBooker

[SwatchBooker][47] is a handy utility, and although it hasn't been updated in a few years, it's still useful. SwatchBooker helps users legally obtain color swatches from various manufacturers in a format that you can use with other free and open source tools, including Scribus.

### GNOME Color Manager

[GNOME Color Manager][48] is the built-in color management system for the GNOME desktop environment, the default desktop for a bunch of Linux distros. The tool allows you to create profiles for your display devices using a colorimeter, and also allows you to load/managed ICC color profiles for those devices.

### GNOME Wacom Control

[The GNOME Wacom controls][49] allow you to configure your Wacom tablet in the GNOME desktop environment; you can modify various options for interacting with the tablet, including customizing the sensitivity of the tablet and which monitors the tablet maps to.

### Xournal

[Xournal][50] is a humble but solid app that allows you to hand write/doodle notes using a tablet. Xournal is a useful tool for signing or otherwise annotating PDF documents.

### PDF Mod

[PDF Mod][51] is a handy utility for editing PDFs. PDF Mod lets users remove pages, add pages, bind multiple single PDFs together into a single PDF, reorder the pages, and rotate the pages.

### SparkleShare

[SparkleShare][52] is a git-backed file-sharing tool artists use to collaborate and share assets. Hook it up to a GitLab repo and you've got a nice open source infrastructure for asset management. The SparkleShare front end nullifies the inscrutability of git by providing a dropbox-like interface on top of it.

### Photography

### Darktable

[Darktable][53] is an application that allows you to develop digital RAW files and has a rich set of tools for the workflow management and non-destructive editing of photographic images. Darktable includes support for an extensive range of popular cameras and lenses.

 ![Changing color balance screenshot](https://opensource.com/sites/default/files/dt_colour.jpg "Changing color balance screenshot") 

### Entangle

[Entangle][54] allows you to tether your digital camera to your computer and enables you to control your camera completely from the computer.

### Hugin

[Hugin][55] is a tool that allows you to stitch together photos in order to create panoramic photos.

### 2D animation

### Synfig Studio

[Synfig Studio][56] is a vector-based 2D animation suite that also supports bitmap artwork and is tablet-friendly.

### Blender Grease Pencil

I covered Blender above, but particularly notable from a recent release is [a refactored grease pencil feature][57], which adds the ability to create 2D animations.


### Krita

[Krita][58] also now provides 2D animation functionality.


### Music and audio editing

### Audacity

[Audacity][59] is popular, user-friendly tool for editing audio files and recording sound.

### Ardour

[Ardour][60] is a digital audio workstation with an interface centered around a record, edit, and mix workflow. It's a little more complicated than Audacity to use but allows for automation and is generally more sophisticated. (Available for Linux, Mac OS X, and Windows.)

### Hydrogen

[Hydrogen][61] is an open source drum machine with an intuitive interface. It provides the ability to create and arrange various patterns using synthesized instruments.

### Mixxx

[Mixxx][62] is a four-deck DJ suite that allows you to DJ and mix songs together with powerful controls, including beat looping, time stretching, and pitch bending, as well as live broadcast your mixes and interface with DJ hardware controllers.

### Rosegarden

[Rosegarden][63] is a music composition suite that includes tools for score writing and music composition/editing and provides an audio and MIDI sequencer.

### MuseScore

[MuseScore][64] is a music score creation, notation, and editing tool with a community of musical score contributors.

### Additional creative tools

### MakeHuman

[MakeHuman][65] is a 3D graphical tool for creating photorealistic models of humanoid forms.

<iframe allowfullscreen="" frameborder="0" height="293" src="https://www.youtube.com/embed/WiEDGbRnXdE?rel=0" width="520"></iframe>

### Natron

[Natron][66] is a node-based compositor tool used for video post-production and motion graphic and special effect design.

### FontForge

[FontForge][67] is a typeface creation and editing tool. It allows you to edit letter forms in a typeface as well as generate fonts for using those typeface designs.

### Valentina

[Valentina][68] is an application for drafting sewing patterns.

### Calligra Flow

[Calligra Flow][69] is a Visio-like diagramming tool. (Available for Linux, Mac OS X, and Windows.)

### Resources

There are a lot of toys and goodies to try out there. Need some inspiration to start your exploration? These websites and conference are chock-full of tutorials and beautiful creative works to inspire you get you going:

1.  [pixls.us][7]: Blog hosted by photographer Pat David that focuses on free and open source tools and workflow for professional photographers.
2.  [David Revoy's Blog][8] The blog of David Revoy, an immensely talented free and open source illustrator, concept artist, and advocate, with credits on several of the Blender Foundation films.
3.  [The Open Source Creative Podcast][9]: Hosted by Opensource.com community moderator and columnist [Jason van Gumster][10], who is a Blender and GIMP expert, and author of _[Blender for Dummies][1]_, this podcast is directed squarely at those of us who enjoy open source creative tools and the culture around them.
4.  [Libre Graphics Meeting][11]: Annual conference for free and open source creative software developers and the creatives who use the software. This is the place to find out about what cool features are coming down the pipeline in your favorite open source creative tools, and to enjoy what their users are creating with them.

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/picture-343-8e0fb148b105b450634e30acd8f5b22b.png?itok=oxzTm70z)

Máirín Duffy - Máirín is a principal interaction designer at Red Hat. She is passionate about software freedom and free & open source tools, particularly in the creative domain: her favorite application is Inkscape (http://inkscape.org).

--------------------------------------------------------------------------------

via: https://opensource.com/article/16/12/yearbook-top-open-source-creative-tools-2016

作者：[Máirín Duffy][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mairin
[1]:http://www.blenderbasics.com/
[2]:https://builder.blender.org/download/
[3]:http://graphicall.org/
[4]:https://mathieu.daitauha.fr/blog/2016/09/23/blender-nightly-in-flatpak/
[5]:https://pitivi.wordpress.com/2016/07/18/get-pitivi-directly-from-us-with-flatpak/
[6]:http://www.openshotvideo.com/2016/08/openshot-21-released.html
[7]:http://pixls.us/
[8]:http://davidrevoy.com/
[9]:http://monsterjavaguns.com/podcast/
[10]:https://opensource.com/users/jason-van-gumster
[11]:http://libregraphicsmeeting.org/2016/
[12]:https://opensource.com/life/12/9/tour-through-open-source-creative-tools
[13]:https://opensource.com/business/16/8/flatpak
[14]:http://flatpak.org/apps.html
[15]:https://opensource.com/tags/gimp
[16]:https://www.gimp.org/news/2015/11/22/20-years-of-gimp-release-of-gimp-2816/
[17]:https://www.gimp.org/news/2016/07/14/gimp-2-8-18-released/
[18]:https://www.gimp.org/news/2016/07/13/gimp-2-9-4-released/
[19]:https://www.gimp.org/news/2016/07/13/gimp-2-9-4-released/
[20]:https://opensource.com/tags/inkscape
[21]:http://wiki.inkscape.org/wiki/index.php/Release_notes/0.91
[22]:http://wiki.inkscape.org/wiki/index.php/Mesh_Gradients
[23]:https://www.youtube.com/watch?v=IztyV-Dy4CE
[24]:https://inkscape.org/cs/~doctormo/%E2%98%85symbols-dialog
[25]:https://github.com/Xaviju/inkscape-open-symbols
[26]:https://opensource.com/tags/scribus
[27]:https://www.scribus.net/scribus-1-4-6-released/
[28]:https://www.scribus.net/scribus-1-5-2-released/
[29]:http://mypaint.org/
[30]:http://mypaint.org/blog/2016/01/15/mypaint-1.2.0-released/
[31]:https://github.com/mypaint/mypaint/wiki/v1.2-Inking-Tool
[32]:https://opensource.com/tags/blender
[33]:http://www.blender.org/features/2-78/
[34]:https://opensource.com/tags/krita
[35]:https://krita.org/en/item/krita-3-0-1-update-brings-numerous-fixes/
[36]:https://opensource.com/life/16/9/10-reasons-flowblade-linux-video-editor
[37]:https://opensource.com/tags/kdenlive
[38]:https://opensource.com/life/11/11/introduction-kdenlive
[39]:http://jliljebl.github.io/flowblade/
[40]:http://pitivi.org/
[41]:http://wiki.pitivi.org/wiki/Why_Python%3F
[42]:https://gstreamer.freedesktop.org/
[43]:http://shotcut.org/
[44]:http://permalink.gmane.org/gmane.comp.lib.fltk.general/2397
[45]:http://www.dennedy.org/
[46]:http://openshot.org/
[47]:http://www.selapa.net/swatchbooker/
[48]:https://help.gnome.org/users/gnome-help/stable/color.html.en
[49]:https://help.gnome.org/users/gnome-help/stable/wacom.html.en
[50]:http://xournal.sourceforge.net/
[51]:https://wiki.gnome.org/Apps/PdfMod
[52]:https://www.sparkleshare.org/
[53]:https://opensource.com/life/16/4/how-use-darktable-digital-darkroom
[54]:https://entangle-photo.org/
[55]:http://hugin.sourceforge.net/
[56]:https://opensource.com/article/16/12/synfig-studio-animation-software-tutorial
[57]:https://wiki.blender.org/index.php/Dev:Ref/Release_Notes/2.78/GPencil
[58]:https://opensource.com/tags/krita
[59]:https://opensource.com/tags/audacity
[60]:https://ardour.org/
[61]:http://www.hydrogen-music.org/
[62]:http://mixxx.org/
[63]:http://www.rosegardenmusic.com/
[64]:https://opensource.com/life/16/03/musescore-tutorial
[65]:http://makehuman.org/
[66]:https://natron.fr/
[67]:http://fontforge.github.io/en-US/
[68]:http://valentina-project.org/
[69]:https://www.calligra.org/flow/
