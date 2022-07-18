[#]: subject: "How to Clean Up Snap Versions to Free Up Disk Space"
[#]: via: "https://www.debugpoint.com/clean-up-snap/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Clean Up Snap Versions to Free Up Disk Space
======
This quick guide with a script helps to clean up old snap versions and free some disk space in your Ubuntu systems.

I was running out of disk space in my test system with Ubuntu. So I was investigating via GNOME’s Disk Usage Analyser to find out which package is consuming the precious SSD space. Apart from the usual cache and home directory – to my surprise, I found that Snap and Flatpak consume a considerable amount of storage space.

![Snap size – before cleanup][1]

Although, I always maintain a rule – not to use Snap or Flatpak unless necessary. This is mainly because of their installation size and other issues. I prefer vanilla deb and rpm packages. Over the years, I have installed and removed a certain amount of Snap packages in this test system.

The problem arises after uninstallation; Snap keeps some residue files in the system, unknown to the general users.

So I opened the Snap folder `/var/lib/snapd/snaps` and discovered that Snap is keeping track of older versions of previously installed/uninstalled packages.

For example, in the below image, you can see GNOME 3.28, 3.34, and Wine – all of these are removed long back. But they are still there. Its happening because of the Snap design which keeps versions of uninstalled packages after a proper uninstallation.

![Files under snaps directory][2]

Alternatively, you can get the same in terminal using:

```
snap list --all
```

![snap list all][3]

The default value is 3 for several revisions for retention. That means Snap keeps 3 older versions of each package, including the active version. This is okay if you do not have constraints on your disk space.

But for servers and other use cases, this can easily run into cost issues, consuming your disk space.

However, you can easily modify the count using the following command. The value can be between 2 to 20.

```
sudo snap set system refresh.retain=2
```

### Clean Up Snap Versions

In a post in SuperUser, Popey, the ex-Engineering Manager at Canonical, [provided a simple script][4] that can clean up old versions of Snaps and keep the latest one.

Here’s the script we will use to clean the Snap up.

```
#!/bin/bash
 #Removes old revisions of snaps
 #CLOSE ALL SNAPS BEFORE RUNNING THIS
 set -eu
 LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
     while read snapname revision; do
         snap remove "$snapname" --revision="$revision"
     done
```

Save the above script as .sh in a directory (for example`clean_snap.sh` ), give it executable permission and run.

```
chmod +x clean_snap.sh
```

When I ran the script, it reduced a lot of disk space. The script would also show the name of the package being removed.

![Executing the script][5]

![Snaps size after cleanup][6]

### Closing Notes

There are always debates on how efficient Snap’s design is. Many say it is broken by design, bloated, and heavy on systems. Some part of that argument is true, I would not deny it. The whole concept of sandboxing applications is great if implemented and enhanced properly. I believe, Flatpak does a better job compared to Snap.

That said, I hope this helps you clean up some disk space. Although it is tested in Ubuntu, it should work in all Linux distribution that supports Snap.

Also, check out our guide on [how to clean up Ubuntu][7] with additional steps.

Finally, if you are looking for cleaning up **Flatpak** apps, refer [this guide][8].

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/clean-up-snap/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2021/03/Snap-size-before-cleanup.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2021/03/Files-under-snaps-directory.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2021/03/snap-list-all.jpg
[4]: https://superuser.com/a/1330590
[5]: https://www.debugpoint.com/wp-content/uploads/2021/03/Executing-the-script.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2021/03/Snaps-size-after-cleanup.jpg
[7]: https://www.debugpoint.com/2018/07/4-simple-steps-clean-ubuntu-system-linux/
[8]: https://www.debugpoint.com/clean-up-flatpak/
