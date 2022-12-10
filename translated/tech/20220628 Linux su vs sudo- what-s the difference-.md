[#]: subject: "Linux su vs sudo: what's the difference?"
[#]: via: "https://opensource.com/article/22/6/linux-su-vs-sudo-sysadmin"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lkxed"
[#]: translator: "chai001125"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux 中的 `su` 和 `sudo` 命令有什么区别呢？
======

>本文将比较 <ruby>非 root 用户<rt> non-root user </rt></ruby> 提权为 root 用户的两个 **Linux 命令** 的区别。

![bash logo on green background][1]

`su` 和 `sudo` 命令都允许用户执行非特权用户不允许做的系统管理任务，即只有 root 用户能执行的命令。有些人更喜欢 `sudo` 命令：例如 [Seth Kenlon][2] 最近发布的一篇 [《在 Linux 上使用 `sudo` 的 5 个理由》][3]，他在其中详细阐述了 `sudo` 命令的许多优点。

但是，相较于 `sudo` 命令，我**更偏好于 `su` 命令**，来做系统管理工作。在本文中，我比较了这两个命令的区别，并解释了为什么我更喜欢 `su` 而不是 `sudo`，但我仍然同时使用这两个命令的原因。

### 过去的系统管理员主要使用 `su` 命令

`su` 和 `sudo` 命令是为**不同的世界**设计的。早期的 Unix 计算机需要全职系统管理员，他们使用 root 用户作为唯一的管理帐户。在这个古老的世界里，有管理员密码的人会在电传打字机或 CRT 终端（例如 DEC VT100）上以 root 用户登录，然后执行一些管理 Unix 计算机的工作。

root 用户还有一个非 root 帐户，用于执行一些非 root 的任务，例如编写文档和管理电子邮件等。在这些 Unix 计算机上通常有许多非 root 帐户，他们都不需要完全的 root 访问权限，只需要以 root 权限运行很少的命令，大约 1 至 2 个就可以了。许多系统管理员以 root 用户登录，完成 root 工作，并在任务完成后，退出 root 会话。系统管理员需要整天以 root 用户来登录，因为 `sudo` 命令需要键入更多的内容才能运行基本命令，因此大多数系统管理员很少使用 `sudo` 命令。

`sudo` 和 `su` 这两个命令都能够提权为 root 用户，但它们实现的方式大不相同。这种差异是由于它们**最初打算用于不同的情况**。

### `sudo` 命令

`sudo` 命令的初衷是让 root 用户能够将他们定期需要的 1 到 2 个特权命令委托给 1 至 2 个非 root 用户。`sudo` 命令允许非 root 用户暂时地获得更高权限，来执行一些特权命令，例如添加和删除用户、删除属于其他用户的文件、安装新软件以及管理现代 Linux 主机所需的任何命令。

`sudo` 命令允许非 root 用户访问 1 到 2 个 _需要更高权限_ 的常用命令，这样可以帮助系统管理员节省来自用户的许多请求，并减少等待时间。`sudo` 命令不会将用户帐户切换为 root 用户，因为大多数非 root 用户永远不应该拥有完全的 root 访问权限。在大多数情况下，`sudo` 允许用户执行 1 或 2 个命令，然后提权就会过期。在这个通常为 5 分钟的短暂的提权时间内，用户可以执行任何需要提权的管理命令。需要继续使用提权的用户可以运行 `sudo -v` 命令来重新验证 root 访问权限，并将提权时间再延长 5 分钟。

使用 `sudo` 命令还有一些副作用，例如生成非 root 用户使用命令的日志条目及其 ID。这些日志可以在之后作为出现问题的检验，来给用户更多的操作培训。你以为我会说“责备”用户，对吗？

### `su` 命令

`su` 命令能够将非 root 用户提权到 root 权限——事实上，能让非 root 用户成为 root 用户。唯一的要求是用户知道根密码。因为用户已经以 root 权限登录，所以之后的操作就没有限制了。

`su` 命令所提供的提权没有时间限制。用户可以作为 root 执行命令，不需要进行重新认证是否有 root 权限。完成任务后，用户可以执行退出命令 `exit`，从 root 用户恢复到自己原来的非 root 帐户。

### `su` 和 `sudo` 在使用上的争议和变化

最近在 `su` 与 `sudo` 的使用上存在一些分歧。

> 真正的系统管理员不会使用 `sudo`。——保罗·威尼斯（Paul Venezia）

Venezia 在他的 [InfoWorld 文章][4] 中辩称，对于许多担任系统管理员的人来说，`sudo` 是一个不必要的工具。他没有花太多时间为这个观点进行解释，他只是把它说成了一个事实。我同意他对于系统管理员的观点，因为我们不需要 `sudo` 来完成我们的工作。事实上，`sudo` 使得事情变得更复杂了。

然而，

> 这时代正在“变革”当中。——鲍勃·迪伦

迪伦是对的，尽管他没有为电脑唱歌（LCTT 译注：鲍勃·迪伦是美国创作歌手、艺术家和作家，这里指他不是针对于电脑而说的）。

自从**个人计算机**时代到来以来，计算机的管理方式发生了重大变化。在许多环境中，计算机的使用者也是它的管理员，这使得为这些用户提供一些对 root 权限的访问是有必要的。

一些现代发行版，例如 Ubuntu 及其衍生版本，只能使用 `sudo` 命令来执行特权命令。在这些发行版中，用户无法直接以 root 用户身份登录，甚至无法通过 `su` 切换到 root，因此需要 `sudo` 命令来允许非 root 用户获得 root 权限。在这一环境中，所有系统管理任务均使用 `sudo` 来执行。

通过锁定 root 帐户并将常规用户帐户添加到 wheel 组，可以进行此配置，但是这种配置很容易被绕过。接下来，让我们在任何 Ubuntu 主机或 VM 上尝试一些小实验吧。我在这里说明一些我实验的设置，以便你可以根据需要来重现它。我安装的是 Ubuntu 16.04 LTS1，并使用 VirtualBox 将其安装在 VM 中。在安装过程中，我创建了一个非 root 用户 `student`，为了简便起见我给这个用户设置了一个简单的密码。

以 `student` 用户身份登录 Ubuntu，并打开终端。查看 `/etc/shadow` 文件中的 root 条目，其中存储了经哈希的密码。

```
student@ubuntu1:~$ cat /etc/shadow
cat: /etc/shadow: Permission denied
```

可以看到终端拒绝了我们对 `/etc/shadow` 的访问，因此我们无法查看 `/etc/shadow` 文件。所有发行版都是如此，以防止非特权用户看到和访问加密的密码，因为非特权用户可能会使用常见的黑客工具来破解这些密码。

现在，让我们使用 `su -` 命令来成为 root 用户。

```
student@ubuntu1:~$ su -
Password: <Enter root password – but there isn't one>
su: Authentication failure
```

认证失败的原因是因为根帐户没有密码、并且被锁定了。接下来，使用 `sudo` 命令查看 `/etc/shadow` 文件。

```
student@ubuntu1:~$ sudo cat /etc/shadow
[sudo] password for student: <enter the student password>
root:!:17595:0:99999:7:::
<snip>
student:$6$tUB/y2dt$A5ML1UEdcL4tsGMiq3KOwfMkbtk3WecMroKN/:17597:0:99999:7:::
<snip>
```

在这里，我仅截取了部分结果，只显示 root 和 `student` 用户的条目。我还缩短了加密密码，以便该条目能显示在一行中。各个字段以冒号（`:`）分隔，第二个字段是密码。请注意，root 的密码字段是一个感叹号（`!`），这表明 root 帐户已被锁定，且无法使用。

现在，要将根帐户变成一个合适的系统管理员，你只需为根帐户设置密码。

```
student@ubuntu1:~$ sudo su -
[sudo] password for student: <Enter password for student>
root@ubuntu1:~# passwd root
Enter new UNIX password: <Enter new root password>
Retype new UNIX password: <Re-enter new root password>
passwd: password updated successfully
root@ubuntu1:~#
```

现在，你可以直接以 root 身份登录到控制台，或者直接使用 `su` 登录到 root，而不是在每个命令前都加一个 `sudo`。当然，你也可以在每次想以 root 身份登录时，使用 `sudo su -`，但这又是何必呢？

请不要误解我的意思。像 Ubuntu 这样的发行版非常好，多年来我已经使用了其中的几个。在使用 Ubuntu 和相关发行版时，我做的第一件事就是设置一个 root 密码，这样我就可以直接以 root 身份登录。其他发行版，如 Fedora 及其相关发行版，现在在安装过程中提供了一些有趣的选择。我注意到的第一个 Fedora 版本是 Fedora 34，我在写我的一本即将出版的书时安装了很多次。

在安装页面上，可以找到其中一个安装选项，来设置 root 密码。这个新选项允许用户以锁定 Ubuntu root 帐户的方式选择“<ruby>锁定 root 帐户<rt> Lock root account </rt></ruby>”。此页面上还有一个选项，允许使用密码以 root 身份远程 SSH 登录到此主机，但这仅在 root 帐户解锁时有效。第二个选项位于允许创建非根用户帐户的页面上。此页面上的选项之一是“<ruby>让此用户成为管理员<rt> Make this user administrator </rt></ruby>”。选中此选项后，用户 ID 将添加到一个名为 wheel 组的特殊组中，该组授权该组的成员使用 `sudo` 命令。Fedora 36 甚至在该复选框的描述中提到了 wheel 组。

可以将多个非 root 用户设置为管理员。使用此方法指定为管理员的任何人都可以使用 `sudo` 命令在 Linux 计算机上执行所有管理任务。Linux 在安装时只允许创建一个非 root 用户，所以其他新用户可以在创建时添加到 wheel 组中。root 用户或其他管理员可以使用文本编辑器或 `usermod` 命令直接将现有用户添加到 wheel 组。

在大多数情况下，今天的管理员只需要执行一些基本任务，例如添加新的打印机、安装更新或新软件，或者删除不再需要的软件。这些 GUI 工具需要 root 或管理密码，并将接受来自管理员用户的密码。

### 在 Linux 上，我是怎么使用 `su` 和 `sudo` 的呢

我**同时使用 `su` 和 `sudo`**。它们都是我所使用的很重要的系统管理员工具。

我不锁定根帐户，因为我需要用根帐户来运行我的 [Ansible][5] 脚本和我编写的 [rsbu][6] Bash 程序，来执行备份。这两个程序都需要以 root 身份运行，我编写的其他几个管理 Bash 的脚本也是如此。我**使用 `su` 命令**，切换到 root 用户，这样我就可以执行这些脚本和许多其他常见的命令。当我需要确定问题和解决问题时，使用 `su` 命令将我的权限提升到 root 十分有用，因为我不希望 `sudo` 带来的提权会话超时。

当非 root 用户需要执行这些任务时，我**使用 `sudo` 命令**，来执行需要 root 权限的任务。我在 sudoers 文件中设置了非根帐户，只允许访问完成任务所需的 1 到 2 个命令。当我只需要运行 1 个或 2 个需要提权的快速命令时，我自己也会使用 `sudo` 命令。

### 结论

实际上只要你把工作完成好了，你使用什么工具都无大碍。你使用的是 vim 还是 Emacs，是 systemd 还是 SystemV，是 RPM 亦或是 DEB，是 `sudo` 亦或是 `su`，在结果上会有什么区别呢？这里的关键在于你应该使用**最适合你的工具**。Linux 和开源软件的最大优势之一是通常有许多选项可用于我们需要完成的任务。

`su` 和 `sudo` 都各有长处，如果正确使用的话，两者都是非常安全的。我选择同时使用 `su` 和 `sudo` 命令，基于它们的历史功能，因为这对我来说十分有用。对于我自己的大部分工作，我更喜欢 `su` 命令，因为它与我的工作流程最适配。

在评论区分享你喜欢的工作方式吧！

本文摘自于我的书《系统管理员的 Linux 方法（Apress，2018 年）》（The Linux Philosophy for Sysadmins）一书的第 19 章，并经许可后重新发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/linux-su-vs-sudo-sysadmin

作者：[David Both][a]
选题：[lkxed][b]
译者：[chai001125](https://github.com/chai001125)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/bash_command_line.png
[2]: https://opensource.com/users/seth
[3]: https://opensource.com/article/22/5/use-sudo-linux
[4]: http://www.infoworld.com/t/unix/nine-traits-the-veteran-unix-admin-276?page=0,0&source=fssr
[5]: https://opensource.com/article/20/10/first-day-ansible
[6]: https://opensource.com/article/17/1/rsync-backup-linux
