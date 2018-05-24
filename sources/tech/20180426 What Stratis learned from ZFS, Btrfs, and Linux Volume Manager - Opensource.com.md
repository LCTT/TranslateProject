What Stratis learned from ZFS, Btrfs, and Linux Volume Manager | Opensource.com
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-windows-building-containers.png?itok=0XvZLZ8k)

As discussed in [Part 1][1] of this series, Stratis is a volume-managing filesystem (VMF) with functionality similar to [ZFS][2] and [Btrfs][3]. In designing Stratis, we studied the choices that developers of existing solutions made.

### Why not adopt an existing solution?

The reasons vary. First, let's consider [ZFS][2]. Originally developed by Sun Microsystems for Solaris (now owned by Oracle), ZFS has been ported to Linux. However, its [CDDL][4]-licensed code cannot be merged into the [GPL][5]-licensed Linux source tree. Whether CDDL and GPLv2 are truly incompatible is a subject for debate, but the uncertainty is enough to make enterprise Linux vendors unwilling to adopt and support it.

[Btrfs][3] is also well-established and has no licensing issues. For years it was the "Chosen One" for many users, but it just hasn't yet gotten to where it needs to be in terms of stability and features.

So, fuelled by a desire to improve the status quo and frustration with existing options, Stratis was conceived.

### How Stratis is different

One thing that ZFS and Btrfs have clearly shown is that writing a VMF as an in-kernel filesystem takes a tremendous amount of work and time to work out the bugs and stabilize. It's essential to get right when it comes to precious data. Starting from scratch and taking the same approach with Stratis would probably take a decade as well, which was not acceptable.

Instead, Stratis chose to use some of the Linux kernel's other existing capabilities: The [device mapper][6] subsystem, which is most notably used by LVM to provide RAID, thin-provisioning, and other features on top of block devices; and the well-tested and high-performance [XFS][7] filesystem. Stratis builds its pool using layers of existing technology, with the goal of managing them to appear as a seamless whole to the user.

### What Stratis learned from ZFS

For many users, ZFS set the expectations for what a next-generation filesystem should be. Reading comments online from people talking about ZFS helped set Stratis's initial development goals. ZFS's design also implicitly highlighted things to avoid. For example, ZFS requires an "import" step when attaching a pool created on another system. There are a few reasons for this, and each reason was likely an issue that Stratis had to solve, either by taking the same approach or a different one.

One thing we didn't like about ZFS was that it has some restrictions on adding new hard drives or replacing existing drives with bigger ones, especially if the pool is configured for redundancy. Of course, there is a reason for this, but we thought it was an area we could improve.

Finally, using ZFS's tools at the command line, once learned, is a good experience. We wanted to have that same feeling with Stratis's command-line tool, and we also liked the tool's tendency to use positional parameters and limit the amount of typing required for each command.

### What Stratis learned from Btrfs

One thing we liked about Btrfs was the single command-line tool, with positional subcommands. Btrfs also treats redundancy (Btrfs profiles) as a property of the pool, which seems easier to understand than ZFS's approach and allows drives to be added and even removed.

Finally, looking at the features that both ZFS and Btrfs offer, such as snapshot implementations and send/receive support, helped determine which features Stratis should include.

### What Stratis learned from LVM

From the early design stages of Stratis, we studied LVM extensively. LVM is currently the most significant user of the Linux device mapper (DM) subsystem—in fact, DM is maintained by the LVM core team. We examined it both from the possibility of actually using LVM as a layer of Stratis and an example of using DM, which Stratis could do directly with LVM as a peer. We looked at LVM's on-disk metadata format (along with ZFS's and XFS's) for inspiration in defining Stratis's on-disk metadata format.

Among the listed projects, LVM shares the most in common with Stratis internally, because they both use DM. However, from a usage standpoint, LVM is much more transparent about its inner workings. This gives expert users a great deal of control and options for precisely configuring the volume group (pool) layout in a way that Stratis doesn't.

### A diversity of solutions

One great thing about working on free software and open source is that there are no irreplaceable components. Every part—even the kernel—is open for view, modification, and even replacement if the current software isn't meeting users' needs. A new project doesn't need to end an existing one if there is enough support for both to be sustained in parallel.

Stratis is an attempt to better meet some users' needs for local storage management—those looking for a no-hassle, easy-to-use, powerful solution. This means making design choices that might not be right for all users. Alternatives make tough choices possible since users have other options. All users ultimately benefit from their ability to use whichever tool works best for them.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/stratis-lessons-learned

作者：[Andy Grover][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/agrover
[1]:https://opensource.com/article/18/4/stratis-easy-use-local-storage-management-linux
[2]:https://en.wikipedia.org/wiki/ZFS
[3]:https://en.wikipedia.org/wiki/Btrfs
[4]:https://en.wikipedia.org/wiki/Common_Development_and_Distribution_License
[5]:https://en.wikipedia.org/wiki/GNU_General_Public_License
[6]:https://en.wikipedia.org/wiki/Device_mapper
[7]:https://en.wikipedia.org/wiki/XFS
