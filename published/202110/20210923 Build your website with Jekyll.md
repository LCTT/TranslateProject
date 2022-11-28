[#]: subject: "Build your website with Jekyll"
[#]: via: "https://opensource.com/article/21/9/build-website-jekyll"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13875-1.html"

使用 Jekyll 构建你的网站
======

> Jekyll 是一个开源的静态网站生成器。你可以使用 Markdown 编写内容，使用 HTML/CSS 来构建和展示，Jekyll 会将其编译为静态的 HTML。

![](https://img.linux.net.cn/data/attachment/album/202110/12/145349rblj459naj74j5nr.jpg)

近年来开始流行静态网站生成器和 JAMStack，而且理由很充分，它们不需要复杂的后端，只需要静态的 HTML、CSS 和 Javascript。没有后端意味着更好的安全性、更低的运营开销和更便宜的托管。双赢！

在本文中，我将讨论 Jekyll。在撰写本文时，[我的个人网站使用的是 Jekyll][2]。Jekyll 使用 Ruby 引擎将用 Markdown 编写的文章转换成 HTML。[Sass][3] 可以将复杂的 CSS 规则应用到普通文本文件中。[Liquid][4] 允许对静态内容进行编程控制。

### 安装 Jekyll

[Jekyll 网站][5] 提供了 Linux、MacOS 和 Windows 安装说明。安装完成之后，[快速引导][6] 将会安装一个基础的 Hello-World 项目。

现在在你的浏览器访问 `http://localhost:4000`，你可以看到你的默认“真棒”博客。

![Default "awesome" blog][7]

### 目录结构

这个默认站点包含以下的文件和文件夹：

  * `_posts`: 你的博客文章。
  * `_site`: 最终编译成的静态网站文件。
  * `about.markdown`: “关于页”的内容。
  * `index.markdown`: “主页”的内容。
  * `404.html`: “404 页”的内容。
  * `_config.yml`: Jekyll 的全站配置文件。

### 创建新的博客帖子

创建帖子很简单。你需要做的就是在 `_post` 目录下使用正确的格式和扩展名创建一个新文件，这样就完成了。

有效的文件名像 `2021-08-29-welcome-to-jekyll.markdown` 这样。一个博客文件必须包含 Jekyll 所谓的 YAML <ruby>卷首块<rt>Front Matter</rt></ruby>。它是文件开头的一个包含元数据的特殊部分。如果你查看默认的帖子，你可以看到以下内容：

```
---
layout: post
title: "Welcome to Jekyll!"
date:  2021-08-29 11:28:12 +0530
categories: jekyll update
---
```

Jekyll 会使用上面的元数据，你也可以自定义 `key: value` 键值对。如果你需要一些提示，[请查看我的网站的卷首][9]。除了前面的问题，你还可以 [使用内置的 Jekyll 变量][10] 来自定义你的网站。

让我们创建一个新的帖子。在 `_posts` 文件夹下创建 `2021-08-29-ayushsharma.markdown`。内容如下：

```
---
layout: post
title:  "Check out ayushsharma.in!"
date:   2021-08-29 12:00:00 +0530
categories: mycategory
---
This is my first post.

# This is a heading.

## This is another heading.

This is a [link](<http://notes.ayushsharma.in>)

This is my category:
```

如果 `jekyll serve` 命令仍在运行，刷新页面，你将看到下面的新帖子。

![New blog entry][11]

恭喜你创建了你的第一篇帖子！这个过程看起来很简单，但是你可以通过 Jekyll 做很多事情。使用简单的 Markdown，你可以归档博客、高亮显示代码片段以及分类管理帖子。

### 草稿

如果你还没准备好发布你的内容，你可以创建一个 `_drafts` 文件夹。此文件夹中的 Markdown 文件仅通过传递 `--drafts--` 参数来呈现。

### 布局和包含

请注意 `_post` 文件夹中两篇文章的卷首块，你将在其中看到 `layout: post`。`_layout` 文件夹中包含所有布局。你不会在源代码中找到它们，因为 Jekyll 默认加载它们。Jekyll 使用的默认源代码在 [这里][12]。如果你点击该链接，你可以看到 `post` 的布局使用了默认（`default`）布局。默认布局包含的代码 `{{ content }}` 是注入内容的地方。布局文件还将包含 `include` 指令。它们从 [`include` 文件夹][14] 加载文件，并使用不同的组件组成页面。

总的来说，这就是布局的工作方式：你在卷首块定义它们并将你的内容注入其中。而包含则提供了页面的其它部分以组成整个页面。这是一种标准的网页设计技术：定义页眉、页脚、旁白和内容元素，然后在其中注入内容。这就是静态站点生成器的真正威力，完全以编程的方式控制，将你的网站组装起来并最终编译成静态的 HTML。

### 页面

你网站上的所有内容并不都是文章或博客。你需要“关于”页面、“联系”页面、“项目”页面或“作品”页面。这就是“页面”的用武之地。它们的工作方式与“帖子”完全一样，这意味着它们是带有卷首块的 Markdown 文件。但它们不会放到 `_posts` 目录。它们要么保留在你的项目根目录中，要么保留在它们自己的文件夹中。对于布局和包含，你可以使用与帖子相同的布局或创建新帖子。 Jekyll 非常灵活，你可以随心所欲地发挥你的创意！你的默认博客已经有 `index.markdown` 和 `about.markdown`。请随意自定义它们。

### 数据文件

数据文件位于 `_data` 目录中，可以是 `.yml`、`.json`、`.csv` 等格式的文件。例如，一个 `_data/members.yml` 文件可能包含：

```
- name: A
 github: a@a

- name: B
 github: b@b

- name: C
 github: c@c
```

Jekyll 在网站生成的时候读取这些内容。你可以通过 `site.data.members` 访问它们。

```
<ul>
{ % for member in site.data.members % }
 <li>
 <a href="https://github.com">
      { { member.name } } 
 </a>
 </li>
{ % endfor %}
</ul>
```

### 永久链接

你的 `_config.yml` 文件定义了永久链接的格式。你可以使用各种默认变量来组合你自己的自定义永久链接。

### 构建你最终的网站

命令 `jekyll serve` 非常适合本地测试。但是一旦你完成了本地测试，你将需要构建要发布的最终工作。命令 `jekyll build --source source_dir --destination destination_dir` 将你的网站构建到 `_site` 文件夹中。请注意，此文件夹在每次构建之前都会被清理，所以不要将重要的东西放在那里。生成内容后，你可以将其托管在你的静态托管服务上。

你现在应该对 Jekyll 的功能以及主要部分的功能有一个全面的了解。如果你正在寻找灵感，官方 [JAMStack 网站上有一些很棒的例子][17]。

![Example Jekyll sites from JAMStack][18]

编码快乐。

本文首发于 [作者个人博客][19]，经授权改编。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/build-website-jekyll

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://gitlab.com/ayush-sharma/ayushsharma-in
[3]: https://sass-lang.com/
[4]: https://shopify.github.io/liquid/
[5]: https://jekyllrb.com/docs/installation/
[6]: https://jekyllrb.com/docs/
[7]: https://opensource.com/sites/default/files/uploads/2016-08-15-introduction-to-jekyll-welcome-to-jekyll.png (Default "awesome" blog)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://gitlab.com/ayush-sharma/ayushsharma-in/-/blob/2.0/_posts/2021-07-15-the-evolution-of-ayushsharma-in.md
[10]: https://jekyllrb.com/docs/variables/
[11]: https://opensource.com/sites/default/files/uploads/2016-08-15-introduction-to-jekyll-new-article.png (New blog entry)
[12]: https://github.com/jekyll/minima/blob/master/_layouts/post.html
[13]: https://github.com/jekyll/minima/blob/master/_layouts/default.html#L12
[14]: https://github.com/jekyll/minima/tree/master/_includes
[15]: https://github.com/"\>
[16]: https://jekyllrb.com/docs/permalinks/
[17]: https://jamstack.org/examples/
[18]: https://opensource.com/sites/default/files/uploads/2016-08-15-introduction-to-jekyll-jamstack-examples.png (Example Jekyll sites from JAMStack)
[19]: https://notes.ayushsharma.in/2021/08/introduction-to-jekyll
