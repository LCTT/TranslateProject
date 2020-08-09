[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to write a Python web API with Django)
[#]: via: (https://opensource.com/article/19/11/python-web-api-django)
[#]: author: (Rachel Waston https://opensource.com/users/rachelwaston)

如何借助 Django 来编写一个 Python Web API
======

> Django 是 Python API 开发中最流行的框架之一，在这个教程中，我们来学习如何使用它。

![](https://img.linux.net.cn/data/attachment/album/202001/11/142503aio2325mk5weiozz.jpg)

[Django][2] 所有 Web 框架中最全面的，也是最受欢迎的一个。自 2005 年以来，其流行度大幅上升。

Django 是由 Django 软件基金会维护，并且获得了社区的大力支持，在全球拥有超过 11,600 名成员。在 Stack Overflow 上，约有 191,000 个带 Django 标签的问题。Spotify、YouTube 和 Instagram 等都使用 Django 来构建应用程序和数据管理。

本文演示了一个简单的 API，通过它可以使用 HTTP 协议的 GET 方法来从服务器获取数据。

### 构建一个项目

首先，为你的 Django 应用程序创建一个目录结构，你可以在系统的任何位置创建：

```
$ mkdir myproject
$ cd myproject
```

然后，在项目目录中创建一个虚拟环境来隔离本地包依赖关系：

```
$ python3 -m venv env
$ source env/bin/activate
```

在 Windows 上，使用命令 `env\Scripts\activate` 来激活虚拟环境。

### 安装 Django 和 Django REST framework

然后，安装 Django 和 Django REST 模块：

```
$ pip3 install django
$ pip3 install djangorestframework
```

### 实例化一个新的 Django 项目

现在你的应用程序已经有了一个工作环境，你必须实例化一个新的 Django 项目。与 [Flask][3] 这样微框架不同的是，Django 有专门的命令来创建（注意第一条命令后的 `.` 字符）。

```
$ django-admin startproject tutorial .
$ cd tutorial
$ django-admin startapp quickstart
```

Django 使用数据库来管理后端，所以你应该在开始开发之前同步数据库，数据库可以通过 `manage.py` 脚本管理，它是在你运行 `django-admin` 命令时创建的。因为你现在在 `tutorial` 目录，所以使用 `../` 符号来运行脚本，它位于上一层目录：

```
$ python3 ../manage.py makemigrations
No changes detected
$ python4 ../manage.py migrate
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, sessions
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
  Applying admin.0002_logentry_remove_auto_add... OK
  Applying admin.0003_logentry_add_action_flag_choices... OK
  Applying contenttypes.0002_remove_content_type_name... OK
  Applying auth.0002_alter_permission_name_max_length... OK
  Applying auth.0003_alter_user_email_max_length... OK
  Applying auth.0004_alter_user_username_opts... OK
  Applying auth.0005_alter_user_last_login_null... OK
  Applying auth.0006_require_contenttypes_0002... OK
  Applying auth.0007_alter_validators_add_error_messages... OK
  Applying auth.0008_alter_user_username_max_length... OK
  Applying auth.0009_alter_user_last_name_max_length... OK
  Applying auth.0010_alter_group_name_max_length... OK
  Applying auth.0011_update_proxy_permissions... OK
  Applying sessions.0001_initial... OK
```

### 在 Django 中创建用户

创建一个名为 `admin`，示例密码为 `password123` 的初始用户：

```
$ python3 ../manage.py createsuperuser \
  --email admin@example.com \
  --username admin
```

在提示时创建密码。

### 在 Django 中实现序列化和视图

为了使 Django 能够将信息传递给 HTTP GET 请求，必须将信息对象转化为有效的响应数据。Django 为此实现了“序列化类” `serializers`。

在你的项目中，创建一个名为 `quickstart/serializers.py` 的新模块，使用它来定义一些序列化器，模块将用于数据展示：

```
from django.contrib.auth.models import User, Group
from rest_framework import serializers

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']

class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']
```

Django 中的[视图][5]是一个接受 Web 请求并返回 Web 响应的函数。响应可以是 HTML、HTTP 重定向、HTTP 错误、JSON 或 XML 文档、图像或 TAR 文件，或者可以是从 Internet 获得的任何其他内容。要创建视图，打开 `quickstart/views.py` 并输入以下代码。该文件已经存在，并且其中包含一些示例文本，保留这些文本并将以下代码添加到文件中：

```
from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from tutorial.quickstart.serializers import UserSerializer, GroupSerializer

class UserViewSet(viewsets.ModelViewSet):
    """
    API 允许查看或编辑用户
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer

class GroupViewSet(viewsets.ModelViewSet):
    """
    API 允许查看或编辑组
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
```

### 使用 Django 生成 URL

现在，你可以生成 URL 以便人们可以访问你刚起步的 API。在文本编辑器中打开 `urls.py` 并将默认示例代码替换为以下代码：

```
from django.urls import include, path
from rest_framework import routers
from tutorial.quickstart import views

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'groups', views.GroupViewSet)

# 使用自动路由 URL
# 还有登录 URL
urlpatterns = [
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]
```

### 调整你的 Django 项目设置

这个示例项目的设置模块存储在 `tutorial/settings.py` 中，因此在文本编辑器中将其打开，然后在 `INSTALLED_APPS` 列表的末尾添加 `rest_framework`：

```
INSTALLED_APPS = [
    ...
    'rest_framework',
]
```

### 测试 Django API

现在，你可以测试构建的 API。首先，从命令行启动内置服务器：

```
$ python3 manage.py runserver
```

你可以通过使用 `curl` 导航至 URL `http://localhost:8000/users` 来访问 API：

```
$ curl --get http://localhost:8000/users/?format=json
[{"url":"http://localhost:8000/users/1/?format=json","username":"admin","email":"admin@example.com","groups":[]}]
```

使用 Firefox 或你选择的[开源浏览器][6]：

![一个简单的 Django API][7]

有关使用 Django 和 Python 的 RESTful API 的更多深入知识，参考出色的 [Django 文档][8]。

### 为什么要使用 Djago？

Django 的主要优点：

  1. Django 社区的规模正在不断扩大，因此即使你做一个复杂项目，也会有大量的指导资源。
  2. 默认包含模板、路由、表单、身份验证和管理工具等功能，你不必寻找外部工具，也不必担心第三方工具会引入兼容性问题。
  3. 用户、循环和条件的简单结构使你可以专注于编写代码。
  4. 这是一个成熟且经过优化的框架，它非常快速且可靠。

Django 的主要缺点：

  1. Django 很复杂！从开发人员视角的角度来看，它可能比简单的框架更难学。
  2. Django 有一个很大的生态系统。一旦你熟悉它，这会很棒，但是当你深入学习时，它可能会令人感到无所适从。

对你的应用程序或 API 来说，Django 是绝佳选择。下载并熟悉它，开始开发一个迷人的项目！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/python-web-api-django

作者：[Rachel Waston][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rachelwaston
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://www.djangoproject.com/
[3]: https://opensource.com/article/19/11/python-web-api-flask
[4]: mailto:admin@example.com
[5]: https://docs.djangoproject.com/en/2.2/topics/http/views/
[6]: https://opensource.com/article/19/7/open-source-browsers
[7]: https://opensource.com/sites/default/files/uploads/django-api.png (A simple Django API)
[8]: https://docs.djangoproject.com/en/2.2
