17 个 tar 命令实用示例
=====

Tar（Tape ARchive，磁带归档的缩写，LCTT 译注：最初设计用于将文件打包到磁带上，现在我们大都使用它来实现备份某个分区或者某些重要的目录）是类 Unix 系统中使用最广泛的命令，用于归档多个文件或目录到单个归档文件中，并且归档文件可以进一步使用 gzip 或者 bzip2 等技术进行压缩。换言之，tar 命令也可以用于备份：先是归档多个文件和目录到一个单独的 tar 文件或归档文件，然后在需要之时将 tar 文件中的文件和目录释放出来。

本文将介绍 tar 的 17 个实用示例。

tar 命令语法如下：

```
# tar <选项> <文件>
```

下面列举 tar 命令中一些常用的选项：

> --delete : 从归档文件 (而非磁带) 中删除

> -r, --append : 将文件追加到归档文件中

> -t, --list : 列出归档文件中包含的内容

> --test-label : 测试归档文件卷标并退出

> -u, --update : 将已更新的文件追加到归档文件中

> -x, --extract, --get : 释放归档文件中文件及目录

> -C, --directory=DIR : 执行归档动作前变更工作目录到 DIR

> -f, --file=ARCHIVE : 指定 (将要创建或已存在的) 归档文件名

> -j, --bip2 : 对归档文件使用 bzip2 压缩

> -J, --xz : 对归档文件使用 xz 压缩

> -p, --preserve-permissions : 保留原文件的访问权限

> -v, --verbose : 显示命令整个执行过程

> -z, gzip : 对归档文件使用 gzip 压缩


注 : 在 tar 命令选项中的连接符 `-` 是可选的（LCTT 译注：不用 `-` 也没事。这在 GNU 软件里面很罕见，大概是由于 tar 命令更多受到古老的 UNIX 风格影响）。

### 示例 1：创建一个 tar 归档文件

现在来创建一个 tar 文件，将 /etc/ 目录和 /root/anaconda-ks.cfg 文件打包进去。

```
[root@linuxtechi ~]# tar -cvf myarchive.tar /etc /root/anaconda-ks.cfg
```

以上命令会在当前目录创建一个名为 "myarchive" 的 tar 文件，内含 /etc/ 目录和 /root/anaconda-ks.cfg 文件。

其中，`-c` 选项表示要创建 tar 文件，`-v` 选项用于输出 tar 的详细过程到屏幕上，`-f` 选项则是指定归档文件名称。

```
[root@linuxtechi ~]# ls -l myarchive.tar
-rw-r--r--. 1 root root 22947840 Sep 7 00:24 myarchive.tar
[root@linuxtechi ~]#
```

### 示例 2：列出归档文件中的内容

在 tar 命令中使用 `–t` 选项可以不用释放其中的文件就可以快速列出文件中包含的内容。

```
[root@linuxtechi ~]# tar -tvf myarchive.tar
```

列出 tar 文件中的指定的文件和目录。下列命令尝试查看 anaconda-ks.cfg 文件是否存在于 tar 文件中。

```
[root@linuxtechi ~]# tar -tvf myarchive.tar root/anaconda-ks.cfg
-rw------- root/root 953 2016-08-24 01:33 root/anaconda-ks.cfg
[root@linuxtechi ~]#
```

### 示例 3：追加文件到归档（tar）文件中

`-r` 选项用于向已有的 tar 文件中追加文件。下面来将 /etc/fstab 添加到 data.tar 中。

```
[root@linuxtechi ~]# tar -rvf data.tar /etc/fstab
```

注：在压缩过的 tar 文件中无法进行追加文件操作。

### 示例 4：从 tar 文件中释放文件以及目录

`-x` 选项用于释放出 tar 文件中的文件和目录。下面来释放上边创建的 tar 文件中的内容。

```
[root@linuxtechi ~]# tar -xvf myarchive.tar
```

这个命令会在当前目录中释放出 myarchive.tar 文件中的内容。

### 示例 5：释放 tar 文件到指定目录

假如你想要释放 tar 文件中的内容到指定的文件夹或者目录，使用 `-C` 选项后边加上指定的文件的路径。

```
[root@linuxtechi ~]# tar -xvf myarchive.tar -C /tmp/
```

### 示例 6：释放 tar 文件中的指定文件或目录

假设你只要释放 tar 文件中的 anaconda-ks.cfg 到 /tmp 目录。

语法如下：

```
# tar –xvf {tar-file } {file-to-be-extracted } -C {path-where-to-extract}

[root@linuxtechi tmp]# tar -xvf /root/myarchive.tar root/anaconda-ks.cfg -C /tmp/
root/anaconda-ks.cfg
[root@linuxtechi tmp]# ls -l /tmp/root/anaconda-ks.cfg
-rw-------. 1 root root 953 Aug 24 01:33 /tmp/root/anaconda-ks.cfg
[root@linuxtechi tmp]#
```

