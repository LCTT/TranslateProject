[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Darktable 3 Released With GUI Rework and New Features)
[#]: via: (https://itsfoss.com/darktable-3-release/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Darktable 3 Released With GUI Rework and New Features
======

Here’s the Christmas gift for the photography enthusiasts. Darktable 3.0 has just released.

[Darktable][1] is one of the [best applications for editing RAW images on Linux][2]. You can consider it as a [free and open source alternative to Adobe Lightroom][3].

Darktable 3 is a major new release with tons of feature improvements and a complete rework of the user interface. The GUI is now completely controlled by GTK+ CSS rules, which makes the whole GUI themable. There are eight themes available by default.

With the help of over 3000 commits and 553 pull requests, the new release has fixed 66 bugs and added many new features.

Let’s see what features this new release brings.

### New features in Darktable 3.0

![Darktable 3.0 Screenshot][4]

Here are the highlighted new features:

  * Reworked UI
  * A new module for handling 3D RGB Lut transformations
  * Many improvements to the ‘denoise (profiled)’ module
  * A new ‘culling’ mode and timeline view added
  * Many improvements to the ‘denoise (profiled)’ module
  * New tone equalizer’ basic and filmic RGB modules
  * Better 4K/5K display support
  * Undo/redo support for more operations
  * Many code optimizations for CPU and SSE paths
  * Support for exporting to Google Photos
  * More camera support, white balance presets, and noise profiles
  * Plenty of bug fixes and feature improvements



You can read about all the changes in the [release notes on GitHub][5].

### Installing Darktable 3.0 on Linux

Let’s see how to get the latest Darktable release.

#### Installing Darktable 3.0 on Ubuntu-based distributions

Darktable is available in Ubuntu but you won’t get the latest release immediately. For the LTS version, it may take months before you have this version update.

Worry not! Darktable provides its [own PPA][6] to install the latest release on Ubuntu-based distributions.

Unfortuntaley, That Darktable PPA has not been updated with the new release.

Worry not (again)! Thanks to our friend [Ji M of Ubuntu Handbook][7], we have an unofficial PPA for easily installing Darktable 3.0 on Ubuntu and other Ubuntu based distributions.

Open a terminal and use these commands one by one:

```
sudo add-apt-repository ppa:ubuntuhandbook1/darktable
sudo apt update
sudo apt install darktable
```

#### Uninstall Darktable 3

To remove Darktable installed via this PPA, you can first uninstall the application:

```
sudo apt remove darktable
```

And then [remove the PPA][8] as well:

```
sudo add-apt-repository -r ppa:ubuntuhandbook1/darktable
```

#### Installing Darktable on other Linux distributions

You may wait for your distribution to provide this new release through the software manager.

You may also download the tarball or the entire source code from the GitHub release page (it’s at the bottom of the page).

[Download Darktable 3.0][5]

With Darktable 3, you can edit your holiday pictures better :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/darktable-3-release/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.darktable.org/
[2]: https://itsfoss.com/raw-image-tools-linux/
[3]: https://itsfoss.com/open-source-photoshop-alternatives/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/darktable_3_screenshot.jpg?ssl=1
[5]: https://github.com/darktable-org/darktable/releases/tag/release-3.0.0
[6]: https://launchpad.net/~pmjdebruijn/+archive/ubuntu/darktable-release
[7]: http://ubuntuhandbook.org/index.php/2019/12/install-darktable-3-0-0-ubuntu-18-04-19-10/
[8]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
