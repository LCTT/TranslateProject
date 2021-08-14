[#]: subject: (Enter invisible passwords using this Python module)
[#]: via: (https://opensource.com/article/21/7/invisible-passwords-python)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13579-1.html)

使用这个 Python 模块输入不可见的密码
======

> 用 GPG 和 Python 的 getpass 模块给你的密码多一层安全保障。

![](https://img.linux.net.cn/data/attachment/album/202107/14/101543fy6up6imco65mi68.jpg)

密码对程序员来说尤其重要。你不应该在不加密的情况下存储它们，而且你也不应该在用户输入密码的时候显示出输入的内容。当我决定要提高我的笔记本电脑的安全性时，这对我来说变得特别重要。我对我的家目录进行了加密，但当我登录后，任何以纯文本形式存储在配置文件中的密码都有可能暴露在偷窥者面前。

具体来说，我使用一个名为 [Mutt][2] 的应用作为我的电子邮件客户端。它可以让我在我的 Linux 终端中阅读和撰写电子邮件，但通常它希望在其配置文件中有一个密码。我限制了我的 Mutt 配置文件的权限，以便只有我可以看到它，我是我的笔记本电脑的唯一用户，所以我并不真的担心经过认证的用户会无意中看到我的配置文件。相反，我想保护自己，无论是为了吹嘘还是为了版本控制，不至于心不在焉地把我的配置发布到网上，把我的密码暴露了。此外，虽然我不希望我的系统上有不受欢迎的客人，但我确实想确保入侵者不能通过对我的配置上运行 `cat` 就获得我的密码。

### Python GnuPG

Python 模块 `python-gnupg` 是 `gpg` 应用的一个 Python 封装。该模块的名字是 `python-gnupg`，你不要把它和一个叫做 `gnupg` 的模块混淆。

[GnuPG][3]（GPG） 是 Linux 的默认加密系统，我从 2009 年左右开始使用它。我对它很熟悉，对它的安全性有很高的信任。

我决定将我的密码输入 Mutt 的最好方法是将我的密码存储在一个加密的 GPG 文件中，创建一个提示我的 GPG 密码来解锁这个加密文件，然后将密码交给 Mutt（实际上是交给 `offlineimap` 命令，我用它来同步我的笔记本和电子邮件服务器）。

[用 Python 获取用户输入][4] 是非常容易的。对 `input` 进行调用，无论用户输入什么，都会被存储为一个变量：

```
print("Enter password: ")
myinput = input()

print("You entered: ", myinput)
```

我的问题是，当我根据密码提示在终端上输入密码时，我所输入的所有内容对任何从我肩膀上看过去或滚动我的终端历史的人来说都是可见的：

```
$ ./test.py
Enter password: my-Complex-Passphrase
```

### 用 getpass 输入不可见密码

正如通常的情况一样，有一个 Python 模块已经解决了我的问题。这个模块是 `getpass4`，从用户的角度来看，它的行为和 `input` 完全一样，只是不显示用户输入的内容。

你可以用 [pip][5] 安装这两个模块：

```
$ python -m pip install --user python-gnupg getpass4
```

下面是我的 Python 脚本，用于创建密码提示：

```
#!/usr/bin/env python
# by Seth Kenlon
# GPLv3

# install deps:
# python3 -m pip install --user python-gnupg getpass4

import gnupg
import getpass
from pathlib import Path

def get_api_pass():
  homedir = str(Path.home())
  gpg = gnupg.GPG(gnupghome=os.path.join(homedir,".gnupg"), use_agent=True)
  passwd = getpass.getpass(prompt="Enter your GnuPG password: ", stream=None)

  with open(os.path.join(homedir,'.mutt','pass.gpg'), 'rb') as f:
    apipass = (gpg.decrypt_file(f, passphrase=passwd))

  f.close()

  return str(apipass)
 
if __name__ == "__main__":
  apipass = get_api_pass()
  print(apipass)
```

如果你想试试，把文件保存为 `password_prompt.py`。如果你使用 `offlineimap` 并想在你自己的密码输入中使用这个方案，那么把它保存到某个你可以在 `.offlineimaprc` 文件中指向 `offlineimap` 的位置（我使用 `~/.mutt/password_prompt.py`）。

### 测试密码提示

要查看脚本的运行情况，你首先必须创建一个加密文件（我假设你已经设置了 GPG）：

```
$ echo "hello world" &gt; pass
$ gpg --encrypt pass
$ mv pass.gpg ~/.mutt/pass.gpg
$ rm pass
```

现在运行 Python 脚本：

```
$ python ~/.mutt/password_prompt.py
Enter your GPG password:
hello world
```

当你输入时没有任何显示，但只要你正确输入 GPG 口令，你就会看到该测试信息。

### 将密码提示符与 offlineimap 整合起来

我需要将我的新提示与 `offlineimap` 命令结合起来。我为这个脚本选择了 Python，因为我知道 `offlineimap` 可以对 Python 程序进行调用。如果你是一个 `offlineimap` 用户，你会明白唯一需要的“整合”是在你的 `.offlineimaprc` 文件中改变两行。

首先，添加一行引用 Python 文件的内容:

```
pythonfile = ~/.mutt/password_prompt.py
```

然后将 `.offlineimaprc`中的 `remotepasseval` 行改为调用 `password_prompt.py`中的 `get_api_pass()` 函数:

```
remotepasseval = get_api_pass()
```

配置文件中不再有密码！

### 安全问题

在你的个人电脑上考虑安全问题有时会让人觉得很偏执。你的 SSH 配置是否真的需要限制为 600？隐藏在名为 `.mutt` 的无关紧要的电子邮件密码真的重要吗？也许不重要。

然而，知道我没有把敏感数据悄悄地藏在我的配置文件里，使我更容易把文件提交到公共 Git 仓库，把片段复制和粘贴到支持论坛，并以真实好用的配置文件的形式分享我的知识。仅就这一点而言，安全性的提高使我的生活更加轻松。而且有这么多好的 Python 模块可以提供帮助，这很容易实现。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/invisible-passwords-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/password.jpg?itok=ec6z6YgZ (Password lock)
[2]: http://www.mutt.org/
[3]: https://gnupg.org/
[4]: https://opensource.com/article/20/12/learn-python
[5]: https://opensource.com/article/19/11/python-pip-cheat-sheet
