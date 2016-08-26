5 个最受人喜爱的开源 Django 包
================================================================================

![Yearbook cover 2015](https://opensource.com/sites/default/files/styles/image-full-size/public/u23316/osdc-open-source-yearbook-lead8.png?itok=0_5-hdFE)

图片来源：Opensource.com

_Jacob Kaplan-Moss 和 Frank Wiles 也参与了本文的写作。_

Django 围绕“[可重用应用][1]”的思想建立：自包含的包提供了可重复使用的特性。你可以将这些可重用应用组装起来，在加上适用于你的网站的特定代码，来搭建你自己的网站。Django 具有一个丰富多样的、由可供你使用的可重用应用组建起来的生态系统——PyPI 列出了[超过 8000个 Django 应用][2]——可你该如何知道哪些是最好的呢？

为了节省你的时间，我们总结了五个最受喜爱的 Django 应用。它们是：

- [Cookiecutter][3]: 建立 Django 网站的最佳方式。
- [Whitenoise][4]: 最棒的静态资源服务器。
- [Django Rest Framework][5]: 使用 Django 开发 REST API 的最佳方式。
- [Wagtail][6]: 基于 Django 的最佳内容管理系统（CMS）。
- [django-allauth][7]: 提供社交账户登录的最佳应用（如 Twitter, Facebook, GitHub 等）。

我们同样推荐你看看 [Django Packages][8]，这是一个可重用 Django 应用的目录。Django Packages 将 Django 应用组织成“表格”，你可以在功能相似的不同应用之间进行比较并做出选择。你可以查看每个包中提供的特性和使用统计情况。（比如：这是[ REST 工具的表格][9]，也许可以帮助你理解我们为何推荐 Django REST Framework。

### 为什么你应该相信我们？

我们使用 Django 的时间几乎比任何人都长。在 Django 发布之前，我们当中的两个人（Frank 和 Jacob）就在 [Lawrence Journal-World][10] （Django 的发源地）工作（事实上，是他们两人推动了 Django 开源发布的进程）。我们在过去的八年当中运行着一个咨询公司，来建议公司怎样最好地应用 Django。

所以，我们见证了 Django 项目和社群的完整历史，我们见证了那些流行的软件包的兴起和没落。在我们三个之中，我们个人可能试用了 8000 个应用中至少一半以上，或者我们知道谁试用过这些。我们对如何使应用变得坚实可靠有着深刻的理解，并且我们对给予这些应用持久力量的来源也有着深入的了解。

### 建立 Django 网站的最佳方式：[Cookiecutter][3]

建立一个新项目或应用总是有些痛苦。你可以用 Django 内建的 `startproject`。不过，如果你像我们一样，对如何做事比较挑剔。Cookiecutter 为你提供了一个快捷简单的方式来构建项目或易于重用的应用模板，从而解决了这个问题。一个简单的例子：键入 `pip install cookiecutter`，然后在命令行中运行以下命令：

```bash
$ cookiecutter https://github.com/marcofucci/cookiecutter-simple-django
```

接下来你需要回答几个简单的问题，比如你的项目名称、目录（repo）、作者名字、E-Mail 和其他几个关于配置的小问题。这些能够帮你补充项目相关的细节。我们使用最最原始的 “_foo_” 作为我们的目录名称。所以 cokkiecutter 在子目录 “_foo_” 下建立了一个简单的 Django 项目。

如果你在 “_foo_” 项目中闲逛，你会看见你刚刚选择的其它设置已通过模板，连同所需的子目录一同嵌入到文件当中。这个“模板”在我们刚刚在执行 `cookiecutter` 命令时输入的唯一一个参数 Github 仓库 URL 中定义。这个样例工程使用了一个 Github 远程仓库作为模板；不过你也可以使用本地的模板，这在建立非重用项目时非常有用。

我们认为 cookiecutter 是一个极棒的 Django 包，但是，事实上其实它在面对纯 Python 甚至非 Python 相关需求时也极为有用。你能够将所有文件以一种可重复的方式精确地摆放在任何位置上，使得 cookiecutter 成为了一个简化（DRY）工作流程的极佳工具。

### 最棒的静态资源服务器：[Whitenoise][4]

多年来，托管网站的静态资源——图片、Javascript、CSS——都是一件很痛苦的事情。Django 内建的 [django.views.static.serve][11] 视图，就像 Django 文章所述的那样，“在生产环境中不可靠，所以只应为开发环境的提供辅助功能。”但使用一个“真正的” Web 服务器，如 NGINX 或者借助 CDN 来托管媒体资源，配置起来会比较困难。

Whitenoice 很简洁地解决了这个问题。它可以像在开发环境那样轻易地在生产环境中设置静态服务器，并且针对生产环境进行了加固和优化。它的设置方法极为简单：

1. 确保你在使用 Django 的 [contrib.staticfiles][12] 应用，并确认你在配置文件中正确设置了 `STATIC_ROOT` 变量。

2. 在 `wsgi.py` 文件中启用 Whitenoise:

   ```python
   from django.core.wsgi import get_wsgi_application
   from whitenoise.django import DjangoWhiteNoise

   application = get_wsgi_application()
   application = DjangoWhiteNoise(application)
   ```

配置它真的就这么简单！对于大型应用，你可能想要使用一个专用的媒体服务器和/或一个 CDN，但对于大多数小型或中型 Django 网站，Whitenoise 已经足够强大。

如需查看更多关于 Whitenoise 的信息，[请查看文档][13]。

### 开发 REST API 的最佳工具：[Django REST Framework][5]

REST API 正在迅速成为现代 Web 应用的标准功能。 API 就是简单的使用 JSON 对话而不是 HTML，当然你可以只用 Django 做到这些。你可以制作自己的视图，设置合适的 `Content-Type`，然后返回 JSON 而不是渲染后的 HTML 响应。这是在像 [Django Rest Framework][14]（下称 DRF）这样的 API 框架发布之前，大多数人所做的。

如果你对 Django 的视图类很熟悉，你会觉得使用 DRF 构建 REST API 与使用它们很相似，不过 DRF 只针对特定 API 使用场景而设计。一般的 API 设置只需要一点代码，所以我们没有提供一份让你兴奋的示例代码，而是强调了一些可以让你生活的更舒适的 DRF 特性：

* 可自动预览的 API 可以使你的开发和人工测试轻而易举。你可以查看 DRF 的[示例代码][15]。你可以查看 API 响应，并且不需要你做任何事就可以支持 POST/PUT/DELETE 类型的操作。
* 便于集成各种认证方式，如 OAuth, Basic Auth, 或API Tokens。
* 内建请求速率限制。
* 当与 [django-rest-swagger][16] 组合使用时，API 文档几乎可以自动生成。
* 广泛的第三方库生态。

当然，你可以不依赖 DRF 来构建 API，但我们无法想象你不去使用 DRF 的原因。就算你不使用 DRF 的全部特性，使用一个成熟的视图库来构建你自己的 API 也会使你的 API 更加一致、完全，更能提高你的开发速度。如果你还没有开始使用 DRF, 你应该找点时间去体验一下。

### 基于 Django 的最佳 CMS：[Wagtail][6]

Wagtail 是当下 Django CMS（内容管理系统）世界中最受人青睐的应用，并且它的热门有足够的理由。就像大多数的 CMS 一样，它具有极佳的灵活性，可以通过简单的 Django 模型来定义不同类型的页面及其内容。使用它，你可以从零开始在几个小时而不是几天之内来和建造一个基本可以运行的内容管理系统。举一个小例子，为你公司的员工定义一个员工页面类型可以像下面一样简单：

```python
from wagtail.wagtailcore.models import Page
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailadmin.edit_handlers import FieldPanel, MultiFieldPanel
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel 

class StaffPage(Page):
    name = models.CharField(max_length=100)
    hire_date = models.DateField()
    bio = models.RichTextField()
    email = models.EmailField()
    headshot = models.ForeignKey('wagtailimages.Image', null=True, blank=True) 
    content_panels = Page.content_panels + [
                                FieldPanel('name'),
                                FieldPanel('hire_date'),
                                FieldPanel('email'),
                                FieldPanel('bio',classname="full"),
                                ImageChoosePanel('headshot'),
                                ] 
```

然而，Wagtail 真正出彩的地方在于它的灵活性及其易于使用的现代化管理页面。你可以控制不同类型的页面在哪网站的哪些区域可以访问，为页面添加复杂的附加逻辑，还天生就支持标准的适应/审批工作流。在大多数 CMS 系统中，你会在开发时在某些点上遇到困难。而使用 Wagtail 时，我们经过不懈努力找到了一个突破口，使得让我们轻易地开发出一套简洁稳定的系统，使得程序完全依照我们的想法运行。如果你对此感兴趣，我们写了一篇[深入理解 Wagtail][17。

### 提供社交账户登录的最佳工具：[django-allauth][7]

django-allauth 是一个能够解决你的注册和认证需求的、可重用的 Django 应用。无论你需要构建本地注册系统还是社交账户注册系统，django-allauth 都能够帮你做到。

这个应用支持多种认证体系，比如用户名或电子邮件。一旦用户注册成功，它还可以提供从无需认证到电子邮件认证的多种账户验证的策略。同时，它也支持多种社交账户和电子邮件账户。它还支持插拔式注册表单，可让用户在注册时回答一些附加问题。

django-allauth 支持多于 20 种认证提供者，包括 Facebook、Github、Google 和 Twitter。如果你发现了一个它不支持的社交网站，很有可能通过第三方插件提供该网站的接入支持。这个项目还支持自定义后端，可以支持自定义的认证方式，对每个有定制认证需求的人来说这都很棒。

django-allauth 易于配置，且有[完善的文档][18]。该项目通过了很多测试，所以你可以相信它的所有部件都会正常运作。

你有最喜爱的 Django 包吗？请在评论中告诉我们。

### 关于作者

![Photo](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/main-one-i-use-everywhere.png?itok=66GC-D1q)

*Jeff Triplett 劳伦斯，堪萨斯州 <http://www.jefftriplett.com/>*

我在 2007 年搬到了堪萨斯州的劳伦斯，在 Django 的发源地—— Lawrence Journal-World 工作。我现在在劳伦斯市的 [Revolution Systems (Revsys)][19] 工作，做一位开发者兼顾问。

我是[北美 Django 运动基金会(DEFNA)][20]的联合创始人，2015 和 2016 年 [DjangoCon US][21] 的会议主席，而且我在 Django 的发源地劳伦斯参与组织了 [Django Birthday][22] 来庆祝 Django 的 10 岁生日。

我是当地越野跑小组的成员，我喜欢篮球，我还喜欢梦见自己随着一道气流游遍美国。

--------------------------------------------------------------------------------

via: https://opensource.com/business/15/12/5-favorite-open-source-django-packages

作者：[Jeff Triplett][a]
译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jefftriplett
[1]:https://docs.djangoproject.com/en/1.8/intro/reusable-apps/
[2]:https://pypi.python.org/pypi?:action=browse&c=523
[3]:https://github.com/audreyr/cookiecutter
[4]:http://whitenoise.evans.io/en/latest/base.html
[5]:http://www.django-rest-framework.org/
[6]:https://wagtail.io/
[7]:http://www.intenct.nl/projects/django-allauth/
[8]:https://www.djangopackages.com/
[9]:https://www.djangopackages.com/grids/g/rest/
[10]:http://www2.ljworld.com/news/2015/jul/09/happy-birthday-django/
[11]:https://docs.djangoproject.com/en/1.8/ref/views/#django.views.static.serve
[12]:https://docs.djangoproject.com/en/1.8/ref/contrib/staticfiles/
[13]:http://whitenoise.evans.io/en/latest/index.html
[14]:http://www.django-rest-framework.org/
[15]:http://restframework.herokuapp.com/
[16]:http://django-rest-swagger.readthedocs.org/en/latest/index.html
[17]:https://opensource.com/business/15/5/wagtail-cms
[18]:http://django-allauth.readthedocs.org/en/latest/
[19]:http://www.revsys.com/
[20]:http://defna.org/
[21]:https://2015.djangocon.us/
[22]:https://djangobirthday.com/
