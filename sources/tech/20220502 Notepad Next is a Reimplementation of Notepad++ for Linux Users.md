[#]: subject: "Notepad Next is a Reimplementation of Notepad++ for Linux Users"
[#]: via: "https://itsfoss.com/notepad-next/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Notepad Next is a Reimplementation of Notepad++ for Linux Users
======
Notepad Next is an interesting replacement for Notepad++ users on Linux, along with its cross-platform support. Let’s take a closer look.

Notepad++ is a popular source code editor and a solid Notepad alternative for Windows users.

It is a powerful utility that provides the best possible performance without taking a lot of storage space.

Unfortunately, it is not available for Linux users. An [unofficial Snap package is available to install][1], but it may not be satisfactory considering it depends on an embedded version of Wine under the hood.

While we do have some options for [Notepad++ alternatives][2], I came across something that tries to re-implement what Notepad++ offers for Linux users. And, with a similar user interface.

Moreover, it is a cross-platform offering. Exciting, right?

Meet **Notepad Next**.

### Notepad Next: Open-Source Notepad++ Alternative

![notepad next screenshot][3]

Notepad Next aims to resemble the feature offerings and the user interface you get with Notepad++.

Note that you should not expect the same level of offering, considering Notepad Next is still under active development (at version 0.5 as of now) and needs several improvements. That being said, Notepad Next is usable and stable for the most part.

![notepad next search][4]

The developer recommends against it if you need it for critically important work.

Under the hood, the app utilizes C++, Lua, and Qt5 for its user interface.

### Features of Notepad Next

![notepad next about][5]

Notepad Next is a feature-rich source code editor that you can also use to replace your default text editor.

Some of the key features include:

* Folders as Workspace.
* Support for a range of languages like C++, YAML, XML, LaTeX, PHP, Python, R, Rust, etc.
* Tweaks to disable/enable parts of the UI.
* Supports recording macro, running it, and saving a recorded macro.
* Find and Replace feature in Files.
* Line operations.
* Editor inspector for detailed information on the document.
* Indent guide.
* Undo/Redo buttons.
* Zoom in/ Zoom out.
* Lua console.
* EOL operations.
* Ability to convert upper case ↔ lower case.
* Cross-platform

It is also worth noting that the macOS version is highly experimental at the time of writing this. But, it is available for Windows, Linux, and macOS. So, once the developers iron out the issues, it should be a perfect cross-platform open-source text editor app.

![notepad next preferences][6]

### Install Notepad Next on Linux

Notepad Next is available as a Flatpak and an AppImage for Linux users. You can download the AppImage file from its [GitHub releases section][7], or get the Flatpak from [Flathub][8].

I tried the Flatpak app to test it briefly on Ubuntu 20.04 LTS, and it worked fine. However, I limited my usage to basic functions and preferences.

So, you can choose to explore more about it on its [GitHub page][9] or proceed with installing it to give it a try.

--------------------------------------------------------------------------------

via: https://itsfoss.com/notepad-next/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/notepad-plus-plus-linux/
[2]: https://itsfoss.com/notepad-alternatives-for-linux/
[3]: https://itsfoss.com/wp-content/uploads/2022/04/notepad-next-screenshot.png
[4]: https://itsfoss.com/wp-content/uploads/2022/04/notepad-next-search.jpg
[5]: https://itsfoss.com/wp-content/uploads/2022/04/notepad-next-about.png
[6]: https://itsfoss.com/wp-content/uploads/2022/04/notepad-next-preferences.png
[7]: https://github.com/dail8859/NotepadNext/releases
[8]: https://flathub.org/apps/details/com.github.dail8859.NotepadNext
[9]: https://github.com/dail8859/NotepadNext
