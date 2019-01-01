Clinews：从命令行阅读新闻和最新头条
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/clinews-720x340.jpeg)

不久前，我们写了一个名为 [InstantNews][1] 的命令行新闻客户端，它可以帮助你立即在命令行阅读新闻和最新头条新闻。今天，我偶然发现了一个名为 **Clinews** 的类似，它的其功能与此相同 —— 在终端阅读来自热门网站的新闻和最新头条，还有博客。你无需安装 GUI 应用或移动应用。你可以直接从终端阅读世界上正在发生的事情。它是使用 **NodeJS** 编写的自由开源程序。

### 安装 Clinews

由于 Clinews 是使用 NodeJS 编写的，因此你可以使用 NPM 包管理器安装。如果尚未安装 NodeJS，请按照以下链接中的说明进行安装。

安装 node 后，运行以下命令安装 Clinews：

```
$ npm i -g clinews
```

你也可以使用 **Yarn** 安装 Clinews：

```
$ yarn global add clinews
```

Yarn 本身可以使用 npm 安装

```
$ npm -i yarn
```

### 配置 News API

Clinews 从 [News API][2] 中检索所有新闻标题。News API 是一个简单易用的 API，它返回当前在一系列新闻源和博客上发布的头条的 JSON 元数据。它目前提供来自 70 个热门源的实时头条，包括 Ars Technica、BBC、Blooberg、CNN、每日邮报、Engadget、ESPN、金融时报、谷歌新闻、hacker News，IGN、Mashable、国家地理、Reddit r/all、路透社、 Speigel Online、Techcrunch、The Guardian、The Hindu、赫芬顿邮报、纽约时报、The Next Web、华尔街日报，今日美国和[等等][3]。

首先，你需要 News API 的 API 密钥。进入 [https://newsapi.org/register][4] 并注册一个免费帐户来获取 API 密钥。

从 News API 获得 API 密钥后，编辑 `.bashrc`：

```
$ vi ~/.bashrc
```

在最后添加 newsapi API 密钥，如下所示：

```
export IN_API_KEY="Paste-API-key-here"
```

请注意，你需要将密钥粘贴在双引号内。保存并关闭文件。

运行以下命令以更新更改。

```
$ source ~/.bashrc
```

完成。现在继续并从新闻源获取最新的头条新闻。

### 在命令行阅读新闻和最新头条

要阅读特定新闻源的新闻和最新头条，例如 **The Hindu**，请运行：

```
$ news fetch the-hindu
```

这里，`the-hindu` 是新闻源的源id（获取 id）。

上述命令将从 The Hindu 新闻站获取最新的 10 个头条，并将其显示在终端中。此外，它还显示新闻的简要描述、发布的日期和时间以及到源的实际链接。

**示例输出：**

![](https://www.ostechnix.com/wp-content/uploads/2018/09/clinews-1.png)

要在浏览器中阅读新闻，请按住 Ctrl 键并单击 URL。它将在你的默认 Web 浏览器中打开。

要查看所有的新闻源，请运行：

```
$ news sources
```

**示例输出：**

![](https://www.ostechnix.com/wp-content/uploads/2018/09/clinews-2.png)

正如你在上面的截图中看到的，Clinews 列出了所有新闻源，包括新闻源的名称、获取 ID、网站描述、网站 URL 以及它所在的国家/地区。在撰写本指南时，Clinews 目前支持 70 多个新闻源。

Clinews 还可以搜索符合搜索条件/术语的所有源的新闻报道。例如，要列出包含单词 “Tamilnadu” 的所有新闻报道，请使用以下命令：

```
$ news search "Tamilnadu"
```

此命令将会筛选所有新闻源中含有 “Tamilnadu” 的报道。

Clinews 有一些其它选项可以帮助你

  * 限制你想看的新闻报道的数量，
  * 排序新闻报道（热门、最新），
  * 智能显示新闻报道分类（例如商业、娱乐、游戏、大众、音乐、政治、科学和自然、体育、技术）

更多详细信息，请参阅帮助部分：

```
$ clinews -h
```

就是这些了。希望这篇对你有用。还有更多好东西。敬请关注！

干杯！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/clinews-read-news-and-latest-headlines-from-commandline/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/get-news-instantly-commandline-linux/
[2]: https://newsapi.org/
[3]: https://newsapi.org/sources
[4]: https://newsapi.org/register
