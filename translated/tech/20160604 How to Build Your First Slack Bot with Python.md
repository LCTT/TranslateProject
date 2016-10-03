# 如何运用Python建立你的第一个Slack Bot？

[Bots](https://www.fullstackpython.com/bots.html) 是一种像 [Slack](https://slack.com/) 一样实用的互动聊天服务方式. 如果你之前从来没有建立过bot, 这篇文章提供了一个简单的用Python建立你第一个bot的关于 [Slack API](https://api.slack.com/) 集合的入门教程.

我们通过设置你的开发环境, 获得一个Slack API bot标记和我们用Pyhon编码的简单bot.

### 我们所需的工具

我们的bot, 我们将它称作为 "StarterBot", 它需要 Python 和 the Slack API. 然后运行我们需要的Python代码:

*   [Python 2 或者 Python 3](https://www.fullstackpython.com/python-2-or-3.html)
*   [pip](https://pip.pypa.io/en/stable/) 和 [virtualenv](https://virtualenv.pypa.io/en/stable/) 处理 Python [应用程序依赖关系](https://www.fullstackpython.com/application-dependencies.html)
*   一个你可以拥有API访问和注册Slack Developer Hangout team](http://dev4slack.xoxco.com/)的[免费Slack账号](https://slack.com/)
*   通过Slack团队建立的官方Python [Slack客户端](https://github.com/slackhq/python-slackclient)代码库
*   [Slack API 测试标志](https://api.slack.com/tokens)

这也是一个方便你建立本教程的有用[Slack API 文档](https://api.slack.com/)

对于本教程，所有的代码都是在[slack-starterbot](https://github.com/mattmakai/slack-starterbot)公共库里通过MIT许可证的可获得的开放源码.

### 搭建我们的环境

我们现在已经知道我们的项目需要什么样的工具，因此我们要获得我们所建立的开发环境。首先到终端上（或者用Windows上的命令提示符）并且改变你想要存储这个项目的目录。在那个目录里，创建一个新的virtualenv以便从其他的Python项目来隔离我们的应用程序依赖关系。

```
virtualenv starterbot

```

Activate the virtualenv 激活virtualenv:

```
source starterbot/bin/activate

```

你的提示现在应该看起来像在一个这样的截图里。

![Command prompt with starterbot's virtualenv activated 已经激活的starterbot's virtualenv的命令提示:](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/virtualenv-activate.png)


这个官方的slackclient API帮助库是通过Slack可以发送和接收消息的Slack通道所建立的。安装slackclient库是通过这个pip命令:

```
pip install slackclient

```

当pip命令完成时，你应该看到这样的输出和你将返回的提示.

![Output from using the pip install slackclient command with a virtualenv activated 在已经激活的virtualenv输出用pip安装slackclient的命令.](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/pip-install-slackclient.png)

我们也需要从Slack项目获得一个访问提示，因此我们的bot可以用它来连接这个Slack API.

### Slack实时消息传递（RTM）API

Slack同意程序通过一个 [网络应用程序API](https://www.fullstackpython.com/application-programming-interfaces.html)访问他们的消息传递通道. 去这个[Slack网络应用程序API页面](https://api.slack.com/)  并且注册建立你自己的Slack项目.你也可以通过一个你拥有管理权限的有效账号登陆.

![Use the sign in button on the top right corner of the Slack API page 在网络应用程序API页面的右上角使用登陆按钮.](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/sign-in-slack.png)

然后你可以到[Bot用户页面](https://api.slack.com/bot-users)登陆.

![Custom bot users webpage 定制bot用户网页.](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/custom-bot-users.png)

给你的bot起名为 "starterbot" 然后点击 “Add bot integration” 按钮.

![Add a bot integration named starterbot 添加一个bot integration并起名为“starterbot”.](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/starterbot.jpg)

这个页面将重新加载，你将看到一个新生成的访问令牌。你还可以将标志改成自定义设计。例如我给的这个“Full Stack Python”标志.

![Copy and paste the access token for your new Slack bot为你的新Slack bot复制和粘贴访问提示.](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/slack-token.png)

在页面底部点击 "Save Integration"按钮. 你的 bot 现在已经准备好连接Slack's API.

Python开发人员的一个常见的做法是输出秘密令牌提示作为环境变量。输出的Slack令牌名字为“SLACK_BOT_TOKEN”.:

```
export SLACK_BOT_TOKEN='your slack token pasted here'

```

好了，我们现在将被作为bot授权使用这个Slack API .

这个是一个更多的我们需要建立我们的bot的信息: 我们的bot的ID. 接下来我们将会写一个简短的脚本来从这个Slack API获得ID.

### 获得我们Bot的ID

这是最后一次写的一些Python代码! 我们将会在编译一个简短的Python脚本来获得StarterBot的ID时获得热身. 这个ID基于Slack项目而改变.

我们需要ID，因为当消息被解析为从Slcak RTM在StarterBot上指导的，他会允许我们的应用程序作出终止.我们的脚本也会测试我们SLACK_BOT_TOKEN环境变量是否设置正确.

建立一个新文件并命名为print_bot_id.py 并且填写下面的代码.

```
import os调用外部程序
from slackclient import SlackClient从slackclient调用SlackClient

BOT_NAME = 'starterbot'

slack_client = SlackClient(os.environ.get('SLACK_BOT_TOKEN'))

if __name__ == "__main__":
    api_call = slack_client.api_call("users.list")
    if api_call.get('ok'):
        # retrieve all users so we can find our bot检索所有的用户以便我们可以找到我们的bot
        users = api_call.get('members')
        for user in users:
            if 'name' in user and user.get('name') == BOT_NAME:
                print("Bot ID for '" + user['name'] + "' is " + user.get('id'))
    else:
        print("could not find bot user with the name " + BOT_NAME)

```

当我们设置为一个环境变量时，我们的代码调用于SlackClient并且为我们的SLACK_BOT_TOKEN而将它实例化. 当脚本通过pyhon命令执行时，我们通过会访问Slack API列出所有的Slack用户并且获得匹配一个名字为"satrterbot"的ID.

我们仅仅需要运行一次脚本来获得我们bot的ID.

```
python print_bot_id.py

```

当它运行为我们提供我们bot的ID时，脚本会打印出简单的一行输出.

![在你的Slack项目中用Python脚本打印Slack bot的ID.](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/printed-bot-id.png)

复制脚本打印出的唯一ID.并将ID作为一个环境变量命名为BOT_ID输出.

```
(starterbot)$ export BOT_ID='bot id returned by script'

```

这个脚本仅仅需要运行一次来获得bot的ID. 我们现在可以使用这个ID在我们的Python应用程序中来运行StarterBot.

### 编码我们的StarterBot

我们通过我们拥有的一切来写我们需要书写的StarterBot代码. 创建一个新文件命名为starterbot.py ，它包括以下代码.

```
import os
import time
from slackclient import SlackClient

```

操作系统和SlackClient调用将会看起来很熟悉，因为我们会使用它们在theprint_bot_id.py中.

在我们的依赖关系调用中，我们可以使用它们获得环境变量值并且在Slack client中将它们实例化.

```
# starterbot's ID as an environment variable starterbot的ID作为一个环境变量
BOT_ID = os.environ.get("BOT_ID")

# constants 常量
AT_BOT = "<@" + BOT_ID + ">:"
EXAMPLE_COMMAND = "do"

# instantiate Slack & Twilio clients 实例化Slack和Twilio clients
slack_client = SlackClient(os.environ.get('SLACK_BOT_TOKEN'))

```

代码在我们的SLACK_BOT_TOKEN中将SlackClient client实例化并且作为一个环境变量输出.

```
if __name__ == "__main__":
    READ_WEBSOCKET_DELAY = 1 # 1 second delay between reading from firehose 从firehose阅读间延迟1秒
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

Slack client连接到Slack RTM API WebSocket（Slack RTM API 双向通信），然后当解析信息来自firehose时会不断循环.如果任何这些消息都指向StarterBot，那么一个被称作handle_command的函数会决定做什么.

接下来添加两个函数来解析Slack输出和handle commands.

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
                # return text after the @ mention, whitespace removed 在@之后提到返回文本，空格删除
                return output['text'].split(AT_BOT)[1].strip().lower(), \
                       output['channel']
    return None, None

```

parse_slack_output函数从Slack接受信息并且如果他们指向我们的StarterBot时会作出判断.消息通过给我们bot的ID一个直接命令启动，然后交由我们的代码处理.-目前只是通过SLack管道发布一个消息回去告诉用户去多写一些Python代码!

这是整个程序看上去应该如何组合在一起 (你也可以 [在GitHub中查看文件](https://github.com/mattmakai/slack-starterbot/blob/master/starterbot.py)):

```
import os
import time
from slackclient import SlackClient

# 把 starterbot 的 ID作为一个环境变量
BOT_ID = os.environ.get("BOT_ID")

# constants 常量
AT_BOT = "<@" + BOT_ID + ">:"
EXAMPLE_COMMAND = "do"

# 实例化Slack和Twilio clients
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
                # 在@之后提到返回文本，空格删除
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

现在这是我们在这里所有的在命令行上通过python starterbot.py可以启动我们StarterBot的代码.

![当StarterBot开始运行而且连接到API的输出通道.](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/starterbot-running.png)

在 Slack 中创建新管道并且把 StarterBot 添加进来，或者直接把 StarterBot 添加进一个已经存在的管道。

![在Slack界面创建一个新通道并且请求StarterBot.](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/create-channel.png)

现在在管道中启动 StarterBot。

![在你的Slack通道里给的StarterBot命令.](https://www.fullstackpython.com/source/static/img/160604-simple-python-slack-bot/working-starterbot.png)

当你从bot得到的响应中遇见问题时，这是你一种可能你想去做的修改.正如上面所写的这个教程，其中一行AT_BOT = "<@" + BOT_ID + ">:"，在"@starter"后需要一个冒号（或者任何你自己所命名的特定bot）.移除这些：从AT_BOT结束后的字符串.Slack clients似乎需要在@一个人名后加一个冒号，但这好像是有些不协调的.

### 结束

好吧，你现在已经获得一个简易的你可以在代码中很多地方加入你想创建任何特性的StarterBot.

这里有很多你可以使用的Slack RTM API 和 Python.看看通过这些文章你还可以学习到什么:

*   附加一个持久的[relational database 关系数据库](https://www.fullstackpython.com/databases.html) 或者 [NoSQL back-end](https://www.fullstackpython.com/no-sql-datastore.html) 比如 [PostgreSQL](https://www.fullstackpython.com/postgresql.html),[MySQL](https://www.fullstackpython.com/mysql.html) 或者 [SQLite](https://www.fullstackpython.com/sqlite.html) 用来保存和检索用户数据
*  添加另外一个与bot互动的通道 [via SMS](https://www.twilio.com/blog/2016/05/build-sms-slack-bot-python.html) 或者 [phone calls](https://www.twilio.com/blog/2016/05/add-phone-calling-slack-python.html)
*   [Integrate other web APIs](https://www.fullstackpython.com/api-integration.html) 比如 [GitHub](https://developer.github.com/v3/), [Twilio](https://www.twilio.com/docs) 或者 [api.ai](https://docs.api.ai/)

有问题? 通过Twitter联系我 [@fullstackpython](https://twitter.com/fullstackpython) or [@mattmakai](https://twitter.com/mattmakai). 这是我在GitHub上的用户名 [mattmakai](https://github.com/mattmakai).

这篇文章还有问题? Fork [this page's source on GitHub 这是在GitHub上的页面源](https://github.com/mattmakai/fullstackpython.com/blob/gh-pages/source/content/posts/160604-build-first-slack-bot-python.markdown).

--------------------------------------------------------------------------------
via: https://www.fullstackpython.com/blog/build-first-slack-bot-python.html

作者： [Matt Makai][a] 
译者：[jiajia9llinuxer](https://github.com/jiajia9linuxer)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出aa

[a]: https://www.fullstackpython.com/about-author.html
