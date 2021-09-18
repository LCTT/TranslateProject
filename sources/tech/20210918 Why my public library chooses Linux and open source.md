[#]: subject: "Why my public library chooses Linux and open source"
[#]: via: "https://opensource.com/article/21/9/library-linux"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why my public library chooses Linux and open source
======
My library's IT Director shares her community's Linux journey.
![books on shelves in a library, colorful][1]

The Crawford County Federated Library System has been using Linux and open source software in its IT operations since 1999. They realized early on the potential of open source and integrated it into their enterprise. They were a part of my own Linux journey as I built a content filtering system for our school district. Twenty years ago, there were few models for the use of open source in libraries and education. Meadville Public Library and the Crawford County Federated Library System were the leaders then and now. Recently I had some questions about how to help libraries in our own library system, and I called Meadville. They referred me to Cindy Murdock Ames, their IT Director. I asked her what they were using for patron desktop computers. Cindy sent a brief email that piqued my interest, and I asked her if she would agree to an email interview. She graciously accepted.

**Don Watkins: How did you get started with Linux and open source?**

**Cindy Murdock Ames:** I started at the library in 1998, shortly after graduating with my master's in library science (MLS). My first job was actually administrative assistant to the library director, who was at the time, doing all the IT for our libraries, and it was becoming too much for him to manage. I'd been tinkering with computers since high school, and shortly thereafter, it became apparent to him that I was comfortable with technology, and I started taking over IT responsibilities. We had a tech consultant that was a Linux user (my good friend Ben Bullock, who got started with Linux himself because he was interested in building a home weather station) that was helping us set up Linux-based routers at all the libraries to connect them to the internet over dialup. He taught me the basics of administering networks, Linux, OpenBSD, and FreeBSD. The first project I completed on my own was converting all the public computers at Meadville Public Library to Linux Terminal Server Project (LTSP)-based thin clients at the end of 1999.

**DW: What are the strengths or takeaways for Meadville Public Library's use of open source on the back-end and the front-end?**

**CMA:** One of the major strengths from our use of open source is versatility. Once you start using free and open source software (FOSS) for one project, you find you can apply it to many others—from desktops, library circulation systems, patron login management systems (Libki, written for us by Kyle Hall who had worked for us before he moved to Bywater Solutions), web servers, digital signage, print servers, VOIP systems, virtualization, desktop and server management, inventory systems, and so on.  Also, there are no licenses to manage and generally no software costs, so long as you have someone who can install and manage it. A lot of libraries don't have access to IT staff. One issue that we are having nowadays is that with how common a platform it has become, it is challenging to retain qualified employees for what our library system can afford to pay. Fortunately, though, I have been able to streamline management of our systems with tools such as Ansible so much that I have been able to transition to working part-time myself, and we are also testing the waters of Software-as-a-service (SaaS) by transitioning from self-hosted WordPress for our websites to migrating our libraries to the Aspen Discovery (still open source!) discovery system hosted by Bywater Solutions. So far, we are very happy with it, and it provides additional service to our patrons in that they can search both our digital and material offerings all in one place.

**DW: Why are you using Ubuntu MATE? What are the benefits of that desktop environment?**

**CMA:** Over time, we have tried many desktop environments, and at one point, settled on GNOME 2 because it provided a simple desktop environment for patrons that they could easily figure out how to use and that we could easily customize and manage. Then came GNOME 3, which was very different from 2, and MATE was forked from 2, so we switched to it and have been using it ever since. For shared computing in public libraries, you need to be able to lock down settings so patrons can't change the desktop background or any other settings permanently. You also need to keep their personal data safe by wiping anything they may have saved during their session. Even with staff computers, you need to lock down certain settings to prevent common issues—people are really good at obscuring their window list by accident! MATE uses the dconf settings management system, making it relatively easy to control a wide variety of desktop settings. There are Ansible modules to make those settings even easier to manage. We pair the custom dconf settings with a script that restores the user account folder to a pristine state on logout. Plus, we use Ansible playbooks to set some custom settings in Firefox and Chrome to make it harder for patrons to change anything they shouldn't, as well as clear their data.
 
**DW: How has Ansible helped you to manage your desktop deployments? **

**CMA:** Ansible has saved me so much time that I have been able to automate many tasks and make my job part-time to have more time for other things. For desktops, I have a virtual machine (VM) on Proxmox that uses Rundeck to make Ansible playbook runs on our staff and public desktops on a regular schedule to enforce settings. If setting up a new staff or public computer is necessary, all I have to do after a fresh install of the OS is copy my ssh key to it and install Ansible and OpenSSH-server on it. From my computer, I can run the Ansible playbooks on it to complete its setup with whatever type of profile is necessary. With Ansible, it is easy to set up various profile types by creating roles that include all the other roles that need to be applied to that particular profile—it is entirely modular. It also ensures that all systems are consistently set up, and everything is documented in the playbooks and the logs of the GIT repository they're stored in. I highly recommend the book [_Ansible for DevOps_][2] to learn more.

**DW: Do you recommend open source software to your patrons?**

**CMA:** Just by example—a few years ago, we did a patron survey, and there were several people that said they became interested in Linux by using our public computers.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/library-linux

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/books_library_reading_list_colorful.jpg?itok=jJtnyniB (books on shelves in a library, colorful)
[2]: https://www.ansiblefordevops.com/
