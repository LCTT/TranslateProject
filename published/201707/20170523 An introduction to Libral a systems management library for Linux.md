Libral：一个提供资源和服务统一管理 API 的系统管理库
============================================================

> Libral 为系统资源和服务提供了一个统一的管理 API ，其可以作为脚本管理任务和构建配置管理系统的坚实基础。

![An introduction to Libral, a systems management library for Linux](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/yearbook-haff-rx-linux-file-lead_0.png?itok=48iDNoH8 "An introduction to Libral, a systems management library for Linux")

作为继承了 Unix 的传统的 Linux 操作系统，其并没有一个综合的系统管理 API 接口，相反，管理操作是通过多种特定用途的工具和 API 来实现的，其每一个都有自己约定和特有的风格。这就使得编写一个哪怕是简单的系统管理任务的脚本也很困难、很脆弱。

举个例子来说，改变 “app” 用户的登录 shell 要运行 `usermod -s /sbin/nologin app`。这个命令通常没有问题，只是当系统上没有 “app” 用户时就不行了。为了解决这个例外错误，具有创新精神的脚本编写者也许要这样写：

```
grep -q app /etc/passwd \
  && usermod -s /sbin/nologin app \
  || useradd ... -s /sbin/nologin app
```

这样，当 “app” 用户存在于系统中时，会执行更改登录 shell 的操作；而当此用户不存在时，就会创建此用户。不幸的是，这种编写系统管理任务脚本的方式是不适合的：对于每一种资源来说都会有一套不同的工具，而且每个都有其不同的使用惯例；不一致性和经常出现的不完备的错误报告将会使错误的处理变得困难；再者也会因为工具自身的特性引发的故障而导致执行失败。

实际上，以上所举的例子也是不正确的：`grep` 并不是用来查找 “app” 用户的，它只能在文件 `/etc/passwd` 的一些行中简单的查找是否有字符串 “app”，在大多数情况下它或许可以工作，但是也可能会在最关键的时刻出错。

很显然，那些执行简单任务的脚本管理工具，很难成为大型管理系统的基础。认识到这一点，现有的配置管理系统，比如 Puppet、Chef 及 Ansible，围绕基本的操作系统资源的管理竭尽全力的建立其内部 API 就是明智之举。这些资源抽象是内部 API，其与所需的相应工具密切相关。但这不仅导致大量的重复性工作，也为尝试一个新创新的管理工具设置了强大的障碍。

在创建虚拟机或者容器镜像这一领域，这种障碍就变得非常明显：比如在创建镜像的过程中，就要么需要回答关于它们的简单问题，要么需要对其进行简单的更改才行。但是工具全都需要特别处理，那些所遇到的问题和更改需要用脚本逐个处理。因此，镜像构建要么依靠特定的脚本，要么需要使用（和安装）一个相当强大的配置管理系统。

[Libral][11] 将为管理工具和任务提供一个可靠的保证，通过对系统资源提供一个公用的管理 API，并使其可以通过命令行工具 `ralsh` 使用，它允许用户按照相同的方法查询和修改系统资源，并有可预见的错误报告。对以上的举例来说，可以通过命令 `ralsh -aq user app` 检查 “app” 用户是否存在；通过 `ralsh -aq package foo` 检查 “foo” 软件包是否已经安装；一般情况下，可以通过命令 `ralsh -aq TYPE NAME` 检查 ”NAME“ 是否是 ”TYPE“ 类型的资源。类似的，要创建或更改已存在的用户，可以运行：

```
ralsh user app home=/srv/app shell=/sbin/nologin
```

以及，要在文件 `/etc/hosts` 创建和修改条目，可以运行命令：


```
ralsh hostmyhost.example.com ip=10.0.0.1 \
  host_aliases=myhost,apphost
```

以这种方式运行，“ralsh” 的使用者事实上完全隔离在那两个命令内部的不同运行工作机制之外：第一个命令需要适当的调用命令 `useradd` 或者 `usermod`，而第二个需要在 `/etc/hosts` 文件中进行编辑。而对于该用户来说，他们似乎都采取同样的模型：“确保资源处于我所需要的状态。”

### 怎样获取和使用 Libral 呢？

