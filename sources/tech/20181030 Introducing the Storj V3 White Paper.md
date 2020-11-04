[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introducing the Storj V3 White Paper)
[#]: via: (https://www.jtolio.com/2018/10/introducing-the-storj-v3-white-paper)
[#]: author: (jtolio.com https://www.jtolio.com/)

Introducing the Storj V3 White Paper
======

_[This article was originally posted on the Storj Labs blog.][1]_

Since Storj’s humble inception at the Texas Bitcoin Hackathon four years ago - you know, the one where our cofounder Shawn Wilkinson and his first Storj prototype won the main prize - our team has been through a lot. Our community has exploded, we released our production network and announced plans to pivot to a new platform that could better scale to support exabytes of data. Part of this pivot involves releasing the architecture of this new platform. After all of this exciting new growth, I’m pleased to announce that we are finally releasing our updated V3 white paper. [You can view the white paper here.][2]

This white paper is the culmination of a big team effort. Our hefty V2 paper weighed in at 37 pages, but our new V3 paper is even more detailed - to the tune of over 90 pages! I’ve personally read it at least 20 different times, and it’s come a long way! This paper represents the combined efforts of no fewer than 36 people, not counting additional reviewers and supporters who contributed time and effort to make this what it is. I want to extend an especially big thanks to all contributors for all of the effort they invested to make this paper a success.

![][3]

Based on decades of academic research and experience, this paper ultimately ended with nine pages of citations, the oldest of which comes all the way from 1946! Among the many lessons we learned and research we gathered, we realized that the experience that we gleaned from working with our previous network was among the most valuable. At over 150 PB of data stored, we learned what did and did not work well in designing a fault tolerant storage system. Ultimately, we are proud of the engineering effort that went into designing this paper, and are immensely grateful for the shoulders on which we stand.

You’ll notice we do things a bit differently in Storj V3 than we did before and what you may have seen in other systems, so I’d like to take a minute and call out the important areas.

### What’s new and different?

The first thing you’ll notice in our paper is that we dedicate an entire chapter to design constraints. Before we dug into our re-architecture, we wanted to think carefully both about what we wanted to build and what we didn’t. We spent a lot of time considering our goals, the market, user profiles, use cases, and what would make the biggest practical impact in decentralizing the world’s storage.

We decided our top goal was to build a platform that is automatically encrypted, easily implemented, highly performant, exceptionally economical, and ridiculously resilient. We also determined that the most tactical way to shift the world toward that vision in the present was to build our platform to be Amazon S3 compatible. Compatibility can’t be limited to only API compatibility; we must be compatible - or better - in terms of performance, durability, functionality (such as native streaming), security, and privacy. This requirement is the framework that has guided most of our other decisions.

The next thing you’ll notice is we deliberately avoid storage solutions that require a globally distributed ledger. Of course we will still use the Ethereum ERC20 STORJ token for payment to storage node operators. This is a critical part of our platform and it would be impossible to achieve what we are aiming to do without a token. But there exists no other relationship between blockchains and our platform. A major goal for us is to achieve massive, horizontal scaling, but trying to reach consensus among a large group of computers over a wide-area network fundamentally limits our throughput yield. Ethereum’s peak transaction rate, so far, happened in January of this year at a little over 15 transactions per second. Blockchain-based solutions do not gain throughput with added hardware, and there is an ongoing discussion of how to make Ethereum (or other distributed ledgers) scale faster. Meanwhile, Amazon S3’s documentation casually suggests ways to scale a single customer’s workload to 55,000 transactions per second! Instead of trying to achieve global consensus, we fundamentally need a different technology to achieve cloud-storage-competitive performance.

Many distributed storage platforms use replication to ensure data remains available even if storage nodes fail. For example, Filecoin’s architecture is based around proof of replication, cementing replication as a central tenet of Filecoin’s architecture. We believe replication is fundamentally flawed for distributed storage over a wide-area network. Instead, we use erasure codes. We’ll leave how erasure codes beat the pants off replication for another post (or you can read the white paper to find out more), but suffice it to say, erasure codes are The Best™.

### So?

Otherwise, our system is based on proven, existing technologies. Our overall architecture in many ways mirrors the architecture of Google’s GFS system or the Lustre file system (which happens to be the choice used in 60 of the top 100 supercomputers in the world), but in a decentralized setting. Distributed systems are complex enough; we don’t need to add any more complexity than is strictly necessary.

There are a lot more interesting details in the paper that I’m leaving out of this teaser blog post, but suffice it to say that, overall, we hope you find our architecture almost upsettingly simple, relative to other projects in the space. We’ll be zeroing in on these topics and more in upcoming blog posts intending to highlight various aspects of our paper. [In the meantime, please go ahead and read the paper!][2] Once you do, you can also join our waitlist to be a farmer on the network or be notified when we’re ready for you to store data on the new V3 network.

Looking forward to having you along on our journey to decentralize the world’s data!

--------------------------------------------------------------------------------

via: https://www.jtolio.com/2018/10/introducing-the-storj-v3-white-paper

作者：[jtolio.com][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.jtolio.com/
[b]: https://github.com/lujun9972
[1]: https://storj.io/blog/2018/10/introducing-the-storj-v3-white-paper/
[2]: http://storj.io/whitepaper
[3]: https://www.jtolio.com/images/reposts/citations.png
