[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12139-1.html)
[#]: subject: (Create web tutorials with Reveal.js and Git)
[#]: via: (https://opensource.com/article/20/4/create-web-tutorial-git)
[#]: author: (Eric D. Schabell https://opensource.com/users/eschabell)

使用 Reveal.js 和 Git 创建网页教程
======

> 通过这个简单的工作流程创建的研讨会幻灯片，可以在任何浏览器、设备和平台上获得一致的查看效果。

![](https://img.linux.net.cn/data/attachment/album/202004/23/094800ohkpbjd3zbj0dj0d.jpg)

无论你是学习者还是教师，你可能都会认识到采用幻灯片放映来传播知识的在线<ruby>研讨会<rt>workshop</rt></ruby>的价值。如果你曾经偶然看到过这样一个逐页、逐章设置的井井有条的教程，你可能会想知道创建这样的一个网站有多难。

好吧，让我在这里向你展示，使用全自动化的流程来生成这样的教程是多么容易。

### 介绍

当我开始将学习内容放到网上置时，体验并不是很好。我想要的是一种可重复的、一致的、易于维护的东西，因为我的内容会随着我教学的技术发展而变化。

我尝试了许多交付模型，从 [Asciidoctor][2] 这样的低级代码生成器到在单个 PDF 文件中放置教程。全都不能让我满意。当我举办现场的在座研讨会时，我喜欢使用幻灯片放映，因此我想知道我是否可以为我自己的在线的，自定进度的研讨会体验做同样的事情。

经过一番挖掘，我为创建无痛的研讨会网站打下了基础。当时我已经在使用一个演示文稿生成框架，这对我来说是很有帮助的，因为这个框架可以产生对网站友好的格式（HTML）。

### 设置

这里是这个项目所需要的基本组件。

  * 研讨会的想法（这是你的问题，我帮不了你）
  * 用于研讨会幻灯片的 Reveal.js
  * GitLab 项目仓库
  * 你常用的 HTML 代码编辑器
  * Web 浏览器
  * 在你的机器上安装好 Git

如果这个列表看起来令人望而生畏，那么有一个快速入门的方法，不需要把所有的东西一个个都拉到一起。你可以用我的模板项目来给你提供幻灯片和项目设置的入门教程。

本文假设你熟悉 Git 和在 Git 平台（如 GitLab）上托管项目。如果你需要指导或教程，请查看我们的[Git 入门系列][3]。

首先，将模板项目克隆到本地机器上。

```
$ git clone https://gitlab.com/eschabell/beginners-guide-automated-workshops.git
```

为此设置一个新的 GitLab 项目，导入模板项目作为初始导入。

研讨会网站有一些重要的文件。在**根目录**下，你会发现一个名为 `.gitlab-ci.yml` 的文件，当你向主分支提交修改时（即将拉取请求合并到 `master` 分支），这个文件会作为触发器。它可以触发将 `slides` 目录的全部内容复制到 GitLab 项目的 `website` 文件夹中。

我把它托管在我的 GitLab 账户中，名为 `beginners-guide-automated-workshops`。当它部署完毕后，你可以在浏览器中通过导航到下列地址查看 `slides` 目录的内容:

```
https://eschabell.gitlab.io/beginners-guide-automated-workshops
```

对于你的用户帐户和项目，URL 如下所示：

```
https://[YOUR_USERNAME].gitlab.io/[YOUR_PROJECT_NAME]
```

这些是你开始创建网站内容所需要的基本素材。当你推送修改后，它们会自动生成更新过的研讨会网站。请注意，默认模板包含了几个示例幻灯片，这将是你完成对存储库的完整签入后的第一个研讨会网站。

研讨会模板生成的结果是一个 [receive.js][4] 幻灯片，可以在任何浏览器中运行，并可以自动调整大小，几乎可以让任何人在任何地方、任何设备上观看。

这样创建一个方便、易访问的研讨会怎么样？

### 它是如何工作的

有了这些背景信息，你就可以开始探索研讨会的这些素材，并开始把你的内容放在一起了。你需要的一切都可以在项目的 `slides` 目录中找到；这里是使用 reveal.js 在浏览器中创建研讨会幻灯片的地方。

你将用来制作研讨会的文件和目录是：

  * `default.css`文件
  * `images` 目录
  * `index.html`文件

在你常用的 HTML/CSS 编辑器中打开每一个文件，然后进行下面描述的修改。你用哪个编辑器并不重要，我更喜欢 [RubyMine IDE][5]，因为它能在本地浏览器中提供页面预览。这对我在将内容推送到研讨会网站之前测试内容时很有帮助。

#### default.css 文件

文件 `css/theme/default.css` 是一个基础文件，你将在这里为你的研讨会幻灯片设置重要的全局设置。其中值得注意的两个主要的项目是所有幻灯片的默认字体和背景图片。

在 `default.css` 中，看一下标有 `GLOBAL STYLES` 的部分。当前的默认字体在这一行中列出了。

```
font-family: "Red Hat Display", "Overpass", san-serif;
```

如果你使用的是非标准字体类型，则必须在以下行中将其导入（Overpass 字体类型就是这样做的）：

```
@import url('SOME_URL');
```

`background` 是你创建的每张幻灯片的默认图像。它存储在 `images` 目录下（见下面），并在下面这一行中设置（重点是图像路径）。

```
background: url("…/…/images/backgrounds/basic.png")
```

要设置一个默认背景，只需将这一行指向你要使用的图片。

#### images 目录

顾名思义，`images` 目录是用来存储你想在研讨会幻灯片上使用的图片。例如，我通常会把展示研讨会主题进展的截图放在我的个人幻灯片上。

现在，你只需要知道你需要将背景图片存储在一个子目录（`backgrounds`）中，并将你计划在幻灯片中使用的图片存储在 `images` 目录中。

#### index.html 文件

现在你已经把这两个文件整理好了，剩下的时间你就可以在 HTML 文件中创建幻灯片了，从 `index.html` 开始。为了让你的研讨会网站开始成形，请注意这个文件中的以下三个部分。

  * `head `部分，在这里你可以设置标题、作者和描述。
  * `body` 部分，你可以在这里找到要设计的单个幻灯片。
  * 你可以在每个 `section` 中定义各个幻灯片的内容。

从 `head` 部分开始，因为它在顶部。模板项目有三个占位符行供你更新。

```
<title>INSERT-YOUR-TITLE-HERE</title>
<meta name="description" content="YOUR DESCIPTION HERE.">
<meta name="author" content="YOUR NAME">
```

`title` 标签包含文件打开时显示在浏览器选项卡中的文字。请将其改为与你的研讨会的标题相关的内容（或研讨会的某个部分），但记得要简短，因为标签页的标题空间有限。`description` 元标签包含了对你的工作坊的简短描述，而 `author` 元标签是你应该把你的名字（如果你是为别人写的，则是工作坊创建者的名字）。

现在继续到 `body` 部分。你会注意到它被分成了许多 `section` 标签。`body` 的开头包含了一个注释，说明你正在为每个标有 `section` 的打开和关闭的标签创建幻灯片。

```
<body>
        <div class="reveal">

        <!-- Any section element inside of this container is displayed as a slide -->
        <div class="slides">
```

接下来，创建你的各个幻灯片，每张幻灯片都用 `section` 标签封装起来。这个模板包括了一些幻灯片来帮助你开始制作。例如，这里是第一张幻灯片。

```
<section>
      <div style="width: 1056px; height: 300px">
            <h1>Beginners guide</h1>
            <h2>to automated workshops</h2>
      </div>
      <div style="width: 1056px; height: 200px; text-align: left">
            Brought to you by,<br/>
            YOUR-NAME<br/>
      </div>
      <aside class="notes">Here are notes: Welcome to the workshop!</aside>
</section>
```

这张幻灯片有两个区域，用 `div` 标签分隔。用空格隔开了标题和作者。

如果你有一定的 HTML 使用知识，可以尝试各种东西来开发你的研讨会。使用浏览器预览结果的时候真的很方便。有些 IDE 提供了本地查看修改，但你也可以打开 `index.html` 文件查看你的修改，然后再推送到资源库中。

一旦你对你的研讨会感到满意，推送你的修改，然后等待它们通过持续集成管道。它们将像模板项目一样被托管在 <https://eschabell.gitlab.io/beginners-guide-automated-workshops>。

### 了解更多

要了解更多关于这个工作流程可以做什么，请查看下面的示例研讨会和托管了研讨会集合的网站。所有这些都是基于本文中描述的工作流程。

研讨会例子：

  * [Red Hat Process Automation Manage workshop][6]
  * [JBoss Travel Agency BPM Suite online workshop][7]

研讨会集合：

  * [Rule the world: Practical decisions & process automation development workshops][8]
  * [Application development in the cloud workshop][9]
  * [Portfolio architecture: Workshops for creating impactful architectural diagrams][10]

我希望这本新手指南和模板研讨会项目能让你看到，在开发和维护研讨会网站的过程中，可以轻松、无痛地完成。我也希望这个工作流程能让你的研讨会受众几乎在任何设备上都能完全访问你的内容，这样他们就能从你分享的知识中学习到你的知识。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/create-web-tutorial-git

作者：[Eric D. Schabell][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/eschabell
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/read_book_guide_tutorial_teacher_student_apaper.png?itok=_GOufk6N (Person reading a book and digital copy)
[2]: https://asciidoctor.org/
[3]: https://opensource.com/resources/what-is-git
[4]: https://revealjs.com/#/
[5]: https://www.jetbrains.com/ruby/
[6]: https://gitlab.com/bpmworkshop/rhpam-devops-workshop
[7]: https://gitlab.com/bpmworkshop/presentation-bpmworkshop-travel-agency
[8]: https://bpmworkshop.gitlab.io/
[9]: https://appdevcloudworkshop.gitlab.io/
[10]: https://redhatdemocentral.gitlab.io/portfolio-architecture-workshops
