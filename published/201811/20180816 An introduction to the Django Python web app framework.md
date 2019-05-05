Python Web 应用程序 Django 框架简介
=====
> 在这个比较 Python 框架的最后一篇中，让我们看看 Django。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-spider-frame-framework.png?itok=Rl2AG2Dc)

在本系列（由四部分组成）的前三篇文章中，我们讨论了 [Pyramid][1]、[Flask][2] 和 [Tornado][3] 这 3 个 Web 框架。我们已经构建了三次相同的应用程序，最终我们遇到了 [Django][4]。总的来说，Django 是目前 Python 开发人员使用的主要 Web 框架，并且原因显而易见。它擅长隐藏大量的配置逻辑，让你专注于能够快速构建大型应用程序。

也就是说，当涉及到小型项目时，比如我们的待办事项列表应用程序，Django 可能有点像用消防水管来进行水枪大战。让我们来看看它们是如何结合在一起的。

### 关于 Django

Django 将自己定位为“一个鼓励快速开发和整洁、实用的设计的高级 Python Web 框架。它由经验丰富的开发人员构建，解决了 Web 开发的很多麻烦，因此你可以专注于编写应用程序而无需重新发明轮子”。而且它确实做到了！这个庞大的 Web 框架附带了非常多的工具，以至于在开发过程中，如何将所有内容组合在一起协同工作可能是个谜。

除了框架本身很大，Django 社区也是非常庞大的。事实上，它非常庞大和活跃，以至于有[一个网站][5]专门用于为人们收集第三方包，这些第三方包可集成进 Django 来做一大堆事情。包括从身份验证和授权到完全基于 Django 的内容管理系统，电子商务附加组件以及与 Stripe（LCTT 译注：美版“支付宝”）集成的所有内容。至于不要重新发明轮子：如果你想用 Django 完成一些事情，有人可能已经做过了，你只需将它集成进你的项目就行。

为此，我们希望使用 Django 构建 REST API，因此我们将使用流行的 [Django REST 框架][6]。它的工作是将 Django 框架（Django 使用自己的模板引擎构建 HTML 页面）转换为专门用于有效地处理 REST 交互的系统。让我们开始吧。

### Django 启动和配置

```
$ mkdir django_todo
$ cd django_todo
$ pipenv install --python 3.6
$ pipenv shell
(django-someHash) $ pipenv install django djangorestframework
```

作为参考，我们使用的是 `django-2.0.7` 和 `djangorestframework-3.8.2`。

与 Flask, Tornado 和 Pyramid 不同，我们不需要自己编写 `setup.py` 文件，我们并不是在做一个可安装的 Python 发布版。像很多事情一样，Django 以自己的方式处理这个问题。我们仍然需要一个 `requirements.txt` 文件来跟踪我们在其它地方部署的所有必要安装。但是，就 Django 项目中的目标模块而言，Django 会让我们列出我们想要访问的子目录，然后允许我们从这些目录中导入，就像它们是已安装的包一样。

首先，我们必须创建一个 Django 项目。

当我们安装了 Django 后，我们还安装了命令行脚本 `django-admin`。它的工作是管理所有与 Django 相关的命令，这些命令有助于我们将项目整合在一起，并在我们继续开发的过程中对其进行维护。`django-admin` 并不是让我们从头开始构建整个 Django 生态系统，而是让我们从标准 Django 项目所需的所有必要文件（以及更多）的基础上开始。

调用 `django-admin` 的 `start-project` 命令的语法是 `django-admin startproject <项目名称> <存放目录>`。我们希望文件存于当前的工作目录中，所以：

```
(django-someHash) $ django-admin startproject django_todo .
```

输入 `ls` 将显示一个新文件和一个新目录。

```
(django-someHash) $ ls
manage.py   django_todo
```

`manage.py` 是一个可执行命令行 Python 文件，它最终成为 `django-admin` 的封装。因此，它的工作与 `django-admin` 是一样的：帮助我们管理项目。因此得名 `manage.py`。

它在 `django_todo` 目录里创建了一个新目录 `django_todo`，其代表了我们项目的配置根目录。现在让我们深入研究一下。

### 配置 Django

可以将 `django_todo` 目录称为“配置根目录”，我们的意思是这个目录包含了通常配置 Django 项目所需的文件。几乎所有这个目录之外的内容都只关注与项目模型、视图、路由等相关的“业务逻辑”。所有连接项目的点都将在这里出现。

在 `django_todo` 目录中调用 `ls` 会显示以下四个文件：

```
(django-someHash) $ cd django_todo
(django-someHash) $ ls
__init__.py settings.py urls.py     wsgi.py
```

 * `__init__.py` 文件为空，之所以存在是为了将此目录转换为可导入的 Python 包。
 * `settings.py` 是设置大多数配置项的地方。例如项目是否处于 DEBUG 模式，正在使用哪些数据库，Django 应该定位文件的位置等等。它是配置根目录的“主要配置”部分，我们将在一会深入研究。
 * `urls.py` 顾名思义就是设置 URL 的地方。虽然我们不必在此文件中显式写入项目的每个 URL，但我们需要让此文件知道在其他任何地方已声明的 URL。如果此文件未指向其它 URL，则那些 URL 就不存在。
 * `wsgi.py` 用于在生产环境中提供应用程序。就像 Pyramid、 Tornado 和 Flask 暴露了一些 “app” 对象一样，它们用来提供配置好的应用程序，Django 也必须暴露一个，就是在这里完成的。它可以和 [Gunicorn][7]、[Waitress][8] 或者 [uWSGI][9] 一起配合来提供服务。

#### 设置 settings

看一看 `settings.py`，它里面有大量的配置项，那些只是默认值！这甚至不包括数据库、静态文件、媒体文件、任何集成的钩子，或者可以配置 Django 项目的任何其它几种方式。让我们从上到下看看有什么：

* `BASE_DIR` 设置目录的绝对路径，或者是 `manage.py` 所在的目录。这对于定位文件非常有用。
* `SECRET_KEY` 是用于 Django 项目中加密签名的密钥。在实际中，它用于会话、cookie、CSRF 保护和身份验证令牌等。最好在第一次提交之前，尽快应该更改 `SECRET_KEY` 的值并将其放置到环境变量中。
* `DEBUG` 告诉 Django 是以开发模式还是生产模式运行项目。这是一个非常关键的区别。
     * 在开发模式下，当弹出一个错误时，Django 将显示导致错误的完整堆栈跟踪，以及运行项目所涉及的所有设置和配置。如果在生产环境中将 `DEBUG` 设置为 `True`，这可能成为一个巨大的安全问题。
    * 在生产模式下，当出现问题时，Django 会显示一个简单的错误页面，即除错误代码外不提供任何信息。
    * 保护我们项目的一个简单方法是将 `DEBUG` 设置为环境变量，如 `bool(os.environ.get('DEBUG', ''))`。
