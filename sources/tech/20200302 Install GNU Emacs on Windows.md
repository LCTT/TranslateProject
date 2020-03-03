[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Install GNU Emacs on Windows)
[#]: via: (https://opensource.com/article/20/3/emacs-windows)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Install GNU Emacs on Windows
======
Even if your operating system is closed source, you can still use this
popular open source text editor.
![Tall building with windows][1]

GNU Emacs is a popular text editor designed for programmers of all sorts. Because it was developed on Unix and is widely used on Linux (and shipped with macOS), people sometimes don't realize that it's also available for Microsoft Windows. You don't need to be an experienced or full-time programmer to make use of Emacs, either. You can download and install Emacs with just a few clicks, and this article shows you how.

You can install Windows manually or with a package manager, like [Chocolatey][2].

### 7-zip

If you haven't already installed 7-zip for Windows, you should do that first. [7-zip][3] is an open source archive utility with the ability to create and extract ZIP, 7z, TAR, XZ, BZIP2, and GZIP (and more) files. It's an invaluable tool for Windows users.

After installing 7-zip, you have new 7-zip archive options in your right-click menu when browsing files in Windows Explorer.

### Powershell and Chocolatey

To install GNU Emacs on Windows using Chocolatey:


```
`PS> choco install emacs-full`
```

Once it has installed, launch Emacs from Powershell:


```
`PS> emacs`
```

![Emacs running on Windows][4]

### Download GNU Emacs for Windows

To manually install GNU Emacs on Windows, you must [download Emacs][5].

![GNU Windows downloader][6]

This takes you to a server near you, which shows you a list of all available Emacs releases. Find the directory with the highest release number and click into it. There are many different builds of Emacs for Windows, but the most general-purpose version is just named **emacs-VERSION-ARCHITECTURE.zip**. The **VERSION** depends upon which release you're downloading, while the **ARCHITECTURE** depends on whether you have a 32-bit or 64-bit machine. Most modern computers are 64-bit, but if you're in doubt you can download the 32-bit version, which runs on both.

If you're downloading version 26 of Emacs for a 64-bit machine, you would click the link titled **emacs-26.2-x86_64.zip**. There are smaller downloads available (such as the **no-deps** variety) but you must be familiar with how Emacs is built from source code, knowing which libraries it needs and which of those your computer has on it already. Generally, it's easiest to get the large version of Emacs, because it contains everything it needs to run on your computer.

### Extract Emacs

Next, unarchive the ZIP file you downloaded. To extract it, right-click on the Emacs ZIP file and select **Extract to Emacs-VERSION** from the 7-zip sub-menu. It's a big archive, so it may take a while to uncompress, but when it does, you have a new directory containing all the files distributed with Emacs. For example, in this example, the file **emacs-26.2-x86_64.zip** was downloaded, so the unarchived directory is **emacs-26.2-x86_64**.

### Launch Emacs

Within the Emacs directory, find the **bin** directory. This folder stores all the binary executable files (EXE files) distributed with Emacs. Double-click the **emacs.exe** file to launch the application.

![Emacs running on Windows][7]

You can create a shortcut to **emacs.exe** on your desktop for easier access.

### Learn Emacs

Emacs isn't as obtuse as its reputation may indicate. It's got its own traditions and conventions, but when you're typing text into it, you can treat it exactly as you treat Notepad or any given text field on any given website.

The important differences occur when you _edit_ the text you've typed.

The only way to learn is to start using it, though, so make Emacs your go-to text editor for simple tasks. When you'd normally open Notepad or Word or Evernote or whatever it is you use for quick notes or as a temporary scratchpad, launch Emacs instead.

Emacs has the reputation of being a terminal-based application, but obviously it has a GUI, so use the GUI often, just as you would with any application. Copy, cut, and paste (or "yank" in Emacs terminology) from the menu instead of with the keyboard, and open and save files from the menu or toolbar. Start from the beginning and learn the application based on what it is and not how you think it should act based on your experience with other editors.

### Download our [cheatsheet][8]!

_Thanks to Matthias Pfuetzner and Stephen Smoogen._

These are Jimmy's six favorite open source applications that he immediately installs on a new...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/emacs-windows

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/windows_building_sky_scale.jpg?itok=mH6CAX29 (Tall building with windows)
[2]: https://github.com/chocolatey/choco
[3]: https://www.7-zip.org/
[4]: https://opensource.com/sites/default/files/uploads/windows-ps-choco-emacs.jpg (Emacs running on Windows)
[5]: https://www.gnu.org/software/emacs/download.html
[6]: https://opensource.com/sites/default/files/uploads/windows-emacs-download.jpg (GNU Windows downloader)
[7]: https://opensource.com/sites/default/files/uploads/windows-emacs.jpg (Emacs running on Windows)
[8]: https://opensource.com/downloads/emacs-cheat-sheet
