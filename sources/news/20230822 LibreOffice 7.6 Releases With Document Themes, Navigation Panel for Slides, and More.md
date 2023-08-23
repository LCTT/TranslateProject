[#]: subject: "LibreOffice 7.6 Releases With Document Themes, Navigation Panel for Slides, and More"
[#]: via: "https://news.itsfoss.com/libreoffice-7-6/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

LibreOffice 7.6 Releases With Document Themes, Navigation Panel for Slides, and More
======
LibreOffice 7.6 is here with plenty of good improvements.
LibreOffice 7.6 is the next major upgrade for the open-source office suite.

With its previous [LibreOffice 7.5 release][1], the developers unveiled new app icons and feature upgrades. And, this time, it includes a good set of new abilities.

📋

Starting in **2024** , The Document Foundation will follow calendar-based numbering, i.e., the next version scheduled for Feb 2024 will be identified as **LibreOffice** **24.2.**

Let us take a look at what's new with the release.

### LibreOffice 7.6: What's New?

As expected, there are refinements across all the tools, with highlights for the Writer, Calc, and Impress; they are:

  * **Support for document themes**
  * **Improvements to Help**
  * **Compatibility improvements**
  * **New Page Number Wizard (Writer)**
  * **Navigation panel for slides (Impress)**
  * **Auto-filter support for sorting by color (Calc)**



#### Writer Improvements

The highlight feature update is the support for document themes. In other words, when needed, you can select a preset of color combinations for your document's title, text, and subheadings.

![][2]

You can find the option via **Format → Themes**.

A subtle but significant addition is adding a page number to the header/footer using a new wizard under the **Insert** menu.

You also get a new option to enable the spotlight for the paragraph styles or direct formatting in text.

![][3]

For a UX-focused improvement, you can find the " **Accesbility Check** " from the sidebar for quick access while editing a document.

![][4]

Other changes include:

  * Table of figures can now be generated more flexibly using a paragraph-based style
  * Bibliography entries can now be directly edited from its tables
  * Writer warns if you try accidentally to delete a hidden section from your document
  * Custom dictionaries for phrase checking are accepted



#### Calc Improvements

![][5]

Sorting has been made easy with the new ability to sort things by color.

In addition to this, you get a compact new layout for pivot tables. Other subtle and technical refinements include:

  * Spreadsheets copied to another file retain a user-defined print range
  * Ability to customize the default look of new comments
  * Solver settings are saved
  * If the sheet is empty, no confirmation is shown to delete it
  * Hyperlink formatting has been improved to make it look distinct



#### Impress & Draw Improvements

When you play a presentation now, you will get navigation buttons to go through them quickly. It is a small addition, but it should help you easily navigate through the slides.

Other refinements include:

  * Added support for multi-image tiff files
  * Objects can be listed in front-to-back order in the navigator



#### Other Changes

![][6]

Along with the highlights, you also get an improved " **Help** " section, which displays information about commands/shortcuts you need to change layout or do many things quicker.

To dive in deeper, you can check out [LibreOffice 7.6 release notes][7].

### How to Upgrade/Install?

LibreOffice should already be pre-installed for most users. If so, you should wait for the update from your system repository, LibreOffice's PPA, or Flathub. It should take a few days.

🚧

You can also choose to uninstall LibreOffice from your system and get the new version by following the steps below. We recommend you to wait if you can.

If you do not have it installed and want to get the new version, simply [download the tar package][8] as per your requirements (DEB/RPM).

![][9]

Next, extract the package, and find all the .deb/.rpm files under a "DEBS" or "RPMS" folder.

![][10]

Once you are in that folder, use the right-click menu to open it in the terminal (as shown in the image above) and type one of the following commands as per the package (Fedora and Debian-based distros):

![][11]

```

    sudo dnf install *.rpm

    sudo dpkg -i *.deb

```

_💬 What do you think about the latest LibreOffice release? Let us know your thoughts in the comments down below._

* * *

### More from It's FOSS...

  * Learn Bash scripting for FREE with this [Bash Tutorial series][12].
  * Join our [community forum][13].
  * 📩 Stay updated with the latest on Linux and Open Source. Get our [weekly Newsletter][14].



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/libreoffice-7-6/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/libreoffice-7-5-release/
[2]: https://news.itsfoss.com/content/images/2023/08/document-themes.png
[3]: https://news.itsfoss.com/content/images/2023/08/highlighting-spotlight.png
[4]: https://news.itsfoss.com/content/images/2023/08/accessibility-check-writer.jpg
[5]: https://news.itsfoss.com/content/images/2023/08/sort-by-color.png
[6]: https://news.itsfoss.com/content/images/2023/08/HelpCommands.png
[7]: https://wiki.documentfoundation.org/ReleaseNotes/7.6?ref=news.itsfoss.com
[8]: https://www.libreoffice.org/download/download-libreoffice/?ref=news.itsfoss.com
[9]: https://news.itsfoss.com/content/images/2023/08/extracted-libreoffice.png
[10]: https://news.itsfoss.com/content/images/2023/08/terminal-libreoffice.png
[11]: https://news.itsfoss.com/content/images/2023/08/libreoffice-terminal.png
[12]: https://linuxhandbook.com/tag/bash-beginner/
[13]: https://itsfoss.community/
[14]: https://itsfoss.com/newsletter/