* `ALLOWED_HOSTS` 是应用程序提供服务的主机名的列表。在开发模式中，这可能是空的；但是在生产环境中，如果为项目提供服务的主机不在 `ALLOWED_HOSTS` 列表中，Django 项目将无法运行。这是设置为环境变量的另一种情况。
* `INSTALLED_APPS` 是我们的 Django 项目可以访问的 Django “apps” 列表（将它们视为子目录，稍后会详细介绍）。默认情况下，它将提供：
    * 内置的 Django 管理网站
    * Django 的内置认证系统
    * Django 的数据模型通用管理器
    * 会话管理
    * Cookie 和基于会话的消息传递
    * 站点固有的静态文件的用法，比如 `css` 文件、`js` 文件、任何属于我们网站设计的图片等。 
* `MIDDLEWARE` 顾名思义：帮助 Django 项目运行的中间件。其中很大一部分用于处理各种类型的安全，尽管我们可以根据需要添加其它中间件。
* `ROOT_URLCONF` 设置基本 URL 配置文件的导入路径。还记得我们之前见过的那个 `urls.py` 吗？默认情况下，Django 指向该文件以此来收集所有的 URL。如果我们想让 Django 在其它地方寻找，我们将在这里设置 URL 位置的导入路径。
* `TEMPLATES` 是 Django 用于我们网站前端的模板引擎列表，假如我们依靠 Django 来构建我们的 HTML。我们在这里不需要，那就无关紧要了。
* `WSGI_APPLICATION` 设置我们的 WSGI 应用程序的导入路径 —— 在生产环境下使用的东西。默认情况下，它指向 `wsgi.py` 中的 `application` 对象。这很少（如果有的话）需要修改。
* `DATABASES` 设置 Django 项目将访问那些数据库。必须设置 `default` 数据库。我们可以通过名称设置别的数据库，只要我们提供 `HOST`、`USER`、`PASSWORD`、`PORT`、数据库名称 `NAME` 和合适的 `ENGINE`。可以想象，这些都是敏感的信息，因此最好将它们隐藏在环境变量中。[查看 Django 文档][10]了解更多详情。
    * 注意：如果不是提供数据库的每个单个部分，而是提供完整的数据库 URL，请查看 [dj_database_url][11]。
* `AUTH_PASSWORD_VALIDATORS` 实际上是运行以检查输入密码的函数列表。默认情况下我们有一些，但是如果我们有其它更复杂的验证需求：不仅仅是检查密码是否与用户的属性匹配，是否超过最小长度，是否是 1000 个最常用的密码之一，或者密码完全是数字，我们可以在这里列出它们。
* `LANGUAGE_CODE` 设置网站的语言。默认情况下它是美国英语，但我们可以将其切换为其它语言。
* `TIME_ZONE` 是我们 Django 项目后中自动生成的时间戳的时区。我强调坚持使用 UTC 并在其它地方执行任何特定于时区的处理，而不是尝试重新配置此设置。正如[这篇文章][12] 所述，UTC 是所有时区的共同点，因为不需要担心偏移。如果偏移很重要，我们可以根据需要使用与 UTC 的适当偏移来计算它们。
* `USE_I18N` 将让 Django 使用自己的翻译服务来为前端翻译字符串。I18N = 国际化（internationalization，“i” 和 “n” 之间共 18 个字符）。
* `USE_L10N` L10N = 本地化（localization，在 "l" 和 "n" 之间共 10 个字符) 。如果设置为 `True`，那么将使用数据的公共本地格式。一个很好的例子是日期：在美国它是 MM-DD-YYYY。在欧洲，日期往往写成 DD-MM-YYYY。
* `STATIC_URL` 是用于提供静态文件的主体部分。我们将构建一个 REST API，因此我们不需要考虑静态文件。通常，这会为每个静态文件的域名设置根路径。所以，如果我们有一个 Logo 图像，那就是 `http://<domainname>/<STATIC_URL>/logo.gif`。

默认情况下，这些设置已准备就绪。我们必须改变的一个选项是 `DATABASES` 设置。首先，我们创建将要使用的数据库：

```
(django-someHash) $ createdb django_todo
```

我们想要像使用 Flask、Pyramid 和 Tornado 一样使用 PostgreSQL 数据库，这意味着我们必须更改 `DATABASES` 设置以允许我们的服务器访问 PostgreSQL 数据库。首先是引擎。默认情况下，数据库引擎是 `django.db.backends.sqlite3`，我们把它改成 `django.db.backends.postgresql`。

有关 Django 可用引擎的更多信息，[请查看文档][13]。请注意，尽管技术上可以将 NoSQL 解决方案整合到 Django 项目中，但为了开箱即用，Django 强烈偏向于 SQL 解决方案。

接下来，我们必须为连接参数的不同部分指定键值对。
 
  * `NAME` 是我们刚刚创建的数据库的名称。
  * `USER` 是 Postgres 数据库用户名。
  * `PASSWORD` 是访问数据库所需的密码。
  * `HOST` 是数据库的主机。当我们在本地开发时，`localhost` 或 `127.0.0.1` 都将起作用。
  * `PORT` 是我们为 Postgres 开放的端口，它通常是 `5432`。

`settings.py` 希望我们为每个键提供字符串值。但是，这是高度敏感的信息。任何负责任的开发人员都不应该这样做。有几种方法可以解决这个问题，一种是我们需要设置环境变量。

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('DB_NAME', ''),
        'USER': os.environ.get('DB_USER', ''),
        'PASSWORD': os.environ.get('DB_PASS', ''),
        'HOST': os.environ.get('DB_HOST', ''),
        'PORT': os.environ.get('DB_PORT', ''),
    }
}
```

在继续之前，请确保设置环境变量，否则 Django 将无法工作。此外，我们需要在此环境中安装 `psycopg2`，以便我们可以与数据库通信。

### Django 路由和视图

让我们在这个项目中实现一些函数。我们将使用 Django REST 框架来构建 REST API，所以我们必须确保在 `settings.py` 中将 `rest_framework` 添加到 `INSTALLED_APPS` 的末尾。

```
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework'
]
```

虽然 Django REST 框架并不专门需要基于类的视图（如 Tornado）来处理传入的请求，但类是编写视图的首选方法。让我们来定义一个类视图。

让我们在 `django_todo` 创建一个名为 `views.py` 的文件。在 `views.py` 中，我们将创建 “Hello, world!” 视图。

```
# in django_todo/views.py
from rest_framework.response import JsonResponse
from rest_framework.views import APIView

class HelloWorld(APIView):
    def get(self, request, format=None):
        """Print 'Hello, world!' as the response body."""
        return JsonResponse("Hello, world!")
