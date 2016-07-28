如何用Python和Flask建立部署一个Facebook信使机器人教程
==========================================================================

这是我建立一个简单的Facebook信使机器人的记录。功能很简单，他是一个回显机器人，只是打印回用户写了什么。

回显服务器类似于服务器的“Hello World”例子。

这个项目的目的不是建立最好的信使机器人，而是获得建立一个小型机器人和每个事物是如何整合起来的感觉。

- [技术栈][1]
- [机器人架构][2]
- [机器人服务器][3]
- [部署到 Heroku][4]
- [创建 Facebook 应用][5]
- [结论][6]

### 技术栈

使用到的技术栈:

- [Heroku][7] 做后端主机。免费层足够这个等级的教程。回显机器人不需要任何种类的数据持久，所以不需要数据库。
- [Python][8] 是选择的一个语言。版本选择2.7，虽然它移植到 Pyhton 3 很容易，只需要很少的改动。
- [Flask][9] 作为网站开发框架。它是非常轻量的框架，用在小型工程或微服务是完美的。
- 最后 [Git][10] 版本控制系统用来维护代码和部署到 Heroku。
- 值得一提：[Virtualenv][11]。这个 python 工具是用来创建清洁的 python 库“环境”的，你只用安装必要的需求和最小化的应用封装。

### 机器人架构

信使机器人是由一个服务器组成，响应两种请求：

- GET 请求被用来认证。他们与你注册的 FB 认证码一同被信使发出。
- POST 请求被用来真实的通信。传统的工作流是，机器人将通过发送 POST 请求与用户发送的消息数据建立通信，我们将处理它，发送一个我们自己的 POST 请求回去。如果这一个完全成功（返回一个200 OK 状态）我们也响应一个200 OK 码给初始信使请求。
这个教程应用将托管到Heroku，他提供了一个很好并且简单的接口来部署应用。如前所述,免费层可以满足这个教程。

在应用已经部署并且运行后，我们将创建一个 Facebook 应用然后连接它到我们的应用，以便信使知道发送请求到哪，这就是我们的机器人。

### 机器人服务器

基本的服务器代码可以在Github用户 [hult(Magnus Hult)][13] 的 [Chatbot][12] 工程上获取，经过一些代码修改只回显消息和一些我遇到的错误更正。最终版本的服务器代码：

```
from flask import Flask, request
import json
import requests

app = Flask(__name__)

# 这需要填写被授予的页面通行令牌
# 通过 Facebook 应用创建令牌。
PAT = ''

@app.route('/', methods=['GET'])
def handle_verification():
  print "Handling Verification."
  if request.args.get('hub.verify_token', '') == 'my_voice_is_my_password_verify_me':
    print "Verification successful!"
    return request.args.get('hub.challenge', '')
  else:
    print "Verification failed!"
    return 'Error, wrong validation token'

@app.route('/', methods=['POST'])
def handle_messages():
  print "Handling Messages"
  payload = request.get_data()
  print payload
  for sender, message in messaging_events(payload):
    print "Incoming from %s: %s" % (sender, message)
    send_message(PAT, sender, message)
  return "ok"

def messaging_events(payload):
  """Generate tuples of (sender_id, message_text) from the
  provided payload.
  """
  data = json.loads(payload)
  messaging_events = data["entry"][0]["messaging"]
  for event in messaging_events:
    if "message" in event and "text" in event["message"]:
      yield event["sender"]["id"], event["message"]["text"].encode('unicode_escape')
    else:
      yield event["sender"]["id"], "I can't echo this"


def send_message(token, recipient, text):
  """Send the message text to recipient with id recipient.
  """

  r = requests.post("https://graph.facebook.com/v2.6/me/messages",
    params={"access_token": token},
    data=json.dumps({
      "recipient": {"id": recipient},
      "message": {"text": text.decode('unicode_escape')}
    }),
    headers={'Content-type': 'application/json'})
  if r.status_code != requests.codes.ok:
    print r.text

if __name__ == '__main__':
  app.run()
```

让我们分解代码。第一部分是引入所需：

```
from flask import Flask, request
import json
import requests
```

接下来我们定义两个函数（使用 Flask 特定的 app.route 装饰器），用来处理到我们的机器人的 GET 和 POST 请求。

```
@app.route('/', methods=['GET'])
def handle_verification():
  print "Handling Verification."
  if request.args.get('hub.verify_token', '') == 'my_voice_is_my_password_verify_me':
    print "Verification successful!"
    return request.args.get('hub.challenge', '')
  else:
    print "Verification failed!"
    return 'Error, wrong validation token'
```

