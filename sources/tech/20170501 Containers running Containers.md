translating---geekpi

Containers running Containers
============================================================

Some genuinely exciting news piqued my interest at this year’s DockerCon, that being the new Operating System (OS), LinuxKit, which was announced and is immediately on offer from the undisputed heavyweight container company, Docker. 

The container giant has announced a flexible, extensible Operating System where system services run inside containers for portability. You might be surprised to hear that even includes the Docker runtime daemon itself.

In this article we’ll have a quick look at what’s promised in LinuxKit, how to try it out for yourself and at ever-shrinking, optimised containers.

**Less Is More**

There’s no denying that users have been looking for a stripped-down version of Linux to run their microservices upon. With containerisation you’re trying your hardest to minimise each application so that it becomes a standalone process which sits inside a container of its own. However constantly shifting containers around because you’re patching the host that the containers reside on causes issues. In fact without an orchestrator like Kubernetes or Docker Swarm that container-shuffling is almost always going to cause downtime.

Needless to say that’s just one reason to keep your OS as miniscule as possible; one of many.

A favourite quote I’ve repeated on a number of occasions, comes from the talented Dutch programmer, Wietse Zweitze, who brought us the e-mail stalwart Postfix and TCP Wrappers amongst other renowned software.

The Postfix website ([Postfix TLS_README][10]) states that even if you’re as careful with your coding as Wietse that for “every 1000 lines [you] introduce one additional bug into Postfix.” From my professional DevSecOps perspective by the mention of “bug” I might be forgiven for loosely translating that definition into security issues too.

From a security perspective it’s precisely for this reason that less-is-more in the world of code. Simply put there’s a number of benefits to using less lines of code; namely security, administration time and performance. For starters there’s less security bugs, less time updating packages and faster boot times.

**Look deeper inside**

Think about what runs your application from inside a container.

