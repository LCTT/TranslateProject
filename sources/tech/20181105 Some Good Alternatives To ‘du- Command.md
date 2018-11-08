HankChow translating

Some Good Alternatives To ‘du’ Command
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/du-command-720x340.jpg)

As you may already know, the **“du”** command is used to compute and summarize the file and directory space usage in Unix-like systems. If you are a heavy user of du command, you will find this guide interesting! Today, I came across five good **alternatives to du** command. There could be many, but these are the ones that I am aware of at the moment. If I came across anything in future, I will add it in this list. Also, if you know any other alternatives, please let me know in the comment section below. I will review and add them in the list as well.

### 1\. Ncdu

The **Ncdu** is the popular alternative to du command in the Linux community. The developer of Ncdu is not satisfied with the performance of the du command, so he ended up creating his own. Ncdu is simple, yet fast disk usage analyzer written using **C** programming language with an **ncurses** interface to find which directories or files are taking up more space either on a local or remote systems. We already have published a detailed guide about Ncdu. Check the following link if you are interested to know more about it.

### 2\. Tin Summer

The **Tin Summer** is used to find the build artifacts that are taking up disk space. It is also an yet another good alternative for du command. Thanks to multi-threading, Tin-summer is significantly faster than du command when calculating the size of the big directories. Unlike Du command, it reads file sizes, not disk usage. Tin SUmmer is free, open source tool written using **Rust** programming language.

The developer claims Tin Summer is good alternative to du command, because,

  * It is faster on larger directories compared to du command,
  * It displays the disk usage results in human-readable format by default,
  * It uses **regex** to exclude files/directories,
  * Provides sorted and colorized output,
  * Extensible,
  * And more.



**Installing Tin Summer**

To install Tin Summer, open your Terminal and run the following command:

```
$ curl -LSfs https://japaric.github.io/trust/install.sh | sh -s -- --git vmchale/tin-summer
```

Alternatively, you can install Tin Summer using **Cargo** package manager. Make sure you have installed **Rust** on your system as described in the following link.

After installing Rust, run the following command to install Tin Summer:

```
$ cargo install tin-summer
```

If either of the above mentioned methods doesn’t not work, download the latest binary from the [**releases page**][1] and compile and install it manually.

**Usage**

To find the file sizes in a current working directory, use this command:

```
$ sn f
749 MB   ./.rustup/toolchains
749 MB   ./.rustup
147 MB   ./.cargo/bin
147 MB   ./.cargo
900 MB   .
```

See? It displays a nicer input in human-readable format by default. You need not to use any extra flags (like **-h** in du command) to get this result.

To find the file sizes in a specific directory, mention the actual path like below:

```
$ sn f <path-to-the-directory>
```

We can also sort the list in the output as well. To display the sorted list of the top 5 biggest directories, run:

```
$ sn sort /home/sk/ -n5
749 MB /home/sk/.rustup
749 MB /home/sk/.rustup/toolchains
147 MB /home/sk/.cargo
147 MB /home/sk/.cargo/bin
2.6 MB /home/sk/mcelog
900 MB /home/sk/
```

For your information, the last result in the above output is the total size of the biggest directories in the given directory i.e **/home/sk/**. So, don’t wonder why you get six results instead of 5.

To search current directory for directories with build artifacts:

```
$ sn ar
```

Tin Summer can also search for directories containing artifacts that occupy a certain size of the disk space. Say for example, to search for directories containing artifacts that occupy more than **100MB** of disk space, run:

```
$ sn ar -t100M
```

Like already mentioned, Tin Summer is faster on larger directories, but it is also slower on small ones. However, the developer assures he will find a way to fix this in the future releases!

To get help, run:

```
$ sn --help
```

For more details, check the project’s GitHub repository given at the end of this guide.

### 3\. Dust

**Dust** (du+rust=dust) is more intuitive version of du utility. It will give us an instant overview of which directories are occupying the disk space without having to use **head** or **sort** commands. Like Tin Summer, it also displays the size of each directory in human-readable format by default. It is free, open source and written using **Rust** programming language.

**Installing Dust**

Since the dust utility is written in Rust, It can be installed using “cargo” package manager like below.

```
$ cargo install du-dust
```

Alternatively, you can download the latest binary from the [**releases page**][2] and install it as shown below. As of writing this guide, the latest version was **0.3.1**.

```
$ wget https://github.com/bootandy/dust/releases/download/v0.3.1/dust-v0.3.1-x86_64-unknown-linux-gnu.tar.gz
```

Extract the download file:

```
$ tar -xvf dust-v0.3.1-x86_64-unknown-linux-gnu.tar.gz
```

Finally, copy the executable file to your $PATH, for example **/usr/local/bin**.

