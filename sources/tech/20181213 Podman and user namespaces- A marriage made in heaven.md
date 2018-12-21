[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Podman and user namespaces: A marriage made in heaven)
[#]: via: (https://opensource.com/article/18/12/podman-and-user-namespaces)
[#]: author: (Daniel J Walsh https://opensource.com/users/rhatdan)

Podman and user namespaces: A marriage made in heaven
======
Learn how to use Podman to run containers in separate user namespaces.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/architecture_structure_planning_design_.png?itok=KL7dIDct)

[Podman][1], part of the [libpod][2] library, enables users to manage pods, containers, and container images. In my last article, I wrote about [Podman as a more secure way to run containers][3]. Here, I'll explain how to use Podman to run containers in separate user namespaces.

I have always thought of [user namespace][4], primarily developed by Red Hat's Eric Biederman, as a great feature for separating containers. User namespace allows you to specify a user identifier (UID) and group identifier (GID) mapping to run your containers. This means you can run as UID 0 inside the container and UID 100000 outside the container. If your container processes escape the container, the kernel will treat them as UID 100000. Not only that, but any file object owned by a UID that isn't mapped into the user namespace will be treated as owned by "nobody" (65534, kernel.overflowuid), and the container process will not be allowed access unless the object is accessible by "other" (world readable/writable).

If you have a file owned by "real" root with permissions [660][5], and the container processes in the user namespace attempt to read it, they will be prevented from accessing it and will see the file as owned by nobody.

### An example

Here's how that might work. First, I create a file in my system owned by root.

```
$ sudo bash -c "echo Test > /tmp/test"
$ sudo chmod 600 /tmp/test
$ sudo ls -l /tmp/test
-rw-------. 1 root root 5 Dec 17 16:40 /tmp/test
```

Next, I volume-mount the file into a container running with a user namespace map 0:100000:5000.

```
$ sudo podman run -ti -v /tmp/test:/tmp/test:Z --uidmap 0:100000:5000 fedora sh
# id
uid=0(root) gid=0(root) groups=0(root)
# ls -l /tmp/test
-rw-rw----. 1 nobody nobody 8 Nov 30 12:40 /tmp/test
# cat /tmp/test
cat: /tmp/test: Permission denied
```

The **\--uidmap** setting above tells Podman to map a range of 5000 UIDs inside the container, starting with UID 100000 outside the container (so the range is 100000-104999) to a range starting at UID 0 inside the container (so the range is 0-4999). Inside the container, if my process is running as UID 1, it is 100001 on the host

Since the real UID=0 is not mapped into the container, any file owned by root will be treated as owned by nobody. Even if the process inside the container has **CAP_DAC_OVERRIDE** , it can't override this protection. **DAC_OVERRIDE** enables root processes to read/write any file on the system, even if the process was not owned by root or world readable or writable.

User namespace capabilities are not the same as capabilities on the host. They are namespaced capabilities. This means my container root has capabilities only within the container—really only across the range of UIDs that were mapped into the user namespace. If a container process escaped the container, it wouldn't have any capabilities over UIDs not mapped into the user namespace, including UID=0. Even if the processes could somehow enter another container, they would not have those capabilities if the container uses a different range of UIDs.

Note that SELinux and other technologies also limit what would happen if a container process broke out of the container.

### Using `podman top` to show user namespaces

We have added features to **podman top** to allow you to examine the usernames of processes running inside a container and identify their real UIDs on the host.

Let's start by running a sleep container using our UID mapping.

```
$ sudo podman run --uidmap 0:100000:5000 -d fedora sleep 1000
```

Now run **podman top** :

```
$ sudo podman top --latest user huser
USER   HUSER
root   100000

$ ps -ef | grep sleep
100000   21821 21809  0 08:04 ?         00:00:00 /usr/bin/coreutils --coreutils-prog-shebang=sleep /usr/bin/sleep 1000
```

Notice **podman top** reports that the user process is running as root inside the container but as UID 100000 on the host (HUSER). Also the **ps** command confirms that the sleep process is running as UID 100000.

Now let's run a second container, but this time we will choose a separate UID map starting at 200000.

```
$ sudo podman run --uidmap 0:200000:5000 -d fedora sleep 1000
$ sudo podman top --latest user huser
USER   HUSER
root   200000

$ ps -ef | grep sleep
100000   21821 21809  0 08:04 ?         00:00:00 /usr/bin/coreutils --coreutils-prog-shebang=sleep /usr/bin/sleep 1000
200000   23644 23632  1 08:08 ?         00:00:00 /usr/bin/coreutils --coreutils-prog-shebang=sleep /usr/bin/sleep 1000
```

Notice that **podman top** reports the second container is running as root inside the container but as UID=200000 on the host.

Also look at the **ps** command—it shows both sleep processes running: one as 100000 and the other as 200000.

This means running the containers inside separate user namespaces gives you traditional UID separation between processes, which has been the standard security tool of Linux/Unix from the beginning.

### Problems with user namespaces

For several years, I've advocated user namespace as the security tool everyone wants but hardly anyone has used. The reason is there hasn't been any filesystem support or a shifting file system.

In containers, you want to share the **base** image between lots of containers. The examples above use the Fedora base image in each example. Most of the files in the Fedora image are owned by real UID=0. If I run a container on this image with the user namespace 0:100000:5000, by default it sees all of these files as owned by nobody, so we need to shift all of these UIDs to match the user namespace. For years, I've wanted a mount option to tell the kernel to remap these file UIDs to match the user namespace. Upstream kernel storage developers continue to investigate and make progress on this feature, but it is a difficult problem.


Podman can use different user namespaces on the same image because of automatic [chowning][6] built into [containers/storage][7] by a team led by Nalin Dahyabhai. Podman uses containers/storage, and the first time Podman uses a container image in a new user namespace, container/storage "chowns" (i.e., changes ownership for) all files in the image to the UIDs mapped in the user namespace and creates a new image. Think of this as the **fedora:0:100000:5000** image.

When Podman runs another container on the image with the same UID mappings, it uses the "pre-chowned" image. When I run the second container on 0:200000:5000, containers/storage creates a second image, let's call it **fedora:0:200000:5000**.

Note if you are doing a **podman build** or **podman commit** and push the newly created image to a container registry, Podman will use container/storage to reverse the shift and push the image with all files chowned back to real UID=0.

This can cause a real slowdown in creating containers in new UID mappings since the **chown** can be slow depending on the number of files in the image. Also, on a normal [OverlayFS][8], every file in the image gets copied up. The normal Fedora image can take up to 30 seconds to finish the chown and start the container.

Luckily, the Red Hat kernel storage team, primarily Vivek Goyal and Miklos Szeredi, added a new feature to OverlayFS in kernel 4.19. The feature is called **metadata only copy-up**. If you mount an overlay filesystem with **metacopy=on** as a mount option, it will not copy up the contents of the lower layers when you change file attributes; the kernel creates new inodes that include the attributes with references pointing at the lower-level data. It will still copy up the contents if the content changes. This functionality is available in the Red Hat Enterprise Linux 8 Beta, if you want to try it out.

This means container chowning can happen in a couple of seconds, and you won't double the storage space for each container.

This makes running containers with tools like Podman in separate user namespaces viable, greatly increasing the security of the system.

### Going forward

I want to add a new flag, like **\--userns=auto** , to Podman that will tell it to automatically pick a unique user namespace for each container you run. This is similar to the way SELinux works with separate multi-category security (MCS) labels. If you set the environment variable **PODMAN_USERNS=auto** , you won't even need to set the flag.

Podman is finally allowing users to run containers in separate user namespaces. Tools like [Buildah][9] and [CRI-O][10] will also be able to take advantage of user namespaces. For CRI-O, however, Kubernetes needs to understand which user namespace will run the container engine, and the upstream is working on that.

In my next article, I will explain how to run Podman as non-root in a user namespace.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/podman-and-user-namespaces

作者：[Daniel J Walsh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rhatdan
[b]: https://github.com/lujun9972
[1]: https://podman.io/
[2]: https://github.com/containers/libpod
[3]: https://opensource.com/article/18/10/podman-more-secure-way-run-containers
[4]: http://man7.org/linux/man-pages/man7/user_namespaces.7.html
[5]: https://chmodcommand.com/chmod-660/
[6]: https://en.wikipedia.org/wiki/Chown
[7]: https://github.com/containers/storage
[8]: https://en.wikipedia.org/wiki/OverlayFS
[9]: https://buildah.io/
[10]: http://cri-o.io/
