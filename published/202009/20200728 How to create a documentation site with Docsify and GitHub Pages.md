[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12572-1.html)
[#]: subject: (How to create a documentation site with Docsify and GitHub Pages)
[#]: via: (https://opensource.com/article/20/7/docsify-github-pages)
[#]: author: (Bryant Son https://opensource.com/users/brson)

如何使用 Docsify 和 GitHub Pages 创建一个文档网站
======

> 使用 Docsify 创建文档网页并发布到 GitHub Pages 上。

![](https://img.linux.net.cn/data/attachment/album/202009/01/211718hws6rvvziks2zrkc.jpg)

文档是帮助用户使用开源项目一个重要部分，但它并不总是开发人员的首要任务，因为他们可能更关注的是使他们的应用程序更好，而不是帮助人们使用它。对开发者来说，这就是为什么让发布文档变得更容易是如此有价值的原因。在本教程中，我将向你展示一个这样做的方式：将 [Docsify][2] 文档生成器与 [GitHub Pages][3] 结合起来。 

如果你喜欢通过视频学习，可以访问 YouTube 版本的教程：

- [video](https://youtu.be/ccA2ecqKyHo)

默认情况下，GitHub Pages 会提示用户使用 [Jekyll][4]，这是一个支持 HTML、CSS 和其它网页技术的静态网站生成器。Jekyll 可以从以 Markdown 格式编码的文档文件中生成一个静态网站，GitHub 会自动识别它们的 `.md` 或 `.markdown` 扩展名。虽然这种设置很好，但我想尝试一下其他的东西。

幸运的是，GitHub Pages 支持 HTML 文件，这意味着你可以使用其他网站生成工具（比如 Docsify）在这个平台上创建一个网站。Docsify 是一个采用 MIT 许可证的开源项目，其具有可以让你在 GitHub Pages 上轻松创建一个有吸引力的、先进的文档网站的[功能][5]。

![Docsify][6]

### 开始使用 Docsify

安装 Docsify 有两种方法：

  1. 通过 NPM 安装 Docsify 的命令行界面（CLI）。
  2. 手动编写自己的 `index.html`。

Docsify 推荐使用 NPM 方式，但我将使用第二种方案。如果你想使用 NPM，请按照[快速入门指南][8]中的说明进行操作。

### 从 GitHub 下载示例内容

我已经在[该项目的 GitHub 页面][9]上发布了这个例子的源代码。你可以单独下载这些文件，也可以通过以下方式[克隆这个存储库][10]。

```
git clone https://github.com/bryantson/OpensourceDotComDemos
```

然后 `cd` 进入 `DocsifyDemo` 目录。

我将在下面为你介绍这些代码，它们克隆自我的示例存储库中，这样你就可以理解如何修改 Docsify。如果你愿意，你也可以从头开始创建一个新的 `index.html` 文件，就像 Docsify 文档中的的[示例][11]一样：

```
<!-- index.html -->

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify/themes/vue.css">
</head>
<body>
  <div id="app"></div>
  <script>
    window.$docsify = {
      //...
    }
  </script>
  <script src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"></script>
</body>
</html>
```

### 探索 Docsify 如何工作

如果你克隆了我的 [GitHub 存储库][10]，并切换到 `DocsifyDemo` 目录下，你应该看到这样的文件结构：

![File contents in the cloned GitHub][19]

文件/文件夹名称 | 内容
---|---
`index.html` | 主要的 Docsify 初始化文件，也是最重要的文件
`_sidebar.md` | 生成导航
`README.md` | 你的文档根目录下的默认 Markdown 文件
`images` | 包含了 `README.md` 中的示例 .jpg 图片
其它目录和文件 | 包含可导航的 Markdown 文件

`index.html` 是 Docsify 可以工作的唯一要求。打开该文件，你可以查看其内容：

```
<!-- index.html -->

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify/themes/vue.css">
  <title>Docsify Demo</title>
</head>
<body>
  <div id="app"></div>
  <script>
    window.$docsify = {
      el: "#app",
      repo: 'https://github.com/bryantson/OpensourceDotComDemos/tree/master/DocsifyDemo',
      loadSidebar: true,
    }
  </script>
  <script src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"></script>
</body>
</html>
```

这本质上只是一个普通的 HTML 文件，但看看这两行：

```
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify/themes/vue.css">
... 一些其它内容 ...
<script src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"></script>
```

这些行使用内容交付网络（CDN）的 URL 来提供 CSS 和 JavaScript 脚本，以将网站转化为 Docsify 网站。只要你包含这些行，你就可以把你的普通 GitHub 页面变成 Docsify 页面。

`<body>` 标签后的第一行指定了要渲染的内容：

```
<div id="app"></div>
```

Docsify 使用[单页应用][21]（SPA）的方式来渲染请求的页面，而不是刷新一个全新的页面。

最后，看看 `<script>` 块里面的行：

```
<script>
    window.$docsify = {
      el: "#app",
      repo: 'https://github.com/bryantson/OpensourceDotComDemos/tree/master/DocsifyDemo',
      loadSidebar: true,
    }
</script>
```

在这个块中：

  * `el` 属性基本上是说：“嘿，这就是我要找的 `id`，所以找到它并在那里呈现。”
  * 改变 `repo` 值，以确定当用户点击右上角的 GitHub 图标时，会被重定向到哪个页面。
  ![GitHub icon][22]
  * 将 `loadSideBar` 设置为 `true` 将使 Docsify 查找包含导航链接的 `_sidebar.md` 文件。

你可以在 Docsify 文档的[配置][23]部分找到所有选项。

接下来，看看 `_sidebar.md` 文件。因为你在 `index.html` 中设置了 `loadSidebar` 属性值为 `true`，所以 Docsify 会查找 `_sidebar.md` 文件，并根据其内容生成导航文件。示例存储库中的 `_sidebar.md` 内容是：

```
<!-- docs/_sidebar.md -->


* [HOME](./)

* [Tutorials](./tutorials/index)
  * [Tomcat](./tutorials/tomcat/index)
  * [Cloud](./tutorials/cloud/index)
  * [Java](./tutorials/java/index)

* [About](./about/index)

* [Contact](./contact/index)
```

这会使用 Markdown 的链接格式来创建导航。请注意 “Tomcat”、“Cloud” 和 “Java” 等链接是缩进的；这意味着它们被渲染为父链接下的子链接。

像 `README.md` 和 `images` 这样的文件与存储库的结构有关，但所有其它 Markdown 文件都与你的 Docsify 网页有关。

根据你的需求，随意修改你下载的文件。下一步，你将把这些文件添加到你的 GitHub 存储库中，启用 GitHub Pages，并完成项目。

### 启用 GitHub 页面

创建一个示例的 GitHub 存储库，然后使用以下 GitHub 命令检出、提交和推送你的代码：

```
$ git clone 你的 GitHub 存储库位置
$ cd 你的 GitHub 存储库位置
$ git add .
$ git commit -m "My first Docsify!"
$ git push
```

设置你的 GitHub Pages 页面。在你的新 GitHub 存储库中，点击 “Settings”：

![Settings link in GitHub][24]

向下滚动直到看到 “GitHub Pages”：

![GitHub Pages settings][25]

查找 “Source” 部分：

![GitHub Pages settings][26]

点击 “Source” 下的下拉菜单。通常，你会将其设置为 “master branch”，但如果你愿意，也可以使用其他分支：

![Setting Source to master branch][27]

就是这样！你现在应该有一个链接到你的 GitHub Pages 的页面了。点击该链接将带你到那里，然后用 Docsify 渲染：

![Link to GitHub Pages docs site][28]

它应该像这样：

![Example Docsify site on GitHub Pages][29]

### 结论

通过编辑一个 HTML 文件和一些 Markdown 文本，你可以用 Docsify 创建一个外观精美的文档网站。你觉得怎么样？请留言，也可以分享其他可以和 GitHub Pages 一起使用的开源工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/docsify-github-pages

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://docsify.js.org
[3]: https://pages.github.com/
[4]: https://docs.github.com/en/github/working-with-github-pages/about-github-pages-and-jekyll
[5]: https://docsify.js.org/#/?id=features
[6]: https://opensource.com/sites/default/files/uploads/docsify1_ui.jpg (Docsify)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://docsify.js.org/#/quickstart?id=quick-start
[9]: https://github.com/bryantson/OpensourceDotComDemos/tree/master/DocsifyDemo
[10]: https://github.com/bryantson/OpensourceDotComDemos
[11]: https://docsify.js.org/#/quickstart?id=manual-initialization
[12]: http://december.com/html/4/element/html.html
[13]: http://december.com/html/4/element/head.html
[14]: http://december.com/html/4/element/meta.html
[15]: http://december.com/html/4/element/link.html
[16]: http://december.com/html/4/element/body.html
[17]: http://december.com/html/4/element/div.html
[18]: http://december.com/html/4/element/script.html
[19]: https://opensource.com/sites/default/files/uploads/docsify3_files.jpg (File contents in the cloned GitHub)
[20]: http://december.com/html/4/element/title.html
[21]: https://en.wikipedia.org/wiki/Single-page_application
[22]: https://opensource.com/sites/default/files/uploads/docsify4_github-icon_rev_0.jpg (GitHub icon)
[23]: https://docsify.js.org/#/configuration?id=configuration
[24]: https://opensource.com/sites/default/files/uploads/docsify5_githubsettings_0.jpg (Settings link in GitHub)
[25]: https://opensource.com/sites/default/files/uploads/docsify6_githubpageconfig_rev.jpg (GitHub Pages settings)
[26]: https://opensource.com/sites/default/files/uploads/docsify6_githubpageconfig_rev2.jpg (GitHub Pages settings)
[27]: https://opensource.com/sites/default/files/uploads/docsify8_setsource_rev.jpg (Setting Source to master branch)
[28]: https://opensource.com/sites/default/files/uploads/docsify9_link_rev.jpg (Link to GitHub Pages docs site)
[29]: https://opensource.com/sites/default/files/uploads/docsify2_examplesite.jpg (Example Docsify site on GitHub Pages)
