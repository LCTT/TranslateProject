
Libral,开源的 Linux 系统管理库

============================================================

Libral 提供相同管理标准并通过系统提供的 API 接口，提供可靠地脚本管理任务的服务并且增加实时配置管理系统。

![An introduction to Libral, a systems management library for Linux](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/yearbook-haff-rx-linux-file-lead_0.png?itok=48iDNoH8 "An introduction to Libral, a systems management library for Linux")

图像:[Internet Archive Book Images][10].修改：Opensource.com. CC BY-SA 4.0


Linux,保持了 Unix 的传统，但是没有一个综合管理系统的 API接口。相反，管理操作是通过多种特定的工具和 API 按照约定和特有的风格来实现的。这就使得编写一个极其简单的系统管理任务脚本将变得很困难很脆弱。


举个例子来说，改变 “app” 登录的命令行方式的用户可以运行 "usermod -s /sbin/nologin app"。这个命令运行能够试图探测出这个系统没有这个 app 用户。为了修复接下来产生的错误，有事业心的脚本编写者可能凭借下面的脚本来解决：

```
    grep -q app /etc/passwd \
      && usermod -s /sbin/nologin app \
      || useradd ... -s /sbin/nologin app
```

因此，当“app”用户在系统中存在时更改登录命令行的方式就被执行了，当此用户不存在时，此用户就被创建个。不幸的是，这种利用编写系统管理任务脚本的途径是不能被接受的：对于每一种资源来说，都必须有不同的设置工具和其特有的风格必须合并到一个用户账户；不一致和经常性的不完备的错误报告将会使错误的处理变得困难；再者会因为工具所具有的本质特性引起的故障而导致执行失败。

实际上，以上所举的例子是不正确的：“grep” 不能用在查找 “app”用户的，它只能简单的查找文件“/etc/passwd”的一些行中是否有字符串“app”，在很多时候，会在最关键的时刻经常出错。

很显然，管理工具很难从脚本执行简单的任务，在最好的情况下，对于一个较大的基础管理系统是困难的。认识到这一点，退出配置管理系统，比如 Puppet，Chef，及 Ansible，围绕基本操作系统资源管理竭尽全力的建立其内部的 API 就是明智的。这些资源由各自需要的密切相关的工具抽象成内部的 API。这不仅导致大量的重复性工作，也为尝试一个新的和创新管理工具设置了强大的障碍。

突破创建虚拟机(VM)或者图像容器这一领域就变得非常清晰：比如在创建图像的过程中，要么回答关于其的简单问题要么对其进行简单的更改是非常必要的。但是要使工具完成所有的任务需要特殊的处理，这些问题和变化将遇到一些人试图利用脚本精确解决的问题。因此，图像构建要么依靠特定的脚本要么使用（安装）一个相当强大的配置管理系统。

[Libral][11] 将为管理工具和任务提供一个可靠的保证，通过系统资源提供通常管理的 API ，通过命令行工具是制作成为可能，"ralsh",允许用户按照相同的方法查询和修改系统资源，能够有可预见的错误报告。通过以上的举例，通过命令“ralsh -aq user app"检查“app”用户是否存在;通过”ralsh -aq package foo"检查“foo”包文件是否已经被安装；一般情况下，通过命令“ralsh -aq TYPE NAME"检查”NAME“是否是”TYPE“资源类型。类似的，创建和更改存在的用户，可以运行：


```
    ralsh user app home=/srv/app shell=/sbin/nologin
```

接下来创建和修改入口文件 “/etc/hosts",可以运行命令：


```
    ralsh hostmyhost.example.com ip=10.0.0.1 \
      host_aliases=myhost,apphost
```

以这种方式运行，用户的 ”ralsh“ 在内部运行是完全不同的，事实上是分离开执行的：第一步需要适当的调用命令”useradd“或者”usermod“，然而第二步需要在”/etc/hosts"文件中进行编辑。对于用户来说，他们似乎都采取同样的模型：“确保资源就是我所所需要的。”


怎样获取和使用 Libral 呢？

Libral可以在[this git repo][12]找到并下载。核心是由C++编写的，创建他的说明可以在[in the repo][13]查找到。如果你真的想要为Libral 的 C++ 核心做贡献的话是很有必要的。Libral 的网站上包含了一个[prebuilt tarball][14],可以在任何 Linux 机器上使用“glibc 2.12”或者更高版本。可以使该“tarball”的内容链接进一步探究 ralsh 和开发新的供应商，这样做就使得 Libral 具备了管理新类型资源的能力。


下载完毕后解压“tarball”，“ralsh”命令就会生成在目录“ral/bin”下。运行这个不需要任何参数的命令就会将 Libral 所知道所有资源类型列举出来。利用“--help“选项打印输出关于”ralsh“更多的实例。


