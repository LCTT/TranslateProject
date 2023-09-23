[#]: subject: "Working with Btrfs – Subvolumes"
[#]: via: "https://fedoramagazine.org/working-with-btrfs-subvolumes/"
[#]: author: "Andreas Hartmann https://fedoramagazine.org/author/hartan/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "A2ureStone"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Working with Btrfs – Subvolumes
======

![][1]

Photo by [Heliberto Arias][2] on [Unsplash][3]

This article is part of a series of articles that takes a closer look at Btrfs, the default filesystem for Fedora Workstation and Fedora Silverblue since Fedora Linux 33.

In case you missed it, here’s the previous article from the series: <https://fedoramagazine.org/working-with-btrfs-general-concepts/>

### Introduction

Subvolumes allow for the partitioning of a Btrfs filesystem into separate sub-filesystems. This means that you can mount subvolumes from a Btrfs filesystem as if they were independent filesystems. In addition, you can, for example, define the maximum space a subvolume may take up via qgroups (We’ll talk about this in another article in this series), or use subvolumes to specifically include or exclude files from snapshots (We’ll talk about this, too, in another article in this series). Every default Fedora Workstation and Fedora Silverblue installation since Fedora Linux 33 makes use of subvolumes. In this article we will explore how it works.

Below you will find a lot of examples related to subvolumes. If you want to follow along, you must have access to some Btrfs filesystem and root access. You can verify whether your _/home/_ directory is Btrfs via the following command:

```

    $ findmnt -no FSTYPE /home
    btrfs

```

This command will output the name of the filesystem of your _/home/_ directory. If it says _btrfs_ , you’re all set. Let’s create a new directory to perform some experiments in:

```

    $ mkdir ~/btrfs-subvolume-test
    $ cd ~/btrfs-subvolume-test

```

In the text below, you will find lots of command outputs in boxes such as shown above. Please keep in mind while reading/comparing command outputs that the **box contents are wrapped at the end of the line**. This makes it difficult to recognize long lines that are broken across multiple lines for readability. When in doubt, try to resize your browser window and see how the text behaves!

### Creating and playing with subvolumes

We can create a Btrfs subvolume with the following command:

```

    $ sudo btrfs subvolume create first
    Create subvolume './first'

```

When we inspect the current directory we will see that it now has a new folder named _first_. Note the first character _d_ in the output below:

```

    $ ls -l
    total 0
    drwxr-xr-x. 1 root root 0 Oct 15 18:09 first

```

We can handle this like any regular folder: We can rename it, move it, create new files and folders inside, etc. Note that the folder belongs to root, so we must be root to do these things.

If it acts like a folder and looks like a folder, how do we know whether it’s a Btrfs subvolume? We can use the _btrfs_ tools to list all subvolumes:

```

    $ sudo btrfs subvolume list .
    ID 256 gen 30 top level 5 path home
    ID 257 gen 30 top level 5 path root
    ID 258 gen 25 top level 257 path root/var/lib/machines
    ID 259 gen 29 top level 256 path hartan/btrfs-subvolume-test/first

```

If you’re on a recent and unmodified Fedora Linux installation you will likely see the same output as above. We will inspect _home_ and _root_ as well as the meaning of all the numbers later. For now, we see that there is a subvolume at the path we specified. We can limit the output to the subvolumes below our current location:

```

    $ sudo btrfs subvolume list -o .
    ID 259 gen 29 top level 256 path home/hartan/btrfs-subvolume-test/first

```

Let’s rename the subvolume:

```

    $ sudo mv first second
    $ sudo btrfs subvolume list -o .
    ID 259 gen 29 top level 256 path home/hartan/btrfs-subvolume-test/second

```

We can also nest subvolumes:

```

    $ sudo btrfs subvolume create second/third
    Create subvolume 'second/third'
    $ sudo btrfs subvolume list .
    ID 256 gen 34 top level 5 path home
    ID 257 gen 37 top level 5 path root
    ID 258 gen 25 top level 257 path root/var/lib/machines
    ID 259 gen 37 top level 256 path hartan/btrfs-subvolume-test/second
    ID 260 gen 37 top level 259 path hartan/btrfs-subvolume-test/second/third

```

And we can also remove subvolumes, either like we remove folders:

```

    $ sudo rm -r second/third

```

or via special Btrfs commands:

```

    $ sudo btrfs subvolume delete second
    Delete subvolume (no-commit): '/home/hartan/btrfs-subvolume-test/second'

```

### Handling Btrfs subvolumes like separate filesystems

The introduction mentioned that Btrfs subvolumes act like separate filesystems. This means that we can mount subvolumes and pass some mount options to them. First we will create a small folder structure to get a better understanding of what happens:

```

    $ mkdir -p a a/1 a/1/b
    $ sudo btrfs subvolume create a/2
    Create subvolume 'a/2'
    $ sudo touch a/1/c a/1/b/d a/2/e

```

Here’s what the structure looks like:

```

    $ tree
    .
    └── a
        ├── 1
        │   ├── b
        │   │   └── d
        │   └── c
        └── 2
            └── e

    4 directories, 3 files

```

Verify that there is now a new Btrfs subvolume:

```

    $ sudo btrfs subvolume list -o .
    ID 261 gen 41 top level 256 path home/hartan/btrfs-subvolume-test/a/2

```

To mount the subvolume we must know the path of the block device where the Btrfs filesystem subvolume resides. The following command tells us:

```

    $ findmnt -vno SOURCE /home/
    /dev/vda3

```

Now we can mount the subvolume. Make sure you replace the arguments with the values for your PC:

```

    $ sudo mount -o subvol=home/hartan/btrfs-subvolume-test/a/2 /dev/vda3 a/1/b

```

Observe that we use the _-o_ flag to give additional options to the mount program. In this case we tell it to mount the subvolume with name _home/hartan/btrfs-subvolume-test/a/2_ from the btrfs filesystem on device _/dev/vda3_. This is a Btrfs-specific option and isn’t available in other filesystems.

We see that the directory structure has changed:

```

    $ tree
    .
    └── a
        ├── 1
        │   ├── b
        │   │   └── e
        │   └── c
        └── 2
            └── e

    4 directories, 3 files

```

Note that the file _e_ exists twice now and _d_ is gone. We are now able to access the same Btrfs subvolume by two different paths. All changes we perform in either of the paths are immediately reflected in all other locations:

```

    $ sudo touch a/1/b/x
    $ ls -lA a/2
    total 0
    -rw-r--r--. 1 root root 0 Oct 15 18:14 e
    -rw-r--r--. 1 root root 0 Oct 15 18:16 x

```

Let’s play some more with the mount options. For example we can mount the subvolume as read-only under _a/1/b_ like this (Insert arguments for your PC!):

```

    $ sudo umount a/1/b
    $ sudo mount -o subvol=home/hartan/btrfs-subvolume-test/a/2,ro /dev/vda3 a/1/b

```

We use the same command as above, except that we add _ro_ at the end. Now we can no longer create files via this mount:

```

    $ sudo touch a/1/b/y
    touch: cannot touch 'a/1/b/y': Read-only file system

```

but accessing the subvolume directly still works like before:

```

    $ sudo touch a/2/y
    $ tree
    .
    └── a
        ├── 1
        │   ├── b
        │   │   ├── e
        │   │   ├── x
        │   │   └── y
        │   └── c
        └── 2
            ├── e
            ├── x
            └── y

    4 directories, 7 files

```

Don’t forget to clean up before we move on:

```

    $ sudo rm -rf a
    rm: cannot remove 'a/1/b/e': Read-only file system
    rm: cannot remove 'a/1/b/x': Read-only file system
    rm: cannot remove 'a/1/b/y': Read-only file system

```

Oh no, what happened? Well, since we mounted the subvolume _read-only_ above, we cannot delete it. A deletion from a filesystems’ perspective is a write operation: To delete **_a/1/b/e_ ,** we remove the directory entry for _**e**_ from the directory contents of its parent directory, _**a/1/b**_ in this case. In other words, we must _write_ to _**a/1/b**_ to tell it that _**e**_ doesn’t exist any longer. So first we unmount the subvolume again, and then we remove the folder:

```

    $ sudo umount a/1/b
    $ sudo rm -rf a
    $ tree
    .

    0 directories, 0 files

```

### Subvolume IDs

Remember the first output of the _subvolume list_ subcommand? That contained a lot of numbers, so let’s see what that is all about. I copied the output here to take another look:

```

    ID 256 gen 30 top level 5 path home
    ID 257 gen 30 top level 5 path root
    ID 258 gen 25 top level 257 path root/var/lib/machines
    ID 259 gen 29 top level 256 path hartan/btrfs-subvolume-test/first

```

We see there are three columns of numbers, each prefixed with a few letters to describe what they do. The first column of numbers is a subvolumes ID. Subvolume IDs are unique in a Btrfs filesystem and as such uniquely identify subvolumes. This means that the subvolume named _home_ can also be referred to by its ID **256**. In the mount command above we wrote:

```

    $ sudo mount -o subvol=hartan/...

```

Another perfectly legal option is to use subvolume IDs:

```

    $ sudo mount -o subvolid=...

```

Subvolume IDs start at **256** and increase by 1 for every created subvolume. There is however one exception to this: The filesystem root always has the subvolume name _/_ and the subvolume ID 5. That is right, even the root of a Btrfs filesystem is technically a subvolume. This is just implicitly known, hence it doesn’t show up in the output of _btrfs subvolume list_. If you mount a Btrfs filesystem without the _subvol_ or _subvolid_ argument, the root subvolume with _subvolid=5_ is assumed as default. Below we’ll see an example of when one may want to explicitly mount the filesystem root.

The second column of numbers is the generation counter and incremented on every Btrfs transaction. This is mostly an internal counter and won’t be discussed further here.

Finally, the third column of numbers is the subvolume ID of the subvolumes _parent_. In the output above we see that both subvolume _home_ and _root_ have 5 as their parent subvolume ID. Remember that ID 5 has a special meaning: It is the filesystem root. So we know that _home_ and _root_ are children to the root subvolume. _hartan/btrfs-subvolume-test/first_ on the other hand is a child of the subvolume with ID 256, which in our case is _home_.

In the next section we have a look at where the subvolumes _root_ and _home_ come from.

### Inspecting default subvolumes in Fedora Linux

When you create a new Btrfs filesystem from scratch, there will be no subvolumes in it (Except of course for the root subvolume). So where do the _home_ and _root_ subvolumes in Fedora Linux come from?

These are created by the installer at install time. Traditional installations would often include a separate filesystem partition for the _/_ and _/home_ directories. During boot, these are then appropriately mounted to assemble one full filesystem. But there is an issue with this approach: Unless you use technologies such as _lvm_ , it is very hard to change a partitions size at some point in the future. As a consequence you may end up in a situation where either your _/_ or _/home_ runs out of space, while the respective other partition has lots of unused, free space left.

Since Btrfs subvolumes are all part of the same filesystem, they will share the space that the underlying filesystem offers. Remember when we created the subvolumes above? We never told Btrfs how big they are: A subvolume can take up all the space the filesystem has, by default nothing keeps it from doing so. However, we _could_ dynamically impose size limits via Btrfs qgroups, which can also be modified during runtime (And we’ll see how in a later article in this series).

Another advantage of separating _/_ and _/home_ is that we can take _snapshots_ separately. A subvolume is a boundary for snapshots, and snapshots will never contain the contents of other subvolumes below the subvolume that the snapshot is taken of. More details on snapshots follow in the next article in this series.

Enough of the theory! Let’s see what this is all about. First ensure that your root filesystem is in fact of type Btrfs:

```

    $ findmnt -no FSTYPE /
    btrfs

```

And then get the partition it resides on:

```

    $ findmnt -vno SOURCE /
    /dev/vda3

```

Remember we can mount the filesystem root by its special subvolume ID 5 (Adapt the filesystem partition!):

```

    $ mkdir fedora-rootsubvol
    $ sudo mount -o subvolid=5 /dev/vda3 ./fedora-rootsubvol
    $ ls fedora-rootsubvol/
    home  root

```

And there are the subvolumes of our Fedora Linux installation! But how does Fedora Linux know that the subvolume _root_ belongs to _/_ , and _home_ belongs to _/home_?

The file _/etc/fstab_ contains so-called static information about the filesystem. In simple terms, during booting your system reads this file, line by line, and mounts all the filesystems listed there. On my system, the file looks like this:

```

    $ cat /etc/fstab
    # [ ... ]
    # /etc/fstab
    # Created by anaconda on Sat Oct 15 12:01:57 2022
    # [ ... ]
    #
    UUID=5e4e42bb-4f2f-4f0e-895f-d1a46ea47807 /                       btrfs   subvol=root,compress=zstd:1 0 0
    UUID=e3a798a8-b8f2-40ca-9da7-5e292a6412aa /boot                   ext4    defaults        1 2
    UUID=5e4e42bb-4f2f-4f0e-895f-d1a46ea47807 /home                   btrfs   subvol=home,compress=zstd:1 0 0

```

(Note that the “UUID” lines above have been wrapped into two lines)

The _UUID_ at the beginning of each line is simply a means to identify disks and filesystem partitions in your system (roughly equivalent to _/dev/vda3_ as I used above). The second column is the path in the filesystem tree where this filesystem should be mounted. The third column is the filesystem type. We see that the entries for _/_ and _/home_ are of type _btrfs_ , just what we expect! Finally, in the fourth column we see the magic: These are the mount options, and there it says to mount _/_ with the option _subvol=root_. That is exactly the subvolume we saw in the output of _btrfs subvolume list /_ all the time!

With this information, we can reconstruct the call to _mount_ that creates this filesystem entry:

```

    $ sudo mount -o subvol=root,compress=zstd:1 UUID=5e4e42bb-4f2f-4f0e-895f-d1a46ea47807 /

```

```

    (again, the line above has been wrapped into two)

```

And that is how Fedora Linux uses Btrfs subvolumes! If you’re curious as to why Fedora Linux decided to use Btrfs as the default filesystem, refer to the change proposal linked below [[1]][4].

### More on Btrfs subvolumes

The Btrfs wiki has additional information on subvolumes and most importantly on the mount options that can be applied to Btrfs subvolumes. Some options, like _compress_ can only be applied on a filesystem-wide level and thus affect all subvolumes of a Btrfs filesystem. You can find the entry linked below [[2]][4].

If you find it confusing to tell which directories are plain directories and which are subvolumes, you can feel free to adopt a special naming convention for your subvolumes. For example, you could prefix your subvolume names with an “@” to make them easily distinguishable.

Now that you know that subvolumes behave like filesystems, one may ask how best to place a subvolume in a certain location. Say you want a Btrfs subvolume under _~/games_ , where your home directory ( _~_ ) is itself a subvolume, how can you achieve that? Given the example above, you may use a command like _sudo btrfs subvolume create ~/games_. This way, you create so-called _nested_ subvolumes: Inside your subvolume _~_ , there is now a subvolume _games_. That is a perfectly fine way to approach this situation.

Another valid solution is to do what Fedora does by default: Create all subvolumes under the root subvolume (i.e. such that their parent subvolume ID is 5), and mount them into the appropriate locations. The Btrfs wiki has an overview of these approaches along with a short discussion about their respective implications on filesystem management [[5]][4].

### Conclusion

In this article we discovered Btrfs subvolumes, which act like separate Btrfs filesystems inside a Btrfs filesystem. We learned how to create, mount and delete subvolumes. Finally, we explored how Fedora Linux makes use of subvolumes – without us noticing at all.

The next articles in this series will deal with:

  * Snapshots – Going back in time
  * Compression – Transparently saving storage space
  * Qgroups – Limiting your filesystem size
  * RAID – Replace your mdadm configuration



If there are other topics related to Btrfs that you want to know more about, have a look at the Btrfs Wiki [[3]][4] and Docs [[4]][4]. Don’t forget to check out the first article of this series, if you haven’t already! If you feel that there is something missing from this article series, let us know in the comments below. See you in the next article!

### Sources

[1]: <https://fedoraproject.org/wiki/Changes/BtrfsByDefault#Benefit_to_Fedora>
[2]: <https://btrfs.readthedocs.io/en/latest/Subvolumes.html>
[3]: <https://btrfs.wiki.kernel.org/index.php/Main_Page>
[4]: <https://btrfs.readthedocs.io/en/latest/Introduction.html>
[5]: <https://btrfs.wiki.kernel.org/index.php/SysadminGuide#Layout>

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/working-with-btrfs-subvolumes/

作者：[Andreas Hartmann][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hartan/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/09/working_w_btrfs_subvolumes-816x345.jpg
[2]: https://unsplash.com/@helibertoarias?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/hdd?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: tmp.YC93jxHuAw#sources
