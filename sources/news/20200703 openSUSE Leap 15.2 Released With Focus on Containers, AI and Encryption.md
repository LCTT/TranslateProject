[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (openSUSE Leap 15.2 Released With Focus on Containers, AI and Encryption)
[#]: via: (https://itsfoss.com/opensuse-leap-15-2-release/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

openSUSE Leap 15.2 Released With Focus on Containers, AI and Encryption
======

[openSUSE][1] Leap 15.2 has finally landed with some useful changes and improvements.

Also, considering the exciting announcement of [Closing the Leap Gap][2], the release of openSUSE Leap 15.2 brings us one step closer to SLE ([SUSE Linux Enterprise][3]) binaries being integrated to openSUSE Leap 15.3 next.

Let’s take a look at what has changed and improved in openSUSE Leap 15.2.

### openSUSE Leap 15.2: Key Changes

![][4]

Overall, openSUSE Leap 15.2 release involves security updates, major new packages, bug fixes, and other improvements.

In their press release, a developer of the project, **Marco Varlese**, mentions:

> “Leap 15.2 represents a huge step forward in the Artificial Intelligence space, “I am super excited that openSUSE end-users can now finally consume Machine Learning / Deep Learning frameworks and applications via our repositories to enjoy a stable and up-to-date ecosystem.”

Even though this hints at what changes it could involve, here’s what’s new in openSUSE Leap 15.2:

#### Adding Artificial Intelligence (AI) and Machine Learning packages

Unquestionably, Artificial Intelligence (AI) and Machine Learning are some of the most disruptive technologies to learn.

To facilitate that to its end-users, openSUSE Leap 15.2 has added a bunch of important packages for new open source technologies:

  * [Tensorflow][5]
  * [PyTorch][6]
  * [ONNX][7]
  * [Grafana][8]
  * [Prometheus][9]



#### Introducing a Real-Time Kernel

![][10]

With openSUSE Leap 15.2, a real-time kernel will be introduced to manage the timing of [microprocessors][11] to efficiently handle time-critical events.

The addition of a real-time kernel is a big deal for this real. **Gerald Pfeifer (**chair of the project’s board) shared his thoughts with the following statement:

> “The addition of a real time kernel to openSUSE Leap unlocks new possibilities. Think edge computing, embedded devices, data capturing, all of which are seeing immense growth. Historically many of these have been the domain of proprietary approaches; openSUSE now opens the floodgates for developers, researchers and companies that are interested in testing real time capabilities or maybe even in contributing. Another domain open source helps open up!”

#### Inclusion of Container Technologies

With the latest release, you will notice that [Kubernetes][12] is included as an official package. This should make it easy for end-users to automate deployments, scale, and manage containerized applications.

[Helm][13] (the package manager for Kubernetes) also comes baked in. Not just limited to that, you will also find several other additions here and there that makes it easier to secure and deploy containerized applications.

#### Updates to openSUSE Installer

![][14]

openSUSE’s installer was already pretty good. But, with the latest Leap 15.2 release, they have added more information, compatibility with right-to-left languages like Arabic, and subtle changes to make it easier to select options right at the time of installation.

#### Improvements to YaST

While [YaST][15] is already a pretty powerful installation and configuration tool, this release adds the ability of creating and managing a Btrfs file-system and enforcing advanced encryption techniques.

Of course, you must be aware of the availability of [openSUSE on Windows Subsystem for Linux][16]. So, with Leap 15.2, YaST compatibility with WSL has improved as per their release notes.

#### Desktop Environment Improvements

![][17]

The desktop environments available have been update to their latest versions that include [KDE Plasma 5.18 LTS][18] and [GNOME 3.34][19].

You will also find an updated [XFCE 4.14][20] desktop available for openSUSE Leap 15.2.

If you’re curious to know all the details for the latest release, you may refer to the [official release announcement.][21]

### Download &amp; Availability

As of now, you should be able to find Linode cloud images of Leap 15.2. Eventually, you will notice other cloud hosting services like Amazon Web Services, Azure, and others to offer it as well.

You can also grab the DVD ISO or the network image file from the official website itself.

To upgrade your current installation, I’d recommend following the [official instructions][22].

[openSUSE Leap 15.2][23]

Have you tried openSUSE Leap 15.2 yet? Feel free to let me know what you think!

--------------------------------------------------------------------------------

via: https://itsfoss.com/opensuse-leap-15-2-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.opensuse.org/
[2]: https://www.suse.com/c/sle-15-sp2-schedule-and-closing-the-opensuse-leap-gap/
[3]: https://www.suse.com/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/opensuse-leap-15-2-gnome.png?ssl=1
[5]: https://www.tensorflow.org
[6]: https://pytorch.org
[7]: https://onnx.ai
[8]: https://grafana.com
[9]: https://prometheus.io/docs/introduction/overview/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/opensuse-leap-15-2-terminal.png?ssl=1
[11]: https://en.wikipedia.org/wiki/Microprocessor
[12]: https://kubernetes.io
[13]: https://helm.sh
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/opensuse-leap-15-2.png?ssl=1
[15]: https://yast.opensuse.org/
[16]: https://itsfoss.com/opensuse-bash-on-windows/
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/opensue-leap-15-2-kde.png?ssl=1
[18]: https://itsfoss.com/kde-plasma-5-18-release/
[19]: https://itsfoss.com/gnome-3-34-release/
[20]: https://www.xfce.org/about/news/?post=1565568000
[21]: https://en.opensuse.org/Release_announcement_15.2
[22]: https://en.opensuse.org/SDB:System_upgrade
[23]: https://software.opensuse.org/distributions/leap
