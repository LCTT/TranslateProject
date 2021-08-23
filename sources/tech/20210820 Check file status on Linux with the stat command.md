[#]: subject: "Check file status on Linux with the stat command"
[#]: via: "https://opensource.com/article/21/8/linux-stat-file-status"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Check file status on Linux with the stat command
======
All the information you need about any file or file system is just one
Linux command away.
![Hand putting a Linux file folder into a drawer][1]

The `stat` command, included in the GNU `coreutils` package, provides a variety of metadata, including file size, inode location, access permissions and SELinux context, and creation and modification times, about files and filesystems. It's a convenient way to gather information that you usually need several different commands to acquire.

### Installing stat on Linux

On Linux, you probably already have the `stat` command installed because it's part of a core utility package that's generally bundled with Linux distributions by default.

In the event that you don't have `stat` installed, you can install `coreutils` with your package manager.

Alternately, you can [compile coreutils from source code][2].

### Getting the status of a file

Running `stat` provides easy to read output about a specific file or directory.


```
$ stat planets.xml
  File: planets.xml
  Size: 325      Blocks: 8     IO Block: 4096   regular file
Device: fd03h/64771d    Inode: 140217      Links: 1
Access: (0664/-rw-rw-r--)  Uid: (1000/tux)   Gid: (100/users)
Context: unconfined_u:object_r:user_home_t:s0
Access: 2021-08-17 18:26:57.281330711 +1200
Modify: 2021-08-17 18:26:58.738332799 +1200
Change: 2021-08-17 18:26:58.738332799 +1200
 Birth: 2021-08-17 18:26:57.281330711 +1200
```

It may be easy to read, but it's still a lot of information. Here's what `stat` is covering:

  * **File**: the file name
  * **Size**: the file size in bytes
  * **Blocks**: the number of blocks on the hard drive reserved for this file
  * **IO Block**: the size of a block of the filesystem
  * **regular file**: the type of file (regular file, directory, filesystem)
  * **Device**: the device where the file is located
  * **Inode**: the inode number where the file is located
  * **Links**: the number of links to the file
  * **Access, UID, GID**: file permissions, user, and group owner
  * **Context**: SELinux context
  * **Access, Modify, Change, Birth**: the timestamp of when the file was accessed, modified, changed status, and created



### Terse output

For people who know the output well, or want to parse the output with other utilities like [awk][3], there's the `--terse` (`-t` for short) option, which formats the output without headings or line breaks.


```
$ stat --terse planets.xml
planets.xml 325 8 81b4 100977 100 fd03 140217 1 0 0 1629181617 1629181618 1629181618 1629181617 4096 unconfined_u:object_r:user_home_t:s0
```

### Choosing your own format

You can define your own format for output using the `--printf` option and a syntax similar to [printf][4]. Each attribute reported by `stat` has a format sequence (`%C` for SELinux context, `%n` for file name, and so on), so you can choose what you want to see in a report.


```
$ stat --printf="%n\n%C\n" planets.xml
planets.xml
unconfined_u:object_r:user_home_t:s0
$ $ stat --printf="Name: %n\nModified: %y\n" planets.xml
Name: planets.xml
Modified: 2021-08-17 18:26:58.738332799 +1200
```

Here are some common format sequences:

  * **%a** access rights
  * **%F** file type
  * **%n** file name
  * **%U** user name
  * **%u** user ID
  * **%g** group ID
  * **%w** time of birth
  * **%y** modification time



A full listing of format sequences is available in the `stat` man page and the `coreutils` info pages.

### File information

If you've ever tried to parse the output of `ls -l`, then you'll appreciate the flexibility of the `stat` command. You don't always need every bit of the default information that `stat` provides, but the command is invaluable when you do need some or all of it. Whether you read its output in its default format, or you create your own queries, the `stat` command gives you easy access to the data about your data.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-stat-file-status

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://www.gnu.org/software/coreutils/
[3]: https://opensource.com/article/20/9/awk-ebook
[4]: https://opensource.com/article/20/8/printf
