[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How containers work: overlayfs)
[#]: via: (https://jvns.ca/blog/2019/11/18/how-containers-work--overlayfs/)
[#]: author: (Julia Evans https://jvns.ca/)

How containers work: overlayfs
======

I wrote a comic about overlay filesystems for a potential future container [zine][1] this morning, and then I got excited about the topic and wanted to write a blog post with more details. Here’s the comic, to start out:

<https://jvns.ca/images/overlay.jpeg>

### container images are big

Container images can be pretty big (though some are really small, like [alpine linux is 2.5MB][2]). Ubuntu 16.04 is about 27MB, and [the Anaconda Python distribution is 800MB to 1.5GB][3].

Every container you start with an image starts out with the same blank slate, as if it made a copy of the image just for that container to use. But for big container images, like that 800MB Anaconda image, making a copy would be both a waste of disk space and pretty slow. So Docker doesn’t make copies – instead it uses an **overlay**.

### how overlays work

Overlay filesystems, also known as “union filesystems” or “union mounts” let you mount a filesystem using 2 directories: a “lower” directory, and an “upper” directory.

Basically:

  * the **lower** directory of the filesystem is read-only
  * the **upper** directory of the filesystem can be both read to and written from



When a process **reads** a file, the overlayfs filesystem driver looks in the upper directory and reads the file from there if it’s present. Otherwise, it looks in the lower directory.

When a process **writes** a file, overlayfs will just write it to the upper directory.

### let’s make an overlay with `mount`!

That was all a little abstract, so let’s make an overlay filesystem and try it out! This is just going to have a few files in it: I’ll make upper and lower directories, and a `merged` directory to mount the combined filesystem into:

```
$ mkdir upper lower merged work
$ echo "I'm from lower!" > lower/in_lower.txt
$ echo "I'm from upper!" > upper/in_upper.txt
$ # `in_both` is in both directories
$ echo "I'm from lower!" > lower/in_both.txt
$ echo "I'm from upper!" > upper/in_both.txt
```

Combining the upper and lower directories is pretty easy: we can just do it with `mount!`

```
$ sudo mount -t overlay overlay
    -o lowerdir=/home/bork/test/lower,upperdir=/home/bork/test/upper,workdir=/home/bork/test/work
    /home/bork/test/merged
```

There’s was an extremely annoying error message I kept getting while doing this, that said `mount: /home/bork/test/merged: special device overlay does not exist.`. This message is a lie, and actually just means that one of the directories I specified was missing (I’d written `~/test/merged` but it wasn’t being expanded).

Okay, let’s try to read one of the files from the overlay filesystem! The file `in_both.txt` exists in both `lower/` and `upper/`, so it should read the file from the `upper/` directory.

```
$ cat merged/in_both.txt
"I'm from upper!
```

It worked!

And the contents of our directories are what we’d expect:

```
find lower/ upper/ merged/
lower/
lower/in_lower.txt
lower/in_both.txt
upper/
upper/in_upper.txt
upper/in_both.txt
merged/
merged/in_lower.txt
merged/in_both.txt
merged/in_upper.txt
```

### what happens when you create a new file?

```
$ echo 'new file' > merged/new_file
$ ls -l */new_file
-rw-r--r-- 1 bork bork 9 Nov 18 14:24 merged/new_file
-rw-r--r-- 1 bork bork 9 Nov 18 14:24 upper/new_file
```

That makes sense, the new file gets created in the `upper` directory.

### what happens when you delete a file?

Reads and writes seem pretty straightforward. But what happens with deletes? Let’s do it!

```
$ rm merged/in_both.txt
```

What happened? Let’s look with `ls`:

```
ls -l upper/in_both.txt  lower/lower1.txt  merged/lower1.txt
ls: cannot access 'merged/in_both.txt': No such file or directory
-rw-r--r-- 1 bork bork    6 Nov 18 14:09 lower/in_both.txt
c--------- 1 root root 0, 0 Nov 18 14:19 upper/in_both.txt
```

So:

  * `in_both.txt` is still in the `lower` directory, and it’s unchanged
  * it’s not in the `merged` directory. So far this is all what we expected.
  * But what happened in `upper` is a little strange: there’s a file called `upper/in_both.txt`, but it’s a… character device? I guess this is how the overlayfs driver represents a file being deleted.



What happens if we try to copy this weird character device file?

```
$ sudo cp upper/in_both.txt upper/in_lower.txt
cp: cannot open 'upper/in_both.txt' for reading: No such device or address
```

Okay, that seems reasonable, being able to copy this weird deletion signal file doesn’t really make sense.

### you can mount multiple “lower” directories

Docker images are often composed of like 25 “layers”. Overlayfs supports having multiple lower directories, so you can run

```
mount -t overlay overlay
      -o lowerdir:/dir1:/dir2:/dir3:...:/dir25,upperdir=...
```

So I assume that’s how containers with many Docker layers work, it just unpacks each layer into a separate directory and then asks overlayfs to combine them all together together with an empty upper directory that the container will write its changes to it.

### docker can also use btrfs snapshots

Right now I’m using ext4, and Docker uses overlayfs snapshots to run containers. But I used to use btrfs, and then Docker would use btrfs copy-on-write snapshots instead. (Here’s a list of when Docker uses which [storage drivers][4])

Using btrfs snapshots this way had some interesting consequences – at some point last year I was running hundreds of short-lived Docker containers on my laptop, and this resulted in me running out of btrfs metadata space (like [this person][5]). This was really confusing because I’d never heard of btrfs metadata before and it was tricky to figure out how to clean up my filesystem so I could run Docker containers again. ([this docker github issue][6] describes a similar problem with Docker and btrfs)

### it’s fun to try out container features in a simple way!

I think containers often seem like they’re doing “complicated” things and I think it’s fun to break them down like this – you can just run one `mount` incantation without actually doing anything else related to containers at all and see how overlays work!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/11/18/how-containers-work--overlayfs/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com
[2]: https://hub.docker.com/_/alpine?tab=tags
[3]: https://hub.docker.com/r/continuumio/anaconda3/tags
[4]: https://docs.docker.com/storage/storagedriver/select-storage-driver/
[5]: https://www.reddit.com/r/archlinux/comments/5jrmfe/btrfs_metadata_and_docker/
[6]: https://github.com/moby/moby/issues/27653
