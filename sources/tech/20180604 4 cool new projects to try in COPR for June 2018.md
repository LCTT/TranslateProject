4 cool new projects to try in COPR for June 2018
======
COPR is a [collection][1] of personal repositories for software that isn’t carried in Fedora. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

Here’s a set of new and interesting projects in COPR.

### Ghostwriter

[Ghostwriter][2] is a text editor for [Markdown][3] format with a minimal interface. It provides a preview of the document in HTML and syntax highlighting for Markdown. It offers the option to highlight only the paragraph or sentence currently being written. In addition, Ghostwriter can export documents to several formats, including PDF and HTML. Finally, it has the so-called “Hemingway” mode, in which erasing is disabled, forcing the user to write now and edit later.![][4]

#### Installation instructions

The repo currently provides Ghostwriter for Fedora 26, 27, 28, and Rawhide, and EPEL 7. To install Ghostwriter, use these commands:
```
sudo dnf copr enable scx/ghostwriter
sudo dnf install ghostwriter

```

### Lector

[Lector][5] is a simple ebook reader application. Lector supports most common ebook formats, such as EPUB, MOBI, and AZW, as well as comic book archives CBZ and CBR. It’s easy to setup — just specify the directory containing your ebooks. You can browse books in Lector’s library using either a table or book covers. Among Lector’s features are bookmarks, user-defined tags, and a built-in dictionary.![][6]

#### Installation instructions

The repo currently provides Lector for Fedora 26, 27, 28, and Rawhide. To install Lector, use these commands:
```
sudo dnf copr enable bugzy/lector
sudo dnf install lector

```

### Ranger

Ranerger is a text-based file manager with Vim key bindings. It displays the directory structure in three columns. The left one shows the parent directory, the middle the contents of the current directory, and the right a preview of the selected file or directory. In the case of text files, Ranger shows actual contents of the file as a preview.![][7]

#### Installation instructions

The repo currently provides Ranger for Fedora 27, 28, and Rawhide. To install Ranger, use these commands:
```
sudo dnf copr enable fszymanski/ranger
sudo dnf install ranger

```

### PrestoPalette

PrestoPeralette is a tool that helps create balanced color palettes. A nice feature of PrestoPalette is the ability to use lighting to affect both lightness and saturation of the palette. You can export created palettes either as PNG or JSON.
![][8]

#### Installation instructions

The repo currently provides PrestoPalette for Fedora 26, 27, 28, and Rawhide, and EPEL 7. To install PrestoPalette, use these commands:
```
sudo dnf copr enable dagostinelli/prestopalette
sudo dnf install prestopalette

```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-try-copr-june-2018/

作者：[Dominik Turecek][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://copr.fedorainfracloud.org/
[2]:http://wereturtle.github.io/ghostwriter/
[3]:https://daringfireball.net/
[4]:https://fedoramagazine.org/wp-content/uploads/2018/05/ghostwriter.png
[5]:https://github.com/BasioMeusPuga/Lector
[6]:https://fedoramagazine.org/wp-content/uploads/2018/05/lector.png
[7]:https://fedoramagazine.org/wp-content/uploads/2018/05/ranger.png
[8]:https://fedoramagazine.org/wp-content/uploads/2018/05/prestopalette.png
