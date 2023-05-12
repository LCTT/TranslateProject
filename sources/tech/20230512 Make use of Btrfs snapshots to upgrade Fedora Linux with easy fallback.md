[#]: subject: "Make use of Btrfs snapshots to upgrade Fedora Linux with easy fallback"
[#]: via: "https://fedoramagazine.org/make-use-of-btrfs-snapshots-to-upgrade-fedora-linux-with-easy-fallback/"
[#]: author: "Stuart D Gathman https://fedoramagazine.org/author/sdgathman/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Make use of Btrfs snapshots to upgrade Fedora Linux with easy fallback
======

![][1]

A fork in a tree, [Photo by Brendan Johnson][2] (cropped).

Back in 2018, a [previous article][3] demonstrated how to use LVM to clone the root filesystem before upgrading Fedora Linux so as to have a fallback in the unlikely event that something goes wrong. Today, the default Fedora Workstation install uses Btrfs. Now you can use a Btrfs snapshot to make creating a bootable fallback much easier. Note that converting or migrating a system to Btrfs from another filesystem is outside the scope of this article.

### Check that root filesystem is Btrfs

This example uses a Pinebook aarch64 laptop. Before proceeding, first make sure that Btrfs is being used for the root (system) filesystem. Not every spin or image uses Btrfs by default.

```

    $ df -T
    Filesystem     Type     1K-blocks     Used Available Use% Mounted on
    devtmpfs       devtmpfs      4096        0      4096   0% /dev
    tmpfs          tmpfs       998992        0    998992   0% /dev/shm
    tmpfs          tmpfs       399600     6360    393240   2% /run
    /dev/mmcblk2p3 btrfs     56929280 39796116  15058348  73% /
    tmpfs          tmpfs       998996       24    998972   1% /tmp
    tmpfs          tmpfs      5242880        0   5242880   0% /var/lib/mock
    /dev/mmcblk2p3 btrfs     56929280 39796116  15058348  73% /f34
    /dev/mmcblk2p3 btrfs     56929280 39796116  15058348  73% /home
    /dev/mmcblk2p2 ext4        996780   551888    376080  60% /boot
    /dev/mmcblk2p1 vfat        194348    31648    162700  17% /boot/efi
    tmpfs          tmpfs       199796      100    199696   1% /run/user/1000
    tmpfs          tmpfs       199796       84    199712   1% /run/user/0

```

### List the existing Btrfs subvolumes

The above example output shows that the file system mounted on “root” (“/”) is type Btrfs. Notice that three mountpoints show the same backing device and the same _Used_ and _Available_ blocks. This is because they are parts (subvolumes) mounted from a single Btrfs filesystem. The _/f34_ subvolume is my bootable snapshot from last year.

A default Fedora Btrfs install creates one Btrfs filesystem with two subvolumes — _root_ and _home_ — mounted on / and /home respectively. Let’s see what other subvolumes I’ve added:

```

    $ sudo btrfs subvol list /
    ID 272 gen 110428 top level 5 path root
    ID 273 gen 110426 top level 5 path home
    ID 300 gen 109923 top level 5 path f34
    ID 301 gen 95852 top level 5 path home.22Jul26
    ID 302 gen 95854 top level 5 path f36.22Jul26

```

There is an _f34_ subvol from the last system-upgrade and two readonly snapshots of _home_ and _f36_. The easiest way to add and delete snapshots is to mount the Btrfs root. I will update the system and create a new snapshot of the current f36 _root_ subvolume. If you have renamed your _root_ subvolume, then you presumably know enough to adjust the following example accordingly for your system.

### Create the Btrfs fallback snapshot

```

    $ sudo dnf update --refresh
    ... lots of stuff updated (reboot if kernel updated)
    $ sudo mkdir -p /mnt/root
    $ sudo mount /dev/mmcblk2p3 /mnt/root
    $ cd /mnt/root
    $ ls
    f34  f36.22Jul26  home  home.22Jul26  root
    $ sudo btrfs subvol snapshot root f36
    Create a snapshot of 'root' in './f36'

```

Because Btrfs snapshots are filesystem based, it is not necessary to “sync” before the snapshot, as I recommended for LVM. To boot from the new subvol as a fallback, you will need to edit /mnt/root/f36/etc/fstab with your favorite editor. If you are a beginner, nano is a dirt simple text editor with minimal features. Here are some lines from my _fstab_ file:

```

    LABEL=PINE           /    btrfs   subvol=root,compress=zstd:1        1 1
    UUID=e31667fb-5b6f-48d9-aa90-f2fd6aa5f005 /boot ext4    defaults        1 2
    UUID=75DB-5832          /boot/efi               vfat    umask=0077,shortname=winnt 0 2
    LABEL=PINE              /home    btrfs   subvol=home,compress=zstd:1    1 1
    LABEL=SWAP swap                 swap    discard=once    0 0

```

Change _subvol=root_ to _subvol=f36_. This change is to the file in the snapshot, not your production _fstab_. You can compare them with diff /etc/fstab /mnt/root/f36/etc/fstab. In my case, I also deleted my _f34_ snapshot from last year with sudo btrfs subvol delete f34.

### Test the Btrfs fallback snapshot

Now you are ready to test the fallback. You could use [grubby][4] or edit an entry in /boot/loader/entries to change _subvol=root_ to _subvol=f36_. But in the interest of safety for beginners, I will have you edit the GRUB entry at boot time instead. Checkout [this article on GRUB][5] for tips on getting to the GRUB menu. Once you are there, press the **e** key to edit the default kernel entry. Don’t worry — your changes are in volatile memory only. If you mess up, reboot to start over. Just like with fstab, find _subvol=root_ and change it to _subvol=f36_. Press **F10** or **Ctrl** + **X** to boot your modified entry. With these changes, the system should boot into your new snapshot. Look at /etc/fstab to make sure you are booting from the right subvol, or enter mount | grep subvol to see what subvolume is mounted on “/”.

### Do the Fedora Linux system upgrade

If your fallback is working, reboot back to your normal root filesystem (and confirm as above). Then proceed with the standard system-upgrade outlined on the [wiki page][6]. TIP: Before running dnf system-upgrade reboot, make another snapshot of root. Call it something like _root.dl_. That way, you don’t have to download five gigabytes of packages again should you discover that there wasn’t enough free space. The snapshot will not take up any additional space because all but the downloaded packages are shared with _root_ and _f36_. About that sharing of disk blocks …

dnf system-upgrade gets confused about free space as reported by Btrfs because the f36 files in the _root_ subvolume use the same disk locations as the same files in the _f36_ subvolume. So removing them from the _root_ subvolume during the upgrade process doesn’t actually free up any space. If you run out of space, and you reboot — the graphical user interface (GUI) won’t start. Use **Ctrl** + **Alt** + **F2** to login on a text console and practice your command line interface skills. Figuring out what to remove to free up space or how to expand the root filesystem is beyond the scope of this article (mine is often on an LVM volume and can be expanded). Having more than 50% free for the upgrade is a safe bet.

### Recovery

Should something go wrong, you can reboot and edit the GRUB entry to boot the fallback. If you are a beginner, you’ll want some hand holding if you do end up needing to change the GRUB entry on disk (so you don’t have to edit at each boot). It is straight forward to delete or rename the broken _root_ subvol. Snapshot the _f36_ subvol (or the _root.dl_ snapshot) to try the system-upgrade process again. Here is an example of starting over after booting into the fallback system on subvol f36:

```

    $ mount | grep subvol
    $ sudo mount /dev/mmcblk2p3 /mnt/root
    $ cd /mnt/root
    $ sudo mv root root.failed
    $ sudo btrfs subvol snapshot f36 root
    Create a snapshot of 'f36' in './root'

    Don't forget to edit /mnt/root/root/etc/fstab to change the subvol mounted on "/" to "root".

```

As it turns out, the new kernel-6.2.11 for f38 did not boot on my Pinebook after the system-upgrade! (Don’t worry, ARM is an alternative CPU architecture for Fedora Linux — this is very unlikely to happen to you on a mainstream device.) I was indeed able to boot back to f36 by editing the GRUB entry for kernel-6.2.10 at boot time as described above. I am now using f38 again — but with kernel-6.2.10 from f36.

**Update** : _kernel-6.2.12 is out and it works on the Pinebook._

### Expiration

As you update the f38 system, it will eventually want to delete the last f36 kernel from /boot. That is normally not a problem, as by that time you have settled into f38, and the f36 snapshot is just an archive. If you want to keep your fork (f36 snapshot) bootable indefinitely, you should preserve a working f36 kernel under /boot. The simplest way to do so is to set _installonly_limit=0_ in /etc/dnf/dnf.conf and manually remove old kernels. It is simple and safe (but annoying).

Outline of a more complex solution (not for beginners): Run find /boot -name "*fc36*" to list all the kernel and GRUB files for your f36 subvolume snapshot that are under /boot (which is not in the snapshot). Copy them to a backup location (I would mount the f36 subvolume and copy to a backup directory there). While booted from f38, for each f36 kernel version, use dnf to remove that specific kernel version (for example, dnf remove kernel-core-5.19.11-200.fc36). Do not remove the f38 kernels! Now restore the f36 kernels you saved to /boot. The f38 system doesn’t know about f36 kernels anymore, and it will not remove them from /boot.

The problem with that method is the danger of accidentally removing the running f38 kernel. If anyone has a better method, let me know in the comments.

### Future directions

Those comfortable with modifying GRUB entries might consider creating a snapshot subvolume named _f38_ , modifying the current GRUB entry to boot into that, rebooting, and running the system-upgrade in that subvolume. Then always name the subvol for the root filesystem after the Fedora Linux release it contains. I did not do that for this article for two reasons.

  1. Naming the current active subvolume _root_ matches the Fedora Linux default.
  2. Sticking with _root_ for the current subvol does not require any permanent changes outside of the normal system-upgrade procedure.



As this article has demonstrated, readonly snapsnots are useful as local restore points in case things go wrong when making significant system changes (such as a system release upgrade). These snapshots can also be sent to a remote backup using Btrfs’ _send_ subcommand. (And if the remote backup device already contains previous backups, Btrfs can do an incremental send that only transmits changed files to save time and space.) If you intend to archive these snapshots long term, the key to not getting confused about which ones are which and what order to restore them is to use a consistent naming convention. See the article on [Btrfs snapshots for backup][7] for more information about using Btrfs’ _send_ command to create backups.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/make-use-of-btrfs-snapshots-to-upgrade-fedora-linux-with-easy-fallback/

作者：[Stuart D Gathman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sdgathman/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/04/forkedtree-816x345.jpg
[2]: https://www.flickr.com/photos/brenejohn/20155029206/
[3]: https://fedoramagazine.org/use-lvm-upgrade-fedora/
[4]: https://fedoramagazine.org/setting-kernel-command-line-arguments-with-fedora-30/
[5]: https://fedoramagazine.org/boot-earlier-kernel/
[6]: https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/
[7]: https://fedoramagazine.org/btrfs-snapshots-backup-incremental/