### 示例 7：创建并压缩归档文件（.tar.gz 或 .tgz）

假设我们需要打包 /etc 和 /opt 文件夹，并用 gzip 工具将其压缩。可以在 tar 命令中使用 `-z` 选项来实现。这种 tar 文件的扩展名可以是 .tar.gz 或者 .tgz。

```
[root@linuxtechi ~]# tar -zcpvf myarchive.tar.gz /etc/ /opt/
```

或

```
[root@linuxtechi ~]# tar -zcpvf myarchive.tgz /etc/ /opt/
```

### 示例 8：创建并压缩归档文件（.tar.bz2 或 .tbz2）

假设我们需要打包 /etc 和 /opt 文件夹，并使用 bzip2 压缩。可以在 tar 命令中使用 `-j` 选项来实现。这种 tar 文件的扩展名可以是 .tar.bz2 或者 .tbz。

```
[root@linuxtechi ~]# tar -jcpvf myarchive.tar.bz2 /etc/ /opt/
```

或

```
[root@linuxtechi ~]# tar -jcpvf myarchive.tbz2 /etc/ /opt/
```

### 示例 9：排除指定文件或类型后创建 tar 文件

创建 tar 文件时在 tar 命令中使用 `–exclude` 选项来排除指定文件或者类型。假设在创建压缩的 tar 文件时要排除 .html 文件。

```
[root@linuxtechi ~]# tar -zcpvf myarchive.tgz /etc/ /opt/ --exclude=*.html
```

### 示例 10：列出 .tar.gz 或 .tgz 文件中的内容

使用 `-t` 选项可以查看 .tar.gz 或 .tgz 文件中内容。如下：

```
[root@linuxtechi ~]# tar -tvf myarchive.tgz  | more
.............................................
drwxr-xr-x root/root         0 2016-09-07 08:41 etc/
-rw-r--r-- root/root       541 2016-08-24 01:23 etc/fstab
-rw------- root/root         0 2016-08-24 01:23 etc/crypttab
lrwxrwxrwx root/root         0 2016-08-24 01:23 etc/mtab -> /proc/self/mounts
-rw-r--r-- root/root       149 2016-09-07 08:41 etc/resolv.conf
drwxr-xr-x root/root         0 2016-09-06 03:55 etc/pki/
drwxr-xr-x root/root         0 2016-09-06 03:15 etc/pki/rpm-gpg/
-rw-r--r-- root/root      1690 2015-12-09 04:59 etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
-rw-r--r-- root/root      1004 2015-12-09 04:59 etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Debug-7
-rw-r--r-- root/root      1690 2015-12-09 04:59 etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Testing-7
-rw-r--r-- root/root      3140 2015-09-15 06:53 etc/pki/rpm-gpg/RPM-GPG-KEY-foreman
..........................................................
```

### 示例 11：列出 .tar.bz2 或 .tbz2 文件中的内容

使用 `-t` 选项可以查看 .tar.bz2 或 .tbz2 文件中内容。如下：

```
[root@linuxtechi ~]# tar -tvf myarchive.tbz2  | more
........................................................
rwxr-xr-x root/root         0 2016-08-24 01:25 etc/pki/java/
lrwxrwxrwx root/root         0 2016-08-24 01:25 etc/pki/java/cacerts -> /etc/pki/ca-trust/extracted/java/cacerts
drwxr-xr-x root/root         0 2016-09-06 02:54 etc/pki/nssdb/
-rw-r--r-- root/root     65536 2010-01-12 15:09 etc/pki/nssdb/cert8.db
-rw-r--r-- root/root      9216 2016-09-06 02:54 etc/pki/nssdb/cert9.db
-rw-r--r-- root/root     16384 2010-01-12 16:21 etc/pki/nssdb/key3.db
-rw-r--r-- root/root     11264 2016-09-06 02:54 etc/pki/nssdb/key4.db
-rw-r--r-- root/root       451 2015-10-21 09:42 etc/pki/nssdb/pkcs11.txt
-rw-r--r-- root/root     16384 2010-01-12 15:45 etc/pki/nssdb/secmod.db
drwxr-xr-x root/root         0 2016-08-24 01:26 etc/pki/CA/
drwxr-xr-x root/root         0 2015-06-29 08:48 etc/pki/CA/certs/
drwxr-xr-x root/root         0 2015-06-29 08:48 etc/pki/CA/crl/
drwxr-xr-x root/root         0 2015-06-29 08:48 etc/pki/CA/newcerts/
drwx------ root/root         0 2015-06-29 08:48 etc/pki/CA/private/
drwx------ root/root         0 2015-11-20 06:34 etc/pki/rsyslog/
drwxr-xr-x root/root         0 2016-09-06 03:44 etc/pki/pulp/
..............................................................
```

