[#]: subject: (Zathura: A Minimalist Document Viewer for Keyboard Shortcut Pros)
[#]: via: (https://itsfoss.com/zathura-document-viewer/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (tanloong)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Zathura: A Minimalist Document Viewer for Keyboard Shortcut Pros
======

Every Linux distribution comes with a document viewer app that lets you read PDF and other documents.

Most of the time, it is [Evince from GNOME][1] that is displayed as Document Viewer in Ubuntu and some other distributions. Evince is a handy tool and supports a wide variety of document formats.

However, there are other applications for reading documents. Take [Foliate][2] for example. It’s an excellent [application for reading ebooks on Linux][3].

I recently came across another document viewer called Zathura.

### Enjoy a mouse-free document reading experience with Zathura

[Zathura][4] is a highly customizable document viewer based on the [girara user interface][5] and several document libraries. girara implements a simple and minimalist user interface.

Zathura sure feels to load fast. It is minimalist, so you just get an application window with no sidebar, application menu or anything of that sort.

![Zathura Document Viewer Interface][6]

You may open its command line prompt by pressing the : key. You may close the CLI prompt with Esc key.

If you want to create a bookmark, type :bmark and then provide an index number to the bookmarked page.

![Bookmarking in Zathura][7]

You may highlight all the links by pressing the F key. It will also display a number beside the highlighted URL and the command line prompt will appear at the bottom. If you type the URL number and press enter, the URL will be opened in the default web browser.

![Highlighting and opening links in documents][8]

Zathura also has automatic reloading feature. So if you make some changes to the document with some other application, the changes will be reflected as Zathura reloads the document.

You may also install additional plugins to improve the capabilities of Zathura and use it for reading comics or PostScript.

The problem with Zathura is that you won’t see any documentation or help option anywhere on the application interface. This makes things a bit more difficult if you are not already familiar with the tool.

You may get the default keyboard shortcuts information from its [man page][9]. Here are a few of them:

  * R: Rotate
  * D: Toggle between single and double page viewing mode
  * F: Highlight all links on the current screen
  * HJKL: Moving with the Vim type keys
  * Arrows or PgUp/PgDown or the mouse/touchpad for moving up and down
  * / and search for text, press n or N for moving to next or previous search (like less command)
  * Q: Close



You may find the documentation on the project website to learn about configuration, but I still found it confusing.

### Installing Zathura on Linux

Zathura is available in the repositories of the most Linux distributions. I could see it available for Ubuntu, Fedora, Arch and Debian, thanks to the [pkgs.org website][10]. This means that you can use the [package manager of your distribution][11] or the software center to install it.

On Debian and Ubuntu based distributions, use this command to install Zathura:

```
sudo apt install zathura
```

On Fedora, use:

```
sudo dnf install zathura
```

[Use pacman command on Arch Linux][12]:

```
sudo pacman -Sy zathura
```

And if you want to have a look at its source code, you may visit its GitLab repository:

[Zathura Source Code][13]

### Conclusion

I’ll be honest with you. I am not a fan of mouse-free tools. This is why I prefer Nano over Vim as I cannot remember so many shortcuts.

I know there are people who swear by their keyboards. However, I would prefer not to spend time learning to configure a document viewer. This is more because I do not read too many documents on my desktop and for the limited PDF viewing, the default application is sufficient.

It’s not that Zathura does not have it usage. If you are someone who has to deal a lot with documents, be it PDF or LaTex, Zathura could be your next favorite tool if you are a keyboard love.

--------------------------------------------------------------------------------

via: https://itsfoss.com/zathura-document-viewer/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://wiki.gnome.org/Apps/Evince
[2]: https://itsfoss.com/foliate-ebook-viewer/
[3]: https://itsfoss.com/best-ebook-readers-linux/
[4]: https://pwmt.org/projects/zathura/
[5]: https://git.pwmt.org/pwmt/girara
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/Zathura-Document-Viewer-Interface.png?resize=800%2C492&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/bookmarking-in-zathura.png?resize=800%2C639&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/Follow-link-in-Zathura.png?resize=800%2C639&ssl=1
[9]: https://itsfoss.com/linux-man-page-guide/
[10]: https://pkgs.org/
[11]: https://itsfoss.com/package-manager/
[12]: https://itsfoss.com/pacman-command/
[13]: https://git.pwmt.org/pwmt/zathura
