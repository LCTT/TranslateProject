如何轻松地寻找 GitHub 上超棒的项目和资源
======

![](https://www.ostechnix.com/wp-content/uploads/2017/09/Awesome-finder-Find-Awesome-Projects-720x340.png)

在 GitHub 网站上每天都会新增上百个项目。由于 GitHub 上有成千上万的项目，要在上面搜索好的项目简直要累死人。好在，有那么一伙人已经创建了一些这样的列表。其中包含的类别五花八门，如编程、数据库、编辑器、游戏、娱乐等。这使得我们寻找在 GitHub 上托管的项目、软件、资源、库、书籍等其他东西变得容易了很多。有一个 GitHub 用户更进了一步，创建了一个名叫 `Awesome-finder` 的命令行工具，用来在 awesome 系列的仓库中寻找超棒的项目和资源。该工具可以让我们不需要离开终端（当然也就不需要使用浏览器了）的情况下浏览 awesome 列表。

在这篇简单的说明中，我会向你演示如何方便地在类 Unix 系统中浏览 awesome 列表。

### Awesome-finder - 方便地寻找 GitHub 上超棒的项目和资源

#### 安装 Awesome-finder

使用 `pip` 可以很方便地安装该工具，`pip` 是一个用来安装使用 Python 编程语言开发的程序的包管理器。

在 Arch Linux 及其衍生发行版中（比如 Antergos，Manjaro Linux），你可以使用下面命令安装 `pip`：

```
sudo pacman -S python-pip
```

在 RHEL，CentOS 中：

```
sudo yum install epel-release
```
```
sudo yum install python-pip
```

在 Fedora 上：

```
sudo dnf install epel-release
sudo dnf install python-pip
```

在 Debian，Ubuntu，Linux Mint 上：

```
sudo apt-get install python-pip
```

在 SUSE，openSUSE 上：
```
sudo zypper install python-pip
```

`pip` 安装好后，用下面命令来安装 'Awesome-finder'。

```
sudo pip install awesome-finder
```

#### 用法

Awesome-finder 会列出 GitHub 网站中如下这些主题（其实就是仓库）的内容：

  * awesome
  * awesome-android
  * awesome-elixir
  * awesome-go
  * awesome-ios
  * awesome-java
  * awesome-javascript
  * awesome-php
  * awesome-python
  * awesome-ruby
  * awesome-rust
  * awesome-scala
  * awesome-swift

该列表会定期更新。

比如，要查看 `awesome-go` 仓库中的列表，只需要输入：

```
awesome go
```

你就能看到用 “Go” 写的所有流行的东西了，而且这些东西按字母顺序进行了排列。

![][2]

你可以通过 上/下 箭头在列表中导航。一旦找到所需要的东西，只需要选中它，然后按下回车键就会用你默认的 web 浏览器打开相应的链接了。

类似的，

  * `awesome android` 命令会搜索 awesome-android 仓库。
  * `awesome awesome` 命令会搜索  awesome 仓库。
  * `awesome elixir` 命令会搜索 awesome-elixir。
  * `awesome go` 命令会搜索 awesome-go。
  * `awesome ios` 命令会搜索 awesome-ios。
  * `awesome java` 命令会搜索 awesome-java。
  * `awesome javascript` 命令会搜索 awesome-javascript。
  * `awesome php` 命令会搜索 awesome-php。
  * `awesome python` 命令会搜索 awesome-python。
  * `awesome ruby` 命令会搜索 awesome-ruby。
  * `awesome rust` 命令会搜索 awesome-rust。
  * `awesome scala` 命令会搜索 awesome-scala。
  * `awesome swift` 命令会搜索 awesome-swift。

而且，它还会随着你在提示符中输入的内容而自动进行筛选。比如，当我输入 `dj` 后，他会显示与 Django 相关的内容。

![][3]

若你想从最新的 `awesome-<topic>`( 而不是用缓存中的数据) 中搜索，使用 `-f` 或 `-force` 标志：

```
awesome <topic> -f (--force)
```

像这样：

```
awesome python -f
```

或，

```
awesome python --force
```

上面命令会显示 awesome-python GitHub 仓库中的列表。

很棒，对吧？

要退出这个工具的话，按下 ESC 键。要显示帮助信息，输入：

```
awesome -h
```

本文至此就结束了。希望本文能对你产生帮助。如果你觉得我们的文章对你有帮助，请将他们分享到你的社交网络中去，造福大众。我们马上还有其他好东西要来了。敬请期待！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/

作者：[SK][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_008-1.png 
[3]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_009.png 
[4]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=reddit (Click to share on Reddit)
[5]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=twitter (Click to share on Twitter)
[6]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=facebook (Click to share on Facebook)
[7]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=google-plus-1 (Click to share on Google+)
[8]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=linkedin (Click to share on LinkedIn)
[9]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=pocket (Click to share on Pocket)
[10]:whatsapp://send?text=How%20To%20Easily%20Find%20Awesome%20Projects%20And%20Resources%20Hosted%20In%20GitHub%20https%3A%2F%2Fwww.ostechnix.com%2Feasily-find-awesome-projects-resources-hosted-github%2F (Click to share on WhatsApp)
[11]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=telegram (Click to share on Telegram)
[12]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=email (Click to email this to a friend)
[13]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/#print (Click to print)
