如何在终端中使用 Instagram
======
![](https://www.ostechnix.com/wp-content/uploads/2018/03/instagram-in-terminal-720x340.png)
Instagram 不需要介绍。它是像 Facebook 和 Twitter 之类的流行社交网络平台之一，它可以公开或私下分享照片和视频给确认过的粉丝。它是由两位企业家于 2010 年发起的，分别是 **Kevin Systrom** and **Mike Krieger**。2012 年，社交网络巨头 Facebook 收购了 Instagram。Android 和 iOS 设备上免费提供 Instagram。我们也可以通过网络浏览器在桌面系统中使用它。而且，最酷的是现在你可以在任何类 Unix 操作系统上的终端中使用 Instagram。你兴奋了吗？那么，请阅读以下内容了解如何在终端上查看你的Instagram feed。

### 终端中的 Instagram

首先，按照以下链接中的说明安装 **pip3**。

然后，git clone “instagram-terminal-news-feed” 脚本仓库。
```
$ git clone https://github.com/billcccheng/instagram-terminal-news-feed.git

```

以上命令会将 instagram 脚本的内容克隆到当前工作目录中名为 “instagram-terminal-news-feed” 的目录中。cd 到该目录：
```
$ cd instagram-terminal-news-feed/

```

然后，运行以下命令安装 instagram 终端 feed：
```
$ pip3 install -r requirements.txt

```

现在，运行以下命令在 Linux 终端中启动 instagram。
```
$ python3 start.py

```

输入你的 Instagram 用户名和密码，并直接从终端中浏览你的 Instagram feed。你的 instragram 用户名和密码将仅本地存储在名为 **credential.json** 的文件中。所以，你不必担心它。你也可以选择不保存默认保存的凭证。

下面是[**我的 Instagram 页面**][1]的一些截图。

![][3]

![][4]

![][5]

请注意，你只能查看你的 feed。你不能关注任何人，喜欢或评论帖子。这只是一个 instagram feed 阅读器。

该项目可在 GitHub 上免费获得，因此你可以查看源代码，改进它，添加更多功能，修复任何 bug。

玩得开心！干杯！！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-use-instagram-in-terminal/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.instagram.com/ostechnix/
[3]:http://www.ostechnix.com/wp-content/uploads/2018/03/instagram-in-terminal-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/03/instagram-in-terminal-2.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/instagram-in-terminal-3-2.png
