Python 的 ChatOps 库：Opsdroid 和 Errbot
======

> 学习一下 Python 世界里最广泛使用的 ChatOps 库：每个都能做什么，如何使用。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd)

ChatOps 是基于会话导向而进行的开发。其思路是你可以编写能够对聊天窗口中的某些输入进行回复的可执行代码。作为一个开发者，你能够用 ChatOps 从 Slack 合并拉取请求，自动从收到的 Facebook 消息中给某人分配支持工单，或者通过 IRC 检查开发状态。

在 Python 世界，最为广泛使用的 ChatOps 库是 Opsdroid 和 Errbot。在这个月的 Python 专栏，让我们一起聊聊使用它们是怎样的体验，它们各自适用于什么方面以及如何着手使用它们。

### Opsdroid

[Opsdroid][2] 是一个相对年轻的（始于 2016）Python 开源聊天机器人库。它有着良好的开发文档，不错的教程，并且包含能够帮助你对接流行的聊天服务的插件。

#### 它内置了什么

库本身并没有自带所有你需要上手的东西，但这是故意的。轻量级的框架鼓励你去运用它现有的连接器（Opsdroid 所谓的帮你接入聊天服务的插件）或者去编写你自己的，但是它并不会因自带你所不需要的连接器而自贬身价。你可以轻松使用现有的 Opsdroid 连接器来接入：

+ 命令行
+ Cisco Spark
+ Facebook
+ GitHub
+ Matrix
+ Slack
+ Telegram
+ Twitter
+ Websocket

Opsdroid 会调用使聊天机器人能够展现它们的“技能”的函数。这些技能其实是异步 Python 函数，并使用 Opsdroid 叫做“匹配器”的匹配装饰器。你可以设置你的 Opsdroid 项目，来使用同样从你设置文件所在的代码中的“技能”。你也可以从外面的公共或私人仓库调用这些“技能”。

你同样可以启用一些现存的 Opsdroid “技能”，包括 [seen][3] —— 它会告诉你聊天机器人上次是什么时候看到某个用户的，以及 [weather][4] —— 会将天气报告给用户。

最后，Opdroid 允许你使用现存的数据库模块设置数据库。现在 Opdroid 支持的数据库包括：

+ Mongo
+ Redis
+ SQLite

你可以在你的 Opdroid 项目中的 `configuration.yaml` 文件设置数据库、技能和连接器。

#### Opsdroid 的优势

**Docker 支持：**从一开始 Opsdroid 就打算在 Docker 中良好运行。在 Docker 中的指导是它 [安装文档][5] 中的一部分。使用 Opsdroid 和 Docker Compose 也很简单：将 Opsdroid 设置成一种服务，当你运行 `docker-compose up` 时，你的 Opsdroid 服务将会开启你的聊天机器人也将就绪。

```
version: "3"

services:
  opsdroid:
    container_name: opsdroid
    build:
      context: .
      dockerfile: Dockerfile
```

**丰富的连接器：** Opsdroid 支持九种像 Slack 和 Github 等从外部接入的服务连接器。你所要做的一切就是在你的设置文件中启用那些连接器，然后把必须的口令或者 API 密匙传过去。比如为了启用 Opsdroid 以在一个叫做 `#updates` 的 Slack 频道发帖，你需要将以下代码加入你设置文件的 `connectors` 部分：

```
 - name: slack
    api-token: "this-is-my-token"
    default-room: "#updates"
```

在设置 Opsdroid 以接入 Slack 之前你需要[添加一个机器人用户][6]。

如果你需要接入一个 Opsdroid 不支持的服务，在[文档][7]里有有添加你自己的连接器的教程。

**相当不错的文档：** 特别是对于一个在积极开发中的新兴库来说，Opsdroid 的文档十分有帮助。这些文档包括一篇带你创建几个不同的基本技能的[教程][8]。Opsdroid 在[技能][9]、[连接器][7]、[数据库][10]，以及[匹配器][11]方面的文档也十分清晰。

它所支持的技能和连接器的仓库为它的技能提供了富有帮助的示范代码。

**自然语言处理：** Opsdroid 的技能里面能使用正则表达式，但也同样提供了几个包括 [Dialogflow][12]，[luis.ai][13]，[Recast.AI][14] 以及 [wit.ai][15] 的 NLP API。

#### Opsdroid 可能的不足

Opsdroid 对它的一部分连接器还没有启用全部的特性。比如说，Slack API 允许你向你的消息添加颜色柱、图片以及其他的“附件”。Opsdroid Slack 连接器并没有启用“附件”特性，所以如果那些特性对你来说很重要的话，你需要编写一个自定义的 Slack 连接器。如果连接器缺少一个你需要的特性，Opsdroid 将欢迎你的[贡献][16]。文档中可以使用更多的例子，特别是对于预料到的使用场景。

#### 示例用法

```
from opsdroid.matchers import match_regex
import random


@match_regex(r'hi|hello|hey|hallo')
async def hello(opsdroid, config, message):
    text = random.choice(["Hi {}", "Hello {}", "Hey {}"]).format(message.user)
    await message.respond(text)
```

