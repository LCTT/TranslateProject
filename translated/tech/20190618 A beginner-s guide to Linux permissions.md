[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A beginner's guide to Linux permissions)
[#]: via: (https://opensource.com/article/19/6/understanding-linux-permissions)
[#]: author: (Bryant Son https://opensource.com/users/brson/users/greg-p/users/tj)

给初学者的 Linux 权限指南
======
Linux 安全权限指定谁可以对文件或者目录做什么。
![Hand putting a Linux file folder into a drawer][1]

Linux 系统的主要优点之一是，与其他系统相比，它有较少的安全漏洞和攻击。Linux 为用户提供了更大的灵活性和对文件系统安全权限的精细控制。这可能意味着 Linux 用户非常需要了解安全权限。这不一定是正确的，但是新手用户理解 Linux 权限的基础知识仍然是明智之举。

### 查看 Linux 安全权限

要开始学习 Linux 权限，想象一下我们有一个名为 **PermissionDemo** 的新创建的目录。在目录中运行 **cd** 并使用 **ls -l** 命令查看 Linux 安全权限。如果要按修改时间对它们进行排序，请添加 **-t** 选项。


```
`ls -lt`
```

由于此新目录中没有文件，因此该命令不返回任何内容。

![No output from ls -l command][2]

要了解有关 **ls** 选项的更多信息，请在命令行输入 **man ls** 来访问其手册页。

![ls man page][3]

现在，我们可以使用 **touch** 命令轻松地创建两个空文件：**cat.txt** 和 **dog.txt**。我们还使用 **mkdir** 命令创建一个名为 **Pets** 的空目录。我们可以再次使用 **ls -l** 命令查看这些新文件的权限。

![Creating new files and directory][4]

我们需要注意这个命令输出两个部分。

### 谁有权限？

首先要查看是_谁_有权访问文件/目录。请注意下面红色框中高亮的部分。第一列表明有访问权限的_用户_，而第二列表明有访问权限的_组_。

![Output from -ls command][5]

主要有 3 类用户类型：**用户**、**组** 和 **其他**（既不是用户也不是组）。还有一个：**所有人**，这几乎意味着所有用户。

![User types][6]

因为我们在使用 **root** 用户，所以我们可以访问任何文件或目录，因为 **root** 是超级用户。但是，通常情况并非如此，你可能会受限于你的用户名。所有用户列表保存在 **/etc/passwd** 文件中。

![/etc/passwd file][7]

组在 **/etc/group** 文件中维护。

![/etc/passwd file][8]

### 它们有什么权限？

我们需要注意 **ls -l** 输出的“其他权限”部分与执行权限相关。上面，我们确认了 dog.txt 和 cat.txt 以及我们创建的目录 Pets 的所有者和所有组权限属于 **root** 帐户。我们可以通过所属用户信息，了解不同用户类型的执行权限，如下面的红色框中所示。

![Enforcing permissions for different user ownership types][9]

我们可以将每一行分解为五部分。第一列表示它是文件还是目录。文件是 **-**（连字符），目录是 **d**。接下来的三列分别指 **用户**、**组**和**其他**的权限。最后一部分是[**访问控制列表**][10]（ACL） 的标志，它是对象的权限列表。

![Different Linux permissions][11]

可以使用字母或数字标识 Linux 权限级别。共有三种权限类型：

  * **读：** r 或 4
  * **写：** w 或 2
  * **执行：** e 或 1



![Privilege types][12]

、每个字母符号（**r**、 **w** 或 **x** ）出现就意味着存在权限，而 **-** 表示不存在。在下面的例子中，文件所有者是可读写的，只有在用户属于该组时才可读，并且其他任何人都可以读取和执行。转换为数字符号，这就是645（有关如何计算的说明，请参见下图）。

![Permission type example][13]

以下是更多示例：

![Permission type examples][14]

通过以下练习测试你的知识。

![Permission type examples][15]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/understanding-linux-permissions

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson/users/greg-p/users/tj
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/sites/default/files/uploads/1_3.jpg (No output from ls -l command)
[3]: https://opensource.com/sites/default/files/uploads/1_man.jpg (ls man page)
[4]: https://opensource.com/sites/default/files/uploads/2_6.jpg (Creating new files and directory)
[5]: https://opensource.com/sites/default/files/uploads/3_2.jpg (Output from -ls command)
[6]: https://opensource.com/sites/default/files/uploads/4_0.jpg (User types)
[7]: https://opensource.com/sites/default/files/uploads/linuxpermissions_4_passwd.jpg (/etc/passwd file)
[8]: https://opensource.com/sites/default/files/uploads/linuxpermissions_4_group.jpg (/etc/passwd file)
[9]: https://opensource.com/sites/default/files/uploads/linuxpermissions_5.jpg (Enforcing permissions for different user ownership types)
[10]: https://en.wikipedia.org/wiki/Access-control_list
[11]: https://opensource.com/sites/default/files/uploads/linuxpermissions_6.jpg (Different Linux permissions)
[12]: https://opensource.com/sites/default/files/uploads/linuxpermissions_7.jpg (Privilege types)
[13]: https://opensource.com/sites/default/files/uploads/linuxpermissions_8.jpg (Permission type example)
[14]: https://opensource.com/sites/default/files/uploads/linuxpermissions_9.jpg (Permission type examples)
[15]: https://opensource.com/sites/default/files/uploads/linuxpermissions_10.jpg (Permission type examples)
