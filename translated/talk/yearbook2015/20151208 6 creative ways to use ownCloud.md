GHLandy Translated 

使用 ownCloud 的六个创意方法
================================================================================
![Yearbook cover 2015](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/osdc-open-source-yearbook-lead1-inc0335020sw-201511-01.png)

图片来源：Opensource.com

[ownCloud][1] 是一个自我托管且开源的文件同步和共享服务上。就像 "big boys" Dropbox、Google Drive、Box 和其他的同类服务一样，ownCloud 可以让你访问自己的文件、日历、联系人和其他数据。你可以在自己设备之间进行任意数据（包括它自身的一部分）同步以及给其他人分享文件。然而，ownCloud 并非只能运行在它自己的开发商之中，试试[将 ownCloud 运行在其他服务器上][2]

现在，一起来看看在 ownCloud 上的六件创意事件。其中一些是由于 ownCloud 的开源才得以完成，而另外的则是 ownCloud 自身特有的功能。

### 1. 可扩展的 ownCloud 派集群 ###

由于 ownCloud 是开源的，你可以选择将它运行在自己的服务器中，或者从你信任的服务器提供商那里获取空间——没必要将你的文件存储在大公司的服务器中，谁知他们将你的文件存储到哪里去。[点击此处查看部分 ownCloud 服务商][3]，或者下载该服务软件到你的虚拟主机中[搭建自己的服务器][4].

![](https://opensource.com/sites/default/files/images/life-uploads/banana-pi-owncloud-cluster.jpg)

拍摄： Jörn Friedrich Dreyer. [CC BY-SA 4.0.][5]

我们见过最具创意的事情就是组建 [香蕉派集群][6] 和 [树莓派集群][7]。ownCloud 的扩展性通常是成千上万的用户来完成的，这些人则将它往不同方向发展，通过大量的小型系统集群在一起，就可以创建出运行速度非常快的 ownCloud。酷毙了！

### 2. 密码同步 ###

为了让 ownCloud 更容易扩展，我们需要将它模块化，并拥有 [ownCloud app store][8]。然后你就可以在里边搜索音乐、视频播放器、日历、联系人、生产应用、游戏、应用框架等。

仅从 200 多个可用应用中挑选一个是一件非常困难的事，但密码管理则是一个很好的特性。ownCloud app store 里边至少有三款这种应用：[Passwords][9]、[Secure Container][10] 和 [Passman][11]。

![](https://opensource.com/sites/default/files/images/life-uploads/password.png)

### 3. 随心所欲地存储文件 ###

外部存储允许你通过接口将现有数据联系到 ownCloud，让你轻松访问存储在FTP、WebDAV、Amazon S3，甚至 Dropbox 和Google Drive。

注：youtube 视频
<iframe width="520" height="315" frameborder="0" allowfullscreen="" src="https://www.youtube.com/embed/uezzFDRnoPY"></iframe>

DropBox 喜欢创建自己的 “围墙式花园”，只有注册用户之间才可以进行协作；假如你通过Google Drive 来分享文件，你的同伴也必须要有一个 Google 账号才可以访问的分享。通过 ownCloud 的外部存储功能，你可以轻松打破这些规则障碍。

最有创意的就是把 Google Drive 和 Dropbox 添加为外部存储。这样你就可以无缝的使用它们，并使用不需要账户地链接把文件分享给和你协作的人。

### 4. 下载以上传的文件 ###

由于 ownCloud 的开源，人们可以不受公司需求限制地向它共享代码，增加新特性。共献者关注的往往是安全和隐私，所以 ownCloud 引入的特性常常比别人的要早，比如通过密码保护的公共链接和[设置失效期限][12]。

现在，ownCloud 可以配置分享链接的读写权限了，这就是说链接的访问者可以无缝的编辑你分享给他们的文件（不管是否有密码保护），或者在不提供他们的私人数据来登录其他服务的情况下将文件上传到服务器。

注：youtube 视频
<iframe width="520" height="315" frameborder="0" allowfullscreen="" src="https://www.youtube.com/embed/3GSppxEhmZY"></iframe>

对于有人想给你分享大体积的文件时，这个特性就非常有用了。相比于上传到第三方站点、然后给你发送一个连接、你再去下载文件（通常需要登录），ownCloud 仅需要上传文件到你提供的分享文件夹、你就可以买上获取到文件了。

### 5. 免费却又安全的存储空间 ###

之前就强调过，我们的代码贡献者最关注的就是安全和隐私，这就是 ownCloud 中有用于加密和解密存储数据的应用的原因。

通过使用 ownCloud 将你的文件存储到 Dropbox 或者 Google Drive，则会违背控制数据以及保持数据隐私的原则。但是加密应用则刚好可以满足安全及隐私问题。在发送数据给这些提供商前进行数据加密，并在取回数据的时候进行解密，你的数据就会变得很安全。

### 6. 在你的可控范围内分享文件 ###

作为开源项目，ownCloud 没有必要自建 “围墙式花园”。进入联邦云共享：[developed and published by ownCloud][13] 协议使不同的文件同步和共享服务器可以彼此之间进行通信，并能够安全地传输文件。联邦云共享本身有一个有趣的故事：[22 所德国大学][14] 想要为自身的 500,000 学生建立一个庞大的云服务，但是每个大学都想控制自己学生数据。于是乎，我们需要一个可行性解决方案：也就是联邦云服务。该解决方案让让学生保持连接，使得他们可以无缝的协同工作。同时，每个大学的系统管理员保持着对自己学生创建的文件的控制权，如限制存储或者限制什么人、什么文件以及如何共享。

注：youtube 视频
<iframe width="520" height="315" frameborder="0" allowfullscreen="" src="https://www.youtube.com/embed/9-JEmlH2DEg"></iframe>

并且，这项令人崇敬的技术并没有限制于德国的大学之间，而是每个 ownCloud 用户都能在自己的用户设置中找到自己的 [联邦云 ID][15]，并将之分享给同伴。

现在你明白了吧。仅六个方法，ownCloud 就能让人们完成特殊和特别的事。而是这一切成为可能的，就是 ownCloud 的开源 —— 设计用来释放你数据。

--------------------------------------------------------------------------------

via: https://opensource.com/life/15/12/6-creative-ways-use-owncloud

作者：[Jos Poortvliet][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jospoortvliet
[1]:https://owncloud.com/
[2]:https://blogs.fsfe.org/mk/new-stickers-and-leaflets-no-cloud-and-e-mail-self-defense/
[3]:https://owncloud.org/providers
[4]:https://owncloud.org/install/#instructions-server
[5]:https://creativecommons.org/licenses/by-sa/4.0/
[6]:http://www.owncluster.de/
[7]:https://christopherjcoleman.wordpress.com/2013/01/05/host-your-owncloud-on-a-raspberry-pi-cluster/
[8]:https://apps.owncloud.com/
[9]:https://apps.owncloud.com/content/show.php/Passwords?content=170480
[10]:https://apps.owncloud.com/content/show.php/Secure+Container?content=167268
[11]:https://apps.owncloud.com/content/show.php/Passman?content=166285
[12]:https://owncloud.com/owncloud45-community/
[13]:http://karlitschek.de/2015/08/announcing-the-draft-federated-cloud-sharing-api/
[14]:https://owncloud.com/customer/sciebo/
[15]:https://owncloud.org/federation/
