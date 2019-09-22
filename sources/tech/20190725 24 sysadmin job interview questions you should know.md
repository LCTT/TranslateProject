[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (24 sysadmin job interview questions you should know)
[#]: via: (https://opensource.com/article/19/7/sysadmin-job-interview-questions)
[#]: author: (DirectedSoul https://opensource.com/users/directedsoul)

24 sysadmin job interview questions you should know
======
Have a sysadmin job interview coming up? Read this article for some
questions you might encounter and possible answers.
![Question and answer.][1]

As a geek who always played with computers, a career after my masters in IT was a natural choice. So, I decided the sysadmin path was the right one. In the process of my career, I have grown quite familiar with the job interview process. Here is a look at what to expect, the general career path, and a set of common questions and my answers to them.

### Typical sysadmin tasks and duties

Organizations need someone who understands the basics of how a system works so that they can keep their data safe, and keep their services running smoothly. You might ask: "Wait, isn’t there more that a sysadmin can do?"

You are right. Now, in general, let’s look at what might be a typical sysadmin’s day-to-day tasks. Depending on their company’s needs and the person’s skill level, a sysadmin’s tasks vary from managing desktops, laptops, networks, and servers, to designing the organization’s IT policies. Sometimes sysadmins are even in charge of purchasing and placing orders for new IT equipment.

Those seeking system administration as their career paths might find it difficult to keep their skills and knowledge up to date, as rapid changes in the IT field are inevitable. The next natural question that arises out of anyone’s mind is how IT professionals keep up with the latest updates and skills.

### Low difficulty questions

Here are some of the more basic questions you will encounter, and my answers:

  1. What are the first five commands you type on a *nix server after login?



>   * **lsblk** to see information on all block devices
>   * **who** to see who is logged into the server
>   * **top** to get a sense of what is running on the server
>   * **df -khT** to view the amount of disk space available on the server
>   * **netstat** to see what TCP network connections are active
>


  2. How do you make a process run in the background, and what are the advantages of doing so?



> You can make a process run in the background by adding the special character **&amp;** at the end of the command. Generally, applications that take too long to execute, and don’t require user interaction are sent to the background so that we can continue our work in the terminal. ([Citation][2])

  3. Is running these commands as root a good or bad idea?



> Running (everything) as root is bad due to two major issues. The first is _risk_. Nothing prevents you from making a careless mistake when you are logged in as **root**. If you try to change the system in a potentially harmful way, you need to use **sudo**, which introduces a pause (while you’re entering the password) to ensure that you aren’t about to make a mistake.
>
> The second reason is _security_. Systems are harder to hack if you don’t know the admin user’s login information. Having access to root means you already have one half of the working set of admin credentials.

  4. What is the difference between **rm** and **rm -rf**?



> The **rm** command by itself only deletes the named files (and not directories). With **-rf** you add two additional features: The **-r**, **-R**, or --**recursive** flag recursively deletes the directory’s contents, including hidden files and subdirectories, and the **-f**, or --**force**, flag makes **rm** ignore nonexistent files, and never prompt for confirmation.

  5. **Compress.tgz** has a file size of approximately 15GB. How can you list its contents, and how do you list them only for a specific file?



> To list the file’s contents:
>
> **tar tf archive.tgz**
>
> To extract a specific file:
>
> **tar xf archive.tgz filename**

### Medium difficulty questions

Here are some harder questions you might encounter, and my answers:

  6. What is RAID? What is RAID 0, RAID 1, RAID 5, RAID 6, and RAID 10?



> A RAID (Redundant Array of Inexpensive Disks) is a technology used to increase the performance and/or reliability of data storage. The RAID levels are:
>
>   * RAID 0: Also known as disk striping, which is a technique that breaks up a file, and spreads the data across all of the disk drives in a RAID group. There are no safeguards against failure. ([Citation][3])
>   * RAID 1: A popular disk subsystem that increases safety by writing the same data on two drives. Called _mirroring_, RAID1 does not increase write performance, but read performance may increase up to the sum of each disks’ performance. Also, if one drive fails, the second drive is used, and the failed drive is manually replaced. After replacement, the RAID controller duplicates the contents of the working drive onto the new one.
>   * RAID 5: A disk subsystem that increases safety by computing parity data and increasing speed. RAID 5 does this by interleaving data across three or more drives (striping). Upon failure of a single drive, subsequent reads can be calculated from the distributed parity such that no data is lost.
>   * RAID 6: Which extends RAID 5 by adding another parity block. This level requires a minimum of four disks, and can continue to execute read/write with any two concurrent disk failures. RAID 6 does not have a performance penalty for reading operations, but it does have a performance penalty on write operations because of the overhead associated with parity calculations.
>   * RAID 10: Also known as RAID 1+0, RAID 10 combines disk mirroring and disk striping to protect data. It requires a minimum of four disks, and stripes data across mirrored pairs. As long as one disk in each mirrored pair is functional, data can be retrieved. If two disks in the same mirrored pair fail, all data will be lost because there is no parity in the striped sets. ([Citation][4])
>


  7. Which port is used for the **ping** command?



> The **ping** command uses ICMP. Specifically, it uses ICMP echo requests and ICMP echo reply packets.
>
> ICMP does not use either UDP or TCP communication services: Instead, it uses raw IP communication services. This means that the ICMP message is carried directly in an IP datagram data field.

  8. What is the difference between a router and a gateway? What is the default gateway?



> _Router_ describes the general technical function (layer 3 forwarding), or a hardware device intended for that purpose, while _gateway_ describes the function for the local segment (providing connectivity to elsewhere). You could also state that you "set up a router as a gateway." Another term is _hop_, which describes forwarding between subnets.
>
> The term _default gateway_ is used to mean the router on your LAN, which has the responsibility of being the first point of contact for traffic to computers outside the LAN.

  9. Explain the boot process for Linux.



> BIOS -&gt; Master Boot Record (MBR) -&gt; GRUB -&gt; the kernel -&gt; init -&gt; runlevel

  10. How do you check the error messages while the server is booting up?



> Kernel messages are always stored in the kmsg buffer, visible via the **dmesg** command.
>
> Boot issues and errors call for a system administrator to look into certain important files, in conjunction with particular commands, which are each handled differently by different versions of Linux:
>
>   * **/var/log/boot.log** is the system boot log, which contains all that unfolded during the system boot.
>   * **/var/log/messages** stores global system messages, including the messages logged during system boot.
>   * **/var/log/dmesg** contains kernel ring buffer information.
>


  11. What is the difference between a symbolic link and a hard link?



> A _symbolic_ or _soft link_ is an actual link to the original file, whereas a _hard link_ is a mirror copy of the original file. If you delete the original file, the soft link has no value, because it then points to a non-existent file. In the case of a hard link, it is entirely the opposite. If you delete the original file, the hard link still contains the data from the original file. ([Citation][5])

  12. How do you change kernel parameters? What kernel options might you need to tune?



> To set the kernel parameters in Unix-like systems, first edit the file **/etc/sysctl.conf**. After making the changes, save the file and run the **sysctl -p** command. This command makes the changes permanent without rebooting the machine

  13. Explain the **/proc** filesystem.



> The **/proc** filesystem is virtual, and provides detailed information about the kernel, hardware, and running processes. Since **/proc** contains virtual files, it is called the _virtual file system_. These virtual files have unique qualities. Most of them are listed as zero bytes in size.
>
> Virtual files such as **/proc/interrupts**, **/proc/meminfo**, **/proc/mounts** and **/proc/partitions** provide an up-to-the-moment glimpse of the system’s hardware. Others, such as **/proc/filesystems** and the **/proc/sys** directory provide system configuration information and interfaces.

  14. How do you run a script as another user without their password?



> For example, if you were editing the sudoers file (such as **/private/etc/sudoers**), you might use **visudo** to add the following:
>
> [**user1 ALL=(user2) NOPASSWD: /opt/scripts/bin/generate.sh**][2]

  15. What is the UID 0 toor account? Have you been compromised?



> The toor user is an alternative superuser account, where toor is root spelled backward. It is intended to be used with a non-standard shell, so the default shell for root does not need to change.
>
> This purpose is important. Shells which are not part of the base distribution, but are instead installed from ports or packages, are installed in **/usr/local/bin**; which, by default, resides on a different file system. If root’s shell is located in **/usr/local/bin** and the file system containing **/usr/local/bin** is not mounted, root could not log in to fix a problem, and the sysadmin would have to reboot into single-user mode to enter the shell’s path.

### Advanced questions

Here are the even more difficult questions you may encounter:

  16. How does **tracert** work and what protocol does it use?



> The command **tracert**—or **traceroute** depending on the operating system—allows you to see exactly what routers you touch as you move through the chain of connections to your final destination. If you end up with a problem where you can’t connect to or **ping** your final destination, a **tracert** can help in that you can tell exactly where the chain of connections stops. ([Citation][6])
>
> With this information, you can contact the correct people; whether it be your own firewall, your ISP, your destination’s ISP, or somewhere in the middle. The **tracert** command—like **ping**—uses the ICMP protocol, but also can use the first step of the TCP three-way handshake to send SYN requests for a response.

  17. What is the main advantage of using **chroot**? When and why do we use it? What is the purpose of the **mount /dev**, **mount /proc**, and **mount /sys** commands in a **chroot** environment? 



> An advantage of having a **chroot** environment is that the filesystem is isolated from the physical host, since **chroot** has a separate filesystem inside your filesystem. The difference is that **chroot** uses a newly created root (**/**) as its root directory.
>
> A **chroot** jail lets you isolate a process and its children from the rest of the system. It should only be used for processes that don’t run as **root**, as **root** users can break out of the jail easily.
>
> The idea is that you create a directory tree where you copy or link in all of the system files needed for the process to run. You then use the **chroot()** system call to tell it the root directory now exists at the base of this new tree, and then start the process running in that **chroot**’d environment. Since the command then can’t reference paths outside the modified root directory, it can’t perform operations (read, write, etc.) maliciously on those locations. ([Citation][7])

  18. How do you protect your system from getting hacked?



> By following the principle of least privileges and these practices:
>
>   * Encrypt with public keys, which provides excellent security.
>   * Enforce password complexity.
>   * Understand why you are making exceptions to the rules above.
>   * Review your exceptions regularly.
>   * Hold someone to account for failure. (It keeps you on your toes.) ([Citation][8])
>


  19. What is LVM, and what are the advantages of using it?



> LVM, or Logical Volume Management, uses a storage device management technology that gives users the power to pool and abstract the physical layout of component storage devices for easier and flexible administration. Using the device mapper Linux kernel framework, the current iteration (LVM2) can be used to gather existing storage devices into groups and allocate logical units from the combined space as needed.

  20. What are sticky ports?



> Sticky ports are one of the network administrator’s best friends and worst headaches. They allow you to set up your network so that each port on a switch only permits one (or a number that you specify) computer to connect on that port, by locking it to a particular MAC address.

  21. Explain port forwarding?



> When trying to communicate with systems on the inside of a secured network, it can be very difficult to do so from the outside—and with good reason. Therefore, the use of a port forwarding table within the router itself, or other connection management device, can allow specific traffic to automatically forward to a particular destination. For example, if you had a web server running on your network and you wanted to grant access to it from the outside, you would set up port forwarding to port 80 on the server in question. This would mean that anyone entering your IP address in a web browser would connect to the server’s website immediately.
>
> Please note, it is usually not recommended to allow access to a server from the outside directly into your network.

  22. What is a false positive and false negative in the case of IDS?



> When the Intrusion Detection System (IDS) device generates an alert for an intrusion which has actually not happened, this is false positive. If the device has not generated any alert and the intrusion has actually happened, this is the case of a false negative.

  23. Explain **:(){ :|:&amp; };:** and how to stop this code if you are already logged into the system?



> This is a fork bomb. It breaks down as follows:
>
>   * **:()** defines the function, with **:** as the function name, and the empty parenthesis shows that it will not accept any arguments.
>   * **{ }** shows the beginning and end of the function definition.
>   * **:|:** loads a copy of the function **:** into memory, and pipes its output to another copy of the **:** function, which also has to be loaded into memory.
>   * **&amp;** makes the previous item a background process, so that the child processes will not get killed even though the parent gets auto-killed.
>   * **:** at the end executes the function again, and hence the chain reaction begins.
>

>
> The best way to protect a multi-user system is to use Privileged Access Management (PAM) to limit the number of processes a user can use.
>
> The biggest problem with a fork bomb is the fact it takes up so many processes. So, we have two ways of attempting to fix this if you are already logged into the system. One option is to execute a SIGSTOP command to stop the process, such as:
>
> **killall -STOP -u user1**
>
> If you can’t use the command line due to all processes being used, you will have to use **exec** to force it to run:
>
> **exec killall -STOP -u user1**
>
> With fork bombs, your best option is preventing them from becoming too big of an issue in the first place

  24. What is OOM killer and how does it decide which process to kill first?



> If memory is exhaustively used up by processes to the extent that possibly threatens the system’s stability, then the out of memory (OOM) killer comes into the picture.
>
> An OOM killer first has to select the best process(es) to kill. _Best_ here refers to the process which will free up the maximum memory upon being killed, and is also the least important to the system. The primary goal is to kill the least number of processes to minimize the damage done, and at the same time maximize the amount of memory freed.
>
> To facilitate this goal, the kernel maintains an oom_score for each of the processes. You can see the oom_score of each of the processes in the **/proc** filesystem under the **pid** directory:
>
> **$ cat /proc/10292/oom_score**
>
> The higher the value of oom_score for any process, the higher its likelihood is of being killed by the OOM Killer in an out-of-memory situation. ([Citation][9])

### Conclusion

System administration salaries have a [wide range][10] with some sites mentioning $70,000 to $100,000 a year, depending on the location, the size of the organization, and your education level plus years of experience. In the end, the system administration career path boils down to your interest in working with servers and solving cool problems. Now, I would say go ahead and achieve your dream path.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/sysadmin-job-interview-questions

作者：[DirectedSoul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/directedsoul
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_HowToFish_520x292.png?itok=DHbdxv6H (Question and answer.)
[2]: https://github.com/trimstray/test-your-sysadmin-skills
[3]: https://www.waytoeasylearn.com/2016/05/netapp-filer-tutorial.html
[4]: https://searchstorage.techtarget.com/definition/RAID-10-redundant-array-of-independent-disks
[5]: https://www.answers.com/Q/What_is_hard_link_and_soft_link_in_Linux
[6]: https://www.wisdomjobs.com/e-university/network-administrator-interview-questions.html
[7]: https://unix.stackexchange.com/questions/105/chroot-jail-what-is-it-and-how-do-i-use-it
[8]: https://serverfault.com/questions/391370/how-to-prevent-zero-day-attacks
[9]: https://unix.stackexchange.com/a/153586/8369
[10]: https://blog.netwrix.com/2018/07/23/systems-administrator-salary-in-2018-how-much-can-you-earn/
