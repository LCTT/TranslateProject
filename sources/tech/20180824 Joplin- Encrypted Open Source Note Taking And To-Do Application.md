translating---geekpi

Joplin: Encrypted Open Source Note Taking And To-Do Application
======
**[Joplin][1] is a free and open source note taking and to-do application available for Linux, Windows, macOS, Android and iOS. Its key features include end-to-end encryption, Markdown support, and synchronization via third-party services like NextCloud, Dropbox, OneDrive or WebDAV.**

![](https://1.bp.blogspot.com/-vLLYx1Pfmb0/W3_wq_B0avI/AAAAAAAABb8/B9pe5NXVzg83A6Lm6_0ORMe9aWqtfTn4gCLcBGAs/s640/joplin-notes.png)

With Joplin you can write your notes in the **Markdown format** (with support for math notations and checkboxes) and the desktop app comes with 3 views: Markdown code, Markdown preview, or both side by side. **You can add attachments to your notes (with image previews) or edit them in an external Markdown editor** and have them automatically updated in Joplin each time you save the file.

The application should handle a large number of notes pretty well by allowing you to **organizing notes into notebooks, add tags, and search in notes**. You can also sort notes by updated date, creation date or title. **Each notebook can contain notes, to-do items, or both** , and you can easily add links to other notes (in the desktop app right click on a note and select `Copy Markdown link` , then paste the link in a note).

**Do-do items in Joplin support alarms** , but this feature didn't work for me on Ubuntu 18.04.

**Other Joplin features include:**

  * **Optional Web Clipper extension** for Firefox and Chrome (in the Joplin desktop application go to `Tools > Web clipper options` to enable the clipper service and find download links for the Chrome / Firefox extension) which can clip simplified or complete pages, clip a selection or screenshot.

  * **Optional command line client**.

  * **Import Enex files (Evernote export format) and Markdown files**.

  * **Export JEX files (Joplin Export format), PDF and raw files**.

  * **Offline first, so the entire data is always available on the device even without an internet connection**.

  * **Geolocation support**.



[![Joplin notes checkboxes link to other note][2]][3] 
Joplin with hidden sidebar showing checkboxes and a link to another note

While it doesn't offer as many features as Evernote, Joplin is a robust open source Evernote alternative. Joplin includes all the basic features, and on top of that it's open source software, it includes encryption support, and you also get to choose the service you want to use for synchronization.

The application was actually designed as an Evernote alternative so it can import complete Evernote notebooks, notes, tags, attachments, and note metadata like the author, creation and updated time, or geolocation.

Another aspect on which the Joplin development was focused was to avoid being tied to a particular company or service. This is why the application offers multiple synchronization solutions, like NextCloud, Dropbox, oneDrive and WebDav, while also making it easy to support new services. It's also easy to switch from one service to another if you change your mind.

**I should note that Joplin doesn't use encryption by default and you must enable this from its settings. Go to** `Tools > Encryption options` and enable the Joplin end-to-end encryption from there.

### Download Joplin

[Download Joplin][7]

**Joplin is available for Linux, Windows, macOS, Android and iOS. On Linux, there's an AppImage as well as an Aur package available.**

To run the Joplin AppImage on Linux, double click it and select `Make executable and run` if your file manager supports this. If not, you'll need to make it executable either using your file manager (should be something like: `right click > Properties > Permissions > Allow executing file as program` , but this may vary depending on the file manager you use), or from the command line:
```
chmod +x /path/to/Joplin-*-x86_64.AppImage

```

Replacing `/path/to/` with the path to where you downloaded Joplin. Now you can double click the Joplin Appimage file to launch it.

**TIP:** If you integrate Joplin to your menu and `~/.local/share/applications/appimagekit-joplin.desktop`) and adding `StartupWMClass=Joplin` at the end of the file on a new line, without modifying anything else.

Joplin has a **command line client** that can be [installed using npm][5] (for Debian, Ubuntu or Linux Mint, see [how to install and configure Node.js and npm][6] ).


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/joplin-encrypted-open-source-note.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://joplin.cozic.net/
[2]:https://3.bp.blogspot.com/-y9JKL1F89Vo/W3_0dkZjzQI/AAAAAAAABcI/hQI7GAx6i_sMcel4mF0x4uxBrMO88O59wCLcBGAs/s640/joplin-notes-markdown.png (Joplin notes checkboxes link to other note)
[3]:https://3.bp.blogspot.com/-y9JKL1F89Vo/W3_0dkZjzQI/AAAAAAAABcI/hQI7GAx6i_sMcel4mF0x4uxBrMO88O59wCLcBGAs/s1600/joplin-notes-markdown.png
[4]:https://github.com/laurent22/joplin/issues/338
[5]:https://joplin.cozic.net/terminal/
[6]:https://www.linuxuprising.com/2018/04/how-to-install-and-configure-nodejs-and.html

[7]: https://joplin.cozic.net/#installation
