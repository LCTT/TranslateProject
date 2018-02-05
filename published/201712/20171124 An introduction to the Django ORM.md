Django ORM 简介
============================================================

> 学习怎么去使用 Python 的 web 框架中的对象关系映射与你的数据库交互，就像你使用 SQL 一样。


![Getting to know the Django ORM](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-spider-frame-framework.png?itok=Rl2AG2Dc "Getting to know the Django ORM")


你可能听说过 [Django][12]，它是一个被称为“完美主义者的最后期限” 的 Python web 框架。它是一匹 [可爱的小矮马][13]。

Django 的一个强大的功能是它的<ruby>对象关系映射<rt>Object-Relational Mapper</rt></ruby>（ORM），它允许你就像使用 SQL 一样去和你的数据库交互。事实上，Django 的 ORM 就是创建 SQL 去查询和操作数据库的一个 Python 式方式，并且获得 Python 风格的结果。 我说的_是_一种方式，但实际上，它是一种非常聪明的工程方法，它利用了 Python 中一些很复杂的部分，而使得开发者更加轻松。

在我们开始去了解 ORM 是怎么工作之前，我们需要一个可以操作的数据库。和任何一个关系型数据库一样，我们需要去定义一堆表和它们的关系（即，它们相互之间联系起来的方式)。让我们使用我们熟悉的东西。比如说，我们需要去建模一个有博客文章和作者的博客。每个作者有一个名字。一位作者可以有很多的博客文章。一篇博客文章可以有很多的作者、标题、内容和发布日期。

在 Django 村里，这个文章和作者的概念可以被称为博客应用。在这个语境中，一个应用是一个自包含一系列描述我们的博客行为和功能的模型和视图的集合。用正确的方式打包，以便于其它的 Django 项目可以使用我们的博客应用。在我们的项目中，博客正是其中的一个应用。比如，我们也可以有一个论坛应用。但是，我们仍然坚持我们的博客应用的原有范围。

这是为这个教程事先准备的 `models.py`：

```
from django.db import models

class Author(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Post(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    published_date = models.DateTimeField(blank=True, null=True)
    author = models.ManyToManyField(Author, related_name="posts")

    def __str__(self):
        return self.title
```

现在，看上去似乎有点令人恐惧，因此，我们把它分解来看。我们有两个模型：作者（`Author`）和文章（`Post`）。它们都有名字（`name`）或者标题（`title`）。文章有个放内容的大的文本字段，以及用于发布时间和日期的 `DateTimeField`。文章也有一个 `ManyToManyField`，它同时链接到文章和作者。

大多数的教程都是从头开始的，但是，在实践中并不会发生这种情况。实际上，你会得到一堆已存在的代码，就像上面的 `model.py` 一样，而你必须去搞清楚它们是做什么的。

因此，现在你的任务是去进入到应用程序中去了解它。做到这一点有几种方法，你可以登入到 [Django admin][14]，这是一个 Web 后端，它会列出全部的应用和操作它们的方法。我们先退出它，现在我们感兴趣的东西是 ORM。

我们可以在 Django 项目的主目录中运行 `python manage.py shell` 去访问 ORM。

```
/srv/web/django/ $ python manage.py shell

Python 3.6.3 (default, Nov  9 2017, 15:58:30)
[GCC 4.2.1 Compatible Apple LLVM 9.0.0 (clang-900.0.38)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>>
```

这将带我们进入到交互式控制台。[`shell` 命令][15] 为我们做了很多设置，包括导入我们的设置和配置 Django 环境。虽然我们启动了 shell，但是，在我们导入它之前，我们并不能访问我们的博客模型。

```
>>> from blog.models import *
```

它导入了全部的博客模型，因此，我们可以玩我们的博客了。

首先，我们列出所有的作者：

```
>>> Author.objects.all()
```

我们将从这个命令取得结果，它是一个 `QuerySet`，它列出了我们所有的作者对象。它不会充满我们的整个控制台，因为，如果有很多查询结果，Django 将自动截断输出结果。

```
>>> Author.objects.all()
<QuerySet [<Author: VM (Vicky) Brasseur>, <Author: Rikki Endsley>,
 <Author: Jen Wike Huger>, '...(remaining elements truncated)...']
```

我们可以使用 `get` 代替 `all` 去检索单个作者。但是，我们需要一些更多的信息才能 `get` 一个单个记录。在关系型数据库中，表有一个主键，它唯一标识了表中的每个记录，但是，作者名并不唯一。许多人都 [重名][16]，因此，它不是唯一约束的好选择。解决这个问题的一个方法是使用一个序列（1、2、3 ……）或者一个通用唯一标识符（UUID）作为主键。但是，因为它对人类并不好用，我们可以通过使用 `name` 来操作我们的作者对象。

```
>>> Author.objects.get(name="VM (Vicky) Brasseur")
<Author: VM (Vicky) Brasseur>
```

到现在为止，我们已经有了一个我们可以交互的对象，而不是一个 `QuerySet` 列表。我们现在可以与这个 Python 对象进行交互了，使用任意一个表列做为属性去查看对象。

```
>>> vmb = Author.objects.get(name="VM (Vicky) Brasseur")
>>> vmb.name
u'VM (Vicky) Brasseur'
```

然后，很酷的事件发生了。通常在关系型数据库中，如果我们希望去展示其它表的信息，我们需要去写一个 `LEFT JOIN`，或者其它的表耦合函数，并确保它们之间有匹配的外键。而 Django 可以为我们做到这些。

在我们的模型中，由于作者写了很多的文章，因此，我们的作者对象可以检索他自己的文章。

