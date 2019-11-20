[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11595-1.html)
[#]: subject: (What you probably didn’t know about sudo)
[#]: via: (https://opensource.com/article/19/10/know-about-sudo)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)

关于 sudo 你可能不知道的
======

> 觉得你已经了解了 sudo 的所有知识了吗？再想想。

![](https://img.linux.net.cn/data/attachment/album/201911/20/091740ape5b74jppjj4q36.jpg)

大家都知道 `sudo`，对吗？默认情况下，该工具已安装在大多数 Linux 系统上，并且可用于大多数 BSD 和商业 Unix 变体。不过，在与数百名 `sudo` 用户交谈之后，我得到的最常见的答案是 `sudo` 是一个使生活复杂化的工具。

有 root 用户和 `su` 命令，那么为什么还要使用另一个工具呢？对于许多人来说，`sudo` 只是管理命令的前缀。只有极少数人提到，当你在同一个系统上有多个管理员时，可以使用 `sudo` 日志查看谁做了什么。

那么，`sudo` 是什么？ 根据 [sudo 网站][2]：

> “sudo 允许系统管理员通过授予某些用户以 root 用户或其他用户身份运行某些命令的能力，同时提供命令及其参数的审核记录，从而委派权限。”

默认情况下，`sudo` 只有简单的配置，一条规则允许一个用户或一组用户执行几乎所有操作（在本文后面的配置文件中有更多信息）：

```
%wheel ALL=(ALL) ALL
```

在此示例中，参数表示以下含义：

* 第一个参数（`%wheel`）定义组的成员。
* 第二个参数（`ALL`）定义组成员可以在其上运行命令的主机。
* 第三个参数（`(ALL)`）定义了可以执行命令的用户名。
* 最后一个参数（`ALL`）定义可以运行的应用程序。

因此，在此示例中，`wheel` 组的成员可以以所有主机上的所有用户身份运行所有应用程序。但即使是这个一切允许的规则也很有用，因为它会记录谁在计算机上做了什么。

### 别名

当然，它不仅可以让你和你最好的朋友管理一个共享机器，你还可以微调权限。你可以将以上配置中的项目替换为列表：用户列表、命令列表等。多数情况下，你可能会复制并粘贴配置中的一些列表。

在这种情况下，别名可以派上用场。在多个位置维护相同的列表容易出错。你可以定义一次别名，然后可以多次使用。因此，当你对一位管理员不再信任时，将其从别名中删除就行了。使用多个列表而不是别名，很容易忘记从具有较高特权的列表之一中删除用户。

### 为特定组的用户启用功能

`sudo` 命令带有大量默认设置。不过，在某些情况下，你想覆盖其中的一些情况，这时你可以在配置中使用 `Defaults` 语句。通常，对每个用户都强制使用这些默认值，但是你可以根据主机、用户名等将设置缩小到一部分用户。这里有个我那一代的系统管理员都喜欢玩的一个示例：“羞辱”。这些只不过是一些有人输入错误密码时的有趣信息：

```
czanik@linux-mewy:~> sudo ls
[sudo] password for root:
Hold it up to the light --- not a brain in sight!  # 把灯举高点，脑仁太小看不到
[sudo] password for root:
My pet ferret can type better than you!     # 我的宠物貂也比你输入的好
[sudo] password for root:
sudo: 3 incorrect password attempts
czanik@linux-mewy:~>
```

由于并非所有人都喜欢系统管理员的这种幽默，因此默认情况下会禁用这些羞辱信息。以下示例说明了如何仅对经验丰富的系统管理员（即 `wheel` 组的成员）启用此设置：

```
Defaults !insults
Defaults:%wheel insults
```

我想，感谢我将这些消息带回来的人用两只手也数不过来吧。

### 摘要验证

当然，`sudo` 还有更严肃的功能。其中之一是摘要验证。你可以在配置中包括应用程序的摘要：

```
peter ALL = sha244:11925141bb22866afdf257ce7790bd6275feda80b3b241c108b79c88 /usr/bin/passwd
```

在这种情况下，`sudo` 在运行应用程序之前检查应用程序摘要，并将其与配置中存储的摘要进行比较。如果不匹配，`sudo` 拒绝运行该应用程序。尽管很难在配置中维护此信息（没有用于此目的的自动化工具），但是这些摘要可以为你提供额外的保护层。

### 会话记录

会话记录也是 `sudo` 鲜为人知的功能。在演示之后，许多人离开我的演讲后就计划在其基础设施上实施它。为什么？因为使用会话记录，你不仅可以看到命令名称，还可以看到终端中发生的所有事情。你可以看到你的管理员在做什么，要不他们用 shell 访问了机器而日志仅会显示启动了 `bash`。

当前有一个限制。记录存储在本地，因此具有足够的权限的话，用户可以删除他们的痕迹。所以请继续关注即将推出的功能。

### 插件

从 1.8 版开始，`sudo` 更改为基于插件的模块化体系结构。通过将大多数功能实现为插件，你可以编写自己的功能轻松地替换或扩展 `sudo` 的功能。已经有了 `sudo` 上的开源和商业插件。

在我的演讲中，我演示了 `sudo_pair` 插件，该插件可在 [GitHub][3] 上获得。这个插件是用 Rust 开发的，这意味着它不是那么容易编译，甚至更难以分发其编译结果。另一方面，该插件提供了有趣的功能，需要第二个管理员通过 `sudo` 批准（或拒绝）运行命令。不仅如此，如果有可疑活动，可以在屏幕上跟踪会话并终止会话。

在最近的 All Things Open 会议上的一次演示中，我做了一个臭名昭著的演示：

```
czanik@linux-mewy:~> sudo  rm -fr /
```

看着屏幕上显示的命令。每个人都屏住呼吸，想看看我的笔记本电脑是否被毁了，然而它逃过一劫。

### 日志

正如我在开始时提到的，日志记录和警报是 `sudo` 的重要组成部分。如果你不会定期检查 `sudo` 日志，那么日志在使用 `sudo` 中并没有太多价值。该工具通过电子邮件提醒配置中指定的事件，并将所有事件记录到 syslog 中。可以打开调试日志用于调试规则或报告错误。

### 警报

电子邮件警报现在有点过时了，但是如果你使用 syslog-ng 来收集日志消息，则会自动解析 `sudo` 日志消息。你可以轻松创建自定义警报并将其发送到各种各样的目的地，包括 Slack、Telegram、Splunk 或 Elasticsearch。你可以从[我在 syslong-ng.com 上的博客][4]中了解有关此功能的更多信息。

### 配置

我们谈论了很多 `sudo` 功能，甚至还看到了几行配置。现在，让我们仔细看看 `sudo` 的配置方式。配置本身可以在 `/etc/sudoers` 中获得，这是一个简单的文本文件。不过，不建议直接编辑此文件。相反，请使用 `visudo`，因为此工具还会执行语法检查。如果你不喜欢 `vi`，则可以通过将 `EDITOR` 环境变量指向你的首选编辑器来更改要使用的编辑器。

在开始编辑 `sudo` 配置之前，请确保你知道 root 密码。（是的，即使在默认情况下 root 用户没有密码的 Ubuntu 上也是如此。）虽然 `visudo` 会检查语法，但创建语法正确而将你锁定在系统之外的配置也很容易。

如果在紧急情况下，而你手头有 root 密码，你也可以直接编辑配置。当涉及到 `sudoers` 文件时，有一件重要的事情要记住：从上到下读取该文件，以最后的设置为准。这个事实对你来说意味着你应该从通用设置开始，并在末尾放置例外情况，否则，通用设置会覆盖例外情况。

你可以在下面看到一个基于 CentOS 的简单 `sudoers` 文件，并添加我们之前讨论的几行：

```
Defaults !visiblepw
Defaults always_set_home
Defaults match_group_by_gid
Defaults always_query_group_plugin
Defaults env_reset
Defaults env_keep = "COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS"
Defaults env_keep += "MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE"
Defaults secure_path = /sbin:/bin:/usr/sbin:/usr/bin
root ALL=(ALL) ALL
%wheel ALL=(ALL) ALL
Defaults:%wheel insults
Defaults !insults
Defaults log_output
```

该文件从更改多个默认值开始。然后是通常的默认规则：`root` 用户和 `wheel` 组的成员对计算机具有完全权限。接下来，我们对 `wheel` 组启用“羞辱”，但对其他所有人禁用它们。最后一行启用会话记录。

上面的配置在语法上是正确的，但是你可以发现逻辑错误吗？是的，有一个：后一个通用设置覆盖了先前的更具体设置，让所有人均禁用了“羞辱”。一旦交换了这两行的位置，设置就会按预期进行：`wheel` 组的成员会收到有趣的消息，但其他用户则不会收到。

### 配置管理

一旦必须在多台机器上维护 `sudoers` 文件，你很可能希望集中管理配置。这里主要有两种可能的开源方法。两者都有其优点和缺点。

你可以使用也用来配置其余基础设施的配置管理应用程序之一：Red Hat Ansible、Puppet 和 Chef 都具有用于配置 `sudo` 的模块。这种方法的问题在于更新配置远非实时。同样，用户仍然可以在本地编辑 `sudoers` 文件并更改设置。

`sudo` 工具也可以将其配置存储在 LDAP 中。在这种情况下，配置更改是实时的，用户不能弄乱`sudoers` 文件。另一方面，该方法也有局限性。例如，当 LDAP 服务器不可用时，你不能使用别名或使用 `sudo`。

### 新功能

新版本的 `sudo` 即将推出。1.9 版将包含许多有趣的新功能。以下是最重要的计划功能：

* 记录服务可集中收集会话记录，与本地存储相比，它具有许多优点：
    * 在一个地方搜索更方便。
    * 即使发送记录的机器关闭，也可以进行记录。
    * 记录不能被想要删除其痕迹的人删除。
* audit 插件没有向 `sudoers` 添加新功能，而是为插件提供了 API，以方便地访问任何类型的 `sudo` 日志。这个插件允许使用插件从 `sudo` 事件创建自定义日志。
* approval 插件无需使用第三方插件即可启用会话批准。
* 以及我个人最喜欢的：插件的 Python 支持，这使你可以轻松地使用 Python 代码扩展 `sudo`，而不是使用 C 语言进行原生编码。
   
### 总结

希望本文能向你证明 `sudo` 不仅仅是一个简单的命令前缀。有无数种可能性可以微调系统上的权限。你不仅可以微调权限，还可以通过检查摘要来提高安全性。会话记录使你能够检查系统上正在发生的事情。你也可以使用插件扩展 `sudo` 的功能，或者使用已有的插件或编写自己的插件。最后，从即将发布的功能列表中你可以看到，即使 `sudo` 已有数十年的历史，它也是一个不断发展的有生命力的项目。

如果你想了解有关 `sudo` 的更多信息，请参考以下资源：

* [sudo 网站][5]
* [sudo 博客][6]
* [在 Twitter 上关注我们][7]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/know-about-sudo

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://www.sudo.ws
[3]: https://github.com/square/sudo_pair/
[4]: https://www.syslog-ng.com/community/b/blog/posts/alerting-on-sudo-events-using-syslog-ng
[5]: https://www.sudo.ws/
[6]: https://blog.sudo.ws/
[7]: https://twitter.com/sudoproject
