如何提交你的第一个 Linux 内核补丁
======
> 学习如何做出你的首个 Linux 内核贡献，以及在开始之前你应该知道什么。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22)

Linux 内核是最大且变动最快的开源项目之一，它由大约 53,600 个文件和近 2,000 万行代码组成。在全世界范围内超过 15,600 位程序员为它贡献代码，Linux 内核项目的维护者使用了如下的协作模型。

![](https://opensource.com/sites/default/files/karnik_figure1.png)

本文中，为了便于在 Linux 内核中提交你的第一个贡献，我将为你提供一个必需的快速检查列表，以告诉你在提交补丁时，应该去查看和了解的内容。对于你贡献的第一个补丁的提交流程方面的更多内容，请阅读 [KernelNewbies 的第一个内核补丁教程][1]。

### 为内核作贡献

**第 1 步：准备你的系统。**

本文开始之前，假设你的系统已经具备了如下的工具：

+ 文本编辑器
+ Email 客户端
+ 版本控制系统（例如：git）

**第 2 步：下载 Linux 内核代码仓库。**

```
git clone -b staging-testing
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
```

复制你的当前配置：

```
cp /boot/config-`uname -r`* .config
```

**第 3 步：构建/安装你的内核。**

```
make -jX
sudo make modules_install install
```

**第 4 步：创建一个分支并切换到该分支。**

```
git checkout -b first-patch
```

**第 5 步：更新你的内核并指向到最新的代码。**

```
git fetch origin
git rebase origin/staging-testing
```

**第 6 步：在最新的代码库上产生一个变更。**

使用 `make` 命令重新编译，确保你的变更没有错误。

**第 7 步：提交你的变更并创建一个补丁。**

```
git add <file>
git commit -s -v
git format-patch -o /tmp/ HEAD^
```

![](https://opensource.com/sites/default/files/karnik_figure2.png)

主题是由冒号分隔的文件名组成，跟着是使用祈使语态来描述补丁做了什么。空行之后是强制的 `signed off` 标记，最后是你的补丁的 `diff` 信息。

下面是另外一个简单补丁的示例：

![](https://opensource.com/sites/default/files/karnik_figure3.png)

接下来，[从命令行使用邮件][2]（在本例子中使用的是 Mutt）发送这个补丁：

```
mutt -H /tmp/0001-<whatever your filename is>
```

使用 [get_maintainer.pl 脚本][11]，去了解你的补丁应该发送给哪位维护者的列表。

### 提交你的第一个补丁之前，你应该知道的事情

* [Greg Kroah-Hartman](3) 的 [staging tree][4] 是提交你的 [第一个补丁][1] 的最好的地方，因为他更容易接受新贡献者的补丁。在你熟悉了补丁发送流程以后，你就可以去发送复杂度更高的子系统专用的补丁。
* 你也可以从纠正代码中的编码风格开始。想学习更多关于这方面的内容，请阅读 [Linux 内核编码风格文档][5]。
* [checkpatch.pl][6] 脚本可以帮你检测编码风格方面的错误。例如，运行如下的命令：`perl scripts/checkpatch.pl -f drivers/staging/android/* | less`
* 你可以去补全开发者留下的 TODO 注释中未完成的内容：`find drivers/staging -name TODO`
* [Coccinelle][7] 是一个模式匹配的有用工具。
* 阅读 [归档的内核邮件][8]。
* 为找到灵感，你可以去遍历 [linux.git 日志][9]去查看以前的作者的提交内容。
* 注意：不要与你的补丁的审核者在邮件顶部交流！下面就是一个这样的例子：

    **错误的方式：**
    
    ```
    Chris,
    Yes let’s schedule the meeting tomorrow, on the second floor.

    > On Fri, Apr 26, 2013 at 9:25 AM, Chris wrote:
    > Hey John, I had some questions:
    > 1. Do you want to schedule the meeting tomorrow?
    > 2. On which floor in the office?
    > 3. What time is suitable to you?
```
    （注意那最后一个问题，在回复中无意中落下了。）

    **正确的方式：**

    ```
    Chris,
    See my answers below...

    > On Fri, Apr 26, 2013 at 9:25 AM, Chris wrote:
    > Hey John, I had some questions:
    > 1. Do you want to schedule the meeting tomorrow?
    Yes tomorrow is fine.
    > 2. On which floor in the office?
    Let's keep it on the second floor.
    > 3. What time is suitable to you?
    09:00 am would be alright.
```
    （所有问题全部回复，并且这种方式还保存了阅读的时间。）
* [Eudyptula challenge][10] 是学习内核基础知识的非常好的方式。

想学习更多内容，阅读 [KernelNewbies 的第一个内核补丁教程][1]。之后如果你还有任何问题，可以在 [kernelnewbies 邮件列表][12] 或者 [#kernelnewbies IRC channel][13] 中提问。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/first-linux-kernel-patch

作者：[Sayli Karnik][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/sayli
[1]:https://kernelnewbies.org/FirstKernelPatch
[2]:https://opensource.com/life/15/8/top-4-open-source-command-line-email-clients
[3]:https://twitter.com/gregkh
[4]:https://www.kernel.org/doc/html/v4.15/process/2.Process.html
[5]:https://www.kernel.org/doc/html/v4.10/process/coding-style.html
[6]:https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl
[7]:http://coccinelle.lip6.fr/
[8]:linux-kernel@vger.kernel.org
[9]:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/
[10]:http://eudyptula-challenge.org/
[11]:https://github.com/torvalds/linux/blob/master/scripts/get_maintainer.pl
[12]:https://kernelnewbies.org/MailingList
[13]:https://kernelnewbies.org/IRC
