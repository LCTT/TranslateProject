[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open Source Drawing App Pinta Sees New Release After 5 Years. Here’s How to Get it!)
[#]: via: (https://itsfoss.com/pinta-new-release/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Open Source Drawing App Pinta Sees New Release After 5 Years. Here’s How to Get it!
======

_**Brief: Open source painting and drawing application has a new release after more than 5 years. The new release fixes numerous bugs and adds new features.**_

[Pinta][1] is an [open source drawing application for Linux][2], Windows and macOS. You can use it for freehand drawing/sketching. You may also use it to add arrows, boxes, text etc on an existing image.

![][3]

Pinta version 1.7 was released a few days ago after a gap of almost five years. Let’s see what do we have in the new version.

### New features in Pinta 1.7

Here are the new features the latest version of Pinta brings:

  * Tab view to switch between images
  * Addition of a Smooth Erase tool
  * Drag and drop URL to download and open the image in Pinta for editing
  * The Pencil tool can switch between different blend modes
  * ‘Move Selected’ tool can be scaled by holding Ctrl
  * The Rectangle Select tool now shows different arrow cursors at each corner of the selection
  * Performance improvements when interacting with selections, particularly for large images



There are numerous bug fixes as well and this should improve the overall Pinta experience. You can learn about more changes in the [official release note][4].

### Installing Pinta 1.7 on Ubuntu and other Linux distributions

For Ubuntu and Ubuntu-based Linux distributions, there is an [official PPA available][5]. If you are using Ubuntu 18.04 or 20.04, you can use this PPA.

Open a terminal and use the following command to add the new repository. You’ll be asked to enter your password. You probably already know that when you type password in terminal, nothing is displayed. Just type the password and press enter.

```
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable
```

Not required on Ubuntu 18.04 and higher version anymore but some other distributions may need to update the cache:

```
sudo apt update
```

Now install the latest version of Pinta using this command.

```
sudo apt install pinta
```

Good thing here is that if you had Pinta 1.6 installed previously, it gets updated to the new version.

#### Removing Pinta

To remove Pinta installed via PPA, use this command:

```
sudo apt remove pinta
```

You should also [delete the PPA][6]:

```
sudo add-apt-repository -r ppa:pinta-maintainers/pinta-stable
```

#### Installing Pinta on other distributions

When I last checked Pinta 1.7 wasn’t available for Fedora or AUR yet. You may wait for some time or download the source code and try it on your own.

[Download Pinta 1.7][7]

Pinta team has also refreshed its user guide with detailed documentation. If you are new to Pinta or if you want to use it extensively, you may refer to [this user guide][8] for reference.

**Conclusion**

I am happy to see a new release of Pinta. It was my go-to tool for editing images to add arrows, boxes and text for tutorials on It’s FOSS. I use [Shutter][9] for this purpose these days but with this new release, I might perhaps switch to Pinta again.

What about you? Do you use Pinta or have you used it in the past? Are you looking forward to use the new version?

--------------------------------------------------------------------------------

via: https://itsfoss.com/pinta-new-release/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.pinta-project.com/
[2]: https://itsfoss.com/open-source-paint-apps/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/pinta-1-7.png?resize=800%2C517&ssl=1
[4]: https://www.pinta-project.com/releases/1-7
[5]: https://launchpad.net/~pinta-maintainers/+archive/ubuntu/pinta-stable
[6]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[7]: https://www.pinta-project.com/releases/
[8]: https://www.pinta-project.com/user-guide/
[9]: https://itsfoss.com/install-shutter-ubuntu/
