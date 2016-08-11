A brief introduction to Linux containers and image signing
====================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/containers_2015-1-osdc-lead.png?itok=E1imOYe4)

Fundamentally, all major software, even open source, was designed before image-based containers. This means that putting software inside of containers is fundamentally a platform migration. This also means that some programs are easy to migrate into containers, [while others are more difficult][1].

I started working with image-based containers nearly 3.5 years ago. In this time I have containerized a ton of applications. I have learned what's real, and what is superstition. Today, I'd like to give a brief introduction to how Linux containers are designed and talk briefly about image signing.

### How Linux containers are designed

What most people find confusing about the image based Linux containers, is that it's really about breaking an operating system into two parts: [the kernel and the user space][2]. In a traditional operating system, the kernel runs on the hardware and you never interact with it directly. The user space is what you actually interact with and this includes all the files, libraries, and programs that you see when you look at a file browser or run the ls command. When you use the ifconfig command to change an IP address, you are actually leveraging a user space program to make kernel changes to the TCP stack. This often blows people's minds if they haven't studied [Linux/Unix fundamentals][3].

Historically, the libraries in the user space supported programs that interacted with the kernel (ifconfig, sysctl, tuned-adm) and user-facing programs such as web servers or databases. Everything was dumped together in a single filesystem hierarchy. Users could inspect the /sbin or /lib directories and see all of the applications and libraries that support the operating system itself, or inspect the /usr/sbin or /usr/lib directory to see all of the user-facing programs and libraries (Check out the [Filesystem Hierarchy Standard][4]). The problem with this model was that there was never complete isolation between operating system programs and business supporting applications. Programs in /usr/bin might rely on libraries which live in /lib. If an application owner needed to change something, it could break the operating system. Conversely, if the team in charge of doing security updates needed to change a library, it could (and often did) break business facing applications. It was a mess.

With image-based containers such as Docker, LXD, and RKT, an application owner can package and modify all of the dependencies in /sbin, /lib, /usr/bin, and /usr/lib without worrying about breaking the underlying operating system. Essentially, using image-based containers cleanly isolates the operating system into two parts, again, the kernel and the user space. Now dev and ops can update things independently of each other, kinda...

There is some serous confusion though. Often, each application owner (or developer) doesn't want to be responsible for updating application dependencies such as openssl, glibc, or hardening underlying components, such as XML parsers, or JVMs, or dealing with performance settings. Historically, these problems were delegated to the operations team. Since we are packing a lot of dependencies in the container, the delegation of responsibility for all of the pieces in the container is still a real problem for many organizations.

### Migrating existing applications to Linux containers

Putting software inside of containers is basically a platform migration. I'd like to highlight what makes this difficult to migrate some applications into containers.

Developers now have complete control over what's in /sbin, /lib, /usr/bin, and /usr/lib. But, one of the challenges they have is, they still need to put data and configuration in folders such as /etc or /var/lib. With image-based containers, this is a bad idea. We really want good separation of code, configuration, and data. We want the developers to provide the code in the container, but we want the data and configuration to come from the environment, e.g. development, testing, or production.

This means we need to mount some files from /etc or directories from /var/lib when we (or better, the platform) instantiate a container. This will allow us to move the containers around and still get its configuration and data from the environment. Cool, right? Well, there is a problem, that means we have to be able to isolate configuration and data cleanly. Many modern open source programs like Apache, MySQL, MongoDB, or Nginx do this by default, [but many home-grown, legacy, or proprietary programs are not designed to do this by default][5]. This is a major pain point for many organizations. A best practice for developers would be to start architecting new applications and migrating legacy code so that configuration and data are cleanly isolated.

### Introduction to image signing

Trust is a major issue with containers. Container image signing allows a user to add a digital fingerprint to an image. This fingerprint can later be cryptographically tested to verify trust. This allows the user of a container image to verify the source and trust the container image.

The container community uses the words “container image" quite a lot, but this nomenclature can be quite confusing. Docker, LXD, and RKT operate on the concept of pulling remote files and running them as a container. Each of these technologies treats containers images in different ways. LXD pulls a single container image with a single layer, while Docker and RKT use Open Container Image (OCI)-based images which can be made up of multiple layers. Worse, different teams or even organization may be responsible for different layers of a container image. Implicit in the concept of a container image is the concept of a Container Image Format. Having a standard image format such as OCI will allow an ecosystem to flourish around container scanning, signing, and movement between cloud providers.

Now on to signing.

One of the problems with containers is we package a bunch of code, binaries, and libraries into a container image. Once we package the code, we share it with essentially fancy file servers which we call Registry Servers. Once the code is shared, it is basically anonymous without some form of cryptographic signing. Worse yet, container images are often made up of image layers which are controlled by different people or teams of people. Each team needs to have the ability to check the last team's work, add their work, and then put their stamp of approval on it. They then need to send it on to the next team.

The final user of the container image (really made up of multiple images) really needs to check the chain of custody. They need to verify trust with every team that added files to the container image. It is critical for end users to have confidence about every single layer of the container image.

Scott McCarty will give a talk called [Containers for Grownups: Migrating Traditional & Existing Applications][6] at ContainerCon on August 24. Talk attendees will gain a new understanding of how containers work, and be able to leverage their current architectural knowledge to the world of containers. He will teach attendees which applications are easy to put in containers and why, and he'll explain which types of programs are more difficult and why. He will provide tons of examples and help attendees gain confidence in building and migrating their own applications into containers.





--------------------------------------------------------------------------------

via:  https://opensource.com/bus/16/8/introduction-linux-containers-and-image-signing

作者：[Scott McCarty][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[1]: http://rhelblog.redhat.com/2016/04/21/architecting-containers-part-4-workload-characteristics-and-candidates-for-containerization/
[2]: http://rhelblog.redhat.com/2015/07/29/architecting-containers-part-1-user-space-vs-kernel-space/
[3]: http://rhelblog.redhat.com/tag/architecting-containers/
[4]: https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard
[5]: http://rhelblog.redhat.com/2016/04/21/architecting-containers-part-4-workload-characteristics-and-candidates-for-containerization/
[6]: https://lcccna2016.sched.org/event/7JUc/containers-for-grownups-migrating-traditional-existing-applications-scott-mccarty-red-hat
