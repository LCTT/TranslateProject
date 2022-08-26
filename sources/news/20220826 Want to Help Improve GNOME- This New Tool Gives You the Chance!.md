[#]: subject: "Want to Help Improve GNOME? This New Tool Gives You the Chance!"
[#]: via: "https://news.itsfoss.com/gnome-improve-tool/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Want to Help Improve GNOME? This New Tool Gives You the Chance!
======
A new tool to enable GNOME users to provide insights on their configuration and usage to help improve the user experience.

![Want to Help Improve GNOME? This New Tool Gives You the Chance!][1]

GNOME has come up with a tool that lets users provide **anonymous insights** about their configurations, extensions, and GNOME-tuned settings.

This should help GNOME learn more about user preferences and make better decisions to enhance the user experience.

Interestingly, an intern at **Red Hat** (*Vojtech Stanek*) created this tool.

### ℹ️ GNOME Info Collect: Ready to Install?

![gnome info collect terminal][2]

The tool (gnome-info-collect) is a simple terminal program that you need to download, install, and run to share the data with GNOME.

Here's what the tool needs to collect from your GNOME system:

* Hardware information (including manufacturer and model).
* System settings (including workspace configuration, sharing features, SSH etc.)
* GNOME shell extensions installed and enabled.
* Application information (like installed apps and favorites).
* Linux distro and version.
* Flatpak and Flathub status.
* Default browser.
* [Salted hash][3] of machine ID+username.

You can find the package suitable for your distribution and more details on the data collected available on its [GitLab page][4].

For instance, if you have an **Ubuntu-based distribution**, you can install it by typing in:

```
sudo snap install --classic gnome-info-connect
```

Once installed, fire it up using the following command in the terminal:

```
gnome-info-collect
```

Next, it displays the data that it intends to share with GNOME. So, if it looks good to you, you can choose to upload the data to GNOME's servers.

![][5]

Considering the data remains anonymous, it should help GNOME understand what their users like, and focus on those improvements over time.

[Download gnome-info-collect][6]

💬 *What do you think about this new data collection tool for GNOME? Share your thoughts in the comments down below.*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-improve-tool/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/08/gnome-improvement-tool.jpg
[2]: https://news.itsfoss.com/content/images/2022/08/gnome-info-collect-terminal.png
[3]: https://en.wikipedia.org/wiki/Salt_(cryptography)
[4]: https://gitlab.gnome.org/vstanek/gnome-info-collect/
[5]: https://news.itsfoss.com/content/images/2022/08/gnome-info-collect-sharing.png
[6]: https://gitlab.gnome.org/vstanek/gnome-info-collect/