```

每个 Django REST 框架基于类的视图都直接或间接地继承自 `APIView`。`APIView` 处理大量的东西，但针对我们的用途，它做了以下特定的事情：

    * 根据 HTTP 方法（例如 GET、POST、PUT、DELETE）来设置引导对应请求所需的方法
    * 用我们需要的所有数据和属性来填充 `request` 对象，以便解析和处理传入的请求 
    * 采用 `Response` 或 `JsonResponse`，每个调度方法（即名为 `get`、`post`、`put`、`delete` 的方法）返回并构造格式正确的 HTTP 响应。

终于，我们有一个视图了！它本身没有任何作用，我们需要将它连接到路由。

如果我们跳转到 `django_todo/urls.py`，我们会到达默认的 URL 配置文件。如前所述：如果 Django 项目中的路由不包含在此处，则它不存在。

我们在给定的 `urlpatterns` 列表中添加所需的 URL。默认情况下，我们有一整套 URL 用于 Django 的内置管理后端系统。我们会完全删除它。

我们还得到一些非常有用的文档字符串，它告诉我们如何向 Django 项目添加路由。我们需要调用 `path()`，伴随三个参数：

 * 所需的路由，作为字符串（没有前导斜线）
 * 处理该路由的视图函数（只能有一个函数！）
 * 在 Django 项目中路由的名称

让我们导入 `HelloWorld` 视图并将其附加到主路径 `/` 。我们可以从 `urlpatterns` 中删除 `admin` 的路径，因为我们不会使用它。

```
# django_todo/urls.py, after the big doc string
from django.urls import path
from django_todo.views import HelloWorld

urlpatterns = [
    path('', HelloWorld.as_view(), name="hello"),
]
```

好吧，这里有一点不同。我们指定的路由只是一个空白字符串，为什么它会工作？Django 假设我们声明的每个路由都以一个前导斜杠开头，我们只是在初始域名后指定资源路由。如果一条路由没有去往一个特定的资源，而只是一个主页，那么该路由是 `''`，实际上是“没有资源”。

`HelloWorld` 视图是从我们刚刚创建的 `views.py` 文件导入的。为了执行此导入，我们需要更新 `settings.py` 中的 `INSTALLED_APPS` 列表使其包含 `django_todo`。是的，这有点奇怪。以下是一种理解方式。

`INSTALLED_APPS` 指的是 Django 认为可导入的目录或包的列表。它是 Django 处理项目的各个组件的方式，比如安装了一个包，而不需要经过 `setup.py` 的方式。我们希望将 `django_todo` 目录视为可导入的包，因此我们将该目录包含在 `INSTALLED_APPS` 中。现在，在该目录中的任何模块也是可导入的。所以我们得到了我们的视图。

`path` 函数只将视图函数作为第二个参数，而不仅仅是基于类的视图。幸运的是，所有有效的基于 Django 类的视图都包含 `.as_view()` 方法。它的工作是将基于类的视图的所有优点汇总到一个视图函数中并返回该视图函数。所以，我们永远不必担心转换的工作。相反，我们只需要考虑业务逻辑，让 Django 和 Django REST 框架处理剩下的事情。

让我们在浏览器中打开它！

Django 提供了自己的本地开发服务器，可通过 `manage.py` 访问。让我们切换到包含 `manage.py` 的目录并输入：

```
(django-someHash) $ ./manage.py runserver
Performing system checks...

System check identified no issues (0 silenced).
August 01, 2018 - 16:47:24
Django version 2.0.7, using settings 'django_todo.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CONTROL-C.
```

当 `runserver` 执行时，Django 会检查以确保项目（或多或少）正确连接在一起。这不是万无一失的，但确实会发现一些明显的问题。如果我们的数据库与代码不同步，它会通知我们。毫无疑问，因为我们没有将任何应用程序的东西提交到我们的数据库，但现在这样做还是可以的。让我们访问 `http://127.0.0.1:8000` 来查看 `HelloWorld` 视图的输出。

咦？这不是我们在 Pyramid、Flask 和 Tornado 中看到的明文数据。当使用 Django REST 框架时，HTTP 响应（在浏览器中查看时）是这样呈现的 HTML，以红色显示我们的实际 JSON 响应。

但不要担心！如果我们在命令行中使用 `curl` 快速访问 `http://127.0.0.1:8000`，我们就不会得到任何花哨的 HTML，只有内容。

```
# 注意：在不同的终端口窗口中执行此操作，在虚拟环境之外
$ curl http://127.0.0.1:8000
"Hello, world!"
```

棒极了！

Django REST 框架希望我们在使用浏览器浏览时拥有一个人性化的界面。这是有道理的，如果在浏览器中查看 JSON，通常是因为人们想要检查它是否正确，或者在设计一些消费者 API 时想要了解 JSON 响应。这很像你从 [Postman][14] 中获得的东西。

无论哪种方式，我们都知道我们的视图工作了！酷！让我们概括一下我们做过的事情：

  1. 使用 `django-admin startproject <项目名称>` 开始一个项目
  2. 使用环境变量来更新 `django_todo/settings.py` 中的 `DEBUG`、`SECRET_KEY`，还有 `DATABASES` 字典
  3. 安装 Django REST 框架，并将它添加到 `INSTALLED_APPS`
  4. 创建 `django_todo/views.py` 来包含我们的第一个类视图，它返回响应 “Hello, world!”
  5. 更新 `django_todo/urls.py`，其中包含我们的根路由
  6. 在 `django_todo/settings.py` 中更新 `INSTALLED_APPS` 以包含 `django_todo` 包

### 创建模型

现在让我们来创建数据模型吧。

Django 项目的整个基础架构都是围绕数据模型构建的，它是这样编写的，每个数据模型够可以拥有自己的小天地，拥有自己的视图，自己与其资源相关的 URL 集合，甚至是自己的测试（如果我们想要的话）。

如果我们想构建一个简单的 Django 项目，我们可以通过在 `django_todo` 目录中编写我们自己的 `models.py` 文件并将其导入我们的视图来避免这种情况。但是，我们想以“正确”的方式编写 Django 项目，因此我们应该尽可能地将模型拆分成符合 Django Way™（Django 风格）的包。

Django Way 涉及创建所谓的 Django “应用程序”，它本身并不是单独的应用程序，它们没有自己的设置和诸如此类的东西（虽然它们也可以）。但是，它们可以拥有一个人们可能认为属于独立应用程序的东西：

  * 一组自建的 URL
  * 一组自建的 HTML 模板（如果我们想要提供 HTML）
  * 一个或多个数据模型
  * 一套自建的视图
  * 一套自建的测试

它们是独立的，因此可以像独立应用程序一样轻松共享。实际上，Django REST 框架是 Django 应用程序的一个例子。它包含自己的视图和 HTML 模板，用于提供我们的 JSON。我们只是利用这个 Django 应用程序将我们的项目变成一个全面的 RESTful API 而不用那么麻烦。

要为我们的待办事项列表项创建 Django 应用程序，我们将要使用 `manage.py` 的 `startapp` 命令。

```
(django-someHash) $ ./manage.py startapp todo
```

`startapp` 命令成功执行后没有输出。我们可以通过使用 `ls` 来检查它是否完成它应该做的事情。

```
(django-someHash) $ ls
Pipfile      Pipfile.lock django_todo  manage.py    todo
```

