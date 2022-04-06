[#]: subject: "Ex-Snap Advocate at Ubuntu Creates a Tool to Help You Migrate from Snap to Flatpak"
[#]: via: "https://news.itsfoss.com/unsnap-migrate-snap-to-flatpak/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ex-Snap Advocate at Ubuntu Creates a Tool to Help You Migrate from Snap to Flatpak
======

Don’t like using Snap?

Well, you can always stick to the traditional binary packages (deb/rpm) or opt for [Flatpak][1].

But, what if you already rely on apps from the Snap store?

It will be time-consuming to manually remove the apps, get rid of Snap, install Flatpak, and install all the Flatpak packages.

That’s where “Unsnap” comes to the rescue.

Unsnap is an open-source utility developed by a former Snap advocate at Canonical, **Alan Pope** to help you quickly migrate from using snap packages to Flatpaks.

### Unsnap: Here’s How it Works

Note that the utility is still in its pre-alpha phase, you can test it out, but you may want to do some research if you want to help improve it and try it for yourself.

Basically, the tool generates scripts to help you do the following (in the particular order):

  * Backup existing Snaps.
  * Install Flatpak (if not already present).
  * Enable Flathub.
  * Install the Flatpaks for the same Snap applications.
  * Remove Snap applications for the Flatpaks installed.
  * Remove all Snaps.



While the scripts are generated automatically when you run the tool, you can choose to run those scripts manually or automatically one-by-one to switch away to Flatpaks.

### How to Test Unsnap?

![][2]

You might have a vague idea of how it’s achieved looking at the screenshot above. You can also refer to its [GitHub page][3] for the latest information.

For reference, let me highlight the steps for you:

#### 1\. Clone the GitHub Repository

Make sure you have [Git installed on your Linux distro][4]. Once done, you can type in the following command:

```

    git clone https://github.com/popey/unsnap

```

#### 2\. Navigate to the directory

Once you clone the repo, you will have the **unsnap** directory on your system.

Navigate to the directory by typing in:

```

    cd unsnap

```

#### 3\. Run the Tool

After navigating to the target directory, simply run the **unsnap** utility using the command:

```

    ./unsnap

```

It will check for existing snaps, Flatpaks, and more to set things up.

As you can notice in the screenshot above, it already detects that my system has Flatpak setup, so it skips generating the scripts for those tasks.

In the process, it also learns about the Snap packages installed on your system to find equivalent Flatpaks when you run the generated scripts.

If you want to run all the scripts immediately, you can type in:

```

    ./unsnap auto

```

![][2]

If you want to take control without the auto option, you can find the scripts generated reside inside a log directory, as shown in the image below:

![][2]

Here’s the order of the scripts that you should follow:

  * 00-backup
  * 01-install-flatpak
  * 02-enable-flathub
  * 03-install-flatpaks
  * 04-remove-snaps
  * 99-remove-snapd



In my example, I already have Flatpak set up, so I proceed with running the backup script, and then installing the Flatpak, so on. Here’s how it looks like:

![][2]

You should keep in mind that this tool is under heavy development and may not work as expected. So, you if you rely on numerous Snap packages, you should experiment using the tool in a virtual machine or a test machine and wait for the tool to improve with a stable release.

_Let me know your thoughts on Unsnap in the comments below._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/unsnap-migrate-snap-to-flatpak/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/flatpak-guide/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU4NyIgd2lkdGg9IjgzMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://github.com/popey/unsnap
[4]: https://itsfoss.com/install-git-ubuntu/
