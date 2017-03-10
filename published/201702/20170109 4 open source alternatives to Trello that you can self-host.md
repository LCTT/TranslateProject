4 个开源的可自行托管的 Trello 替代品
============================================================

Trello 是一个可视的团队协作平台，最近被 Atlassian 收购了，这里我说的_最近_的意思是 2017 年 1 月 9 日，星期一。

我作为 DigitalOcean 社区作者的董事会成员之一，一直在使用 Trello ，并在几天前开始使用它来管理一个非营利组织的小团队项目。这是一个很好的软件，任何团队，包括那些并不 geek 的成员，都能舒适地使用它。

如果你喜欢 [Trello][6]，但现在想要一个类似的软件，你可以自己托管，运行在自己的服务器上，我发现了四个你可以选择的工具。记住，我没有在我自己的服务器上安装其中任何一个，但从我收集的关于它们的信息上来看，我最可能使用的是 Kanboard 和 Restyaboard。

这是因为它们的安装要求很常见的。它们的安装过程也比较简单。Restyaboard 似乎有一个更好的 UI，所以它可能是我的第一个选择，虽然其中的一个要求（Elasticsearch）让我认为它对服务器的要求将比其它的更多。不管怎样，我会很快发布尝试自己托管 Kanboard 和 Restyaboard 的文章，所以请经常回来看看。

在那之前，我发现的替代 Trello 的前四个选择是：

### Kanboard

除了自由且开源，看板功能还提供与第三方工具和服务（如 Amazon S3 Storage、Hipchat、Jabber、RabbitMQ、Slack 等）的集成。Kanboard 可以安装在微软操作系统上，但要需要安装在自由开源组件之上，你需要以下内容：

*   PHP >= 5.3.9
*   MariaDB/MySQL、Postgres 或者 Sqlite
*   Apache 或者 Nginx
*   CentOS 6/7、 Debian 8、 FreeBSD 10 或者 Ubuntu 14.04/16.04

从对项目的一个非常粗略的评估，UI 似乎不如本文中提到的其他工具靓丽。 如果改变主意不想自己托管，有一个有管理的或托管的 Kanboard 可供你注册。该项目的 GitHub 页面在 [https://github.com/kanboard/kanboard][8]。

![kanboard interface](http://linuxbsdos.com/wp-content/uploads/2017/01/kanboard-700x312.png "kanboard interface") 

### Restyaboard

有靓丽的用户界面和从 Trello 导入数据的能力，Restyaboard 是一个非常有吸引力的 Trello 替代品。安装要求似乎也不高；在你的服务器上安装 Restyaboard 你需要以下内容：

*   PHP-FPM
*   Postgres
*   Nginx
*   Elasticsearch

需求不多，而且有个脚本可在你的服务器上安装所有需要的组件，这使安装变得更简单。还有一个 AMI 可以用于在 Amazon AWS 上安装。对于 Docker 的粉丝，有一个非官方的 Docker 镜像可以用来运行 Restyaboard 容器。我不鼓励使用非官方 Docker 镜像运行 Docker 容器，但如果你想要试试，那会是一个选择。 项目的详细信息的 [GitHub page][9]。

![Restyaboard project management software](http://linuxbsdos.com/wp-content/uploads/2017/01/restyaboard-646x460.png "Restyaboard project management software") 

### Taiga

部署好的 Taiga 由三个组件组成 - taiga-back（后端/ api）、taiga-front-dist（前端）、taiga-events - 每个都有自己的要求。一般来说，在你的服务器上安装 Taiga 你需要以下这些：

* Python >= 3.4
* PostgreSQL >= 9.3
* RabbitMQ（可选项，看是否需要异步提醒）
* gcc 和开发头文件
* Ruby >= 2.1 （仅用于编译 sass）
* NodeJS >= 5.0 （npm、 gulp 和 bower 用于下载依赖和编译 coffeescript）

安装要求似乎比其它的多一点，所以如果这是一个问题，有一个托管平台可以免费使用。该托管平台上的额外功能是收费的。有关详细信息，请访问项目的 [GitHub页面][1]。

![Taiga project management software](http://linuxbsdos.com/wp-content/uploads/2017/01/Taiga-700x440.jpg "Taiga project management software") 

### Wekan

Wekan 是用 Meteor 构建的，这是一个用于构建 web 应用程序的 JavaScript 框架，托管在 [https://github.com/wekan/wekan][2]。 该项目提供了在 Heroku、Sandstorm 的一键安装，以及经过验证的 Docker 镜像上，以便在 Docker 容器上运行它。它也可以安装在 Scalingo、IndieHosters 和 Cloudron，但我找不到部署在其他如 [Vultr][3] 和 [DigitalOcean][4] 的云托管提供商上的安装说明。

所以看来，你安装 Wekan 最简单的方式是使用一个支持的云托管平台。

![Wekan project management software](http://linuxbsdos.com/wp-content/uploads/2017/01/Wekan-700x363.jpeg "Wekan project management software") 

如我之前承诺的，请稍后回来看看我发布的如何在你的服务器上安装 Kanboard 和 Restyaboard 指南。

### 更新

刚发布这篇文章，我就发现了 [Tuleap][5]。它似乎非常精美，但生产环境安装只支持 CentOS 6 和 Red Hat 6。支持使用 Docker 的容器化安装，但不推荐用于生产。

--------------------------------------------------------------------------------

via: http://linuxbsdos.com/2017/01/09/4-open-source-alternatives-to-trello-that-you-can-self-host/

作者：[linuxbsdos.com][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxbsdos.com
[1]:https://github.com/taigaio/
[2]:https://github.com/wekan/wekan
[3]:http://www.vultr.com/?ref=6827794
[4]:https://www.digitalocean.com/?refcode=900fe177d075
[5]:https://www.tuleap.org/
[6]:https://trello.com/
[8]:https://github.com/kanboard/kanboard
[9]:https://github.com/RestyaPlatform/board

