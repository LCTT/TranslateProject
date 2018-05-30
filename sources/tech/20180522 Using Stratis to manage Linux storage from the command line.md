translating----geekpi

Using Stratis to manage Linux storage from the command line
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)

As discussed in [Part 1][1] and [Part 2][2] of this series, Stratis is a volume-managing filesystem with functionality similar to that of [ZFS][3] and [Btrfs][4]. In this article, we'll walk through how to use Stratis on the command line.

### Getting Stratis

For non-developers, the easiest way to try Stratis now is in [Fedora 28][5].

Once you're running this, you can install the Stratis daemon and the Stratis command-line tool with:
```
# dnf install stratis-cli stratisd

```

### Creating a pool

Stratis has three concepts: blockdevs, pools, and filesystems. Blockdevs are the block devices, such as a disk or a disk partition, that make up a pool. Once a pool is created, filesystems can be created from it.

Assuming you have a block device called `vdg` on your system that is not currently in use or mounted, you can create a Stratis pool on it with:
```
# stratis pool create mypool /dev/vdg

```

This assumes `vdg` is completely zeroed and empty. If it is not in use but has old data on it, it may be necessary to use `pool create`'s `- force` option. If it is in use, don't use it for Stratis.

If you want to create a pool from more than one block device, just list them all on the `pool create` command line. You can also add more blockdevs later using the `blockdev add-data` command. Note that Stratis requires blockdevs to be at least 1 GiB in size.

### Creating filesystems

Once you've created a pool called `mypool`, you can create filesystems from it:
```
# stratis fs create mypool myfs1

```

After creating a filesystem called `myfs1` from pool `mypool`, you can mount and use it, using the entries Stratis has created within /dev/stratis:
```
# mkdir myfs1

# mount /dev/stratis/mypool/myfs1 myfs1

```

The filesystem is now mounted on `myfs1` and ready to use.

### Snapshots

In addition to creating empty filesystems, you can also create a filesystem as a snapshot of an existing filesystem:
```
# stratis fs snapshot mypool myfs1 myfs1-experiment

```

After doing so, you could mount the new `myfs1-experiment`, which will initially contain the same file contents as `myfs1`, but could change as the filesystem is modified. Whatever changes you made to `myfs1-experiment` would not be reflected in `myfs1` unless you unmounted `myfs1` and destroyed it with:
```
# umount myfs1

# stratis fs destroy mypool myfs1

```

and then snapshotted the snapshot to recreate it and remounted it:
```
# stratis fs snapshot mypool myfs1-experiment myfs1

# mount /dev/stratis/mypool/myfs1 myfs1

```

### Getting information

Stratis can list pools on the system:
```
# stratis pool list

```

As filesystems have more data written to them, you will see the "Total Physical Used" value increase. Be careful when this approaches "Total Physical Size"; we're still working on handling this correctly.

To list filesystems within a pool:
```
# stratis fs list mypool

```

To list the blockdevs that make up a pool:
```
# stratis blockdev list mypool

```

These give only minimal information currently, but they will provide more in the future.

#### Destroying a pool

Once you have an idea of what Stratis can do, to destroy the pool, first make sure all filesystems created from it are unmounted and destroyed, then use the `pool destroy` command:
```
# umount myfs1

# umount myfs1-experiment (if you created it)

# stratis fs destroy mypool myfs1

# stratis fs destroy mypool myfs1-experiment

# stratis pool destroy mypool

```

`stratis pool list` should now show no pools.

That's it! For more information, please see the manpage: `man stratis`.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/stratis-storage-linux-command-line

作者：[Andy Grover][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/agrover
[1]:https://opensource.com/article/18/4/stratis-easy-use-local-storage-management-linux
[2]:https://opensource.com/article/18/4/stratis-lessons-learned
[3]:https://en.wikipedia.org/wiki/ZFS
[4]:https://en.wikipedia.org/wiki/Btrfs
[5]:https://fedoraproject.org/wiki/Releases/28/Schedule
