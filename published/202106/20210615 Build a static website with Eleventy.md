[#]: subject: (Build a static website with Eleventy)
[#]: via: (https://opensource.com/article/21/6/static-site-builder)
[#]: author: (Nwokocha Wisdom https://opensource.com/users/wise4rmgod)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13513-1.html)

用 Eleventy 建立一个静态网站
======

> Eleventy 是一个基于 JavaScript 的 Jekyll 和 Hugo 的替代品，用于构建静态网站。

![](https://img.linux.net.cn/data/attachment/album/202106/23/160000epjn313s1t5ja8wj.jpg)

静态网站生成器是一种基于原始数据和一组模板生成完整的静态 HTML 网站的工具。它可以自动完成单个 HTML 页面的编码任务，并让这些页面准备好为用户服务。由于 HTML 页面是预先建立的，它们在用户的浏览器中加载得非常快。

静态网站对文档也很友好，因为静态网站很容易扩展，而且它们是生成、维护和部署项目文档的一种简单方法。由于这些原因，企业经常使用它们来记录应用编程接口 （API）、数据库模式和其他信息。文档是软件开发、设计和其他方面技术的一个重要组成部分。所有的代码库都需要某种形式的文档，选择范围从简单的 README 到完整的文档。

### Eleventy: 一个静态网站生成器

[Eleventy][2]（11ty）是一个简单的静态网站生成器，是 [Jekyll][3] 和 [Hugo][4] 的替代品。它是用 JavaScript 编写的，它将一个（不同类型的）模板目录转化为 HTML。它也是开源的，在 MIT 许可下发布。

Eleventy 可以与 HTML、Markdown、Liquid、Nunjucks、Handlebars、Mustache、EJS、Haml、Pug 和 JavaScript Template Literals 协同工作。

它的特点包括：

  * 易于设置
  * 支持多种模板语言（如 Nunjucks、HTML、JavaScript、Markdown、Liquid）
  * 可定制
  * 基于 JavaScript，这是许多网络开发者所熟悉的，新用户也容易学习

### 安装 Eleventy

Eleventy 需要 Node.js。在 Linux 上，你可以使用你的包管理器安装 Node.js：

```
$ sudo dnf install nodejs
```

如果你的包管理器没有 Node.js，或者你不在 Linux 上，你可以从 Node.js 网站[安装它][5]。

Node.js 安装完毕后，就用它来安装 Eleventy：

```
$ npm install -g @11ty/eleventy
```

这就完成了！

### 为你的文档建立一个静态网站

现在你可以开始使用 Eleventy 来建立你的静态文档网站。以下是需要遵循的步骤。

#### 1、创建一个 package.json 文件

要将 Eleventy 安装到你的项目中，你需要一个 `package.json` 文件：

```
$ npm init -y
```

#### 2、将 Eleventy 安装到 package.json 中

安装 Eleventy 并保存到你的项目的 `package.json` 中。运行：

```
$ npm install-save-dev @11ty/eleventy
```

#### 3、运行 Eleventy

使用 `npx` 命令来运行你本地项目的 Eleventy 版本。在你确认安装完成后，尝试运行 Eleventy：

```
$ npx @11ty/eleventy
```

#### 4、创建一些模板

现在运行两个命令来创建两个新的模板文件（一个 HTML 和一个 Markdown 文件）：

```
$ cat << EOF >> index.html
<!doctype html><html>
<head>
<title>Page title</title>
</head><body>
<p>Hello world</p>
</body></html>
EOF
$ echo '# Page header' > index.md
```

这就把当前目录或子目录中的任何内容模板编译到输出文件夹中（默认为 `_site`）。

运行 `eleventy --serve` 来启动一个开发网络服务器。

```
$ npx @11ty/eleventy-serve
```

在你的网络浏览器中打开 `http://localhost:8080/README/`，看你的 Eleventy 输出。

然后把 `_site` 中的文件上传到你的 Web 服务器，发布你的网站给世界看。

### 尝试 Eleventy

Eleventy 是一个静态网站生成器，它易于使用，有模板和主题。如果你已经在你的开发流程中使用 Node.js，Eleventy 可能比 Jekyll 或 Hugo 更自然。它能快速提供很好的结果，并使你免于复杂的网站设计和维护。要了解更多关于使用 Eleventy 的信息，请仔细阅读它的[文档][6]。

* * *

_本文基于 [为开源项目建立技术文档静态网站][7]，首次发布在 Nwokocha Wisdom Maduabuchi 的 Medium 上，经授权转载。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/static-site-builder

作者：[Nwokocha Wisdom][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/wise4rmgod
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://www.11ty.dev/
[3]: https://opensource.com/article/17/4/getting-started-jekyll
[4]: https://opensource.com/article/18/3/start-blog-30-minutes-hugo
[5]: https://nodejs.org/en/
[6]: https://www.11ty.dev/docs/getting-started/
[7]: https://wise4rmgodadmob.medium.com/building-a-technical-documentation-static-site-for-open-source-projects-7af4e73d77f0
