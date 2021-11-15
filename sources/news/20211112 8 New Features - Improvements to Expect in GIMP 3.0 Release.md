[#]: subject: "8 New Features & Improvements to Expect in GIMP 3.0 Release"
[#]: via: "https://news.itsfoss.com/gimp-3-0-features/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

8 New Features & Improvements to Expect in GIMP 3.0 Release
======

[GIMP][1] is one of the [best free image editors][2] available for Linux. Not just for users who want a free alternative to Adobe suite, but many professionals use GIMP for artwork, design, and photo editing.

Even though GIMP offers many essential features and options to work with, many modern alternatives (irrespective of the platform) have popped up that outshine GIMP in several ways.

And, GIMP 3.0 could be the release that turns the table by putting GIMP as one of the best modern offerings to compete with commercial options available out there.

This article will discuss the expected features to arrive with GIMP 3.0 release.

### Top Features to Expect With GIMP 3.0

Following the road to GIMP 3.0 release, the development versions have added a lot of improvements.

It does make sense to expect all the features/changes you see in its early developer builds, but we will stick to significant highlights for this article.

### 1\. GTK3 based UI

![Credits: GIMP Blog][3]

GIMP 3.0 will bring in a visual overhaul with GTK3-based UI. Along with the improved look and feel, you can also expect new widgets.

Not to forget, [Edward Snowden also thinks that GIMP needs a UI overhaul][4]. So, GIMP 3.0 should make a difference in some form if it does not end up being a visual treat.

With previous GIMP releases, it did not support high pixel density displays. It was manageable, but GIMP did not look good enough if you had a higher resolution screen.

Now with GTK3 onboard, it adds support for high pixel density displays. All you have to do is set your operating system’s preferred scaling/resolution, and GIMP should support it.

### 2\. Wayland Support

The transition to GTK3 should ensure better Wayland support. So, if you are starting to use Wayland desktop sessions, GIMP 3.0 should let you use the app without any issues.

### 3\. Multiple Layer Selection

![Credits: GIMP Blog][5]

One of the most crucial feature addition is the ability to select multiple layers.

While this was a much-needed feature due for a long time, it is finally coming together for GIMP 3.0 release.

With this feature, one can easily manage and organize several layers in their projects.

As per the available information, they officially mention more about the change:

> The Layers dockable is now fully multi-selection aware, using the usual interaction for multi-items selection (`Shift+click` for selecting a range of layers and `Ctrl+click` for selecting or deselecting non-contiguous layers). Organizational operations now work on all selected layers, i.e. that you can move, reorder, delete, duplicate, merge (and more…) all selected layers at once.

In other words, you can select multiple layers and perform batch operations on all of them at once.

For instance, you can crop, move, use the color picker tool from merged layers, and do more things with this feature.

When publishing this article, I noticed that it is a work in progress with some limitations, as per their development blog. Hopefully, with the stable release, the multi-layer selection works flawlessly.

### 4\. New Plugin API

The plugin API retains all the essential functionalities but also introduces several new improvements.

So, the new plugin API shouldn’t break anything for developers but should allow them to port their plugins to GIMP 3.0 app easily.

Some improvements as mentioned in their development releases:

  * Moved away from object IDs to real objects. In particular in GIMP 3, `GimpImage`, `GimpItem`, `GimpDrawable`, `GimpLayer`, `GimpVectors`, `GimpChannel` and `GimpPDB` are objects (other classes of objects already exist or may be added later).
  * Paths are now handled as `GFile`, which implies using the GLib/GIO API.
  * GIMP API should be fully usable in a wide range of language bindings (Python 3, JavaScript, Lua, Vala, etc)



### 5\. Paint Select Tool

![Credits: GIMP Blog][6]

The Foreground Select tool isn’t going anywhere. However, a new experimental “Paint Select” tool is being worked on that lets you progressively select and paint the region where you use the brush.

The Paint Select tool also aims to overcome the limitations with the Foreground Select tool for big images and resolve memory/stability issues.

We can’t be sure if it makes it to the stable release, considering it was listed as experimental, but it already has new icons to help you identify the tool.

### 6\. Windows Ink Support

![Credits: GIMP Blog][7]

Of course, we discuss all things Linux here. But, GIMP is a popular cross-platform tool.

So, to appeal to more users, it is good to have hardware support for tools that professionals or designers use.

GIMP 3.0 now supports Windows Ink out-of-the-box, thanks to its addition to GTK3. You would get the option to use the Windows Ink API from the settings for managing input devices.

### 7\. Improved Gesture Support

GIMP wasn’t the best candidate for laptop users or, more accurately, touchpad/touchscreen users.

However, this could change with GIMP 3.0 adding gesture support to pinch to zoom in/out of the canvas.

We could also see more gesture support in the final release, but there are no new gestures as of version 2.99.8, which is the latest development release.

### 8\. **Improved File Format Support**

GIMP 3.0 now supports JPEG-XL file format, with the ability to load/export .jxl files with grayscale and RGB color profiles.

The support for Adobe Photoshop project files has been improved as well. It can now handle PSD files larger than 4 GB while loading up to 99 channels.

In addition to these, support for WebP, and 16-bit SGI images were also improved.

### Wrapping Up

Looking at [GIMP’s development blog][8], it looks like they’re almost done for the final release. However, they haven’t shared any particular timeline for a release date.

So, it should arrive as soon as they squash the bugs and finalize the improvements.

_Are you looking forward to GIMP 3.0? Does it look like a promising next-gen release?_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gimp-3-0-features/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://itsfoss.com/image-applications-ubuntu-linux/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQyNiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://news.itsfoss.com/gimp-ui-edward-snowden/
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9Ijg0NiIgd2lkdGg9IjQ5MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQyNSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU0MyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: https://www.gimp.org/news/2021/10/20/gimp-2-99-8-released/
