使用 Fedora 28 中的模块
======

![](https://fedoramagazine.org/wp-content/uploads/2018/05/modules-workingwith-816x345.jpg)

最近 Fedora Magazine 中题为 [Fedora 28 服务器版的模块化][1]在解释 Fedora  28 中的模块化方面做得很好。它还给出了一些示例模块并解释了它们解决的问题。本文将其中一个模块用于实际应用，包括使用模块安装设置 Review Board 3.0。

### 入门

想要继续并使用模块，你需要一个 [Fedora 28 服务器版][2]并拥有 [sudo 管理权限][3]。另外，运行此命令以确保系统上的所有软件包都是最新的：

```
sudo dnf -y update
```

虽然你可以在 Fedora 28 非服务器版本上使用模块，但请注意[上一篇文章评论中提到的警告][4]。

### 检查模块

首先，看看 Fedora 28 可用的模块。运行以下命令：

```
dnf module list
```

输出列出了一组模块，这些模块显示了每个模块的关联的流、版本和可用安装配置文件。模块流旁边的 `[d]` 表示安装命名模块时使用的默认流。

输出还显示大多数模块都有名为 `default` 的配置文件。这不是巧合，因为 `default` 是默认配置文件使用的名称。

要查看所有这些模块的来源，请运行：

```
dnf repolist
```

与通常的 [fedora 和更新包仓库][5]一起，输出还显示了 fedora-modular 和 updates-modular 仓库。

介绍声明你将设置 Review Board 3.0。也许名为 reviewboard 的模块在之前的输出中引起了你的注意。接下来，要获取有关该模块的一些详细信息，请运行以下命令：

```
dnf module info reviewboard
```

根据描述确认它是 Review Board 模块，但也说明是 2.5 的流。然而你想要 3.0 的。查看可用的 reviewboard 模块：

```
dnf module list reviewboard
```

2.5 旁边的 `[d]` 表示它被配置为 reviewboard 的默认流。因此，请明确你想要的流：

```
dnf module info reviewboard:3.0
```

有关 reviewboard:3.0 模块的更多详细信息，请添加详细选项：

```
dnf module info reviewboard:3.0 -v
```

### 安装 Review Board 3.0 模块

现在你已经跟踪了所需的模块，请使用以下命令安装它：

```
sudo dnf -y module install reviewboard:3.0
```

输出显示已安装 ReviewBoard 以及其他几个依赖软件包，其中包括 django:1.6 模块中的几个软件包。安装还启用了 reviewboard:3.0 模块和相关的 django:1.6 模块。

接下来，要查看已启用的模块，请使用以下命令：

```
dnf module list --enabled
```

输出中，`[e]` 表示已启用的流，`[i]` 表示已安装的配置。对于 reviewboard:3.0 模块，已安装默认配置。你可以在安装模块时指定其他配置。实际上，你仍然可以安装它，而且这次你不需要指定 3.0，因为它已经启用：

```
sudo dnf -y module install reviewboard/server
```

但是，安装 reviewboard:3.0/server 配置非常平常。reviewboard:3.0 模块的服务器配置与默认配置文件相同 —— 因此无需安装。

### 启动 Review Board 网站

现在已经安装了 Review Board 3.0 模块及其相关软件包，[创建一个本地运行的 Review Board 网站][6]。无需解释，请复制并粘贴以下命令：

```
sudo rb-site install --noinput \
    --domain-name=localhost --db-type=sqlite3 \
    --db-name=/var/www/rev.local/data/reviewboard.db \
    --admin-user=rbadmin --admin-password=secret \
    /var/www/rev.local
sudo chown -R apache /var/www/rev.local/htdocs/media/uploaded \
    /var/www/rev.local/data
sudo ln -s /var/www/rev.local/conf/apache-wsgi.conf \
    /etc/httpd/conf.d/reviewboard-localhost.conf
sudo setsebool -P httpd_can_sendmail=1 httpd_can_network_connect=1 \
    httpd_can_network_memcache=1 httpd_unified=1
sudo systemctl enable --now httpd
```

现在启动系统中的 Web 浏览器，打开 <http://localhost>，然后享受全新的 Review Board 网站！要以 Review Board 管理员身份登录，请使用上面 `rb-site` 命令中的用户 ID 和密码。

### 模块清理

完成后清理是个好习惯。为此，删除 Review Board 模块和站点目录：

```
sudo dnf -y module remove reviewboard:3.0
sudo rm -rf /var/www/rev.local
```

### 总结

现在你已经探索了如何检测和管理 Review Board 模块，那么去体验 Fedora 28 中提供的其他模块吧。

在 [Fedora 模块化][7]网站上了解有关在 Fedora 28 中使用模块的更多信息。dnf 手册页中的 module 命令部分也包含了有用的信息。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/working-modules-fedora-28/

作者：[Merlin Mathesius][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/merlinm/
[1]:https://linux.cn/article-10479-1.html
[2]:https://getfedora.org/server/
[3]:https://fedoramagazine.org/howto-use-sudo/
[4]:https://fedoramagazine.org/modularity-fedora-28-server-edition/#comment-476696
[5]:https://fedoraproject.org/wiki/Repositories
[6]:https://www.reviewboard.org/docs/manual/dev/admin/installation/creating-sites/
[7]:https://docs.pagure.org/modularity/