看看：我们有一个全新的 `todo` 目录。让我们看看里面!

```
(django-someHash) $ ls todo
__init__.py admin.py    apps.py     migrations  models.py   tests.py    views.py
```

以下是 `manage.py startapp` 创建的文件：

  * `__init__.py` 是空文件。它之所以存在是因为此目录可看作是模型、视图等的有效导入路径。
  * `admin.py` 不是空文件。它用于在 Django admin 中规范化这个应用程序的模型，我们在本文中没有涉及到它。
  * `apps.py` 这里基本不起作用。它有助于规范化 Django admin 的模型。
  * `migrations` 是一个包含我们数据模型快照的目录。它用于更新数据库。这是少数几个内置了数据库管理的框架之一，其中一部分允许我们更新数据库，而不必拆除它并重建它以更改 Schema。
  * `models.py` 是数据模型所在。
  * `tests.py` 是测试所在的地方，如果我们需要写测试。
  * `views.py` 用于我们编写的与此应用程序中的模型相关的视图。它们不是一定得写在这里。例如，我们可以在 `django_todo/views.py` 中写下我们所有的视图。但是，它在这个应用程序中更容易将我们的概念理清。在覆盖了许多概念的扩展应用程序的关系之间会变得更加密切。

它并没有为这个应用程序创建 `urls.py` 文件，但我们可以自己创建。

```
(django-someHash) $ touch todo/urls.py
```

在继续之前，我们应该帮自己一个忙，将这个新 Django 应用程序添加到 `django_todo/settings.py` 中的 `INSTALLED_APPS` 列表中。

```
# settings.py
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'django_todo',
    'todo' # <--- 添加了这行
]
```

检查 `todo/models.py` 发现 `manage.py` 已经为我们编写了一些代码。不同于在 Flask、Tornado 和 Pyramid 实现中创建模型的方式，Django 不利用第三方来管理数据库会话或构建其对象实例。它全部归入 Django 的 `django.db.models` 子模块。

然而，建立模型的方式或多或少是相同的。要在 Django 中创建模型，我们需要构建一个继承自 `models.Model` 的 `class`，将应用于该模型实例的所有字段都应视为类属性。我们不像过去那样从 SQLAlchemy 导入列和字段类型，而是直接从 `django.db.models` 导入。

```
# todo/models.py
from django.db import models

class Task(models.Model):
    """Tasks for the To Do list."""
    name = models.CharField(max_length=256)
    note = models.TextField(blank=True, null=True)
    creation_date = models.DateTimeField(auto_now_add=True)
    due_date = models.DateTimeField(blank=True, null=True)
    completed = models.BooleanField(default=False)
```

虽然 Django 的需求和基于 SQLAlchemy 的系统之间存在一些明显的差异，但总体内容和结构或多或少相同。让我们来指出这些差异。

我们不再需要为对象实例声明自动递增 ID 的单独字段。除非我们指定一个不同的字段作为主键，否则 Django 会为我们构建一个。

我们只是直接引用数据类型作为列本身，而不是实例化传递数据类型对象的 `Column` 对象。

`Unicode` 字段变为 `models.CharField` 或 `models.TextField`。`CharField` 用于特定最大长度的小文本字段，而 `TextField` 用于任何数量的文本。

`TextField` 应该是空白的，我们以两种方式指定它。`blank = True` 表示当构建此模型的实例，并且正在验证附加到该字段的数据时，该数据是可以为空的。这与 `null = True` 不同，后者表示当构造此模型类的表时，对应于 `note` 的列将允许空白或为 `NULL`。因此，总而言之，`blank = True` 控制如何将数据添加到模型实例，而 `null = True` 控制如何构建保存该数据的数据库表。

`DateTime` 字段增加了一些属性，并且能够为我们做一些工作，使得我们不必修改类的 `__init__` 方法。对于 `creation_date` 字段，我们指定 `auto_now_add = True`。在实际意义上意味着，当创建一个新模型实例时，Django 将自动记录现在的日期和时间作为该字段的值。这非常方便！

当 `auto_now_add` 及其类似属性 `auto_now` 都没被设置为  `True` 时，`DateTimeField` 会像其它字段一样需要预期的数据。它需要提供一个适当的 `datetime` 对象才能生效。`due_date` 列的 `blank` 和 `null` 属性都设置为 `True`，这样待办事项列表中的项目就可以成为将来某个时间点完成，没有确定的日期或时间。

`BooleanField` 最终可以取两个值：`True` 或 `False`。这里，默认值设置为 `False`。

#### 管理数据库

如前所述，Django 有自己的数据库管理方式。我们可以利用 Django 提供的 `manage.py` 脚本，而不必编写任何关于数据库的代码。它不仅可以管理我们数据库的表的构建，还可以管理我们希望对这些表进行的任何更新，而不必将整个事情搞砸！

因为我们构建了一个新模型，所以我们需要让数据库知道它。首先，我们需要将与此模型对应的模式放入代码中。`manage.py` 的 `makemigrations` 命令对我们构建的模型类及其所有字段进行快照。它将获取该信息并将其打包成一个 Python 脚本，该脚本将存在于特定 Django 应用程序的 `migrations` 目录中。永远没有理由直接运行这个迁移脚本。它的存在只是为了让 Django 可以使用它作为更新数据库表的基础，或者在我们更新模型类时继承信息。

```
(django-someHash) $ ./manage.py makemigrations
Migrations for 'todo':
  todo/migrations/0001_initial.py
    - Create model Task
```

这将查找 `INSTALLED_APPS` 中列出的每个应用程序，并检查这些应用程序中存在的模型。然后，它将检查相应的 `migrations` 目录中的迁移文件，并将它们与每个 `INSTALLED_APPS` 中的模型进行比较。如果模型已经升级超出最新迁移所应存在的范围，则将创建一个继承自最新迁移文件的新迁移文件，它将自动命名，并且还会显示一条消息，说明自上次迁移以来发生了哪些更改。

如果你上次处理 Django 项目已经有一段时间了，并且不记得模型是否与迁移同步，那么你无需担心。`makemigrations` 是一个幂等操作。无论你运行 `makemigrations` 一次还是 20 次，`migrations` 目录只有一个与当前模型配置的副本。更棒的是，当我们运行 `./manage.py runserver` 时，Django 检测到我们的模型与迁移不同步，它会用彩色文本告诉我们以便我们可以做出适当的选择。

下一个要点是至少让每个人访问一次：创建一个迁移文件不会立即影响我们的数据库。当我们运行 `makemigrations` 时，我们布置我们的 Django 项目定义了给定的表应该如何创建和最终查找。我们仍要将这些更改应用于数据库。这就是 `migrate` 命令的用途。

