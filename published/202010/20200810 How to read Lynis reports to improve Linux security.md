[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12697-1.html)
[#]: subject: (How to read Lynis reports to improve Linux security)
[#]: via: (https://opensource.com/article/20/8/linux-lynis-security)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

如何阅读 Lynis 报告提高 Linux 安全性
======

> 使用 Lynis 的扫描和报告来发现和修复 Linux 安全问题。

![](https://img.linux.net.cn/data/attachment/album/202010/08/102355k7jakojhz9x8xamx.jpg)

当我读到 Gaurav Kamathe 的文章《[使用 Lynis 扫描 Linux 安全性][2]》时，让我想起了我在美国劳工部担任系统管理员的日子。我那时的职责之一是保证我们的 Unix 服务器的安全。每个季度，都会有一个独立的核查员来审查我们服务器的安全状态。每次在核查员预定到达的那一天，我都会运行 Security Readiness Review（SRR），这是一个扫描工具，它使用一大套脚本来识别和报告任何安全线索。SRR 是开源的，因此我可以查看所有源码脚本及其功能。这使我能够查看其代码，确定具体是什么问题，并迅速修复它发现的每个问题。

### 什么是 Lynis？

[Lynis][3] 是一个开源的安全审计工具，它的工作原理和 SRR 很像，它会扫描 Linux 系统，并提供它发现的任何弱点的详细报告。同样和 SRR 一样，它也是由一大套脚本组成的，每个脚本都会检查一个特定的项目，例如，最小和最大密码时间要求。

运行 Lynis 后，你可以使用它的报告来定位每个项目的脚本，并了解 Lynis 是如何检查和报告每个问题的。你也可以使用相同的脚本代码来创建新的代码来自动解决。

### 如何阅读 Lynis 报告

由于 Gaurav 的文章介绍了 Lynis 的安装和使用，在本文中，我将展示一些如何阅读和使用其报告的例子。

请从运行一次审计开始：

```
# lynis audit system --quick
```

完成后，完整的报告将显示在你的屏幕上。在底部，“Suggestions” 部分列出了所有可能需要修复以更好地加固系统的项目，以及每个项目的 TEST-ID。

要想加固系统并减少列表的大小，请开始解决每个项目。在 “Suggestions” 部分的描述可能包含了你需要采取的全部行动。如果没有，你可以使用 `show details` 命令。

```
# lynis show details TEST-ID
```

例如，在我的系统中，有一条建议是：

> 找不到 `locate` 所需的数据库，运行 `updatedb` 或 `locate.updatedb` 来创建这个文件。[FILE-6410]

看起来我只需要运行 `updatedb` 命令就行，但如果我想确定一下，我可以使用 Lynis 的 `show details` 选项。

```
# lynis show details FILE-6410
2020-06-16 20:54:33 Performing test ID FILE-6410 (Checking Locate database)
2020-06-16 20:54:33 Test: Checking locate database
2020-06-16 20:54:33 Result: file /var/lib/mlocate/mlocate.db not found
2020-06-16 20:54:33 Result: file /var/lib/locate/locatedb not found
2020-06-16 20:54:33 Result: file /var/lib/locatedb not found
2020-06-16 20:54:33 Result: file /var/lib/slocate/slocate.db not found
2020-06-16 20:54:33 Result: file /var/cache/locate/locatedb not found
2020-06-16 20:54:33 Result: file /var/db/locate.database not found
2020-06-16 20:54:33 Result: database not found
2020-06-16 20:54:33 Suggestion: The database required for 'locate' could not be found. Run 'updatedb' or 'locate.updatedb' to create this file. [test:FILE-6410] [details:-] [solution:-]
2020-06-16 20:54:33 ====
```

这些细节表明 Lynis 无法找到各种文件。这个情况描述的非常清楚。我可以运行 `updatedb` 命令，然后重新检查这个测试。

```
# updatedb
# lynis --tests FILE-6410
```

重新检查细节时，会显示它发现哪个文件满足了测试：

```
# lynis show details FILE-6410
2020-06-16 21:38:40 Performing test ID FILE-6410 (Checking Locate database)
2020-06-16 21:38:40 Test: Checking locate database
2020-06-16 21:38:40 Result: locate database found (/var/lib/mlocate/mlocate.db)
2020-06-16 21:38:40 Result: file /var/lib/locate/locatedb not found
2020-06-16 21:38:40 Result: file /var/lib/locatedb not found
2020-06-16 21:38:40 Result: file /var/lib/slocate/slocate.db not found
2020-06-16 21:38:40 Result: file /var/cache/locate/locatedb not found
2020-06-16 21:38:40 Result: file /var/db/locate.database not found
2020-06-16 21:38:40 ====
```

### 深入挖掘

Lynis 的许多建议并不像这个建议那样直接。如果你不确定某个发现或建议指的是什么，就很难知道如何解决问题。假设你在一个新的 Linux 服务器上运行 Lynis，有几项与 SSH 守护进程有关的内容，其中一项是关于 `MaxAuthTries` 的设置：

```
* Consider hardening SSH configuration [SSH-7408]
    - Details  : MaxAuthTries (6 --> 3)
      https://cisofy.com/lynis/controls/SSH-7408/
```

要解决这个问题，你需要知道 SSH 配置文件的位置。一个经验丰富的 Linux 管理员可能已经知道在哪里找到它们，但如果你不知道，有一个方法可以看到 Lynis 在哪里找到它们。

#### 定位 Lynis 测试脚本

Lynis 支持多种操作系统，因此你的安装位置可能有所不同。在 Red Hat Enterprise Linux 或 Fedora Linux 系统中，使用 `rpm` 命令来查找测试文件：

```
# rpm -ql lynis
```

这将列出所有测试文件，并报告它们在 `lynis/include` 目录下的位置。在这个目录下搜索你想知道的 TEST-ID（本例中为 SSH-7408）：

```
# grep SSH-7408 /usr/share/lynis/include/*
/usr/share/lynis/include/tests_ssh:    # Test        : SSH-7408
```

#### 查找 SSH 问题

名为 `tests_ssh` 的文件中包含了 TEST-ID，在这里可以找到与 SSH 相关的扫描函数。看看这个文件，就可以看到 Lynis 扫描器调用的各种函数。第一部分在一个名为 `SSH_DAEMON_CONFIG_LOCS` 的变量中定义了一个目录列表。下面几节负责检查 SSH 守护进程的状态、定位它的配置文件，并识别它的版本。我在 SSH-7404 测试中找到了查找配置文件的代码，描述为 “确定 SSH 守护进程配置文件位置”。这段代码包含一个 `for` 循环，在列表中的项目中搜索一个名为 `sshd_config` 的文件。我可以用这个逻辑来自己进行搜索：

```
# find /etc /etc/ssh /usr/local/etc/ssh /opt/csw/etc/ssh -name sshd_config
/etc/ssh/sshd_config
/etc/ssh/sshd_config
find: ‘/usr/local/etc/ssh’: No such file or directory
find: ‘/opt/csw/etc/ssh’: No such file or directory
```

进一步探索这个文件，就会看到寻找 SSH-7408 的相关代码。这个测试涵盖了 `MaxAuthTries` 和其他一些设置。现在我可以在 SSH 配置文件中找到该变量：

```
# grep MaxAuthTries /etc/ssh/sshd_config
#MaxAuthTries 6
```

#### 修复法律横幅问题

Lynis 还报告了一个与登录系统时显示的法律横幅有关的发现。在我的家庭桌面系统上（我并不希望有很多其他人登录），我没有去改变默认的 `issue` 文件。企业或政府的系统很可能被要求包含一个法律横幅，以警告用户他们的登录和活动可能被记录和监控。Lynis 用 BANN-7126 测试和 BANN-7130 测试报告了这一点：

```
* Add a legal banner to /etc/issue, to warn unauthorized users [BANN-7126]
      https://cisofy.com/lynis/controls/BANN-7126/

* Add legal banner to /etc/issue.net, to warn unauthorized users [BANN-7130]
      https://cisofy.com/lynis/controls/BANN-7130/
```

我在运行 Fedora 32 工作站的系统上没有发现什么：

```
# cat /etc/issue /etc/issue.net
\S
Kernel \r on an \m (\l)

\S
Kernel \r on an \m (\l)
```

我可以添加一些诸如 “keep out” 或 “don't break anything” 之类的内容，但测试的描述并没有提供足够的信息来解决这个问题，所以我又看了看 Lynis 的脚本。我注意到 `include` 目录下有一个叫 `tests_banners` 的文件；这似乎是一个很好的地方。在 `grep` 的帮助下，我看到了相关的测试：

```
# grep -E 'BANN-7126|BANN-7130' /usr/share/lynis/include/tests_banners
    # Test        : BANN-7126
    Register --test-no BANN-7126 --preqs-met ${PREQS_MET} --weight L --network NO --category security --description "Check issue banner file contents"
    # Test        : BANN-7130
    Register --test-no BANN-7130 --preqs-met ${PREQS_MET} --weight L --network NO --category security --description "Check issue.net banner file contents"
```

在检查了测试文件中的相关代码后，我发现这两个测试都是通过一个 `for` 循环来迭代一些预定义的法律术语：

```
for ITEM in ${LEGAL_BANNER_STRINGS}; do
```

这些法律术语存储在文件顶部定义的变量 `LEGAL_BANNER_STRINGS` 中。向后滚动到顶部可以看到完整的清单：

```
LEGAL_BANNER_STRINGS="audit access authori condition connect consent continu criminal enforce evidence forbidden intrusion law legal legislat log monitor owner penal policy policies privacy private prohibited record restricted secure subject system terms warning"
```

我最初的建议（“keep out” 或 “don't break anything”）不会满足这个测试，因为它们不包含这个列表中的任何单词。

下面这条横幅信息包含了几个必要的词，因此，它将满足这个测试，并防止 Lynis 报告它：

> Attention, by continuing to connect to this system, you consent to the owner storing a log of all activity. Unauthorized access is prohibited.

请注意，这条信息必须被添加到 `/etc/issue` 和 `/etc/issue.net` 中。

### 使其可重复

你可以手动进行这些编辑，但你可能要考虑自动化。例如，可能有许多设置需要更改，或者你可能需要在许多服务器上定期进行这些编辑。创建一个加固脚本将是简化这个过程的好方法。对于 SSH 配置，在你的加固脚本中的一些 `sed` 命令可以解决这些发现。或者，你可以使用 `echo` 语句来添加合法的横幅。

```
sed -i '/MaxAuthTries/s/#MaxAuthTries 6/MaxAuthTries 3/' /etc/ssh/sshd_config

echo "Legal Banner" | tee -a /etc/issue /etc/issue.net
```

自动化使你能够创建一个可重复的脚本，可以在你的基础设施中保存和管理。你也可以在你的初始服务器配置中加入这个脚本。

### 加固你的系统

这种类型的练习可以提高你的脚本技能，既可以跟着现有的代码走，也可以写自己的脚本。因为 Lynis 是开源的，所以你可以很容易地看到你的系统是如何被检查的，以及它的报告意味着什么。最终的结果将是一个完善的系统，你可以在审计人员来的时候随时向他们炫耀。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/linux-lynis-security

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://linux.cn/article-12696-1.html
[3]: https://github.com/CISOfy/lynis
