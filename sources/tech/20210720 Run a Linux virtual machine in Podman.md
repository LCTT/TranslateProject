[#]: subject: (Run a Linux virtual machine in Podman)
[#]: via: (https://opensource.com/article/21/7/linux-podman)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Run a Linux virtual machine in Podman
======
Use Podman Machine to create a basic Fedora CoreOS VM to use with
containers and containerized workloads.
![woman on laptop sitting at the window][1]

Fedora CoreOS is an automatically updating, minimal [rpm-ostree][2]-based operating system for running containerized workloads securely and at scale.

[Podman][3] "is a tool for managing containers and images, volumes mounted into those containers, and pods made from groups of containers. Podman is based on libpod, a library for container lifecycle management."

Magical things happen when you use [Podman Machine][4], a feature that helps you create a basic Fedora CoreOS virtual machine (VM) to use with containers and containerized workloads.

### Getting started with Podman Machine

The first step is to install Podman. If you already have the latest version of Podman installed, you can skip the step. On my Fedora 34 machine, I installed Podman with:


```
`$ sudo dnf install podman`
```

I'm using podman-3.2.2-1.fc34.x86_64.

### Initializing a Fedora CoreOS

Once Podman is installed, initialize it with:


```
❯ podman machine init vm2
Downloading VM image: fedora-coreos-34.20210626.1.0-qemu.x86_64.qcow2.xz: done  
Extracting compressed file
```

This command creates `vm2` and downloads Fedora CoreOS's qcow2 file in .xz format and extracts it.

### Listing your VMs

It's always important to know your VMs and their status, and the `list` command helps with that. The following example shows the names of all my VMs, the date they were created, and the last time they were up:


```
❯ podman machine list  
NAME                    VM TYPE         CREATED         LAST UP
podman-machine-default*  qemu           6 days ago      Currently running
vm2                     qemu            11 minutes ago  11 minutes ago
```

### Starting a VM

To start a VM, run:


```
❯ podman machine start
Waiting for VM …
```

### SSHing into the VM

You can use secure shell (SSH) to access your VM and use it to run workloads without any setup hassles:


```
❯ podman machine ssh  
Connecting to vm podman-machine-default. To close connection, use `~.` or `exit`
Fedora CoreOS 34.20210611.1.0
Tracker: <https://github.com/coreos/fedora-coreos-tracker>
Discuss: <https://discussion.fedoraproject.org/c/server/coreos/>
 
Last login: Wed Jun 23 13:23:36 2021 from 10.0.2.2
[core@localhost ~]$ uname -a
Linux localhost 5.12.9-300.fc34.x86_64 #1 SMP Thu Jun 3 13:51:40 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
[core@localhost ~]$
```

Currently, Podman only supports running one VM at a time.

### Stopping your VM

To stop a running VM, use the `stop` command:


```
❯ podman machine stop

[core@localhost ~]$ Connection to localhost closed by remote host.
Connection to localhost closed.
Error: exit status 255
```

I hope this helps you get started with Podman Machine. Give it a try, and let us know what you think in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/linux-podman

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: http://coreos.github.io/rpm-ostree/
[3]: https://github.com/containers/podman
[4]: http://docs.podman.io/en/latest/markdown/podman-machine.1.html
