[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A beginner's guide to web scraping with Python)
[#]: via: (https://opensource.com/article/20/5/web-scraping-python)
[#]: author: (Julia Piaskowski https://opensource.com/users/julia-piaskowski)

A beginner's guide to web scraping with Python
利用 Python 爬网站的新手指南
======
Get some hands-on experience with essential Python tools to scrape
complete HTML sites.
![HTML code][1]
通过基本的 Python 工具获取爬完整 HTML 网站的实践经验。
![HTML代码][1]

There are plenty of great books to help you learn Python, but who actually reads these A to Z? (Spoiler: not me).
有很多很棒的书可以帮助您学习 Python ，但是谁真正读了这些（书名从A至Z）呢？（剧透：不是我）。

Many people find instructional books useful, but I do not typically learn by reading a book front to back. I learn by doing a project, struggling, figuring some things out, and then reading another book. So, throw away your book (for now), and let's learn some Python.
许多人觉得教学书籍很有用，但我通常不会从头到尾地阅读一本书来学习。我通过做一个项目，努力的，弄清楚一些内容，然后再读另一本书来学习。因此，暂时丢掉书，让我们一起学习 Python。

What follows is a guide to my first scraping project in Python. It is very low on assumed knowledge in Python and HTML. This is intended to illustrate how to access web page content with Python library [requests][2] and parse the content using [BeatifulSoup4][3], as well as JSON and [pandas][4]. I will briefly introduce [Selenium][5], but I will not delve deeply into how to use that library—that topic deserves its own tutorial. Ultimately I hope to show you some tricks and tips to make web scraping less overwhelming.
接下来是我的第一个 Python 抓取项目向导。假设在 Python 和 HTML 的知识处于很低水平。这旨在说明如何使用 Python 的 [requests][2] 库访问网页内容，如何使用 [BeatifulSoup4][3]库，以及 `JSON` 和 [pandas][4] 库解析网页内容。我将简要介绍 [Selenium][5] 库，但我不会深入研究如何使用该库——该主题应该作为它的指南。最终，我希望向您展示一些技巧和提示，以减少网络爬取过程中遇到问题而不知所措。
### Installing our dependencies  安装依赖

All the resources from this guide are available at my [GitHub repo][6]. If you need help installing Python 3, check out the tutorials for [Linux][7], [Windows][8], and [Mac][9].
我的 [GitHub 存储库][6] 中提供了本指南的所有资源。如果需要安装 Python3 的帮助，请查看 [Linux][7]，[Windows][8] 和 [Mac][9] 的教程。

```
$ python3 -m venv
$ source venv/bin/activate
$ pip install requests bs4 pandas
```

If you like using JupyterLab, you can run all the code using this [notebook][10]. There are a lot of ways to [install JupyterLab][11], and this is one of them:
如果您喜欢使用 JupyterLab ，则可以使用 [notebook][10] 运行所有代码。[安装 JupyterLab][11] 有很多方法，这是其中一种：

```
# from the same virtual environment as above, run:
$ pip install jupyterlab
```

### Setting a goal for our web scraping project  为网站抓取项目设定目标

Now we have our dependencies installed, but what does it take to scrape a webpage? 
现在我们已经安装了依赖项，但是爬取网页需要做什么？

Let's take a step back and be sure to clarify our goal. Here is my list of requirements for a successful web scraping project.
让我们后退一步，确保使目标清晰。下面是成功完成网站爬取项目需求列表。

  * We are gathering information that is worth the effort it takes to build a working web scraper.
收集有效的构建网站爬取的信息。
  * We are downloading information that can be legally and ethically gathered by a web scraper.
基于法律和遵循道德规范的收集利用网站爬取工具下载的信息。
  * We have some knowledge of how to find the target information in HTML code.
了解如何在 HTML 代码中找到目标信息。
  * We have the right tools: in this case, it's the libraries **BeautifulSoup** and **requests**.
利用恰当的工具：在此情况下，需要使用 **BeautifulSoup** 库和 **requests** 库。
  * We know (or are willing to learn) how to parse JSON objects.
知道（或愿意去学习）如何解析 JSON 对象。
  * We have enough data skills to use **pandas**.
有足够的 **pandas** 数据处理技能。

A comment on HTML: While HTML is the beast that runs the Internet, what we mostly need to understand is how tags work. A tag is a collection of information sandwiched between angle-bracket enclosed labels. For example, here is a pretend tag, called "pro-tip":
关于 HTML 的注释：HTML 是运行在 Internet 上的“猛兽”，但我们最需要了解的是标签的工作方式。标签是一对由尖括号包围关键词（一般成对出现，其内容在两个标签中间）。比如，这是一个伪标签，称为 “`pro-tip`”：

```
&lt;pro-tip&gt; All you need to know about html is how tags work &lt;/pro-tip&gt;
```

We can access the information in there ("All you need to know…") by calling its tag "pro-tip." How to find and access a tag will be addressed further in this tutorial. For more of a look at HTML basics, check out [this article][12].
我们可以通过调用标签 “`pro-tip`” 来访问其中的信息（"All you need to know…"）。本教程将进一步介绍如何查找和访问标签。要进一步了解 HTML 基础知识，请查看 [本文][12]。
### What to look for in a web scraping project  在网站爬取项目中查找内容

Some goals for gathering data are more suited for web scraping than others. My guidelines for what qualifies as a good project are as follows.
利用网站爬取采集数据比利用其他方法更合适。接下来的就是我的教程。

There is no public API available for the data. It would be much easier to capture structured data through an API, and it would help clarify both the legality and ethics of gathering the data. There needs to be a sizable amount of structured data with a regular, repeatable format to justify this effort. Web scraping can be a pain. BeautifulSoup (bs4) makes this easier, but there is no avoiding the individual idiosyncrasies of websites that will require customization. Identical formatting of the data is not required, but it does make things easier. The more "edge cases" (departures from the norm) present, the more complicated the scraping will be.
没有可用于数据(处理)的公共 API。通过 API 抓取结构化数据会容易得多，这将有助于阐明收集数据的合法性和道德规范。这就需要大量的采用规则的结构化数据，重复的格式可以证明这一点。爬网站可能会很痛苦。 `BeautifulSoup（bs4）`使操作更容易，但是却不可避免地需要定制。不需要格式相同的数据，但这确实使事情变得更容易。当前存在的 “边际案例”（偏离规范）越多，爬取将越复杂。

Disclaimer: I have zero legal training; the following is not intended to be formal legal advice.
免责声明：我没有参加过法律培训；以下内容不打算作为正式的法律建议。

On the note of legality, accessing vast troves of information can be intoxicating, but just because it's possible doesn't mean it should be done.
关于合法性，访问大量有价值信息可能令人兴奋，但正因为如此可能不意味着允许这样做。

There is, thankfully, public information that can guide our morals and our web scrapers. Most websites have a [robots.txt][13] file associated with the site, indicating which scraping activities are permitted and which are not. It's largely there for interacting with search engines (the ultimate web scrapers). However, much of the information on websites is considered public information. As such, some consider the robots.txt file as a set of recommendations rather than a legally binding document. The robots.txt file does not address topics such as ethical gathering and usage of the data.
值得庆幸的是，有一些公共信息可以指导我们的道德规范和网站爬取工具。大多数网站都有与该网站关联的 [robots.txt][13] 文件，指出允许哪些爬取活动，哪些不被允许。它主要用于与搜索引擎（最终的网站抓取工具）进行交互。然而，网站上的许多信息都被视为公共信息。因此，将 `robots.txt` 文件视为一组建议，不如看成是具有法律约束力的文档。 `robots.txt` 文件未涉及道德规范下的数据收集和使用等主题。

Questions I ask myself before beginning a scraping project:
在开始爬取项目之前，问自己以下问题：

  * Am I scraping copyrighted material?
我是否在爬取版权材料？
  * Will my scraping activity compromise individual privacy?
我的爬取活动会危害个人隐私吗？
  * Am I making a large number of requests that may overload or damage a server?
我是否发送了大量可能会使服务器超载或损坏的请求？
  * Is it possible the scraping will expose intellectual property I do not own?
爬取是否会暴露我不拥有的知识产权？
  * Are there terms of service governing use of the website, and am I following those?
是否有管理使用网站的服务条款，我是否遵循这些条款？
  * Will my scraping activities diminish the value of the original data? (for example, do I plan to repackage the data as-is and perhaps siphon off website traffic from the original source)?
我的爬取活动会减少原始数据的价值吗？（例如，我是否打算按原样重新打包数据，或者可能从原始来源中抽取（占用）网站流量）？

When I scrape a site, I make sure I can answer "no" to all of those questions.
当我爬取一个网站时，请确保可以对所有这些问题回答 “否”。

For a deeper look at the legal concerns, see the 2018 publications [Legality and Ethics of Web Scraping by Krotov and Silva][14] and [Twenty Years of Web Scraping and the Computer Fraud and Abuse Act by Sellars][15].
要深入了解法律问题，请参阅2018年出版的 [Krotov 和 Silva 撰写的Web爬虫的合法性和道德性][14] 和 [Sellars的二十年 Web 爬虫和计算机欺诈与滥用法案][15]。
### Now it's time to scrape! 现在开始爬网站

After assessing the above, I came up with a project. My goal was to extract addresses for all Family Dollar stores in Idaho. These stores have an outsized presence in rural areas, so I wanted to understand how many there are in a rather rural state.
经过上述评估，我想到了一个项目。 我的目标是爬取爱达荷州所有 Family Dollar 商店的地址。 这些商店在农村地区规模很大，因此我想了解有多少家这样的商店。

The starting point is the [location page for Family Dollar][16].
起点是 [Family Dollar的位置页面][16]
![Family Dollar Idaho locations page][17]
爱达荷州 Family Dollar 所在地页面

To begin, let's load up our prerequisites in our Python virtual environment. The code from here is meant to be added to a Python file (_scraper.py_ if you're looking for a name) or be run in a cell in JupyterLab.
首先，让我们在 Python 虚拟环境中加载先决条件。 此处的代码旨在添加到 Python 文件（如果要查找名称，则为 _scraper.py_）或在 JupyterLab 的单元中运行。

```
import requests # for making standard html requests
from bs4 import BeautifulSoup # magical tool for parsing html data
import json # for parsing data
from pandas import DataFrame as df # premier library for data organization
```

Next, we request data from our target URL.
接下来，我们从目标 URL 中请求数据。

```
page = requests.get("<https://locations.familydollar.com/id/>")
soup = BeautifulSoup(page.text, 'html.parser')
```

BeautifulSoup will take HTML or XML content and transform it into a complex tree of objects. Here are several common object types that we will use.
BeautifulSoup 将 HTML 或 XML 内容转换为复杂树对象。这是我们将使用的几种常见对象类型。

  * **BeautifulSoup**—the parsed content
**BeautifulSoup** ——解析的内容
  * **Tag**—a standard HTML tag, the main type of bs4 element you will encounter
**Tag**——标准HTML标记，您将遇到bs4元素的主要类型
  * **NavigableString**—a string of text within a tag
**NavigableString**——标签内的文本字符串
  * **Comment**—a special type of NavigableString
**Comment**—— NavigableString 的一种特殊类型

There is more to consider when we look at **requests.get()** output. I've only used **page.text()** to translate the requested page into something readable, but there are other output types:
当我们查看 **requests.get()** 输出时，还有更多要考虑的问题。我仅使用 **page.text()** 将请求的页面转换为可读的内容，但是还有其他输出类型：

  * **page.text()** for text (most common)
  * **page.content()** for byte-by-byte output
  * **page.json()** for JSON objects
  * **page.raw()** for the raw socket response (no thank you)

  * **page.text()** 表示文本（最常见）
  * **page.content()** 用于逐字节输出
  * **page.json()** 用于 JSON 对象
  * **page.raw()** 用于原始套接字响应（没了）

I have only worked on English-only sites using the Latin alphabet. The default encoding settings in **requests** have worked fine for that. However, there is a rich internet world beyond English-only sites. To ensure that **requests** correctly parses the content, you can set the encoding for the text:
我只在使用拉丁字母的纯英语网站上操作。 **requests** 中的默认编码设置可以很好地解决这一问题。然而，除了纯英语网站之外，就是更大的互联网世界。为了确保 **requests** 正确解析内容，您可以设置文本的编码：

```
page = requests.get(URL)
page.encoding = 'ISO-885901'
soup = BeautifulSoup(page.text, 'html.parser')
```

Taking a closer look at BeautifulSoup tags, we see:
仔细研究 BeautifulSoup 标签，我们看到:
  * The bs4 element **tag** is capturing an HTML tag
  * It has both a name and attributes that can be accessed like a dictionary: **tag['someAttribute']**
  * If a tag has multiple attributes with the same name, only the first instance is accessed.
  * A tag's children are accessed via **tag.contents**.
  * All tag descendants can be accessed with **tag.contents**.
  * You can always access the full contents as a string with: **re.compile("your_string")** instead of navigating the HTML tree.

  * `bs4` 元素 **tag** 正在捕获 HTML 标记
  * 它具有名称和属性，可以像字典一样访问：**tag['someAttribute']**
  * 如果标签具有相同名称的多个属性，则仅访问第一个实例。
  * 可通过 **tag.contents** 访问子标签。
  * 所有标签后代都可以通过 **tag.contents** 访问。
  * 你始终可以使用以下字符串：**re.compile("your_string")** 访问作为字符串的所有内容


### Determine how to extract relevant content  确定如何提取相应内容

Warning: this process can be frustrating.
警告：此过程可能令人沮丧。
Extraction during web scraping can be a daunting process filled with missteps. I think the best way to approach this is to start with one representative example and then scale up (this principle is true for any programming task). Viewing the page's HTML source code is essential. There are a number of ways to do this.
网站爬取过程中的提取可能是一个令人生畏的充满了错误过程。我认为解决此问题的最佳方法是从一个有代表性的示例开始然后进行扩展（此原理对于任何编程任务都是适用的）。查看页面的 HTML 源代码至关重要。有很多方法可以做到这一点。

You can view the entire source code of a page using Python in your terminal (not recommended). Run this code at your own risk:
你可以在终端中使用 Python 查看页面的整个源代码（不建议使用）。运行此代码需要您自担风险：

```
print(soup.prettify())
```

While printing out the entire source code for a page might work for a toy example shown in some tutorials, most modern websites have a massive amount of content on any one of their pages. Even the 404 page is likely to be filled with code for headers, footers, and so on.
虽然打印出页面的整个源代码可能适用于某些教程中显示的消遣示例，但大多数现代网站的页面上都有大量内容。甚至404页面也可能充满了页眉，页脚等代码。

It is usually easiest to browse the source code via **View Page Source** in your favorite browser (right-click, then select "view page source"). That is the most reliable way to find your target content (I will explain why in a moment).
通常，在您喜欢的浏览器中通过 **View Page Source** 浏览源代码是最容易的（单击右键，然后选择"view page source"（查看页面源代码））。这是找到目标内容的最可靠方法（稍后我将解释原因）。

![Family Dollar 页面源代码][18]

In this instance, I need to find my target content—an address, city, state, and zip code—in this vast HTML ocean. Often, a simple search of the page source (**ctrl + F**) will yield the section where my target location is located. Once I can actually see an example of my target content (the address for at least one store), I look for an attribute or tag that sets this content apart from the rest.
在这种情况下，我需要在广阔的 HTML 海洋中找到我的目标内容——地址，城市，州和邮政编码。通常，对页面源（**ctrl+ F**）的简单搜索就会产生目标位置所在的位置。一旦我实际看到目标内容的示例（至少一个商店的地址），便会找到将该内容与其他内容区分开的属性或标签。

It would appear that first, I need to collect web addresses for different cities in Idaho with Family Dollar stores and visit those websites to get the address information. These web addresses all appear to be enclosed in a **href** tag. Great! I will try searching for that using the **find_all** command:
首先，我需要在爱达荷州 Family Dollar 商店中收集不同城市的网址，并访问这些网站以获取地址信息。这些网址似乎都包含在 **href** 标记中。太棒了！我将尝试使用 **find_all** 命令进行搜索：

```
dollar_tree_list = soup.find_all('href')
dollar_tree_list
```

Searching for **href** did not yield anything, darn. This might have failed because **href** is nested inside the class **itemlist**. For the next attempt, search on **item_list**. Because "class" is a reserved word in Python, **class_** is used instead. The bs4 function **soup.find_all()** turned out to be the Swiss army knife of bs4 functions.


```
dollar_tree_list = soup.find_all(class_ = 'itemlist')
for i in dollar_tree_list[:2]:
  print(i)
```

Anecdotally, I found that searching for a specific class was often a successful approach. We can learn more about the object by finding out its type and length.


```
type(dollar_tree_list)
len(dollar_tree_list)
```

The content from this BeautifulSoup "ResultSet" can be extracted using **.contents**. This is also a good time to create a single representative example.


```
example = dollar_tree_list[2] # a representative example
example_content = example.contents
print(example_content)
```

Use **.attr** to find what attributes are present in the contents of this object. Note: **.contents** usually returns a list of exactly one item, so the first step is to index that item using the bracket notation.


```
example_content = example.contents[0]
example_content.attrs
```

Now that I can see that **href** is an attribute, that can be extracted like a dictionary item:


```
example_href = example_content['href']
print(example_href)
```

### Putting together our web scraper

All that exploration has given us a path forward. Here's the cleaned-up version of the logic we figured out above.


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

The output is a list of URLs of Family Dollar stores in Idaho to scrape.

That said, I still don't have address information! Now, each city URL needs to be scraped to get this information. So we restart the process, using a single, representative example.


```
page2 = requests.get(city_hrefs[2]) # again establish a representative example
soup2 = BeautifulSoup(page2.text, 'html.parser')
```

![Family Dollar map and code][19]

The address information is nested within **type= "application/ld+json"**. After doing a lot of geolocation scraping, I've come to recognize this as a common structure for storing address information. Fortunately, **soup.find_all()** also enables searching on **type**.


```
arco = soup2.find_all(type="application/ld+json")
print(arco[1])
```

The address information is in the second list member! Finally!

I extracted the contents (from the second list item) using **.contents** (this is a good default action after filtering the soup). Again, since the output of contents is a list of one, I indexed that list item:


```
arco_contents = arco[1].contents[0]
arco_contents
```

Wow, looking good. The format presented here is consistent with the JSON format (also, the type did have "**json**" in its name). A JSON object can act like a dictionary with nested dictionaries inside. It's actually a nice format to work with once you become familiar with it (and it's certainly much easier to program than a long series of RegEx commands). Although this structurally looks like a JSON object, it is still a bs4 object and needs a formal programmatic conversion to JSON to be accessed as a JSON object:


```
arco_json =  json.loads(arco_contents)

[/code] [code]

type(arco_json)
print(arco_json)
```

In that content is a key called **address** that has the desired address information in the smaller nested dictionary. This can be retrieved thusly:


```
arco_address = arco_json['address']
arco_address
```

Okay, we're serious this time. Now I can iterate over the list store URLs in Idaho:


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

### Cleaning our web scraping results with pandas

We have loads of data in a dictionary, but we have some additional crud that will make reusing our data more complex than it needs to be. To do some final data organization steps, we convert to a pandas data frame, drop the unneeded columns "**@type**" and "**country**"), and check the top five rows to ensure that everything looks alright.