如何配置管理系统


众所周知配置管理系统，如 Puppet，Chef，及 Ansible，地址等相同的问题是 Libral 的地址。这就是为什么一般将 Libral 与其他设置分离开的原因，即让系统去执行。配置管理系统被创建处理多样复杂的通过管理大量的节点的多事务管理行为。Libral，在另一方面，旨在提供一个低级别的定义明确的系统管理 API 独立于任何特定的工具，可用各种各样的编程语言进行设计。


通过消除大量的配置管理系统中包含的应用程序逻辑，Libral在怎样使用方面是非常万能的，从简单的脚本任务介绍中提到的，为构建复杂的管理应用程序块服务。专注与这些基础之外，还允许它很小，目前小于 2.5 MB，一个重要的考虑就是资源严重受限的环境包括容器和小型设备。

Libral API

在过去的十年里，Libral API 设计指导下实施配置管理上的经验，虽然不是解绑定到其中任何一个应用上，但需要考虑这些问题，做出选择克服他们的缺点。


四个重要的 API 设计原则


期望的声明


双向性


轻量级的抽象


平行程式扩展


给予期望状态管理API，举个例子来说，这个理解应该是当用户在一个操作执行后希望系统看起来是什么表达方式，而不是怎么进入这个状态，在这一点上很难引起争议。双向性使得使用相同的 API 成为可能，更重要的是，相同的资源抽象成读取已经存在的和强制改变它。轻量级的抽象行为确保能容易的学习和快速的使用API；过去尝试管理 API 的方式已经过度的加重了学习框架建模的使用者的负担了，一个重要的因素是他们的接受力缺乏。


终于，它必须易于扩展 Libral 的管理功能，这样用户可以让 Libral 如何管理新类型的资源。这很重要，因为绝对数量的资源，一种情况可能需要管理（Libral 将在适当时间进行管理），再者，因为既是一个完全成熟的 Libral 也总是存在达不到用户自定义的管理需求。


目前与 Libral API 进行交互的主要方式是通过“ralsh”命令行工具。它公开了底层的 C++ API ，不过人处在不断的演变当中，主要的还是为面向简单的脚本任务做准备。该项目提供了为 CRuby提供语言绑定并且会有更多的参加者共同参与。


未来，Libral 还将提供一个可远程支持的虚拟光驱 API ，因此它可以成为一个管理系统的基本服务，在此基础上管理节点不需要安装额外的代理。这一点，共轭能力能够更加适合 Libral 的管理功能，使其在更加紧密的控制系统方面和对来自任何干扰的保护成为一种可能。


举个例子来说，Libral 仅限于管理用户和服务的安装将受到保护，在一个节点上进行包安装的时候不会受到干扰。获得以这种方式的管理控制在当前是不可能与现有的配置管理系统共存的；尤其当系统需要通过任意的 SSH 访问一个托管的节点并同时显示对系统有害的信息或者是恶意干扰。


Libral API 的基础是由两个非常简单的操作构成的：“get” 用来检索当前资源的状态，“set” 用来强制当前资源的状态。理想化的实现当前安装启用状态，可能要通过以下步骤：


```
  provider.get(names) -> List[resource]
  provider.set(List[update]) -> List[change]
```

“provider" 是要了解怎样管理一种资源的对象，就像用户，服务，包文件，Libral API 提供了一种查找资源的方法。


”get“ 操作能够接收资源名称列表，举例子来说，用户名，需要产生一个资源列表，本质来说是利用散列的方式列出每种资源的属性。这个列表必须包含提供名称的资源，但是可能包含更多内容，因此”get“ 的启用可以忽略名称列出所有它知道的资源。


”set“ 操作被用来强制要求的状态，接收列表的更新。每次更新包含”update.is",表示当前状态的资源，“update.should" 表示被要求状态的资源。调用”set“方法将会确认更新列表中提到的资源，将会在”update.should"中显示状态，产生一个对每个资源进行更改的列表。


在 “ralsh”下，利用“ralsh user root"能够重新获得“root”用户的当前状态;默认情况下，这个命令会产生一个用户可读的输出，就像木偶一样，但是”ralsh“支持”--json“选项，将利用脚本消耗产生 JSON 输出。用户可读输出是：


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

用户将被修改成类似于下面的形式：

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

”ralsh“的输出列出了”root“用户两种新状态，被改变的属性注释，以及修改了什么内容（在这种情形下单独的”注释”属性）。运行相同的命令一秒钟的时间将产生同样的输出，但是没有任何修改的迹象，也没有需求。

编写程序管理器

