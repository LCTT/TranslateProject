[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11553-1.html)
[#]: subject: (Linux permissions 101)
[#]: via: (https://opensource.com/article/19/8/linux-permissions-101)
[#]: author: (Alex Juarez https://opensource.com/users/mralexjuarezhttps://opensource.com/users/marcobravohttps://opensource.com/users/greg-p)

全面介绍 Linux 权限
======

> 知道如何控制用户对文件的访问是一项基本的系统管理技能。

![](https://img.linux.net.cn/data/attachment/album/201911/08/233101y043rn4ua00r3lqn.jpg)

了解 Linux 权限以及如何控制哪些用户可以访问文件是系统管理的一项基本技能。

本文将介绍标准 Linux 文件系统权限，并进一步研究特殊权限，以及使用 `umask` 来解释默认权限作为文章的结束。

### 理解 ls 命令的输出

在讨论如何修改权限之前，我们需要知道如何查看权限。通过 `ls` 命令的长列表参数（`-l`）为我们提供了有关文件的许多信息。

```
$ ls -lAh
total 20K
-rwxr-xr--+ 1 root root    0 Mar  4 19:39 file1
-rw-rw-rw-. 1 root root    0 Mar  4 19:39 file10
-rwxrwxr--+ 1 root root    0 Mar  4 19:39 file2
-rw-rw-rw-. 1 root root    0 Mar  4 19:39 file8
-rw-rw-rw-. 1 root root    0 Mar  4 19:39 file9
drwxrwxrwx. 2 root root 4.0K Mar  4 20:04 testdir
```

为了理解这些是什么意思，让我们将关于权限的输出分解为各个部分。单独理解每个部分会更容易。

让我们看看在上面的输出中的最后一行的每个组件：

```
drwxrwxrwx. 2 root root 4.0K Mar  4 20:04 testdir
```

第 1 节 | 第 2 节 | 第 3 节 | 第 4 节 | 第 5 节 | 第 6 节 | 第 7 节
---|---|---|---|---|---|---
`d` | `rwx` | `rwx` | `rwx` | `.` | `root` | `root`

第 1 节（左侧）显示文件的类型。

符号 | 类型
---|---
`d` | 目录
`-` | 常规文件
`l` | 软链接

`ls` 的 [info 页面][2]完整列出了不同的文件类型。

每个文件都有三种访问方式：

* 属主
* 组
* 所有其他人
   
第 2、3 和 4 节涉及用户（属主）、组和“其他用户”权限。每个部分都可以包含 `r`（读取）、`w`（写入）和 `x`（执行）权限的组合。

每个权限还分配了一个数值，这在以八进制表示形式讨论权限时很重要。

权限 | 八进制值
---|---
`r` | 4
`w` | 2
`x` | 1

第 5 节描述了其他替代访问方法，例如 SELinux 或文件访问控制列表（FACL）。

访问方法 | 字符
---|---
没有其它访问方法 | `-`
SELinux | `.`
FACL | `+`
各种方法的组合 | `+`

第 6 节和第 7 节分别是属主和组的名称。

### 使用 chown 和 chmod

#### chown 命令

`chown`（更改所有权）命令用于更改文件的用户和组的所有权。

要将文件 `foo` 的用户和组的所有权更改为 `root`，我们可以使用以下命令：

```
$ chown root:root foo
$ chown root: foo
```

在用户名后跟冒号（`:`）运行该命令将同时设置用户和组所有权。

要仅将文件 `foo` 的用户所有权设置为 `root` 用户，请输入：

```
$ chown root foo
```

要仅更改文件 `foo` 的组所有权，请在组之前加冒号：

```
$ chown :root foo
```

#### chmod 命令

`chmod`（更改模式）命令控制属主、组以及既不是属主也不属于与文件关联的组的所有其他用户的文件许可权。

`chmod` 命令可以以八进制（例如 `755`、`644` 等）和符号（例如 `u+rwx`、`g-rwx`、`o=rw`）格式设置权限。

八进制表示法将 4 个“点”分配给“读取”，将 2 个“点”分配给“写入”，将 1 个点分配给“执行”。如果要给用户（属主）分配“读取”权限，则将 4 分配给第一个插槽，但是如果要添加“写入”权限，则必须添加 2。如果要添加“执行”，则要添加 1。我们对每种权限类型执行此操作：属主、组和其他。

例如，如果我们想将“读取”、“写入”和“执行”分配给文件的属主，但仅将“读取”和“执行”分配给组成员和所有其他用户，则我们应使用 `755`（八进制格式）。这是属主的所有权限位（`4+2+1`），但组和其他权限的所有权限位只有 `4` 和 `1`（`4+1`）。

> 细分为：4+2+1=7，4+1=5 和 4+1=5。

如果我们想将“读取”和“写入”分配给文件的属主，而只将“读取”分配给组的成员和所有其他用户，则可以如下使用 `chmod`：

```
$ chmod 644 foo_file
```

在下面的示例中，我们在不同的分组中使用符号表示法。注意字母 `u`、`g` 和 `o` 分别代表“用户”（属主）、“组”和“其他”。我们将 `u`、`g` 和 `o` 与 `+`、`-` 或 `=` 结合使用来添加、删除或设置权限位。

要将“执行”位添加到所有权权限集中：

```
$ chmod u+x foo_file
```

要从组成员中删除“读取”、“写入”和“执行”：

```
$ chmod g-rwx foo_file
```

要将所有其他用户的所有权设置为“读取”和“写入”：

```
$ chmod o=rw
```

### 特殊位：设置 UID、设置 GID 和粘滞位

除了标准权限外，还有一些特殊的权限位，它们具有一些别的用处。

#### 设置用户 ID（suid）

当在文件上设置 `suid` 时，将以文件的属主的身份而不是运行该文件的用户身份执行操作。一个[好的例子][3]是 `passwd` 命令。它需要设置 `suid` 位，以便更改密码的操作具有 root 权限。

```
$ ls -l /bin/passwd
-rwsr-xr-x. 1 root root 27832 Jun 10  2014 /bin/passwd
```

设置 `suid` 位的示例：

```
$ chmod u+s /bin/foo_file_name
```

#### 设置组 ID（sgid）

`sgid` 位与 `suid` 位类似，操作是在目录的组所有权下完成的，而不是以运行命令的用户身份。

一个使用 `sgid` 的例子是，如果多个用户正在同一个目录中工作，并且目录中创建的每个文件都需要具有相同的组权限。下面的示例创建一个名为 `collab_dir` 的目录，设置 `sgid` 位，并将组所有权更改为 `webdev`。

```
$ mkdir collab_dir
$ chmod g+s collab_dir
$ chown :webdev collab_dir
```

现在，在该目录中创建的任何文件都将具有 `webdev` 的组所有权，而不是创建该文件的用户的组。

```
$ cd collab_dir
$ touch file-sgid
$ ls -lah file-sgid
-rw-r--r--. 1 root webdev 0 Jun 12 06:04 file-sgid
```

#### “粘滞”位

粘滞位表示，只有文件所有者才能删除该文件，即使组权限允许该文件可以删除。通常，在 `/tmp` 这样的通用或协作目录上，此设置最有意义。在下面的示例中，“所有其他人”权限集的“执行”列中的 `t` 表示已应用粘滞位。

```
$ ls -ld /tmp
drwxrwxrwt. 8 root root 4096 Jun 12 06:07 /tmp/
```

请记住，这不会阻止某个人编辑该文件，它只是阻止他们删除该目录的内容（LCTT 译注：即删除目录下文件）。

我们将粘滞位设置为：

```
$ chmod o+t foo_dir
```

你可以自己尝试在目录上设置粘滞位并赋予其完整的组权限，以便多个属于同一组的用户可以在目录上进行读取、写入和执行。

接着，以每个用户的身份创建文件，然后尝试以另一个用户的身份删除它们。

如果一切配置正确，则一个用户应该不能从另一用户那里删除文件。

请注意，这些位中的每个位也可以用八进制格式设置：SUID = 4、SGID = 2 和 粘滞位 = 1。（LCTT 译注：这里是四位八进制数字）

```
$ chmod 4744
$ chmod 2644
$ chmod 1755
```

#### 大写还是小写？

如果要设置特殊位时看到大写的 `S` 或 `T` 而不是小写的字符（如我们之前所见），那是因为不存在（对应的）底层的执行位。为了说明这一点，下面的示例创建一个设置了粘滞位的文件。然后，我们可以添加和删除执行位以演示大小写更改。

```
$ touch file cap-ST-demo
$ chmod 1755 cap-ST-demo
$ ls -l cap-ST-demo
-rwxr-xr-t. 1 root root 0 Jun 12 06:16 cap-ST-demo

$ chmod o-x cap-X-demo
$ ls -l cap-X-demo
-rwxr-xr-T. 1 root root 0 Jun 12 06:16 cap-ST-demo
```

#### 有条件地设置执行位

至此，我们使用小写的 `x` 设置了执行位，而无需询问任何问题即可对其进行设置。我们还有另一种选择：使用大写的 `X` 而不是小写的，它将仅在权限组中某个位置已经有执行位时才设置执行位。这可能是一个很难解释的概念，但是下面的演示将帮助说明它。请注意，在尝试将执行位添加到组特权之后，该位没有被设置上。

```
$ touch cap-X-file
$ ls -l cap-X-file
-rw-r--r--. 1 root root 0 Jun 12 06:31 cap-X-file
$ chmod g+X cap-X-file
$ ls -l cap-X-file
-rw-r--r--. 1 root root 0 Jun 12 06:31 cap-X-file
```

在这个类似的例子中，我们首先使用小写的 `x` 将执行位添加到组权限，然后使用大写的 `X` 为所有其他用户添加权限。这次，大写的 `X`设置了该权限。

```
$ touch cap-X-file
$ ls -l cap-X-file
-rw-r--r--. 1 root root 0 Jun 12 06:31 cap-X-file
$ chmod g+x cap-X-file
$ ls -l cap-X-file
-rw-r-xr--. 1 root root 0 Jun 12 06:31 cap-X-file
$ chmod o+X cap-X-file
ls -l cap-X-file
-rw-r-xr-x. 1 root root 0 Jun 12 06:31 cap-X-file
```

### 理解 umask

`umask` 会屏蔽（或“阻止”）默认权限集中的位，以定义文件或目录的权限。例如，`umask`输出中的 `2` 表示它至少在默认情况下阻止了文件的“写入”位。

使用不带任何参数的 `umask` 命令可以使我们看到当前的 `umask` 设置。共有四列：第一列为特殊的`suid`、`sgid` 或粘滞位而保留，其余三列代表属主、组和其他人的权限。

```
$ umask
0022
```

为了理解这意味着什么，我们可以用 `-S` 标志来执行 `umask`（如下所示）以解释屏蔽位的结果。例如，由于第三列中的值为 `2`，因此将“写入”位从组和其他部分中屏蔽掉了；只能为它们分配“读取”和“执行”。

```
$ umask -S
u=rwx,g=rx,o=rx
```

要查看文件和目录的默认权限集是什么，让我们将 `umask` 设置为全零。这意味着我们在创建文件时不会掩盖任何位。

```
$ umask 000
$ umask -S
u=rwx,g=rwx,o=rwx

$ touch file-umask-000
$ ls -l file-umask-000
-rw-rw-rw-. 1 root root 0 Jul 17 22:03 file-umask-000
```

现在，当我们创建文件时，我们看到所有部分的默认权限分别为“读取”（`4`）和“写入”（`2`），相当于八进制表示 `666`。

我们可以对目录执行相同的操作，并看到其默认权限为 `777`。我们需要在目录上使用“执行”位，以便可以遍历它们。

```
$ mkdir dir-umask-000
$ ls -ld dir-umask-000
drwxrwxrwx. 2 root root 4096 Jul 17 22:03 dir-umask-000/
```

### 总结

管理员还有许多其他方法可以控制对系统文件的访问。这些权限是 Linux 的基本权限，我们可以在这些基础上进行构建。如果你的工作为你引入了 FACL 或 SELinux，你会发现它们也建立在这些文件访问的首要规则之上。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-permissions-101

作者：[Alex Juarez][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mralexjuarezhttps://opensource.com/users/marcobravohttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux-penguins.png?itok=yKOpaJM_ (Penguins)
[2]: https://www.gnu.org/software/texinfo/manual/info-stnd/info-stnd.html
[3]: https://www.theurbanpenguin.com/using-a-simple-c-program-to-explain-the-suid-permission/
