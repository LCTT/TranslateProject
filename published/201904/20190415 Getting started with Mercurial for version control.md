[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10780-1.html)
[#]: subject: (Getting started with Mercurial for version control)
[#]: via: (https://opensource.com/article/19/4/getting-started-mercurial)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Mercurial 版本控制入门
======

> 了解 Mercurial 的基础知识，它是一个用 Python 写的分布式版本控制系统。

![][1]

[Mercurial][2] 是一个用 Python 编写的分布式版本控制系统。因为它是用高级语言编写的，所以你可以用 Python 函数编写一个 Mercurial 扩展。

在[官方文档中][3]说明了几种安装 Mercurial 的方法。我最喜欢的一种方法不在里面：使用 `pip`。这是开发本地扩展的最合适方式！

目前，Mercurial 仅支持 Python 2.7，因此你需要创建一个 Python 2.7 虚拟环境：

```
python2 -m virtualenv mercurial-env
./mercurial-env/bin/pip install mercurial
```

为了让命令简短一些，以及满足人们对化学幽默的渴望，该命令称之为 `hg`。

```
$ source mercurial-env/bin/activate
(mercurial-env)$ mkdir test-dir
(mercurial-env)$ cd test-dir
(mercurial-env)$ hg init
(mercurial-env)$ hg status
(mercurial-env)$
```

由于还没有任何文件，因此状态为空。添加几个文件：

```
(mercurial-env)$ echo 1 > one
(mercurial-env)$ echo 2 > two
(mercurial-env)$ hg status
? one
? two
(mercurial-env)$ hg addremove
adding one
adding two
(mercurial-env)$ hg commit -m 'Adding stuff'
(mercurial-env)$ hg log
changeset: 0:1f1befb5d1e9
tag: tip
user: Moshe Zadka <[moshez@zadka.club][4]>
date: Fri Mar 29 12:42:43 2019 -0700
summary: Adding stuff
```

`addremove` 命令很有用：它将任何未被忽略的新文件添加到托管文件列表中，并移除任何已删除的文件。

如我所说，Mercurial 扩展用 Python 写成，它们只是常规的 Python 模块。

这是一个简短的 Mercurial 扩展示例：

```
from mercurial import registrar
from mercurial.i18n import _

cmdtable = {}
command = registrar.command(cmdtable)

@command('say-hello',
[('w', 'whom', '', _('Whom to greet'))])
def say_hello(ui, repo, `opts):
ui.write("hello ", opts['whom'], "\n")
```

简单的测试方法是将它手动加入虚拟环境中的文件中：

```
`$ vi ../mercurial-env/lib/python2.7/site-packages/hello_ext.py`
```

然后你需要*启用*扩展。你可以仅在当前仓库中启用它：

```
$ cat >> .hg/hgrc
[extensions]
hello_ext =
```

现在，问候有了：

```
(mercurial-env)$ hg say-hello --whom world
hello world
```

大多数扩展会做更多有用的东西，甚至可能与 Mercurial 有关。 `repo` 对象是 `mercurial.hg.repository` 的对象。

有关 Mercurial API 的更多信息，请参阅[官方文档][5]。并访问[官方仓库][6]获取更多示例和灵感。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/getting-started-mercurial

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_cloud21x_cc.png?itok=5UwC92dO
[2]: https://www.mercurial-scm.org/
[3]: https://www.mercurial-scm.org/wiki/UnixInstall
[4]: mailto:moshez@zadka.club
[5]: https://www.mercurial-scm.org/wiki/MercurialApi#Repositories
[6]: https://www.mercurial-scm.org/repo/hg/file/tip/hgext
