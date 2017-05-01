如何在 AWS EC2 的 Linux 服务器上开放一个端口
============================================================

_这是一篇用屏幕截图解释如何在 AWS EC2 Linux 服务器上打开端口的教程。它能帮助你管理 EC2 服务器上特定端口的服务。_

* * *

AWS（即 Amazon Web Services）不是 IT 世界中的新术语了。它是亚马逊提供的云服务平台。它的免费帐户能为你提供一年的有限免费服务。这是尝试新技术而不用花费金钱的最好的方式之一。

AWS 提供服务器计算作为他们的服务之一，他们称之为 EC（弹性计算）。使用它可以构建我们的 Linux 服务器。我们已经看到了[如何在 AWS 上设置免费的 Linux 服务器][11]了。

默认情况下，所有基于 EC2 的 Linux 服务器都只打开 22 端口，即 SSH 服务端口（允许所有 IP 的入站连接）。因此，如果你托管了任何特定端口的服务，则要为你的服务器在 AWS 防火墙上打开相应端口。

同样它的 1 到 65535 的端口是打开的（对于所有出站流量）。如果你想改变这个，你可以使用下面的方法编辑出站规则。

在 AWS 上为你的服务器设置防火墙规则很容易。你能够在几秒钟内为你的服务器打开端口。我将用截图指导你如何打开 EC2 服务器的端口。

### 步骤 1 ：

登录 AWS 帐户并进入 **EC2 管理控制台**。进入<ruby>“网络及安全”<rt>Network & Security </rt></ruby>菜单下的<ruby>**安全组**<rt>Security Groups</rt></ruby>，如下高亮显示：

 ![AWS EC2 management console](http://cdn2.kerneltalks.com/wp-content/uploads/2017/03/AWS-EC2-management-console.jpg) 

*AWS EC2 管理控制台*

### 步骤 2 :

在<ruby>安全组<rt>Security Groups</rt></ruby>中选择你的 EC2 服务器，并在 <ruby>**行动**<rt>Actions</rt></ruby> 菜单下选择 <ruby>**编辑入站规则**<rt>Edit inbound rules</rt></ruby>。

 ![AWS inbound rules](http://cdn2.kerneltalks.com/wp-content/uploads/2017/03/AWS-inbound-rules.jpg) 

*AWS 入站规则菜单*

### 步骤 3:

现在你会看到入站规则窗口。你可以在此处添加/编辑/删除入站规则。这有几个如 http、nfs 等列在下拉菜单中，它们可以为你自动填充端口。如果你有自定义服务和端口，你也可以定义它。

 ![AWS add inbound rule](http://cdn2.kerneltalks.com/wp-content/uploads/2017/03/AWS-add-inbound-rule.jpg) 

*AWS 添加入站规则*

比如，如果你想要打开 80 端口，你需要选择：

*   类型：http
*   协议：TCP
*   端口范围：80
*   源：任何来源：打开 80 端口接受来自“任何IP（0.0.0.0/0）”的请求；我的 IP：那么它会自动填充你当前的公共互联网 IP


### 步骤 4:

就是这样了。保存完毕后，你的服务器入站 80 端口将会打开！你可以通过 telnet 到 EC2 服务器公共域名的 80 端口来检验（可以在 EC2 服务器详细信息中找到）。

你也可以在 [ping.eu][12] 等网站上检验。

* * *

同样的方式可以编辑出站规则，这些更改都是即时生效的。

--------------------------------------------------------------------------------

via: http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/

作者：[Shrikant Lavhate][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/
[1]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[2]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[3]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[4]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[5]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[6]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[7]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[8]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[9]:http://kerneltalks.com/virtualization/how-to-open-port-on-aws-ec2-linux-server/#
[10]:http://kerneltalks.com/author/shrikant/
[11]:http://kerneltalks.com/howto/install-ec2-linux-server-aws-with-screenshots/
[12]:http://ping.eu/port-chk/
