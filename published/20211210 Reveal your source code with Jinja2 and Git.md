[#]: subject: "Reveal your source code with Jinja2 and Git"
[#]: via: "https://opensource.com/article/21/12/reveal-source-code-jinja2-git"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14091-1.html"

用 Jekyll 和 Git 展示你的源码
======

> 我是如何通过链接每个页面回到其原始源代码来保持我的网站开放的。

![](https://img.linux.net.cn/data/attachment/album/202112/18/093318uoud175bj4d55zz5.jpg)

我是一个开源的超级粉丝。

我支持这项事业的一个小方法是从一开始就保持我的个人博客网站开放。我这样做的部分原因是让人们看到每个页面背后的变化历史。还因为当我开始使用 [Jekyll][2] 时，我没有找到很多开源的 Jekyll 博客可以学习。我希望保持我的网站开放并公开我的尝试和错误，可以为其他人节省很多时间。

### Jekyll 的 page.path 变量

我实现这一目标的方法之一是将我发布的每一个条目链接到其原始的 [Markdown][3]。[Jekyll 的变量][4] 中正好有一个需要的工具：`page.path`。这个变量包含每个页面的原始文件系统路径。官方的描述甚至强调了它的作用是链接回源！

在一篇文章的 Markdown 文件中打印 `{{page.path }}`，可以得到类似这样的结果：

```
_posts/2021-10-10-example.md
```

假设该文章的源代码存在于这个路径：

```
https://example.com/ayushsharma-in/-/blob/master/_posts/2021-10-10-example.md
```

如果你在任何文章的 `page.path` 前加上 `https://example.com/ayushsharma-in/-/blob/master/`，它就会生成一个返回其源码的链接。

在 Jekyll 中，生成这个完整的链接看起来像这样：

```
<a href="{{ page.path | prepend: site.content.blog_source_prefix }}" target="_blank">View source</a>
```

就是这么简单。

### Jekyll 和开放 Web

现代 Web 是一种错综复杂的多层次技术，但这并不意味着它必须让人摸不清。有了 Jekyll 的变量，你可以确保你的用户可以，了解更多关于你是如何建立你的网站的，如果他们愿意的话。

你可以在我的[个人博客][5]上看到真实的例子：滚动到底部的查看源码链接。

本文改编自 [ayush sharma 的笔记][6]，并经许可转载。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/reveal-source-code-jinja2-git

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://opensource.com/article/21/9/build-website-jekyll
[3]: https://opensource.com/article/19/9/introduction-markdown
[4]: https://jekyllrb.com/docs/variables/#page-variables
[5]: https://www.ayushsharma.in
[6]: https://www.ayushsharma.in/2021/11/linking-jekyll-pages-back-to-their-git-source-code
