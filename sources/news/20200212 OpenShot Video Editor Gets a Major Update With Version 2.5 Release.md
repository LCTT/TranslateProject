[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (OpenShot Video Editor Gets a Major Update With Version 2.5 Release)
[#]: via: (https://itsfoss.com/openshot-2-5-release/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

OpenShot Video Editor Gets a Major Update With Version 2.5 Release
======

[OpenShot][1] is one of the [best open-source video editors][2] out there. With all the features that it offered – it was already a good video editor on Linux.

Now, with a major update to it (**v.2.5.0**), OpenShot has added a lot of new improvements and features. And, trust me, it’s not just any regular release – it is a huge release packed with features that you probably wanted for a very long time.

In this article, I will briefly mention the key changes involved in the latest release.

![][3]

### OpenShot 2.5.0 Key Features

Here are some of the major new features and improvements in OpenShot 2.5:

#### Hardware Acceleration Support

The hardware acceleration support is still an experimental addition – however, it is a useful feature to have.

Instead of relying on your CPU to do all the hard work, you can utilize your GPU to encode/decode video data when working with MP4/H.264 video files.

This will affect (or improve) the performance of OpenShot in a meaningful way.

#### Support Importing/Exporting Files From Final Cut Pro &amp; Premiere

![][4]

[Final Cut Pro][5] and [Adobe Premiere][6] are the two popular video editors for professional content creators. OpenShot 2.5 now allows you to work on projects created on these platforms. It can import (or export) the files from Final Cut Pro &amp; Premiere in EDL &amp; XML formats.

#### Thumbnail Generation Improved

This isn’t a big feature – but a necessary improvement to most of the video editors. You don’t want broken images in the thumbnails (your timeline/library). So, with this update, OpenShot now generates the thumbnails using a local HTTP server, can check multiple folder locations, and regenerate missing ones.

#### Blender 2.8+ Support

The new OpenShot release also supports the latest [Blender][7] (.blend) format – so it should come in handy if you’re using Blender as well.

#### Easily Recover Previous Saves &amp; Improved Auto-backup

![][8]

It was always a horror to lose your timeline work after you accidentally deleted it – which was then auto-saved to overwrite your saved project.

Now, the auto-backup feature has improved with an added ability to easily recover your previous saved version of the project.

Even though you can recover your previous saves now – you will find a limited number of the saved versions, so you have to still remain careful.

#### Other Improvements

In addition to all the key highlights mentioned above, you will also notice a performance improvement when using the keyframe system.

Several other issues like SVG compatibility, exporting &amp; modifying keyframe data, and resizable preview window have been fixed in this major update. For privacy-concerned users, OpenShot no longer sends usage data unless you opt-in to share it with them.

For more information, you can take a look at [OpenShot’s official blog post][9] to get the release notes.

### Installing OpenShot 2.5 on Linux

You can simply download the .AppImage file from its [official download page][10] to [install the latest OpenShot version][11]. If you’re new to AppImage, you should also check out [how to use AppImage][12] on Linux to easily launch OpenShot.

[Download Latest OpenShot Release][10]

Some distributions like Arch Linux may also provide the latest OpenShot release with regular system updates.

#### PPA available for Ubuntu-based distributions

On Ubuntu-based distributions, if you don’t want to use AppImage, you can [use the official PPA][13] from OpenShot:

```
sudo add-apt-repository ppa:openshot.developers/ppa
sudo apt update
sudo apt install openshot-qt
```

You may want to know how to remove PPA if you want to uninstall it later.

**Wrapping Up**

With all the latest changes/improvements considered, do you see [OpenShot][11] as your primary [video editor on Linux][14]? If not, what more do you expect to see in OpenShot? Feel free to share your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/openshot-2-5-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.openshot.org/
[2]: https://itsfoss.com/open-source-video-editors/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/openshot-2-5-0.png?ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/openshot-xml-edl.png?ssl=1
[5]: https://www.apple.com/in/final-cut-pro/
[6]: https://www.adobe.com/in/products/premiere.html
[7]: https://www.blender.org/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/openshot-recovery.jpg?ssl=1
[9]: https://www.openshot.org/blog/2020/02/08/openshot-250-released-video-editing-hardware-acceleration/
[10]: https://www.openshot.org/download/
[11]: https://itsfoss.com/openshot-video-editor-release/
[12]: https://itsfoss.com/use-appimage-linux/
[13]: https://itsfoss.com/ppa-guide/
[14]: https://itsfoss.com/best-video-editing-software-linux/
