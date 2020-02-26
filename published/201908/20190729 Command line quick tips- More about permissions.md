[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11185-1.html)
[#]: subject: (Command line quick tips: More about permissions)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-more-about-permissions/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

命令行快速提示：权限进阶
======

![][1]

前一篇文章[介绍了 Fedora 系统上有关文件权限的一些基础知识][2]。本部分介绍使用权限管理文件访问和共享的其他方法。它建立在前一篇文章中的知识和示例的基础上，所以如果你还没有阅读过那篇文章，请[查看][2]它。

### 符号与八进制

在上一篇文章中，你了解到文件有三个不同的权限集。拥有该文件的用户有一个集合，拥有该文件的组的成员有一个集合，然后最终一个集合适用于其他所有人。在长列表（`ls -l`）中这些权限使用符号模式显示在屏幕上。

每个集合都有 `r`、`w` 和 `x` 条目，表示特定用户（所有者、组成员或其他）是否可以读取、写入或执行该文件。但是还有另一种表达这些权限的方法：八进制模式。

你已经习惯了[十进制][3]编号系统，它有十个不同的值（`0` 到 `9`）。另一方面，八进制系统有八个不同的值（`0` 到 `7`）。在表示权限时，八进制用作速记来显示 `r`、`w` 和 `x` 字段的值。将每个字段视为具有如下值：

  * `r` = 4
  * `w` = 2
  * `x` = 1

现在，你可以使用单个八进制值表达任何组合。例如，读取和写入权限（但没有执行权限）的值为 `6`。读取和执行权限的值仅为 `5`。文件的 `rwxr-xr-x` 符号权限的八进制值为 `755`。

与符号值类似，你可以使用八进制值使用 `chmod` 命令设置文件权限。以下两个命令对文件设置相同的权限：

```
chmod u=rw,g=r,o=r myfile1
chmod 644 myfile1
```

### 特殊权限位

文件上还有几个特殊权限位。这些被称为 `setuid`（或 `suid`）、`setgid`（或 `sgid`），以及<ruby>粘滞位<rt>sticky bit</rt></ruby>（或<ruby>阻止删除位<rt>delete inhibit</rt></ruby>）。 将此视为另一组八进制值：

  * `setuid` = 4
  * `setgid` = 2
  * `sticky` = 1

**除非**该文件是可执行的，否则 `setuid` 位是被忽略的。如果是可执行的这种情况，则该文件（可能是应用程序或脚本）的运行就像拥有该文件的用户启动的一样。`setuid` 的一个很好的例子是 `/bin/passwd` 实用程序，它允许用户设置或更改密码。此实用程序必须能够写入到不允许普通用户更改的文件中（LCTT 译注：此处是指 `/etc/passwd` 和 `/etc/shadow`）。因此它需要精心编写，由 `root` 用户拥有，并具有 `setuid` 位，以便它可以更改密码相关文件。

`setgid` 位对于可执行文件的工作方式类似。该文件将使用拥有它的组的权限运行。但是，`setgid` 对于目录还有一个额外的用途。如果在具有 `setgid` 权限的目录中创建文件，则该文件的组所有者将设置为该目录的组所有者。

最后，虽然文件粘滞位没有意义会被忽略，但它对目录很有用。在目录上设置的粘滞位将阻止用户删除其他用户拥有的该目录中的文件。

在八进制模式下使用 `chmod` 设置这些位的方法是添加一个值前缀，例如 `4755`，可以将 `setuid` 添加到可执行文件中。在符号模式下，`u` 和 `g` 也可用于设置或删除 `setuid` 和 `setgid`，例如 `u+s,g+s`。粘滞位使用 `o+t` 设置。（其他的组合，如 `o+s` 或 `u+t`，是没有意义的，会被忽略。）

### 共享与特殊权限

回想一下前一篇文章中关于需要共享文件的财务团队的示例。可以想象，特殊权限位有助于更有效地解决问题。原来的解决方案只是创建了一个整个组可以写入的目录：

```
drwxrwx---. 2 root finance 4096 Jul  6 15:35 finance
```

此目录的一个问题是，`finance` 组成员的用户 `dwayne` 和 `jill` 可以删除彼此的文件。这对于共享空间来说不是最佳选择。它在某些情况下可能有用，但在处理财务记录时可能不会！

另一个问题是此目录中的文件可能无法真正共享，因为它们将由 `dwayne` 和 `jill` 的默认组拥有 - 很可能用户私有组也命名为 `dwayne` 和 `jill`，而不是 `finance`。

解决此问题的更好方法是在文件夹上设置 `setgid` 和粘滞位。这将做两件事：使文件夹中创建的文件自动归 `finance` 组所有，并防止 `dwayne` 和 `jill` 删除彼此的文件。下面这些命令中的任何一个都可以工作：

```
sudo chmod 3770 finance
sudo chmod u+rwx,g+rwxs,o+t finance
```

该文件的长列表现在显示了所应用的新特殊权限。粘滞位显示为 `T` 而不是 `t`，因为 `finance` 组之外的用户无法搜索该文件夹。

```
drwxrws--T. 2 root finance 4096 Jul  6 15:35 finance
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-more-about-permissions/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg
[2]: https://linux.cn/article-11123-1.html
[3]: https://en.wikipedia.org/wiki/Decimal
