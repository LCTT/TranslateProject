How To Kill The Largest Process In An Unresponsive Linux System
======
![](https://www.ostechnix.com/wp-content/uploads/2017/11/Kill-The-Largest-Process-720x340.png)

I, as a blog writer, have bookmarked many blogs, websites and forums to refer Linux and Unix related notes. Sometimes, I had a lot of open tabs in my browser, so my system goes unresponsive for several minutes. I couldn't move the mouse cursor, or kill a process or close any opened tabs. At that times, I had no choice but to forcibly reset the system. Of course, I use **OneTab** and The **Great Suspender** extensions, but they didn 't help much either. I often ran out of memory. This is where **Early OOM** comes in help. For those wondering, it will kill the largest process in an unresponsive system when it has absolutely no other choices. Early OOM checks the amount of available memory and free swap 10 times a second. If both are below 10%, it will kill the largest process.

### Why Early OOM? Why not built-in OOM killer?

Before going into further, let me you give a short explanation of OOM killer, also known as **O** ut **O** f **M** emory killer. OOM killer is a process that the Kernel uses when the system is critically low on memory. The main task of OOM killer is to continue killing processes until enough memory is freed for the smooth functioning of the rest of the process that the Kernel is attempting to run. OOM killer will choose the best processes that are least important to the system and free up maximum memory and kill them. We can view the oom_score of each process in **/proc** directory under **pid** section.

Example:
```
$ cat /proc/10299/oom_score
1
```

The higher the value of oom_score of any process, the higher is its likelihood of getting killed by the OOM Killer when the system is running out of memory.

The developer of Early OOM claims that it has one big advantage over the in-kernel OOM killer. As I stated earlier, the Linux oom killer kills the process with the highest score, so the Chrome browser will always be the first victim of the oom killer. To avoid this, Early OOM uses **/proc/*/status** instead of **echo f > /proc/sysrq-trigger**. He also claims that triggering the oom killer manually may not work at all in latest Linux Kernel.

### Installing Early OOM

Early OOM is available in AUR, so you can install it using any AUR helper programs in Arch Linux and its derivatives.

Using [**Pacaur**][1]:
```
pacaur -S earlyoom
```

Using [**Packer**][2]:
```
packer -S earlyoom
```

Using [**Yaourt**][3]:
```
yaourt -S earlyoom
```

Enable and start Early OOM daemon:
```
sudo systemctl enable earlyoom
```
```
sudo systemctl start earlyoom
```

On other Linux distributions, compile and install it manually as shown below.
```
git clone https://github.com/rfjakob/earlyoom.git
cd earlyoom
make
sudo make install
```

### Early OOM - Kill The Largest Process In An Unresponsive Linux System

Run the following command to start Early OOM:
```
earlyoom
```

If you compiled it from source, run the following command to start Early OOM:
```
./earlyoom
```

The sample output would be:
```
earlyoom 0.12
mem total: 3863 MiB, min: 386 MiB (10 %)
swap total: 2047 MiB, min: 204 MiB (10 %)
mem avail: 1770 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1773 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1772 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1773 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1772 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1773 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1771 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1773 MiB (45 %), swap free: 2047 MiB (99 %)
mem avail: 1784 MiB (46 %), swap free: 2047 MiB (99 %)
[...]
```

As you see in the above output, Early OOM will display how much memory and swap you have, what the minimum is, how much memory is available and how much swap is free. Remember it will keep running until you manually stop by pressing CTRL+C.

If both memory and swap reaches below 10%, Early OOM will automatically kill the largest processes until the system has enough memory to run smoothly. You can also configure the minimum percentage value as per your requirement.

To set available memory minimum to PERCENT of total, run:``
```
earlyoom -m <PERCENT_HERE>
```

To set available swap minimum to PERCENT of total, run:``
```
earlyoom -s <PERCENT_HERE>
```

For more details, refer the help section.
```
$ earlyoom -h
earlyoom 0.12
Usage: earlyoom [OPTION]...

 -m PERCENT set available memory minimum to PERCENT of total (default 10 %)
 -s PERCENT set free swap minimum to PERCENT of total (default 10 %)
 -M SIZE set available memory minimum to SIZE KiB
 -S SIZE set free swap minimum to SIZE KiB
 -k use kernel oom killer instead of own user-space implementation
 -i user-space oom killer should ignore positive oom_score_adj values
 -d enable debugging messages
 -v print version information and exit
 -r INTERVAL memory report interval in seconds (default 1), set to 0 to
 disable completely
 -p set niceness of earlyoom to -20 and oom_score_adj to -1000
 -h this help text
```

Now, you don't need to worry about highest memory consumption processes. Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/kill-largest-process-unresponsive-linux-system/

作者：[Aditya Goturu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:https://www.ostechnix.com/install-pacaur-arch-linux/
[2]:https://www.ostechnix.com/install-packer-arch-linux-2/
[3]:https://www.ostechnix.com/install-yaourt-arch-linux/
