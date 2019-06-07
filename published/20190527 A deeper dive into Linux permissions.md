[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10947-1.html)
[#]: subject: (A deeper dive into Linux permissions)
[#]: via: (https://www.networkworld.com/article/3397790/a-deeper-dive-into-linux-permissions.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

更深入地了解 Linux 权限
======
> 在 Linux 上查看文件权限时，有时你会看到的不仅仅是普通的 r、w、x 和 -。如何更清晰地了解这些字符试图告诉你什么以及这些权限如何工作？

![Sandra Henry-Stocker](https://img.linux.net.cn/data/attachment/album/201906/07/150718q09wnve6ne6v9063.jpg)

在 Linux 上查看文件权限时，有时你会看到的不仅仅是普通的 `r`、`w`、`x` 和 `-`。除了在所有者、组和其他中看到 `rwx` 之外，你可能会看到 `s` 或者 `t`，如下例所示：

```
drwxrwsrwt
```

要进一步明确的方法之一是使用 `stat` 命令查看权限。`stat` 的第四行输出以八进制和字符串格式显示文件权限：

```
$ stat /var/mail
  File: /var/mail
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 801h/2049d      Inode: 1048833     Links: 2
Access: (3777/drwxrwsrwt)  Uid: (    0/    root)   Gid: (    8/    mail)
Access: 2019-05-21 19:23:15.769746004 -0400
Modify: 2019-05-21 19:03:48.226656344 -0400
Change: 2019-05-21 19:03:48.226656344 -0400
 Birth: -
```

这个输出提示我们，分配给文件权限的位数超过 9 位。事实上，有 12 位。这些额外的三位提供了一种分配超出通常的读、写和执行权限的方法 - 例如，`3777`（二进制 `011111111111`）表示使用了两个额外的设置。

该值的第一个 `1` （第二位）表示 SGID（设置 GID），为运行文件而赋予临时权限，或以该关联组的权限来使用目录。

```
011111111111
 ^
```

SGID 将正在使用该文件的用户作为该组成员之一而分配临时权限。

第二个 `1`（第三位）是“粘连”位。它确保*只有*文件的所有者能够删除或重命名该文件或目录。

```
011111111111
  ^
```

如果权限是 `7777` 而不是 `3777`，我们知道 SUID（设置 UID）字段也已设置。

```
111111111111
^
```

SUID 将正在使用该文件的用户作为文件拥有者分配临时权限。

至于我们上面看到的 `/var/mail` 目录，所有用户都需要访问，因此需要一些特殊值来提供它。

但现在让我们更进一步。

特殊权限位的一个常见用法是使用 `passwd` 之类的命令。如果查看 `/usr/bin/passwd` 文件，你会注意到 SUID 位已设置，它允许你更改密码（以及 `/etc/shadow` 文件的内容），即使你是以普通（非特权）用户身份运行，并且对此文件没有读取或写入权限。当然，`passwd` 命令很聪明，不允许你更改其他人的密码，除非你是以 root 身份运行或使用 `sudo`。

```
$ ls -l /usr/bin/passwd
-rwsr-xr-x 1 root root 63736 Mar 22 14:32 /usr/bin/passwd
$ ls -l /etc/shadow
-rw-r----- 1 root shadow 2195 Apr 22 10:46 /etc/shadow
```

现在，让我们看一下使用这些特殊权限可以做些什么。

### 如何分配特殊文件权限

与 Linux 命令行中的许多东西一样，你可以有不同的方法设置。 `chmod` 命令允许你以数字方式或使用字符表达式更改权限。

要以数字方式更改文件权限，你可以使用这样的命令来设置 SUID 和 SGID 位：

```
$ chmod 6775 tryme
```

或者你可以使用这样的命令：

```
$ chmod ug+s tryme <== 用于 SUID 和 SGID 权限
```

如果你要添加特殊权限的文件是脚本，你可能会对它不符合你的期望感到惊讶。这是一个非常简单的例子：

```
$ cat tryme
#!/bin/bash

echo I am $USER
```

即使设置了 SUID 和 SGID 位，并且 root 是文件所有者，运行脚本也不会产生你可能期望的 “I am root”。为什么？因为 Linux 会忽略脚本的 SUID 和 SGID 位。

```
$ ls -l tryme
-rwsrwsrwt 1 root root 29 May 26 12:22 tryme
$ ./tryme
I am jdoe
```

另一方面，如果你对一个编译的程序之类进行类似的尝试，就像下面这个简单的 C 程序一样，你会看到不同的效果。在此示例程序中，我们提示用户输入文件名并创建它，并给文件写入权限。

```
#include <stdlib.h>

int main()
{
    FILE *fp;   /* file pointer*/
    char fName[20];

    printf("Enter the name of file to be created: ");
    scanf("%s",fName);

    /* create the file with write permission */
    fp=fopen(fName,"w");
    /* check if file was created */
    if(fp==NULL)
    {
        printf("File not created");
        exit(0);
    }

    printf("File created successfully\n");
    return 0;
}
```

编译程序并运行该命令以使 root 用户成为所有者并设置所需权限后，你将看到它以预期的 root 权限运行 - 留下新创建的 root 为所有者的文件。当然，你必须具有 `sudo` 权限才能运行一些需要的命令。

```
$ cc -o mkfile mkfile.c            <== 编译程序
$ sudo chown root:root mkfile       <== 更改所有者和组为 “root”
$ sudo chmod ug+s mkfile        <== 添加 SUID and SGID 权限
$ ./mkfile              <== 运行程序
Enter name of file to be create: empty
File created successfully
$ ls -l empty
-rw-rw-r-- 1 root root 0 May 26 13:15 empty
```

请注意，文件所有者是 root - 如果程序未以 root 权限运行，则不会发生这种情况。

权限字符串中不常见设置的位置（例如，rw**s**rw**s**rw**t**）可以帮助提醒我们每个位的含义。至少第一个 “s”（SUID） 位于所有者权限区域中，第二个 （SGID） 位于组权限区域中。为什么粘连位是 “t” 而不是 “s” 超出了我的理解。也许创造者想把它称为 “tacky bit”，但由于这个词的不太令人喜欢的第二个定义而改变了他们的想法。无论如何，额外的权限设置为 Linux 和其他 Unix 系统提供了许多额外的功能。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3397790/a-deeper-dive-into-linux-permissions.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/shs_rwsr-100797564-large.jpg
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
