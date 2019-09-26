[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10867-1.html)
[#]: subject: (Building scalable social media sentiment analysis services in Python)
[#]: via: (https://opensource.com/article/19/4/social-media-sentiment-analysis-python-scalable)
[#]: author: (Michael McCune  https://opensource.com/users/elmiko/users/jschlessman)

使用 Python 构建可扩展的社交媒体情感分析服务
======

> 学习如何使用 spaCy、vaderSentiment、Flask 和 Python 来为你的作品添加情感分析能力。

![Tall building with windows](https://img.linux.net.cn/data/attachment/album/201905/17/235241zr0cs4czu4psmrl6.jpg)

本系列的[第一部分][2]提供了情感分析工作原理的一些背景知识，现在让我们研究如何将这些功能添加到你的设计中。

### 探索 Python 库 spaCy 和 vaderSentiment

#### 前提条件

  * 一个终端 shell
  * shell 中的 Python 语言二进制文件（3.4+ 版本）
  * 用于安装 Python 包的 `pip` 命令
  * （可选）一个 [Python 虚拟环境][3]使你的工作与系统隔离开来

#### 配置环境

在开始编写代码之前，你需要安装 [spaCy][4] 和 [vaderSentiment][5] 包来设置 Python 环境，同时下载一个语言模型来帮助你分析。幸运的是，大部分操作都容易在命令行中完成。

在 shell 中，输入以下命令来安装 spaCy 和 vaderSentiment 包：

```
pip install spacy vaderSentiment
```

命令安装完成后，安装 spaCy 可用于文本分析的语言模型。以下命令将使用 spaCy 模块下载并安装英语[模型][6]：

```
python -m spacy download en_core_web_sm
```

安装了这些库和模型之后，就可以开始编码了。

#### 一个简单的文本分析

使用 [Python 解释器交互模式][7] 编写一些代码来分析单个文本片段。首先启动 Python 环境：

```
$ python
Python 3.6.8 (default, Jan 31 2019, 09:38:34)
[GCC 8.2.1 20181215 (Red Hat 8.2.1-6)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

*（你的 Python 解释器版本打印可能与此不同。）*

1、导入所需模块：

```
>>> import spacy
>>> from vaderSentiment import vaderSentiment 
```

2、从 spaCy 加载英语语言模型：

```
>>> english = spacy.load("en_core_web_sm")
```

3、处理一段文本。本例展示了一个非常简单的句子，我们希望它能给我们带来些许积极的情感： 

```
>>> result = english("I like to eat applesauce with sugar and cinnamon.")
```

4、从处理后的结果中收集句子。SpaCy 已识别并处理短语中的实体，这一步为每个句子生成情感（即时在本例中只有一个句子）： 

```
>>> sentences = [str(s) for s in result.sents]
```

5、使用 vaderSentiments 创建一个分析器：

```
>>> analyzer = vaderSentiment.SentimentIntensityAnalyzer()
```

6、对句子进行情感分析：

```
>>> sentiment = [analyzer.polarity_scores(str(s)) for s in sentences]
```

`sentiment` 变量现在包含例句的极性分数。打印出这个值，看看它是如何分析这个句子的。

```
>>> print(sentiment)
[{'neg': 0.0, 'neu': 0.737, 'pos': 0.263, 'compound': 0.3612}]
```

这个结构是什么意思？

表面上，这是一个只有一个字典对象的数组。如果有多个句子，那么每个句子都会对应一个字典对象。字典中有四个键对应不同类型的情感。`neg` 键表示负面情感，因为在本例中没有报告任何负面情感，`0.0` 值证明了这一点。`neu` 键表示中性情感，它的得分相当高，为 `0.737`（最高为 `1.0`）。`pos` 键代表积极情感，得分适中，为 `0.263`。最后，`cmpound` 键代表文本的总体得分，它可以从负数到正数，`0.3612` 表示积极方面的情感多一点。

要查看这些值可能如何变化，你可以使用已输入的代码做一个小实验。以下代码块显示了如何对类似句子的情感评分的评估。

```
>>> result = english("I love applesauce!")
>>> sentences = [str(s) for s in result.sents]
>>> sentiment = [analyzer.polarity_scores(str(s)) for s in sentences]
>>> print(sentiment)
[{'neg': 0.0, 'neu': 0.182, 'pos': 0.818, 'compound': 0.6696}]
```

你可以看到，通过将例句改为非常积极的句子，`sentiment` 的值发生了巨大变化。

### 建立一个情感分析服务

现在你已经为情感分析组装了基本的代码块，让我们将这些东西转化为一个简单的服务。

在这个演示中，你将使用 Python [Flask 包][9] 创建一个 [RESTful][8] HTTP 服务器。此服务将接受英文文本数据并返回情感分析结果。请注意，此示例服务是用于学习所涉及的技术，而不是用于投入生产的东西。

#### 前提条件

  * 一个终端 shell
  * shell 中的 Python 语言二进制文件（3.4+ 版本）
  * 安装 Python 包的 `pip` 命令
  * `curl` 命令
  * 一个文本编辑器
  * (可选) 一个 [Python 虚拟环境][3]使你的工作与系统隔离开来

#### 配置环境

这个环境几乎与上一节中的环境相同，唯一的区别是在 Python 环境中添加了 Flask 包。

1、安装所需依赖项：

```
pip install spacy vaderSentiment flask
```

2、安装 spaCy 的英语语言模型：

```
python -m spacy download en_core_web_sm
```

#### 创建应用程序文件

打开编辑器，创建一个名为 `app.py` 的文件。添加以下内容 *（不用担心，我们将解释每一行）*：


```
import flask
import spacy
import vaderSentiment.vaderSentiment as vader

app = flask.Flask(__name__)
analyzer = vader.SentimentIntensityAnalyzer()
english = spacy.load("en_core_web_sm")

def get_sentiments(text):
    result = english(text)
    sentences = [str(sent) for sent in result.sents]
    sentiments = [analyzer.polarity_scores(str(s)) for s in sentences]
    return sentiments

@app.route("/", methods=["POST", "GET"])
def index():
    if flask.request.method == "GET":
        return "To access this service send a POST request to this URL with" \
                " the text you want analyzed in the body."
    body = flask.request.data.decode("utf-8")
    sentiments = get_sentiments(body)
    return flask.json.dumps(sentiments)
```

虽然这个源文件不是很大，但它非常密集。让我们来看看这个应用程序的各个部分，并解释它们在做什么。

```
import flask
import spacy
import vaderSentiment.vaderSentiment as vader
```

前三行引入了执行语言分析和 HTTP 框架所需的包。

```
app = flask.Flask(__name__)
analyzer = vader.SentimentIntensityAnalyzer()
english = spacy.load("en_core_web_sm")
```

接下来的三行代码创建了一些全局变量。第一个变量 `app`，它是 Flask 用于创建 HTTP 路由的主要入口点。第二个变量 `analyzer` 与上一个示例中使用的类型相同，它将用于生成情感分数。最后一个变量 `english` 也与上一个示例中使用的类型相同，它将用于注释和标记初始文本输入。

你可能想知道为什么全局声明这些变量。对于 `app` 变量，这是许多 Flask 应用程序的标准过程。但是，对于 `analyzer` 和 `english` 变量，将它们设置为全局变量的决定是基于与所涉及的类关联的加载时间。虽然加载时间可能看起来很短，但是当它在 HTTP 服务器的上下文中运行时，这些延迟会对性能产生负面影响。

```
def get_sentiments(text):
    result = english(text)
    sentences = [str(sent) for sent in result.sents]
    sentiments = [analyzer.polarity_scores(str(s)) for s in sentences]
    return sentiments
```

这部分是服务的核心 —— 一个用于从一串文本生成情感值的函数。你可以看到此函数中的操作对应于你之前在 Python 解释器中运行的命令。这里它们被封装在一个函数定义中，`text` 源作为文本变量传入，最后 `sentiments` 变量返回给调用者。

```
@app.route("/", methods=["POST", "GET"])
def index():
  if flask.request.method == "GET":
      return "To access this service send a POST request to this URL with" \
              " the text you want analyzed in the body."
  body = flask.request.data.decode("utf-8")
  sentiments = get_sentiments(body)
  return flask.json.dumps(sentiments)
```

源文件的最后一个函数包含了指导 Flask 如何为服务配置 HTTP 服务器的逻辑。它从一行开始，该行将 HTTP 路由 `/` 与请求方法 `POST` 和 `GET` 相关联。

在函数定义行之后，`if` 子句将检测请求方法是否为 `GET`。如果用户向服务发送此请求，那么下面的行将返回一条指示如何访问服务器的文本消息。这主要是为了方便最终用户。

下一行使用 `flask.request` 对象来获取请求的主体，该主体应包含要处理的文本字符串。`decode` 函数将字节数组转换为可用的格式化字符串。经过解码的文本消息被传递给 `get_sentiments` 函数以生成情感分数。最后，分数通过 HTTP 框架返回给用户。

你现在应该保存文件，如果尚未保存，那么返回 shell。

#### 运行情感服务

一切就绪后，使用 Flask 的内置调试服务器运行服务非常简单。要启动该服务，请从与源文件相同的目录中输入以下命令：

```
FLASK_APP=app.py flask run
```

现在，你将在 shell 中看到来自服务器的一些输出，并且服务器将处于运行状态。要测试服务器是否正在运行，你需要打开第二个 shell 并使用 `curl` 命令。

首先，输入以下命令检查是否打印了指令信息：

```
curl http://localhost:5000
```

你应该看到说明消息：

```
To access this service send a POST request to this URI with the text you want analyzed in the body.
```

接下来，运行以下命令发送测试消息，查看情感分析：

```
curl http://localhost:5000 --header "Content-Type: application/json" --data "I love applesauce!"
```

你从服务器获得的响应应类似于以下内容：

```
[{"compound": 0.6696, "neg": 0.0, "neu": 0.182, "pos": 0.818}]
```

恭喜！你现在已经实现了一个 RESTful HTTP 情感分析服务。你可以在 [GitHub 上找到此服务的参考实现和本文中的所有代码][10]。

### 继续探索

现在你已经了解了自然语言处理和情感分析背后的原理和机制，下面是进一步发现探索该主题的一些方法。

#### 在 OpenShift 上创建流式情感分析器

虽然创建本地应用程序来研究情绪分析很方便，但是接下来需要能够部署应用程序以实现更广泛的用途。按照[Radnaalytics.io][11] 提供的指导和代码进行操作，你将学习如何创建一个情感分析仪，可以容器化并部署到 Kubernetes 平台。你还将了解如何将 Apache Kafka 用作事件驱动消息传递的框架，以及如何将 Apache Spark 用作情绪分析的分布式计算平台。

#### 使用 Twitter API 发现实时数据

虽然 [Radanalytics.io][12] 实验室可以生成合成推文流，但你可以不受限于合成数据。事实上，拥有 Twitter 账户的任何人都可以使用 [Tweepy Python][13] 包访问 Twitter 流媒体 API 对推文进行情感分析。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/social-media-sentiment-analysis-python-scalable

作者：[Michael McCune][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/elmiko/users/jschlessman
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/windows_building_sky_scale.jpg?itok=mH6CAX29 (Tall building with windows)
[2]: https://linux.cn/article-10852-1.html
[3]: https://virtualenv.pypa.io/en/stable/
[4]: https://pypi.org/project/spacy/
[5]: https://pypi.org/project/vaderSentiment/
[6]: https://spacy.io/models
[7]: https://docs.python.org/3.6/tutorial/interpreter.html
[8]: https://en.wikipedia.org/wiki/Representational_state_transfer
[9]: http://flask.pocoo.org/
[10]: https://github.com/elmiko/social-moments-service
[11]: https://github.com/radanalyticsio/streaming-lab
[12]: http://Radanalytics.io
[13]: https://github.com/tweepy/tweepy