Libral 可以在[这个 git 仓库][12]找到并下载。其核心是由 C++ 编写的，构建它的说明可以[在该仓库中][13]找到，不过只是在你想要为 Libral 的 C++ 核心做贡献的时候才需要看它。Libral 的网站上包含了一个 [预构建的 tarball][14]，可以用在任何使用 “glibc 2.12” 或者更高版本的 Linux 机器上。可以使用该 “tarball” 的内容进一步探究 ralsh ，以及开发新的提供者（provider），它使得 Libral 具备了管理新类型资源的能力。

在下载解压 tarball 后，在目录 `ral/bin` 下能找到 `ralsh` 命令。运行不需要任何参数的 `ralsh` 命令就会列举出来 Libral 的所有资源类型。利用 `--help` 选项可以打印输出关于 `ralsh` 的更多说明。

### 与配置管理系统的关系

知名的配置管理系统，如 Puppet、Chef 及 Ansible，解决了一些 Libral 所解决的同样的问题。将 Libral 与它们的区分开的主要是它们所做工作和 Libral 不同。配置管理系统被构建来处理跨大量节点管理各种事物的多样性和复杂性。而另一方面 Libral 旨在提供一个定义明确的低级别的系统管理 API ，独立于任何特定的工具，可用于各种各样的编程语言。

通过消除大型配置管理系统中包含的应用程序逻辑，Libral 从前面介绍里提及的简单的脚本任务，到作为构建复杂的管理应用的构建块，它在如何使用方面是非常灵活的。专注与这些基础层面也使其保持很小，目前不到 2.5 MB，这对于资源严重受限的环境，如容器和小型设备来说是一个重要考虑因素。

### Libral API

在过去的十年里，Libral API 是在实现配置管理系统的经验下指导设计的，虽然它并没有直接绑定到它们其中任何一个应用上，但它考虑到了这些问题，并规避了它们的缺点。

在 API 设计中四个重要的原则：

* 期望的状态
* 双向性
* 轻量级抽象
* 易于扩展

基于期望状态的管理 API，举个例子来说，用户表示当操作执行后希望系统看起来是什么状态，而不是怎样进入这个状态，这一点什么争议。双向性使得使用（读、写）相同的 API 成为可能，更重要的是，相同的资源可以抽象成读取现有状态和强制修改成这种状态。轻量级抽象行为确保能容易的学习 API 并能快速的使用；过去在管理 API 上的尝试过度加重了学习建模框架的使用者的负担，其中一个重要的因素是他们的接受力缺乏。

最后，它必须易于扩展 Libral 的管理功能，这样用户可以教给 Libral 如何管理新类型的资源。这很重要，因为人们也许要管理的资源可能很多（而且 Libral 需要在适当时间进行管理），再者，因为即使是完全成熟的 Libral 也总是存在达不到用户自定义的管理需求。

目前与 Libral API 进行交互的主要方式是通过 `ralsh` 命令行工具。它也提供了底层的 C++ API ，不过其仍处在不断的演变当中，主要的还是为简单的脚本任务做准备。该项目也提供了为 CRuby 提供语言绑定，其它语言也在陆续跟进。

未来 Libral 还将提供一个提供远程 API 的守护进程，它可以做为管理系统的基础服务，而不需要在管理节点上安装额外的代理。这一点，加上对 Libral 管理功能的定制能力，可以严格控制系统的哪些方面可以管理，哪些方面要避免干扰。

举个例子来说，一个仅限于管理用户和服务的 Libral 配置会避免干扰到在节点上安装的包。当前任何现有的配置管理系统都不可能控制以这种方式管理的内容；尤其是，需要对受控节点进行任意的 SSH 访问也会将该系统暴露不必要的意外和恶意干扰。

Libral API 的基础是由两个非常简单的操作构成的：“get” 用来检索当前资源的状态，“set” 用来设置当前资源的状态。理想化地实现是这样的，通过以下步骤：


```
provider.get(names) -> List[resource]
provider.set(List[update]) -> List[change]
```

“provider” 是要知道怎样管理的一种资源的对象，就像用户、服务、软件包等等，Libral API 提供了一种查找特定资源的管理器（provider）的方法。

“get” 操作能够接收资源名称列表（如用户名），然后产生一个资源列表，其本质来说是利用散列的方式列出每种资源的属性。这个列表必须包含所提供名称的资源，但是可以包含更多内容，因此一个简单的 “get” 的实现可以忽略名称并列出所有它知道的资源。

