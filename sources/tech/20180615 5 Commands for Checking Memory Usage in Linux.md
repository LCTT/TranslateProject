5 Commands for Checking Memory Usage in Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/top-main.jpg?itok=WYAw6yJ1)
The Linux operating system includes a plethora of tools, all of which are ready to help you administer your systems. From simple file and directory tools to very complex security commands, there’s not much you can’t do on Linux. And, although regular desktop users may not need to become familiar with these tools at the command line, they’re mandatory for Linux admins. Why? First, you will have to work with a GUI-less Linux server at some point. Second, command-line tools often offer far more power and flexibility than their GUI alternative.

Determining memory usage is a skill you might need should a particular app go rogue and commandeer system memory. When that happens, it’s handy to know you have a variety of tools available to help you troubleshoot. Or, maybe you need to gather information about a Linux swap partition or detailed information about your installed RAM? There are commands for that as well. Let’s dig into the various Linux command-line tools to help you check into system memory usage. These tools aren’t terribly hard to use, and in this article, I’ll show you five different ways to approach the problem.

I’ll be demonstrating on the [Ubuntu Server 18.04 platform][1]. You should, however, find all of these commands available on your distribution of choice. Even better, you shouldn’t need to install a single thing (as most of these tools are included).

With that said, let’s get to work.

### top

I want to start out with the most obvious tool. The top command provides a dynamic, real-time view of a running system. Included in that system summary is the ability to check memory usage on a per-process basis. That’s very important, as you could easily have multiple iterations of the same command consuming different amounts of memory. Although you won’t find this on a headless server, say you’ve opened Chrome and noticed your system slowing down. Issue the top command to see that Chrome has numerous processes running (one per tab - Figure 1).

![top][3]

Figure 1: Multiple instances of Chrome appearing in the top command.

[Used with permission][4]

Chrome isn’t the only app to show multiple processes. You see the Firefox entry in Figure 1? That’s the primary process for Firefox, whereas the Web Content processes are the open tabs. At the top of the output, you’ll see the system statistics. On my machine (a [System76 Leopard Extreme][5]), I have a total of 16GB of RAM available, of which just over 10GB is in use. You can then comb through the list and see what percentage of memory each process is using.

One of the things top is very good for is discovering Process ID (PID) numbers of services that might have gotten out of hand. With those PIDs, you can then set about to troubleshoot (or kill) the offending tasks.

If you want to make top a bit more memory-friendly, issue the command top -o %MEM, which will cause top to sort all processes by memory used (Figure 2).

![top][7]

Figure 2: Sorting process by memory used in top.

[Used with permission][4]

The top command also gives you a real-time update on how much of your swap space is being used.

### free

Sometimes, however, top can be a bit much for your needs. You may only need to see the amount of free and used memory on your system. For that, there is the free command. The free command displays:

  * Total amount of free and used physical memory

  * Total amount of swap memory in the system

  * Buffers and caches used by the kernel




From your terminal window, issue the command free. The output of this command is not in real time. Instead, what you’ll get is an instant snapshot of the free and used memory in that moment (Figure 3).

![free][9]

Figure 3: The output of the free command is simple and clear.

[Used with permission][4]

You can, of course, make free a bit more user-friendly by adding the -m option, like so: free -m. This will report the memory usage in MB (Figure 4).

![free][11]

Figure 4: The output of the free command in a more human-readable form.

[Used with permission][4]

Of course, if your system is even remotely modern, you’ll want to use the -g option (gigabytes), as in free -g.

If you need memory totals, you can add the t option like so: free -mt. This will simply total the amount of memory in columns (Figure 5).

![total][13]

Figure 5: Having free total your memory columns for you.

[Used with permission][4]

### vmstat

Another very handy tool to have at your disposal is vmstat. This particular command is a one-trick pony that reports virtual memory statistics. The vmstat command will report stats on:

  * Processes

  * Memory

  * Paging

  * Block IO

  * Traps

  * Disks

  * CPU




The best way to issue vmstat is by using the -s switch, like vmstat -s. This will report your stats in a single column (which is so much easier to read than the default report). The vmstat command will give you more information than you need (Figure 6), but more is always better (in such cases).

![vmstat][15]

Figure 6: Using the vmstat command to check memory usage.

[Used with permission][4]

### dmidecode

What if you want to find out detailed information about your installed system RAM? For that, you could use the dmidecode command. This particular tool is the DMI table decoder, which dumps a system’s DMI table contents into a human-readable format. If you’re unsure as to what the DMI table is, it’s a means to describe what a system is made of (as well as possible evolutions for a system).

To run the dmidecode command, you do need sudo privileges. So issue the command sudo dmidecode -t 17. The output of the command (Figure 7) can be lengthy, as it displays information for all memory-type devices. So if you don’t have the ability to scroll, you might want to send the output of that command to a file, like so: sudo dmidecode -t 17 > dmi_infoI, or pipe it to the less command, as in sudo dmidecode | less.

![dmidecode][17]

Figure 7: The output of the dmidecode command.

[Used with permission][4]

### /proc/meminfo

You might be asking yourself, “Where do these commands get this information from?”. In some cases, they get it from the /proc/meminfo file. Guess what? You can read that file directly with the command less /proc/meminfo. By using the less command, you can scroll up and down through that lengthy output to find exactly what you need (Figure 8).

![/proc/meminfo][19]

Figure 8: The output of the less /proc/meminfo command.

[Used with permission][4]

One thing you should know about /proc/meminfo: This is not a real file. Instead /pro/meminfo is a virtual file that contains real-time, dynamic information about the system. In particular, you’ll want to check the values for:

  * MemTotal

  * MemFree

  * MemAvailable

  * Buffers

  * Cached

  * SwapCached

  * SwapTotal

  * SwapFree




If you want to get fancy with /proc/meminfo you can use it in conjunction with the egrep command like so: egrep --color 'Mem|Cache|Swap' /proc/meminfo. This will produce an easy to read listing of all entries that contain Mem, Cache, and Swap ... with a splash of color (Figure 9).

![/proc/meminfo][21]

Figure 9: Making /proc/meminfo easier to read.

[Used with permission][4]

### Keep learning

One of the first things you should do is read the manual pages for each of these commands (so man top, man free, man vmstat, man dmidecode). Starting with the man pages for commands is always a great way to learn so much more about how a tool works on Linux.

Learn more about Linux through the free ["Introduction to Linux" ][22]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/5-commands-checking-memory-usage-linux

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.ubuntu.com/download/server
[2]:/files/images/memory1jpg
[3]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_1.jpg?itok=fhhhUL_l (top)
[4]:/licenses/category/used-permission
[5]:https://system76.com/desktops/leopard
[6]:/files/images/memory2jpg
[7]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_2.jpg?itok=zuVkQfvv (top)
[8]:/files/images/memory3jpg
[9]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_3.jpg?itok=rvuQp3t0 (free)
[10]:/files/images/memory4jpg
[11]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_4.jpg?itok=K_luLLPt (free)
[12]:/files/images/memory5jpg
[13]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_5.jpg?itok=q50atcsX (total)
[14]:/files/images/memory6jpg
[15]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_6.jpg?itok=bwFnUVmy (vmstat)
[16]:/files/images/memory7jpg
[17]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_7.jpg?itok=UNHIT_P6 (dmidecode)
[18]:/files/images/memory8jpg
[19]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_8.jpg?itok=t87jvmJJ (/proc/meminfo)
[20]:/files/images/memory9jpg
[21]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/memory_9.jpg?itok=t-iSMEKq (/proc/meminfo)
[22]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