```
locs_df = df.from_records(locs_dict)
locs_df.drop(['@type', 'addressCountry'], axis = 1, inplace = True)
locs_df.head(n = 5)
```

Make sure to save results!!


```
df.to_csv(locs_df, "family_dollar_ID_locations.csv", sep = ",", index = False)
```

We did it! There is a comma-separated list of all the Idaho Family Dollar stores. What a wild ride.

### A few words on Selenium and data scraping

[Selenium][5] is a common utility for automatic interaction with a webpage. To explain why it's essential to use at times, let's go through an example using Walgreens' website. **Inspect Element** provides the code for what is displayed in a browser:

![Walgreens location page and code][20]

 

While **View Page Source** provides the code for what **requests** will obtain:

![Walgreens source code][21]

When these two don't agree, there are plugins modifying the source code—so, it should be accessed after the page has loaded in a browser. **requests** cannot do that, but **Selenium** can.

Selenium requires a web driver to retrieve the content. It actually opens a web browser, and this page content is collected. Selenium is powerful—it can interact with loaded content in many ways (read the documentation). After getting data with **Selenium**, continue to use **BeautifulSoup** as before:


```
url = "[https://www.walgreens.com/storelistings/storesbycity.jsp?requestType=locator\&amp;state=ID][22]"
driver = webdriver.Firefox(executable_path = 'mypath/geckodriver.exe')
driver.get(url)
soup_ID = BeautifulSoup(driver.page_source, 'html.parser')
store_link_soup = soup_ID.find_all(class_ = 'col-xl-4 col-lg-4 col-md-4')
```

I didn't need Selenium in the case of Family Dollar, but I do keep it on hand for those times when rendered content differs from source code.

### Wrapping up

In conclusion, when using web scraping to accomplish a meaningful task:

  * Be patient
  * Consult the manuals (these are very helpful)



If you are curious about the answer:

![Family Dollar locations map][23]

There are many many Family Dollar stores in America.

The complete source code is:


```
import requests
from bs4 import BeautifulSoup
import json
from pandas import DataFrame as df

page = requests.get("<https://www.familydollar.com/locations/>")
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

\--
_Author's note: This article is an adaptation of a [talk I gave at PyCascades][24] in Portland, Oregon on February 9, 2020._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/web-scraping-python

作者：[Julia Piaskowski][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