“set” 操作被用来设置所要求的状态，并接受一个更新列表。每个更新可以包含 “update.is”，其表示当前状态的资源，“update.should” 表示被资源所期望的状态。调用 “set” 方法将会让更新列表中所提到的资源成为 “update.should” 中指示的状态，并列出对每个资源所做的更改。

在 `ralsh` 下，利用 `ralsh user root` 能够重新获得 “root” 用户的当前状态；默认情况下，这个命令会产生一个用户可读的输出，就像 Puppet 中一样，但是 `ralsh` 支持 `--json` 选项，可以生成脚本可以使用的 JSON 输出。用户可读的输出是：

```
# ralsh user root
user::useradd { 'root':
  ensure  => 'present',
  comment => 'root',
  gid     => '0',
  groups  => ['root'],
  home    => '/root',
  shell   => '/bin/bash',
  uid     => '0',
}
```

类似的，用户也可以用下面的形式修改：

```
# ralsh user root comment='The superuser'
user::useradd { 'root':
  ensure  => 'present',
  comment => 'The superuser',
  gid     => '0',
  groups  => ['root'],
  home    => '/root',
  shell   => '/bin/bash',
  uid     => '0',
}
comment(root->The superuser)
```

`ralsh` 的输出列出了 “root” 用户的新状态和被改变的 `comment` 属性，以及修改了什么内容（在这种情形下单指 `comment` 属性）。下一秒运行相同的命令将产生同样的输出，但是不会提示修改，因为没有需要修改的内容。

### 编写管理器（provider）

为 `ralsh` 编写新的管理器（provider）是很容易的，也花费不了多少工夫，但是这一步骤是至关重要的。正因为如此，`ralsh` 提供了大量的调用约定，使得可以根据管理器所能提供的能力而调整其实现复杂性成为可能。管理器可以使用遵循特定调用约定的外部脚本，也可以以 C++ 实现并内置到 Libral 里面。到目前为止，有三种调用约定：