```
$ sudo mv dust /usr/local/bin/
```

**Usage**

To find the total file sizes in the current directory and its sub-directories, run:

```
$ dust
```

Sample output:

![](http://www.ostechnix.com/wp-content/uploads/2018/11/dust-1.png)

We can also get the full path of all directories using **-p** flag.

```
$ dust -p
```

![dust 2][4]

To get the total size of multiple directories, just mention them with space-separated:

```
$ dust <dir1> <dir2>
```

Here are some more examples.

Show the apparent size of the files:

```
$ dust -s
```

Show particular number of directories only:

```
$ dust -n 10
```

Show 3 levels of sub-directories in the current directory:

```
$ dust -d 3
```

For help, run:

```
$ dust -h
```

For more details, refer the project’s GitHub page given at the end.

### 4\. Diskus

**Diskus** It is a simple and fast alternative command line utility to `du -sh`command. The diskus utility computes the total file size of the current directory. It is a parallelized version of `du -sh` or rather `du -sh --bytes` command. The developer of diskus utility claims that it is about **nine times faster** compared to ‘du -sh’. Diskus is minimal, fast and open source program written in **Rust** programming language.

**Installing diskus**

The diskus utility is available in [**AUR**][5], so you can install it on Arch-based systems using any AUR helper programs, for example [**Yay**][6] , as shown below.

```
$ yay -S diskus
```

On Ubuntu and its derivatives, download the latest diskus utility from the [**releases page**][7] and install it as shown below.

```
$ wget "https://github.com/sharkdp/diskus/releases/download/v0.3.1/diskus_0.3.1_amd64.deb"

$ sudo dpkg -i diskus_0.3.1_amd64.deb
```

Alternatively, you can install diskus using **Cargo** package manager. Make sure you have installed **Rust 1.29** or higher on your system as described in the link given above in “Installing Tin Summer” section.

Once you have Rust on your system, run the following command to install diskus:

```
$ cargo install diskus
```

**Usage**

Usually, when I want to check the total disk space used by a particular directory, I use the **-sh** flags with **du** command as shown below.

```
$ du -sh dir
```

Here, **-s** flag indicates summary.

Using Diskus tool, I find the total size of current working directory with command:

```
$ diskus
```

![](https://www.ostechnix.com/wp-content/uploads/2018/11/diskus-in-action.png)

I tested diskus to compute the total size of different directories in my Arch Linux system. The speed of computing the total size of the directory is pretty impressive! I must admit that this utility is quite faster than ‘du -sh’. Please be mindful that it can find the size of the current directory only at the moment.

For getting help, run:

```
$ diskus -h
```

For more details about Diskus, refer the official GitHub page (link at the end).

**Suggested read:**

### 5\. Duu

**Duu** , short for **D** irectory **U** sage **U** tility, is another tool to find the disk usage of given directory. It is a cross-platform, so you can use it on Windows, Mac OS and Linux operating systems. It is written in **Python** programming language.

**Installing Duu**

Make sure you have installed Python3. Python3 is available in the default repositories of most Linux distributions, so the installation wouldn’t be a problem.

Once Python3 is installed, download the latest Duu version from the official [**releases page**][8].

```
$ wget https://github.com/jftuga/duu/releases/download/2.20/duu.py
```

**Usage**

To find the disk space occupied by the current working directory, simply run:

```
$ python3 duu.py
```

Sample output:

![](https://www.ostechnix.com/wp-content/uploads/2018/11/duu.png)

As you can see in the above output, Duu utility will display a nice summary of total number of files and directories and their total size in bytes, KB and MB. It will also display the total size of each item.

To display the total disk usage of a specific directory, just mention the full path like below:

```
$ python3 duu.py /home/sk/Downloads/
```

For more details, refer Duu github page included at the end.

And, that’s all for now. Hope this was useful. You know now five alternatives to du command. Personally, I prefer Ncdu over all of them given in this guide. Now is your turn. Give them a try and let us know your thoughts on these tools in the comment section below.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/some-good-alternatives-to-du-command/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://github.com/vmchale/tin-summer/releases
[2]: https://github.com/bootandy/dust/releases
[3]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]: http://www.ostechnix.com/wp-content/uploads/2018/11/dust-2.png
[5]: https://aur.archlinux.org/packages/diskus-bin/
[6]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[7]: https://github.com/sharkdp/diskus/releases
[8]: https://github.com/jftuga/duu/releases