A good starting point is Alpine Linux ([https://alpinelinux.org/downloads][1]) which is a low-fat, boiled-down, reduced OS commonly preferred over the more bloated host favourites, such as Ubuntu or CentOS. Alpine also provides a miniroot filesystem (for use within containers) which comes in at a staggering 1.8MB at the last check. Indeed the ISO download for a fully-working Linux Operating System comes in at a remarkable 80MB in size.

If you decide to utilise a Docker base image from Alpine Linux then you can find one on the Docker Hub ([https://hub.docker.com/_/alpine][2]) where Alpine Linux describes itself as: “A minimal Docker image based on Alpine Linux with a complete package index and only 5 MB in size!”.

It’s been said, and I won’t attempt to verify this meme, that the ubiquitous Window Start Button is around the same filesize! I’ll refrain from commenting further.

In all seriousness hopefully that gives you an idea of the power of innovative Unix-type OSs like Alpine Linux.

**Lock everything up**

What’s more, it goes on to explain that Alpine Linux is (not surprisingly) based on BusyBox ([BusyBox][3]), the famous set of Linux commands neatly packaged which many people won’t be aware sits inside their broadband router, smart television and of course many IoT devices in their homes as they read this.

Comments on the the About page ([Alpine Linux][4]) of the Alpine Linux site states:

“Alpine Linux was designed with security in mind. The kernel is patched with an unofficial port of grsecurity/PaX, and all userland binaries are compiled as Position Independent Executables (PIE) with stack smashing protection. These proactive security features prevent exploitation of entire classes of zero-day and other vulnerabilities.”

In other words the boiled-down binaries bundled inside the Alpine Linux builds which offers the system its functionality have already been sieved through clever industry-standard security tools in order to help mitigate buffer overflow attacks.

**Odd socks**

Why do the innards of containers matter when we’re dealing with Docker’s new OS you may quite rightly ask?

Well, as you might have guessed, when it comes to containers their construction is all about losing bloat. It’s about not including anything unless it’s absolutely necessary. It’s about having confidence so that you can reap the rewards of decluttering your cupboards, garden shed, garage and sock drawer with total impunity.

Docker certainly deserve some credit for their foresight. Reportedly, early 2016 Docker hired a key driving force behind Alpine Linux, Nathaniel Copa, who helped switch the default, official image library away from Ubuntu to Alpine. The bandwidth that Docker Hub saved from the newly-streamlined image downloads alone must have been welcomed.

And, bringing us up-to-date, that work will stand arm-in-arm with the latest container-based OS work; Docker’s LinuxKit.

For clarity LinuxKit is not ever-likely destined to replace Alpine but rather to sit underneath the containers and act as a stripped-down OS that you can happily spin up your runtime daemon (in this case the Docker daemon which spawns your containers) upon.

**Blondie's Atomic**

A finely-tuned host is by no means a new thing (I mentioned the household devices embedded with Linux previously) and the evil geniuses who have been optimising Linux for the last couple of decades realised sometime ago that the underlying OS was key to churning out a server estate fulls of hosts brimming with containers.

For example the mighty Red Hat have long been touting Red Hat Atomic ([https://www.redhat.com/en/resources/red-hat-enterprise-linux-atomic-host][5]) having contributed to Project Atomic ([Project Atomic][6]). The latter goes on to explain:

“Based on proven technology either from Red Hat Enterprise Linux or the CentOS and Fedora projects, Atomic Host is a lightweight, immutable platform, designed with the sole purpose of running containerized applications.”

There’s good reason that the underlying, immutable Atomic OS is forwarded as the recommended choice with Red Hat’s OpenShift PaaS (Platform as a Service) product. It’s minimal, performant and sophisticated.

**Features**

The mantra that less-is-more was evident throughout Docker’s announcement regarding LinuxKit. The project to realise the vision of LinuxKit was apparently no small undertaking and with the guiding hand of expert Justin Cormack, a Docker veteran and master with unikernels ([https://en.wikipedia.org/wiki/Unikernel][7]), and in partnership with HPE, Intel, ARM, IBM and Microsoft LinuxKit can run on mainframes as well as IoT-based fridge freezers.

The configurable, pluggable and extensible nature of LinuxKit will appeal to many projects looking for a baseline upon which to build their services. By open-sourcing the project Docker are wisely inviting input from every man and their dog to contribute to its functionality which will mature like a good cheese undoubtedly over time.  

**Proof of the pudding**

Having promised to point those eager to get going with this new OS, let us wait no longer. If you want to get your hands on LinuxKit you can do so from the GitHub page here: [LinuxKit][11]

On the GitHub page there’s instructions on how to get up and running along with some features.

Time permitting I plan to get my hands much dirtier with LinuxKit. The somewhat-contentious Kubernetes versus Docker Swarm orchestration capabilities will be interesting to try out. I’d like to see memory footprints, boot times and diskspace-usage benchmarking too.

If the promises are true then pluggable system services which run as containers is a fascinating way to build an OS. Docker blogged ([https://blog.docker.com/2017/04/introducing-linuxkit-container-os-toolkit][12]) the following on its tiny footprint: “Because LinuxKit is container-native, it has a very minimal size – 35MB with a very minimal boot time. All system services are containers, which means that everything can be removed or replaced.”

I don’t know about you but that certainly whets my appetite.

**Call the cops**

Features aside with my DevSecOps hat on I will be in seeing how the promise of security looks in reality.

Docker quotes from NIST (the National Institute of Standards and Technology: [https://www.nist.gov][8]) and claims on their blog that:

“Security is a top-level objective and aligns with NIST stating, in their draft Application Container Security Guide: “Use container-specific OSes instead of general-purpose ones to reduce attack surfaces. When using a container-specific OS, attack surfaces are typically much smaller than they would be with a general-purpose OS, so there are fewer opportunities to attack and compromise a container-specific OS.”

Possibly the most important container-to-host and host-to-container security innovation will be the fact that system containers (system services) are apparently heavily sandboxed into their own unprivileged space, given just the external access that they need.

Couple that functionality with the collaboration of the Kernel Self Protection Project (KSPP) ([https://kernsec.org/wiki/index.php/Kernel_Self_Protection_Project][9]) and with a resounding thumbs-up from me it looks like Docker have focussed on something very worthwhile. For those unfamiliar KSPP’s raison d’etre is as follows:

“This project starts with the premise that kernel bugs have a very long lifetime, and that the kernel must be designed in ways to protect against these flaws.”

The KSPP site goes on to state admirably that:

“Those efforts are important and on-going, but if we want to protect our billion Android phones, our cars, the International Space Station, and everything else running Linux, we must get proactive defensive technologies built into the upstream Linux kernel. We need the kernel to fail safely, instead of just running safely.”

And, initially, if Docker only take baby steps with LinuxKit the benefit that it will bring over time through maturity will likely make great strides in the container space.

**The End is far from nigh**

As the powerhouse that is Docker continues to grow arms and legs there’s no doubt whatsoever that these giant-sized leaps in the direction of solid progress will benefit users and other software projects alike.

I would encourage all with an interest in Linux to closely watch this (name)space...

--------------------------------------------------------------------------------

via: http://www.devsecops.cc/devsecops/containers.html

作者：[Chris Binnie ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.devsecops.cc/
[1]:https://alpinelinux.org/downloads/
[2]:https://hub.docker.com/_/alpine
[3]:https://busybox.net/
[4]:https://www.alpinelinux.org/about/
[5]:https://www.redhat.com/en/resources/red-hat-enterprise-linux-atomic-host
[6]:http://www.projectatomic.io/
[7]:https://en.wikipedia.org/wiki/Unikernel
[8]:https://www.nist.gov/
[9]:https://kernsec.org/wiki/index.php/Kernel_Self_Protection_Project
[10]:http://www.postfix.org/TLS_README.html
[11]:https://github.com/linuxkit/linuxkit
[12]:https://blog.docker.com/2017/04/introducing-linuxkit-container-os-toolkit