```
(django-someHash) $ ./manage.py migrate
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, sessions, todo
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
  Applying admin.0002_logentry_remove_auto_add... OK
  Applying contenttypes.0002_remove_content_type_name... OK
  Applying auth.0002_alter_permission_name_max_length... OK
  Applying auth.0003_alter_user_email_max_length... OK
  Applying auth.0004_alter_user_username_opts... OK
  Applying auth.0005_alter_user_last_login_null... OK
  Applying auth.0006_require_contenttypes_0002... OK
  Applying auth.0007_alter_validators_add_error_messages... OK
  Applying auth.0008_alter_user_username_max_length... OK
  Applying auth.0009_alter_user_last_name_max_length... OK
  Applying sessions.0001_initial... OK
  Applying todo.0001_initial... OK
```

当我们应用这些迁移时，Django 首先检查其他 `INSTALLED_APPS` 是否有需要应用的迁移，它大致按照列出的顺序检查它们。我们希望我们的应用程序最后列出，因为我们希望确保，如果我们的模型依赖于任何 Django 的内置模型，我们所做的数据库更新不会受到依赖性问题的影响。

我们还有另一个要构建的模型：`User` 模型。但是，因为我们正在使用 Django，事情有一些变化。许多应用程序需要某种类型的用户模型，Django 的 `django.contrib.auth` 包构建了自己的用户模型供我们使用。如果无需用户所需要的身份验证令牌，我们可以继续使用它而不是重新发明轮子。

但是，我们需要那个令牌。我们可以通过两种方式来处理这个问题。

* 继承 Django 的 `User` 对象，我们自己的对象通过添加 `token` 字段来扩展它
* 创建一个与 Django 的 `User` 对象一对一关系的新对象，其唯一目的是持有一个令牌

我习惯于建立对象关系，所以让我们选择第二种选择。我们称之为 `Owner`，因为它基本上具有与 `User` 类似的内涵，这就是我们想要的。

出于纯粹的懒惰，我们可以在 `todo/models.py` 中包含这个新的 `Owner` 对象，但是不要这样做。`Owner` 没有明确地与任务列表上的项目的创建或维护有关。从概念上讲，`Owner` 只是任务的所有者。甚至有时候我们想要扩展这个 `Owner` 以包含与任务完全无关的其他数据。

为了安全起见，让我们创建一个 `owner` 应用程序，其工作是容纳和处理这个 `Owner` 对象。

```
(django-someHash) $ ./manage.py startapp owner
```

不要忘记在 `settings.py` 文件中的 `INSTALLED_APPS` 中添加它。
```
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'django_todo',
    'todo',
    'owner'
]
```
 
如果我们查看 Django 项目的根目录，我们现在有两个 Django 应用程序：

```
(django-someHash) $ ls
Pipfile      Pipfile.lock django_todo  manage.py    owner        todo
```

在 `owner/models.py` 中，让我们构建这个 `Owner` 模型。如前所述，它与 Django 的内置 `User` 对象有一对一的关系。我们可以用 Django 的 `models.OneToOneField` 强制实现这种关系。

```
# owner/models.py
from django.db import models
from django.contrib.auth.models import User
import secrets

class Owner(models.Model):
    """The object that owns tasks."""
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    token = models.CharField(max_length=256)
    def __init__(self, *args, **kwargs):
        """On construction, set token."""
        self.token = secrets.token_urlsafe(64)
        super().__init__(*args, **kwargs)
```

这表示 `Owner` 对象对应到 `User` 对象，每个 `user` 实例有一个 `owner` 实例。`on_delete = models.CASCADE` 表示如果相应的 `User` 被删除，它所对应的 `Owner` 实例也将被删除。让我们运行 `makemigrations` 和 `migrate` 来将这个新模型放入到我们的数据库中。

```
(django-someHash) $ ./manage.py makemigrations
Migrations for 'owner':
  owner/migrations/0001_initial.py
    - Create model Owner
(django-someHash) $ ./manage.py migrate
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, owner, sessions, todo
Running migrations:
  Applying owner.0001_initial... OK
```

现在我们的 `Owner` 需要拥有一些 `Task` 对象。它与上面看到的 `OneToOneField` 非常相似，只不过我们会在 `Task` 对象上贴一个 `ForeignKey` 字段指向 `Owner`。

```
# todo/models.py
from django.db import models
from owner.models import Owner

class Task(models.Model):
    """Tasks for the To Do list."""
    name = models.CharField(max_length=256)
    note = models.TextField(blank=True, null=True)
    creation_date = models.DateTimeField(auto_now_add=True)
    due_date = models.DateTimeField(blank=True, null=True)
    completed = models.BooleanField(default=False)
    owner = models.ForeignKey(Owner, on_delete=models.CASCADE)
```

每个待办事项列表任务只有一个可以拥有多个任务的所有者。删除该所有者后，他们拥有的任务都会随之删除。

现在让我们运行 `makemigrations` 来获取我们的数据模型设置的新快照，然后运行 `migrate` 将这些更改应用到我们的数据库。

```
(django-someHash) django $ ./manage.py makemigrations
You are trying to add a non-nullable field 'owner' to task without a default; we can't do that (the database needs something to populate existing rows).
Please select a fix:
 1) Provide a one-off default now (will be set on all existing rows with a null value for this column)
 2) Quit, and let me add a default in models.py
```

不好了！出现了问题！发生了什么？其实，当我们创建 `Owner` 对象并将其作为 `ForeignKey` 添加到 `Task` 时，要求每个 `Task` 都需要一个 `Owner`。但是，我们为 `Task` 对象进行的第一次迁移不包括该要求。因此，即使我们的数据库表中没有数据，Django 也会对我们的迁移进行预先检查，以确保它们兼容，而我们提议的这种新迁移不是。

有几种方法可以解决这类问题：

1. 退出当前迁移并构建一个包含当前模型配置的新迁移
2. 将一个默认值添加到 `Task` 对象的 `owner` 字段
3. 允许任务为 `owner` 字段设置 `NULL` 值

方案 2 在这里没有多大意义。我们建议，默认情况下，任何创建的  `Task` 都会对应到某个默认所有者，尽管默认所有者不一定存在。
方案 1 要求我们销毁和重建我们的迁移，而我们应该把它们留下。

让我们考虑选项 3。在这种情况下，如果我们允许 `Task` 表为所有者提供空值，它不会很糟糕。从这一点开始创建的任何任务都必然拥有一个所有者。如果你的数据库表并非不能接受重新架构，请删除该迁移、删除表并重建迁移。

```
# todo/models.py
from django.db import models
from owner.models import Owner

class Task(models.Model):
    """Tasks for the To Do list."""
    name = models.CharField(max_length=256)
    note = models.TextField(blank=True, null=True)
    creation_date = models.DateTimeField(auto_now_add=True)
    due_date = models.DateTimeField(blank=True, null=True)
    completed = models.BooleanField(default=False)
    owner = models.ForeignKey(Owner, on_delete=models.CASCADE, null=True)
(django-someHash) $ ./manage.py makemigrations
Migrations for 'todo':
  todo/migrations/0002_task_owner.py
    - Add field owner to task
(django-someHash) $ ./manage.py migrate
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, owner, sessions, todo
Running migrations:
  Applying todo.0002_task_owner... OK
```

