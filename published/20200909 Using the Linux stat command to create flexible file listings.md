[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12637-1.html)
[#]: subject: (Using the Linux stat command to create flexible file listings)
[#]: via: (https://www.networkworld.com/article/3573802/using-the-linux-stat-command-to-create-flexible-file-listings.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

使用 Linux stat 命令创建灵活的文件列表
======

![](https://img.linux.net.cn/data/attachment/album/202009/21/223030wi3xfx2eprij13z2.jpg)

`stat` 命令提供了很多关于文件的详细信息。

它不仅提供了文件最近变化的日期/时间，还显示了最近访问文件的时间和权限变化。它可以同时告诉你文件的字节大小和块的数量。它可以显示文件使用的 inode 以及文件类型。它包括了文件所有者和相关用户组的名称和 UID/GID。它以 “rwx”（被称为 “人类可读” 格式）和数字方式显示文件权限。在某些系统中，它甚至可能包括文件创建的日期和时间（称为“出生”）。

除了提供所有这些信息外，`stat` 命令还可以用来创建文件列表。这些列表非常灵活，你可以选择包含上述任何或全部信息。

要生成一个自定义列表，你只需要使用 `stat` 命令的 `-c`（或 `--format`）选项，并指定你想要包含的字段。例如，要创建一个以两种格式显示文件权限的列表，使用这个命令：

```
$ stat -c '%n %a %A' my*
my.banner 664 -rw-rw-r--
mydir 775 drwxrwxr-x
myfile 664 -rw-rw-r--
myjunk 777 lrwxrwxrwx
mykey 664 -rw-rw-r--
mylog 664 -rw-rw-r--
myscript 755 -rwxr-xr-x
mytext 664 -rw-rw-r--
mytext.bak 664 -rw-rw-r--
mytwin 50 -rw-r-----
mywords 664 -rw-rw-r--
```

如上例所示，`%n` 代表文件名，`%a` 代表八进制的权限，`%A` 代表 `rwx` 形式的权限。完整的列表如后面所示。

要为这个命令创建一个别名，输入这个命令，或在 `.bashrc` 文件中添加这个定义。

```
$ alias ls_perms="stat -c '%n %a %A'"
```

要创建一个非常接近 `ls -l` 提供的长列表，可以这样做：

```
$ stat -c '%A %h %U %G %s %y %n' my*
-rw-rw-r-- 1 shs shs 255 2020-04-01 16:20:00.899374215 -0400 my.banner
drwxrwxr-x 2 shs shs 4096 2020-09-07 12:50:20.224470760 -0400 mydir
-rw-rw-r-- 1 shs shs 6 2020-05-16 11:12:00.460355387 -0400 myfile
lrwxrwxrwx 1 shs shs 11 2020-05-28 18:49:21.666792608 -0400 myjunk
-rw-rw-r-- 1 shs shs 655 2020-01-14 15:56:08.540540488 -0500 mykey
-rw-rw-r-- 1 shs shs 8 2020-03-04 17:13:21.406874246 -0500 mylog
-rwxr-xr-x 1 shs shs 201 2020-09-07 12:50:41.316745867 -0400 myscript
-rw-rw-r-- 1 shs shs 40 2019-06-06 08:54:09.538663323 -0400 mytext
-rw-rw-r-- 1 shs shs 24 2019-06-06 08:48:59.652712578 -0400 mytext.bak
-rw-r----- 2 shs shs 228 2019-04-12 19:37:12.790284604 -0400 mytwin
-rw-rw-r-- 1 shs shs 1983 2020-08-10 14:39:57.164842370 -0400 mywords
```

不同之处包括： 1、不试图将字段排成可辨认的一列，2、日期是 `yy-mm-dd` 格式，3、时间字段更精确，4、增加了时区（-0400 是 EDT）。

如果你想根据最后一次访问的日期来列出文件（例如，用 `cat` 命令来显示），使用这样的命令：

```
$ stat -c '%n %x' my* | sort -k2
mytwin 2019-04-22 11:25:20.656828964 -0400
mykey 2020-08-20 16:10:34.479324431 -0400
mylog 2020-08-20 16:10:34.527325066 -0400
myfile 2020-08-20 16:10:57.815632794 -0400
mytext.bak 2020-08-20 16:10:57.935634379 -0400
mytext 2020-08-20 16:15:42.323391985 -0400
mywords 2020-08-20 16:15:43.479407259 -0400
myjunk 2020-09-07 10:04:26.543980300 -0400
myscript 2020-09-07 12:50:41.312745815 -0400
my.banner 2020-09-07 13:22:38.105826116 -0400
mydir 2020-09-07 14:53:10.171867194 -0400
```

用 `stat` 列出文件细节时，可用的选项包括：

  * `%a` - 八进制的访问权限（注意 `#` 和 `0` 的 printf 标志）
  * `%A` – 人类可读的访问权限
  * `%b` – 分配的块数（见 `%B`）
  * `%B` – `%b` 报告的每个块的字节数
  * `%C` – SELinux 安全上下文字符串
  * `%d` – 十进制的设备编号
  * `%D` – 十六进制的设备编号
  * `%f` – 十六进制的原始模式
  * `%F` – 文件类型
  * `%g` – 所有者的组 ID
  * `%G` – 所有者的组名
  * `%h` – 硬链接的数量
  * `%i` – inode 编号
  * `%m` – 挂载点
  * `%n` – 文件名
  * `%N` – 如果是符号链接，会解引用为指向的文件名
  * `%o` – 最佳 I/O 传输大小提示
  * `%s` – 以字节为单位的总大小
  * `%t` – 十六进制的主要设备类型，用于字符/块设备特殊文件
  * `%T` – 十六进制的次要设备类型，用于字符/块设备特殊文件
  * `%u` – 所有者的用户 ID
  * `%U` – 所有者的用户名
  * `%w` – 文件创建时间，以人类可读形式； 如果未知，则为 `-`。
  * `%W` – 文件创建时间，以 UNIX 纪元以来的秒数形式；如果未知，则为 `0`。
  * `%x` – 上次访问时间，以人类可读形式
  * `%X` – 上次访问时间，以 UNIX 纪元以来的秒数形式
  * `%y` – 上次数据修改时间，以人类可读形式
  * `%Y` – 上次数据修改时间，以 UNIX 纪元以来的秒数形式
  * `%z` – 上次状态改变的时间，以人类可读形式
  * `%Z` – 上次状态改变的时间，以 UNIX 纪元以来的秒数形式

这些字段的选择都列在手册页中，你可以选择任何一个，不过用你喜欢的选项创建一些别名应该可以省去很多麻烦。有些选项，如 SELinux 安全上下文字符串，除非在系统中有使用，它将不可用。文件创建时间只有在你的系统保留该信息的情况下才可用。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3573802/using-the-linux-stat-command-to-create-flexible-file-listings.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
