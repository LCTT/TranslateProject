[#]: subject: "Write your screenplay on Linux in Fountain markdown"
[#]: via: "https://opensource.com/article/21/12/linux-fountain"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14114-1.html"

在 Linux 上用 Markdown 编写你的电影剧本
======

> Fountain markdown 技术只需要一个纯文本编辑器，如 Atom、Kate、Gedit 或类似的编辑器，它可以导出一个正确格式的 HTML 或 PDF 剧本。

![](https://img.linux.net.cn/data/attachment/album/202112/25/102630gl455tbmkq9lq5ty.jpg)

剧本是一部电影的蓝图，过去它是在打字机上撰写的。你买台打字机就可以写剧本，可以写好多好多剧本。而现在没人用打字机写剧本了，因为打字机不再流行。

不过，令人费解的是，随着写作技术变得 “越好”，写剧本就越难。在剧本领域有严格的格式化规则，以帮助电影拍摄中的助理导演（AD）估计每个场景需要拍摄多长时间。你可能认为电脑会比在打字机上的完全手工过程更容易做到。然而，流行的计算机却用昂贵的软件来限制作家，这些软件已经嵌入了好莱坞文化。如果你没有合适的软件，你就会被告知，你永远不可能成为一个正式的编剧。

不过，所有这些都随着开源软件的出现而改变，写剧本的最简单方法之一就是根本不使用特殊的软件。[Fountain][2] markdown 技术只需要一个纯文本编辑器，如 [Atom][3]、[Kate][4]、[Gedit][5]，或类似的，它可以导出一个正确格式的 HTML 或 PDF 剧本。

### 安装 Fountain

Fountain 不需要安装，因为它不是软件；它是一套你在写作时使用的规则。你在写作时已经遵循了一些规则，比如你把句子的第一个字母大写，用句号来结束每句话，等等。当你用 Fountain 写作时，只需要添加一些专门针对剧本的新规则。

### 片段

在剧本中，每个场景都由一行大写字母划定，以 `INT.` 或 `EXT.` 开头，然后是一个地点、一个破折号，以及一天中的时间。这些说明被称为 “片段”。方便的是，这也是 Fountain 的规则，所以不用记住什么新的东西就可以创建一个片段。

```
EXT. CASTLE COURTYARD - DAY
```

### 动作

当演员被要求执行一个特定的动作时，剧本中就会包含动作文本。这是正常的普通文本，完全按照你在书中写的文字来写。所有正常的规则都适用，所以对动作文本不用特别记什么规则。

```
A wizard wanders out of a great stone door. She approaches the center of the courtyard and pauses. Something's caught her eye.

It's a book. She leans down and picks it up.
```

### 对话

剧本中的对话格式是从左右边距缩进的。对于普通观众来说，它可能看起来是居中的，但实际上它是左对齐的。采用这种格式是为了帮助演员定位他们的台词，并使得剧本给口语对话留出更多的空间，因为在电影中，口语对话往往占据了大部分的时间。

在 Fountain 中，对话的规则是用大写字母写出说话的角色的名字。然后在下一行，正常写出对话内容。

```
WIZARD

I can sense your power. Grep? Sed? What strange terms!
```

当你导出你的剧本时，对话会被调整为适当的格式。

### 转场

现在这种做法已经不流行了，但传统上，在剧本中会有一些特殊的转场迹象，因为在很久以前，一些转场是要花很多钱的。今天，你仍然可以在剧本中看到转场，但它往往更多的是作为一组场景（或者，经典的整个电影<ruby>淡出<rt>FADE OUT.</rt></ruby>）的一种标点符号，而不是对编辑的实际指示。

要在 Fountain 中创建一个过渡，在你的文本前加上大于号（`>`）。

```
>ANGLE ON:

The book's title page. It reads "Introduction to Linux."

>FADE OUT.

```

### 更多的规则

你可以在你的剧本中使用许多其他的 Markdown 约定，比如用星号来斜体、加粗和给文字加下划线。在 Fountain 中还有更多的规则来处理边缘情况和风格上的例外，但这四条规则在大多数情况下是你所需要的。

不过，Fountain 的简单性表明，一百年前的剧本格式设计得多么好。它有一个标准的结构，使人的眼睛很容易解析，这种可预测性也能很好地转化为计算机的解析。

### 输出和渲染

一旦你写完了，你就可以使用渲染程序将你的剧本导出为适当的格式。有 [几个渲染器可用][6]，但我最喜欢的是 Atom 编辑器。要配置 Atom 以适当的格式显示 Fountain 预览文件，并在完成后将其导出为 PDF，请进入“编辑” 菜单，选择 “偏好”，并点击左侧面板中的 “安装” 链接。在搜索栏中，输入 “fountain” 来安装由开发者 _superlou_ 发布的 Fountain 插件。

![为 Atom 安装一个 Fountain 插件 (Seth Kenlon, CC BY-SA 4.0)][7]

在安装时，你会被提示同意安装它的一些依赖项。一旦安装完毕，你可以进入 “软件包” 菜单，选择 “Fountain”，然后查看你的剧本预览或导出 PDF 版本。

Emacs 也有一个 Fountain 模式 ，它还可以在你输入时执行一些基本的格式化。

![Emacs 中的 Fountain 模式 (Seth Kenlon, CC BY-SA 4.0)][8]

无论你使用什么文本编辑器，你总是可以使用专门的应用程序来渲染你的剧本。有一个叫 `Screenplain` 的 Python 模块我觉得很好用。要安装它，请在终端键入以下内容：

```
$ python3 -m pip install 'screenplain[PDF]' --user
```

这样将一个剧本渲染成 PDF：

```
$ screenplain --format pdf myscreenplay.fountain > script.pdf
```

![渲染后的 Fountain 文件 (Seth Kenlon, CC BY-SA 4.0)][9]

### 开源的电影剧本

Fountain 是方便的。你可以撰写你的剧本，而不需要特别复杂的应用程序。

Fountain 是省钱的。你可以撰写你的剧本而不需要昂贵的软件。

Fountain 是灵活的。你可以在你用来写作的应用程序中进行创作。

Fountain 是适宜保存的。你不会因为一个应用程序过时了，或者没有商业支持了，或者因为你买不起而不能访问你的作品。

使用 Fountain 有很多很好的理由，但最重要的一点是它能帮助你专注于创作。如果你心中酝酿了一部电影，就用 Fountain 来写。这是通向可能是一个非常令人兴奋的旅程的第一步。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/linux-fountain

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/doc-dish-lead.png?itok=h3fCkVmU (Typewriter in the grass)
[2]: http://fountain.io
[3]: https://opensource.com/article/20/12/atom
[4]: https://opensource.com/article/20/12/kate-text-editor
[5]: https://opensource.com/article/20/12/gedit
[6]: https://fountain.io/apps
[7]: https://opensource.com/sites/default/files/fountain-atom.jpg (Install a Fountain plugin for Atom)
[8]: https://opensource.com/sites/default/files/fountain-emacs_0.jpg (Fountain-mode in Emacs)
[9]: https://opensource.com/sites/default/files/fountain-render.jpg (A rendered Fountain file)