当我们创建 Facebook 应用时声明由信使发送的 verify_token 对象。我们必须对自己进行认证。最后我们返回“hub.challenge”给信使。

处理 POST 请求的函数更有趣

```
@app.route('/', methods=['POST'])
def handle_messages():
  print "Handling Messages"
  payload = request.get_data()
  print payload
  for sender, message in messaging_events(payload):
    print "Incoming from %s: %s" % (sender, message)
    send_message(PAT, sender, message)
  return "ok"
```

当调用我们抓取的消息负载时，使用函数 messaging_events 来中断它并且提取发件人身份和真实发送消息，生成一个 python 迭代器循环遍历。请注意信使发送的每个请求有可能多于一个消息。

```
def messaging_events(payload):
  """Generate tuples of (sender_id, message_text) from the
  provided payload.
  """
  data = json.loads(payload)
  messaging_events = data["entry"][0]["messaging"]
  for event in messaging_events:
    if "message" in event and "text" in event["message"]:
      yield event["sender"]["id"], event["message"]["text"].encode('unicode_escape')
    else:
      yield event["sender"]["id"], "I can't echo this"
```

迭代完每个消息时我们调用send_message函数然后我们执行POST请求回给使用Facebook图形消息接口信使。在这期间我们一直没有回应我们阻塞的原始信使请求。这会导致超时和5XX错误。

上述的发现错误是中断期间我偶然发现的，当用户发送表情时其实的是当成了 unicode 标识，无论如何 Python 发生了误编码。我们以发送回垃圾结束。

这个 POST 请求回到信使将不会结束，这会导致发生5xx状态返回给原始的请求，显示服务不可用。

通过使用`encode('unicode_escape')`转义消息然后在我们发送回消息前用`decode('unicode_escape')`解码消息就可以解决。

```
def send_message(token, recipient, text):
  """Send the message text to recipient with id recipient.
  """

  r = requests.post("https://graph.facebook.com/v2.6/me/messages",
    params={"access_token": token},
    data=json.dumps({
      "recipient": {"id": recipient},
      "message": {"text": text.decode('unicode_escape')}
    }),
    headers={'Content-type': 'application/json'})
  if r.status_code != requests.codes.ok:
    print r.text
```

### 部署到 Heroku

一旦代码已经建立成我想要的样子时就可以进行下一步。部署应用。

当然，但是怎么做？

我之前已经部署了应用到 Heroku （主要是 Rails）然而我总是遵循某种教程，所以配置已经创建。在这种情况下，尽管我必须从头开始。

幸运的是有官方[Heroku文档][14]来帮忙。这篇文章很好地说明了运行应用程序所需的最低限度。

长话短说，我们需要的除了我们的代码还有两个文件。第一个文件是“requirements.txt”他列出了运行应用所依赖的库。

需要的第二个文件是“Procfile”。这个文件通知 Heroku 如何运行我们的服务。此外这个文件最低限度如下：

>web: gunicorn echoserver:app 

heroku解读他的方式是我们的应用通过运行 echoserver.py 开始并且应用将使用 gunicorn 作为网站服务器。我们使用一个额外的网站服务器是因为与性能相关并在上面的Heroku文档里解释了：

>Web 应用程序并发处理传入的HTTP请求比一次只处理一个请求的Web应用程序，更有效利地用动态资源。由于这个原因，我们建议使用支持并发请求的 web 服务器处理开发和生产运行的服务。

>Django 和 Flask web 框架特性方便内建 web 服务器，但是这些阻塞式服务器一个时刻只处理一个请求。如果你部署这种服务到 Heroku上，你的动态资源不会充分使用并且你的应用会感觉迟钝。

>Gunicorn 是一个纯 Python HTTP 的 WSGI 引用服务器。允许你在单独一个动态资源内通过并发运行多 Python 进程的方式运行任一 Python 应用。它提供了一个完美性能，弹性，简单配置的平衡。

回到我们提到的“requirements.txt”文件，让我们看看它如何结合 Virtualenv 工具。

在任何时候，你的开发机器也许有若干已安装的 python 库。当部署应用时你不想这些库被加载因为很难辨认出你实际使用哪些库。

Virtualenv 创建一个新的空白虚拟环境，因此你可以只安装你应用需要的库。

你可以检查当前安装使用哪些库的命令如下：

