[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Mercurial for version control)
[#]: via: (https://opensource.com/article/19/4/getting-started-mercurial)
[#]: author: (Moshe Zadka (Community Moderator) https://opensource.com/users/moshez)

Getting started with Mercurial for version control
======
Learn the basics of Mercurial, a distributed version control system
written in Python.
![][1]

[Mercurial][2] is a distributed version control system written in Python. Because it's written in a high-level language, you can write a Mercurial extension with a few Python functions.

There are several ways to install Mercurial, which are explained in the [official documentation][3]. My favorite one is not there: using **pip**. This is the most amenable way to develop local extensions!

For now, Mercurial only supports Python 2.7, so you will need to create a Python 2.7 virtual environment:


```
python2 -m virtualenv mercurial-env
./mercurial-env/bin/pip install mercurial
```

To have a short command, and to satisfy everyone's insatiable need for chemistry-based humor, the command is called **hg**.


```
$ source mercurial-env/bin/activate
(mercurial-env)$ mkdir test-dir
(mercurial-env)$ cd test-dir
(mercurial-env)$ hg init
(mercurial-env)$ hg status
(mercurial-env)$
```

The status is empty since you do not have any files. Add a couple of files:


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

The **addremove** command is useful: it adds any new files that are not ignored to the list of managed files and removes any files that have been removed.

As I mentioned, Mercurial extensions are written in Python—they are just regular Python modules.

This is an example of a short Mercurial extension:


```
from mercurial import registrar
from mercurial.i18n import _

cmdtable = {}
command = registrar.command(cmdtable)

@command('say-hello',
[('w', 'whom', '', _('Whom to greet'))])
def say_hello(ui, repo, **opts):
ui.write("hello ", opts['whom'], "\n")
```

A simple way to test it is to put it in a file in the virtual environment manually:


```
`$ vi ../mercurial-env/lib/python2.7/site-packages/hello_ext.py`
```

Then you need to _enable_ the extension. You can start by enabling it only in the current repository:


```
$ cat >> .hg/hgrc
[extensions]
hello_ext =
```

Now, a greeting is possible:


```
(mercurial-env)$ hg say-hello --whom world
hello world
```

Most extensions will do more useful stuff—possibly even things to do with Mercurial. The **repo** object is a **mercurial.hg.repository** object.

Refer to the [official documentation][5] for more about Mercurial's API. And visit the [official repo][6] for more examples and inspiration.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/getting-started-mercurial

作者：[Moshe Zadka (Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_cloud21x_cc.png?itok=5UwC92dO
[2]: https://www.mercurial-scm.org/
[3]: https://www.mercurial-scm.org/wiki/UnixInstall
[4]: mailto:moshez@zadka.club
[5]: https://www.mercurial-scm.org/wiki/MercurialApi#Repositories
[6]: https://www.mercurial-scm.org/repo/hg/file/tip/hgext