### 示例 12：解压 .tar.gz 或 .tgz 文件

使用 `-x` 和 `-z` 选项来解压 .tar.gz 或 .tgz 文件。如下：

```
[root@linuxtechi ~]# tar -zxpvf myarchive.tgz -C /tmp/
```

以上命令将 tar 文件解压到 /tmp 目录。

注：现今的 tar 命令会在执行解压动作前自动检查文件的压缩类型，这意味着我们在使用 tar 命令是可以不用指定文件的压缩类型。如下：

```
[root@linuxtechi ~]# tar -xpvf myarchive.tgz -C /tmp/
```

### 示例 13：解压 .tar.bz2 或 .tbz2 文件

使用 `-j` 和 `-x` 选项来解压 .tar.bz2 或 .tbz2 文件。如下：

```
[root@linuxtechi ~]# tar -jxpvf myarchive.tbz2 -C /tmp/
```

或

```
[root@linuxtechi ~]# tar xpvf myarchive.tbz2 -C /tmp/
```

### 示例 14：使用 tar 命令进行定时备份

总有一些实时场景需要我们对指定的文件和目录进行打包，已达到日常备份的目的。假设需要每天备份整个 /opt 目录，可以创建一个带 tar 命令的 cron 任务来完成。如下：

```
[root@linuxtechi ~]# tar -zcvf optbackup-$(date +%Y-%m-%d).tgz /opt/
```

为以上命令创建一个 cron 任务即可。

### 示例 15：使用 -T 及 -X 创建压缩归档文件

想像这样一个场景：把想要归档和压缩的文件及目录记录到到一个文件，然后把这个文件当做 tar 命令的传入参数来完成归档任务；而有时候则是需要排除上面提到的这个文件里面记录的特定路径后进行归档和压缩。

在 tar 命令中使用 `-T` 选项来指定该输入文件，使用 `-X` 选项来指定包含要排除的文件列表。

假设要归档 /etc、/opt、/home 目录，并排除 /etc/sysconfig/kdump 和 /etc/sysconfig/foreman 文件，可以创建 /root/tar-include 和 /root/tar-exclude 然后分别输入以下内容：

```
[root@linuxtechi ~]# cat /root/tar-include
/etc
/opt
/home
[root@linuxtechi ~]#
[root@linuxtechi ~]# cat /root/tar-exclude
/etc/sysconfig/kdump
/etc/sysconfig/foreman
[root@linuxtechi ~]#
```

运行以下命令来创建一个压缩归档文件。

```
[root@linuxtechi ~]# tar zcpvf mybackup-$(date +%Y-%m-%d).tgz -T /root/tar-include -X /root/tar-exclude
```

### 示例 16：查看 .tar、.tgz 和 .tbz2 文件的大小

使用如下命令来查看 (压缩) tar 文件的体积。

```
[root@linuxtechi ~]# tar -czf - data.tar | wc -c
427
[root@linuxtechi ~]# tar -czf - mybackup-2016-09-09.tgz | wc -c
37956009
[root@linuxtechi ~]# tar -czf - myarchive.tbz2 | wc -c
30835317
[root@linuxtechi ~]#
```

### 示例 17：分割体积庞大的 tar 文件为多份小文件

类 Unix 系统中使用 split 命令来将大体积文件分割成小体积文件。大体积的 tar 当然也可以使用这个命令来进行分割。

假设需要将 "mybackup-2016-09-09.tgz" 分割成每份 6 MB 的小文件。

```
Syntax :  split -b <Size-in-MB> <tar-file-name>.<extension> “prefix-name”
```

```
[root@linuxtechi ~]# split -b 6M mybackup-2016-09-09.tgz mybackup-parts
```

以上命令会在当前目录分割 mybackup-2016-09-09.tgz 文件成为多个 6 MB 的小文件，文件名为 mybackup-partsaa ~ mybackup-partsag。如果在要在分割文件后以数字而非字母来区分，可以在以上的 split 命令使用 `-d` 选项。

```
[root@linuxtechi ~]# ls -l mybackup-parts*
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsaa
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsab
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsac
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsad
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsae
-rw-r--r--. 1 root root 6291456 Sep 10 03:05 mybackup-partsaf
-rw-r--r--. 1 root root 637219  Sep 10 03:05 mybackup-partsag
[root@linuxtechi ~]#
```

然后通过网络将这些分割文件转移到其他服务器，就可以合并成为一个单独的 tar 文件了，如下：

```
[root@linuxtechi ~]# cat mybackup-partsa* > mybackup-2016-09-09.tgz
[root@linuxtechi ~]#
```

文毕，希望你喜欢 tar 命令的这几个不同的示例。随时评论并分享你的心得。

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/17-tar-command-examples-in-linux/

作者：[Pradeep Kumar][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxtechi.com/author/pradeep/