```
kostis@KostisMBP ~ $ pip freeze
cycler==0.10.0
Flask==0.10.1
gunicorn==19.6.0
itsdangerous==0.24
Jinja2==2.8
MarkupSafe==0.23
matplotlib==1.5.1
numpy==1.10.4
pyparsing==2.1.0
python-dateutil==2.5.0
pytz==2015.7
requests==2.10.0
scipy==0.17.0
six==1.10.0
virtualenv==15.0.1
Werkzeug==0.11.10
```

注意：pip 工具应该已经与 Python 一起安装在你的机器上。

如果没有，查看[官方网站][15]如何安装他。

现在让我们使用 Virtualenv 来创建一个新的空白环境。首先我们给我们的工程创建一个新文件夹，然后进到目录下：

```
kostis@KostisMBP projects $ mkdir echoserver
kostis@KostisMBP projects $ cd echoserver/
kostis@KostisMBP echoserver $
```

现在来创建一个叫做 echobot 新的环境。运行下面的 source 命令激活它，然后使用 pip freeze 检查，我们能看到现在是空的。

```
kostis@KostisMBP echoserver $ virtualenv echobot
kostis@KostisMBP echoserver $ source echobot/bin/activate
(echobot) kostis@KostisMBP echoserver $ pip freeze
(echobot) kostis@KostisMBP echoserver $
```

我们可以安装需要的库。我们需要是 flask，gunicorn，和 requests，他们被安装完我们就创建 requirements.txt 文件：

```
(echobot) kostis@KostisMBP echoserver $ pip install flask
(echobot) kostis@KostisMBP echoserver $ pip install gunicorn
(echobot) kostis@KostisMBP echoserver $ pip install requests
(echobot) kostis@KostisMBP echoserver $ pip freeze
click==6.6
Flask==0.11
gunicorn==19.6.0
itsdangerous==0.24
Jinja2==2.8
MarkupSafe==0.23
requests==2.10.0
Werkzeug==0.11.10
(echobot) kostis@KostisMBP echoserver $ pip freeze > requirements.txt
```

毕竟上文已经被运行，我们用 python 代码创建 echoserver.py 文件然后用之前提到的命令创建 Procfile，我们应该以下面的文件/文件夹结束：

```
(echobot) kostis@KostisMBP echoserver $ ls
Procfile     echobot     echoserver.py   requirements.txt
```

我们现在准备上传到 Heroku。我们需要做两件事。第一是安装 Heroku toolbet 如果你还没安装到你的系统中（详细看[Heroku][16]）。第二通过[网页接口][17]创建一个新的 Heroku 应用。

点击右上的大加号然后选择“Create new app”。








--------------------------------------------------------------------------------

via: http://tsaprailis.com/2016/06/02/How-to-build-and-deploy-a-Facebook-Messenger-bot-with-Python-and-Flask-a-tutorial/

作者：[Konstantinos Tsaprailis][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://github.com/kostistsaprailis
[1]: http://tsaprailis.com/2016/06/02/How-to-build-and-deploy-a-Facebook-Messenger-bot-with-Python-and-Flask-a-tutorial/#tech-stack
[2]: http://tsaprailis.com/2016/06/02/How-to-build-and-deploy-a-Facebook-Messenger-bot-with-Python-and-Flask-a-tutorial/#bot-architecture
[3]: http://tsaprailis.com/2016/06/02/How-to-build-and-deploy-a-Facebook-Messenger-bot-with-Python-and-Flask-a-tutorial/#the-bot-server
[4]: http://tsaprailis.com/2016/06/02/How-to-build-and-deploy-a-Facebook-Messenger-bot-with-Python-and-Flask-a-tutorial/#deploying-to-heroku
[5]: http://tsaprailis.com/2016/06/02/How-to-build-and-deploy-a-Facebook-Messenger-bot-with-Python-and-Flask-a-tutorial/#creating-the-facebook-app
[6]: http://tsaprailis.com/2016/06/02/How-to-build-and-deploy-a-Facebook-Messenger-bot-with-Python-and-Flask-a-tutorial/#conclusion
[7]: https://www.heroku.com
[8]: https://www.python.org
[9]: http://flask.pocoo.org
[10]: https://git-scm.com
[11]: https://virtualenv.pypa.io/en/stable
[12]: https://github.com/hult/facebook-chatbot-python
[13]: https://github.com/hult
[14]: https://devcenter.heroku.com/articles/python-gunicorn
[15]: https://pip.pypa.io/en/stable/installing
[16]: https://toolbelt.heroku.com
[17]: https://dashboard.heroku.com/apps


