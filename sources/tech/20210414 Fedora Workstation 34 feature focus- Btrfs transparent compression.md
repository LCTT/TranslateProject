[#]: subject: (Fedora Workstation 34 feature focus: Btrfs transparent compression)
[#]: via: (https://fedoramagazine.org/fedora-workstation-34-feature-focus-btrfs-transparent-compression/)
[#]: author: (nickavem https://fedoramagazine.org/author/nickavem/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Fedora Workstation 34 feature focus: Btrfs transparent compression
======

![][1]

Photo by [Patrick Lindenberg][2] on [Unsplash][3]

The release of Fedora 34 grows ever closer, and with that, some fun new features! A [previous feature focus][4] talked about some changes coming to GNOME version 40. This article is going to go a little further under the hood and talk about data compression and _transparent compression_ in _btrfs_. A term like that may sound scary at first, but less technical users need not be wary. This change is simple to grasp, and will help many Workstation users in several key areas.

### What is transparent compression exactly?

Transparent compression is complex, but at its core it is simple to understand: it makes files take up less space. It is somewhat like a compressed tar file or ZIP file. Transparent compression will dynamically optimize your file system’s bits and bytes into a smaller, reversible format. This has many benefits that will be discussed in more depth later on, however, at its core, it makes files smaller. This may leave most computer users with a question: “I can’t just read ZIP files. You need to decompress them. Am I going to need to constantly decompress things when I access them?”. That is where the “transparent” part of this whole concept comes in.

Transparent compression makes a file smaller, but the final version is indistinguishable from the original by the human viewer. If you have ever worked with Audio, Video, or Photography you have probably heard of the terms “lossless” and “lossy”. Think of transparent compression like a lossless compressed PNG file. You want the image to look exactly like the original. Small enough to be streamed over the web but still readable by a human. Transparent compression works similarly. Your file system will look and behave the same way as before (no ZIP files everywhere, no major speed reductions). Everything will look, feel, and behave the same. However, in the background it is taking up much less disk space. This is because BTRFS will dynamically compress and decompress your files for you. It’s “Transparent” because even with all this going on, you won’t notice the difference.

> You can learn more about transparent compression at <https://btrfs.wiki.kernel.org/index.php/Compression>

### Transparent compression sounds cool, but also too good to be true…

I would be lying if I said transparent compression doesn’t slow some things down. It adds extra CPU cycles to pretty much any I/O operation, and can affect performance in certain scenarios. However, Fedora is using the extremely efficient _zstd:1_ algorithm. [Several tests][5] show that relative to the other benefits, the downsides are negligible (as I mentioned in my explanation before). Better disk space usage is the greatest benefit. You may also receive reduction of write amplification (can increase the lifespan of SSDs), and enhanced read/write performance.

Btrfs transparent compression is extremely performant, and chances are you won’t even notice a difference when it’s there.

### I’m convinced! How do I get this working?

In fresh **installations of Fedora 34 and its [corresponding beta][6], it should be enabled by default. However, it is also straightforward to enable before and after an upgrade from Fedora 33. You can even enable it in Fedora 33, if you aren’t ready to upgrade just yet.

  1. (Optional) Backup any important data. The process itself is completely safe, but human error isn’t.
  2. To truly begin you will be editing your _[fstab][7]_. This file tells your computer what file systems exist where, and how they should be handled. You need to be cautious here, but only a few small changes will be made so don’t be intimidated. On an installation of Fedora 33 with the default Btrfs layout the _/etc/fstab_ file will probably look something like this:


```

```

&lt;strong&gt;$ $EDITOR /etc/fstab&lt;/strong&gt;
UUID=1234 /                       btrfs   subvol=root     0 0
UUID=1234 /boot                   ext4    defaults        1 2
UUID=1234         /boot/efi               vfat    umask=0077,shortname=winnt 0 2
UUID=1234 /home                   btrfs   subvol=home     0 0
```

```

NOTE: _While this guide builds around the standard partition layout, you may be an advanced enough user to partition things yourself. If so, you are probably also advanced enough to extrapolate the info given here onto your existing system. However, comments on this article are always open for any questions._

Disregard the _/boot_ and _/boot/efi_ directories as they aren’t ([currently][8]) compressed. You will be adding the argument _compress=zstd:1_. This tells the computer that it should transparently compress any newly written files if they benefit from it. Add this option in the fourth column, which currently only contains the _subvol_ option for both /home and /:
```

```

UUID=1234 /                       btrfs   subvol=root,compress=zstd:1     0 0
UUID=1234 /boot                   ext4    defaults        1 2
UUID=1234         /boot/efi               vfat    umask=0077,shortname=winnt 0 2
UUID=1234 /home                   btrfs   subvol=home,compress=zstd:1     0 0
```

```

Once complete, simply save and exit (on the default _nano_ editor this is CTRL-X, SHIFT-Y, then ENTER).

3\. Now that fstab has been edited, tell the computer to read it again. After this, it will make all the changes required:

```
$ sudo mount -o remount / /home/
```

Once you’ve done this, you officially have transparent compression enabled for all newly written files!

### Recommended: Retroactively compress old files

Chances are you already have many files on your computer. While the previous configuration _will_ compress all newly written files, those old files will not benefit. I recommend taking this next (but optional) step to receive the full benefits of transparent compression.

  1. (Optional) Clean out any data you don’t need (empty trash etc.). This will speed things up. However, it’s not required.
  2. Time to compress your data. One simple command can do this, but its form is dependent on your system. Fedora Workstation (and any other desktop spins using the DNF package manager) should use:



```
$ sudo btrfs filesystem defrag -czstd -rv / /home/
```

Fedora Silverblue users should use:

```
$ sudo btrfs filesystem defrag -czstd -rv / /var/home/
```

Silverblue users may take note of the immutability of some parts of the file system as described [here][9] as well as this [Bugzilla entry][10].

NOTE: _You may receive several warnings that say something like “Cannot compress permission denied.”. This is because some files, on Silverblue systems especially, the user cannot easily modify. This is a tiny subset of files. They will most likely compress on their own, in time, as the system upgrades._

Compression can take anywhere from a few minutes to an hour depending on how much data you have. Luckily, since all new writes are compressed, you can continue working while this process completes. Just remember it may partially slow down your work at hand and/or the process itself depending on your hardware.

Once this command completes you are officially fully compressed!

### How much file space is used, how big are my files

Due to the nature of transparent compression, utilities like _du_ will only report exact, uncompressed, files space usage. This is not the actual space they take up on the disk. The [_compsize_][11] utility is the best way to see how much space your files are actually taking up on disk. An example of a _compsize_ command is:

```
$ sudo compsize -x / /home/
```

This example provides exact information on how the two locations, / and /home/ are currently, transparently, compressed. If not installed, this utility is available in the Fedora Linux repository.

### Conclusion:

Transparent compression is a small but powerful change. It should benefit everyone from developers to sysadmin, from writers to artists, from hobbyists to gamers. It is one among many of the changes in Fedora 34. These changes will allow us to take further advantage of our hardware, and of the powerful Fedora Linux operating system. I have only just touched the surface here. I encourage those of you with interest to begin at the [Fedora Project Wiki][12] and [Btrfs Wiki][13] to learn more!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-workstation-34-feature-focus-btrfs-transparent-compression/

作者：[nickavem][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/nickavem/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/btrfs_compression-1-816x345.jpg
[2]: https://unsplash.com/@heapdump?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/hdd-compare?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/fedora-34-feature-focus-updated-activities-overview/
[5]: https://fedoraproject.org/wiki/Changes/BtrfsTransparentCompression#Simple_Analysis_of_btrfs_zstd_compression_level
[6]: https://fedoramagazine.org/announcing-fedora-34-beta/
[7]: https://en.wikipedia.org/wiki/Fstab
[8]: https://fedoraproject.org/wiki/Changes/BtrfsTransparentCompression#Q:_Will_.2Fboot_be_compressed.3F
[9]: https://docs.fedoraproject.org/en-US/fedora-silverblue/technical-information/#filesystem-layout
[10]: https://bugzilla.redhat.com/show_bug.cgi?id=1943850
[11]: https://github.com/kilobyte/compsize
[12]: https://fedoraproject.org/wiki/Changes/BtrfsTransparentCompression
[13]: https://btrfs.wiki.kernel.org/index.php/Compression
