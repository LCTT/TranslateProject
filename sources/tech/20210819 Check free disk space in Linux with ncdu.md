[#]: subject: "Check free disk space in Linux with ncdu"
[#]: via: "https://opensource.com/article/21/8/ncdu-check-free-disk-space-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Check free disk space in Linux with ncdu
======
Get an interactive report about disk usage with the ncdu Linux command.
![Check disk usage][1]

Computer users tend to amass a lot of data over the years, whether it's important personal projects, digital photos, videos, music, or code repositories. While hard drives tend to be pretty big these days, sometimes you have to step back and take stock of what you're actually storing on your drives. The classic Linux commands [` df`][2] and [` du`][3] are quick ways to gain insight about what's on your drive, and they provide a reliable report that's easy to parse and process. That's great for scripting and processing, but the human brain doesn't always respond well to hundreds of lines of raw data. In recognition of this, the `ncdu` command aims to provide an interactive report about the space you're using on your hard drive.

### Installing ncdu on Linux

On Linux, you can install `ncdu` from your software repository. For instance, on Fedora or CentOS:


```
`$ sudo dnf install ncdu`
```

On BSD, you can use [pkgsrc][4].

On macOS, you can install from [MacPorts][5] or [HomeBrew][6].

Alternately, you can [compile ncdu from source code][7].

### Using ncdu

The interface of `ncdu` uses the ncurses library, which turns your terminal window into a rudimentary graphical application so you can use the Arrow keys to navigate visual menus.

![ncdu interface][8]

CC BY-SA Seth Kenlon

That's one of the main appeals of `ncdu`, and what sets it apart from the original `du` command.

To get a complete listing of a directory, launch `ncdu`. It defaults to the current directory.


```
$ ncdu
ncdu 1.16 ~ Use the arrow keys to navigate, press ? for help                                                                  
\--- /home/tux -----------------------------------------------
   22.1 GiB [##################] /.var                                                                                        
   19.0 GiB [###############   ] /Iso
   10.0 GiB [########          ] /.local
    7.9 GiB [######            ] /.cache
    3.8 GiB [###               ] /Downloads
    3.6 GiB [##                ] /.mail
    2.9 GiB [##                ] /Code
    2.8 GiB [##                ] /Documents
    2.3 GiB [#                 ] /Videos
[...]
```

The listing shows the largest directory first (in this example, that's the `~/.var` directory, full of many many flatpaks).

Using the Arrow keys on your keyboard, you can navigate through the listing to move deeper into a directory so you can gain better insight into what's taking up the most space.

### Get the size of a specific directory

You can run `ncdu` on an arbitrary directory by providing the path of a folder when launching it:


```
`$ ncdu ~/chromiumos`
```

### Excluding directories

By default, `ncdu` includes everything it can, including symbolic links and pseudo-filesystems such as procfs and sysfs. `You can` exclude these with the `--exclude-kernfs`.

You can exclude arbitrary files and directories using the --exclude option, followed by a pattern to match.


```
$ ncdu --exclude ".var"
   19.0 GiB [##################] /Iso                                                                                          
   10.0 GiB [#########         ] /.local
    7.9 GiB [#######           ] /.cache
    3.8 GiB [###               ] /Downloads
[...]
```

Alternately, you can list files and directories to exclude in a file, and cite the file using the `--exclude-from` option:


```
$ ncdu --exclude-from myexcludes.txt /home/tux                                                                                    
   10.0 GiB [#########         ] /.local
    7.9 GiB [#######           ] /.cache
    3.8 GiB [###               ] /Downloads
[...]
```

### Color scheme

You can add some color to ncdu with the `--color dark` option.

![ncdu color scheme][9]

CC BY-SA Seth Kenlon

### Including symlinks

The `ncdu` output treats symlinks literally, meaning that a symlink pointing to a 9 GB file takes up just 40 bytes.


```
$ ncdu ~/Iso
    9.3 GiB [##################]  CentOS-Stream-8-x86_64-20210427-dvd1.iso                                                    
@   0.0   B [                  ]  fake.iso
```

You can force ncdu to follow symlinks with the `--follow-symlinks` option:


```
$ ncdu --follow-symlinks ~/Iso
    9.3 GiB [##################]  fake.iso                                                                                    
    9.3 GiB [##################]  CentOS-Stream-8-x86_64-20210427-dvd1.iso
```

### Disk usage

It's not fun to run out of disk space, so monitoring your disk usage is important. The `ncdu` command makes it easy and interactive. Try `ncdu` the next time you're curious about what you've got stored on your PC, or just to explore your filesystem in a new way.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/ncdu-check-free-disk-space-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/du-splash.png?itok=nRLlI-5A (Check disk usage)
[2]: https://opensource.com/article/21/7/check-disk-space-linux-df
[3]: https://opensource.com/article/21/7/check-disk-space-linux-du
[4]: https://opensource.com/article/19/11/pkgsrc-netbsd-linux
[5]: https://opensource.com/article/20/11/macports
[6]: https://opensource.com/article/20/6/homebrew-mac
[7]: https://dev.yorhel.nl/ncdu
[8]: https://opensource.com/sites/default/files/ncdu.jpg (ncdu interface)
[9]: https://opensource.com/sites/default/files/ncdu-dark.jpg (ncdu color scheme)
