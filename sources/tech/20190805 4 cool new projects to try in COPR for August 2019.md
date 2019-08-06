[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 cool new projects to try in COPR for August 2019)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-august-2019/)
[#]: author: (Dominik Turecek https://fedoramagazine.org/author/dturecek/)

4 cool new projects to try in COPR for August 2019
======

![][1]

COPR is a [collection][2] of personal repositories for software that isn’t carried in Fedora. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

Here’s a set of new and interesting projects in COPR.

### Duc

[Duc][3] is a collection of tools for disk usage inspection and visualization. Duc uses an indexed database to store sizes of files on your system. Once the indexing is done, you can then quickly overview your disk usage either by its command-line interface or the GUI.

![][4]

#### Installation instructions

The [repo][5] currently provides duc for EPEL 7, Fedora 29 and 30. To install duc, use these commands:

```
sudo dnf copr enable terrywang/duc
sudo dnf install duc
```

### MuseScore

[MuseScore][6] is a software for working with music notation. With MuseScore, you can create sheet music either by using a mouse, virtual keyboard or a MIDI controller. MuseScore can then play the created music or export it as a PDF, MIDI or MusicXML. Additionally, there’s an extensive database of sheet music created by Musescore users.

![][7]

#### Installation instructions

The [repo][8] currently provides MuseScore for Fedora 29 and 30. To install MuseScore, use these commands:

```
sudo dnf copr enable jjames/MuseScore
sudo dnf install musescore
```

### Dynamic Wallpaper Editor

[Dynamic Wallpaper Editor][9] is a tool for creating and editing a collection of wallpapers in GNOME that change in time. This can be done using XML files, however, Dynamic Wallpaper Editor makes this easy with its graphical interface, where you can simply add pictures, arrange them and set the duration of each picture and transitions between them.

![][10]

#### Installation instructions

The [repo][11] currently provides dynamic-wallpaper-editor for Fedora 30 and Rawhide. To install dynamic-wallpaper-editor, use these commands:

```
sudo dnf copr enable atim/dynamic-wallpaper-editor
sudo dnf install dynamic-wallpaper-editor
```

### Manuskript

[Manuskript][12] is a tool for writers and is aimed to make creating large writing projects easier. It serves as an editor for writing the text itself, as well as a tool for organizing notes about the story itself, characters of the story and individual plots.

![][13]

#### Installation instructions

The [repo][14] currently provides Manuskript for Fedora 29, 30 and Rawhide. To install Manuskript, use these commands:

```
sudo dnf copr enable notsag/manuskript
sudo dnf install manuskript
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-august-2019/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dturecek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://duc.zevv.nl/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/07/duc.png
[5]: https://copr.fedorainfracloud.org/coprs/terrywang/duc/
[6]: https://musescore.org/
[7]: https://fedoramagazine.org/wp-content/uploads/2019/07/musescore-1024x512.png
[8]: https://copr.fedorainfracloud.org/coprs/jjames/MuseScore/
[9]: https://github.com/maoschanz/dynamic-wallpaper-editor
[10]: https://fedoramagazine.org/wp-content/uploads/2019/07/dynamic-walppaper-editor.png
[11]: https://copr.fedorainfracloud.org/coprs/atim/dynamic-wallpaper-editor/
[12]: https://www.theologeek.ch/manuskript/
[13]: https://fedoramagazine.org/wp-content/uploads/2019/07/manuskript-1024x600.png
[14]: https://copr.fedorainfracloud.org/coprs/notsag/manuskript/
