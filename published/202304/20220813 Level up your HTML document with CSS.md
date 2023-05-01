[#]: subject: "Level up your HTML document with CSS"
[#]: via: "https://opensource.com/article/22/8/css-html-project-documentation"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "XiaotingHuang22"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15721-1.html"

使用 CSS 提升你的 HTML 文档
======

![][0]

> 使用 CSS 让你的 HTML 项目更具风格。

当你编写文档时，无论是为开源项目还是技术写作项目，你都应该有两个目标：文档应该写得好，同时要易于阅读。前者通过清晰的写作技巧和技术编辑来解决。第二个目标可以通过对 HTML 文档进行一些简单的更改来解决。

超文本标记语言（HTML）是互联网的支柱。自 1994 年“万维网”问世以来，所有网络浏览器都使用 HTML 来显示文档和网站。几乎与此同时，HTML 一直支持样式表，它是对 HTML 文档的一种特殊添加，用于定义文本在屏幕上的呈现方式。

单纯用 HTML 编写项目文档也是可以的。然而，纯 HTML 样式可能感觉有点简陋。因此，尝试向 HTML 文档添加一些简单的样式，为文档添加一点活力，并使文档更清晰、更易于阅读。

### 定义一个 HTML 文档

让我们从一个纯 HTML 文档开始，探索如何向其添加样式。一个空的 HTML 文档在顶部包含 `<!DOCTYPE html>` 定义，后面跟着一个 `<html>` 块来定义文档本身。 在 `<html>` 元素中，你还需要加上一个文档标头，其中包含有关文档的元数据，例如标题。文档正文的内容放在父 `<html>` 块内的 `<body>` 块中。

你可以使用以下 HTML 代码定义一个空白页面：

```
<!DOCTYPE html>
<html>
  <head>
    <title>这是一个新文档</title>
  </head>
  <body>

  </body>
</html>
```

在另一篇关于 [用 HTML 编写项目文档][2] 的文章中，我将一个开源棋盘游戏的自述文件从纯文本更新为 HTML 文档，并使用一些基本的 HTML 标记，如 `<h1>` 和 `<h2>` 作为标题和副标题，`<p>` 用于段落，`<b>` 和 `<i>` 用于粗体和斜体文本。让我们从那篇文章结束的地方继续讲：

```
<!DOCTYPE html>
<html>
  <head>
    <title>简易 Senet</title>
  </head>
  <body>
    <h1>简易 Senet</h1>
    <h2>游戏玩法</h2>
    
    <p>游戏会自动为你“投掷”投掷棒，并在屏幕右下角显示结果。</p>
    
    <p>如果“投掷”结果为零，你失去本轮机会。</p>
    
    <p>轮到你的时候，游戏会自动选择
    你在棋盘上的第一块棋子。 你不一定
    能够用这个棋子走棋，所以选择你的棋子
    移动，然后按 <i>Space</i>（或 <i>Enter</i>）移动
    它。 你可以通过几种不同的方法进行选择：</p>
    
    <ul>
      <li><i>向上</i>/<i>向下</i>/<i>向左</i>/<i>向右</i> to
      朝特定方块移动。</li>
    
      <li>加号 (<b>+</b>) 或减号 (<b>-</b>) 使棋子在棋盘上向“左”或向“右”移动。
      请注意，它们会自动遵循棋盘的“倒过来的 S”方向移动。</li>
    
      <li><em>Tab</em>在棋盘上选择下一个你想要移动的棋子。</li>
    </ul>
    
    <p>要随时退出游戏，请按 <b>Q</b>（大写
    Q）或按 <i>Esc</i>，这样游戏会提示你是否想要
    放弃比赛。</p>
    
    <p>如果你比对手更快将所有棋子移出棋盘，你就赢得了比赛。
    这同时需要运气和游戏策略！</p>
  </body>
</html>
```

此 HTML 文档演示了利用 HTML 的技术写作者经常使用的一些块和内联元素。块元素在围绕文本定义一个矩形。段落和标题就是块元素，因为它们从文档的左边缘延伸到右边缘。例如，`<p>` 在段落周围包含一个不可见的矩形。相比之下，内联元素的使用则紧跟在它们包围的文本。如果你在段落中的某些文本上使用 `<b>`，则只有被 `<b>` 和 `</b>` 包围的文本会变为粗体。

你可以将直接样式应用于此文档以更改字体、颜色和其他文本样式，但修改文档外观的更有效方法是将样式表应用于文档本身。你可以在 `<head>` 元素中使用其他元数据执行此操作。你可以为样式表引用文件，但在这个例子中，我使用 `<style>` 块在文档中定义样式表。以下是带有空样式表的 `<head>` ：

```
<!DOCTYPE html>
<html>
  <head>
    <title>简易 Senet</title>
    <style>

    </style>
  </head>
  <body>
    ...
  </body>
</html>
```

### 定义样式

由于你刚刚开始学习样式表，因此这里先演示一种基本样式：背景色。我喜欢从背景颜色开始，因为它有助于演示块和内联元素。让我们应用一个有点华丽的样式表，为所有 `<p>` 段落设置*浅蓝色*背景颜色，为 `<ul>` 无序列表设置*浅绿色*背景。对任何粗体文本使用*黄色*背景，对任何斜体文本使用*粉红色*背景。

你可以在 HTML 文档的 `<style>` 块中使用样式来定义这些样式。样式表使用与 HTML 文档不同的标记。样式语法看起来像 `element { style; style; style; ... }` 并使用花括号将多种文本样式组合到一个定义中。

```
<style>
p { background-color: lightblue; }
ul { background-color: lightgreen; }

b { background-color: yellow; }
i { background-color: pink; }
    </style>
```

请注意，每个样式都以分号结尾。

如果在网页浏览器中查看此 HTML 文档，你可以看到 `<p>` 和 `<ul>` 块元素如何填充为矩形，而 `<b>` 和 `<i>` 内联元素仅突出显示粗体和斜体文本。 这种对比色的使用可能看起来不太好看，但我想你可以清楚看到块和内联元素：

![辣眼睛！但是这些颜色确实能帮助我么更好地看出块和內联元素的区别。][3]

### 应用样式

你可以使用样式使这个自述文件更易于阅读。 因为你刚刚开始学习样式，还是先只用一些简单的样式元素：

* `background-color` 设置背景颜色
* `color` 设置文字颜色
* `font-family` 使用不同的文本字体
* `margin-top` 在元素上方添加空间
* `margin-bottom` 在元素下方添加空间
* `text-align` 改变文本的对齐方式，例如靠左、靠右或居中

让我们重新开始你的样式表并将这些新样式应用到文档中。首先，在文档中使用更令人愉悦的字体。如果你的 HTML 文档没有指定字体，网络浏览器会为你选择一种。根据浏览器的设置方式，这可能是衬线字体（如我的屏幕截图中使用的字体）或无衬线字体。衬线字体在每个字母上添加了一个小笔画，这样在打印时更容易阅读。无衬线字体缺少这种额外的笔划，这使得文本在计算机显示器上显得更清晰。常见的衬线字体包括 Garamond 或 Times New Roman。 流行的无衬线字体包括 Roboto 和 Arial。

例如，要将文档正文字体设置为 Roboto，你可以使用以下样式：

```
body { font-family: Roboto; }
```

通过设置字体，你假设查看文档的人也安装了该字体。有些字体已经十分常见，以至于它们被认为是事实上的“网页安全”字体。 这些字体包括 Arial 等无衬线字体和 Times New Roman 等衬线字体。Roboto 是一种较新的字体，可能还无法随处可用。因此，网页设计师通常不会只列出一种字体，而是设置一种或多种“备用”字体。你可以通过用逗号分隔来添加这些替代字体。 例如，如果用户的系统上没有 Roboto 字体，你可以使用以下样式定义将 Arial 字体用作文本正文：
      
```
body { font-family: Roboto, Arial; }
```

所有网络浏览器都定义了默认的衬线和无衬线字体，你可以使用这些名称来引用它们。用户可以更改他们喜欢用于显示衬线和无衬线的字体，因此不太可能对每个人都一样，但在字体列表中使用 `serif` 或 `sans-serif` 通常是个好主意。通过添加该字体，至少用户可以大致了解你希望 HTML 文档的呈现方式：

```
body { font-family: Roboto, Arial, sans-serif; }
```

如果字体名称不止一个单词，则你必须在其两边加上引号。HTML 允许你在此处使用单引号或双引号。 为标题和副标题定义一些衬线字体，包括 Times New Roman：

```
h1 { font-family: "Times New Roman", Garamond, serif; }
h2 { font-family: "Times New Roman", Garamond, serif; }
```

请注意，H1 标题和 H2 副标题使用完全相同的字体定义。如果你想避免无谓的打字，可以使用样式表快捷方式为 H1 和 22 使用相同的样式定义：

```
h1, h2 { font-family: "Times New Roman", Garamond, serif; }
```

在编写文档时，许多技术作者更喜欢将主标题放在页面的中央。你可以在块元素（例如 H1 标题）上使用 `text-align` 来使标题居中：

```
h1 { text-align: center; }
```

为了让粗体和斜体文本更突出，请将它们置于稍微不同的颜色中。对于某些文档，我可能会使用深蓝表示粗体文本，使用深绿表示斜体文本。这些颜色非常接近黑色，但颜色的细微差别足以吸引读者的注意力。

```
b { color: darkblue; }
i { color: darkgreen; }
```

最后，我更喜欢在我的列表元素周围添加额外的间距，以使它们更易于阅读。如果每个列表项只有几个词，额外的空间可能无关紧要。但是我的示例文本中的中间项很长，可以换到第二行。 额外的空间有助于读者更清楚地看到此列表中的每个项目。 你可以使用边距样式在块元素上方和下方添加空间：

```
li { margin-top: 10px; margin-bottom: 10px; }
```

这种样式定义了一个距离，此处我将其指定为每个列表元素上方和下方的 10px（十个*像素*）。 你可以使用多种不同的距离度量。十像素实际上就是屏幕上十个像素的空间，无论是台式机显示器、笔记本电脑显示屏，还是手机或平板电脑屏幕。

假设你真的只是想在列表元素之间添加一个额外的空行，你也可以使用 `em` 来测量。`em` 是一个旧的排版术语，如果你指的是左右间距，它就是大写 `M` 的宽度，或者对于垂直间距，就是大写 `M` 的高度。所以你可以改用 1em 来写边距样式：

```
li { margin-top: 1em; margin-bottom: 1em; }
```

HTML 文档中的完整样式列表如下所示：

```
<!DOCTYPE html>
<html>
  <head>
    <title>简易 Senet</title>
    <style>
      body { font-family: Roboto, Arial, sans-serif; }
      h1, h2 { font-family: "Times New Roman", Garamond, serif; }
      h1 { text-align: center; }
      b { color: darkblue; }
      i { color: darkgreen; }
      li { margin-top: 1em; margin-bottom: 1em; }
    </style>
  </head>
  <body>
    <h1>简易 Senet</h1>
    <h2>游戏玩法</h2>
    
    <p>游戏会自动为你“投掷”投掷棒，并在屏幕右下角显示结果。</p>
    
    <p>如果“投掷”结果为零，你失去本轮机会。</p>
    
    <p>轮到你的时候，游戏会自动选择
    你在棋盘上的第一块棋子。 你不一定
    能够用这个棋子走棋。所以选择你的棋子
    移动，然后按 <i>Space</i>（或 <i>Enter</i>）移动
    它。 你可以通过几种不同的方法进行选择：</p>
    
    <ul>
      <li><i>向上</i>/<i>向下</i>/<i>向左</i>/<i>向右</i> to
      朝特定方块移动。</li>
    
      <li>加号 (<b>+</b>) 或减号 (<b>-</b>) 使棋子在棋盘上向“左”或向“右”移动。
      请注意，它们会自动遵循棋盘的“倒过来的 S”方向移动。</li>
    
      <li><em>Tab</em>在棋盘上选择下一个你想要移动的棋子。</li>
    </ul>
    
    <p>要随时退出游戏，请按 <b>Q</b>（大写
    Q）或按 <i>Esc</i>，这样游戏会提示你是否想要
    放弃比赛。</p>
    
    <p>如果你比对手更快将所有棋子移出棋盘，你就赢得了比赛。
    这同时需要运气和游戏策略！</p>
  </body>
</html>
```

在网页浏览器上查看时，你会看到采用无衬线字体的自述文件，标题和副标题使用衬线字体。 页面标题居中。粗体和斜体文本使用略有不同的颜色来吸引读者的注意力而不会分散注意力。 最后，列表项周围有额外的空间，使每个项目更易于阅读。

![通过添加一些样式，我们使这个自述文件更易于阅读。][4]

这是在技术写作中使用样式的简单介绍。掌握了基础知识后，你可能会对 [Mozilla 的 HTML 指南][5] 感兴趣。它包括一些很棒的初学者教程，因此你可以学习如何创建自己的网页。

有关 CSS 样式的更多信息，我推荐 [Mozilla 的 CSS 指南][6]。

*（题图： MJ:web internet traffic design）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/css-html-project-documentation

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[XiaotingHuang22](https://github.com/XiaotingHuang22)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/painting_computer_screen_art_design_creative.png
[2]: https://opensource.com/article/22/8/writing-project-documentation-html
[3]: https://opensource.com/sites/default/files/2022-08/style-html-1.png
[4]: https://opensource.com/sites/default/files/2022-08/style-html-2.png
[5]: https://developer.mozilla.org/en-US/docs/Web/HTML
[6]: https://developer.mozilla.org/en-US/docs/Web/CSS
[0]: https://img.linux.net.cn/data/attachment/album/202304/14/155136ypp8ziciecvunbpl.jpg