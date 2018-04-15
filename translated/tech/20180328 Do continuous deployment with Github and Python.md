使用 Github 和 Python 实现持续部署
======

![](https://fedoramagazine.org/wp-content/uploads/2018/03/cd-github-python-945x400.jpg)
借助 Github 的 webhook（网络钩子）开发者可以创建很多有用的服务。从触发一个 Jenkins 实例上的 CI（持续集成） 任务到配置云中的机器，几乎有着无限的可能性。这篇教程将展示如何使用 Python 和 Flask 框架来搭建一个简单的持续部署服务。

在这个例子中的持续部署服务是一个简单的 Flask 应用，其带有接受 Github 的 webhook 请求的 REST 端点（endpoint）。在验证每个请求都来自正确的 Github 仓库后，服务器将拉取（pull）更改到仓库的本地副本。这样每次一个新的提交(commit)推送到远程 Github 仓库，本地仓库就会自动更新。

### Flask web 服务

用 Flask 搭建一个小的 web 服务非常简单。这里可以先看看项目的结构。
```
├── app
│   ├── __init__.py
│   └── webhooks.py
├── requirements.txt
└── wsgi.py

```

首先，创建应用。应用代码在 app 目录下。

两个文件（__init__.py 和 webhooks.py）构成了 Flask 应用。前者有创建 Flask 应用并为其添加配置的代码。后者有端点（endpoint）逻辑。这是该应用接收 Github 请求的地方。

这里是 app/__init__.py 的内容：
```
import os
from flask import Flask

from .webhooks import webhook

def create_app():
 """ Create, configure and return the Flask application """

 app = Flask(__name__)
 app.config['GITHUB_SECRET'] = os.environ.get('GITHUB_SECRET')
 app.config['REPO_PATH'] = os.environ.get('REPO_PATH')
 app.register_blueprint(webhook)

 return(app)

```

该函数创建了两个配置变量：

  * **GITHUB_SECRET** 保存一个密码，用来认证 Github 请求。
  * **REPO_PATH** 保存了自动更新的仓库路径。



这份代码使用[Flask 蓝图（Blueprints）][1]来组织应用的端点（endpoint）。使用蓝图可以对 API 进行逻辑分组，使应用程序更易于维护。通常认为这是一种好的做法。

这里是 app/webhooks.py 的内容：
```
import hmac
from flask import request, Blueprint, jsonify, current_app
from git import Repo

webhook = Blueprint('webhook', __name__, url_prefix='')

@webhook.route('/github', methods=['POST'])
def handle_github_hook():
 """ Entry point for github webhook """

 signature = request.headers.get('X-Hub-Signature')
 sha, signature = signature.split('=')

 secret = str.encode(current_app.config.get('GITHUB_SECRET'))

 hashhex = hmac.new(secret, request.data, digestmod='sha1').hexdigest()
 if hmac.compare_digest(hashhex, signature):
 repo = Repo(current_app.config.get('REPO_PATH'))
 origin = repo.remotes.origin
 origin.pull('--rebase')

 commit = request.json['after'][0:6]
 print('Repository updated with commit {}'.format(commit))
 return jsonify({}), 200

```

首先代码创建了一个新的蓝图 webhook。然后它使用 Flask 路由（route）为蓝图添加了一个端点。任何 URL 为 /Github 的端点的 POST 请求都将调用这个路由。

#### 验证请求

当服务收到该端点的请求时，首先它必须验证该请求是否来自 GitHub 同时来自正确的仓库。Github 在请求头的 X-Hub-Signature 中提供了一个签名。该签名由一个密码（GITHUB_SECRET），请求体的 HMAC 十六进制摘要和使用 sha1 的哈希生成。

为了验证请求，服务需要在本地计算签名并与请求头中收到的签名做比较。这可以由 hmac.compare_digest 函数完成。

#### 自定义钩子逻辑

在验证请求后，现在可以处理了。这篇教程使用[GitPython][3]模块来与 git 仓库进行交互。GitPython 模块中的 Repo 对象用于访问远程仓库 origin。服务在本地拉取远程仓库的最新更改，还用 -rebase 选项来避免合并的问题。

调试打印语句显示了从请求体收到的短提交哈希。这个例子展示了如何使用请求体。更多关于请求体的可用数据的信息，请查询[github 文档][4]。

最后服务返回了一个空的 JSON 字符串和 200 的状态码。这用于告诉 Github 的 webhook 服务已经收到了请求。

### 部署服务

为了运行该服务，这个例子使用 [gunicorn][5] web 服务器。首先安装服务依赖。在支持的 Fedora 服务器上，以[sudo][6]运行这条命令:
```
sudo dnf install python3-gunicorn python3-flask python3-GitPython

```

现在编辑 gunicorn 使用的 wsgi.py 文件来运行服务：
```
from app import create_app

application = create_app()

```

为了部署服务，使用以下命令克隆这个 git [仓库][7]或者使用你自己的 git 仓库：
```
git clone https://github.com/cverna/github_hook_deployment.git /opt/

```

下一步是配置服务所需的环境变量。运行这些命令：
```
export GITHUB_SECRET=asecretpassphraseusebygithubwebhook
export REPO_PATH=/opt/github_hook_deployment/

```

这篇教程使用 webhook 服务的 Github 仓库，但你可以使用你想要的不同仓库。最后，使用这些命令开启 该 web 服务：
```
cd /opt/github_hook_deployment/
gunicorn --bind 0.0.0.0 wsgi:application --reload

```

这些选项中绑定了 web 服务的 ip 地址为 0.0.0.0，意味着它将接收来自任何的主机的请求。选项 -reload 确保了当代码更改时重启 web 服务。这就是持续部署的魔力所在。每次接收到 Github 请求时将拉取仓库的最近更新，同时 gunicore 检测这些更改并且自动重启服务。

**注意： **为了能接收到 Github 请求，web 服务必须部署到具有公有 IP 地址的服务器上。做到这点的简单方法就是使用你最喜欢的云提供商比如 DigitalOcean，AWS，Linode等。 

### 配置 Github

这篇教程的最后一部分是配置 Github 来发送 webhook 请求到 web 服务上。这是持续部署的关键。

从你的 Github 仓库的设置中，选择 Webhook 菜单，并且点击添加 Webhook。输入以下信息：

  * **Payload URL:** 服务的 URL，比如<http://public\_ip\_address:8000/github>
  * **Content type:** 选择 application/json
  * **Secret:** 前面定义的 **GITHUB_SECRET** 环境变量



然后点击添加 Webhook 按钮。

![][8]

现在每当该仓库发生 push(推送)事件时，Github 将向服务发送请求。

### 总结

这篇教程向你展示了如何写一个基于 Flask 的用于接收 Github 的 webhook 请求和实现持续集成的 web 服务。现在你应该能以本教程作为起点来搭建对自己有用的服务。

#### 像这样：

如

加载中...

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/continuous-deployment-github-python/

作者：[Author Archive;Author Website;Clément Verna][a]
译者：[kimii](https://github.com/kimii)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:http://flask.pocoo.org/docs/0.12/blueprints/
[2]:https://en.wikipedia.org/wiki/HMAC
[3]:https://gitpython.readthedocs.io/en/stable/index.html
[4]:https://developer.github.com/v3/activity/events/types/#webhook-payload-example-26
[5]:http://gunicorn.org/
[6]:https://fedoramagazine.org/howto-use-sudo/
[7]:https://github.com/cverna/github_hook_deployment.git
[8]:https://fedoramagazine.org/wp-content/uploads/2018/03/Screenshot-2018-3-26-cverna-github_hook_deployment1.png
