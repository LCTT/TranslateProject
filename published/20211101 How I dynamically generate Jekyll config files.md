[#]: subject: "How I dynamically generate Jekyll config files"
[#]: via: "https://opensource.com/article/21/11/jekyll-config-files"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13957-1.html"

如何动态生成 Jekyll 配置文件
======

> 使用 Python 或 Bash 将动态数据插入 Jekyll 静态网站中，并且避免创建一个 API 后端。

![](https://img.linux.net.cn/data/attachment/album/202111/06/172709dqcv65spvl363fav.jpg)

静态网站生成器 [Jekyll][2] 使用 `_config.yml` 进行配置。这些配置都是 Jekyll 特有的。但你也可以在这些文件中 [用我们自己的内容定义变量][3]，并在整个网站中使用它们。在本文中，我将重点介绍动态创建 Jekyll 配置文件的一些优势。

在我的本地笔记本电脑上，我使用以下命令来服务我的 Jekyll 网站进行测试：

```
bundle exec jekyll serve --incremental --config _config.yml
```

### 结合多个配置文件

在本地测试中，有时需要覆盖配置选项。我的网站的 [当前 _config.yml][4] 有以下设置：

```
# Jekyll Configuration

# Site Settings
url: "https://notes.ayushsharma.in"
website_url: "https://notes.ayushsharma.in/"
title: ayush sharma's notes ☕ + 🎧 + 🕹️
email: ayush@ayushsharma.in
images-path: /static/images/
videos-path: /static/videos/
js-path: /static/js/
baseurl: "" # the subpath of your site, e.g. /blog
```

由于本地的 `jekyll serve` URL 是 `http://localhost:4000`，上面定义的 URL 就不能用了。我可以创建一个 `_config.yml` 的副本 `_config-local.yml` 并替换所有的值。但还有一个更简单的选择。

Jekyll 允许[指定多个配置文件][6]，后面的声明覆盖前面的声明。这意味着我可以用以下代码定义一个新的 `_config-local.yml`：

```
url:""
```

然后我可以把上述文件和我的主 `_config.yml` 结合起来，像这样：

```
bundle exec jekyll serve --incremental --config _config.yml,_config-local.yml
```

通过合并这两个文件，这个 `jekyll serve` 的 `url` 的最终值将是空白。这就把我网站中定义的所有 URL 变成了相对的 URL，并使它们在我的本地笔记本电脑上工作。

### C结合动态配置文件

一个简单的例子，假设你想在你的网站上显示当前日期。它的 bash 命令是：

```
&gt; date '+%A, %d %B %Y'
Saturday, 16 October 2021
```

我知道我也可以 [使用 Jekyll 的 _config.yml 的自定义内容][3]。我将上述日期输出到一个新的 Jekyll 配置文件中。

```
my_date=`date '+%A, %d %B %Y'`; echo 'my_date: "'$my_date'"' > _config-data.yml
```

现在 `_config-data.yml` 包含：

```
my_date: "Saturday, 16 October 2021"
```

我可以把我的新配置文件和其他文件结合起来，在我的网站上使用 `my_date` 变量。

```
bundle exec jekyll serve --incremental --config _config.yml,_config-local.yml,_config-data.yml
```

在运行上述命令时，`{{ site.my_date }}` 输出其配置的值。

### 结论

上面的例子很简单，但可能性是无穷的。Bash、Python 和其他编程语言可以动态地生成 Jekyll 配置文件。然后我可以在 `build` 或 `serve` 过程中结合这些文件。

对于 [findmymastodon.com][7]，[我使用 Python 来获取 Mastodon 的用户统计数据][8]。然后我把这些写进一个新的 [_config-data.yml 文件][9]（目前是手动）。最后，[主页和其他页面从配置文件中显示这些][10]。这样，我就可以利用一个动态的后台，并且仍然保持我所喜欢的所有静态网站的优点。

我希望这能为你自己的静态网站激发一些想法。Jamstack 对于静态网站是很好的，但你可以避免为动态内容创建整个 API 后台。为什么不使用一个构建作业来创建带有更新内容的配置文件呢？这可能不适合每一种情况，但少一个 API 意味着更少的基础设施移动部件。

我希望这能在你的下一个静态网站项目中给你一些帮助。继续阅读，并祝你编码愉快。

这篇文章最初发布在 [作者的网站][11] 上，并经授权转载。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/jekyll-config-files

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://opensource.com/article/21/9/build-website-jekyll
[3]: https://ayushsharma.in/2021/08/using-variables-in-jekyll-to-define-custom-content
[4]: https://gitlab.com/ayush-sharma/ayushsharma-in/-/blob/2.0/_config.yml
[5]: mailto:ayush@ayushsharma.in
[6]: https://jekyllrb.com/docs/configuration/options/#build-command-options
[7]: https://findmymastodon.com/
[8]: https://gitlab.com/ayush-sharma/find-my-mastodon/-/blob/1.0/src/fetch-instance-data/fetch_data.py#L252
[9]: https://gitlab.com/ayush-sharma/find-my-mastodon/-/blob/1.0/_config-data.yml
[10]: https://gitlab.com/ayush-sharma/find-my-mastodon/-/blob/1.0/index.md#L16
[11]: https://ayushsharma.in/2021/10/inserting-dynamic-data-into-jekyll-static-sites-using-python-or-bash
