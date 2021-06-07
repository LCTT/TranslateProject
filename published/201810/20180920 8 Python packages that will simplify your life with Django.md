简化 Django 开发的八个 Python 包
======

> 这个月的 Python 专栏将介绍一些 Django 包，它们有益于你的工作，以及你的个人或业余项目。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/water-stone-balance-eight-8.png?itok=1aht_V5V)

Django 开发者们，在这个月的 Python 专栏中，我们会介绍一些能帮助你们的软件包。这些软件包是我们最喜欢的 [Django][1] 库，能够节省开发时间，减少样板代码，通常来说，这会让我们的生活更加轻松。我们为 Django 应用准备了六个包，为 Django 的 REST 框架准备了两个包。几乎所有我们的项目里，都用到了这些包，真的，不是说笑。

不过在继续阅读之前，请先看看我们关于[让 Django 管理后台更安全][2]的几个提示，以及这篇关于 [5 个最受欢迎的开源 Django 包][3] 的文章。

### 有用又省时的工具集合：django-extensions

[django-extensions][4] 这个 Django 包非常受欢迎，全是有用的工具，比如下面这些管理命令：

  * `shell_plus` 打开 Django 的管理 shell，这个 shell 已经自动导入了所有的数据库模型。在测试复杂的数据关系时，就不需要再从几个不同的应用里做导入操作了。
  * `clean_pyc` 删除项目目录下所有位置的 .pyc 文件 
  * `create_template_tags` 在指定的应用下，创建模板标签的目录结构。
  * `describe_form` 输出模型的表单定义，可以粘贴到 `forms.py` 文件中。（需要注意的是，这种方法创建的是普通 Django 表单，而不是模型表单。）
  * `notes` 输出你项目里所有带 TODO、FIXME 等标记的注释。

Django-extensions 还包括几个有用的抽象基类，在定义模型时，它们能满足常见的模式。当你需要以下模型时，可以继承这些基类：

  * `TimeStampedModel`：这个模型的基类包含了 `created` 字段和 `modified` 字段，还有一个 `save()` 方法，在适当的场景下，该方法自动更新 `created` 和 `modified` 字段的值。
  * `ActivatorModel`：如果你的模型需要像 `status`、`activate_date` 和 `deactivate_date` 这样的字段，可以使用这个基类。它还自带了一个启用 `.active()` 和 `.inactive()` 查询集的 manager。
  * `TitleDescriptionModel` 和 `TitleSlugDescriptionModel`：这两个模型包括了 `title` 和 `description` 字段，其中 `description` 字段还包括 `slug`，它根据 `title` 字段自动产生。

django-extensions 还有其他更多的功能，也许对你的项目有帮助，所以，去浏览一下它的[文档][5]吧！

### 12 因子应用的配置：django-environ

在 Django 项目的配置方面，[django-environ][6] 提供了符合  [12 因子应用][7] 方法论的管理方法。它是另外一些库的集合，包括 [envparse][8] 和 [honcho][9] 等。安装了 django-environ 之后，在项目的根目录创建一个 `.env` 文件，用这个文件去定义那些随环境不同而不同的变量，或者需要保密的变量。（比如 API 密钥，是否启用调试，数据库的 URL 等）

然后，在项目的 `settings.py` 中引入 `environ`，并参考[官方文档的例子][10]设置好 `environ.PATH()` 和 `environ.Env()`。就可以通过 `env('VARIABLE_NAME')` 来获取 `.env` 文件中定义的变量值了。

### 创建出色的管理命令：django-click

[django-click][11] 是基于 [Click][12] 的，（我们[之前推荐过][13]… [两次][14] Click)，它对编写 Django 管理命令很有帮助。这个库没有很多文档，但是代码仓库中有个存放[测试命令][15]的目录，非常有参考价值。 django-click 基本的 Hello World 命令是这样写的：

```
# app_name.management.commands.hello.py
import djclick as click

@click.command()
@click.argument('name')
def command(name):
    click.secho(f'Hello, {name}')
```

在命令行下调用它，这样执行即可：

```
>> ./manage.py hello Lacey
Hello, Lacey
```

### 处理有限状态机：django-fsm

[django-fsm][16] 给 Django 的模型添加了有限状态机的支持。如果你管理一个新闻网站，想用类似于“写作中”、“编辑中”、“已发布”来流转文章的状态，django-fsm 能帮你定义这些状态，还能管理状态变化的规则与限制。

