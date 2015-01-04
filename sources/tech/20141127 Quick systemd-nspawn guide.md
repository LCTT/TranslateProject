SPccman...................
Quick systemd-nspawn guide
================================================================================
I switched to using systemd-nspawn in place of chroot and wanted to give a quick guide to using it. The short version is that I’d strongly recommend that anybody running systemd that uses chroot switch over - there really are no downsides as long as your kernel is properly configured.

Chroot should be no stranger to anybody who works on distros, and I suspect that the majority of Gentoo users have need for it from time to time.

### The Challenges of chroot ###

For most interactive uses it isn’t sufficient to just run chroot. Usually you need to mount /proc, /sys, and bind mount /dev so that you don’t have issues like missing ptys, etc. If you use tmpfs you might also want to mount the new tmp, var/tmp as tmpfs. Then you might want to make other bind mounts into the chroot. None of this is particularly difficult, but you usually end up writing a small script to manage it.

Now, I routinely do full backups, and usually that involves excluding stuff like tmp dirs, and anything resembling a bind mount. When I set up a new chroot that means updating my backup config, which I usually forget to do since most of the time the chroot mounts aren’t running anyway. Then when I do leave it mounted overnight I end up with backups consuming lots of extra space (bind mounts of large trees).

Finally, systemd now by default handles bind mounts a little differently when they contain other mount points (such as when using -rbind). Apparently unmounting something in the bind mount will cause systemd to unmount the corresponding directory on the other side of the bind. Imagine my surprise when I unmounted my chroot bind to /dev and discovered /dev/pts and /dev/shm no longer mounted on the host. It looks like there are ways to change that, but this isn’t the point of my post (it just spurred me to find another way).

### Systemd-nspawn’s Advantages ###

Systemd-nspawn is a tool that launches a container, and it can operate just like chroot in its simplest form. By default it automatically sets up most of the overhead like /dev, /tmp, etc. With a few options it can also set up other bind mounts as well. When the container exits all the mounts are cleaned up.

From the outside of the container nothing appears different when the container is running. In fact, you could spawn 5 different systemd-nspawn container instances from the same chroot and they wouldn’t have any interaction except via the filesystem (and that excludes /dev, /tmp, and so on - only changes in /usr, /etc will propagate across). Your backup won’t see the bind mounts, or tmpfs, or anything else mounted within the container.

The container also has all those other nifty container benefits like containment - a killall inside the container won’t touch anything outside, and so on. The security isn’t airtight - the intent is to prevent accidental mistakes.  

Then, if you use a compatible sysvinit (which includes systemd, and I think recent versions of openrc), you can actually boot the container, which drops you to a getty inside. That means you can use fstab to do additional mounts inside the container, run daemons, and so on. You get almost all the benefits of virtualization for the cost of a chroot (no need to build a kernel, and so on). It is a bit odd to be running systemctl poweroff inside what looks just like a chroot, but it works.

Note that unless you do a bit more setup you will share the same network interface with the host, so no running sshd on the container if you have it on the host, etc. I won’t get into this but it shouldn’t be hard to run a separate network namespace and bind the interfaces so that the new instance can run dhcp.

### How to do it ###

So, getting it actually working will likely be the shortest bit in this post.

You need support for namespaces and multiple devpts instances in your kernel:

    CONFIG_UTS_NS=y
    CONFIG_IPC_NS=y
    CONFIG_USER_NS=y
    CONFIG_PID_NS=y
    CONFIG_NET_NS=y
    CONFIG_DEVPTS_MULTIPLE_INSTANCES=y

From there launching a namespace just like a chroot is really simple:

    systemd-nspawn -D .

That’s it - you can exit from it just like a chroot. From inside you can run mount and see that it has taken care of /dev and /tmp for you. The “.” is the path to the chroot, which I assume is the current directory. With nothing further it runs bash inside.

If you want to add some bind mounts it is easy:

    systemd-nspawn -D . --bind /usr/portage

Now your /usr/portage is bound to your host, so no need to sync/etc. If you want to bind to a different destination add a “:dest” after the source, relative to the root of the chroot (so --bind foo is the same as --bind foo:foo).

If the container has a functional init that can handle being run inside, you can add a -b to boot it:

    systemd-nspawn -D . --bind /usr/portage -b

Watch the init do its job. Shut down the container to exit.

Now, if that container is running systemd you can direct its journal to the host journal with -h:

    systemd-nspawn -D . --bind /usr/portage -j -b

Now, nspawn registers the container so that it shows up in machinectl. That makes it easy to launch a new getty on it, or ssh to it (if it is running ssh - see my note above about network namespaces), or power it off from the host.

That’s it. If you’re running systemd I’d suggest ditching chroot almost entirely in favor of nspawn.

--------------------------------------------------------------------------------

via: http://rich0gentoo.wordpress.com/2014/07/14/quick-systemd-nspawn-guide/

作者：[rich0][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://rich0gentoo.wordpress.com/
