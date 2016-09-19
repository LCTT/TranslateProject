Googler:现在可以 Linux 终端下进行 Google 搜索了！
============================================

![](https://itsfoss.com/wp-content/uploads/2016/09/google-from-linux-terminal.jpg)

一个小问题：你每天做什么事？当然了，好多事情，但是我可以指出一件事，你几乎每天（如果不是每天）都会用 Google 搜索，我说的对吗？

现在，如果你是一位 Linux 用户（我猜你也是），这里有另外一个问题：如果你甚至不用离开终端就可以进行 Google 搜索那岂不是相当棒？甚至不用打开一个浏览器窗口？

如果你是一位类 Unix 系统的狂热者而且也是喜欢终端界面的人，我知道你的答案是肯定的，而且我认为，接下来你也将喜欢山我今天将要介绍的这个漂亮的小工具。他被称做 Googler。


### Googler:在你 linux 终端下的 google

Googler 是一个简单的命令行工具用于直接在命令行窗口中进行 google 搜索，Googler 主要支持三种类型的 Google 搜索：

- Google 搜索：简单的 Google 搜索，和在 Google 主页搜索是等效的。
- Google 新闻搜索：Google 新闻搜索，和在 Google News 中的搜索一样。
- Google 站点搜索：Google 从一个特定的网站搜索结果。

Googler 用标题，链接和网页摘要来显示搜索结果。搜索出来的结果可以仅通过两个按键就可以在浏览器里面直接打开。

![](https://itsfoss.com/wp-content/uploads/2016/09/googler-1.png)

### 在 Ubuntu 下安装 Googler

先让我们进行软件的安装

首先确保你的 python 版本大于等于3.3，可以用以下命令查看。

```
python3 --version
```

如果不是的话，就更新一下。Googler 要求 python 版本 3.3 及以上运行。

虽然 Googler 现在还不能在 Ununtu 的软件库中找到，我们可以很容易地从 GitHub 仓库中安装它。我们需要做的就是运行以下命令：

```
cd /tmp
git clone https://github.com/jarun/googler.git
cd googler
sudo make install
cd auto-completion/bash/
sudo cp googler-completion.bash /etc/bash_completion.d/
```

这样 Googler 就带着命令自动完成特性安装完毕了。

### 特点&基本用法

如果我们快速浏览它所有的特点，我们会发现 Googler 实际上是一个十分强大的工具，他的一些主要特点就是：

交互界面：在终端下运行以下命令

```
googler
```

交互界面就会被打开，Googler 的开发者，Arun Prakash Jana 称之为提示符，你可以输入？去寻找可用的命令参数
![](https://itsfoss.com/wp-content/uploads/2016/09/googler-2.png)

在提示符处，输入任何搜索词汇关键字去开始搜索，然后你可以输入n或者p去导航到搜索结果的后一页和前一页。

为了在浏览器窗口中打开任何搜索结果，直接输入搜索结果的编号，或者你可以输入 o 命令来打开搜索到的网页。
- 新闻搜索：如果你想去搜索新闻，直接以N参数启动 Googler：

```
googler -N
```

随后的提示符将会从 Google News 抓取结果。

- 站点搜索：如果你想从某个特定的站点进行搜索，以w【域名】参数启动 Googler：

```
googler -w itsfoss.com
```

随后的提示符会只从这个博客中抓取结果！

- 手册页：运行以下命令去查看 Googler 的带着各种用例的手册页：

```
man googler
```

- Google 领域搜索引擎：

```
googler -c in "hello world"
```

上面的示例命令将会开始从 Google 的印度域名搜索结果（in 代表印度）

- 通过时间和语言偏好来过滤搜索结果
- 支持 Google 查询关键字，例如：site:example.com 或者 filetype:pdf 等等
- 支持 HTTPS 代理
- Shell 命令自动补全
- 禁用自动拼写纠正

这里还有更多特性。你可以用 Googler 去满足你的需要。

Googler也可以和一些基于文本的浏览器整合在一起 ( 例如 – [elinks][2], [links][3], [lynx][4], w3m 等), 所以你甚至都不用离开终端去浏览网页。在 Googler 的 GitHub 工程页可以找到指导。 [Googler 的 GitHub 项目主页][5].

如果你想看一下 Googler 不同的特性的视频演示，你可以随意查看GitHub工程页附带的终端记录演示页： [jarun/googler v2.7 quick demo][6].

### 对于 Googler 的看法？

尽管 googler 可能并不是对每个人都是必要和渴望的，对于一些不想打开浏览器进行 google 搜索或者仅仅是想花费尽可能多的时间在终端窗口上的人来说，这是一个很棒的工具。你认为呢？

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Munif Tanjim][a]
译者：[LinuxBars](https://github.com/LinuxBars)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/munif/
[1]: https://github.com/jarun
[2]: http://elinks.or.cz/
[3]: http://links.twibright.com/
[4]: http://lynx.browser.org/
[5]: https://github.com/jarun/googler#faq
[6]: https://asciinema.org/a/85019
