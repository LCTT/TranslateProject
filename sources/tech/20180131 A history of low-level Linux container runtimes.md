A history of low-level Linux container runtimes
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/running-containers-two-ship-container-beach.png?itok=wr4zJC6p)

At Red Hat we like to say, "Containers are Linux--Linux is Containers." Here is what this means. Traditional containers are processes on a system that usually have the following three characteristics:

### 1\. Resource constraints

When you run lots of containers on a system, you do not want to have any container monopolize the operating system, so we use resource constraints to control things like CPU, memory, network bandwidth, etc. The Linux kernel provides the cgroups feature, which can be configured to control the container process resources.

### 2\. Security constraints

Usually, you do not want your containers being able to attack each other or attack the host system. We take advantage of several features of the Linux kernel to set up security separation, such as SELinux, seccomp, capabilities, etc.

### 3\. Virtual separation

Container processes should not have a view of any processes outside the container. They should be on their own network. Container processes need to be able to bind to port 80 in different containers. Each container needs a different view of its image, needs its own root filesystem (rootfs). In Linux we use kernel namespaces to provide virtual separation.

Therefore, a process that runs in a cgroup, has security settings, and runs in namespaces can be called a container. Looking at PID 1, systemd, on a Red Hat Enterprise Linux 7 system, you see that systemd runs in a cgroup.
```


# tail -1 /proc/1/cgroup

1:name=systemd:/
```

The `ps` command shows you that the system process has an SELinux label ...
```


# ps -eZ | grep systemd

system_u:system_r:init_t:s0             1 ?     00:00:48 systemd
```

and capabilities.
```


# grep Cap /proc/1/status

...

CapEff: 0000001fffffffff

CapBnd: 0000001fffffffff

CapBnd:    0000003fffffffff
```

Finally, if you look at the `/proc/1/ns` subdir, you will see the namespace that systemd runs in.
```


ls -l /proc/1/ns

lrwxrwxrwx. 1 root root 0 Jan 11 11:46 mnt -> mnt:[4026531840]

lrwxrwxrwx. 1 root root 0 Jan 11 11:46 net -> net:[4026532009]

lrwxrwxrwx. 1 root root 0 Jan 11 11:46 pid -> pid:[4026531836]

...
```

If PID 1 (and really every other process on the system) has resource constraints, security settings, and namespaces, I argue that every process on the system is in a container.

Container runtime tools just modify these resource constraints, security settings, and namespaces. Then the Linux kernel executes the processes. After the container is launched, the container runtime can monitor PID 1 inside the container or the container's `stdin`/`stdout`--the container runtime manages the lifecycles of these processes.

### Container runtimes

You might say to yourself, well systemd sounds pretty similar to a container runtime. Well, after having several email discussions about why container runtimes do not use `systemd-nspawn` as a tool for launching containers, I decided it would be worth discussing container runtimes and giving some historical context.

[Docker][1] is often called a container runtime, but "container runtime" is an overloaded term. When folks talk about a "container runtime," they're really talking about higher-level tools like Docker, [ CRI-O][2], and [ RKT][3] that come with developer functionality. They are API driven. They include concepts like pulling the container image from the container registry, setting up the storage, and finally launching the container. Launching the container often involves running a specialized tool that configures the kernel to run the container, and these are also referred to as "container runtimes." I will refer to them as "low-level container runtimes." Daemons like Docker and CRI-O, as well as command-line tools like [ Podman][4] and [ Buildah][5], should probably be called "container managers" instead.

When Docker was originally written, it launched containers using the `lxc` toolset, which predates `systemd-nspawn`. Red Hat's original work with Docker was to try to integrate `[ libvirt][6]` (`libvirt-lxc`) into Docker as an alternative to the `lxc` tools, which were not supported in RHEL. `libvirt-lxc` also did not use `systemd-nspawn`. At that time, the systemd team was saying that `systemd-nspawn` was only a tool for testing, not for production.

At the same time, the upstream Docker developers, including some members of my Red Hat team, decided they wanted a golang-native way to launch containers, rather than launching a separate application. Work began on libcontainer, as a native golang library for launching containers. Red Hat engineering decided that this was the best path forward and dropped `libvirt-lxc`.

Later, the [Open Container Initiative][7] (OCI) was formed, party because people wanted to be able to launch containers in additional ways. Traditional namespace-separated containers were popular, but people also had the desire for virtual machine-level isolation. Intel and [Hyper.sh][8] were working on KVM-separated containers, and Microsoft was working on Windows-based containers. The OCI wanted a standard specification defining what a container is, so the [ OCI Runtime Specification][9] was born.

The OCI Runtime Specification defines a JSON file format that describes what binary should be run, how it should be contained, and the location of the rootfs of the container. Tools can generate this JSON file. Then other tools can read this JSON file and execute a container on the rootfs. The libcontainer parts of Docker were broken out and donated to the OCI. The upstream Docker engineers and our engineers helped create a new frontend tool to read the OCI Runtime Specification JSON file and interact with libcontainer to run the container. This tool, called `[ runc][10]`, was also donated to the OCI. While `runc` can read the OCI JSON file, users are left to generate it themselves. `runc` has since become the most popular low-level container runtime. Almost all container-management tools support `runc`, including CRI-O, Docker, Buildah, Podman, and [ Cloud Foundry Garden][11]. Since then, other tools have also implemented the OCI Runtime Spec to execute OCI-compliant containers.

Both [Clear Containers][12] and Hyper.sh's `runV` tools were created to use the OCI Runtime Specification to execute KVM-based containers, and they are combining their efforts in a new project called [ Kata][12]. Last year, Oracle created a demonstration version of an OCI runtime tool called [RailCar][13], written in Rust. It's been two months since the GitHub project has been updated, so it's unclear if it is still in development. A couple of years ago, Vincent Batts worked on adding a tool, `[ nspawn-oci][14]`, that interpreted an OCI Runtime Specification file and launched `systemd-nspawn`, but no one really picked up on it, and it was not a native implementation.

If someone wants to implement a native `systemd-nspawn --oci OCI-SPEC.json` and get it accepted by the systemd team for support, then CRI-O, Docker, and eventually Podman would be able to use it in addition to `runc `and Clear Container/runV ([Kata][15]). (No one on my team is working on this.)

The bottom line is, back three or four years, the upstream developers wanted to write a low-level golang tool for launching containers, and this tool ended up becoming `runc`. Those developers at the time had a C-based tool for doing this called `lxc` and moved away from it. I am pretty sure that at the time they made the decision to build libcontainer, they would not have been interested in `systemd-nspawn` or any other non-native (golang) way of running "namespace" separated containers.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/history-low-level-container-runtimes

作者：[Daniel Walsh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rhatdan
[1]:https://github.com/docker
[2]:https://github.com/kubernetes-incubator/cri-o
[3]:https://github.com/rkt/rkt
[4]:https://github.com/projectatomic/libpod/tree/master/cmd/podman
[5]:https://github.com/projectatomic/buildah
[6]:https://libvirt.org/
[7]:https://www.opencontainers.org/
[8]:https://www.hyper.sh/
[9]:https://github.com/opencontainers/runtime-spec
[10]:https://github.com/opencontainers/runc
[11]:https://github.com/cloudfoundry/garden
[12]:https://clearlinux.org/containers
[13]:https://github.com/oracle/railcar
[14]:https://github.com/vbatts/nspawn-oci
[15]:https://github.com/kata-containers