```
>>> vmb.posts.all()
QuerySet[<Post: "7 tips for nailing your job interview">,
 <Post: "5 tips for getting the biggest bang for your cover letter buck">,
 <Post: "Quit making these 10 common resume mistakes">,
 '...(remaining elements truncated)...']
```

我们可以使用正常的 Python 式的列表操作方式来操作 `QuerySets`。

```
>>> for post in vmb.posts.all():
...   print(post.title)
...
7 tips for nailing your job interview
5 tips for getting the biggest bang for your cover letter buck
Quit making these 10 common resume mistakes
```

要实现更复杂的查询，我们可以使用过滤得到我们想要的内容。这有点复杂。在 SQL 中，你可以有一些选项，比如，`like`、`contains` 和其它的过滤对象。在 ORM 中这些事情也可以做到。但是，是通过 _特别的_ 方式实现的：是通过使用一个隐式（而不是显式）定义的函数实现的。

如果在我的 Python 脚本中调用了一个函数 `do_thing()`，我会期望在某个地方有一个匹配的 `def do_thing`。这是一个显式的函数定义。然而，在 ORM 中，你可以调用一个 _不显式定义的_  函数。之前，我们使用 `name` 去匹配一个名字。但是，如果我们想做一个子串搜索，我们可以使用 `name__contains`。

```
>>> Author.objects.filter(name__contains="Vic")
QuerySet[<Author: VM (Vicky) Brasseur>, <Author: Victor Hugo">]
```

现在，关于双下划线（`__`）我有一个小小的提示。这些是 Python _特有的_。在 Python 的世界里，你可以看到如 `__main__` 或者 `__repr__`。这些有时被称为 `dunder methods`，是 “<ruby>双下划线<rt>double underscore</rt></ruby>” 的缩写。仅有几个非字母数字的字符可以被用于 Python 中的对象名字；下划线是其中的一个。这些在 ORM 中被用于显式分隔<ruby>过滤关键字<rt>filter key name</rt></ruby>的各个部分。在底层，字符串用这些下划线分割开，然后这些标记分开处理。`name__contains` 被替换成 `attribute: name, filter: contains`。在其它编程语言中，你可以使用箭头代替，比如，在 PHP 中是 `name->contains`。不要被双下划线吓着你，正好相反，它们是 Python 的好帮手（并且如果你斜着看，你就会发现它看起来像一条小蛇，想去帮你写代码的小蟒蛇）。

ORM 是非常强大并且是 Python 特有的。不过，还记得我在上面提到过的 Django 的管理网站吗？

![Django Admin](https://opensource.com/sites/default/files/u128651/django-admin.png "Django Admin")

Django 的其中一个非常精彩的用户可访问特性是它的管理界面，如果你定义你的模型，你将看到一个非常好用的基于 web 的编辑门户，而且它是免费的。

ORM，有多强大？

![Authors list in Django Admin](https://opensource.com/sites/default/files/u128651/django-admin-author.png "Authors list in Django Admin")

好吧！给你一些代码去创建最初的模型，Django 就变成了一个基于 web 的门户，它是非常强大的，它可以使用我们前面用过的同样的原生函数。默认情况下，这个管理门户只有基本的东西，但这只是在你的模型中添加一些定义去改变外观的问题。例如，在早期的这些 `__str__` 方法中，我们使用这些去定义作者对象应该有什么？（在这种情况中，比如，作者的名字），做了一些工作后，你可以创建一个界面，让它看起来像一个内容管理系统，以允许你的用户去编辑他们的内容。（例如，为一个标记为 “已发布” 的文章，增加一些输入框和过滤）。

如果你想去了解更多内容，[Django 美女的教程][17] 中关于 [the ORM][18] 的节有详细的介绍。在 [Django project website][19] 上也有丰富的文档。

（题图  [Christian Holmér][10]，Opensource.com 修改. [CC BY-SA 4.0][11]）

--------------------------------------------------------------------------------

作者简介：

Katie McLaughlin - Katie 在过去的这几年有许多不同的头衔，她以前是使用多种语言的一位软件开发人员，多种操作系统的系统管理员，和多个不同话题的演讲者。当她不改变 “世界” 的时候，她也去享受烹饪、挂毯艺术，和去研究各种应用程序栈怎么去处理 emoji。

------------------------

via: https://opensource.com/article/17/11/django-orm

作者：[Katie McLaughlin][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/glasnt
[1]:https://opensource.com/resources/python?intcmp=7016000000127cYAAQ
[2]:https://opensource.com/resources/python/ides?intcmp=7016000000127cYAAQ
[3]:https://opensource.com/resources/python/gui-frameworks?intcmp=7016000000127cYAAQ
[4]:https://opensource.com/tags/python?intcmp=7016000000127cYAAQ
[5]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ
[6]:https://opensource.com/file/377811
[7]:https://opensource.com/file/377816
[8]:https://opensource.com/article/17/11/django-orm?rate=iwO0q67yiUUPweMIMoyLbbYyhK5RTOOzEtyiNkJ0eBE
[9]:https://opensource.com/user/41661/feed
[10]:https://www.flickr.com/people/crsan/
[11]:https://creativecommons.org/licenses/by-sa/4.0/
[12]:https://www.djangoproject.com/
[13]:http://www.djangopony.com/
[14]:https://docs.djangoproject.com/en/1.11/ref/contrib/admin/
[15]:https://docs.djangoproject.com/en/1.11/ref/django-admin/#shell
[16]:https://2016.katieconf.xyz/
[17]:https://djangogirls.org/
[18]:https://tutorial.djangogirls.org/en/django_orm/
[19]:https://docs.djangoproject.com/en/1.11/topics/db/
[20]:https://opensource.com/users/glasnt
[21]:https://opensource.com/users/glasnt
[22]:https://opensource.com/article/17/11/django-orm#comments
