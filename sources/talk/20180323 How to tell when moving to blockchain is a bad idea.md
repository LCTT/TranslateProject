pinewall Translating
How to tell when moving to blockchain is a bad idea
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/blocks_building.png?itok=eMOT-ire)
So, there's this thing called "blockchain" that is quite popular…

You know that already, of course. I keep wondering whether we've hit "peak hype" for blockchain and related technologies yet, but so far there's no sign of it. When I'm talking about blockchain here, I'm including distributed ledger technologies (DLTs), which are, by some tight definitions of the term, not really blockchains at all. I'm particularly interested, from a professional point of view, in permissioned blockchains. You can read more about how that's defined in my article [Is blockchain a security topic?][1] The key point here is that I'm interested in business applications of blockchain beyond cryptocurrency.1

And, if the hype is to be believed—and some of it probably should be2—then there is an almost infinite set of applications for blockchain. That's probably correct, but it doesn't mean all of them are good applications for blockchain. Some, in fact, are likely to be very bad applications for blockchain.

The hype associated with blockchain, however, means that businesses are rushing to embrace this new technology3 without really understanding what they're doing. The drivers towards this are arguably three-fold:

  1. You can, if you try, make almost any application with multiple users that stores data into a blockchain-enabled application.
  2. There are lots of conferences and "gurus" telling people that if they don't embrace blockchain now, they'll go out of business within six months4.
  3. It's not easy technology to understand fully, and lots of its proponents "on-the-ground" in organisations are techies.



I want to unpack that last statement before I get a hail of trolls flaming me.5 I have nothing against techies—I'm one myself—but one of our characteristics tends to be enormous enthusiasm about new things ("shinies") that we understand, but whose impact on the business we don't always fully grok.6 That's not always a positive for business leaders.

The danger, then, is that the confluence of those three drivers may lead to businesses moving to blockchain applications without fully understanding whether it's a good idea. I wrote in another post ([Blockchain: should we all play?][2]) about some tests to decide when a process is a good fit for blockchain and when it's not. They were useful, but the more I think about it, the more I'm convinced that we need some simple tests to tell us when we should definitely not move a process or an application to a blockchain. I present my three tests. If your answer to any of these questions is "yes," then you almost certainly don't need a blockchain.

### Test 1: Does it have a centralised controller or authority?

If the answer is "yes," then you don't need a blockchain.

If, for instance, you're selling, I don't know, futons, and you have a single ordering system, then you have a single authority for deciding when to send out a futon. You almost certainly don't need to make this a blockchain. If you are a purveyor of content that has to pass through a single editorial and publishing process, you almost certainly don't need to make this a blockchain.

The lesson is: Blockchains really don't make sense unless the tasks required in the process execution—and the trust associated with those tasks—is distributed among multiple entities.

### Test 2: Could it work fine with a standard database?

If the answer to this question is "yes," then you don't need a blockchain.

This and the previous question are somewhat intertwined but don't need to be. There are applications where you have distributed processes but need to store information centrally, or you have centralised authorities but distributed data, where one answer may be "yes" and the other is "no." But if your answer to this question is "yes," use a standard database.

Databases are good at what they do, they are cheaper in terms of design and operations than running a blockchain or distributed ledger, and we know how to make them work. Blockchains are about letting everybody8 see and hold data, but the overheads can be high and the implications costly.

### Test 3: Is adoption going to be costly or annoying to some stakeholders?

If the answer to this question is "yes," then you don't need a blockchain.

I've heard assertions that blockchains always benefit all users. This is patently false. If you are creating an application for a process and changing the way your stakeholders interact with you and it, you need to consider whether that change is in their best interests. It's very easy to create and introduce an application, blockchain or not, that reduces business friction for the owner of the process but increases it for other stakeholders.

If I make engine parts for the automotive industry, it may benefit me immensely to be able to track and manage the parts on a blockchain. I may be able to see at a glance who supplied what, when, and the quality of the steel used in the (for example) ball bearings I buy. On the other hand, if I'm a ball-bearing producer with an established process that works for the 40 other companies to whom I sell ball bearings, adopting a new process for one company—with associated changes to my method of work, systems, storage, and security requirements—is unlikely to be in my best interests. It's going to be both costly and annoying.

### In summary

Tests are guidelines; they're not fixed in stone. One of these tests looks like a technical test (the database one), but it's really as much about business roles and responsibilities as the other two. All of them, hopefully, can be used as a counterbalance to the three drivers of blockchain adoption I mentioned.

1\. Which, don't get me wrong, is definitely interesting and a business application—it's just not what I'm going to talk about in this post.

2\. The trick is knowing which bits. Let me know if you work out how, OK?

3\. It's actually quite a large set of technologies, to be honest.

4\. Which is patently untrue, unless the word "they" refers to the conferences and gurus, in which case it's probably correct.

5\. Which may happen anyway due to my egregious mixing of metaphors.

6\. There's a word to love. I've put it in to exhibit my techie credentials.7

7\. And before you doubt them, yes, I've read the book, in both cut and uncut versions.

8\. Within reason.

This article originally appeared on [Alice, Eve, and Bob – a security blog][3] and is republished with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/3-tests-not-moving-blockchain

作者：[Mike Bursell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mikecamel
[1]:https://opensource.com/article/17/12/blockchain-security-topic
[2]:https://aliceevebob.com/2017/09/12/blockchain-should-we-all-play/
[3]:https://aliceevebob.com/2018/02/13/3-tests-for-not-moving-to-blockchain/
