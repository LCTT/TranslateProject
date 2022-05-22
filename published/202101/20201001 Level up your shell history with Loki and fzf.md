[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12988-1.html)
[#]: subject: (Level up your shell history with Loki and fzf)
[#]: via: (https://opensource.com/article/20/10/shell-history-loki-fzf)
[#]: author: (Ed Welch https://opensource.com/users/ewelch)

用 Loki 和 fzf 进阶你的 Shell 历史记录
======

> Loki 扩展了 Prometheus 用于度量监测和日志聚合的模型。

![](https://img.linux.net.cn/data/attachment/album/202101/06/155012r4khll9zlqgx79fs.jpg)

[Loki][2] 是一个 Apache 2.0 许可的开源日志聚合框架，由 Grafana 实验室设计，并在不断发展的社区的巨大支持之下建立。它也是我每天为之努力的项目。在这篇文章中，我将不只是谈论 Loki 如何工作，而是提供一个实际操作的介绍，以解决实际问题。

### 问题：一个持久的集中式 Shell 历史记录

我喜欢我的 shell 历史，一直是 `CTRL+R` 的狂热用户。大约一年前，我的终端生活发生了翻天覆地的变化，我的同行 Dieter Plaetinck 向我介绍了命令行模糊查找器 [fzf][3]。

突然间，在命令中搜索就从这样：

![在 Loki 和 fzf 之前][4]

变成了这样：

![在 Loki 和 fzf 之后][6]
 
虽然 `fzf` 极大地提高了我的生活质量，但围绕着我的 shell 历史记录，还是缺少了一些片段：

  * 终端突然关闭、电脑崩溃、死机、整盘加密密钥被遗忘等情况下会丢失 shell 历史记录。
  * 想从我的所有电脑上访问我的 shell 历史记录。

我认为我的 shell 历史记录是文件：它是一个重要的故事，我不想失去。将 Loki 与我的 shell 历史结合起来，有助于解决这些问题和更多问题。

### 关于 Loki

Loki 采用了开源 [Prometheus][7] 项目用于度量的直观的标签模型，并将其扩展到日志聚合的世界。这使得开发人员和运维人员能够使用相同的标签集在他们的度量和日志之间无缝切换。即使你没有使用 Prometheus，也有很多理由说明 Loki 可能很适合你的日志存储需求：

  * **低开销：** Loki 不做全文日志索引；它只创建你放在日志上的标签的索引。保持小的索引大大降低了 Loki 的运维要求。我在 [树莓派][8] 上运行我的 loki-shell 项目，该项目使用 Loki 来存储 shell 历史记录，只使用了 50MB 多一点的内存。
  * *成本低：**日志内容被压缩并存储在对象存储中，如 Amazon S3、Google 云存储、Azure Blob，甚至可以直接存储在文件系统中。我们的目标是使用价格低廉且持久的存储。
  * **灵活性：** Loki 以单个二进制文件的形式提供，可以直接下载并运行，也可以作为 Docker 镜像在任何容器环境中运行。在 Kubernetes 中可以用一个 [Helm 海图][9] 快速上手。如果你对日志工具的要求很高，可以看看运行在 Grafana 实验室的 [生产环境][10]。它使用开源的 [Jsonnet][11] 和 [Tanka][12] 部署了同样的 Loki 镜像作为离散的构件，以实现大规模的水平扩展、高可用性、复制、读写路径的分别扩展、高度可并行的查询等。

总而言之，Loki 的方法是保留一个关于你的日志元数据的小索引（标签），并将未索引的、压缩的日志内容存储在廉价的对象存储中，以使操作更容易和更便宜。该应用程序被构建为单进程运行，并很容易演变成一个高可用的分布式系统。你可以通过并行化和查询的分片，在较大的日志工作负载上获得较高的查询性能 —— 有点像为你的日志设计的 MapReduce。

此外，这个功能是任何人都可以免费使用的。与其 [Grafana][13] 开放观测性平台一样，Grafana 实验室致力于将 Loki 打造成一个任何人都可以使用的全功能、全开放的日志聚合软件。

### 开始吧

我在树莓派上运行 Loki，并将我的 shell 历史记录异地存储在 S3 bucket 中。

当我按下 `CTRL+R`，Loki 的 [LogCLI][14] 命令行界面会发起几个批处理请求，传输至 `fzf`。下面是一个例子，上半部分显示的是树莓派上的 Loki 服务器日志。

![树莓派上 Loki 服务器的日志][15]

准备试试？下面的指南将帮助你设置和运行 Loki，与你的 shell 历史记录集成。为了让本教程保持简洁，此设置将 Loki 本地运行在你的计算机上，并在文件系统上存储所有文件。

在 [loki-shell 的 GitHub 版本库][16]，你可以找到所有这一切，以及如何设置一个更复杂的安装的信息。

请注意，本教程不会改变任何围绕你的历史记录的现有行为，所以 _你现有的 shell 历史记录命令和历史记录设置不会被触动_。相反，这将用 Bash 中的 `$PROMPT_COMMAND` 和 Zsh 中的 `precmd` 复制命令历史记录到 Loki。在 `CTRL+R` 方面，它重载了 `fzf` 用来访问 `CTRL+R` 命令的函数。因此试一试是安全的，如果你觉得不喜欢它，只需按照 GitHub 版本库中的 [卸载步骤][17] 来删除所有痕迹。你的 shell 历史记录不会被触及。

#### 第一步：安装 fzf

安装 `fzf` 有几种方法，但我更喜欢 [Git 方法][18]：

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

对所有的问题提示说 `yes`。

如果你已经安装了 `fzf`，确保你已经启用了键绑定（即，确保当你输入 `CTRL+R` 时，`fzf` 会弹出）。如果有必要的话，你可以重新运行 `fzf` 安装过程来启用键绑定。

#### 第二步：安装 loki-shell

和 `fzf` 一样，loki-shell 也有一个 Git 版本库和安装脚本：

```
git clone --depth 1 https://github.com/slim-bean/loki-shell.git ~/.loki-shell
~/.loki-shell/install
```

首先，该脚本创建了 `~/.loki-shell` 目录，所有的文件都将保存在该目录下（包括 Loki 数据），接下来，它将下载 [Promtail][19]、LogCLI 和 Loki 的二进制文件。

然后它会问：

```
Do you want to install Loki? ([y]/n)
```

如果你已经为 Loki-shell 运行了一个集中化的 Loki，你可以回答 `n`；然而，对于本教程，回答 `y` 或按回车键。

在本地运行 Loki 有两种方式：作为一个 Docker 镜像或作为一个单一的二进制文件（支持添加为 systemd 服务）。如果可以，我建议使用 Docker，因为我认为它稍微简化了操作，但这两者都可以工作。

##### 使用 Docker 运行

将 Loki 作为 Docker 镜像运行：

```
[y] to run Loki in Docker, [n] to run Loki as a binary ([y]/n) y
Error: No such object: loki-shell
Error response from daemon: No such container: loki-shell
Error: No such container: loki-shell
54843ff3392f198f5cac51a6a5071036f67842bbc23452de8c3efa392c0c2e1e
```

如果这是你第一次运行这个安装程序，你可以忽略错误信息。这个脚本将停止和替换运行的 Loki 容器，如果版本不匹配，你可以重新运行此脚本升级 Loki。

就是这样！Loki 现在作为一个 Docker 容器运行了。

Loki 的数据将存储在 `~/.loki-shell/data` 中。

由于带着 `-restart=unless-stopped` 标志运行该镜像，所以它会在系统重启时重启该服务，但如果你运行 `docker stop loki-shell` 则会保持停止。

（如果你使用的是 Docker，你可以跳到 “Shell 集成”一节。）

##### 以二进制文件运行

在 Linux 系统上运行二进制文件的方法有很多。这个脚本可以安装一个 systemd 服务。如果你没有 systemd，你也可以使用二进制安装：

```
[y] to run Loki in Docker, [n] to run Loki as a binary ([y]/n) n

Run Loki with systemd? ([y]/n) n

This is as far as this script can take you
You will need to setup an auto-start for Loki
It can be run with this command: /home/username/.loki-shell/bin/loki -config.file=/home/username/.loki-shell/config/loki-binary-config.yaml
```

脚本会输出你需要用来运行 Loki 的命令，你可以自己设置一个 init 脚本或其他方法来自动启动它。

如果你想的话，你可以直接运行该命令，从你当前的 shell 运行 Loki。

如果你有 systemd，你可以选择让脚本安装 systemd 服务或显示出你自己运行它的命令：

```
Run Loki with systemd? ([y]/n) y

Installing the systemd service requires root permissions.
[y] to run these commands with sudo [n] to print out the commands and you can run them yourself. ([y]/n) n
sudo cp /home/ed/.loki-shell/config/loki-shell.service /etc/systemd/system/loki-shell.service
sudo systemctl daemon-reload
sudo systemctl enable loki-shell
sudo systemctl start loki-shell
Copy these commands and run them when the script finishes. (press enter to continue)
```

##### Shell 集成

无论你如何安装 Loki，你现在应该看到一个提示：

```
Enter the URL for your Loki server or press enter for default (http://localhost:4100)
```

如果你已经设置了一个中心化的 Loki，你应在这里输入其 URL。然而，这个演示只是使用了默认的 URL，所以你可以按回车键。

它会输出很多文本来解释添加到你的 `~.bashrc` 或 `~.zshrc`（或两者）的所有条目。

好了！

```
Finished. Restart your shell or reload config file.
   source ~/.bashrc  # bash
   source ~/.zshrc   # zsh
```
#### 第三步：试试吧!

开始使用你的 shell，并使用 `CTRL+R` 查看你的命令。

打开多个终端窗口，在一个窗口中输入命令，在另一个窗口中输入 `CTRL+R`，你会看到你的命令立即可用。

另外，请注意，当你在终端之间切换并输入命令时，使用 `CTRL+R` 可以立即使用它们，但向上箭头的操作在终端之间不受影响。（如果你安装了 Oh My Zsh，情况可能就不一样了，因为它会自动将所有命令追加到历史记录中。）

多次按下 `CTRL+R` 可以在按时间排序和按相关性排序之间切换。

请注意，此配置将只显示当前主机的查询历史记录，即使你正在从多个主机向 Loki 发送 shell 数据。我认为默认情况下这是最合理的。如果你想改变这种行为，有很多地方可以调整；请参见 loki-shell 版本库了解更多。

它还安装了一个名为 `hist` 的别名。

```
alias hist="$HOME/.loki-shell/bin/logcli --addr=$LOKI_URL"
```

LogCLI 可以用来直接在 Loki 上查询和搜索你的历史，也允许你搜索其他主机。查看 LogCLI 的入门指南，了解更多关于查询的信息。

Loki 的日志查询语言（LogQL）提供了度量查询，可以让你做一些有趣的事情，例如，我可以看到在过去 30 天里我发出了多少次 `kc` 命令（我对 `kubectl` 的别名）。

![计数一个命令的使用次数][20]

### 额外增强

安装 Grafana，摆弄一下你的 shell 历史记录。

```
docker run -d -p 3000:3000 --name=grafana grafana/grafana
```

打开 Web 浏览器，访问 `http://localhost:3000`，使用默认的 `admin`/`admin` 用户名和密码登录。

在左边，导航到“<ruby>配置<rt>Configuration</rt></ruby>-><ruby>数据源<rt>Datasources</rt></ruby>”，点击“<ruby>添加数据源<rt>Add Datasource</rt></ruby>”按钮，然后选择 “Loki”。

对于 URL，你应该可以使用 `http://localhost:4100`（然而，在我的 WSL2 机器上，我必须使用计算机的实际 IP 地址）。

单击“<ruby>保存并测试<rt>Save and Test</rt></ruby>”。你应该看到连接了数据源并找到了标签。

点击左边的“<ruby>管理器<rt>Explore</rt></ruby>”图标，确保选择 Loki 数据源，并尝试这个查询：

```
{job="shell"}
```

如果发送 shell 命令的主机较多，可以使用“<ruby>主机<rt>Host</rt></ruby>”标签将结果限制在某个主机上：

```
{job="shell", hostname="myhost"}.
```

你也可以用过滤表达式寻找特定的命令：

```
{job="shell"} |= "docker"
```

或者你可以从日志中探索度量的世界，看看你使用 shell 的频率：

```
rate({job="shell"}[1m])
```

![计算过去 20 天内 shell 的使用情况][21]

想从一个事件中重建一个时间线？你可以通过特定的命令进行过滤，查看它的运行时间：

![计算命令的使用次数][22]

要想知道你还能做什么，并了解更多关于 Loki 查询语言的信息，请查看 LogQL 指南。

### 总结

更多的想法、故障排除和更新，请关注该 GitHub 版本库。这仍然是一项正在进行中的工作，所以请在那里报告发现的任何问题。

要了解更多关于 Loki 的信息，请查看文档、博客文章和该 GitHub 版本库，或者在 Grafana Cloud 中试用。

* * *

特别感谢我的同事 Jack Baldry 为这个想法播下的种子。我有 Loki 的知识来实现这个想法，但如果不是他的建议，我想我永远也不会做到这一点。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/shell-history-loki-fzf

作者：[Ed Welch][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ewelch
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/chaos_engineer_monster_scary_devops_gear_kubernetes.png?itok=GPYLvfVh (Gears above purple clouds)
[2]: https://github.com/grafana/loki
[3]: https://github.com/junegunn/fzf
[4]: https://opensource.com/sites/default/files/uploads/before.gif (Before Loki and fzf)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/with_fzf.gif (After Loki and fzf)
[7]: https://prometheus.io/
[8]: https://www.raspberrypi.org/
[9]: https://helm.sh/docs/topics/charts/
[10]: https://grafana.com/docs/loki/latest/installation/tanka/
[11]: https://jsonnet.org
[12]: https://tanka.dev/
[13]: https://grafana.com/
[14]: https://grafana.com/docs/loki/latest/getting-started/logcli/
[15]: https://opensource.com/sites/default/files/uploads/example_logcli.gif (Logs of the Loki server on Raspberry Pi)
[16]: https://github.com/slim-bean/loki-shell
[17]: https://github.com/slim-bean/loki-shell/blob/master/uninstall
[18]: https://github.com/junegunn/fzf#using-git
[19]: https://grafana.com/docs/loki/latest/clients/promtail/
[20]: https://opensource.com/sites/default/files/uploads/count_kc.png (Counting use of a command)
[21]: https://opensource.com/sites/default/files/uploads/last_20.png (Counting use of the shell over previous 20 days)
[22]: https://opensource.com/sites/default/files/uploads/command_hist.png (Counting use of a command)
