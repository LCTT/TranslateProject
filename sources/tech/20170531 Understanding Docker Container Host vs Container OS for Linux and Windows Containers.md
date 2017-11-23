# Understanding Docker "Container Host" vs. "Container OS" for Linux and Windows Containers



Lets explore the relationship between the “Container Host” and the “Container OS” and how they differ between Linux and Windows containers.

#### Some Definitions:

*   Container Host: Also called the Host OS. The Host OS is the operating system on which the Docker client and Docker daemon run. In the case of Linux and non-Hyper-V containers, the Host OS shares its kernel with running Docker containers. For Hyper-V each container has its own Hyper-V kernel.

*   Container OS: Also called the Base OS. The base OS refers to an image that contains an operating system such as Ubuntu, CentOS, or windowsservercore. Typically, you would build your own image on top of a Base OS image so that you can take utilize parts of the OS. Note that windows containers require a Base OS, while Linux containers do not.

*   Operating System Kernel: The Kernel manages lower level functions such as memory management, file system, network and process scheduling.

#### Now for some pictures:

![Linux Containers](http://floydhilton.com/images/2017/03/2017-03-31_14_50_13-Radom%20Learnings,%20Online%20Whiteboard%20for%20Visual%20Collaboration.png)

In the above example

*   The Host OS is Ubuntu.

*   The Docker Client and the Docker Daemon (together called the Docker Engine) are running on the Host OS.

*   Each container shares the Host OS kernel.

*   CentOS and BusyBox are Linux Base OS images.

*   The “No OS” container demonstrates that you do not NEED a base OS to run a container in Linux. You can create a Docker file that has a base image of [scratch][1]and then runs a binary that uses the kernel directly.

*   Check out [this][2] article for a comparison of Base OS sizes.

![Windows Containers - Non Hyper-V](http://floydhilton.com/images/2017/03/2017-03-31_15_04_03-Radom%20Learnings,%20Online%20Whiteboard%20for%20Visual%20Collaboration.png)

In the above example

*   The Host OS is Windows 10 or Windows Server.

*   Each container shares the Host OS kernel.

*   All windows containers require a Base OS of either [nanoserver][3] or [windowsservercore][4].

![Windows Containers - Hyper-V](http://floydhilton.com/images/2017/03/2017-03-31_15_41_31-Radom%20Learnings,%20Online%20Whiteboard%20for%20Visual%20Collaboration.png)

In the above example

*   The Host OS is Windows 10 or Windows Server.

*   Each container is hosted in its own light weight Hyper-V VM.

*   Each container uses the kernel inside the Hyper-V VM which provides an extra layer of separation between containers.

*   All windows containers require a Base OS of either [nanoserver][5] or [windowsservercore][6].

A couple of good links:

*   [About windows containers][7]

*   [Deep dive into the implementation Windows Containers including multiple User Modes and “copy-on-write” to save resources][8]

*   [How Linux containers save resources by using “copy-on-write”][9]

--------------------------------------------------------------------------------

via: http://floydhilton.com/docker/2017/03/31/Docker-ContainerHost-vs-ContainerOS-Linux-Windows.html

作者：[Floyd Hilton ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://floydhilton.com/about/
[1]:https://hub.docker.com/_/scratch/
[2]:https://www.brianchristner.io/docker-image-base-os-size-comparison/
[3]:https://hub.docker.com/r/microsoft/nanoserver/
[4]:https://hub.docker.com/r/microsoft/windowsservercore/
[5]:https://hub.docker.com/r/microsoft/nanoserver/
[6]:https://hub.docker.com/r/microsoft/windowsservercore/
[7]:https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/
[8]:http://blog.xebia.com/deep-dive-into-windows-server-containers-and-docker-part-2-underlying-implementation-of-windows-server-containers/
[9]:https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/#the-copy-on-write-strategy
