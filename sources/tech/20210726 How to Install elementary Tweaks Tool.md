[#]: subject: (How to Install elementary Tweaks Tool)
[#]: via: (https://www.debugpoint.com/2021/07/elementary-tweaks-install/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install elementary Tweaks Tool
======
This quick tutorial demonstrates the steps to install elementary Tweaks
tool/Pantheon Tweaks Tool.
The elementary Tweaks tool is a handy utility specially designed for [elementary OS][1]. It gives you various options to change certain settings for elementary. Although elementary provides most of the settings already, however, few Pantheon desktop tweaks are not available via standard settings. Hence, this tool. This is a similar tool like we have in GNOME called [GNOME Tweaks][2].

That said, installing this tool is straight forward. Although it’s a bit different in [elementary OS 6 Odin][3] than earlier versions such as elementary OS 5 Juno. From the elementary OS 6 Odin onwards, this tool is renamed as Pantheon Tweaks tool. Here’s how to install.

### Install elementary Tweaks Tool

The elementary OS doesn’t include the software-properties-common package, which is required for adding a PPA. If it is not install already, use the following command to install.

```
sudo apt install software-properties-common
```

#### elementary OS 6 Odin

The Tweak tool is renamed with a new name and being developed separately. It is called [Pantheon Tweaks][4]. And using the following commands you can install it.

```
sudo add-apt-repository -y ppa:philip.scott/pantheon-tweaks
sudo apt install -y pantheon-tweaks
```

#### elementary OS 5 Juno and below

If you are using elementary OS 5 June and below, you can install the earlier [elementary-tweaks][5] using the same PPA. Follow the below commands from terminal.

```
sudo add-apt-repository -y ppa:philip.scott/elementary-tweaks
sudo apt install -y elementary-tweaks
```

### Usage

After installation, you can run it via `Application Menu > System Settings > Tweaks`.

![tweak in settings][6]

In the Tweaks window, you can find several options to change and configure your elementary desktop.

![elementary tweaks after install – options][7]

For your information, this tool is just a front end to elementary desktop settings. You can very well change them via terminal provided you know the exact name or property. The settings you get in this tool can also be changed via `dconf` editor in `io.elementary` path.

[][8]

SEE ALSO:   elementary OS 5.1 Hera Released. Here’s What’s New

Let me know in the comment box below, if you face any trouble installing, or using this tweak tool.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/elementary-tweaks-install/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/tag/elementary
[2]: https://www.debugpoint.com/2018/05/customize-your-ubuntu-desktop-using-gnome-tweak/
[3]: https://www.debugpoint.com/2020/09/elementary-os-6-odin-new-features-release-date/
[4]: https://github.com/pantheon-tweaks/pantheon-tweaks
[5]: https://github.com/elementary-tweaks/elementary-tweaks
[6]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/tweak-in-settings.png
[7]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/elementary-tweaks-after-install-options.png
[8]: https://www.debugpoint.com/2019/12/elementary-os-hera-released/