*hello/\_\_init\_\_.py*


```
connectors:
  - name: websocket

skills:
  - name: hello
    repo: "https://github.com/<user_id>/hello-skill"

```

*configuration.yaml*


### Errbot

[Errbot][17] 是一个功能齐全的开源聊天机器人。Errbot 发行于 2012 年，并且拥有人们从一个成熟的项目能期待的一切，包括良好的文档、优秀的教程以及许多帮你连入现有的流行聊天服务的插件。

#### 它内置了什么

不像采用了较轻量级方式的 Opsdroid，Errbot 自带了你需要可靠地创建一个自定义机器人的一切东西。

Errbot 包括了对于本地 XMPP、IRC、Slack、Hipchat 以及 Telegram 服务的支持。它通过社区支持的后端列出了另外十种服务。

#### Errbot 的优势

**良好的文档：** Errbot 的文档成熟易读。

**动态插件架构：** Errbot 允许你通过和聊天机器人交谈安全地安装、卸载、更新、启用以及禁用插件。这使得开发和添加特性十分简便。感谢 Errbot 的颗粒性授权系统，出于安全意识这所有的一切都可以被锁闭。

当某个人输入 `!help`，Errbot 使用你的插件的文档字符串来为可获取的命令生成文档，这使得了解每行命令的作用更加简便。

**内置的管理和安全特性：** Errbot 允许你限制拥有管理员权限的用户列表，甚至细粒度访问控制。比如说你可以限制特定用户或聊天房间访问特定命令。

**额外的插件框架：** Errbot 支持钩子、回调、子命令、webhook、轮询以及其它[更多特性][18]。如果那些还不够，你甚至可以编写[动态插件][19]。当你需要基于在远程服务器上的可用命令来启用对应的聊天命令时，这个特性十分有用。

**自带测试框架：** Errbot 支持 [pytest][20]，同时也自带一些能使你简便测试插件的有用功能。它的“[测试你的插件][21]”的文档出于深思熟虑，并提供了足够的资料让你上手。

#### Errbot 可能的不足

**以 “!” 开头：** 默认情况下，Errbot 命令发出时以一个惊叹号打头（`!help` 以及 `!hello`）。一些人可能会喜欢这样，但是另一些人可能认为这让人烦恼。谢天谢地，这很容易关掉。

**插件元数据** 首先，Errbot 的 [Hello World][22] 插件示例看上去易于使用。然而我无法加载我的插件，直到我进一步阅读了教程并发现我还需要一个 `.plug` 文档，这是一个 Errbot 用来加载插件的文档。这可能比较吹毛求疵了，但是在我深挖文档之前，这对我来说都不是显而易见的。

### 示例用法


```
import random
from errbot import BotPlugin, botcmd

class Hello(BotPlugin):

    @botcmd
    def hello(self, msg, args):
        text = random.choice(["Hi {}", "Hello {}", "Hey {}"]).format(message.user)
        return text
```

*hello.py*

```
[Core]
Name = Hello
Module = hello

[Python]
Version = 2+

[Documentation]
Description = Example "Hello" plugin
```

*hello.plug*


你用过 Errbot 或 Opsdroid 吗？如果用过请留下关于你对于这些工具印象的留言。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/python-chatops-libraries-opsdroid-and-errbot

作者：[Jeff Triplett][a], [Lacey Williams Henschel][1]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/laceynwilliams
[1]:https://opensource.com/users/laceynwilliams
[2]:https://opsdroid.github.io/
[3]:https://github.com/opsdroid/skill-seen
[4]:https://github.com/opsdroid/skill-weather
[5]:https://opsdroid.readthedocs.io/en/stable/#docker
[6]:https://api.slack.com/bot-users
[7]:https://opsdroid.readthedocs.io/en/stable/extending/connectors/
[8]:https://opsdroid.readthedocs.io/en/stable/tutorials/introduction/
[9]:https://opsdroid.readthedocs.io/en/stable/extending/skills/
[10]:https://opsdroid.readthedocs.io/en/stable/extending/databases/
[11]:https://opsdroid.readthedocs.io/en/stable/matchers/overview/
[12]:https://opsdroid.readthedocs.io/en/stable/matchers/dialogflow/
[13]:https://opsdroid.readthedocs.io/en/stable/matchers/luis.ai/
[14]:https://opsdroid.readthedocs.io/en/stable/matchers/recast.ai/
[15]:https://opsdroid.readthedocs.io/en/stable/matchers/wit.ai/
[16]:https://opsdroid.readthedocs.io/en/stable/contributing/
[17]:http://errbot.io/en/latest/
[18]:http://errbot.io/en/latest/features.html#extensive-plugin-framework
[19]:http://errbot.io/en/latest/user_guide/plugin_development/dynaplugs.html
[20]:http://pytest.org/
[21]:http://errbot.io/en/latest/user_guide/plugin_development/testing.html
[22]:http://errbot.io/en/latest/index.html#simple-to-build-upon
