[bazz2222222]
Linuxcon: The Changing Role of the Server OS
================================================================================
SEATTLE - Containers might one day change the world, but it will take time and it will also change the role of the operating system. That's the message delivered during a Linuxcon keynote here today by Wim Coekaerts, SVP Linux and virtualization engineering at Oracle.

![](http://www.serverwatch.com/imagesvr_ce/6421/wim-200x150.jpg)

Coekaerts started his presentation by putting up a slide stating it's the year of the desktop, which generated a few laughs from the audience. Oracle Wim Coekarts Truly, though, Coekaerts said it is now apparent that 2015 is the year of the container, and more importantly the year of the application, which is what containers really are all about.

"What do you need an operating system for?" Coekaerts asked. "It's really just there to run an application; an operating system is there to manage hardware and resources so your app can run."

Coekaerts added that with Docker containers, the focus is once again on the application. At Oracle, Coekaerts said much of the focus is on how to make the app run better on the OS.

"Many people are used to installing apps, but many of the younger generation just click a button on their mobile device and it runs," Coekaerts said.

Coekaerts said that people now wonder why it's more complex in the enterprise to install software, and Docker helps to change that.

"The role of the operating system is changing," Coekaerts said.

The rise of Docker does not mean the demise of virtual machines (VMs), though. Coekaerts said it will take a very long time for things to mature in the containerization space and get used in real world.

During that period VMs and containers will co-exist and there will be a need for transition and migration tools between containers and VMs. For example, Coekaerts noted that Oracle's VirtualBox open-source technology is widely used on desktop systems today as a way to help users run Docker. The Docker Kitematic project makes use of VirtualBox to boot Docker on Macs today.

### The Open Compute Initiative and Write Once, Deploy Anywhere for Containers ###

A key promise that needs to be enabled for containers to truly be successful is the concept of write once, deploy anywhere. That's an area where the Linux Foundations' Open Compute Initiative (OCI) will play a key role in enabling interoperability across container runtimes.

"With OCI, it will make it easier to build once and run anywhere, so what you package locally you can run wherever you want," Coekaerts said.

Overall, though, Coekaerts said that while there is a lot of interest in moving to the container model, it's not quite ready yet. He noted Oracle is working on certifying its products to run in containers, but it's a hard process.

"Running the database is easy; it's everything else around it that is complex," Coekaerts said. "Containers don't behave the same as VMs, and some applications depend on low-level system configuration items that are not exposed from the host to the container."

Additionally, Coekaerts commented that debugging problems inside a container is different than in a VM, and there is currently a lack of mature tools for proper container app debugging.

Coekaerts emphasized that as containers matures it's important to not forget about the existing technology that organizations use to run and deploy applications on servers today. He said enterprises don't typically throw out everything they have just to start with new technology.

"Deploying new technology is hard, and you need to be able to transition from what you have," Coekaerts said. "The technology that allows you to transition easily is the technology that wins."

--------------------------------------------------------------------------------

via: http://www.serverwatch.com/server-news/linuxcon-the-changing-role-of-the-server-os.html

作者：[Sean Michael Kerner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.serverwatch.com/author/Sean-Michael-Kerner-101580.htm
