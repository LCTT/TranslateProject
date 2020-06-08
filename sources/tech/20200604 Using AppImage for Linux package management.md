[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using AppImage for Linux package management)
[#]: via: (https://opensource.com/article/20/6/appimages)
[#]: author: (David Clinton https://opensource.com/users/dbclinton)

Using AppImage for Linux package management
======
AppImage distributes applications within self-contained environments
that work on any Linux distribution.
![Gift box opens with colors coming out][1]

A big part of administrating Linux machines—especially remote machines—is managing and installing software. When something goes wrong with a local application or when something on the filesystem breaks and needs fixing, you're often going to want to push updates without having to travel many miles to sit down in front of a physical screen. As I explain in my Pluralsight course [Linux system maintenance and troubleshooting][2], a lot of problems can be solved through Bash scripts of course, but there are still plenty of cases where there's no alternative to a good, old fashioned binary.

Imagine that some of your remote systems need new applications installed, so the team members using those computers will be able to perform some business function. Being able to leverage the integration and automation of one of the major Linux repository systems—like Debian or RPM—can make your administration tasks a whole lot easier.

As Linus Torvalds never tires of reminding us, the problem with many Linux software management systems is that there are [too many Linux software management systems][3]. Over the years, app development and even Linux adoption have been complicated by the fact that all the time and work you invest in preparing your software for, say, Debian repos, won't help you if you want to get them into RPM systems. And neither will help for SUSE's Zypper manager.

One promising solution to the software silo problem is to distribute applications with their own self-contained environments that'll work on any Linux distribution. One option of a standard in this young and growing field is [AppImage][4].

### Working with AppImages

I'm all-in on AppImage. Like the other package management systems I've mentioned, there's plenty of complexity available should you want it. But, at its core, AppImages are actually quite straightforward. Rather than working through a repo like most other package managers, AppImages are single, standalone files that can be sent directly or shared through a website.

Here's an illustration of its beauty. While I was playing around with AppImages, I came across a very old discussion on a tech forum that led me to an equally old and abandoned GitHub project and associated YAML and recipe files. They were designed to automatically build the rather complex infrastructure required to prepare the archive needed to generate an AppImage package. Although that infrastructure was all built to run on a five-year-old release of Ubuntu, when I put it all together and ran the `appimagetool` command against it, it created an AppImage file that worked seamlessly on my current desktop. I don't think there are too many five-year-old GitHub projects of that complexity that could run using other technologies without some serious reworking.

But I'm not going to go there. Instead, I'm going to show you how it works with a very simple Hello World application. First, make sure the AppStream package is installed locally.

For Debian-based system, run:


```
`$ sudo apt install appstream`
```

And for RPM systems, use:


```
`$ sudo dnf install appstream`
```

Clone the Git repo referenced in [this article][5], which I based this example on:


```
$ git clone <https://github.com/boolean-world/appimage-resources>
$ cd appimage-resources
$ ls hello-world-appimage
```

Next, `cd` into the new directory Git created, and take a look around. There are two directories here. Use `hello-world-appimage`; the other one is a more complex project, and you should consider giving it a try, too.

The `helloworld.desktop` file is what Linux GUI systems read to know how to handle the way they present a desktop icon. As it turns out, the way the file is currently written will give you trouble a bit later, so make one minor edit: add a `Categories=` line and give it the value `GNOME`. And don't forget the semicolon at the end:


```
$ nano hello-world-appimage/helloworld.desktop
        add Categories=GNOME;
```

Download a precompiled copy of the `appimagetool` binary from [the AppImage GitHub project][6]. Make a point of visiting the GitHub site—there's plenty of excellent documentation and resources there. Once the binary is downloaded, make the file executable and point it at the `hello-world-appimage` directory. But first, you need to tell it what architecture you want. For some reason, a tool with a name that ends in `x86_64` is all wobbly when it comes to choosing whether to build an application using x86_64 or not (I'm not sure what's going on there):


```
$ wget <https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86\_64.AppImage>
$ chmod +x appimagetool-x86_64.AppImage
$ ARCH=x86_64 ./appimagetool-x86_64.AppImage hello-world-appimage
```

If you don't see any angry error messages, you're all set to give it a run:


```
$ ls
$ ./hello-world-appimage-x86_64.AppImage
```

### Conclusion

AppImage is an incredibly effective choice for package management. As you explore it, I think you'll find it's a great alternative to the defaults Linux distributions provide.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/appimages

作者：[David Clinton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dbclinton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1 (Gift box opens with colors coming out)
[2]: https://pluralsight.pxf.io/VMKQj
[3]: https://itsfoss.com/desktop-linux-torvalds/
[4]: https://appimage.org/
[5]: https://www.booleanworld.com/creating-linux-apps-run-anywhere-appimage/
[6]: https://github.com/AppImage/AppImageKit/releases