酷！我们有模型了！欢迎使用 Django 声明对象的方式。

出于更好的权衡，让我们确保无论何时制作 `User`，它都会自动与新的 `Owner` 对象对应。我们可以使用 Django 的 `signals` 系统来做到这一点。基本上，我们确切地表达了意图：“当我们得到一个新的 `User` 被构造的信号时，构造一个新的 `Owner` 并将新的 `User` 设置为 `Owner` 的 `user` 字段。”在实践中看起来像这样：

```
# owner/models.py
from django.contrib.auth.models import User
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver

import secrets


class Owner(models.Model):
    """The object that owns tasks."""
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    token = models.CharField(max_length=256)

    def __init__(self, *args, **kwargs):
        """On construction, set token."""
        self.token = secrets.token_urlsafe(64)
        super().__init__(*args, **kwargs)


@receiver(post_save, sender=User)
def link_user_to_owner(sender, **kwargs):
    """If a new User is saved, create a corresponding Owner."""
    if kwargs['created']:
        owner = Owner(user=kwargs['instance'])
        owner.save()
```

我们设置了一个函数，用于监听从 Django 中内置的 `User` 对象发送的信号。它正在等待 `User` 对象被保存之后的情况。这可以来自新的 `User` 或对现有 `User` 的更新。我们在监听功能中辨别出两种情况。

如果发送信号的东西是新创建的实例，`kwargs ['created']` 将具有值 `True`。如果是 `True` 的话，我们想做点事情。如果它是一个新实例，我们创建一个新的 `Owner`，将其 `user` 字段设置为创建的新 `User` 实例。之后，我们 `save()` 新的 `Owner`。如果一切正常，这将提交更改到数据库。如果数据没通过我们声明的字段的验证，它将失败。

现在让我们谈谈我们将如何访问数据。

### 访问模型数据

在 Flask、Pyramid 和 Tornado 框架中，我们通过对某些数据库会话运行查询来访问模型数据。也许它被附加到 `request` 对象，也许它是一个独立的 `session` 对象。无论如何，我们必须建立与数据库的实时连接并在该连接上进行查询。

这不是 Django 的工作方式。默认情况下，Django 不利用任何第三方对象关系映射（ORM）与数据库进行通信。相反，Django 允许模型类维护自己与数据库的对话。

从 `django.db.models.Model` 继承的每个模型类都会附加一个 `objects` 对象。这将取代我们熟悉的 `session` 或 `dbsession`。让我们打开 Django 给我们的特殊 shell，并研究这个 `objects` 对象是如何工作的。

```
(django-someHash) $ ./manage.py shell
Python 3.7.0 (default, Jun 29 2018, 20:13:13)
[Clang 9.1.0 (clang-902.0.39.2)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>>
```

Django shell 与普通的 Python shell 不同，因为它知道我们正在构建的 Django 项目，可以轻松导入我们的模型、视图、设置等，而不必担心安装包。我们可以通过简单的 `import` 访问我们的模型。

```
>>> from owner.models import Owner
>>> Owner
<class 'owner.models.Owner'>
```

目前，我们没有 `Owner` 实例。我们可以通过 `Owner.objects.all()` 查询它们。

```
>>> Owner.objects.all()
<QuerySet []>
```

无论何时我们在 `<Model> .objects` 对象上运行查询方法，我们都会得到 `QuerySet`。为了我们的目的，它实际上是一个列表，这个列表向我们显示它是空的。让我们通过创建一个 `User` 来创建一个 `Owner`。

```
>>> from django.contrib.auth.models import User
>>> new_user = User(username='kenyattamurphy', email='kenyatta.murphy@gmail.com')
>>> new_user.set_password('wakandaforever')
>>> new_user.save()
```

如果我们现在查询所有的 `Owner`，我们应该会找到 Kenyatta。

```
>>> Owner.objects.all()
<QuerySet [<Owner: Owner object (1)>]>
```

棒极了！我们得到了数据！

### 序列化模型

我们将在 “Hello World” 之外来回传递数据。因此，我们希望看到某种类似于 JSON 类型的输出，它可以很好地表示数据。获取该对象的数据并将其转换为 JSON 对象以通过 HTTP 提交是数据序列化的一种方式。在序列化数据时，我们正在获取我们目前拥有的数据并重新格式化以适应一些标准的、更易于理解的形式。

如果我用 Flask、Pyramid 和 Tornado 这样做，我会在每个模型上创建一个新方法，让用户可以直接调用 `to_json()`。`to_json()` 的唯一工作是返回一个 JSON 可序列化的（即数字、字符串、列表、字典）字典，其中包含我想要为所讨论的对象显示的任何字段。

对于 `Task` 对象，它可能看起来像这样：

```
class Task(Base):
    ...all the fields...

    def to_json(self):
        """Convert task attributes to a JSON-serializable dict."""
        return {
            'id': self.id,
            'name': self.name,
            'note': self.note,
            'creation_date': self.creation_date.strftime('%m/%d/%Y %H:%M:%S'),
            'due_date': self.due_date.strftime('%m/%d/%Y %H:%M:%S'),
            'completed': self.completed,
            'user': self.user_id
        }
```

这不花哨，但它确实起到了作用。

然而，Django REST 框架为我们提供了一个对象，它不仅可以为我们这样做，还可以在我们想要创建新对象实例或更新现有实例时验证输入，它被称为 [ModelSerializer][15]。

Django REST 框架的 `ModelSerializer` 是我们模型的有效文档。如果没有附加模型，它们就没有自己的生命（因为那里有 [Serializer][16] 类）。它们的主要工作是准确地表示我们的模型，并在我们的模型数据需要序列化并通过线路发送时，将其转换为 JSON。

Django REST 框架的 `ModelSerializer` 最适合简单对象。举个例子，假设我们在 `Task` 对象上没有 `ForeignKey`。我们可以为 `Task` 创建一个序列化器，它将根据需要将其字段值转换为 JSON，声明如下：

```
# todo/serializers.py
from rest_framework import serializers
from todo.models import Task

class TaskSerializer(serializers.ModelSerializer):
    """Serializer for the Task model."""
    class Meta:
        model = Task
        fields = ('id', 'name', 'note', 'creation_date', 'due_date', 'completed')
```

在我们新的 `TaskSerializer` 中，我们创建了一个 `Meta` 类。`Meta` 的工作就是保存关于我们试图序列化的东西的信息（或元数据）。然后，我们会注意到要显示的特定字段。如果我们想要显示所有字段，我们可以简化过程并使用 `__all __`。或者，我们可以使用 `exclude` 关键字而不是 `fields` 来告诉 Django REST 框架我们想要除了少数几个字段以外的每个字段。我们可以拥有尽可能多的序列化器，所以也许我们想要一个用于一小部分字段，而另一个用于所有字段？在这里都可以。

