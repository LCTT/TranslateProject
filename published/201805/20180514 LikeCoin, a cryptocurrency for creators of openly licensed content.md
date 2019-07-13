LikeCoin，一种给开放式许可的内容创作者的加密货币
======

> 在共创协议下授权作品和挣钱这二者不再是一种争议。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_whitehurst_money.png?itok=ls-SOzM0)

传统观点认为，作家、摄影师、艺术家和其他创作者在<ruby>共创协议<rt>Creative Commons</rt></ruby>和其他开放许可下免费共享内容的不会得到报酬。这意味着大多数独立创作者无法通过在互联网上发布他们的作品来赚钱。而现在有了 [LikeCoin][1]：一个新的开源项目，旨在使这个让艺术家们经常为了贡献而不得不妥协或牺牲的常识成为过去。

LikeCoin 协议旨在通过创意内容获利，以便创作者可以专注于创造出色的内容而不是出售它。

该协议同样基于去中心化技术，它可以跟踪何时使用内容，并使用 LikeCoin 这种 [以太坊 ERC-20][2] 加密货币通证来奖励其创作者。它通过“<ruby>创造性共识<rt>Proof of Creativity</rt></ruby>”算法进行操作，该算法一部分根据作品收到多少个“喜欢”，一部分根据有多少作品衍生自它而分配 LikeCoin。由于开放式授权的内容有更多机会被重复使用并获得 LikeCoin 令牌，因此系统鼓励内容创作者在<ruby>共创协议<rt>Creative Commons</rt></ruby>许可下发布。

### 如何运作的

当通过 LikeCoin 协议上传创意片段时，内容创作者也将包括作品的元数据，包括作者信息及其 InterPlanetary 关联数据（[IPLD][3]）。这些数据构成了衍生作品的家族图谱；我们称作品与其衍生品之间的关系为“内容足迹”。这种结构使得内容的继承树可以很容易地追溯到原始作品。

LikeCoin 通证会使用作品的衍生历史记录的信息来将其分发给创作者。由于所有创意作品都包含作者钱包的元数据，因此相应的 LikeCoin 份额可以通过算法计算并分发。

LikeCoin 可以通过两种方式获得奖励：要么由想要通过支付给内容创建者来表示赞赏的个人直接给予，或通过 Creators Pool 收集观众的“赞”的并根据内容的 LikeRank 分配 LikeCoin。基于在 LikeCoin 协议中的内容追踪，LikeRank 衡量作品重要性（或者我们在这个场景下定义的创造性）。一般来说，一副作品有越多的衍生作品，创意内容的创新就越多，内容就会有更高的 LikeRank。 LikeRank 是内容创新性的量化者。

### 如何参与？

LikeCoin 仍然非常新，我们期望在 2018 年晚些时候推出我们的第一个去中心化程序来奖励<ruby>共创协议<rt>Creative Commons</rt></ruby>的内容，并与更大的社区无缝连接。

LikeCoin 的大部分代码都可以在 [LikeCoin GitHub][4] 仓库中通过 [GPL 3.0 许可证][5]访问。由于它仍处于积极开发阶段，一些实验代码尚未公开，但我们会尽快完成。

我们欢迎功能请求、拉取请求、复刻和星标。请参与我们在 Github 上的开发，并加入我们在 [Telegram][6] 的讨论组。我们同样在 [Medium][7]、[Facebook][8]、[Twitter][9] 和我们的网站 [like.co][1] 发布关于我们进展的最新消息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/likecoin

作者：[Kin Ko][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ckxpress
[1]:https://like.co/
[2]:https://en.wikipedia.org/wiki/ERC20
[3]:https://ipld.io/
[4]:https://github.com/likecoin
[5]:https://www.gnu.org/licenses/gpl-3.0.en.html
[6]:https://t.me/likecoin
[7]:http://medium.com/likecoin
[8]:http://fb.com/likecoin.foundation
[9]:https://twitter.com/likecoin_fdn
