LikeCoin, a cryptocurrency for creators of openly licensed content
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_whitehurst_money.png?itok=ls-SOzM0)

Conventional wisdom indicates that writers, photographers, artists, and other creators who share their content for free, under Creative Commons and other open licenses, won't get paid. That means most independent creators don't make any money by publishing their work on the internet. Enter [LikeCoin][1]: a new, open source project that intends to make this convention, where artists often have to compromise or sacrifice in order to contribute, a thing of the past.

The LikeCoin protocol is designed to monetize creative content so creators can focus on creating great material rather than selling it.

The protocol is also based on decentralized technologies that track when content is used and reward its creators with LikeCoin, an [Ethereum ERC-20][2] cryptocurrency token. It operates through a "Proof of Creativity" algorithm which assigns LikeCoins based partially on how many "likes" a piece of content receives and how many derivative works are produced from it. Because openly licensed content has more opportunity to be reused and earn LikeCoin tokens, the system encourages content creators to publish under Creative Commons licenses.

### How it works

When a creative piece is uploaded via the LikeCoin protocol, the content creator includes the work's metadata, including author information and its InterPlanetary Linked Data ([IPLD][3]). This data forms a family graph of derivative works; we call the relationships between a work and its derivatives the "content footprint." This structure allows a content's inheritance tree to be easily traced all the way back to the original work.

LikeCoin tokens will be distributed to creators using information about a work's derivation history. Since all creative works contain the metadata of the author's wallet, the corresponding LikeCoin shares can be calculated through the algorithm and distributed accordingly.

LikeCoins are awarded in two ways: either directly by individuals who want to show their appreciation by paying a content creator, or through the Creators Pool, which collects viewers' "Likes" and distributes LikeCoin according to a content's LikeRank. Based on content-footprint tracing in the LikeCoin protocol, the LikeRank measures the importance (or creativity as we define it in this context) of a creative content. In general, the more derivative works a creative content generates, the more creative the creative content is, and thus the higher LikeRank of the content. LikeRank is the quantifier of the creativity of contents.

### Want to get involved?

LikeCoin is still very new, and we expect to launch our first decentralized application later in 2018 to reward Creative Commons content and connect seamlessly with a much larger and established community.

Most of LikeCoin's code can be accessed in the [LikeCoin GitHub][4] repository under a [GPL 3.0 license][5]. Since it's still under active development, some of the experimental code is not yet open to the public, but we will make it so as soon as possible.

We welcome feature requests, pull requests, forks, and stars. Please join our development on GitHub and our general discussions on [Telegram][6]. We also release updates about our progress on [Medium][7], [Facebook][8], [Twitter][9], and our website, [like.co][1].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/likecoin

作者：[Kin Ko][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
