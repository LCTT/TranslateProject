[#]: subject: "Fedora Linux Flatpak cool apps to try for September"
[#]: via: "https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-september/"
[#]: author: "Eduard Lucena https://fedoramagazine.org/author/x3mboy/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Linux Flatpak cool apps to try for September
======

![][1]

Photo by [Joanna Kosinska][2] on [Unsplash][3]

This article introduces projects available in Flathub with installation instructions.

[Flathub][4] is the place to get and distribute apps for all of Linux. It is powered by Flatpak, allowing Flathub apps to run on almost any Linux distribution.

Please read “[Getting started with Flatpak][5]“. In order to enable flathub as your flatpak provider, use the instructions on the [flatpak site][6].

### Flatseal

[Flatseal][7] is a graphical utility to review and modify permissions from your Flatpak applications. This is one of the most used apps in the flatpak world, it allows you to improve security on flatpak applications. However, it needs to be used with caution because you can make your permissions be too open.

It’s very simple to use: Simply launch Flatseal, select an application, and modify its permissions. Restart the application after making the changes. If anything goes wrong just press the reset button.

You can install “Flatseal” by clicking the install button on the web site or manually using this command:

```

    flatpak install flathub com.github.tchx84.Flatseal

```

_**Also available as rpm on fedora’s repositories**_

### Reco

[Reco][8] is an audio recording app that helps you recall and listen to things you listened to earlier.

Some of the features include:

  * Recording sounds from both your microphone and system at the same time.
  * Support formats like ALAC, FLAC, MP3, Ogg Vorbis, Opus, and WAV
  * Timed recording.
  * Autosaving or always-ask-where-to-save workflow.
  * Saving recording when the app quits.



I used it a lot to help me record interviews for the [Fedora Podcast][9]

You can install “Reco” by clicking the install button on the web site or manually using this command:

```

    flatpak install flathub com.github.ryonakano.reco

```

### Mini Text

[Mini Text][10] is a very small and minimalistic text viewer with minimal editing capabilities. It’s meant as a place to edit text to be pasted, it doesn’t have saving capabilities. It uses GTK4 and it’s interface integrates nicely with GNOME.

I found this to be very useful just to keep data that I want to paste anywhere, it doesn’t have unwanted and/or unneeded rich text capabilities, just plain text with minimal editing features.

You can install “Mini Text” by clicking the install button on the web site or manually using this command:

```

    flatpak install flathub io.github.nokse22.minitext

```

### Tagger

[Tagger][11] is a tag editor for those of us that still save the music locally.

Some of the features are:

  * Edit tags and album art of multiple files, even across subfolders, all at once
  * Support for multiple music file types (mp3, ogg, flac, wma, and wav)
  * Convert filenames to tags and tags to filenames with ease



You can install “Tagger” by clicking the install button on the web site or manually using this command:

```

    flatpak install flathub org.nickvision.tagger

```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-september/

作者：[Eduard Lucena][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/x3mboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/08/flatpak_cool_app_september-816x345.jpg
[2]: https://unsplash.com/@joannakosinska?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/photos/mjC9apK53a8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://flathub.org
[5]: https://fedoramagazine.org/getting-started-flatpak/
[6]: https://flatpak.org/setup/Fedora
[7]: https://flathub.org/apps/com.github.tchx84.Flatseal
[8]: https://flathub.org/apps/com.github.ryonakano.reco
[9]: https://fedoraproject.org/podcast/
[10]: https://flathub.org/apps/io.github.nokse22.minitext
[11]: https://flathub.org/apps/org.nickvision.tagger
