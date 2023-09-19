[#]: subject: "Working with Btrfs – Snapshots"
[#]: via: "https://fedoramagazine.org/working-with-btrfs-snapshots/"
[#]: author: "Andreas Hartmann https://fedoramagazine.org/author/hartan/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Working with Btrfs – Snapshots
======

![][1]

Photo by [Heliberto Arias][2] on [Unsplash][3]

This article will explore what Btrfs snapshots are, how they work, and how you can benefit from taking snapshots in every-day situations. This is part of a series that takes a closer look at Btrfs, the default filesystem for Fedora Workstation and Fedora Silverblue since Fedora Linux 33.

In case you missed it, here’s the previous article from this series: <https://fedoramagazine.org/working-with-btrfs-subvolumes/>

### Introduction

Imagine you work on a file over extended periods of time, repeatedly adding changes and undoing them. Then, at some point you realize: Parts of the changes you undid two hours ago would be very helpful now. And yesterday you had already changed this particular bit, too, before you trashed that design. But of course, because you regularly save your files, old changes are lost. Many people have probably experienced a situation like this before. Wouldn’t it be great if you could recover old file versions without having to manually copy them at regular intervals?

This is just one typical situation where Btrfs snapshots can help you out. When used correctly, snapshots also give you a great backup solution for your PC.

Below you will find a lot of examples related to snapshots. If you want to follow along, you must have access to a Btrfs filesystem and root access. You can check the file system of a directory using the following command:

```

    $ findmnt -no FSTYPE /home
    btrfs

```

Here the _findmnt_ command shows the type of filesystem for your _/home/_ directory. If it says _btrfs_ , you’re all set. Let’s create a new directory in which to perform some experiments:

```

    $ mkdir ~/btrfs-snapshot-test
    $ cd ~/btrfs-snapshot-test

```

In the text below, you will find lots of command responses in boxes such as shown above. Please keep in mind while reading/comparing command output that the **box contents may be wrapped at the end of the line**. This may make it difficult to recognize long lines that are broken across multiple lines for readability. When in doubt, try to resize your browser window and see how the text behaves!

### Snapshots in Btrfs

Let’s start with an elementary question: What is a Btrfs snapshot? If you look in the Docs [[1]][4] and Wiki [[2]][4], you won’t immediately find an answer to this question. In fact, it is nowhere to be found in the “Features” section. If you search a little, you will find snapshots mentioned extensively along with Btrfs subvolumes [[3]][5]. So now what?

Remember that snapshots were both mentioned in the previous articles of this series? There it said:

> What is the advantage of CoW? In simple terms: a history of the modified and edited files can be kept. Btrfs will keep the references to the old file versions (inodes) somewhere they can be easily accessed. This reference is a _snapshot_ : An image of the filesystem state at some point in time.
>
> [Working with Btrfs: General Concepts][6]

and also:

> Another advantage of separating _/_ and _/home_ is that you can take _snapshots_ separately. A subvolume is a boundary for snapshots, and snapshots will never contain the contents of other subvolumes below the subvolume that the snapshot is taken of.
>
> [Working with Btrfs: Subvolumes][7]

It seems snapshots have something to do with Btrfs subvolumes. You may have heard about snapshots in other contexts before, for example with LVM, the Logical Volume Manager. While technically they serve the same purpose, they are different in terms of how they reach their goal.

Every Btrfs snapshot is a subvolume. However, not every subvolume is a snapshot. The difference is in what the subvolume contains. A snapshot is a subvolume with added content: it holds references to current and/or past versions of files (inodes). Let’s see where snapshots come from!

### Creating Btrfs snapshots

To use snapshots, you need a Btrfs subvolume to take snapshots of. Let’s create one inside our test folder (~/btrfs-snapshot-test):

```

    $ cd ~/btrfs-snapshot-test
    $ sudo btrfs subvolume create demo
    Create subvolume './demo'
    $ sudo chown -R $(id -u):$(id -g) demo/
    $ cd demo

```

Since by default Btrfs subvolumes are owned by root, you must call _chown_ to modify the files in the subvolume to be owned by a regular user. Now add a few files inside it:

```

    $ touch foo bar baz
    $ echo "Lorem ipsum dolor sit amet, " > foo

```

Your directory now looks something like this:

```

    $ ls -l
    total 4
    -rw-r--r--. 1 hartan hartan  0 Dec 20 08:11 bar
    -rw-r--r--. 1 hartan hartan  0 Dec 20 08:11 baz
    -rw-r--r--. 1 hartan hartan 29 Dec 20 08:11 foo

```

Let’s create the very first snapshot from that:

```

    $ cd ..
    $ sudo btrfs subvolume snapshot demo demo-1
    Create a snapshot of 'demo' in './demo-1'

```

And that’s it. Let’s see what was achieved:

```

    $ ls -l
    total 0
    drwxr-xr-x. 1 hartan hartan 18 Dec 20 08:11 demo
    drwxr-xr-x. 1 hartan hartan 18 Dec 20 08:11 demo-1
    $ tree
    .
    ├── demo
    │   ├── bar
    │   ├── baz
    │   └── foo
    └── demo-1
        ├── bar
        ├── baz
        └── foo

    2 directories, 6 files

```

It seems it made a copy! To verify, let’s read the contents of _foo_ from the snapshot:

```

    $ cat demo/foo
    Lorem ipsum dolor sit amet,
    $ cat demo-1/foo
    Lorem ipsum dolor sit amet,

```

The real effect becomes apparent when we modify the original file:

```

    $ echo "consectetur adipiscing elit, " >> demo/foo
    $ cat demo/foo
    Lorem ipsum dolor sit amet,
    consectetur adipiscing elit,
    $ cat demo-1/foo
    Lorem ipsum dolor sit amet,

```

This shows that the snapshot still holds the “old” version of the data: The content of _foo_ hasn’t changed. So far, you could have achieved the exact same thing with a simple file copy. You can now go ahead and continue working on the old file, too:

```

    $ echo "sed do eiusmod tempor incididunt" >> demo-1/foo
    $ cat demo-1/foo
    Lorem ipsum dolor sit amet,
    sed do eiusmod tempor incididunt

```

Under the hood, however, our snapshot is in fact a new Btrfs subvolume. You can verify this with the following command:

```

    $ sudo btrfs subvolume list -o .
    ID 259 gen 265 top level 256 path home/hartan/btrfs-snapshot-test/demo
    ID 260 gen 264 top level 256 path home/hartan/btrfs-snapshot-test/demo-1

```

### Btrfs snapshots vs. file copies

So what’s the point of all this? Up until now snapshots seem to be a complicated way to copy files around. In fact, there is more to snapshots than meets the eye. Let’s create a bigger file:

```

    $ dd if=/dev/urandom of=demo/bigfile bs=1M count=512
    512+0 records in
    512+0 records out
    536870912 bytes (537 MB, 512 MiB) copied, 1.3454 s, 399 MB/s

```

There is now a new file _demo/bigfile_ that is 512 MiB in size. Let’s make another snapshot so you don’t lose it when you modify the data:

```

    $ sudo btrfs subvolume snapshot demo demo-2
    Create a snapshot of 'demo' in './demo-2'

```

Now let’s simulate some changes by appending a small string to the file:

```

    $ echo "small changes" >> demo/bigfile

```

Here’s the resulting file structure:

```

    $ tree
    .
    ├── demo
    │   ├── bar
    │   ├── baz
    │   ├── bigfile
    │   └── foo
    ├── demo-1
    │   ├── bar
    │   ├── baz
    │   └── foo
    └── demo-2
        ├── bar
        ├── baz
        ├── bigfile
        └── foo

    3 directories, 11 files

```

But the real magic happens somewhere else. Had you copied _demo/bigfile_ , you would now have two files of about 512 MiB in size with mostly the same content. However, since they are distinct copies, they would occupy about 1 GiB of storage total. Keep in mind that the difference between both files is hardly more than 10 Bytes – that’s almost nothing compared to the original file size.

Btrfs snapshots work different than file copies: They keep references to current and past inodes instead. When you appended the change to the file, under the hood Btrfs allocated some more space to store the changes in and added a reference to this new data to the original inode. The previous contents remain untouched. If it helps your mental model, you can think of this as “storing” merely the difference between the original file and the modified version.

Let’s have a look at the effect of this:

```

    $ sudo compsize .
    Processed 11 files, 5 regular extents (9 refs), 3 inline.
    Type       Perc     Disk Usage   Uncompressed Referenced
    TOTAL      100%      512M         512M         1.0G
    none       100%      512M         512M         1.0G

```

The interesting figure here is seen in line “TOTAL”:

  * “Referenced” is the total size of all the files in the current directory, summed up
  * “Disk Usage” is the amount of storage space allocated on your disk to store the files



While you have a total of 1 GiB files, it takes merely 512 MiB to store them.

### Btrfs snapshots and backups

So far, in this article, you have seen how to create Btrfs snapshots and what makes them so special. One may be tempted to think: If I take a series of Btrfs snapshots locally on my PC, I have a solid backup strategy. **This is not the case**. If the underlying data, which is shared by Btrfs subvolumes, is accidentally damaged (by something outside of Btrfs’ influence, e.g. cosmic rays), all the subvolumes pointing to this data contain the same error.

To turn the snapshots into real backups you should store them on a different Btrfs filesystem, such as on an external drive. For the purposes of this article let’s create a new Btrfs filesystem contained inside a file and mount it to simulate an external drive. If you have an external drive formatted with Btrfs lying around, feel free to substitute all the paths mentioned in the following commands to try it out! Let’s create a new Btrfs filesystem:

**Note** : The commands below will create a new file of 8 GB size on your filesystem. If you want to follow the steps below, please ensure you have at least 8 GB of disk space available. Do not allocate less than 8 GB to the file, as Btrfs may otherwise encounter issues during mounting.

```

    $ truncate -s 8G btrfs_filesystem.img
    $ sudo mkfs.btrfs -L "backup-drive" btrfs_filesystem.img
    btrfs-progs v5.18
    See http://btrfs.wiki.kernel.org for more information.

    [ ... ]

    Devices:
       ID        SIZE  PATH
        1     8.00GiB  btrfs_filesystem.img

```

These commands created a new file of 8 GB in size named _btrfs_filesystem.img_ and formatted a Btrfs filesystem inside it. Now you can mount it as if it were an external drive:

```

    $ mkdir backup-drive
    $ sudo mount btrfs_filesystem.img backup-drive
    $ sudo chown -R $(id -u):$(id -g) backup-drive
    $ ls -lh
    total 4.7M
    drwxr-xr-x. 1 hartan hartan    0 Dec 20 08:35 backup-drive
    -rw-r--r--. 1 hartan hartan 8.0G Dec 20 08:37 btrfs_filesystem.img
    drwxr-xr-x. 1 hartan hartan   32 Dec 20 08:14 demo
    drwxr-xr-x. 1 hartan hartan   18 Dec 20 08:11 demo-1
    drwxr-xr-x. 1 hartan hartan   32 Dec 20 08:14 demo-2

```

Great, now there is an independent Btrfs filesystem mounted under _backup-drive_! Let’s try to take another snapshot and place it there:

```

    $ sudo btrfs subvolume snapshot demo backup-drive/demo-3
    Create a snapshot of 'demo' in 'backup-drive/demo-3'
    ERROR: cannot snapshot 'demo': Invalid cross-device link

```

What happened? Well, you tried to take a snapshot of _demo_ and store it in a different Btrfs filesystem (a different device from Btrfs’ point of view). Remember that a Btrfs subvolume only holds references to files and their contents (inodes)? This is exactly the problem: The files and contents exist in our home filesystem, but not in the newly-created _backup-drive_. You have to find a way to transfer the subvolume along with its contents to the new filesystem.

#### Storing snapshots on a different Btrfs filesystem

The Btrfs utilities include two special commands for this purpose. Let’s see how they work first:

```

    $ sudo btrfs send demo | sudo btrfs receive backup-drive/
    ERROR: subvolume /home/hartan/btrfs-snapshot-test/demo is not read-only
    ERROR: empty stream is not considered valid

```

Another error! This time it tells you that the subvolume we’re trying to transfer is not read-only. This is true: You can write new contents to all of the snapshots/subvolumes created so far. You can create read-only snapshots like this:

```

    $ sudo btrfs subvolume snapshot -r demo demo-3-ro
    Create a readonly snapshot of 'demo' in './demo-3-ro'

```

Unlike previously, here the _-r_ option is added to the _snapshot_ subcommand. This creates a read-only snapshot, which is easily verified:

```

    $ touch demo-3-ro/another-file
    touch: cannot touch 'demo-3-ro/another-file': Read-only file system

```

Now you can retry transferring the subvolumes:

```

    $ sudo btrfs send demo-3-ro | sudo btrfs receive backup-drive/
    At subvol demo-3-ro
    At subvol demo-3-ro
    $ tree

    ├── backup-drive
    │   └── demo-3-ro
    │       ├── bar
    │       ├── baz
    │       ├── bigfile
    │       └── foo
    ├── btrfs_filesystem.img
    ├── demo
    [ ... ]
    └── demo-3-ro
        ├── bar
        ├── baz
        ├── bigfile
        └── foo

    6 directories, 20 files

```

It worked! You have successfully transferred a read-only snapshot of our original subvolume _demo_ to an external Btrfs filesystem.

#### Storing snapshots on non-Btrfs filesystems

Above you have seen how you can store Btrfs subvolumes/snapshots on another Btrfs filesystem. But what can you do if you do not have another Btrfs filesystem and cannot create one, for example because the external drives need a filesystem that allows compatibility with Windows or MacOS hosts? In such cases you can store subvolumes in files:

```

    $ sudo btrfs send -f demo-3-ro-subvolume.btrfs demo-3-ro
    At subvol demo-3-ro
    $ ls -lh demo-3-ro-subvolume.btrfs
    -rw-------. 1 root root 513M Dec 21 10:39 demo-3-ro-subvolume.btrfs

```

The file _demo-3-ro-subvolume.btrfs_ now contains everything that is needed to recreate the _demo-3-ro_ subvolume at a later point in time.

#### Incrementally sending subvolumes

If you perform this action repeatedly for different subvolumes, you will notice at some point that the different subvolumes do not share their file contents any more. This is because when sending a subvolume such as above, all the data needed to recreate this standalone subvolume is transferred to the target. You can, however, instruct Btrfs to only send the difference between two subvolumes to the target! This so-called incremental send will ensure that shared references remain shared between the subvolumes. To demonstrate this, add a few more changes to our original subvolume:

```

    $ echo "a few more changes" >> demo/bigfile

```

Next create another read-only snapshot:

```

    $ sudo btrfs subvolume snapshot -r demo demo-4-ro
    Create a readonly snapshot of 'demo' in './demo-4-ro'

```

And now send it:

```

    $ sudo btrfs send -p demo-3-ro demo-4-ro | sudo btrfs receive backup-drive
    At subvol demo-4-ro
    At snapshot demo-4-ro

```

In the command above, the _-p_ option specifies a parent subvolume, against which the differences are calculated. It is important to keep in mind that both the source and target Btrfs filesystem must contain the same, unmodified parent subvolume! Ensure that the new subvolume is really there:

```

    $ ls backup-drive/
    demo-3-ro  demo-4-ro
    $ ls -lR backup-drive/demo-4-ro/
    backup-drive/demo-4-ro/:
    total 524296
    -rw-r--r--. 1 hartan hartan         0 Dec 20 08:11 bar
    -rw-r--r--. 1 hartan hartan         0 Dec 20 08:11 baz
    -rw-r--r--. 1 hartan hartan 536870945 Dec 21 10:49 bigfile
    -rw-r--r--. 1 hartan hartan        59 Dec 20 08:13 foo

```

But how do you know whether the incremental send only transferred the difference between both subvolumes? Let’s transfer the data stream to a file and see how big it is:

```

    $ sudo btrfs send -f demo-4-ro-diff.btrfs -p demo-3-ro demo-4-ro
    At subvol demo-4-ro
    $ ls -l demo-4-ro-diff.btrfs
    -rw-------. 1 root root 315 Dec 21 10:55 demo-4-ro-diff.btrfs

```

According to ls, the file is merely 315 bytes in size! This means that the incremental send only transferred the changes between the two subvolumes, along with additional Btrfs-specific metadata.

#### Restoring subvolumes from snapshots

Before continuing, let’s do some cleaning up of the things you don’t need at the moment:

```

    $ sudo rm -rf demo-4-ro-diff.btrfs demo-3-ro-subvolume.btrfs
    $ sudo btrfs subvolume delete demo-1 demo-2 demo-3-ro demo-4-ro
    $ ls -l
    total 531516
    drwxr-xr-x. 1 hartan hartan         36 Dec 21 10:50 backup-drive
    -rw-r--r--. 1 hartan hartan 8589934592 Dec 21 10:51 btrfs_filesystem.img
    drwxr-xr-x. 1 hartan hartan         32 Dec 20 08:14 demo

```

So far you have managed to create read/write and read-only snapshots of Btrfs subvolumes and send them to an external location. In order to turn this into a backup strategy, however, there has to be a way to send the subvolumes back to the original filesystem and make them writable again. For this purpose, let’s move the demo subvolume somewhere else and try to recreate it from the most recent snapshot. First: Rename the “broken” subvolume. It will be deleted once the restore was successful:

```

    $ mv demo demo-broken

```

Second: Transfer the most recent snapshot back to this filesystem:

```

    $ sudo btrfs send backup-drive/demo-4-ro | sudo btrfs receive .
    At subvol backup-drive/demo-4-ro
    At subvol demo-4-ro
    [hartan@fedora btrfs-snapshot-test]$ ls
    backup-drive  btrfs_filesystem.img  demo-4-ro  demo-broken

```

Third: Create a read-write subvolume from the snapshot:

```

    $ sudo btrfs subvolume snapshot demo-4-ro demo
    Create a snapshot of 'demo-4-ro' in './demo'
    $ ls
    backup-drive  btrfs_filesystem.img  demo  demo-4-ro  demo-broken

```

The last step is important: You cannot just rename _demo-4-ro_ to _demo_ , because it would still be a read-only subvolume! Finally you can check whether everything you need is there:

```

    $ tree demo
    demo
    ├── bar
    ├── baz
    ├── bigfile
    └── foo

    0 directories, 4 files
    $ tail -c -19 demo/bigfile
    a few more changes

```

The last command above tells you that the last 19 characters in _bigfile_ are in fact the change last performed. At this point, you may want to copy recent changes from _demo-broken_ to the new _demo_ subvolume. Since you didn’t perform any other changes, you can now delete the obsolete subvolumes:

```

    $ sudo btrfs subvolume delete demo-4-ro demo-broken
    Delete subvolume (no-commit): '/home/hartan/btrfs-snapshot-test/demo-4-ro'
    Delete subvolume (no-commit): '/home/hartan/btrfs-snapshot-test/demo-broken'

```

And that’s it! You have successfully restored the _demo_ subvolume from a snapshot that was previously stored on a different Btrfs filesystem (external media).

### Subvolumes as boundary for snapshots

In the second article of this series I mentioned that subvolumes are boundaries for snapshots, but what exactly does that mean? In simple terms, a snapshot of a subvolume will only contain the content of this particular subvolume, and none of the nested subvolumes below. Let’s have a look at this:

```

    $ sudo btrfs subvolume create demo/nested
    Create subvolume 'demo/nested'
    $ sudo chown -R $(id -u):$(id -g) demo/nested
    $ touch demo/nested/another_file

```

Let’s take a snapshot as before:

```

    $ sudo btrfs subvolume snapshot demo demo-nested
    Create a snapshot of 'demo' in './demo-nested'

```

And check out the contents:

```

    $ tree demo-nested
    demo-nested
    ├── bar
    ├── baz
    ├── bigfile
    ├── foo
    └── nested

    1 directory, 4 files

    $ tree demo
    demo
    ├── bar
    ├── baz
    ├── bigfile
    ├── foo
    └── nested
        └── another_file

    1 directory, 5 files

```

Notice that _another_file_ is missing, even though the folder _nested_ is present. This happens because _nested_ is a subvolume: The snapshot of _demo_ contains the folder (mountpoint) for the nested subvolume, but its contents aren’t present. Currently there is no way to perform snapshots recursively to include nested subvolumes. However, we can take advantage of this to exclude folders from snapshots! This is typically useful for data that you can reproduce easily, or that will rarely change. Examples include virtual machine or container images, movies, game files and more.

Before we wrap up the article, let’s remove everything we created while testing:

```

    $ sudo btrfs subvolume delete demo/nested demo demo-nested
    Delete subvolume (no-commit): '/home/hartan/btrfs-snapshot-test/demo/nested'
    Delete subvolume (no-commit): '/home/hartan/btrfs-snapshot-test/demo'
    Delete subvolume (no-commit): '/home/hartan/btrfs-snapshot-test/demo-nested'
    $ sudo umount backup-drive
    $ cd ..
    $ rm -rf btrfs-snapshot-test/

```

### Final thoughts on Btrfs-based backups

If you decide you want to use Btrfs to perform regular backups of your data, you may want to use a tool that automates this task for you. The Btrfs wiki has a list of backup tools specialized on Btrfs [[4]][4]. On this page you will also find another summary of the steps to perform Btrfs backups by hand. Personally, I have had a lot of good experiences with _btrbk_ [[5]][4] and I am using it to perform my own backups. In addition to backups, _btrbk_ can also keep a list of Btrfs snapshots locally on your PC. I use this to safeguard against accidental data deletion.

If you want to know more about performing backups using Btrfs, leave a comment below and I’ll consider writing a follow-up article that deals exclusively with this topic.

### Conclusion

This article investigated Btrfs snapshots, which are Btrfs subvolumes under the hood. You learned how to create read/write and read-only snapshots, and how this mechanism can help safeguard against data loss.

The next articles in this series will deal with:

  * Compression – Transparently saving storage space
  * Qgroups – Limiting your filesystem size
  * RAID – Replace your mdadm configuration



If there are other topics related to Btrfs that you want to know more about, have a look at the Btrfs Wiki [[2]][4] and Docs [[1]][4]. Don’t forget to check out the first two articles of this series, if you haven’t already! If you feel that there is something missing from this article series, let me know in the comments below. See you in the next article!

### Sources

[1]: <https://btrfs.readthedocs.io/en/latest/Introduction.html>
[2]: <https://btrfs.wiki.kernel.org/index.php/Main_Page>
[3]: <https://btrfs.readthedocs.io/en/latest/Subvolumes.html>
[4]: <https://btrfs.wiki.kernel.org/index.php/Incremental_Backup#Available_Backup_Tools>
[5]: <https://github.com/digint/btrbk>

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/working-with-btrfs-snapshots/

作者：[Andreas Hartmann][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hartan/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/09/working_w_btrfs_snapshots-816x345.jpg
[2]: https://unsplash.com/@helibertoarias?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/hdd?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: tmp.9WKqfTWEhI#sources
[5]: https://btrfs.readthedocs.io/en/latest/Subvolumes.html
[6]: https://fedoramagazine.org/working-with-btrfs-general-concepts/
[7]: https://fedoramagazine.org/working-with-btrfs-subvolumes/
