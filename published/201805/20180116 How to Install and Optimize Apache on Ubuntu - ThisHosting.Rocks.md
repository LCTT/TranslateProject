如何在 Ubuntu 上安装和优化 Apache
=====

这是我们的 LAMP 系列教程的开始：如何在 Ubuntu 上安装 Apache web 服务器。

这些说明适用于任何基于 Ubuntu 的发行版，包括 Ubuntu 14.04、 Ubuntu 16.04、 [Ubuntu 18.04][1]，甚至非 LTS 的 Ubuntu 发行版，例如 Ubuntu 17.10。这些说明经过测试并为 Ubuntu 16.04 编写。

Apache (又名 httpd) 是最受欢迎和使用最广泛的 web 服务器，所以这应该对每个人都有用。

### 开始安装 Apache 之前

在我们开始之前，这里有一些要求和说明：

  * Apache 可能已经在你的服务器上安装了，所以开始之前首先检查一下。你可以使用 `apachectl -V` 命令来显示你正在使用的 Apache 的版本和一些其他信息。
  * 你需要一个 Ubuntu 服务器。你可以从 [Vultr][2] 购买一个，它们是[最便宜的云托管服务商][3]之一。它们的服务器价格每月 2.5 美元起。（LCTT 译注：广告 ≤_≤ ）
  * 你需要有 root 用户或具有 sudo 访问权限的用户。下面的所有命令都由 root 用户执行，所以我们不必为每个命令都添加 `sudo`。
  * 如果你使用 Ubuntu，则需要[启用 SSH][4]，如果你使用 Windows，则应该使用类似 [MobaXterm][5] 的 SSH 客户端。

这就是全部要求和注释了，让我们进入安装过程。

### 在 Ubuntu 上安装 Apache

你需要做的第一件事就是更新 Ubuntu，这是在你做任何事情之前都应该做的。你可以运行：

```
apt-get update && apt-get upgrade
```

接下来，安装 Apache，运行以下命令：

```
apt-get install apache2
```

如果你愿意，你也可以安装 Apache 文档和一些 Apache 实用程序。对于我们稍后将要安装的一些模块，你将需要一些 Apache 实用程序。

```
apt-get install apache2-doc apache2-utils
```

**就是这样。你已经成功安装了 Apache **

你仍然需要配置它。

### 在 Ubuntu 上配置和优化 Apache

你可以在 Apache 上做各种各样的配置，但是主要的和最常见的配置将在下面做出解释。

#### 检查 Apache 是否正在运行

默认情况下，Apache 设置为在机器启动时自动启动，因此你不必手动启用它。你可以使用以下命令检查它是否正在运行以及其他相关信息：

```
systemctl status apache2
```

[![check if apache is running][6]][6]

并且你可以检查你正在使用的版本：

```
apachectl -V
```

一种更简单的检查方法时访问服务器的 IP 地址，如果你得到默认的 Apache 页面，那么一切都正常。

#### 更新你的防火墙

如果你使用防火墙（你应该使用它），则可能需要更新防火墙规则并允许访问默认端口。Ubuntu 上最常用的防火墙是 UFW，因此以下说明使用于 UFW。

要允许通过 80（http）和 443（https）端口的流量，运行以下命令：

```
ufw allow 'Apache Full'
```

#### 安装常见的 Apache 模块

一些模块经常被建议使用，所以你应该安装它们。我们将包含最常见模块的说明：

##### 使用 PageSpeed  加速你的网站

PageSpeed 模块将自动优化并加速你的 Apache 服务器。

首先，进入 [PageSpeed 下载页][7]并选择你需要的的文件。我们使用的是 64 位 Ubuntu 服务器，所以我们安装最新的稳定版本。使用 `wget` 下载它：

```
wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb
```

然后，使用以下命令安装它：

```
dpkg -i mod-pagespeed-stable_current_amd64.deb
apt-get -f install
```

重启 Apache 以使更改生效：

```
systemctl restart apache2
```

##### 使用 mod_rewrite 模块启动重写/重定向

顾名思义，该模块用于重写（重定向）。如果你使用 WordPress 或任何其他 CMS 来处理此问题，你就需要它。要安装它，只需运行：

```
a2enmod rewrite
```

然后再次重新启动 Apache。你可能需要一些额外的配置，具体取决于你使用的 CMS，如果有的话。为你的设置 Google 一下得到它的具体说明。

##### 使用 ModSecurity 模块保护你的 Apache

顾名思义，ModSecurity 是一个用于安全性的模块，它基本上起着防火墙的作用，它可以监控你的流量。要安装它，运行以下命令：

```
apt-get install libapache2-modsecurity
```

再次重启 Apache：

```
systemctl restart apache2
```

ModSecurity 自带了一个默认的设置，但如果你想扩展它，你可以使用 [OWASP 规则集][8]。

##### 使用 mod_evasive 模块抵御 DDoS 攻击