为“ralsh”编写新的管理器是很容易的，也是花费不了多少努力，但是这一步骤是至关重要的。正因为如此，“ralsh”提供了大量的调用约定，依靠其效能实现交换复杂的执行成为可能。管理器可以使用遵循特定调用约定的外部脚本也可以是执行 C++ 并构建Libral。到目前为止，有三种调用约定：


[simple][16]调用约定是针对编写 shell 脚本服务于管理器。

[JSON][7]调用约定意味着可以利用 Ruby 或者 Python 脚本语言编写管理器。

[internal C++ API][8] 可以被用来执行本机的管理器。


强烈建议开始管理其开发使用“simple” 或者“JSON” 调用约定。[simple.prov][15]文件在GitHub上包含了一个简单的 shell 管理器框架，应该很容易的被自己的管理器兼容。[python.prov][16]文件包含了利用 Python编写的 JSON 管理器框架。


利用高版本脚本语言编写的管理器存在一个运行时间的问题，包含所有的支持库，这些脚本语言需要在当前的系统上运行 Libral。在某些情况下，这不是一个障碍；举例子来说，基于“yum” 的包管理的管理器需要 Python 被安装在当前的系统上，而“yum”是用 Python 开发的一样。

然而在很多时候，无法选择一种超过 Bourne shell （或者 Bash）的设计语言能够按照预期安装到所有的管理系统上。通常，管理器的编写者需要一个更加强大的脚本编译环境是更实际一些的。然而事与愿违，绑定一个完整的 Ruby 或 Python作为解释器来运行将会增加 Libral 的空间超出了实际使用环境对资源的限制。另一方面，Lua 或者 JavaScript 可嵌入的脚本编辑语言的选择规范与其上下文是不匹配的，因为大多数的管理器的编写者不熟悉他们，通常情况下需要做大量的工作对需要生产环境系统管理工具进行发布。

Libral 绑定了一个[mruby][17]版本，一个小的，嵌入在 Ruby 的版本，提供给管理器的编写者一个具有稳定的基础以及功能强大的可实现的程序设计语言。Mruby 就是一款可实现的 Ruby 语言，尽管减少了大量的标准库支持。绑定了 Libral 的 Mruby 包含了 Ruby 的标准库的大多数重要的脚本编辑管理任务，随着时间的推移将来在管理器编写者基础性的需求上将得到加强。Libral 的 Mruby 绑定了 API 适配器使编写管理器更适合 JSON 约定，因为它包含了简单的工具（如编译修改结构体文件的[Augeas][18]）和围绕语法和输出JSON的约定。[mruby.prov][19]文件包含了利用 Mruby 编写的 JSON 管理器框架实例。


展望

Libral 最关键的是下一步要使其增加广泛的可用性-从[precompiled tarball][20]开始并充分的开发管理器是一个极好的方法，但是 Libral 需要打包并且能够在主流的分布上提高可用性。同样的，Libral 强大的功用取决于管理器的集合附带及需要被扩展覆盖的一组核心管理功能。Libral 的网站上包含了 [a todo list][21]并且列出了管理器的最迫切需求。

现在有多种方法来让不同的用户能够提高 Libral的可用性：编写绑定附加程序语言，举例来说，Python 或者 Go，提供条件使“ralsh” 更容易在 shell 脚本中使用，除了现有的可读输出和 JSON 输出之外，可以很轻松的在 shell 脚本中格式化输出。Libral 运用大规模的管理能够在增加远程 API 协商而得到改良，Libral 利用像 SSh 这样的传输工具实现了更好的支持批量安装，大多数情况下需要提供更多的框架和脚本的预先构建包才能选择一款基于创新的目标框架系统。

Libral 有很多方式方法，如 API ，它的性能在不断地进化发展；一个有趣的可能性是为 API 增加性能的显示，这样做可以向系统报告资源在超出它的范围发生的变化。Libral 面临的挑战将一直持续下去的是小型化，轻量级和良好定义的工具，来替代曾经增加的使用和管理性能-我希望每一个读者都能成为这个挑战和旅行的一部分。

如果这让你很好奇，我很想听听你的想法，可以使推拉请求的方式，可以是增强请求方式，亦或者报告你对“ralsh”测试的经验体验。

--------------------------------------------------------------------------------

作者简介：

David Lutterkort - 戴维是一个 Puppet 的软件工程师，他曾经参与的项目有 Direct Puppet 和 Razor，最好的工具提供。他是 Puppet 最早的编著者之一，也是 Augeas 的主要作者，一个编辑工具配置专家。

------------------------

via: https://opensource.com/article/17/5/intro-libral-systems-management-library-linux

作者：[David Lutterkort][a]
译者：[译者：stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

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
