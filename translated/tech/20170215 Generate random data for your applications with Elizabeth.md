使用 Elizabeth 为你的应用生成随机数据
============================================================


 ![Generate random data for your applications with Elizabeth](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/osdc_520x292_opendata_0613mm.png?itok=mzC0Tb28 "Generate random data for your applications with Elizabeth") 
图片提供 : Opensource.com

 _Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. _ 

不，我的文章没有被 [Lorem ipsum][2] 生成器劫持。对于本月的 Nooks＆Crannies 专栏，我发现了一个有趣的小 Python 库，以帮助开发人员为其应用程序生成随机数据。它被称为 [Elizabeth][3]。

它由 Líkið Geimfari 编写，并在 MIT 许可证下发行，Elizabeth 在 21 个不同地区设有一组 18 个数据提供器，它们可用于生成随机信息，包括姓名和个人特征、地址、文本数据、交通信息、网络和 Internet 社交媒体数据、数字等等。需要安装 [Python 3.2][4] 或更高版本，您可以使用 **pip** 或从 **git** 仓库安装它。

在我的测试机上，我在一个全新安装的 [Debian][5] Jessie 上使用 pip 来安装它。你要做的是 **apt-get install python3-pip**，它将安装 Python 和所需的依赖项。然后 **pip install elizabeth**，之后就安装好了。

只是为好玩，让我们在 Python 的交互式解释器中为一个人生成一些随机数据：

```
>>> from elizabeth import Personal
>>> p=Personal('en')
>>> p.full_name(gender="male")
'Elvis Herring'
>>> p.blood_type()
'B+'
>>> p.credit_card_expiration_date()
'09/17'
>>> p.email(gender='male')
'jessie7517@gmail.com'
>>> p.favorite_music_genre()
'Ambient'
>>> p.identifier(mask='13064########')
'1306420450944'
>>> p.sexual_orientation()
'Heterosexual'
>>> p.work_experience()
39
>>> p.occupation()
'Senior System Designer'
>>>
```

在代码中使用它就像创建一个对象那样，然后调用要填充数据的方法。

Elizabeth 有 18 种不同的生成工具，添加新的生成器并不困难; 你只需要定义从 JSON 值集合中获取数据的例程。这里是一些随机文本字符串生成，再次打开解释器：

```
>>> from elizabeth import Text
>>> t=Text('en')
>>> t.swear_word()
'Rat-fink'
>>> t.quote()
'Let them eat cake.'
>>> t.words(quantity=20)
['securities', 'keeps', 'accessibility', 'barbara', 'represent', 'hentai', 'flower', 'keys', 'rpm', 'queen', 'kingdom', 'posted', 'wearing', 'attend', 'stack', 'interface', 'quite', 'elementary', 'broadcast', 'holland']
>>> t.sentence()
'She spent her earliest years reading classic literature, and writing poetry.'
```

使用 Elizabeth 填充 [SQLite][6] 或其他可能需要开发或测试的数据库不是一个困难的练习。介绍文档给出了使用 [Flask][7] 这个轻量级 web 框架的医疗应用程序的示例。

我对 Elizabeth 印象很深刻 - 它超快、轻量级、易于扩展，它的社区虽然小，但是积极参与。截至本文写作时，已有 25 名贡献者提交，并且问题正在被迅速处理。Elizabeth 的[完整文档][8]至少对于美国英语而言易于阅读和遵循，并提供了广泛的 API 参考。

我曾尝试修改链接来找到文档是否有其他语言，但我没有成功。因为 API 在非英语区域中是不同的，所以记录这些变化将对用户非常有帮助。公平地说，阅读代码并找出可用的方法并不难，即使 Python-fu 不够强大。对我来说，另一个明显的缺陷是缺乏阿拉伯语或希伯来语区域测试数据。这些是著名的从右到左的语言，并且对于试图使其应用程序国际化的开发者，适当地处理这些语言是一个主要的障碍。像 Elizabeth 这种工具，可以协助这种努力是伟大的。

对于那些在应用中需要随机样本数据的开发员而言 Elizabeth 是一个有价值的工具，对于那些试图创建真正多语言、本地化的应用程序，它可能是一个宝藏。

--------------------------------------------------------------------------------

作者简介：

D Ruth Bavousett - D Ruth Bavousett 成为一名系统管理员和软件开发人员很长时间了，她最初专注在 VAX 11/780。她花了很多她的职业生涯（迄今为止）为图书馆的技术需求服务，自 2008 年以来一直是 Koha 开源库自动化套件的贡献者。Ruth 目前是休斯顿 cPanel 的  Perl开发人员，并养了两只猫。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/2/elizabeth-python-library

作者：[D Ruth Bavousett][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:https://opensource.com/article/17/2/elizabeth-python-library?rate=kuXZVuHCdEv_hrxRnK1YQctlsTJeFJLcVx3Nf2VIW38
[2]:https://en.wikipedia.org/wiki/Lorem_ipsum
[3]:https://github.com/lk-geimfari/elizabeth
[4]:https://www.python.org/
[5]:https://www.debian.org/
[6]:https://sqlite.org/
[7]:https://flask.pocoo.org/
[8]:http://elizabeth.readthedocs.io/en/latest/index.html
[9]:https://opensource.com/user/36051/feed
[10]:https://opensource.com/article/17/2/elizabeth-python-library#comments
[11]:https://opensource.com/users/druthb
