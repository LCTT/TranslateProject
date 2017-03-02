在 Linux 系统下从 ISO 镜像中提取和复制文件的 3 种方法
============================================================

假设你的 Linux 服务器上有一个超大的 ISO 镜像文件，你想要打开它，然后提取或者复制其中的一个文件。你会怎么做呢？

其实在 Linux 系统里，有很多方法来实现这个要求。

比如说，你可以使用传统的 mount 命令以只读方式把 ISO 镜像文件加载为 loop 设备，然后再把文件复制到另一个目录。

### 在 Linux 系统下提取 ISO 镜像文件

为了完成该测试，你得有一个 ISO 镜像文件（我使用 ubuntu-16.10-server-amd64.iso 系统镜像文件）以及用于挂载和提取 ISO 镜像文件的目录。

首先，使用如下命令创建一个挂载目录来挂载 ISO 镜像文件：

```
$ sudo mkdir /mnt/iso
```

目录创建完成后，你就可以运行如下命令很容易地挂载 ubuntu-16.10-server-amd64.iso 系统镜像文件，并查看其中的内容。

```
$ sudo mount -o loop ubuntu-16.10-server-amd64.iso /mnt/iso
$ ls /mnt/iso/
```
[
 ![Mount ISO File in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Mount-ISO-File-in-Linux.png) 
][1]

*在 Linux 系统里挂载 ISO 镜像*

现在你就可以进入到挂载目录 /mnt/iso 里，查看文件或者使用 [cp 命令][2]把文件复制到 /tmp 目录了。

```
$ cd /mnt/iso
$ sudo cp md5sum.txt /tmp/
$ sudo cp -r ubuntu /tmp/
```
[
 ![Copy Files From ISO File in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Copy-Files-From-ISO-File-in-Linux.png) 
][3]

*在 Linux 系统中复制 ISO 镜像里的文件*

注意：`-r` 选项用于递归复制目录里的内容。如有必要，你也可以[监控复制命令的完成进度][4]。

### 使用 7zip 命令提取 ISO 镜像里的内容

如果不想挂载 ISO 镜像，你可以简单地安装一个 7zip 工具，这是一个自由而开源的解压缩软件，用于压缩或解压不同类型格式的文件，包括 TAR、XZ、GZIP、ZIP、BZIP2 等等。

```
$ sudo apt-get install p7zip-full p7zip-rar [On Debian/Ubuntu systems]
$ sudo yum install p7zip p7zip-plugins      [On CentOS/RHEL systems]
```

7zip 软件安装完成后，你就可以使用`7z` 命令提取 ISO 镜像文件里的内容了。

```
$ 7z x ubuntu-16.10-server-amd64.iso
```
[
 ![7zip - Extract ISO File Content in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Extract-ISO-Content-in-Linux.png) 
][5]

*使用 7zip 工具在 Linux 系统下提取 ISO 镜像里的文件*

注意：跟 Linux 的 mount 命令相比起来，7zip 在压缩和解压缩任何格式的文件时速度更快，更智能。

### 使用 isoinfo 命令来提取 ISO 镜像文件内容

虽然 `isoinfo` 命令是用来以目录的形式列出 iso9660 镜像文件的内容，但是你也可以使用该程序来提取文件。

我说过，isoinfo 程序会显示目录列表，因此先列出 ISO 镜像文件的内容。

```
$ isoinfo -i ubuntu-16.10-server-amd64.iso -l
```
[
 ![List ISO Content in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/List-ISO-Content-in-Linux.png) 
][6]

*Linux 里列出 ISO 文件的内容*

现在你可以按如下的方式从 ISO 镜像文件中提取单文件：

```
$ isoinfo -i ubuntu-16.10-server-amd64.iso -x MD5SUM.TXT > MD5SUM.TXT
```

注意：因为 `-x` 解压到标准输出，必须使用重定向来提取指定文件。

[
 ![Extract Single File from ISO in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Extract-Single-File-from-ISO-in-Linux.png) 
][7]

*从 ISO 镜像文件中提取单个文件*

就到这里吧，其实还有很多种方法来实现这个要求，如果你还知道其它有用的命令或工具来提取复制出 ISO 镜像文件中的文件，请在下面的评论中跟大家分享下。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/extract-files-from-iso-files-linux

作者：[Ravi Saive][a]
译者：[rusking](https://github.com/rusking)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/wp-content/uploads/2016/10/Mount-ISO-File-in-Linux.png
[2]:http://www.tecmint.com/advanced-copy-command-shows-progress-bar-while-copying-files/
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Copy-Files-From-ISO-File-in-Linux.png
[4]:http://www.tecmint.com/monitor-copy-backup-tar-progress-in-linux-using-pv-command/
[5]:http://www.tecmint.com/wp-content/uploads/2016/10/Extract-ISO-Content-in-Linux.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/10/List-ISO-Content-in-Linux.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Extract-Single-File-from-ISO-in-Linux.png