Fedora-powered computer lab at our university
==========

![Fedora-powered computer lab at our university](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/fedora-powered-computer-lab-945x400.png)

At the [University of Novi Sad in Serbia, Faculty of Sciences, Department of Mathematics and Informatics][5], we teach our students a lot of things. From an introduction to programming to machine learning, all the courses make them think like great developers and software engineers. The pace is fast and there are many students, so we must have a setup on which we can rely on. We decided to switch our computer lab to Fedora.

### Previous setup

Our previous solution was keeping our development software in Windows [virtual machines][4] installed on Ubuntu Linux. This seemed like a good idea at the time. However, there were a couple of drawbacks. Firstly, there were serious performance losses because of running virtual machines. Performance and speed of the operating system was impacted because of this. Also, sometimes virtual machines ran concurrently in another user’s session. This led to serious slowdowns. We were losing precious time on booting the machines and then booting the virtual machines. Lastly, we realized that most of our software was Linux-compatible. Virtual machines weren’t necessary. We had to find a better solution.

### Enter Fedora!

![Computer lab in Serbia powered by Fedora](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/jxXtuFO-1024x576.jpg)

Picture of a computer lab running Fedora Workstation by default

We thought about replacing the virtual machines with a “bare bones” installation for a while. We decided to go for Fedora for several reasons.

#### Cutting edge of development

In our courses, we use many different development tools. Therefore, it is crucial that we always use the latest and greatest development tools available. In Fedora, we found 95% of the tools we needed in the official software repositories! For a few tools, we had to do a manual installation. This was easy in Fedora because you have almost all development tools available out of the box.

What we realized in this process was that we used a lot of free and open source software and tools. Having all that software always up to date was always going to be a lot of work – but not with Fedora.

#### Hardware compatibility

The second reason for choosing Fedora in our computer lab was hardware compatibility. The computers in the lab are new. In the past, there were some problems with older kernel versions. In Fedora, we knew that we would always have a recent kernel. As we expected, everything worked out of the box without any issues.

We decided that we would go for the [Workstation edition][3] of Fedora with [GNOME desktop environment][2]. Students found it easy, intuitive, and fast to navigate through the operating system. It was important for us that students have an easy environment where they could focus on the tasks at hand and the course itself rather than a complicated or slow user interface.

#### Powered by freedom

Lastly, in our department, we value free and open source software greatly. By utilizing such software, students are able to use it freely even when they graduate and start working. In the process, they also learn about Fedora and free and open source software in general.

### Switching the computer lab

We took one of the computers and fully set it up manually. That included preparing all the needed scripts and software, setting up remote access, and other important components. We also made one user account per course so students could easily store their files.

After that one computer was ready, we used a great, free and open source tool called [CloneZilla][1]. CloneZilla let us make a hard drive image for restoration. The image size was around 11GB. We used some fast USB 3.0 flash drives to restore the disk image to the remaining computers. We managed to fully provision and setup twenty-four computers in one hour and fifteen minutes, with just a couple of flash drives.

### Future work

All the computers in our computer lab are now exclusively using Fedora (with no virtual machines). The remaining work is to set up some administration scripts for remotely installing software, turning computers on and off, and so forth.

We would like to thank all Fedora maintainers, packagers, and other contributors. We hope our work encourages other schools and universities to make a switch similar to ours. We happily confirm that Fedora works great for us, and we can also vouch that it would work great for you!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-computer-lab-university/

作者：[Nemanja Milošević][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/nmilosev/
[1]:http://clonezilla.org/
[2]:https://www.gnome.org/
[3]:https://getfedora.org/workstation/
[4]:https://en.wikipedia.org/wiki/Virtual_machine
[5]:http://www.dmi.rs/
