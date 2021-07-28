[#]: subject: (Install Shutter in Fedora 34 and Above)
[#]: via: (https://www.debugpoint.com/2021/07/install-shutter-fedora/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Install Shutter in Fedora 34 and Above
======
This quick guide explains the steps required to install shutter in
Fedora 34 and above.
There are many alternatives and options for screenshot tool. But in my personal opinion, there is none that come close to the flexibility of Shutter. Unfortunately over the years, Linux distributions such as Ubuntu, Fedora faced problem packaging this application in official repo for various dependency problem and specially how it is designed.

The primary problem is it still based on GTK2 and Perl. While most of the application moved to GTK3, it remained in GTK2. This created a dependency problem as Debian/Ubuntu, Fedora they removed the dependent GTK2 version of certain packages.

Installing [Shutter][1] screenshot tool in Fedora 34 and above requires an alternative approach.

Right now, you can only install this tool via personal package archive only. Here’s how to install it in Fedora 34 and above.

![Shutter in Fedora][2]

### Install Shutter in Fedora 34 and above

Open a terminal in your Fedora and enable the following [Copr repository for Shutter][3]. This package archive provides a separate build for Shutter for Fedora with all the unmet dependencies.

```
sudo dnf copr enable geraldosimiao/shutter
```

Once this is done, you can simply install shutter in Fedora 34 and above by dnf.

```
sudo dnf install shutter
```

Though the latest release is v0.97 at present. The repository sadly contains the old v0.94.x at the moment. I hope the repo owner soon include the latest version.

After installation, you can launch it via application menu.

#### Uninstall Shutter

If you want, you can easily remove this third-party repository via command:

```
sudo dnf copr remove geraldosimiao/shutter
```

And followed by below to remove Shutter completely including dependencies.

```
sudo dnf autoremove shutter
```

#### Install Shutter in Other Linux Distributions

If you want to install it in Debian, Ubuntu or related distribution – [check out this guide][4].

[][5]

SEE ALSO:   How to fix disabled Edit Image Option in Shutter in Ubuntu 18.04 LTS

### Development of Shutter

Recently this project [moved to GitHub][6] for better collaboration and a GTK3 port is underway. And it is fairly active and recently had a release. We hope it gets ported to gtk3 soon and available in native repo of respective distributions.

Let me know using the comment box below if you face any error installing Shutter.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/install-shutter-fedora/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/tag/shutter
[2]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/Shutter-in-Fedora.jpeg
[3]: https://copr.fedorainfracloud.org/coprs/geraldosimiao/shutter/
[4]: https://www.debugpoint.com/2020/04/shutter-install-ubuntu/
[5]: https://www.debugpoint.com/2018/05/shutter-fix-disable-edit/
[6]: https://github.com/shutter-project/shutter