Django-fsm 为模型提供了 FSMField 字段，用来定义模型实例的状态。用 django-fsm 的 `@transition` 修饰符，可以定义状态变化的方法，并处理状态变化的任何副作用。

虽然 django-fsm 文档很轻量，不过 [Django 中的工作流（状态）][17] 这篇 GitHub Gist 对有限状态机和 django-fsm 做了非常好的介绍。

### 联系人表单：#django-contact-form

联系人表单可以说是网站的标配。但是不要自己去写全部的样板代码，用 [django-contact-form][18] 在几分钟内就可以搞定。它带有一个可选的能过滤垃圾邮件的表单类（也有不过滤的普通表单类）和一个 `ContactFormView` 基类，基类的方法可以覆盖或自定义修改。而且它还能引导你完成模板的创建，好让表单正常工作。

### 用户注册和认证：django-allauth

[django-allauth][19] 是一个 Django 应用，它为用户注册、登录/注销、密码重置，还有第三方用户认证（比如 GitHub 或 Twitter）提供了视图、表单和 URL，支持邮件地址作为用户名的认证方式，而且有大量的文档记录。第一次用的时候，它的配置可能会让人有点晕头转向；请仔细阅读[安装说明][20]，在[自定义你的配置][21]时要专注，确保启用某个功能的所有配置都用对了。

### 处理 Django REST 框架的用户认证：django-rest-auth

如果 Django 开发中涉及到对外提供 API，你很可能用到了 [Django REST Framework][22]（DRF）。如果你在用 DRF，那么你应该试试 django-rest-auth，它提供了用户注册、登录/注销，密码重置和社交媒体认证的端点（是通过添加 django-allauth 的支持来实现的，这两个包协作得很好）。

### Django REST 框架的 API 可视化：django-rest-swagger

[Django REST Swagger][24] 提供了一个功能丰富的用户界面，用来和 Django REST 框架的 API 交互。你只需要安装 Django REST Swagger，把它添加到 Django 项目的已安装应用中，然后在 `urls.py` 中添加 Swagger 的视图和 URL 模式就可以了，剩下的事情交给 API 的 docstring 处理。 

![](https://opensource.com/sites/default/files/uploads/swagger-ui.png)

API 的用户界面按照 app 的维度展示了所有端点和可用方法，并列出了这些端点的可用操作，而且它提供了和 API 交互的功能（比如添加/删除/获取记录）。django-rest-swagger 从 API 视图中的 docstrings  生成每个端点的文档，通过这种方法，为你的项目创建了一份 API 文档，这对你，对前端开发人员和用户都很有用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/django-packages

作者：[Jeff Triplett][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[belitex](https://github.com/belitex)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/laceynwilliams
[1]: https://www.djangoproject.com/
[2]: https://opensource.com/article/18/1/10-tips-making-django-admin-more-secure
[3]: https://opensource.com/business/15/12/5-favorite-open-source-django-packages
[4]: https://django-extensions.readthedocs.io/en/latest/
[5]: https://django-extensions.readthedocs.io/
[6]: https://django-environ.readthedocs.io/en/latest/
[7]: https://www.12factor.net/
[8]: https://github.com/rconradharris/envparse
[9]: https://github.com/nickstenning/honcho
[10]: https://django-environ.readthedocs.io/
[11]: https://github.com/GaretJax/django-click
[12]: http://click.pocoo.org/5/
[13]: https://opensource.com/article/18/9/python-libraries-side-projects
[14]: https://opensource.com/article/18/5/3-python-command-line-tools
[15]: https://github.com/GaretJax/django-click/tree/master/djclick/test/testprj/testapp/management/commands
[16]: https://github.com/viewflow/django-fsm
[17]: https://gist.github.com/Nagyman/9502133
[18]: https://django-contact-form.readthedocs.io/en/1.5/
[19]: https://django-allauth.readthedocs.io/en/latest/
[20]: https://django-allauth.readthedocs.io/en/latest/installation.html
[21]: https://django-allauth.readthedocs.io/en/latest/configuration.html
[22]: http://www.django-rest-framework.org/
[23]: https://django-rest-auth.readthedocs.io/
[24]: https://django-rest-swagger.readthedocs.io/en/latest/
