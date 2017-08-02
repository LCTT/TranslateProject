LinkArchiver：自动提交链接给互联网档案（Internet Archive）
============================================================

> 在 Twitter 上分享的链接可以永久保存，用户不用担心。

 
![LinkArchiver automatically submits links to the Internet Archive](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/internet_archive_building_sanfran.jpg?itok=pm9eVwbC "LinkArchiver automatically submits links to the Internet Archive")


互联网是永远的，当发生下面的情况的就不是了。 “链接腐烂” - 当页面移动或者站点脱机，随着时间的流逝，到网站的有效链接就会断开 - 对于尝试在线做研究的人来说，这是一个真正的问题。[互联网档案馆（Internet Archive）][4]通过在它的“时光机（Wayback Machine）”中提供提交的内容来帮助解决这个问题。

当然，困难的是让人们记得提交档案链接。

这就是 Parker Higgins 的新 Twitter 机器人所切入的地方。[@LinkArchiver][5] 会自动提交关注了[互联网档案馆（Internet Archive）][4]的帐户所提交的链接。如果一个 Twitter 用户关注了 [@LinkArchiver][6]，它会回关，即使用户取消关注机器人，它也会继续添加链接。这意味着在 Twitter 上共享的链接可以永久保存，用户不用担心。

无需留意这个方面对 Higgins 非常有吸引力。他对 Opensource.com 说：“我对整个装置的被动程度非常在意。如果你依靠人们选择什么是_重要的_来存档，你会错过很多最重要的东西，只要抓取每个发表链接的副本，这个机器人应该有助于确保我们不会错过上下文。”

在最初开发机器人之后，Higgins 联系了[互联网档案馆（Internet Archive）][4]。他对自动化造成问题的担忧很快被消除。尽管他在请求时给 API 请求用了一个自定义的用户代理字符串，但是他说：“他们处理的流量实际上是个舍入错误。”扩展性的问题在 Twitter 方面：其服务限制了帐户的关注者数量和新关注者的比例。这限制了 LinkArchiver 的单个实例的能力。

幸运的是，LinkArchiver 以 AGPLv3 授权在 [GitHub][7] 上发布。

有了一台小的服务器和一个 Twitter 账号, 任何人都可以运行这个机器人。Higgins 设想人们运行一个关注特定的兴趣或社交圈子的 LinkArchiver 的实例。“发生在我身上的一件事是，你可以关闭回关行为，并关注特定的组或者兴趣。例如，机器人可以关注一群朋友或同学，或主要媒体，或每一个美国参议员和代表，并存档他们发表的 tweet。”

这不是 Higgins 第一次写 Twitter 机器人：[@securethenews][8]、[@pomological][9] 以及受欢迎的 [@choochoobot][10] 是他之前的作品。这些机器人都是只写的。 LinkArchiver 是他开发的第一个互动机器人，这需要学习几种新技能。这是 Higgins 参与 [Recurse Center][11] 的一部分，这是为程序员进行的为期 12 周的活动。

Higgins 鼓励大家的拉取请求以及其他的 LinkArchiver 机器人实例。

（题图：Beatrice Murch 拍摄的 Inernet Archive 总部; CC BY ([on Flickr][3])）

--------------------------------------------------------------------------------

作者简介：

Ben Cotton - Ben Cotton 是一个受训过的气象学家和一名高性能计算机工程师。Ben 在 Cycle Computing 做技术传教士。他是 Fedora 用户和贡献者，合作创办当地的一个开源集会，是一名开源倡议者和软件自由机构的支持者。他的推特 (@FunnelFiasco)


---

via: https://opensource.com/article/17/7/linkarchiver-automatically-submits-links-internet-archive

作者：[Ben Cotton][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:https://opensource.com/article/17/7/linkarchiver-automatically-submits-links-internet-archive?rate=Z9DDX962B5JWk6LID_iia3S7H9s7ZMF8cGTVlNLvCs8
[2]:https://opensource.com/user/30131/feed
[3]:https://www.flickr.com/photos/blmurch/5079018246/
[4]:https://archive.org/
[5]:https://twitter.com/linkarchiver
[6]:https://twitter.com/linkarchiver
[7]:https://github.com/thisisparker/linkarchiver
[8]:https://twitter.com/securethenews
[9]:https://twitter.com/pomological
[10]:https://twitter.com/choochoobot
[11]:https://www.recurse.com/
[12]:https://opensource.com/users/bcotton
[13]:https://opensource.com/users/bcotton
