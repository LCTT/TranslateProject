[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13047-1.html)
[#]: subject: (A beginner's guide to web scraping with Python)
[#]: via: (https://opensource.com/article/20/5/web-scraping-python)
[#]: author: (Julia Piaskowski https://opensource.com/users/julia-piaskowski)

利用 Python 爬取网站的新手指南
======

> 通过基本的 Python 工具获得爬取完整 HTML 网站的实践经验。

![](https://img.linux.net.cn/data/attachment/album/202101/24/093527skakhvc3kalnuxa1.jpg)

有很多很棒的书可以帮助你学习 Python ，但是谁真正读了这那些大部头呢？（剧透：反正不是我）。

许多人觉得教学书籍很有用，但我通常不会从头到尾地阅读一本书来学习。我是通过做一个项目，努力的弄清楚一些内容，然后再读另一本书来学习。因此，暂时丢掉书，让我们一起学习 Python。

接下来是我的第一个 Python 爬取项目的指南。它对 Python 和 HTML 的假定知识要求很低。这篇文章旨在说明如何使用 Python 的 [requests][2] 库访问网页内容，并使用 [BeatifulSoup4][3] 库以及 JSON 和 [pandas][4] 库解析网页内容。我将简要介绍 [Selenium][5] 库，但我不会深入研究如何使用该库——这个主题值得有自己的教程。最终，我希望向你展示一些技巧和小窍门，以减少网页爬取过程中遇到的问题。

### 安装依赖

我的 [GitHub 存储库][6] 中提供了本指南的所有资源。如果需要安装 Python3 的帮助，请查看 [Linux][7]、[Windows][8] 和 [Mac][9] 的教程。

```
$ python3 -m venv
$ source venv/bin/activate
$ pip install requests bs4 pandas
```

如果你喜欢使用 JupyterLab ，则可以使用 [notebook][10] 运行所有代码。[安装 JupyterLab][11] 有很多方法，这是其中一种：

```
# from the same virtual environment as above, run:
$ pip install jupyterlab
```

### 为网站抓取项目设定目标

现在我们已经安装了依赖项，但是爬取网页需要做什么？

让我们退一步，确保使目标清晰。下面是成功完成网页爬取项目需求列表：

  * 我们收集的信息，是值得我们花大力气去建立一个有效的网页爬取器的。
  * 我们所下载的信息是可以通过网页爬取器合法和道德地收集的。
  * 对如何在 HTML 代码中找到目标信息有一定的了解。
  * 利用恰当的工具：在此情况下，需要使用 BeautifulSoup 库和 requests 库。
  * 知道（或愿意去学习）如何解析 JSON 对象。
  * 有足够的 pandas 数据处理技能。

关于 HTML 的备注：HTML 是运行在互联网上的“猛兽”，但我们最需要了解的是标签的工作方式。标签是一对由尖括号包围关键词（一般成对出现，其内容在两个标签中间）。比如，这是一个假装的标签，称为 `pro-tip`：

```
<pro-tip> All you need to know about html is how tags work </pro-tip>
```

我们可以通过调用标签 `pro-tip` 来访问其中的信息（`All you need to know…`）。本教程将进一步介绍如何查找和访问标签。要进一步了解 HTML 基础知识，请查看 [本文][12]。

### 网站爬取项目中要找的是什么

有些数据利用网站爬取采集比利用其他方法更合适。以下是我认为合适项目的准则：

没有可用于数据（处理）的公共 API。通过 API 抓取结构化数据会容易得多，（所以没有 API ）有助于澄清收集数据的合法性和道德性。而有相当数量的结构化数据，并有规律的、可重复的格式，才能证明这种努力的合理性。网页爬取可能会很痛苦。BeautifulSoup（bs4）使操作更容易，但无法避免网站的个别特殊性，需要进行定制。数据的相同格式化不是必须的，但这确实使事情变得更容易。存在的 “边际案例”（偏离规范）越多，爬取就越复杂。

免责声明：我没有参加过法律培训；以下内容无意作为正式的法律建议。

关于合法性，访问大量有价值信息可能令人兴奋，但仅仅因为它是可能的，并不意味着应该这样做。

值得庆幸的是，有一些公共信息可以指导我们的道德规范和网页爬取工具。大多数网站都有与该网站关联的 [robots.txt][13] 文件，指出允许哪些爬取活动，哪些不被允许。它主要用于与搜索引擎（网页抓取工具的终极形态）进行交互。然而，网站上的许多信息都被视为公共信息。因此，有人将 `robots.txt` 文件视为一组建议，而不是具有法律约束力的文档。 `robots.txt` 文件并不涉及数据的道德收集和使用等主题。

在开始爬取项目之前，问自己以下问题：

  * 我是否在爬取版权材料？
  * 我的爬取活动会危害个人隐私吗？
  * 我是否发送了大量可能会使服务器超载或损坏的请求？
  * 爬取是否会泄露出我不拥有的知识产权？
  * 是否有规范网站使用的服务条款，我是否遵循了这些条款？
  * 我的爬取活动会减少原始数据的价值吗？（例如，我是否打算按原样重新打包数据，或者可能从原始来源中抽取网站流量）？

当我爬取一个网站时，请确保可以对所有这些问题回答 “否”。

要深入了解这些法律问题，请参阅 2018 年出版的 Krotov 和 Silva 撰写的[《Web 爬取的合法性和道德性》][14] 和 Sellars 的[《二十年 Web 爬取和计算机欺诈与滥用法案》][15]。

### 现在开始爬取网站

经过上述评估，我想出了一个项目。我的目标是爬取爱达荷州所有 Family Dollar 商店的地址。 这些商店在农村地区规模很大，因此我想了解有多少家这样的商店。

起点是 [Family Dollar 的位置页面][16]

![爱达荷州 Family Dollar 所在地页面][17]

首先，让我们在 Python 虚拟环境中加载先决条件。此处的代码将被添加到一个 Python 文件（如果你想要个名称，则为 `scraper.py`）或在 JupyterLab 的单元格中运行。

```
import requests # for making standard html requests
from bs4 import BeautifulSoup # magical tool for parsing html data
import json # for parsing data
from pandas import DataFrame as df # premier library for data organization
```

接下来，我们从目标 URL 中请求数据。

```
page = requests.get("https://locations.familydollar.com/id/")
soup = BeautifulSoup(page.text, 'html.parser')
```

BeautifulSoup 将 HTML 或 XML 内容转换为复杂树对象。这是我们将使用的几种常见对象类型。

  * `BeautifulSoup` —— 解析的内容
  * `Tag` —— 标准 HTML 标记，这是你将遇到的 `bs4` 元素的主要类型
  * `NavigableString` —— 标签内的文本字符串
  * `Comment` —— NavigableString 的一种特殊类型

当我们查看 `requests.get()` 输出时，还有更多要考虑的问题。我仅使用 `page.text()` 将请求的页面转换为可读的内容，但是还有其他输出类型：

  * `page.text()` 文本（最常见）
  * `page.content()` 逐字节输出
  * `page.json()` JSON 对象
  * `page.raw()` 原始套接字响应（对你没啥用）

我只在使用拉丁字母的纯英语网站上操作。 `requests` 中的默认编码设置可以很好地解决这一问题。然而，除了纯英语网站之外，就是更大的互联网世界。为了确保 `requests` 正确解析内容，你可以设置文本的编码：

```
page = requests.get(URL)
page.encoding = 'ISO-885901'
soup = BeautifulSoup(page.text, 'html.parser')
```

仔细研究 `BeautifulSoup` 标签，我们看到:

  * `bs4` 元素 `tag` 捕获的是一个 HTML 标记。
  * 它具有名称和属性，可以像字典一样访问：`tag['someAttribute']`。
  * 如果标签具有相同名称的多个属性，则仅访问第一个实例。
  * 可通过 `tag.contents` 访问子标签。
  * 所有标签后代都可以通过 `tag.contents` 访问。
  * 你始终可以使用以下字符串：`re.compile("your_string")` 访问一个字符串的所有内容，而不是浏览 HTML 树。

### 确定如何提取相应内容

警告：此过程可能令人沮丧。

网站爬取过程中的提取可能是一个令人生畏的充满了误区的过程。我认为解决此问题的最佳方法是从一个有代表性的示例开始然后进行扩展（此原理对于任何编程任务都是适用的）。查看页面的 HTML 源代码至关重要。有很多方法可以做到这一点。

你可以在终端中使用 Python 查看页面的整个源代码（不建议使用）。运行此代码需要你自担风险：

```
print(soup.prettify())
```

虽然打印出页面的整个源代码可能适用于某些教程中显示的玩具示例，但大多数现代网站的页面上都有大量内容。甚至 404 页面也可能充满了页眉、页脚等代码。

通常，在你喜欢的浏览器中通过 “查看页面源代码” 来浏览源代码是最容易的（单击右键，然后选择 “查看页面源代码” ）。这是找到目标内容的最可靠方法（稍后我将解释原因）。

![Family Dollar 页面源代码][18]

在这种情况下，我需要在这个巨大的 HTML 海洋中找到我的目标内容 —— 地址、城市、州和邮政编码。通常，对页面源（`ctrl+F`）的简单搜索就会得到目标位置所在的位置。一旦我实际看到目标内容的示例（至少一个商店的地址），便会找到将该内容与其他内容区分开的属性或标签。

首先，我需要在爱达荷州 Family Dollar 商店中收集不同城市的网址，并访问这些网站以获取地址信息。这些网址似乎都包含在 `href` 标记中。太棒了！我将尝试使用 `find_all` 命令进行搜索：

```
dollar_tree_list = soup.find_all('href')
dollar_tree_list
```

搜索 `href` 不会产生任何结果，该死。这可能是因为 `href` 嵌套在 `itemlist` 类中而失败。对于下一次尝试，请搜索 `item_list`。由于 `class` 是 Python 中的保留字，因此使用 `class_` 来作为替代。`soup.find_all()` 原来是 `bs4` 函数的瑞士军刀。

```
dollar_tree_list = soup.find_all(class_ = 'itemlist')
for i in dollar_tree_list[:2]:
  print(i)
```

有趣的是，我发现搜索一个特定类的方法一般是一种成功的方法。通过找出对象的类型和长度，我们可以了解更多有关对象的信息。

```
type(dollar_tree_list)
len(dollar_tree_list)
```

可以使用 `.contents` 从 BeautifulSoup “结果集” 中提取内容。这也是创建单个代表性示例的好时机。

```
example = dollar_tree_list[2] # a representative example
example_content = example.contents
print(example_content)
```

使用 `.attr` 查找该对象内容中存在的属性。注意：`.contents` 通常会返回一个项目的精确的列表，因此第一步是使用方括号符号为该项目建立索引。

```
example_content = example.contents[0]
example_content.attrs
```

现在，我可以看到 `href` 是一个属性，可以像字典项一样提取它：

```
example_href = example_content['href']
print(example_href)
```

### 整合网站抓取工具

所有的这些探索为我们提供了前进的路径。这是厘清上面逻辑的一个清理版本。

```
city_hrefs = [] # initialise empty list

for i in dollar_tree_list:
    cont = i.contents[0]
    href = cont['href']
    city_hrefs.append(href)

#  check to be sure all went well
for i in city_hrefs[:2]:
  print(i)
```

输出的内容是一个关于抓取爱达荷州 Family Dollar 商店 URL 的列表。

也就是说，我仍然没有获得地址信息！现在，需要抓取每个城市的 URL 以获得此信息。因此，我们使用一个具有代表性的示例重新开始该过程。

```
page2 = requests.get(city_hrefs[2]) # again establish a representative example
soup2 = BeautifulSoup(page2.text, 'html.parser')
```

![Family Dollar 地图和代码][19]

地址信息嵌套在 `type="application/ld+json"` 里。经过大量的地理位置抓取之后，我开始认识到这是用于存储地址信息的一般结构。幸运的是，`soup.find_all()` 开启了利用 `type` 搜索。

```
arco = soup2.find_all(type="application/ld+json")
print(arco[1])
```

地址信息在第二个列表成员中！原来如此！

使用 `.contents` 提取（从第二个列表项中）内容（这是过滤后的合适的默认操作）。同样，由于输出的内容是一个列表，因此我为该列表项建立了索引：

```
arco_contents = arco[1].contents[0]
arco_contents
```

喔，看起来不错。此处提供的格式与 JSON 格式一致（而且，该类型的名称中确实包含 “json”）。 JSON 对象的行为就像是带有嵌套字典的字典。一旦你熟悉利用其去工作，它实际上是一种不错的格式（当然，它比一长串正则表达式命令更容易编程）。尽管从结构上看起来像一个 JSON 对象，但它仍然是 `bs4` 对象，需要通过编程方式转换为 JSON 对象才能对其进行访问：

```
arco_json =  json.loads(arco_contents)
```

```
type(arco_json)
print(arco_json)
```

在该内容中，有一个被调用的 `address` 键，该键要求地址信息在一个比较小的嵌套字典里。可以这样检索：

```
arco_address = arco_json['address']
arco_address
```

好吧，请大家注意。现在我可以遍历存储爱达荷州 URL 的列表：

```
locs_dict = [] # initialise empty list

for link in city_hrefs:
  locpage = requests.get(link)   # request page info
  locsoup = BeautifulSoup(locpage.text, 'html.parser')
      # parse the page's content
  locinfo = locsoup.find_all(type="application/ld+json")
      # extract specific element
  loccont = locinfo[1].contents[0]  
      # get contents from the bs4 element set
  locjson = json.loads(loccont)  # convert to json
  locaddr = locjson['address'] # get address
  locs_dict.append(locaddr) # add address to list
```

### 用 Pandas 整理我们的网站抓取结果

我们在字典中装载了大量数据，但是还有一些额外的无用项，它们会使重用数据变得比需要的更为复杂。要执行最终的数据组织，我们需要将其转换为 Pandas 数据框架，删除不需要的列 `@type` 和 `country`，并检查前五行以确保一切正常。

```
locs_df = df.from_records(locs_dict)
locs_df.drop(['@type', 'addressCountry'], axis = 1, inplace = True)
locs_df.head(n = 5)
```

确保保存结果！！

```
df.to_csv(locs_df, "family_dollar_ID_locations.csv", sep = ",", index = False)
```

我们做到了！所有爱达荷州 Family Dollar 商店都有一个用逗号分隔的列表。多令人兴奋。

### Selenium 和数据抓取的一点说明

[Selenium][5] 是用于与网页自动交互的常用工具。为了解释为什么有时必须使用它，让我们来看一个使用 Walgreens 网站的示例。 “检查元素” 提供了浏览器显示内容的代码：

![Walgreens 位置页面和代码][20]

虽然 “查看页面源代码” 提供了有关 `requests` 将获得什么内容的代码：

![Walgreens 源代码][21]

如果这两个不一致，是有一些插件可以修改源代码 —— 因此，应在将页面加载到浏览器后对其进行访问。`requests` 不能做到这一点，但是 Selenium 可以做到。

Selenium 需要 Web 驱动程序来检索内容。实际上，它会打开 Web 浏览器，并收集此页面的内容。Selenium 功能强大 —— 它可以通过多种方式与加载的内容进行交互（请阅读文档）。使用 Selenium 获取数据后，继续像以前一样使用 BeautifulSoup：

```
url = "https://www.walgreens.com/storelistings/storesbycity.jsp?requestType=locator&state=ID"
driver = webdriver.Firefox(executable_path = 'mypath/geckodriver.exe')
driver.get(url)
soup_ID = BeautifulSoup(driver.page_source, 'html.parser')
store_link_soup = soup_ID.find_all(class_ = 'col-xl-4 col-lg-4 col-md-4')
```

对于 Family Dollar 这种情形，我不需要 Selenium，但是当呈现的内容与源代码不同时，我确实会保留使用 Selenium。

### 小结

总之，使用网站抓取来完成有意义的任务时：

  * 耐心一点
  * 查阅手册（它们非常有帮助）

如果你对答案感到好奇：

![Family Dollar 位置图][23]

美国有很多 Family Dollar 商店。

完整的源代码是：

```
import requests
from bs4 import BeautifulSoup
import json
from pandas import DataFrame as df

page = requests.get("https://www.familydollar.com/locations/")
soup = BeautifulSoup(page.text, 'html.parser')

# find all state links
state_list = soup.find_all(class_ = 'itemlist')

state_links = []

for i in state_list:
    cont = i.contents[0]
    attr = cont.attrs
    hrefs = attr['href']
    state_links.append(hrefs)

# find all city links
city_links = []

for link in state_links:
    page = requests.get(link)
    soup = BeautifulSoup(page.text, 'html.parser')
    familydollar_list = soup.find_all(class_ = 'itemlist')
    for store in familydollar_list:
        cont = store.contents[0]
        attr = cont.attrs
        city_hrefs = attr['href']
        city_links.append(city_hrefs)
# to get individual store links
store_links = []

for link in city_links:
    locpage = requests.get(link)
    locsoup = BeautifulSoup(locpage.text, 'html.parser')
    locinfo = locsoup.find_all(type="application/ld+json")
    for i in locinfo:
        loccont = i.contents[0]
        locjson = json.loads(loccont)
        try:
            store_url = locjson['url']
            store_links.append(store_url)
        except:
            pass

# get address and geolocation information
stores = []

for store in store_links:
    storepage = requests.get(store)
    storesoup = BeautifulSoup(storepage.text, 'html.parser')
    storeinfo = storesoup.find_all(type="application/ld+json")
    for i in storeinfo:
        storecont = i.contents[0]
        storejson = json.loads(storecont)
        try:
            store_addr = storejson['address']
            store_addr.update(storejson['geo'])
            stores.append(store_addr)
        except:
            pass

# final data parsing
stores_df = df.from_records(stores)
stores_df.drop(['@type', 'addressCountry'], axis = 1, inplace = True)
stores_df['Store'] = "Family Dollar"

df.to_csv(stores_df, "family_dollar_locations.csv", sep = ",", index = False)
```

作者注释：本文改编自 2020 年 2 月 9 日在俄勒冈州波特兰的[我在 PyCascades 的演讲][24]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/web-scraping-python

作者：[Julia Piaskowski][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/julia-piaskowski
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_html_code.png?itok=VjUmGsnl (HTML code)
[2]: https://requests.readthedocs.io/en/master/
[3]: https://beautiful-soup-4.readthedocs.io/en/latest/
[4]: https://pandas.pydata.org/
[5]: https://www.selenium.dev/
[6]: https://github.com/jpiaskowski/pycas2020_web_scraping
[7]: https://opensource.com/article/20/4/install-python-linux
[8]: https://opensource.com/article/19/8/how-install-python-windows
[9]: https://opensource.com/article/19/5/python-3-default-mac
[10]: https://github.com/jpiaskowski/pycas2020_web_scraping/blob/master/example/Familydollar_location_scrape-all-states.ipynb
[11]: https://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html
[12]: https://opensource.com/article/20/4/build-websites
[13]: https://www.contentkingapp.com/academy/robotstxt/
[14]: https://www.researchgate.net/publication/324907302_Legality_and_Ethics_of_Web_Scraping
[15]: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3221625
[16]: https://locations.familydollar.com/id/
[17]: https://opensource.com/sites/default/files/uploads/familydollar1.png (Family Dollar Idaho locations page)
[18]: https://opensource.com/sites/default/files/uploads/familydollar2.png (Family Dollar page source code)
[19]: https://opensource.com/sites/default/files/uploads/familydollar3.png (Family Dollar map and code)
[20]: https://opensource.com/sites/default/files/uploads/walgreens1.png (Walgreens location page and code)
[21]: https://opensource.com/sites/default/files/uploads/walgreens2.png (Walgreens source code)
[22]: https://www.walgreens.com/storelistings/storesbycity.jsp?requestType=locator\&state=ID
[23]: https://opensource.com/sites/default/files/uploads/family_dollar_locations.png (Family Dollar locations map)
[24]: https://2020.pycascades.com/talks/adventures-in-babysitting-webscraping-for-python-and-html-novices/
