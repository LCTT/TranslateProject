[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 cool new projects to try in COPR for January 2020)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-january-2020/)
[#]: author: (Dominik Turecek https://fedoramagazine.org/author/dturecek/)

4 cool new projects to try in COPR for January 2020
======

![][1]

COPR is a [collection][2] of personal repositories for software that isn’t carried in Fedora. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

This article presents a few new and interesting projects in COPR. If you’re new to using COPR, see the [COPR User Documentation][3] for how to get started.

### Contrast

[Contrast][4] is a small app used for checking contrast between two colors and to determine if it meets the requirements specified in [WCAG][5]. The colors can be selected either using their RGB hex codes or with a color picker tool. In addition to showing the contrast ratio, Contrast displays a short text on a background in selected colors to demonstrate comparison.

![][6]

#### Installation instructions

The [repo][7] currently provides contrast for Fedora 31 and Rawhide. To install Contrast, use these commands:

```
sudo dnf copr enable atim/contrast
sudo dnf install contrast
```

### Pamixer

[Pamixer][8] is a command-line tool for adjusting and monitoring volume levels of sound devices using PulseAudio. You can display the current volume of a device and either set it directly or increase/decrease it, or (un)mute it. Pamixer can list all sources and sinks.

#### Installation instructions

The [repo][9] currently provides Pamixer for Fedora 31 and Rawhide. To install Pamixer, use these commands:

```
sudo dnf copr enable opuk/pamixer
sudo dnf install pamixer
```

### PhotoFlare

[PhotoFlare][10] is an image editor. It has a simple and well-arranged user interface, where most of the features are available in the toolbars. PhotoFlare provides features such as various color adjustments, image transformations, filters, brushes and automatic cropping, although it doesn’t support working with layers. Also, PhotoFlare can edit pictures in batches, applying the same filters and transformations on all pictures and storing the results in a specified directory.

![][11]

#### Installation instructions

The [repo][12] currently provides PhotoFlare for Fedora 31. To install Photoflare, use these commands:

```
sudo dnf copr enable adriend/photoflare
sudo dnf install photoflare
```

### Tdiff

[Tdiff][13] is a command-line tool for comparing two file trees. In addition to showing that some files or directories exist in one tree only, tdiff shows differences in file sizes, types and contents, owner user and group ids, permissions, modification time and more.

#### Installation instructions

The [repo][14] currently provides tdiff for Fedora 29-31 and Rawhide, EPEL 6-8 and other distributions. To install tdiff, use these commands:

```
sudo dnf copr enable fif/tdiff
sudo dnf install tdiff
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-january-2020/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dturecek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html#
[4]: https://gitlab.gnome.org/World/design/contrast
[5]: https://www.w3.org/WAI/standards-guidelines/wcag/
[6]: https://fedoramagazine.org/wp-content/uploads/2020/01/contrast-screenshot.png
[7]: https://copr.fedorainfracloud.org/coprs/atim/contrast/
[8]: https://github.com/cdemoulins/pamixer
[9]: https://copr.fedorainfracloud.org/coprs/opuk/pamixer/
[10]: https://photoflare.io/
[11]: https://fedoramagazine.org/wp-content/uploads/2020/01/photoflare-screenshot.png
[12]: https://copr.fedorainfracloud.org/coprs/adriend/photoflare/
[13]: https://github.com/F-i-f/tdiff
[14]: https://copr.fedorainfracloud.org/coprs/fif/tdiff/
