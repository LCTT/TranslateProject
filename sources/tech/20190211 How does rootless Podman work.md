[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How does rootless Podman work?)
[#]: via: (https://opensource.com/article/19/2/how-does-rootless-podman-work)
[#]: author: (Daniel J Walsh https://opensource.com/users/rhatdan)

How does rootless Podman work?
======
Learn how Podman takes advantage of user namespaces to run in rootless mode. 
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82)

In my [previous article][1] on user namespace and [Podman][2], I discussed how you can use Podman commands to launch different containers with different user namespaces giving you better separation between containers. Podman also takes advantage of user namespaces to be able to run in rootless mode. Basically, when a non-privileged user runs Podman, the tool sets up and joins a user namespace. After Podman becomes root inside of the user namespace, Podman is allowed to mount certain filesystems and set up the container. Note there is no privilege escalation here other then additional UIDs available to the user, explained below.

### How does Podman create the user namespace?

#### shadow-utils

Most current Linux distributions include a version of shadow-utils that uses the **/etc/subuid** and **/etc/subgid** files to determine what UIDs and GIDs are available for a user in a user namespace.

```
$ cat /etc/subuid
dwalsh:100000:65536
test:165536:65536
$ cat /etc/subgid
dwalsh:100000:65536
test:165536:65536
```

The useradd program automatically allocates 65536 UIDs for each user added to the system. If you have existing users on a system, you would need to allocate the UIDs yourself. The format of these files is **username:STARTUID:TOTALUIDS**. Meaning in my case, dwalsh is allocated UIDs 100000 through 165535 along with my default UID, which happens to be 3265 defined in /etc/passwd. You need to be careful when allocating these UID ranges that they don't overlap with any **real** UID on the system. If you had a user listed as UID 100001, now I (dwalsh) would be able to become this UID and potentially read/write/execute files owned by the UID.

Shadow-utils also adds two setuid programs (or setfilecap). On Fedora I have:

```
$ getcap /usr/bin/newuidmap
/usr/bin/newuidmap = cap_setuid+ep
$ getcap /usr/bin/newgidmap
/usr/bin/newgidmap = cap_setgid+ep
```

Podman executes these files to set up the user namespace. You can see the mappings by examining /proc/self/uid_map and /proc/self/gid_map from inside of the rootless container.

```
$ podman run alpine cat /proc/self/uid_map /proc/self/gid_map
        0       3267            1
        1       100000          65536
        0       3267            1
        1       100000          65536
```

As seen above, Podman defaults to mapping root in the container to your current UID (3267) and then maps ranges of allocated UIDs/GIDs in /etc/subuid and /etc/subgid starting at 1. Meaning in my example, UID=1 in the container is UID 100000, UID=2 is UID 100001, all the way up to 65536, which is 165535.

Any item from outside of the user namespace that is owned by a UID or GID that is not mapped into the user namespace appears to belong to the user configured in the **kernel.overflowuid** sysctl, which by default is 35534, which my /etc/passwd file says has the name **nobody**. Since your process can't run as an ID that isn't mapped, the owner and group permissions don't apply, so you can only access these files based on their "other" permissions. This includes all files owned by **real** root on the system running the container, since root is not mapped into the user namespace.

The [Buildah][3] command has a cool feature, [**buildah unshare**][4]. This puts you in the same user namespace that Podman runs in, but without entering the container's filesystem, so you can list the contents of your home directory.

```
$ ls -ild /home/dwalsh
8193 drwx--x--x. 290 dwalsh dwalsh 20480 Jan 29 07:58 /home/dwalsh
$ buildah unshare ls -ld /home/dwalsh
drwx--x--x. 290 root root 20480 Jan 29 07:58 /home/dwalsh
```

Notice that when listing the home dir attributes outside the user namespace, the kernel reports the ownership as dwalsh, while inside the user namespace it reports the directory as owned by root. This is because the home directory is owned by 3267, and inside the user namespace we are treating that UID as root.

### What happens next in Podman after the user namespace is set up?

Podman uses [containers/storage][5] to pull the container image, and containers/storage is smart enough to map all files owned by root in the image to the root of the user namespace, and any other files owned by different UIDs to their user namespace UIDs. By default, this content gets written to ~/.local/share/containers/storage. Container storage works in rootless mode with either the vfs mode or with Overlay. Note: Overlay is supported only if the [fuse-overlayfs][6] executable is installed.

The kernel only allows user namespace root to mount certain types of filesystems; at this time it allows mounting of procfs, sysfs, tmpfs, fusefs, and bind mounts (as long as the source and destination are owned by the user running Podman. OverlayFS is not supported yet, although the kernel teams are working on allowing it).

Podman then mounts the container's storage if it is using fuse-overlayfs; if the storage driver is using vfs, then no mounting is required. Podman on vfs requires a lot of space though, since each container copies the entire underlying filesystem.

Podman then mounts /proc and /sys along with a few tmpfs and creates the devices in the container.

In order to use networking other than the host networking, Podman uses the [slirp4netns][7] program to set up **User mode networking for unprivileged network namespace**. Slirp4netns allows Podman to expose ports within the container to the host. Note that the kernel still will not allow a non-privileged process to bind to ports less than 1024. Podman-1.1 or later is required for binding to ports.

Rootless Podman can use user namespace for container separation, but you only have access to the UIDs defined in the /etc/subuid file.

### Conclusion

The Podman tool is enabling people to build and use containers without sacrificing the security of the system; you can give your developers the access they need without giving them root.

And when you put your containers into production, you can take advantage of the extra security provided by the user namespace to keep the workloads isolated from each other.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/how-does-rootless-podman-work

作者：[Daniel J Walsh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rhatdan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/podman-and-user-namespaces
[2]: https://podman.io/
[3]: https://buildah.io/
[4]: https://github.com/containers/buildah/blob/master/docs/buildah-unshare.md
[5]: https://github.com/containers/storage
[6]: https://github.com/containers/fuse-overlayfs
[7]: https://github.com/rootless-containers/slirp4netns
