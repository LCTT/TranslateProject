[#]: subject: "How to Clean Up Snap Package Versions in Linux [Quick Tip]"
[#]: via: "https://itsfoss.com/clean-snap-packages/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Clean Up Snap Package Versions in Linux [Quick Tip]
======

Snap packages are not everyone’s favorite but they are an integral part of the Ubuntu ecosystem.

It has its pros and cons. One of the negatives is that Snap packages are usually bigger in size and take a lot of disk space.

This could be a problem if you are running out of disk space, specially on the root partition.

Let me share a neat trick that you could use to cut down the disk spaced used by Snap packages.

### Cleaning up old Snap package versions to free disk space

The system files related to snap are stored in the /var/lib/snapd directory. Based on the number of Snap packages you have installed, this directory size could be in several GBs.

Don’t just take my word for it. Do an assesement by [using the du command to check the directory size.][1]

```

    [email protected]:~$ sudo du -sh /var/lib/snapd
    5.4G    /var/lib/snapd

```

You may also use the Disk Usage Analyzer GUI tool to see the [disk usage in Ubuntu][2].

![Snap disk usage][3]

That’s a lot, right? You could free up some disk space here.

By design, Snap keeps at least one older version of the packages you have installed on your system.

You can see this behavior by using the Snap command:

```

    snap list --all

```

You should see the same package listed twice with different version and revision number.

![Snap keeps at least two versions of each package][4]

To free up disk space, you can delete the additional package versions. How do you know which one to delete? You can see that these older packages are labeled ‘disabled’.

Don’t worry. You don’t have to manually do it. There is sort of automatic way to do it thanks to a nifty bash script written by Alan Pope while he was working in the [Snapcraft][5] team.

I hope you know [how to create and run a bash shell script][6]. Basically, create a new file named clean-swap.sh and add the following lines to it.

```

    #!/bin/bash
    # Removes old revisions of snaps
    # CLOSE ALL SNAPS BEFORE RUNNING THIS
    set -eu
    snap list --all | awk '/disabled/{print $1, $3}' |
        while read snapname revision; do
            snap remove "$snapname" --revision="$revision"
        done

```

Save it and close the editor.

To run this script, keep it in your home directory and then [open the terminal in Ubuntu][7] and run this command:

```

    sudo bash clean-snap.sh

```

You can see that it starts removing the older version of packages.

![Removing old snap package versions][8]

If you check the disk space used by Snap now, you’ll see that the directory size is reduced now.

```

    [email protected]:~$ sudo du -sh /var/lib/snapd
    3.9G    /var/lib/snapd

```

If this works for you, you could run this command occasionally.

#### How does this script work?

If you are curious about what does this script do, let me explain.

You have already seen the output of the “snap list –all” command. It’s output is passed to the [awk command][9]. Awk is a powerful scripting tool.

The awk ‘/disabled/{print $1, $3}’ part looks for the string ‘disabled’ in each row and if it is found, it extracts the first column and third column.

This output is further passed to a combination of while and read command. Read command gets the value of first column snapname and third column to revision variable.

These variables are then used to run the snap remove command to delete with the name of the span package name and its revision number.

The while loop runs as long as there are rows found with ‘disabled’ string in it.

This all makes sense easily if you know a little bit about shell scripting. If you are not familiar with, we have a [bash tutorial series for beginners][10] for you.

### Did you get your GBs back?

You may see some forums advising to set up the Snap package retention value to 2.

```

    sudo snap set system refresh.retain=2

```

I don’t think it’s needed anymore. Snap’s default behavior now is to store total 2 versions for any package.

Altogether, if you are running out of space, getting rid of the additional package version could surely one of the [ways to free up disk space on Ubuntu][11].

If this tutorial helped you free some space, let me know in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/clean-snap-packages/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/find-directory-size-du-command/
[2]: https://itsfoss.com/check-free-disk-space-linux/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/snap-disk-usage.png?resize=800%2C323&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/snap-keeps-two-versions-of-each-package.png?resize=800%2C347&ssl=1
[5]: https://snapcraft.io/
[6]: https://itsfoss.com/run-shell-script-linux/
[7]: https://itsfoss.com/open-terminal-ubuntu/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/removing-old-snap-package-versions.png?resize=800%2C445&ssl=1
[9]: https://linuxhandbook.com/awk-command-tutorial/
[10]: https://linuxhandbook.com/tag/bash-beginner/
[11]: https://itsfoss.com/free-up-space-ubuntu-linux/
