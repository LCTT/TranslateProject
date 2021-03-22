[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Python to explore Google's Natural Language API)
[#]: via: (https://opensource.com/article/19/7/python-google-natural-language-api)
[#]: author: (JR Oakes https://opensource.com/users/jroakes)

利用 Python 探究 Google 的自然语言 API(应用程序接口)
======
Google API 可以提供有关 Google 如何对网站进行分类的线索以及调整内容以改进搜索结果的方法。
![计算机屏幕放大镜][1]

作为搜索引擎技术优化器，我一直在寻找以新颖的方式使用数据的方法，以更好地了解 Google 如何对网站进行排名。我最近研究了 Google 的 [自然语言 API][2] 是否能更好地了解 Google 如何分类网站内容。

尽管有 [开源 NLP 工具][3]，要探索 Google 工具，假设在其他产品中使用相同技术的前提下，像 Search。本文介绍了 Google 的自然语言 API，并探究了常见的自然语言处理（NLP）任务以及如何将其用于报告网站内容的创建。

### 了解数据类型

首先，了解 Google 自然语言 API 返回的数据类型非常重要。

#### 实体

实体是可以与物理世界中的某些事物联系在一起的文本短语。命名实体识别（NER）是 NLP 的难点，因为工具通常需要查看关键字的完整上下文才能理解其用法。例如，同形异义字拼写相同，但是具有多种含义。句子中的 "`lead`" 是指一种金属(名词),使某人移动(动词），还可能是剧本中的主要角色(也是名词)？Google 有 12 种不同类型的实体，还有第 13 个全方位类别称为 "`UNKNOWN`(未知)"。一些实体与 Wikipedia(维基百科)的文章相关，表明 [知识图谱][4] 对数据的影响。每个实体都返回一个显著的与所提供文本的整体相关性的分数。

![实体][5]

#### 情感

情感，对某事的看法或态度，是判断文档和句子标准以及在文档中发现单个实体。情感的得分范围从 -1.0（负）到 1.0（正）。大小代表情感的非标准化强度;它的范围是 0.0 到无穷大。

![情感][6]

#### 语法

语法分析包含大多数常见的 NLP 活动，在更好的 `libraries`(库)中发现，例如 [lemmatization(词形演变)][7]，[part-of-speech tagging(词性标记)][8] 和 [dependency-tree parsing(依赖树分析)][9]。 NLP 主要处理帮助机器理解文本和关键字之间的关系。语法分析是大多数语言处理或理解任务的基础部分。

![语法][10]

#### 分类

分类是将整个给定内容分配给特定行业或主题类别，其置信度得分从 0.0 到 1.0。这些分类似乎与其他 Google 工具使用的受众群体和网站类别相同，像 AdWords。

![分类][11]

### 提取数据

现在，我将提取一些示例数据进行处理。我使用 Google 的 [搜索控制台 API][12] 收集了一些搜索查询及其相应的网址。Google Search Console 是一种工具，可报告人们使用 Google Search 查找网站页面术语。[开源的 Jupyter Notebook][13] 可提取有关网站的类似数据。在此示例中，我在网站（没命名）上提取 Google Search Console 生成于 2019 年 1 月 1 日至 6 月 1 日之间的数据，并将其限制为至少获得一次点击（而不只是印象）的查询。

该数据集包含 2969 页面和 7144 条显示了网页 Google Search 搜索结果查询的信息。下表显示，绝大多数页面获得的点击很少，因为该网站侧重于所谓的长尾（越特殊，通常更长）而不是短尾（非常普遍，搜索量更大）搜索查询。

![所有页面的点击次数柱状图][14]

为了减少数据集的大小并仅获得效果最好的页面，我将数据集限制为在此期间至少获得 20 次展示的页面。这是精炼数据集的按页点击的柱状图，其中包括 723 页：

![部分网页的点击次数柱状图][15]

在 Python 中使用 Google 自然语言 API 库

要测试 API，在 Python 中创建一个利用 **[google-cloud-language(Google 云语言)][16]** 库的小脚本。以下代码基于 Python 3.5+。

首先，激活一个新的虚拟环境并安装库。用环境的唯一名称替换 **＆lt;your-env＆gt;** 。

```
virtualenv &lt;your-env&gt;
source &lt;your-env&gt;/bin/activate
pip install --upgrade google-cloud-language
pip install --upgrade requests
```

该脚本从 URL 提取 HTML，并将 HTML 提供给自然语言 API。返回一个包含 **sentiment**, **entities**, 和 **categories** 的字典，其中这些键值都是列表。我使用 Jupyter Notebook 运行此代码，因为使用同一内核注释和重试代码更加容易。

```
# Import needed libraries
import requests
import json

from google.cloud import language
from google.oauth2 import service_account
from google.cloud.language import enums
from google.cloud.language import types

# Build language API client (requires service account key)
client = language.LanguageServiceClient.from_service_account_json('services.json')

# Define functions
def pull_googlenlp(client, url, invalid_types = ['OTHER'], **data):
   
        html = load_text_from_url(url, **data)
   
        if not html:
        return None
   
        document = types.Document(
        content=html,
        type=language.enums.Document.Type.HTML )

        features = {'extract_syntax': True,
                'extract_entities': True,
                'extract_document_sentiment': True,
                'extract_entity_sentiment': True,
                'classify_text': False
                }
   
        response = client.annotate_text(document=document, features=features)
        sentiment = response.document_sentiment
        entities = response.entities
   
        response = client.classify_text(document)
        categories = response.categories
         
        def get_type(type):
        return client.enums.Entity.Type(entity.type).name
   
        result = {}
   
        result['sentiment'] = []    
        result['entities'] = []
        result['categories'] = []

        if sentiment:
        result['sentiment'] = [{ 'magnitude': sentiment.magnitude, 'score':sentiment.score }]
         
        for entity in entities:
        if get_type(entity.type) not in invalid_types:
                result['entities'].append({'name': entity.name, 'type': get_type(entity.type), 'salience': entity.salience, 'wikipedia_url': entity.metadata.get('wikipedia_url', '-')  })
         
        for category in categories:
        result['categories'].append({'name':category.name, 'confidence': category.confidence})
         
         
        return result

def load_text_from_url(url, **data):

        timeout = data.get('timeout', 20)
   
        results = []
   
        try:
         
        print("Extracting text from: {}".format(url))
        response = requests.get(url, timeout=timeout)

        text = response.text
        status = response.status_code

        if status == 200 and len(text) &gt; 0:
                return text
         
        return None
         

        except Exception as e:
        print('Problem with url: {0}.'.format(url))
        return None
```

要访问该 API，请按照 Google 的 [快速入门说明][17] 在Google Cloud Console 中创建一个项目，启用该 API 并下载服务帐户密钥。之后，您应该拥有一个类似于以下内容的 JSON 文件：

![`services.json` 文件][18]

命名为 **services.json** 上传到项目文件夹。

然后，您可以通过运行以下命令为任何 URL（例如 Opensource.com）拉取 API 数据：

```
url = "<https://opensource.com/article/19/6/how-ssh-running-container>"
pull_googlenlp(client,url)
```

如果设置正确，您将看到以下输出：

![拉取 API 数据的输出][19]

为了使入门更加容易，我创建了一个 [Jupyter Notebook][20]，您可以下载并使用它来测试提取网页的实体，类别和情感。我更喜欢使用 [JupyterLab][21]，它是 Jupyter Notebook 的扩展，其中包括文件查看器和其他增强的用户体验功能。如果您不熟悉这些工具，我认为利用 [Anaconda][22] 是开始使用 Python 和 Jupyter 的最简单途径。它使安装和设置 Python 以及公共库变得非常容易，尤其是在 Windows 上。

### 处理数据

使用这些可抓取给定页面的 HTML 并将其传递给 Natural Language API 的函数，我可以对 723 个 URL 进行一些分析。首先，我将通过查看所有页面中返回的顶级分类的数量来查看与网站相关的分类。

#### 分类

![来自示例站点的分类数据][23]

这似乎是该特定站点关键主题的相当准确的表示法。通过查看一个效果最好的页面进行排名的单个查询，我可以比较同一查询在 Google (搜索)结果中的其他排名页面。

  * _URL 1 |顶级类别：/法律和政府/与法律相关的（0.5099999904632568）共 1 个类别。_
  * _未返回任何类别。_
  * _URL 3 |顶级类别：/ Internet＆amp;电信/移动与无线（0.6100000143051147）共 1 个类别。_
  * _URL 4 |顶级类别：/计算机与电子产品/软件（0.5799999833106995）共有 2 个类别。_
  * _URL 5 |顶级类别：/ Internet＆amp;电信/移动与无线/移动应用程序和附件（0.75）共有 1 个类别。_
  * _未返回任何类别。_
  * _URL 7 |顶级类别：/计算机与电子/软件/商业与生产力软件（0.7099999785423279）共2个类别。_
  * _URL 8 |顶级类别：/法律和政府/与法律相关的（0.8999999761581421）共 3 个类别。_
  * _URL 9 |顶级类别：/参考/一般参考/类型指南和模板（0.6399999856948853）共有 1 个类别。_
  * _未返回任何类别。_

上方括号中的数字表示 Google 对页面内容与该类别相关的置信度。对于相同类别，第八个结果比第一个结果具有更高的置信度，因此，这似乎不是定义排名相关性的灵丹妙药。此外，类别太宽泛导致无法满足特定搜索主题的需要。

通过排名查看平均置信度，这两个指标之间似乎没有相关性，至少对于此数据集而言：

![平均置信度排名分布图][24]

这两种方法都可以对网站进行有规模检查以确保内容类别易于理解，并且样板或销售内容不会使您的页面与您的主要专业知识领域无关。想一想，如果您出售工业用品，但是您的页面返回 _Marketing(销售)_ 作为主要类别。似乎没有强烈的建议，即类别相关性至少在页面级别与您的排名有关系。

#### 情感

我不会在情感上花很多时间。在所有从 API 返回情感的页面中，它们分为两个容器：0.1 和 0.2，这几乎是中立的。根据柱状图，很容易看出情感没有太大价值。对于新闻或舆论网站而言，测量特定页面的情感到中值排名之间的相关性将是一个更加有趣的指标。

![独特页面的情感柱状图][25]

#### 实体

在我看来，实体是 API 中最有趣的部分。这是根据显着性（或与页面的相关性）通过所有页面选择顶级实体。请注意，对于相同的术语（销售清单），Google 会推断出不同的类型，可能是错误的。这是由于这些术语出现在内容中的不同上下文中引起的。

![示例网站的顶级实体][26]

然后，我分别查看了每个实体类型，并一起查看了该实体的显着性与页面的最佳排名位置之间是否存在任何关联。对于每种类型，我将按匹配该类型突出性排序（降序）匹配顶级实体的突出性（与页面的整体相关性）。

在所有示例中，某些实体类型返回零突出性，因此我在下面的图表中省略了那些结果。

![突出性与最佳排名位置的相关性][27]

**Consumer Good(消费性商品)** 实体类型具有最高的正相关性，皮尔森相关性为 0.15854，尽管由于较低编号的排名更好，所以 **Person(皮尔森)** 实体的最佳结果具有 -0.15483 的相关性。这是一个非常小的样本集，尤其是对于单个实体类型，因此我不能处理太多数据。我没有发现任何具有强相关性的值，但是 **Person(皮尔森)** 实体最有意义。网站通常都有关于其首席执行官和其他主要雇员的页面，这些页面很可能在这些查询的搜索结果方面做得好。

继续，当从整体上看站点，以下主题表现出基于 **entity(实体)** **name(名称)** 和 **entity type(实体类型)**。

![基于实体名称和实体类型的主题][28]

我使一些看起来过于特殊的掩饰网站身份的结果模糊不清。从主题上讲，名称信息是在您（或竞争对手）的网站上局部查看其核心主题的一种好方法。这样做仅基于示例网站的排名网址，而不是基于所有网站的可能网址（因为 Search Console(搜索引擎) 数据仅记录Google 中展示的页面），但是结果会很有趣，尤其是当您使用像 [Ahrefs][29] 之类的工具拉取主排名网址的网站时，该工具会跟踪许多查询以及这些查询的 Google 搜索结果。

实体数据中另一个有趣的部分是标记为 **CONSUMER_GOOD** 的实体倾向于 “查看” 像我已经在看到 “Knowledge Results(知识结果)”的结果，即页面右侧的 Google Search (搜索)结果。

![Google 搜索结果][30]

在我们的数据集中具有三个或三个以上关键字的 **Consumer Good(消费性商品)** 实体名称中，有 5.8％ 的 Knowledge Results与 Google 对该实体命名的结果相同。这意味着，如果您在 Google 中搜索术语或短语，则右侧的框（例如，上面显示 Linux 的 Knowledge Results）将显示在搜索结果页面中。由于 Google 会 “挑选” 代表实体的示例网页，因此这是一个很好的可以在搜索结果中识别出具有唯一特征的机会。同样有趣的是，5.8％ 的在 Google 中显示这些 Knowledge Results 名称中，没有一个实体具有从 Natural Language API 返回 Wikipedia URL。这足够有趣，可以保证额外的分析。这将是非常有用的，尤其是对于更难懂的像 Ahrefs 传统的全球排名跟踪工具主题，在其数据库中则没有。

如前所述，Knowledge Results(知识结果)对于希望在 Google 中使其其内容起作用的网站所有者而言非常重要，因为它们在桌面搜索中加强高亮显示。假设，它们也很可能与 Google [Discover][31] 的知识库主题保持一致，这是一款适用于 Android 和 iOS 的产品，旨在根据用户感兴趣但不明确搜索的主题向用户展示内容。

### 总结

本文介绍了 Google 的自然语言 API，共享了一些代码，并研究了此 API 对网站所有者可能有用的方式。关键要点是：

  * 学习使用 Python 和 Jupyter Notebooks 可以开始您的数据收集任务进入令人难以置信的全球 API 和由令人难以置信的聪明和有才能的人构建的开源项目（如 Pandas 和 NumPy）。
  * Python 允许我为了一个特定目的快速提取和测试有关 API 值的假设。
  * 通过 Google 的分类 API 传递网站页面可能是一项很好的检查，以确保其内容分解成正确的主题类别。为竞争对手的网站执行此操作还可以提供有关在何处进行调整或创建内容的指导。
  * 对于示例网站，Google 的情感评分似乎并不是一个有趣的指标，但是对于新闻或基于意见的网站，它可能是一个有趣的指标。
  * Google 的发现实体从整体上提供了网站的更细化的主题级别视图，并且像分类一样，在竞争性内容分析中使用将非常有趣。
  * 实体可以帮助定义机会，使您的内容可以与搜索结果或 Google Discover 结果中的 Google Knowledge 块保持一致。我们将5.8％的结果设置为更长的（关键字计数）**Consumer Goods(消费商品)** 实体，显示这些结果，对于某些网站来说，可能有机会更好地优化这些实体的页面突出性分数，从而有更好的机会在 Google 搜索结果或 Google Discovers 建议中捕获此起重要作用的位置。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/python-google-natural-language-api

作者：[JR Oakes][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jroakes
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_issue_bug_programming.png?itok=XPrh7fa0 (magnifying glass on computer screen)
[2]: https://cloud.google.com/natural-language/#natural-language-api-demo
[3]: https://opensource.com/article/19/3/natural-language-processing-tools
[4]: https://en.wikipedia.org/wiki/Knowledge_Graph
[5]: https://opensource.com/sites/default/files/uploads/entities.png (Entities)
[6]: https://opensource.com/sites/default/files/uploads/sentiment.png (Sentiment)
[7]: https://en.wikipedia.org/wiki/Lemmatisation
[8]: https://en.wikipedia.org/wiki/Part-of-speech_tagging
[9]: https://en.wikipedia.org/wiki/Parse_tree#Dependency-based_parse_trees
[10]: https://opensource.com/sites/default/files/uploads/syntax.png (Syntax)
[11]: https://opensource.com/sites/default/files/uploads/categories.png (Categories)
[12]: https://developers.google.com/webmaster-tools/
[13]: https://github.com/MLTSEO/MLTS/blob/master/Demos.ipynb
[14]: https://opensource.com/sites/default/files/uploads/histogram_1.png (Histogram of clicks for all pages)
[15]: https://opensource.com/sites/default/files/uploads/histogram_2.png (Histogram of clicks for subset of pages)
[16]: https://pypi.org/project/google-cloud-language/
[17]: https://cloud.google.com/natural-language/docs/quickstart
[18]: https://opensource.com/sites/default/files/uploads/json_file.png (services.json file)
[19]: https://opensource.com/sites/default/files/uploads/output.png (Output from pulling API data)
[20]: https://github.com/MLTSEO/MLTS/blob/master/Tutorials/Google_Language_API_Intro.ipynb
[21]: https://github.com/jupyterlab/jupyterlab
[22]: https://www.anaconda.com/distribution/
[23]: https://opensource.com/sites/default/files/uploads/categories_2.png (Categories data from example site)
[24]: https://opensource.com/sites/default/files/uploads/plot.png (Plot of average confidence by ranking position )
[25]: https://opensource.com/sites/default/files/uploads/histogram_3.png (Histogram of sentiment for unique pages)
[26]: https://opensource.com/sites/default/files/uploads/entities_2.png (Top entities for example site)
[27]: https://opensource.com/sites/default/files/uploads/salience_plots.png (Correlation between salience and best ranking position)
[28]: https://opensource.com/sites/default/files/uploads/themes.png (Themes based on entity name and entity type)
[29]: https://ahrefs.com/
[30]: https://opensource.com/sites/default/files/uploads/googleresults.png (Google search results)
[31]: https://www.blog.google/products/search/introducing-google-discover/