尽管 mod_evasive 在防止攻击方面有多大用处值得商榷，但是你可以使用它来阻止和防止服务器上的 DDoS 攻击。要安装它，使用以下命令：

```
apt-get install libapache2-mod-evasive
```

默认情况下，mod_evasive 是禁用的，要启用它，编辑以下文件：

```
nano /etc/apache2/mods-enabled/evasive.conf
```

取消注释所有行（即删除 `#`），根据你的要求进行配置。如果你不知道要编辑什么，你可以保持原样。

[![mod_evasive][9]][9]

创建一个日志文件：

```
mkdir /var/log/mod_evasive
chown -R www-data:www-data /var/log/mod_evasive
```

就是这样。现在重启 Apache 以使更改生效。

```
systemctl restart apache2
```

你可以安装和配置[附加模块][10]，但完全取决于你和你使用的软件。它们通常不是必需的。甚至我们上面包含的 4 个模块也不是必需的。如果特定应用需要模块，那么它们可能会注意到这一点。

#### 用 Apache2Buddy 脚本优化 Apache

Apache2Buddy 是一个可以自动调整 Apache 配置的脚本。你唯一需要做的就是运行下面的命令，脚本会自动完成剩下的工作：

```
curl -sL https://raw.githubusercontent.com/richardforth/apache2buddy/master/apache2buddy.pl | perl
```

如果你没有安装 `curl`，那么你可能需要安装它。使用以下命令来安装 `curl`：

```
apt-get install curl
```

#### 额外配置

用 Apache 还可以做一些额外的东西，但我们会留下它们作为另一个教程。像启用 http/2 支持，关闭（或打开） KeepAlive，调整你的 Apache 甚至更多。这些东西你现在不需要做，但是如果你在网上找到了教程，并且如果你等不及我们的教程，那就去做吧。

### 使用 Apache 创建你的第一个网站

现在我们已经完成了所有的调优工作，让我们开始创建一个实际的网站。按照我们的指示创建一个简单的 HTML 页面和一个在 Apache 上运行的虚拟主机。

你需要做的第一件事是为你的网站创建一个新的目录。运行以下命令来执行此操作：

```
mkdir -p /var/www/example.com/public_html
```

当然，将 `example.com` 替换为你所需的域名。你可以从 [Namecheap][11] 获得一个便宜的域名。

不要忘记在下面的所有命令中替换 `example.com`。

接下来，创建一个简单的静态网页。创建 HTML 文件：

```
nano /var/www/example.com/public_html/index.html
```

粘贴这些：
```
<html>
     <head>
       <title>Simple Page</title>
     </head>
     <body>
       <p>If you're seeing this in your browser then everything works.</p>
     </body>
</html>
```

保存并关闭文件。

配置目录的权限：

```
chown -R www-data:www-data /var/www/example.com
chmod -R og-r /var/www/example.com
```

为你的网站创建一个新的虚拟主机：

```
nano /etc/apache2/sites-available/example.com.conf
```

粘贴以下内容：

```
<VirtualHost *:80>
     ServerAdmin admin@example.com
     ServerName example.com
     ServerAlias www.example.com
   
     DocumentRoot /var/www/example.com/public_html
    
     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

这是一个基础的虚拟主机。根据你的设置，你可能需要更高级的 `.conf` 文件。

在更新所有内容后保存并关闭文件。

现在，使用以下命令启用虚拟主机：

```
a2ensite example.com.conf
```

最后，重启 Apache 以使更改生效：

```
systemctl restart apache2
```

这就是全部了，你做完了。现在你可以访问 example.com 并查看你的页面。

--------------------------------------------------------------------------------

via: https://thishosting.rocks/how-to-install-optimize-apache-ubuntu/

作者：[ThisHosting][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://thishosting.rocks
[1]:https://thishosting.rocks/ubuntu-18-04-new-features-release-date/
[2]:https://thishosting.rocks/go/vultr/
[3]:https://thishosting.rocks/cheap-cloud-hosting-providers-comparison/
[4]:https://thishosting.rocks/how-to-enable-ssh-on-ubuntu/
[5]:https://mobaxterm.mobatek.net/
[6]:https://thishosting.rocks/wp-content/uploads/2018/01/apache-running.jpg
[7]:https://www.modpagespeed.com/doc/download
[8]:https://www.owasp.org/index.php/Category:OWASP_ModSecurity_Core_Rule_Set_Project
[9]:https://thishosting.rocks/wp-content/uploads/2018/01/mod_evasive.jpg
[10]:https://httpd.apache.org/docs/2.4/mod/
[11]:https://thishosting.rocks/neamcheap-review-cheap-domains-cool-names
[12]:https://thishosting.rocks/wp-content/plugins/patron-button-and-widgets-by-codebard/images/become_a_patron_button.png
[13]:https://www.patreon.com/thishostingrocks