在我们的例子中，每个 `Task` 和它的所有者 `Owner` 之间都有一个关系，必须在这里反映出来。因此，我们需要借用 `serializers.PrimaryKeyRelatedField` 对象来指定每个 `Task` 都有一个 `Owner`，并且该关系是一对一的。它的所有者将从已有的全部所有者的集合中找到。我们通过对这些所有者进行查询并返回我们想要与此序列化程序关联的结果来获得该集合：`Owner.objects.all()`。我们还需要在字段列表中包含 `owner`，因为我们总是需要一个与 `Task` 相关联的 `Owner`。

```
# todo/serializers.py
from rest_framework import serializers
from todo.models import Task
from owner.models import Owner

class TaskSerializer(serializers.ModelSerializer):
    """Serializer for the Task model."""
    owner = serializers.PrimaryKeyRelatedField(queryset=Owner.objects.all())

    class Meta:
        model = Task
        fields = ('id', 'name', 'note', 'creation_date', 'due_date', 'completed', 'owner')
```

现在构建了这个序列化器，我们可以将它用于我们想要为我们的对象做的所有 CRUD 操作：

* 如果我们想要 `GET` 一个特定的 `Task` 的 JSON 类型版本，我们可以做 `TaskSerializer((some_task).data`
* 如果我们想接受带有适当数据的 `POST` 来创建一个新的 `Task`，我们可以使用 `TaskSerializer(data = new_data).save()`
* 如果我们想用 `PUT` 更新一些现有数据，我们可以用 `TaskSerializer(existing_task, data = data).save()`

我们没有包括 `delete`，因为我们不需要对 `delete` 操作做任何事情。如果你可以删除一个对象，只需使用 `object_instance.delete()`。

以下是一些序列化数据的示例：

```
>>> from todo.models import Task
>>> from todo.serializers import TaskSerializer
>>> from owner.models import Owner
>>> from django.contrib.auth.models import User
>>> new_user = User(username='kenyatta', email='kenyatta@gmail.com')
>>> new_user.save_password('wakandaforever')
>>> new_user.save() # creating the User that builds the Owner
>>> kenyatta = Owner.objects.first() # 找到 kenyatta 的所有者
>>> new_task = Task(name="Buy roast beef for the Sunday potluck", owner=kenyatta)
>>> new_task.save()
>>> TaskSerializer(new_task).data
{'id': 1, 'name': 'Go to the supermarket', 'note': None, 'creation_date': '2018-07-31T06:00:25.165013Z', 'due_date': None, 'completed': False, 'owner': 1}
```

使用 `ModelSerializer` 对象可以做更多的事情，我建议查看[文档][17]以获得更强大的功能。否则，这就是我们所需要的。现在是时候深入视图了。

### 查看视图

我们已经构建了模型和序列化器，现在我们需要为我们的应用程序设置视图和 URL。毕竟，对于没有视图的应用程序，我们无法做任何事情。我们已经看到了上面的 `HelloWorld` 视图的示例。然而，这总是一个人为的、概念验证的例子，并没有真正展示 Django REST 框架的视图可以做些什么。让我们清除 `HelloWorld` 视图和 URL，这样我们就可以从我们的视图重新开始。

我们要构建的第一个视图是 `InfoView`。与之前的框架一样，我们只想打包并发送一个我们用到的路由的字典。视图本身可以存在于 `django_todo.views` 中，因为它与特定模型无关（因此在概念上不属于特定应用程序）。

```
# django_todo/views.py
from rest_framework.response import JsonResponse
from rest_framework.views import APIView

class InfoView(APIView):
    """List of routes for this API."""
    def get(self, request):
        output = {
            'info': 'GET /api/v1',
            'register': 'POST /api/v1/accounts',
            'single profile detail': 'GET /api/v1/accounts/<username>',
            'edit profile': 'PUT /api/v1/accounts/<username>',
            'delete profile': 'DELETE /api/v1/accounts/<username>',
            'login': 'POST /api/v1/accounts/login',
            'logout': 'GET /api/v1/accounts/logout',
            "user's tasks": 'GET /api/v1/accounts/<username>/tasks',
            "create task": 'POST /api/v1/accounts/<username>/tasks',
            "task detail": 'GET /api/v1/accounts/<username>/tasks/<id>',
            "task update": 'PUT /api/v1/accounts/<username>/tasks/<id>',
            "delete task": 'DELETE /api/v1/accounts/<username>/tasks/<id>'
        }
        return JsonResponse(output)
```

这与我们在 Tornado 中所拥有的完全相同。让我们将它放置到合适的路由并继续。为了更好的测试，我们还将删除 `admin/` 路由，因为我们不会在这里使用 Django 管理后端。

```
# in django_todo/urls.py
from django_todo.views import InfoView
from django.urls import path

urlpatterns = [
    path('api/v1', InfoView.as_view(), name="info"),
]
```

#### 连接模型与视图

让我们弄清楚下一个 URL，它将是创建新的 `Task` 或列出用户现有任务的入口。这应该存在于 `todo` 应用程序的 `urls.py` 中，因为它必须专门处理 `Task `对象而不是整个项目的一部分。

```
# in todo/urls.py
from django.urls import path
from todo.views import TaskListView

urlpatterns = [
    path('', TaskListView.as_view(), name="list_tasks")
]
```

这个路由处理的是什么？我们根本没有指定特定用户或路径。由于会有一些路由需要基本路径 `/api/v1/accounts/<username>/tasks`，为什么我们只需写一次就能一次又一次地写它？

Django 允许我们用一整套 URL 并将它们导入 `django_todo/urls.py` 文件。然后，我们可以为这些导入的 URL 中的每一个提供相同的基本路径，只关心可变部分，你知道它们是不同的。

```
# in django_todo/urls.py
from django.urls import include, path
from django_todo.views import InfoView

urlpatterns = [
    path('api/v1', InfoView.as_view(), name="info"),
    path('api/v1/accounts/<str:username>/tasks', include('todo.urls'))
]
```

现在，来自 `todo/urls.py` 的每个 URL 都将以路径 `api/v1/accounts/<str:username>/tasks` 为前缀。

让我们在 `todo/views.py` 中构建视图。

```
# todo/views.py
from django.shortcuts import get_object_or_404
from rest_framework.response import JsonResponse
from rest_framework.views import APIView

from owner.models import Owner
from todo.models import Task
from todo.serializers import TaskSerializer


class TaskListView(APIView):
    def get(self, request, username, format=None):
        """Get all of the tasks for a given user."""
        owner = get_object_or_404(Owner, user__username=username)
        tasks = Task.objects.filter(owner=owner).all()
        serialized = TaskSerializer(tasks, many=True)
        return JsonResponse({
            'username': username,
            'tasks': serialized.data
        })
```

这里一点代码里面有许多要说明的，让我们来看看吧。

我们从与我们一直使用的 `APIView` 的继承开始，为我们的视图奠定基础。我们覆盖了之前覆盖的相同 `get` 方法，添加了一个参数，允许我们的视图从传入的请求中接收 `username`。