* [simple][16] 调用约定是编写 shell 脚本用为管理器。
* [JSON][7] 调用约定意味着可以利用 Ruby 或者 Python 脚本语言编写管理器。
* [内部 C++ API[8] 可以被用来实现原生的管理器。

强烈建议使用 “simple” 或者 “JSON” 调用约定开始开发管理器。GitHub 上的 [simple.prov][15] 文件包含了一个简单的 shell 管理器框架，应该很容易的替换为你自己的管理器。[python.prov][16] 文件包含了利用 Python编写的 JSON 管理器框架。

利用高级脚本语言编写的管理器存在一个问题是，对于这些语言，在当前运行 Libral 的系统上需要包含所有的支持库在内运行环境。在某些情况下，这不是一个障碍；举例子来说，基于 “yum” 的包管理的管理器需要 Python 被安装在当前的系统上，因为 “yum” 就是用 Python 开发的。

然而在很多时候，无法预期一种 Bourne shell（Bash）之外的设计语言能够安装到所有的管理系统上。通常，管理器的编写者需要一个更加强大的脚本编译环境是实际需要。然而事与愿违，绑定一个完整的 Ruby 或 Python 作为解释器来运行将会增加 Libral 的大小超出了实际使用环境对资源的限制。另一方面，通常选择 Lua 或者 JavaScript 作为可嵌入的脚本编辑语言是不适应这种环境的，因为大多数的管理器的编写者不熟悉他们，通常情况下需要做大量的工作才能满足系统管理的实际需求。

Libral 绑定了一个 [mruby][17] 版本，一个小的、嵌入在 Ruby 的版本，提供给管理器的编写者一个稳定的基础以及功能强大的可实现的程序设计语言。mruby 是 Ruby 语言的一个完整实现，尽管其减少了大量的标准库支持。与 Libral 绑定的 mruby 包含了 Ruby 用于脚本编辑管理任务的大多数的重要标准库，其将基于管理器编写者的需求随着时间的推移得到加强。Libral 的 mruby 绑定了 API 适配器使编写管理器更适合 JSON 约定，比如它包含了简单的工具（如编译修改结构体文件的 [Augeas][18]）来解决解析和输出 JSON 的约定。[mruby.prov][19] 文件包含了利用 mruby 编写的 JSON 管理器框架实例。


### 下一步工作


Libral 最关键的是下一步要使其增加广泛的可用性——从 [预编译的 tarball][20] 对于开发管理器的起步和深入是一个不错的方法，但是 Libral 也需要打包到主流的发行版上，并在上面可以找到。同样的，Libral 强大的功能取决于它附带的管理器的集合，及需要被扩展覆盖一组核心管理功能。Libral 的网站上包含了[一个 todo 列表][21]列出了管理器的最迫切需求。

现在有多种方法能够提高不同用途的 Libral 的可用性：从编写更多程序语言的绑定，举例来说，Python 或者 Go；到使 `ralsh` 更容易在 shell 脚本中使用，除了现有的可读输出和 JSON 输出之外，可以很轻松的在 shell 脚本中格式化输出。在大规模的管理中使用 Libral 也能够在增加上面讨论过的远程 API 而得到改良，Libral 利用像 SSH 这样的传输工具实现更好的支持批量安装要求为各种架构提供预编译的 tarball，并且脚本基于所发现的目标系统架构选择正确的包。

Libral 和它的 API、它的性能能够不断地进化发展；一个有趣的可能性是为 API 增加提醒能力，这样做可以向系统报告资源在超出它的范围发生的变化。Libral 面临的挑战是保持小型化、轻量级和良好定义的工具，来对抗不断增加的用例和管理性能——我希望每一个读者都能成为这个挑战之旅的一部分。

如果这让你很好奇，我很想听听你的想法，可以用拉取请求的方式，也可以是增强请求方式，亦或者报告你对 ralsh 体验经验。

（题图：[Internet Archive Book Images][10]，修改：Opensource.com. CC BY-SA 4.0）
--------------------------------------------------------------------------------

作者简介：

David Lutterkort - 戴维是一个 Puppet 的软件工程师，他曾经参与的项目有 Direct Puppet 和最好的供给工具 Razor。他是 Puppet 最早的编著者之一，也是配置编辑工具 Augeas 的主要作者。

------------------------

via: https://opensource.com/article/17/5/intro-libral-systems-management-library-linux

作者：[David Lutterkort][a]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/david-lutterkort
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?src=linux_resource_menu&intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://github.com/puppetlabs/libral/blob/master/doc/invoke-simple.md
[7]:https://github.com/puppetlabs/libral/blob/master/doc/invoke-json.md
[8]:https://github.com/puppetlabs/libral/blob/master/doc/invoke-native.md
[9]:https://opensource.com/article/17/5/intro-libral-systems-management-library-linux?rate=PqOZGb7A0LUlHQRwkzl23iaJZ2ZUy6gKcc6HOzaRL58
[10]:https://www.flickr.com/photos/internetarchivebookimages/14803082483/in/photolist-oy6EG4-pZR3NZ-i6r3NW-e1tJSX-boBtf7-oeYc7U-o6jFKK-9jNtc3-idt2G9-i7NG1m-ouKjXe-owqviF-92xFBg-ow9e4s-gVVXJN-i1K8Pw-4jybMo-i1rsBr-ouo58Y-ouPRzz-8cGJHK-85Evdk-cru4Ly-rcDWiP-gnaC5B-pAFsuf-hRFPcZ-odvBMz-hRCE7b-mZN3Kt-odHU5a-73dpPp-hUaaAi-owvUMK-otbp7Q-ouySkB-hYAgmJ-owo4UZ-giHgqu-giHpNc-idd9uQ-osAhcf-7vxk63-7vwN65-fQejmk-pTcLgA-otZcmj-fj1aSX-hRzHQk-oyeZfR
[11]:https://github.com/puppetlabs/libral
[12]:https://github.com/puppetlabs/libral
[13]:https://github.com/puppetlabs/libral#building-and-installation
[14]:http://download.augeas.net/libral/ralsh-latest.tgz
[15]:https://github.com/puppetlabs/libral/blob/master/examples/providers/simple.prov
[16]:https://github.com/puppetlabs/libral/blob/master/examples/providers/python.prov
[17]:http://mruby.org/
[18]:http://augeas.net/
[19]:https://github.com/puppetlabs/libral/blob/master/examples/providers/mruby.prov
[20]:http://download.augeas.net/libral/ralsh-latest.tgz
[21]:https://github.com/puppetlabs/libral#todo-list
[22]:https://opensource.com/user/140051/feed
[23]:https://opensource.com/users/david-lutterkort
