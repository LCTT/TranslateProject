[#]: subject: "Fedora Linux Flatpak cool apps to try for December"
[#]: via: "https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-december/"
[#]: author: "Eduard Lucena https://fedoramagazine.org/author/x3mboy/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Linux Flatpak cool apps to try for December
======

![][1]

Image by Daimar Steiner

This article introduces projects available in Flathub with installation instructions.

[Flathub][2] is the place to get and distribute apps for all of Linux. It is powered by Flatpak, allowing Flathub apps to run on almost any Linux distribution.

Please read “[Getting started with Flatpak][3]“. In order to enable flathub as your flatpak provider, use the instructions on the [flatpak site][4].

### Live Captions

Live Captions is an application that provides realtime automatic subtitles for the Linux desktop. Only English is available, at at this time. Other languages may produce gibberish or a bad phonetic translation.

Features:

  * Simple interface
  * Caption desktop/mic audio locally, powered by deep learning
  * No API keys, no proprietary services/libraries, no telemetry, no spying, no data collection, does not use network permission
  * Adjust font, font size, and toggle uppercase/lowercase
  * Less confident text is faded (darkened). This feature is configurable.



I honestly didn’t know about this application until it was recently recommended, and I was quite amazed. It’s really helpful for people with hearing problems. As is common with this kind of software, models need training and the project, in general, needs feedback.

Live Caption requires good hardware to function correctly, but it doesn’t need a dedicated GPU.

This project is marked as safe because it needs no special permission:

![][5]

You can install “Live Caption” by clicking the install button on the web site or manually using this command:

```

    flatpak install flathub net.sapples.LiveCaptions

```

### Pencil2D

[Pencil2D][6] is a 2D animation program that lets you easily create hand-drawn graphics using both bitmap and vector graphics. Its highlight features are:

  * Minimal Design
  * Raster & Vector
  * Cross-Platform
  * Open Source & Free



Be aware that this project is marked as “potentially unsafe” because it can access your filesystem:

![][7]

You can install “Pencil2D” by clicking the install button on the web site or manually using this command:

```

    flatpak install flathub org.pencil2d.Pencil2D

```

_**Pencil2D is also available as rpm on fedora’s repositories**_

### Frog

[Frog][8] is an application that allows you to extract text from images, websites, videos, and QR codes by taking a picture of the source.

Some of its features are:

  * Extract QR Code and barcode: Capture, extract and convert any QR codes or barcodes in a second.
  * Drag-n-drop: You do not need to make a screenshot of the image. Drag and drop it straight into the Frog window to extract the text.
  * Tons of supported languages: Frog supports a lot of languages, even those which it didn’t in the past.
  * Privacy: Frog use Portals to respect your privacy



Be aware that this project is marked as “potentially unsafe” because it can access your home folder:

![][9]

You can install “Frog” by clicking the install button on the web site or manually using this command:

```

    flatpak install flathub com.github.tenderowl.frog

```

### PDF Arranger

[PDF Arranger][10] is a small application, which helps the user merge or split pdf documents and rotate, crop and rearrange their pages using an interactive and intuitive graphical interface.

There is not much more to say than it’s a great application, very intuitive and easy to use.

Be aware that this project is marked as “potentially unsafe” because it can access your filesystem:

![][11]

You can install “PDF Arranger” by clicking the install button on the web site or manually using this command:

```

    flatpak install flathub com.github.jeromerobert.pdfarranger

```

_**PDF Arranger is also available as rpm on fedora’s repositories**_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-december/

作者：[Eduard Lucena][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/x3mboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/11/Flatpak_feature_im_Dec-23-816x345.jpg
[2]: https://flathub.org
[3]: https://fedoramagazine.org/getting-started-flatpak/
[4]: https://flatpak.org/setup/Fedora
[5]: https://fedoramagazine.org/wp-content/uploads/2023/10/image-2.png
[6]: https://flathub.org/apps/org.pencil2d.Pencil2D
[7]: https://fedoramagazine.org/wp-content/uploads/2023/11/image.png
[8]: https://flathub.org/apps/com.github.tenderowl.frog
[9]: https://fedoramagazine.org/wp-content/uploads/2023/11/image-1.png
[10]: https://flathub.org/apps/com.github.jeromerobert.pdfarranger
[11]: https://fedoramagazine.org/wp-content/uploads/2023/11/image-2.png
