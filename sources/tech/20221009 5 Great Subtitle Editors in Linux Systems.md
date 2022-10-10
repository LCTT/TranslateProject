[#]: subject: "5 Great Subtitle Editors in Linux Systems"
[#]: via: "https://www.debugpoint.com/3-great-subtitle-editors-in-linux-systems/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 Great Subtitle Editors in Linux Systems
======
In this article, I will talk about free and open-source subtitle editors for Linux systems.

With the advancement of technology, AI and ML, subtitle editors are not that much in demand. Because AI-ML models can generate subtitles on the fly. For example, most popular streaming platforms, such as YouTube, can automatically auto-generated subtitles on LIVE or recorded media.

There are few subtitle editors in the Linux world; those are available, for some of the development is already stopped (e.g. Aegisub) and become obsolete.

Here are some of the subtitle editors for Linux systems – that are still in use.

### Subtitle Editors for Ubuntu and other Linux

#### 1. Gaupol Subtitle Editor

Gaupol is a subtitle editor for text-based files. It helps to create subtitles, edit texts, and time the subtitles to match the video. The simple UI is based on the GTK+ toolkit and is easy to use, and helps bulk subtitle processing of multiple subtitle files. Gaupol is open-sourced (see source link below) and can run on all Unix-like OSes.

Gaupol includes a separately installable, user-interface-independent, general-purpose Python package, “aeidon”, for reading, writing, and manipulating text-based subtitle files.

Gaupol is released under the GNU General Public License (GPL).

#### How to install Gaupol

##### Ubuntu, Mint, Debian, elementary, Fedora

Gaupol comes with a Flatpak package that can run in any Linux distribution. You can download the Flatpak package from the below link. Make sure your [set up your system for Flatpak using Flathub][1] before installing.

[Download Gaupol][2]

#### Screenshots

![gaupol; Image Credit: gaupol][3]

#### Links

* Website: [gaupol][4]
* Download for other Linux distributions: [download][5]
* Source: [GitHub][6]
* Bug Report: [gaupol bug reports][7]

#### 2. Subtitle Composer

The Subtitle Composer is a video subtitle editor that supports basic and advanced editing operations. It comes with a wide range of features which makes it a complete subtitle editor. Some of the noteworthy features includes speech recognition from audio or video file, translations, live preview, sync and many more.

Installing Subtitle Composer is easy via Flatpak. [Set up your system as Flatpak for Flathub][8] and then hit the isntall button this page.

[Download and Install Subtitle Composer][9]

This app perhapes the best subtitle editor in this list.

You can learn more about it in the [home page.][10]

![Subtitle Composer][11]

#### 3. Subtitle Editor

Subtitle Editor is a GTK+3 tool to edit subtitles for GNU/Linux/*BSD. It can be used for new subtitles or as a tool to transform, edit, correct and refine existing subtitles. This program also shows sound waves, making synchronising subtitles to voices easier.

Subtitle Editor is free software released under the GNU General Public License (GPL3).

#### Feature Highlights

* Multiple document interface
* Video player integrated into the main window (based on GStreamer)
* Can play preview with an external video player (using MPlayer or other)
* Can be used for timing
* Generate and display a waveform
* Generate and display keyframes
* Can be used for translating
* Shows subtitles over the video
* Style Editor
* Spell checking
* Text correction (Space around punctuation, capitalize, empty subtitle …)
* Errors checking (Overlapping, too short or long duration …)
* Framerate conversion
* Edit times and frames
* Scale subtitles
* Split or joint subtitles
* Edit text and adjust the time (start, end)
* Find and replace (Support regular expressions)
* Sort subtitles
* Typewriter effect
* Lots of timing and editing tools

#### Supported File Formats

* Adobe Encore DVD
* Advanced SubStation Alpha
* Burnt-in timecode (BITC)
* MicroDVD
* MPL2
* MPsub (MPlayer subtitle)
* SBV
* Spruce STL
* SubRip
* Sub Station Alpha
* SubViewer 2.0
* Timed Text Authoring Format (TTAF)

#### How to install Subtitle Editor

##### Ubuntu, Mint, Debian, elementary, Fedora

There is no executable installer available yet. Download the tar file from the below link[subtitleeditor][12]

Extract the files. Run the below commands from the extracted directory to compile from the source:

```
./configure
make
sudo make install
```

#### Screenshots

![SubtitleEditor; Image Credit: subtitleeditor][13]

#### Links

* Website: [subtitleeditor][14]
* Download for other Linux distributions: [download][15]
* Source: [subtitle editor source][16]

#### 4. GNOME Subtitles

Gnome Subtitles is a subtitle editor for the GNOME desktop. It supports the most common text-based subtitle formats, video previewing, timings synchronization and subtitle translation.

#### Feature Highlights

* Synchronize using the video by setting two or more correct times (sync points)
* Auto-adjust timings based on two correct times/sync points
* Shift subtitles by a specified delay (can be based on the video)
* Convert between framerates
* Apply a reaction delay
* Shortcuts for quick synchronization
* Playback the videos showing subtitles with formatting
* Drag-and-drop files
* Can be used for timings synchronization
* Fast and slow-motion playback
* Subtitle translation support
* Merge and split subtitle lines
* Supports formatting while editing subtitles
* Spell checking support
* Edit subtitle headers
* Find and Replace supports regular expressions
* Multi-level undo/redo
* Drag-and-drop files
* Character coding and subtitle format auto-detection (on file open)
* Relaxed subtitle parsing to read subtitles that contain errors
* Support for more than 20 subtitle file formats

#### How to install GNOME Subtitles

##### Ubuntu, Mint, Debian, elementary

Run the below commands from the terminal and enter the password when prompted.

```
sudo add-apt-repository ppa:pedrocastro/ppa
sudo apt-get update
sudo apt-get install gnome-subtitles
```

#### Screenshots

![GnomeSubtitles; Imae Credit: GnomeSubtitle][17]

#### Links

* Website: [gnome subtitle][18]
* Download for other Linux distributions: [download][19]

#### 5. Subtitled

[Subtitled][20] is a modern subtitle editor that is full of features. Using this, you can create new subtitles, transcribe them, and edit them as well. It supports popular SRT format along with SSA, TTML, SBV, DFXP, VTT, XML, SCC, and SAMI as well.

![Introducing a new subtitle editor - Subtitld][21]

It is available as a snap application at the moment. If you are using Ubuntu, you can easily search in Software and install it from [this link][22].

And the same installation applies to all snap-supported Linux distributions. If you are a terminal-savvy person, you can install using the below.

It is also cross-platform, and a Windows build is available. Download from [here][23].

##### Links

* [Home page][24]
* [bug reports @GitLab][25]

### Wrapping Up

I hope this list of five subtitle editors in Linux systems can help you with your use case. The above list is current, and all of them are in active development as of publishing this version.

Do let me know if you know any other subtitle editor which is not on this list.

*Some image credits: Respective app owner*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/3-great-subtitle-editors-in-linux-systems/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/how-to-install-flatpak-apps-ubuntu-linux/
[2]: https://flathub.org/apps/details/io.otsaloma.gaupol
[3]: https://www.debugpoint.com/wp-content/uploads/2015/08/gaupol.png
[4]: https://otsaloma.io/gaupol/
[5]: https://repology.org/project/gaupol/versions
[6]: https://github.com/otsaloma/gaupol
[7]: https://github.com/otsaloma/gaupol
[8]: https://www.debugpoint.com/how-to-install-flatpak-apps-ubuntu-linux/
[9]: https://flathub.org/apps/details/org.kde.subtitlecomposer
[10]: https://subtitlecomposer.kde.org/
[11]: https://www.debugpoint.com/wp-content/uploads/2015/08/Subtitle-Composer.jpg
[12]: https://github.com/kitone/subtitleeditor/releases
[13]: https://www.debugpoint.com/wp-content/uploads/2015/08/SubtitleEditor.png
[14]: http://kitone.github.io/subtitleeditor/
[15]: https://github.com/kitone/subtitleeditor/releases
[16]: https://github.com/kitone/subtitleeditor
[17]: https://www.debugpoint.com/wp-content/uploads/2015/08/GnomeSubtitles.png
[18]: http://gnome-subtitles.sourceforge.net/
[19]: https://gnomesubtitles.org/download
[20]: https://subtitld.jonata.org/
[21]: https://youtu.be/nMvB21YjwAU
[22]: https://snapcraft.io/subtitld
[23]: https://subtitld.jonata.org/#download
[24]: https://subtitld.jonata.org/
[25]: https://gitlab.com/jonata/subtitld/-/issues
