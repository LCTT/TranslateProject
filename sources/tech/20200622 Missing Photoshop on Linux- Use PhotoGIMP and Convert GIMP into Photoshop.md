[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Missing Photoshop on Linux? Use PhotoGIMP and Convert GIMP into Photoshop)
[#]: via: (https://itsfoss.com/photogimp/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Missing Photoshop on Linux? Use PhotoGIMP and Convert GIMP into Photoshop
======

[Adobe Photoshop][1] is not available for desktop Linux. GIMP is the [best alternative to Adobe Photoshop on Linux][2].

If you have used Photoshop for sometime, you’ll notice that the [GIMP][3] has different settings, different keyboard shortcuts and layout than Photoshop.

And there is absolutely nothing wrong with it. After all, both are two different software, and they don’t have to look the same.

However, people who are used to Photoshop find it difficult to forget their hard learned muscle memory while switching to GIMP. This could frustrate some because using a new interface means learning numerous keyboard shortcuts and spending time on finding which tool is located where.

To help such Photoshop to GIMP switchers, [Diolinux][4] has introduced a tool that mimics Adobe Photoshop in GIMP.

### PhotoGIMP: Give Adobe Photoshop like look and feel to GIMP in Linux

![][5]

[PhotoGIMP][6] is not a standalone graphics software. It is a patch for GIMP 2.10. You need to have GIMP installed on your system to use PhotoGIMP.

When you apply the PhotoGIMP patch, it changes GIMP layout to mimic Adobe Photoshop.

  * Installs hundreds of new fonts by default
  * Installs new Python filters such as “heal selection”
  * Adds new splash screen
  * Adds new default settings to maximize space on the canvas
  * Adds keyboard shortcuts similar to Adobe Photoshop



PhotoGIMP also adds new icon and name from custom .desktop file. Let’s see how to use it.

### Installing PhotoGIMP on Linux [for intermediate to expert users]

PhotoGIMP is essentially a patch. You download and [extract the zip file in Linux][7]. You’ll find the following hidden folders in the extracted folder:

  * icons: which have a new PhotoGIMP icon
  * .local: which contain the personalized .desktop file so that you see PhotoGIMP instead of GIMP in system menu
  * .var : the main folder containing the patch for GIMP



You should [use Ctrl+H keyboard shortcut to show hidden files in Ubuntu][8].

Warning: I suggest making backup of GIMP config files so that you can revert if you don’t like PhotoGIMP. Simply copy the content of GIMP config files into some other location.

At present, PhotoGIMP is mainly compatible with GIMP installed via [Flatpak][9]. If you installed GIMP using Flatpak, you can simply copy-paste these hidden folders in your home directory and it will convert your GIMP into Adobe Photoshop like settings.

However, if you installed GIMP via apt or snap or your distribution’s package manager, you’ll have to find the GIMP config folder and paste the content of the .var directory of PhotoGIMP. When asked, opt for merge option and replace existing files of the same name.

I [installed GIMP in Ubuntu 20.04 using apt][10]. The location for GIMP config file for me was ~/.config/GIMP/2.10. I copied the content of the .var/app/org.gimp.GIMP/config/GIMP/2.10 directory here and started GIMP to see the PhotoGIMP splash.

Here’s the interface of GIMP after being patched by PhotoGIMP:

![][11]

I tried a couple of Photoshop keyboard shortcuts to check the changes it made and it seemed to be working.

[Download PhotoGIMP][12]

I also found [PhotoGIMP available as Snap package][13] but its from 2019, and I am not sure if it works everywhere or just with snap install.

**Conclusion**

This is not the first project of this kind. Some years ago, we had a similar project called Gimpshop. The Gimpshop project hasn’t seen any development in past several years and it is safe to assume that the project is dead. There is a website in the name of Gimpshop but that’s from imposters trying to cash in on Gimpshop name.

I am not an Adobe Photoshop user. I am not even a GIMP expert this is why the [GIMP tutorials][14] on It’s FOSS are covered by Dimitrios.

For this reason, I cannot comment on how useful the PhotoGIMP project is. If you are familiar with both software, you should be able to judge it better than me.

If you try PhotoGIMP, do share your experience with it and let us know if it is worth the installation or not.

--------------------------------------------------------------------------------

via: https://itsfoss.com/photogimp/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.adobe.com/in/products/photoshop.html
[2]: https://itsfoss.com/open-source-photoshop-alternatives/
[3]: https://www.gimp.org/
[4]: https://diolinux.com.br/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/photogimp-feature.jpg?ssl=1
[6]: https://github.com/Diolinux/PhotoGIMP
[7]: https://itsfoss.com/unzip-linux/
[8]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[9]: https://flatpak.org/
[10]: https://itsfoss.com/gimp-2-10-release/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/photogimp-editor-interface.jpg?resize=800%2C538&ssl=1
[12]: https://github.com/Diolinux/PhotoGIMP/releases
[13]: https://snapcraft.io/photogimp
[14]: https://itsfoss.com/tag/gimp-tips/
