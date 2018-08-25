pinewall translating

A Collection Of More Useful Unix Utilities
======

![](https://www.ostechnix.com/wp-content/uploads/2017/08/Moreutils-720x340.png)

We all know about **GNU core utilities** that comes pre-installed with all Unix-like operating systems. These are the basic file, shell and text manipulation utilities of the GNU operating system. The GNU core utilities contains the commands, such as cat, ls, rm, mkdir, rmdir, touch, tail, wc and many more, for performing the day-to-day operations. Among these utilities, there are also some other useful collection of Unix utilities which are not included by default in the Unix-like operating systems. Meet **moreutilis** , a growing collection of more useful Unix utilities. The moreutils can be installed on GNU/Linux, and various Unix flavours such as FreeBSD, openBSD and Mac OS.


As of writing this guide, Moreutils provides the following utilities:

  * **chronic** – Runs a command quietly unless it fails.
  * **combine** – Combine the lines in two files using boolean operations.
  * **errno** – Look up errno names and descriptions.
  * **ifdata** – Get network interface info without parsing ifconfig output.
  * **ifne** – Run a program if the standard input is not empty.
  * **isutf8** – Check if a file or standard input is utf-8.
  * **lckdo** – Execute a program with a lock held.
  * **mispipe** – Pipe two commands, returning the exit status of the first.
  * **parallel** – Run multiple jobs at once.
  * **pee** – tee standard input to pipes.
  * **sponge** – Soak up standard input and write to a file.
  * **ts** – timestamp standard input.
  * **vidir** – Edit a directory in your text editor.
  * **vipe** – Insert a text editor into a pipe.
  * **zrun** – Automatically uncompress arguments to command.



### Install moreutils on Linux

The moreutils is packaged to many Linux distributions, so you can install it using the distribution’s package manager.

On **Arch Linux** and derivatives such as **Antergos** , **Manjaro Linux** , run the following command to install moreutils.
```
$ sudo pacman -S moreutils

```

On **Fedora** :
```
$ sudo dnf install moreutils

```

On **RHEL** , **CentOS** , **Scientific Linux** :
```
$ sudo yum install epel-release

$ sudo yum install moreutils

```

On **Debian** , **Ubuntu** , **Linux Mint** :
```
$ sudo apt-get install moreutils

```

### Moreutils – A Collection Of More Useful Unix Utilities

Let us see the usage details of some moreutils tools.

##### The “Combine” utility

As the name implies, the **Combine** utility of moreutils package combines the sets of lines from two files using boolean operations such as “and”, “not”, “or”, “xor”.

  * **and** – Outputs lines that are in file1 if they are also present in file2.
  * **not** – Outputs lines that are in file1 but not in file2.
  * **or** – Outputs lines that are in file1 or file2.
  * **xor** – Outputs lines that are in either file1 or file2, but not in both files.



Let me show you an example, so you can understand what exactly this utility will do . I have two files namely **file1** and **file2**. Here is the contents of the those two files.
```
$ cat file1
is
was
were
where
there

$ cat file2
is
were
there

```

Now, let me combine them using “and” boolean operation.
```
$ combine file1 and file2
is
were
there

```

As you see in the above example, the “and” Boolean operator outputs lines that are in file1 if they are also present in file2. To put this more clearly, it displays the common lines(Ex. is, were, there) which are present in both files.

Let us now use “not” operator and see the result.
```
$ combine file1 not file2
was
where

```

As you see in the above output, the “not” operator displays the lines that are only in file1, but not in file2.

##### The “ifdata” utility

The “ifdata” utility can be used to check for the existence of a network interface, to get information about the network interface, such as its IP address. Unlike the built-in commands such as “ifconfig” or “ip”, ifdata has simple to parse output that is designed to be easily used by a shell script.

To display IP address details of a network interface, say wlp9s0, run:
```
$ ifdata -p wlp9s0
192.168.43.192 255.255.255.0 192.168.43.255 1500

```

To display the netmask only, run:
```
$ ifdata -pn wlp9s0
255.255.255.0

```

To check hardware address of a NIC:
```
$ ifdata -ph wlp9s0
A0:15:46:90:12:3E

```

To check if a NIC exists or not, use “-pe” flag.
```
$ ifdata -pe wlp9s0
yes

```

##### The “Pee” command

It is somewhat similar to “tee” command.

Let us see an example of “tee” command usage.
```
$ echo "Welcome to OSTechNIx" | tee file1 file2
Welcome to OSTechNIx

```

The above command will create two files namely **file1** and **file2**. Then, append the line “Welcome to OSTechNix” on both files. And finally prints the message “Welcome to OSTechNix” in your Terminal.

The “Pee” command performs a similar function, but slightly differs from “tee” command. Look at the following command:
```
$ echo "Welcome to OSTechNIx" | pee cat cat
Welcome to OSTechNIx
Welcome to OSTechNIx

```

As you see in the above output, the two instances of “cat” command receives the output from “echo” command and displays them twice in the Terminal.

##### The “Sponge” utility

This is yet another useful utility from moreutils package. **Sponge** reads standard input and writes it out to the specified file. Unlike a shell redirect, sponge soaks up all its input before writing the output file.

Have a look at the contents of following text file.
```
$ cat file1
I
You
Me
We
Us

```

As you see, the file contains some random lines, particularly “not” in alphabetical order. You want to sort the contents in alphabetical order. What would you do?
```
$ sort file1 > file1_sorted

```

Correct, isn’t it? Of course! As you see in the above command, I have sorted the contents of the **file1** in alphabetical order and saved them in a new file called **“file1_sorted”**. But, You can do the same without creating a new (i.e file1_sorted) using “sponge” command as shown below.
```
$ sort file1 | sponge file1

```

Now, check if the contents are sorted in alphabetical order.
```
$ cat file1
I
Me
Us
We
You

```

See? we don’t need to create a new file. It’s very useful in scripting. And the good thing is sponge preserves the permissions of the output file if it already exists.

##### The “ts” utility

As the name says, “ts” command adds a timestamp to the beginning of each line of input.

Look at the following command’s output:
```
$ ping -c 2 localhost
PING localhost(localhost.localdomain (::1)) 56 data bytes
64 bytes from localhost.localdomain (::1): icmp_seq=1 ttl=64 time=0.055 ms
64 bytes from localhost.localdomain (::1): icmp_seq=2 ttl=64 time=0.079 ms

--- localhost ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1018ms
rtt min/avg/max/mdev = 0.055/0.067/0.079/0.012 ms

```

Now, run the same command with “ts” utlity as shown below.
```
$ ping -c 2 localhost | ts
Aug 21 13:32:28 PING localhost(localhost (::1)) 56 data bytes
Aug 21 13:32:28 64 bytes from localhost (::1): icmp_seq=1 ttl=64 time=0.063 ms
Aug 21 13:32:28 64 bytes from localhost (::1): icmp_seq=2 ttl=64 time=0.113 ms
Aug 21 13:32:28
Aug 21 13:32:28 --- localhost ping statistics ---
Aug 21 13:32:28 2 packets transmitted, 2 received, 0% packet loss, time 4ms
Aug 21 13:32:28 rtt min/avg/max/mdev = 0.063/0.088/0.113/0.025 ms

```

As you see in the above output, ts adds a timestamp at the beginning of each line. Here is another example.
```
$ ls -l | ts
Aug 21 13:34:25 total 120
Aug 21 13:34:25 drwxr-xr-x 2 sk users 12288 Aug 20 20:05 Desktop
Aug 21 13:34:25 drwxr-xr-x 2 sk users 4096 Aug 10 18:44 Documents
Aug 21 13:34:25 drwxr-xr-x 24 sk users 12288 Aug 21 13:06 Downloads
[...]

```

##### The “Vidir” utility

The “Vidir” utility allows you to edit the contents of a specified directory in **vi** editor (Or, whatever you have in **$EDITOR** ). If no directory is specified, it will edit your current working directory.

The following command edits the contents of the directory called “Desktop”.
```
$ vidir Desktop/

```

![vidir][2]

The above command will open the specified directory in your **vi** editor. Each item in the editing directory will contain a number. You can now edit the files as the way you do in vi editor. Say for example, delete lines to remove files from the directory, or edit filenames to rename files.

You can edit the sub directories as well. The following command edits the current working directory along with its sub-directories.
```
$ find | vidir -

```

Please note the “-” at the end of the command. If “-” is specified as the directory to edit, it reads a list of filenames from stdin and displays those for editing.

If you want to edit only the files in the current working directory, you can use the following command:
```
$ find -type f | vidir -

```

Want to edit a specific file types, say .PNG files? then you would use:
```
$ vidir *.png

```

This command edits only the .png files in the current directory.

##### The “Vipe” Utility

The “vipe” command allows you to run your default editor in the middle of a Unix pipeline and edit the data that is being piped between programs.

The following command opens the vi editor (my default editor, of course) and allows you to edit the input of the “echo” command (i.e Welcome To OSTechNix) and displays the final result.
```
$ echo "Welcome to OSTechNIx" | vipe
Hello World

```

As you see in the above output, I passed the input “Welcome to OSTechNix” to vi editor and edited them as “Hello World” and displayed the final output.

And, that’s all for now. I have covered only few utilities. The “moreutils” has more useful utilities. I already have mentioned the currently included utilities in moreutils package in the introductory section. You can read the man pages for greater detail on the above commands. Say for example, to know more about “vidir” command, run:
```
$ man vidir

```

Hope this helps. I will be soon here with another interesting and useful guide. If you find our articles helpful, please share them on your social, professional networks and support OSTechNix.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/moreutils-collection-useful-unix-utilities/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2017/08/sk@sk_001-1.png
