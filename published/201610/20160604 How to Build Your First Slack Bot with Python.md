如何运用 Python 建立你的第一个 Slack 聊天机器人？
============

[聊天机器人（Bot）](https://www.fullstackpython.com/bots.html) 是一种像 [Slack](https://slack.com/) 一样的实用的互动聊天服务方式。如果你之前从来没有建立过聊天机器人，那么这篇文章提供了一个简单的入门指南，告诉你如何用 Python 结合 [Slack API](https://api.slack.com/) 建立你第一个聊天机器人。

我们通过搭建你的开发环境, 获得一个 Slack API 的聊天机器人令牌，并用 Pyhon 开发一个简单聊天机器人。

### 我们所需的工具

我们的聊天机器人我们将它称作为“StarterBot”，它需要 Python 和 Slack API。要运行我们的 Python 代码，我们需要：

* [Python 2 或者 Python 3](https://www.fullstackpython.com/python-2-or-3.html)
* [pip](https://pip.pypa.io/en/stable/) 和 [virtualenv](https://virtualenv.pypa.io/en/stable/) 来处理 Python [应用程序依赖关系](https://www.fullstackpython.com/application-dependencies.html)
* 一个可以访问 API 的[免费 Slack 账号](https://slack.com/)，或者你可以注册一个 [Slack Developer Hangout team](http://dev4slack.xoxco.com/)。
* 通过 Slack 团队建立的官方 Python [Slack 客户端](https://github.com/slackhq/python-slackclient)代码库
* [Slack API 测试令牌](https://api.slack.com/tokens)

当你在本教程中进行构建时，[Slack API 文档](https://api.slack.com/) 是很有用的。

本教程中所有的代码都放在 [slack-starterbot](https://github.com/mattmakai/slack-starterbot) 公共库里，并以 MIT 许可证开源。

### 搭建我们的环境

我们现在已经知道我们的项目需要什么样的工具，因此让我们来搭建我们所的开发环境吧。首先到终端上（或者  Windows 上的命令提示符）并且切换到你想要存储这个项目的目录。在那个目录里，创建一个新的 virtualenv 以便和其他的 Python 项目相隔离我们的应用程序依赖关系。

```
virtualenv starterbot

```

激活 virtualenv：

```
source starterbot/bin/activate

```

你的提示符现在应该看起来如截图：

![已经激活的 starterbot 的 virtualenv的命令提示符](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/virtualenv-activate.png)

这个官方的 slack 客户端 API 帮助库是由 Slack 建立的，它可以通过 Slack 通道发送和接收消息。通过这个 `pip` 命令安装 slackclient 库：

```
pip install slackclient

```

当 `pip` 命令完成时，你应该看到类似这样的输出，并返回提示符。

![在已经激活的 virtualenv 用 pip 安装 slackclient 的输出](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/pip-install-slackclient.png)

我们也需要为我们的 Slack 项目获得一个访问令牌，以便我们的聊天机器人可以用它来连接到 Slack API。

### Slack 实时消息传递（RTM）API

Slack 允许程序通过一个 [Web API](https://www.fullstackpython.com/application-programming-interfaces.html) 来访问他们的消息传递通道。去这个 [Slack Web API 页面](https://api.slack.com/)  注册建立你自己的 Slack 项目。你也可以登录一个你拥有管理权限的已有账号。

![使用 Web API页面的右上角登录按钮](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/sign-in-slack.png)

登录后你会到达 [聊天机器人用户页面](https://api.slack.com/bot-users)。

![定制聊天机器人用户页面](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/custom-bot-users.png)

给你的聊天机器人起名为“starterbot”然后点击 “Add bot integration” 按钮。

![添加一个bot integration 并起名为“starterbot”](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/starterbot.jpg)

这个页面将重新加载，你将看到一个新生成的访问令牌。你还可以将标志改成你自己设计的。例如我给的这个“Full Stack Python”标志。

![为你的新 Slack 聊天机器人复制和粘贴访问令牌](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/slack-token.png)

在页面底部点击“Save Integration”按钮。你的聊天机器人现在已经准备好连接 Slack API。

Python 开发人员的一个常见的做法是以环境变量输出秘密令牌。输出的 Slack 令牌名字为`SLACK_BOT_TOKEN`：

```
export SLACK_BOT_TOKEN='你的 slack 令牌粘帖在这里'

```

好了，我们现在得到了将这个 Slack API 用作聊天机器人的授权。

我们建立聊天机器人还需要更多信息：我们的聊天机器人的 ID。接下来我们将会写一个简短的脚本，从 Slack API 获得该 ID。

### 获得我们聊天机器人的 ID

这是最后写一些 Python 代码的时候了! 我们编写一个简短的 Python 脚本获得 StarterBot 的 ID 来热身一下。这个 ID 基于 Slack 项目而不同。

我们需要该 ID，当解析从 Slack RTM 上发给 StarterBot 的消息时，它用于对我们的应用验明正身。我们的脚本也会测试我们 `SLACK_BOT_TOKEN` 环境变量是否设置正确。

建立一个命名为 print_bot_id.py 的新文件，并且填入下面的代码：

```
import os
from slackclient import SlackClient


BOT_NAME = 'starterbot'

slack_client = SlackClient(os.environ.get('SLACK_BOT_TOKEN'))


if __name__ == "__main__":
    api_call = slack_client.api_call("users.list")
    if api_call.get('ok'):
        # retrieve all users so we can find our bot
        users = api_call.get('members')
        for user in users:
            if 'name' in user and user.get('name') == BOT_NAME:
                print("Bot ID for '" + user['name'] + "' is " + user.get('id'))
    else:
        print("could not find bot user with the name " + BOT_NAME)

```

我们的代码导入 SlackClient，并用我们设置的环境变量 `SLACK_BOT_TOKEN` 实例化它。 当该脚本通过 python 命令执行时，我们通过会访问 Slack API 列出所有的 Slack 用户并且获得匹配一个名字为“satrterbot”的 ID。

这个获得聊天机器人的 ID 的脚本我们仅需要运行一次。

```
python print_bot_id.py

```

当它运行为我们提供了聊天机器人的 ID 时，脚本会打印出简单的一行输出。

![在你的 Slack 项目中用 Python 脚本打印 Slack 聊天机器人的 ID](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/printed-bot-id.png)

复制这个脚本打印出的唯一 ID。并将该 ID 作为一个环境变量 `BOT_ID` 输出。

```
(starterbot)$ export BOT_ID='bot id returned by script'

```

这个脚本仅仅需要运行一次来获得聊天机器人的 ID。 我们现在可以在我们的运行 StarterBot 的 Python应用程序中使用这个 ID 。

### 编码我们的 StarterBot

现在我们拥有了写我们的 StarterBot 代码所需的一切。 创建一个新文件命名为 starterbot.py ，它包括以下代码。

```
import os
import time
from slackclient import SlackClient

```

对 `os` 和 `SlackClient` 的导入我们看起来很熟悉，因为我们已经在 theprint_bot_id.py 中用过它们了。

通过我们导入的依赖包，我们可以使用它们获得环境变量值，并实例化 Slack 客户端。

```
# starterbot 的 ID 作为一个环境变量
BOT_ID = os.environ.get("BOT_ID")

# 常量
AT_BOT = "<@" + BOT_ID + ">:"
EXAMPLE_COMMAND = "do"

# 实例化 Slack 和 Twilio 客户端
slack_client = SlackClient(os.environ.get('SLACK_BOT_TOKEN'))

```

该代码通过我们以输出的环境变量 `SLACK_BOT_TOKEN 实例化 `SlackClient` 客户端。

```
if __name__ == "__main__":
    READ_WEBSOCKET_DELAY = 1 # 1 从 firehose 读取延迟 1 秒
    if slack_client.rtm_connect():
        print("StarterBot connected and running!")
        while True:
            command, channel = parse_slack_output(slack_client.rtm_read())
            if command and channel:
                handle_command(command, channel)
            time.sleep(READ_WEBSOCKET_DELAY)
    else:
        print("Connection failed. Invalid Slack token or bot ID?")

```

Slack 客户端会连接到 Slack RTM API WebSocket，然后当解析来自 firehose 的消息时会不断循环。如果有任何发给 StarterBot 的消息，那么一个被称作 `handle_command` 的函数会决定做什么。

接下来添加两个函数来解析 Slack 的输出并处理命令。

```
def handle_command(command, channel):
    """
        Receives commands directed at the bot and determines if they
        are valid commands. If so, then acts on the commands. If not,
        returns back what it needs for clarification.
    """
    response = "Not sure what you mean. Use the *" + EXAMPLE_COMMAND + \
               "* command with numbers, delimited by spaces."
    if command.startswith(EXAMPLE_COMMAND):
        response = "Sure...write some more code then I can do that!"
    slack_client.api_call("chat.postMessage", channel=channel,
                          text=response, as_user=True)

def parse_slack_output(slack_rtm_output):
    """
        The Slack Real Time Messaging API is an events firehose.
        this parsing function returns None unless a message is
        directed at the Bot, based on its ID.
    """
    output_list = slack_rtm_output
    if output_list and len(output_list) > 0:
        for output in output_list:
            if output and 'text' in output and AT_BOT in output['text']:
                # 返回 @ 之后的文本，删除空格
                return output['text'].split(AT_BOT)[1].strip().lower(), \
                       output['channel']
    return None, None

```

`parse_slack_output` 函数从 Slack 接受信息，并且如果它们是发给我们的 StarterBot 时会作出判断。消息以一个给我们的聊天机器人 ID 的直接命令开始，然后交由我们的代码处理。目前只是通过 Slack 管道发布一个消息回去告诉用户去多写一些 Python 代码!

这是整个程序组合在一起的样子 (你也可以 [在 GitHub 中查看该文件](https://github.com/mattmakai/slack-starterbot/blob/master/starterbot.py)）：

```
import os
import time
from slackclient import SlackClient

# starterbot 的 ID 作为一个环境变量
BOT_ID = os.environ.get("BOT_ID")

# 常量
AT_BOT = "<@" + BOT_ID + ">:"
EXAMPLE_COMMAND = "do"

# 实例化 Slack 和 Twilio 客户端
slack_client = SlackClient(os.environ.get('SLACK_BOT_TOKEN'))

def handle_command(command, channel):
    """
        Receives commands directed at the bot and determines if they
        are valid commands. If so, then acts on the commands. If not,
        returns back what it needs for clarification.
    """
    response = "Not sure what you mean. Use the *" + EXAMPLE_COMMAND + \
               "* command with numbers, delimited by spaces."
    if command.startswith(EXAMPLE_COMMAND):
        response = "Sure...write some more code then I can do that!"
    slack_client.api_call("chat.postMessage", channel=channel,
                          text=response, as_user=True)

def parse_slack_output(slack_rtm_output):
    """
        The Slack Real Time Messaging API is an events firehose.
        this parsing function returns None unless a message is
        directed at the Bot, based on its ID.
    """
    output_list = slack_rtm_output
    if output_list and len(output_list) > 0:
        for output in output_list:
            if output and 'text' in output and AT_BOT in output['text']:
                # 返回 @ 之后的文本，删除空格
                return output['text'].split(AT_BOT)[1].strip().lower(), \
                       output['channel']
    return None, None

if __name__ == "__main__":
    READ_WEBSOCKET_DELAY = 1 # 1 second delay between reading from firehose
    if slack_client.rtm_connect():
        print("StarterBot connected and running!")
        while True:
            command, channel = parse_slack_output(slack_client.rtm_read())
            if command and channel:
                handle_command(command, channel)
            time.sleep(READ_WEBSOCKET_DELAY)
    else:
        print("Connection failed. Invalid Slack token or bot ID?")

```

现在我们的代码已经有了，我们可以通过 `python starterbot.py` 来运行我们 StarterBot 的代码了。

![当 StarterBot 开始运行而且连接到 API 的输出通道](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/starterbot-running.png)

在 Slack 中创建新通道，并且把 StarterBot 邀请进来，或者把 StarterBot 邀请进一个已经存在的通道中。

![在 Slack 界面创建一个新通道并且邀请 StarterBot](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/create-channel.png)

现在在你的通道中给 StarterBot 发命令。

![在你的 Slack 通道里给你的 StarterBot 发命令](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/working-starterbot.png)

如果你从聊天机器人得到的响应中遇见问题，你可能需要做一个修改。正如上面所写的这个教程，其中一行 `AT_BOT = "<@" + BOT_ID + ">:"`，在“@starter”（你给你自己的聊天机器人起的名字）后需要一个冒号。从`AT_BOT` 字符串后面移除`:`。Slack 似乎需要在 `@` 一个人名后加一个冒号，但这好像是有些不协调的。

### 结束

好吧，你现在已经获得一个简易的聊天机器人，你可以在代码中很多地方加入你想要创建的任何特性。

我们能够使用 Slack RTM API 和 Python 完成很多功能。看看通过这些文章你还可以学习到什么：

* 附加一个持久的[关系数据库](https://www.fullstackpython.com/databases.html) 或者 [NoSQL 后端](https://www.fullstackpython.com/no-sql-datastore.html) 比如 [PostgreSQL](https://www.fullstackpython.com/postgresql.html)、[MySQL](https://www.fullstackpython.com/mysql.html) 或者 [SQLite](https://www.fullstackpython.com/sqlite.html) ，来保存和检索用户数据
* 添加另外一个与聊天机器人互动的通道，比如 [短信](https://www.twilio.com/blog/2016/05/build-sms-slack-bot-python.html) 或者[电话呼叫](https://www.twilio.com/blog/2016/05/add-phone-calling-slack-python.html)
* [集成其它的 web API](https://www.fullstackpython.com/api-integration.html)，比如 [GitHub](https://developer.github.com/v3/)、[Twilio](https://www.twilio.com/docs) 或者 [api.ai](https://docs.api.ai/)

有问题? 通过 Twitter 联系我 [@fullstackpython](https://twitter.com/fullstackpython) 或 [@mattmakai](https://twitter.com/mattmakai)。 我在 GitHub 上的用户名是 [mattmakai](https://github.com/mattmakai)。

这篇文章感兴趣? Fork 这个 [GitHub 上的页面](https://github.com/mattmakai/fullstackpython.com/blob/gh-pages/source/content/posts/160604-build-first-slack-bot-python.markdown)吧。

--------------------------------------------------------------------------------
via: https://www.fullstackpython.com/blog/build-first-slack-bot-python.html

作者：[Matt Makai][a] 
译者：[jiajia9llinuxer](https://github.com/jiajia9linuxer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出aa

[a]: https://www.fullstackpython.com/about-author.html
