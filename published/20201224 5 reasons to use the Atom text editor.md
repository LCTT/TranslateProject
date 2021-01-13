[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13009-1.html)
[#]: subject: (5 reasons to use the Atom text editor)
[#]: via: (https://opensource.com/article/20/12/atom)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Atom 文本编辑器的 5 个理由
======

> Atom 是一个全面的环境，可以完成从基本到复杂的任务，适合从初学者到老用户。

![](https://img.linux.net.cn/data/attachment/album/202101/13/122223fnsn53dpzllwlclp.jpg)

现在漂亮的开源文本编辑器很常见，有 Adobe 的 [Brackets][2]、微软的 [VSCode][3] 和 GitHub 的 [Atom][4]。这些似乎都提供了类似的体验：现代化的界面、易于安装的插件，以及背后的一个大厂商支持。而且它们其实都很不错。那么 Atom 与其他超现代的文本编辑器有什么不同呢？与经典的老式编辑器如 [Vim][5] 或 [Emacs][6] 有何区别呢？

![Atom terminal with white text on dark grey background][7]

我用过很多文本编辑器，并且经过反思，我不得不承认，所有的文本编辑器基本上都差不多。在判断一个编辑器的功效时，只要它能做一件事：编辑文字，就能满足 80% 的要求。另外的 20% 则是额外的便利、额外的小玩意和花哨的功能。它们是很好的东西，但几乎不是必不可少的。

不过我经常回到 Atom，因为作为一个开源的用户，只要我愿意，我就可以奢侈地有很多应用使用。以下是我喜欢 Atom 的原因。

### 新手友好

我最喜欢 Atom 的一点是，它让人感觉很“正常”。我可以把 Atom 安装在任何人的电脑上，他们很快就可以开始输入了。没有新的键盘快捷键需要学习，没有严重偏离用户界面的惯例。如果我花几分钟时间向他们展示一些应用的强大功能，那么他们很快就会有能力安装新的插件，发现他们喜欢的有用功能。

它的独特之处在于让人感到与众不同，但又足够“安全”，足以让人相信（也确实如此）他们可以使用它。这是一条很难走的路线，但 Atom 做到了，我很欣赏它。

### 强大的扩展

当你启动应用就已经满足了大多数需求时，开源文本编辑器的一个主要“卖点”就是它的扩展。我习惯使用的编辑器是 [GNU Emacs][8]，它的扩展功能多到令人瞠目结舌，可以提供从电子邮件客户端到视频游戏的所有功能。要做到这一点很难，老实说，我还没有看到其它能做到的编辑器。不过这说明了扩展是多么重要，而 Atom 有一套不错的插件。

有一些扩展可以为语言和格式添加语法高亮、添加动态格式检查、以及集成调试器、运行时环境、视频和音乐播放器控件等等。实际上，你可以让 Atom 成为你桌面的控制中心，你很少需要离开它。

### 语言和语法支持

我是 [Docbook][9] 的忠实粉丝。顺便说一下，也是它的简化前端 Asciidoc 的粉丝。当我评估一个编辑器时，Docbook 模式和 Asciidoc 支持是我的两个主要指标。虽然对 XML 的支持比较常见，但与特定模式的集成可能是一个高难度的任务，而且 Asciidoc 相对小众。Atom 的社区为我最喜欢的格式提供了很好的支持。

当然，我已经提到了 Atom 一般来说有很好的扩展，但无论你在输入什么语言，语法高亮都是一个重要的功能。再次感谢充满活力的社区，在 Atom 的软件包仓库中，丰富的语法高亮选项的是它的优点之一。

### 简单定制主题

Atom 让你制作自己的风格就像设计网站的风格一样简单，所以如果你会使用 CSS，你可以制作你自己的 Atom 主题。要创建你自己的主题，找到<ruby>软件包<rt>Package</rt></ruby>菜单。如果你没有看到<ruby>软件包<rt>Package</rt></ruby>菜单，先按 `Alt` 键，露出顶部菜单栏。在<ruby>软件包<rt>Package</rt></ruby>菜单中，将鼠标悬停在<ruby>软件包生成器<rt>Package Generator</rt></ruby> 上，然后选择<ruby>Generate Atom Syntax Theme<rt>生成 Atom 语法主题</rt></ruby>。这将打开一个新的项目，默认名为 “my-theme-syntax”。你可以把它命名为任何你想要的名字，但根据 Atom 惯例，它应该以 `-syntax` 结尾。

在你的新主题项目中，找到这些文件：`base.less`、`colors.less` 和 `syntax-variables.less`。这些文件定义了当语法激活时，特殊的关键字，甚至是背景和前景的颜色是如何显示的。因为它们都是从一个通用模板中继承的值，所以很容易修改。比如说：

```
// Syntax styles

.syntax--comment {
  color: @light-gray;
}

.syntax--keyword {
  color: @purple;

  &.syntax--control {
    color: @purple;
  }

  &.syntax--operator {
    color: @syntax-text-color;
  }

  &.syntax--other.syntax--special-method {
    color: @blue;
  }

  &.syntax--other.syntax--unit {
    color: @orange;
  }
}
```

以两个破折号结尾的值，如 `.syntax--keyword`，是语法高亮引擎识别的对象。当然，如果你想进一步开发你的自定义设置，你甚至可以创建你自己的语法定义（尽管这比 CSS 主题更费劲）。在 [flight-manual.atom.io][10] 上可以阅读所有关于修改 Atom 的方法。

### 灵活的工作流

Atom 有很多功能，默认情况下仅激活其中一部分。这意味着你可以决定你喜欢的工作方式，是否激活新的扩展并使用它们从根本上改变 Atom，还是只打开 Atom 的偏好并进行小的调整。你可以用 Atom 来写一本小说，也可以用它来写 Python 代码或技术文档或其他任何东西。

即使是它的 Git 集成也没有坚持让你使用可能会想到的显而易见的仓库（Github 赞助了 Atom）。它没有任何限制，而且它对每个人都同样有用，不管受众是谁。

### 安装

在 Linux、Windows 和 macOS 上，你可以 [从它的网站安装 Atom][11]。

另外，在 Linux 上，你可以从 [Flathub][12] 中，以 Flatpak 安装 Atom。

如果你想自己构建 Atom，你也可以 [从 Github 上的源码编译它][13]。

### 尝试 Atom

Atom 可以成为你的下一个文本编辑器、记事本和 IDE。它易于使用、易于配置、易于扩展，并提供了良好的用户体验。今天就下载 Atom，试试吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/atom

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://opensource.com/article/20/12/brackets
[3]: https://opensource.com/article/20/12/%C2%A0https://opensource.com/article/20/6/open-source-alternatives-vs-code
[4]: https://opensource.com/article/17/5/atom-text-editor-packages-writers
[5]: https://opensource.com/article/20/12/vi-text-editor
[6]: https://opensource.com/article/20/12/emacs
[7]: https://opensource.com/sites/default/files/uploads/atom-31_days-atom-opensource.png (Atom terminal with white text on dark grey background)
[8]: https://opensource.com/article/20/2/who-cares-about-emacs
[9]: https://opensource.com/article/17/9/docbook
[10]: https://flight-manual.atom.io/
[11]: https://atom.io
[12]: https://flathub.org/apps/details/io.atom.Atom
[13]: https://github.com/atom