然后我们的 `get` 方法将使用 `username` 来获取与该用户关联的 `Owner`。这个 `get_object_or_404` 函数允许我们这样做，添加一些特殊的东西以方便使用。

如果无法找到指定的用户，那么查找任务是没有意义的。实际上，我们想要返回 404 错误。`get_object_or_404` 根据我们传入的任何条件获取单个对象，并返回该对象或引发 [Http 404 异常][18]。我们可以根据对象的属性设置该条件。`Owner` 对象都通过 `user` 属性附加到 `User`。但是，我们没有要搜索的 `User` 对象，我们只有一个 `username`。所以，当你寻找一个 `Owner` 时，我们对 `get_object_or_404` 说：通过指定 `user__username`（这是两个下划线）来检查附加到它的 `User` 是否具有我想要的 `username`。通过 `QuerySet` 过滤时，这两个下划线表示 “此嵌套对象的属性”。这些属性可以根据需要进行深度嵌套。

我们现在拥有与给定用户名相对应的 `Owner`。我们使用 `Owner` 来过滤所有任务，只用 `Task.objects.filter` 检索它拥有的任务。我们可以使用与 `get_object_or_404` 相同的嵌套属性模式来钻入连接到 `Tasks` 的 `Owner` 的 `User`（`tasks = Task.objects.filter(owner__user__username = username)).all()`），但是没有必要那么宽松。

`Task.objects.filter(owner = owner).all()` 将为我们提供与我们的查询匹配的所有 `Task` 对象的`QuerySet`。很棒。然后，`TaskSerializer` 将获取 `QuerySet` 及其所有数据以及 `many = True` 标志，以通知其为项目集合而不是仅仅一个项目，并返回一系列序列化结果。实际上是一个词典列表。最后，我们使用 JSON 序列化数据和用于查询的用户名提供传出响应。

#### 处理 POST 请求

`post` 方法看起来与我们之前看到的有些不同。

```
# still in todo/views.py
# ...other imports...
from rest_framework.parsers import JSONParser
from datetime import datetime

class TaskListView(APIView):
    def get(self, request, username, format=None):
        ...

    def post(self, request, username, format=None):
        """Create a new Task."""
        owner = get_object_or_404(Owner, user__username=username)
        data = JSONParser().parse(request)
        data['owner'] = owner.id
        if data['due_date']:
            data['due_date'] = datetime.strptime(data['due_date'], '%d/%m/%Y %H:%M:%S')

        new_task = TaskSerializer(data=data)
        if new_task.is_valid():
            new_task.save()
            return JsonResponse({'msg': 'posted'}, status=201)

        return JsonResponse(new_task.errors, status=400)
```

当我们从客户端接收数据时，我们使用 `JSONParser().parse(request)` 将其解析为字典。我们将所有者添加到数据中并格式化任务的 `due_date`（如果存在）。

我们的 `TaskSerializer` 完成了繁重的任务。它首先接收传入的数据并将其转换为我们在模型上指定的字段。然后验证该数据以确保它适合指定的字段。如果附加到新 `Task` 的数据有效，它将使用该数据构造一个新的 `Task` 对象并将其提交给数据库。然后我们发回适当的“耶！我们做了一件新东西！”响应。如果没有，我们收集 `TaskSerializer` 生成的错误，并将这些错误发送回客户端，并返回 `400 Bad Request` 状态代码。

如果我们要构建 `put` 视图来更新 `Task`，它看起来会非常相似。主要区别在于，当我们实例化 `TaskSerializer` 时，我们将传递旧对象和该对象的新数据，如 `TaskSerializer(existing_task，data = data)`。我们仍然会进行有效性检查并发回我们想要发回的响应。

### 总结

Django 作为一个框架是高度可定制的，每个人都有自己打造 Django 项目的方式。我在这里写出来的方式不一定是 Django 建立项目的确切方式。它只是 a) 我熟悉的方式，以及 b) 利用 Django 的管理系统。当你将概念切分到不同的小块时，Django 项目的复杂性会增加。这样做是为了让多个人更容易为整个项目做出贡献，而不会麻烦彼此。

然而，作为 Django 项目的大量文件映射并不能使其更高效或自然地偏向于微服务架构。相反，它很容易成为一个令人困惑的独石应用，这可能对你的项目仍然有用，它也可能使你的项目难以管理，尤其是随着项目的增长。

仔细考虑你的需求并使用合适的工具来完成正确的工作。对于像这样的简单项目，Django 可能不是合适的工具。

Django 旨在处理多种模型，这些模型涵盖了不同的项目领域，但它们可能有一些共同点。这个项目是一个小型的双模型项目，有一些路由。即便我们把它构建更复杂，也只有七条路由，而仍然只是相同的两个模型。这还不足以证明一个完整的 Django 项目。

如果我们期望这个项目能够拓展，那么将会是一个很好的选择。这不是那种项目。这就是使用火焰喷射器来点燃蜡烛，绝对是大材小用了。

尽管如此，Web 框架就是一个 Web 框架，无论你使用哪个框架。它都可以接收请求并做出任何响应，因此你可以按照自己的意愿进行操作。只需要注意你选择的框架所带来的开销。

就是这样！我们已经到了这个系列的最后！我希望这是一次启发性的冒险。当你在考虑如何构建你的下一个项目时，它将帮助你做出的不仅仅是最熟悉的选择。请务必阅读每个框架的文档，以扩展本系列中涉及的任何内容（因为它没有那么全面）。每个人都有一个广阔的世界。愉快地写代码吧！


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/django-framework

作者：[Nicholas Hunt-Walker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[Bestony](https://github.com/bestony), [wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/nhuntwalker
[1]:https://opensource.com/article/18/5/pyramid-framework
[2]:https://opensource.com/article/18/4/flask
[3]:https://opensource.com/article/18/6/tornado-framework
[4]:https://www.djangoproject.com
[5]:https://djangopackages.org/
[6]:http://www.django-rest-framework.org/
[7]:http://gunicorn.org/
[8]:https://docs.pylonsproject.org/projects/waitress/en/latest/
[9]:https://uwsgi-docs.readthedocs.io/en/latest/
[10]:https://docs.djangoproject.com/en/2.0/ref/settings/#databases
[11]:https://pypi.org/project/dj-database-url/
[12]:http://yellerapp.com/posts/2015-01-12-the-worst-server-setup-you-can-make.html
[13]:https://docs.djangoproject.com/en/2.0/ref/settings/#std:setting-DATABASE-ENGINE
[14]:https://www.getpostman.com/
[15]:http://www.django-rest-framework.org/api-guide/serializers/#modelserializer
[16]:http://www.django-rest-framework.org/api-guide/serializers/
[17]:http://www.django-rest-framework.org/api-guide/serializers/#serializers
[18]:https://docs.djangoproject.com/en/2.0/topics/http/views/#the-http404-exception
