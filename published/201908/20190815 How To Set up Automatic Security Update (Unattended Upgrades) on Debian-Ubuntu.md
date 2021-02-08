[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11252-1.html)
[#]: subject: (How To Set up Automatic Security Update (Unattended Upgrades) on Debian/Ubuntu?)
[#]: via: (https://www.2daygeek.com/automatic-security-update-unattended-upgrades-ubuntu-debian/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Debian/Ubuntu 上设置自动安全更新（无人值守更新）
======

对于 Linux 管理员来说重要的任务之一是让系统保持最新状态，这可以使得你的系统更加稳健并且可以避免不想要的访问与攻击。

在 Linux 上安装软件包是小菜一碟，用相似的方法我们也可以更新安全补丁。

这是一个向你展示如何配置系统接收自动安全更新的简单教程。当你运行自动安全包更新而不经审查会给你带来一定风险，但是也有一些好处。

如果你不想错过安全补丁，且想要与最新的安全补丁保持同步，那你应该借助无人值守更新机制设置自动安全更新。

如果你不想要自动安全更新的话，你可以[在 Debian/Ubuntu 系统上手动安装安全更新][1]。

我们有许多可以自动化更新的办法，然而我们将先采用官方的方法之后我们会介绍其它方法。

### 如何在 Debian/Ubuntu 上安装无人值守更新包

无人值守更新包默认应该已经装在你的系统上。但万一它没被安装，就用下面的命令来安装。

使用 [APT-GET 命令][2]和 [APT 命令][3]来安装 `unattended-upgrades` 软件包。

```
$ sudo apt-get install unattended-upgrades
```

下方两个文件可以使你自定义该机制：

```
/etc/apt/apt.conf.d/50unattended-upgrades
/etc/apt/apt.conf.d/20auto-upgrades
```

### 在 50unattended-upgrades 文件中做出必要修改

默认情况下只有安全更新需要的最必要的选项被启用。但并不限于此，你可以配置其中的许多选项以使得这个机制更加有用。

我修改了一下文件并仅加上被启用的行以方便阐述：

```
# vi /etc/apt/apt.conf.d/50unattended-upgrades

Unattended-Upgrade::Allowed-Origins {
        "${distro_id}:${distro_codename}";
        "${distro_id}:${distro_codename}-security";
        "${distro_id}ESM:${distro_codename}";
        };
Unattended-Upgrade::DevRelease "false";
```

有三个源被启用，细节如下：

  * `${distro_id}:${distro_codename}`：这是必须的，因为安全更新可能会从非安全来源拉取依赖。
  * `${distro_id}:${distro_codename}-security`：这用来从来源得到安全更新。
  * `${distro_id}ESM:${distro_codename}`：这是用来从 ESM（扩展安全维护）获得安全更新。

**启用邮件通知：** 如果你想要在每次安全更新后收到邮件通知，那么就修改以下行段（取消其注释并加上你的 email 账号）。

从：

```
//Unattended-Upgrade::Mail "root";
```

修改为：

```
Unattended-Upgrade::Mail "2daygeek@gmail.com";
```

**自动移除不用的依赖：** 你可能需要在每次更新后运行 `sudo apt autoremove` 命令来从系统中移除不用的依赖。

我们可以通过修改以下行来自动化这项任务（取消注释并将 `false` 改成 `true`）。

从：

```
//Unattended-Upgrade::Remove-Unused-Dependencies "false";
```

修改为：

```
Unattended-Upgrade::Remove-Unused-Dependencies "true";
```

**启用自动重启：** 你可能需要在安全更新安装至内核后重启你的系统。你可以在以下行做出修改：

从：

```
//Unattended-Upgrade::Automatic-Reboot "false";
```

到：取消注释并将 `false` 改成 `true`以启用自动重启。

```
Unattended-Upgrade::Automatic-Reboot "true";
```

**启用特定时段的自动重启：** 如果自动重启已启用，且你想要在特定时段进行重启，那么做出以下修改。

从：

```
//Unattended-Upgrade::Automatic-Reboot-Time "02:00";
```

到：取消注释并将时间改成你需要的时间。我将重启设置在早上 5 点。

```
Unattended-Upgrade::Automatic-Reboot-Time "05:00";
```

### 如何启用自动化安全更新？

现在我们已经配置好了必须的选项，一旦配置好，打开以下文件并确认是否这两个值都已设置好？值不应为0。（1=启用，0=禁止）。

```
# vi /etc/apt/apt.conf.d/20auto-upgrades

APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
```

**详情：**

  * 第一行使 `apt` 每天自动运行 `apt-get update`。
  * 第一行使 `apt` 每天自动安装安全更新。



--------------------------------------------------------------------------------

via: https://www.2daygeek.com/automatic-security-update-unattended-upgrades-ubuntu-debian/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/manually-install-security-updates-ubuntu-debian/
[2]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
