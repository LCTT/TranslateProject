[#]: subject: "Linux Mint’s New Upgrade Tool Aims to Make the Update Process a Breeze"
[#]: via: "https://news.itsfoss.com/linux-mint-new-upgrade-tool/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Mint’s New Upgrade Tool Aims to Make the Update Process a Breeze
======

Linux Mint’s next release, based on Ubuntu 22.04 LTS, is around the corner. You should expect it soon after Ubuntu 22.04 LTS release later this month.

In the latest monthly blog post, **Clem Lefebvre** (Linux Mint founder) revealed that Linux Mint 21, codenamed “Vanessa,” will be the next upgrade based on Ubuntu 22.04 LTS.

It will support the three editions with Cinnamon, MATE, and Xfce.

In addition to that, Clem also shared some exciting details on the new upgrade tool planned to make the process seamless.

### Linux Mint Upgrade Tool

Yes, Linux Mint already has an upgrade tool to help you make things easy. It required access to the command line for a few things and is straightforward.

However, with the new upgrade tool, they plan to improve it further to efficiently handle complex releases starting with Linux Mint 21 and [LMDE 5][1].

The new upgrade tool is currently in its alpha phase, available on [GitHub][2].

So, you will be using it to upgrade from Linux Mint 20.3 to 21 and LMDE 4 to 5. That’s fantastic news, considering it minimizes the hassles involved in the upgrade process.

A GUI program “Upgrade Tool” where you just have to follow the onscreen instructions, sounds perfect, right?

![][3]

The key highlights of the new upgrade tool include:

  * It lets you do everything within the GUI, with no command-line needed.
  * Enabling localization (the current tool only supports English)
  * Adding more checks like if you’re connected to AC power, free space available, list of removed packages, etc.
  * Introducing more user control by letting you skip some of the steps (you must know what you’re doing)
  * It respects the current choice of mirrors only if it’s up-to-date.
  * Checks for existing custom repositories and PPAs to see whether they support the upgrade, and it does not remove them automatically.
  * Warns you about the packages that are no longer in the repositories.
  * Ability to detect common issues, and a one-click button to fix them.



![][4]

Clearly, the screenshot shared by the Linux Mint team shows that you get numerous details and more useful stuff with the upcoming upgrade tool.

However, note that even with a better upgrade tool in place, you should use tools like [Timeshift][5] to back up your existing data to avoid data loss.

Not to forget, there are more developments regarding Linux Mint and other tools, you can take a look at the [official blog post][6] to learn more.

_What do you think about Linux Mint’s new upgrade tool? Let me know your thoughts in the comments below._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-mint-new-upgrade-tool/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/lmde-5-release/
[2]: https://github.com/linuxmint/mintupgrade2
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY1MSIgd2lkdGg9IjY0MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjcwOSIgd2lkdGg9IjcxMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://itsfoss.com/backup-restore-linux-timeshift/
[6]: https://blog.linuxmint.com/?p=4293
