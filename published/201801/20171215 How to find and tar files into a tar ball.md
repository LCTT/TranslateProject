如何找出并打包文件成 tar 包
======

Q：我想找出所有的 *.doc 文件并将它们创建成一个 tar 包，然后存储在 `/nfs/backups/docs/file.tar` 中。是否可以在 Linux 或者类 Unix 系统上查找并 tar 打包文件？

`find` 命令用于按照给定条件在目录层次结构中搜索文件。`tar` 命令是用于 Linux 和类 Unix 系统创建 tar 包的归档工具。

[![How to find and tar files on linux unix][1]][1]

让我们看看如何将 `tar` 命令与 `find` 命令结合在一个命令行中创建一个 tar 包。

### Find 命令

语法是：

```
find /path/to/search -name "file-to-search" -options
## 找出所有 Perl（*.pl）文件 ##
find $HOME -name "*.pl" -print
## 找出所有 *.doc 文件 ##
find $HOME -name "*.doc" -print
## 找出所有 *.sh（shell 脚本）并运行 ls -l 命令 ##
find . -iname "*.sh" -exec ls -l {} +
```

最后一个命令的输出示例： 

```
-rw-r--r-- 1 vivek vivek 1169 Apr  4  2017 ./backups/ansible/cluster/nginx.build.sh
-rwxr-xr-x 1 vivek vivek 1500 Dec  6 14:36 ./bin/cloudflare.pure.url.sh
lrwxrwxrwx 1 vivek vivek   13 Dec 31  2013 ./bin/cmspostupload.sh -> postupload.sh
lrwxrwxrwx 1 vivek vivek   12 Dec 31  2013 ./bin/cmspreupload.sh -> preupload.sh
lrwxrwxrwx 1 vivek vivek   14 Dec 31  2013 ./bin/cmssuploadimage.sh -> uploadimage.sh
lrwxrwxrwx 1 vivek vivek   13 Dec 31  2013 ./bin/faqpostupload.sh -> postupload.sh
lrwxrwxrwx 1 vivek vivek   12 Dec 31  2013 ./bin/faqpreupload.sh -> preupload.sh
lrwxrwxrwx 1 vivek vivek   14 Dec 31  2013 ./bin/faquploadimage.sh -> uploadimage.sh
-rw-r--r-- 1 vivek vivek  778 Nov  6 14:44 ./bin/mirror.sh
-rwxr-xr-x 1 vivek vivek  136 Apr 25  2015 ./bin/nixcraft.com.301.sh
-rwxr-xr-x 1 vivek vivek  547 Jan 30  2017 ./bin/paypal.sh
-rwxr-xr-x 1 vivek vivek  531 Dec 31  2013 ./bin/postupload.sh
-rwxr-xr-x 1 vivek vivek  437 Dec 31  2013 ./bin/preupload.sh
-rwxr-xr-x 1 vivek vivek 1046 May 18  2017 ./bin/purge.all.cloudflare.domain.sh
lrwxrwxrwx 1 vivek vivek   13 Dec 31  2013 ./bin/tipspostupload.sh -> postupload.sh
lrwxrwxrwx 1 vivek vivek   12 Dec 31  2013 ./bin/tipspreupload.sh -> preupload.sh
lrwxrwxrwx 1 vivek vivek   14 Dec 31  2013 ./bin/tipsuploadimage.sh -> uploadimage.sh
-rwxr-xr-x 1 vivek vivek 1193 Oct 18  2013 ./bin/uploadimage.sh
-rwxr-xr-x 1 vivek vivek   29 Nov  6 14:33 ./.vim/plugged/neomake/tests/fixtures/errors.sh
-rwxr-xr-x 1 vivek vivek  215 Nov  6 14:33 ./.vim/plugged/neomake/tests/helpers/trap.sh
```

### Tar 命令

要[创建 /home/vivek/projects 目录的 tar 包][2]，运行：

```
$ tar -cvf /home/vivek/projects.tar /home/vivek/projects
```

### 结合 find 和 tar 命令

语法是：

```
find /dir/to/search/ -name "*.doc" -exec tar -rvf out.tar {} \;
```

或者

```
find /dir/to/search/ -name "*.doc" -exec tar -rvf out.tar {} +
```

例子：

```
find $HOME -name "*.doc" -exec tar -rvf /tmp/all-doc-files.tar "{}" \;
```

或者

```
find $HOME -name "*.doc" -exec tar -rvf /tmp/all-doc-files.tar "{}" +
```

这里，find 命令的选项：

*  `-name "*.doc"`：按照给定的模式/标准查找文件。在这里，在 $HOME 中查找所有 *.doc 文件。
*  `-exec tar ...` ：对 `find` 命令找到的所有文件执行 `tar` 命令。

这里，`tar` 命令的选项：

*  `-r`：将文件追加到归档末尾。参数与 `-c` 选项具有相同的含义。
*  `-v`：详细输出。
*  `-f out.tar` : 将所有文件追加到 out.tar 中。

也可以像下面这样将 `find` 命令的输出通过管道输入到 `tar` 命令中：

```
find $HOME -name "*.doc" -print0 | tar -cvf /tmp/file.tar --null -T - 
```

传递给 `find` 命令的 `-print0` 选项处理特殊的文件名。`--null` 和 `-T` 选项告诉 `tar` 命令从标准输入/管道读取输入。也可以使用 `xargs` 命令：

```
find $HOME -type f -name "*.sh" | xargs tar cfvz /nfs/x230/my-shell-scripts.tgz
```

有关更多信息，请参阅下面的 man 页面：

```
$ man tar
$ man find
$ man xargs
$ man bash
```

------------------------------

作者简介：

作者是 nixCraft 的创造者，是一名经验丰富的系统管理员，也是 Linux 操作系统/Unix shell 脚本培训师。他曾与全球客户以及 IT、教育、国防和太空研究以及非营利部门等多个行业合作。在 Twitter、Facebook 和 Google+ 上关注他。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/linux-unix-find-tar-files-into-tarball-command/

作者：[Vivek Gite][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2017/12/How-to-find-and-tar-files-on-linux-unix.jpg
[2]:https://www.cyberciti.biz/faq/creating-a-tar-file-linux-command-line/
