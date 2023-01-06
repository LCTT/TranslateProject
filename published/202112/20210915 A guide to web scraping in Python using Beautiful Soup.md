[#]: subject: "A guide to web scraping in Python using Beautiful Soup"
[#]: via: "https://opensource.com/article/21/9/web-scraping-python-beautiful-soup"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14086-1.html"

Python Beautiful Soup 刮取简易指南
======

> Python 中的 Beautiful Soup 库可以很方便的从网页中提取 HTML 内容。

![](https://img.linux.net.cn/data/attachment/album/202112/16/142118cmffvtfrmh1h3ufv.jpg)

今天我们将讨论如何使用 Beautiful Soup 库从 HTML 页面中提取内容，之后，我们将使用它将其转换为 Python 列表或字典。

### 什么是 Web 刮取，为什么我需要它？

答案很简单：并非每个网站都有获取内容的 API。你可能想从你最喜欢的烹饪网站上获取食谱，或者从旅游博客上获取照片。如果没有 API，提取 HTML（或者说 <ruby>刮取<rt>scraping</rt></ruby> 可能是获取内容的唯一方法。我将向你展示如何使用 Python 来获取。

**并非所以网站都喜欢被刮取，有些网站可能会明确禁止。请于网站所有者确认是否同意刮取。**

### Python 如何刮取网站？

使用 Python 进行刮取，我们将执行三个基本步骤：

  1. 使用 `requests` 库获取 HTML 内容
  2. 分析 HTML 结构并识别包含我们需要内容的标签
  3. 使用 Beautiful Soup 提取标签并将数据放入 Python 列表中

### 安装库

首先安装我们需要的库。`requests` 库从网站获取 HTML 内容，Beautiful Soup 解析 HTML 并将其转换为 Python 对象。在 Python3 中安装它们，运行：

```
pip3 install requests beautifulsoup4
```

### 提取 HTML

在本例中，我将选择刮取网站的 [Techhology][2] 部分。如果你跳转到此页面，你会看到带有标题、摘录和发布日期的文章列表。我们的目标是创建一个包含这些信息的文章列表。

网站页面的完整 URL 是：

```
https://notes.ayushsharma.in/technology
```

我们可以使用 `requests` 从这个页面获取 HTML 内容：

```
#!/usr/bin/python3
import requests

url = 'https://notes.ayushsharma.in/technology'

data = requests.get(url)

print(data.text)
```

变量 `data` 将包含页面的 HTML 源代码。

### 从 HTML 中提取内容

为了从 `data` 中提取数据，我们需要确定哪些标签具有我们需要的内容。

如果你浏览 HTML，你会发现靠近顶部的这一段：

```
<div class="col">
  <a href="/2021/08/using-variables-in-jekyll-to-define-custom-content" class="post-card">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Using variables in Jekyll to define custom content</h5>
        <small class="card-text text-muted">I recently discovered that Jekyll's config.yml can be used to define custom
          variables for reusing content. I feel like I've been living under a rock all this time. But to err over and
          over again is human.</small>
      </div>
      <div class="card-footer text-end">
        <small class="text-muted">Aug 2021</small>
      </div>
    </div>
  </a>
</div>
```

这是每篇文章在整个页面中重复的部分。我们可以看到 `.card-title` 包含文章标题，`.card-text` 包含摘录，`.card-footer > small` 包含发布日期。

让我们使用 Beautiful Soup 提取这些内容。

```
#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup
from pprint import pprint

url = 'https://notes.ayushsharma.in/technology'
data = requests.get(url)

my_data = []

html = BeautifulSoup(data.text, 'html.parser')
articles = html.select('a.post-card')

for article in articles:

    title = article.select('.card-title')[0].get_text()
    excerpt = article.select('.card-text')[0].get_text()
    pub_date = article.select('.card-footer small')[0].get_text()

    my_data.append({"title": title, "excerpt": excerpt, "pub_date": pub_date})

pprint(my_data)
```

以上代码提取文章信息并将它们放入 `my_data` 变量中。我使用了 `pprint` 来美化输出，但你可以在代码中忽略它。将上面的代码保存在一个名为 `fetch.py` 的文件中，然后运行它：

```
python3 fetch.py
```

如果一切顺利，你应该会看到：

```
[{'excerpt': "I recently discovered that Jekyll's config.yml can be used to"
"define custom variables for reusing content. I feel like I've"
'been living under a rock all this time. But to err over and over'
'again is human.',
'pub_date': 'Aug 2021',
'title': 'Using variables in Jekyll to define custom content'},
{'excerpt': "In this article, I'll highlight some ideas for Jekyll"
'collections, blog category pages, responsive web-design, and'
'netlify.toml to make static website maintenance a breeze.',
'pub_date': 'Jul 2021',
'title': 'The evolution of ayushsharma.in: Jekyll, Bootstrap, Netlify,'
'static websites, and responsive design.'},
{'excerpt': "These are the top 5 lessons I've learned after 5 years of"
'Terraform-ing.',
'pub_date': 'Jul 2021',
'title': '5 key best practices for sane and usable Terraform setups'},

... (truncated)
```

以上是全部内容！在这 22 行代码中，我们用 Python 构建了一个网络刮取器，你可以在 [我的示例仓库中找到源代码][7]。

### 总结

对于 Python 列表中的网站内容，我们现在可以用它做一些很酷的事情。我们可以将它作为 JSON 返回给另一个应用程序，或者使用自定义样式将其转换为 HTML。随意复制粘贴以上代码并在你最喜欢的网站上进行试验。

玩的开心，继续编码吧。

_本文最初发表在[作者个人博客][8]上，经授权改编。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/web-scraping-python-beautiful-soup

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://notes.ayushsharma.in/technology
[3]: http://december.com/html/4/element/div.html
[4]: http://december.com/html/4/element/a.html
[5]: http://december.com/html/4/element/h5.html
[6]: http://december.com/html/4/element/small.html
[7]: https://gitlab.com/ayush-sharma/example-assets/-/blob/fd7d2dfbfa3ca34103402993b35a61cbe943bcf3/programming/beautiful-soup/fetch.py
[8]: https://notes.ayushsharma.in/2021/08/a-guide-to-web-scraping-in-python-using-beautifulsoup
