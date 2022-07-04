[#]: subject: "Write your first JavaScript code"
[#]: via: "https://opensource.com/article/21/7/javascript-cheat-sheet"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14740-1.html"

编写你的第一段 JavaScript 代码
======

> JavaScript 是为 Web 而生的，但它可以做的事远不止于此。本文将带领你了解它的基础知识，然后你可以下载我们的备忘清单，以便随时掌握详细信息。

![](https://img.linux.net.cn/data/attachment/album/202206/21/114718zzb8f6na6lgb28cn.jpg)

JavaScript 是一种充满惊喜的编程语言。许多人第一次遇到 JavaScript 时，它通常是作为一种 Web 语言出现的。所有主流浏览器都有一个 JavaScript 引擎；并且，还有一些流行的框架，如 JQuery、Cash 和 Bootstrap 等，它们可以帮助简化网页设计；甚至还有用 JavaScript 编写的编程环境。它似乎在互联网上无处不在，但事实证明，它对于 [Electron][2] 等项目来说也是一种有用的语言。Electron 是一个构建跨平台桌面应用程序的开源工具包，它使用的语言就是 JavaScript。

JavaScript 语言的用途多到令人惊讶，它拥有各种各样的库，而不仅仅是用于制作网站。它的基础知识十分容易掌握，因此，它可以作为一个起点，助你跨出构建你想象中的东西的第一步。

### 安装 JavaScript

随着你的 JavaScript 水平不断提高，你可能会发现自己需要高级的 JavaScript 库和运行时环境。不过，刚开始学习的时候，你是根本不需要安装 JavaScript 环境的。因为所有主流的 Web 浏览器都包含一个 JavaScript 引擎来运行代码。你可以使用自己喜欢的文本编辑器编写 JavaScript，将其加载到 Web 浏览器中，接着你就能看到代码的作用。

### 上手 JavaScript

要编写你的第一个 JavaScript 代码，请打开你喜欢的文本编辑器，例如 [Atom][4] 或 [VSCode][5] 等。因为它是为 Web 开发的，所以 JavaScript 可以很好地与 HTML 配合使用。因此，我们先来尝试一些基本的 HTML：

```
<html>
  <head>
    <title>JS</title>
  </head>
  <body>
    <p id="example">Nothing here.</p>
  </body>
</html>
```

保存这个文件，然后在 Web 浏览器中打开它。

![浏览器中显示的 HTML][6]

要将 JavaScript 添加到这个简单的 HTML 页面，你可以创建一个 JavaScript 文件并在页面的 `<head>` 中引用它，或者只需使用 `<script>` 标记将 JavaScript 代码嵌入 HTML 中。在这个例子中，我嵌入了下面的代码：

```
<html>
  <head>
    <title>JS</title>
  </head>
  <body>
    <p id="example">Nothing here.</p>

    <script>
      let myvariable = "Hello world!";

      document.getElementById("example").innerHTML = myvariable;
    </script>

  </body>
</html>
```

在浏览器中重新加载页面。

![在浏览器中显示带有 JavaScript 的 HTML][7]

如你所见，`<p>` 标签仍然包含字符串 `"Nothing here"`，但是当它被渲染时，JavaScript 会改变它，使其包含 `"Hello world"`。是的，JavaScript 具有重建​​（或只是帮助构建）网页的能力。

这个简单脚本中的 JavaScript 做了两件事。首先，它创建一个名为 `myvariable` 的变量，并将字符串 `"Hello world!"` 放置其中。然后，它会在当前文档（浏览器呈现的网页）中搜索 ID 为 `example` 的所有 HTML 元素。当它找到 `example` 时，它使用了 `innerHTML` 函数将 HTML 元素的内容替换为 `myvariable` 的内容。（LCTT 译注：这里作者笔误了，`innerHTML` 是“属性”而非“函数”。）

当然，我们也可以不用自定义变量。因为，使用动态创建的内容来填充 HTML 元素也是容易的。例如，你可以使用当前时间戳来填充它：

```
<html>
  <head>
    <title>JS</title>
  </head>
  <body>
    <p id="example">Date and time appears here.</p>

    <script>
      document.getElementById("example").innerHTML = Date();
    </script>
    
  </body>
</html>
```

重新加载页面，你就可以看到在呈现页面时生成的时间戳。再重新加载几次，你可以观察到秒数会不断增加。

### JavaScript 语法

在编程中，<ruby>语法<rt>syntax</rt></ruby> 指的是如何编写句子（或“行”）的规则。在 JavaScript 中，每行代码必须以分号（`;`）结尾，以便运行代码的 JavaScript 引擎知道何时停止阅读。（LCTT 译注：从实用角度看，此处的“必须”其实是不正确的，大多数 JS 引擎都支持不加分号。Vue.js 的作者尤雨溪认为“没有应该不应该，只有你自己喜欢不喜欢”，他同时表示，“Vue.js 的代码全部不带分号”。详情可以查看他在知乎上对于此问题的 [回答][10]。）

单词（或 <ruby>字符串<rt>strings</rt></ruby>）必须用引号（`"`）括起来，而数字（或 <ruby>整数<rt>integers</rt></ruby>）则不用。

几乎所有其他东西都是 JavaScript 语言的约定，例如变量、数组、条件语句、对象、函数等等。

### 在 JavaScript 中创建变量

变量是数据的容器。你可以将变量视为一个盒子，你在其中放置数据，以便与程序的其他部分共享它。要在 JavaScript 中创建变量，你可以选用关键字 `let` 和 `var` 中的一个，请根据你打算如何使用变量来选择：`var` 关键字用于创建一个供整个程序使用的变量，而 `let` 只为特定目的创建变量，通常在函数或循环的内部使用。（LCTT 译注：还有 `const` 关键字，它用于创建一个常量。）

JavaScript 内置的 `typeof` 函数可以帮助你识别变量包含的数据的类型。使用第一个示例，你可以修改显示文本，来显示 `myvariable` 包含的数据的类型：

```
<string>
let myvariable = "Hello world!";
document.getElementById("example").innerHTML = typeof(myvariable);
</string>
```

接着，你就会发现 Web 浏览器中显示出 “string” 字样，因为该变量包含的数据是 `"Hello world!"`。在 `myvariable` 中存储不同类型的数据（例如整数），浏览器就会把不同的数据类型打印到示例网页上。尝试将 `myvariable` 的内容更改为你喜欢的数字，然后重新加载页面。

### 在 JavaScript 中创建函数

编程中的函数是独立的数据处理器。正是它们使编程得以 *模块化*。因为函数的存在，程序员可以编写通用库，例如​​，调整图像大小或统计时间花费的库，以供其他和你一样的程序员在他们的代码中使用。

要创建一个函数，你可以为函数提供一个自定义名称，后面跟着用大括号括起来的、任意数量的代码。

下面是一个简单的网页，其中包含了一个剪裁过的图像，还有一个分析图像并返回真实图像尺寸的按钮。在这个示例代码中，`<button>` 这个 HTML 元素使用了 JavaScript 的内置函数 `onclick` 来检测用户交互，它会触发一个名为 `get_size` 的自定义函数。具体代码如下：

```
<html>
  <head>
    <title>Imager</title>
  </head>
  <body>

    <div>
      <button onclick="get_size(document.getElementById('myimg'))">
        Get image size
    </button>
    </div>
    
    <div>
      <img style="width: 15%" id="myimg" src="penguin.png" />
    </div>
   
    <script>
      function get_size(i) {
        let w = i.naturalWidth;
        let h = i.naturalHeight;
        alert(w + " by " + h);
      }
    </script>
    
  </body>
</html>
```

保存这个文件，并将其加载到 Web 浏览器中以尝试这段代码。

![自定义的 get_size 函数返回了图像尺寸][8]

### 使用 JavaScript 的跨平台应用程序

你可以从代码示例中看到，JavaScript 和 HTML 紧密协作，从而创建了有凝聚力的用户体验。这是 JavaScript 的一大优势。当你使用 JavaScript 编写代码时，你继承了现代计算中最常见的用户界面之一，而它与平台无关，那就是 Web 浏览器。你的代码本质上是跨平台的，因此你的应用程序，无论是简单的图像大小分析器还是复杂的图像编辑器、视频游戏，或者你梦想的任何其他东西，都可以被所有人使用，无论是通过 Web 浏览器，还是桌面（如果你同时提供了一个 Electron 应用）。

学习 JavaScript 既简单又有趣。网络上有很多网站提供了相关教程，还有超过一百万个 JavaScript 库可帮助你与设备、外围设备、物联网、服务器、文件系统等进行交互。在你学习的过程中，请将我们的 [JavaScript 备忘单][9] 放在身边，以便记住语法和结构的细节。

> **[JavaScript 备忘单][9]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/javascript-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/code2.png
[2]: https://www.electronjs.org/
[3]: https://opensource.com/article/16/12/notepad-text-editor
[4]: https://opensource.com/article/20/12/atom
[5]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[6]: https://opensource.com/sites/default/files/pictures/plain-html.jpg
[7]: https://opensource.com/sites/default/files/uploads/html-javascript.jpg
[8]: https://opensource.com/sites/default/files/uploads/get-size.jpg
[9]: https://opensource.com/downloads/javascript-cheat-sheet
[10]: https://www.zhihu.com/question/20298345/answer/49551142
