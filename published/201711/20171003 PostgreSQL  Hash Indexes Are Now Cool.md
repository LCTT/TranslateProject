PostgreSQL 的哈希索引现在很酷
======

由于我刚刚提交了最后一个改进 PostgreSQL 11 哈希索引的补丁，并且大部分哈希索引的改进都致力于预计下周发布的 PostgreSQL 10（LCTT 译注：已发布），因此现在似乎是对过去 18 个月左右所做的工作进行简要回顾的好时机。在版本 10 之前，哈希索引在并发性能方面表现不佳，缺少预写日志记录，因此在宕机或复制时都是不安全的，并且还有其他二等公民。在 PostgreSQL 10 中，这在很大程度上被修复了。

虽然我参与了一些设计，但改进哈希索引的首要功劳来自我的同事 Amit Kapila，[他在这个话题下的博客值得一读][1]。哈希索引的问题不仅在于没有人打算写预写日志记录的代码，还在于代码没有以某种方式进行结构化，使其可以添加实际上正常工作的预写日志记录。要拆分一个桶，系统将锁定已有的桶（使用一种十分低效的锁定机制），将半个元组移动到新的桶中，压缩已有的桶，然后松开锁。即使记录了个别更改，在错误的时刻发生崩溃也会使索引处于损坏状态。因此，Aimt 首先做的是重新设计锁定机制。[新的机制][2]在某种程度上允许扫描和拆分并行进行，并且允许稍后完成那些因报错或崩溃而被中断的拆分。完成了一系列漏洞的修复和一些重构工作，Aimt 就打了另一个补丁，[添加了支持哈希索引的预写日志记录][3]。

与此同时，我们发现哈希索引已经错过了许多已应用于 B 树索引多年的相当明显的性能改进。因为哈希索引不支持预写日志记录，以及旧的锁定机制十分笨重，所以没有太多的动机去提升其他的性能。而这意味着如果哈希索引会成为一个非常有用的技术，那么需要做的事只是添加预写日志记录而已。PostgreSQL 索引存取方法的抽象层允许索引保留有关其信息的后端专用缓存，避免了重复查询索引本身来获取相关的元数据。B 树和 SQLite 的索引正在使用这种机制，但哈希索引没有，所以我的同事 Mithun Cy 写了一个补丁来[使用此机制缓存哈希索引的元页][4]。同样，B 树索引有一个称为“单页回收”的优化，它巧妙地从索引页移除没用的索引指针，从而防止了大量索引膨胀。我的同事 Ashutosh Sharma 打了一个补丁将[这个逻辑移植到哈希索引上][5]，也大大减少了索引的膨胀。最后，B 树索引[自 2006 年以来][6]就有了一个功能，可以避免重复锁定和解锁同一个索引页——所有元组都在页中一次性删除，然后一次返回一个。Ashutosh Sharma 也[将此逻辑移植到了哈希索引中][7]，但是由于缺少时间，这个优化没有在版本 10 中完成。在这个博客提到的所有内容中，这是唯一一个直到版本 11 才会出现的改进。

关于哈希索引的工作有一个更有趣的地方是，很难确定行为是否真的正确。锁定行为的更改只可能在繁重的并发状态下失败，而预写日志记录中的错误可能仅在崩溃恢复的情况下显示出来。除此之外，在每种情况下，问题可能是微妙的。没有东西崩溃还不够；它们还必须在所有情况下产生正确的答案，并且这似乎很难去验证。为了协助这项工作，我的同事 Kuntal Ghosh 先后跟进了最初由 Heikki Linnakangas 和 Michael Paquier 开始的工作，并且制作了一个 WAL 一致性检查器，它不仅可以作为开发人员测试的专用补丁，还能真正[提交到 PostgreSQL][8]。在提交之前，我们对哈希索引的预写日志代码使用此工具进行了广泛的测试，并十分成功地查找到了一些漏洞。这个工具并不仅限于哈希索引，相反：它也可用于其他模块的预写日志记录代码，包括堆，当今的所有 AM 索引，以及一些以后开发的其他东西。事实上，它已经成功地[在 BRIN 中找到了一个漏洞][9]。

虽然 WAL 一致性检查是主要的开发者工具——尽管它也适合用户使用，如果怀疑有错误——也可以升级到专为数据库管理人员提供的几种工具。Jesper Pedersen 写了一个补丁来[升级 pageinspect contrib 模块来支持哈希索引][10]，Ashutosh Sharma 做了进一步的工作，Peter Eisentraut 提供了测试用例（这是一个很好的办法，因为这些测试用例迅速失败，引发了几轮漏洞修复）。多亏了 Ashutosh Sharma 的工作，pgstattuple contrib 模块[也支持哈希索引了][11]。

一路走来，也有一些其他性能的改进。我一开始没有意识到的是，当一个哈希索引开始新一轮的桶拆分时，磁盘上的大小会突然加倍，这对于 1MB 的索引来说并不是一个问题，但是如果你碰巧有一个 64GB 的索引，那就有些不幸了。Mithun Cy 通过编写一个补丁，把加倍过程[分为四个阶段][12]在某个程度上解决了这一问题，这意味着我们将从 64GB 到 80GB 到 96GB 到 112GB 到 128GB，而不是一次性从 64GB 到 128GB。这个问题可以进一步改进，但需要对磁盘格式进行更深入的重构，并且需要仔细考虑对查找性能的影响。	

七月时，一份[来自于“AP”测试人员][13]的报告使我们感到需要做进一步的调整。AP 发现，若试图将 20 亿行数据插入到新创建的哈希索引中会导致错误。为了解决这个问题，Amit 修改了拆分桶的代码，[使得在每次拆分之后清理旧的桶][14]，大大减少了溢出页的累积。为了得以确保，Aimt 和我也[增加了四倍的位图页的最大数量][15]，用于跟踪溢出页分配。

虽然还是有更多的事情要做，但我觉得，我和我的同事们——以及在 PostgreSQL 团队中的其他人的帮助下——已经完成了我们的目标，使哈希索引成为一个一流的功能，而不是被严重忽视的半成品。不过，你或许会问，这个功能可能有哪些应用场景。我在文章开头提到的（以及链接中的）Amit 的博客内容表明，即使是 pgbench 的工作负载，哈希索引页也可能在低级和高级并发方面优于 B 树。然而，从某种意义上说，这确实是最坏的情况。哈希索引的卖点之一是，索引存储的是字段的哈希值，而不是原始值——所以，我希望像 UUID 或者长字符串的宽键将有更大的改进。它们可能会在读取繁重的工作负载时做得更好。我们没有像优化读取那种程度来优化写入，但我鼓励任何对此技术感兴趣的人去尝试并将结果发到邮件列表（或发私人电子邮件），因为对于开发一个功能而言，真正关键的并不是一些开发人员去思考在实验室中会发生什么，而是在实际中发生了什么。

最后，我要感谢 Jeff Janes 和 Jesper Pedersen 为这个项目及其相关所做的宝贵的测试工作。这样一个规模适当的项目并不易得，以及有一群坚持不懈的测试人员，他们勇于打破任何废旧的东西的决心起了莫大的帮助。除了以上提到的人之外，其他人同样在测试，审查以及各种各样的日常帮助方面值得赞扬，其中包括 Andreas Seltenreich，Dilip Kumar，Tushar Ahuja，Alvaro Herrera，Micheal Paquier，Mark Kirkwood，Tom Lane，Kyotaro Horiguchi。谢谢你们，也同样感谢那些本该被提及却被我无意中忽略的所有朋友。

---
via：https://rhaas.blogspot.jp/2017/09/postgresqls-hash-indexes-are-now-cool.html

作者：[Robert Haas][a]
译者：[polebug](https://github.com/polebug)
校对：[wxy](https://github.com/wxy)

本文由[LCTT]（https://github.com/LCTT/TranslateProject）原创编译，[Linux中国]（https://linux.cn/）荣誉推出

[a]:http://rhaas.blogspot.jp
[1]:http://amitkapila16.blogspot.jp/2017/03/hash-indexes-are-faster-than-btree.html
[2]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=6d46f4783efe457f74816a75173eb23ed8930020
[3]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=c11453ce0aeaa377cbbcc9a3fc418acb94629330
[4]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=293e24e507838733aba4748b514536af2d39d7f2
[5]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=6977b8b7f4dfb40896ff5e2175cad7fdbda862eb
[6]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=7c75ef571579a3ad7a1d3ee909f11dba5e0b9440
[7]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=a507b86900f695aacc8d52b7d2cfcb65f58862a2
[8]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=7403561c0f6a8c62b79b6ddf0364ae6c01719068
[9]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=08bf6e529587e1e9075d013d859af2649c32a511
[10]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=e759854a09d49725a9519c48a0d71a32bab05a01
[11]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=ea69a0dead5128c421140dc53fac165ba4af8520
[12]:https://www.postgresql.org/message-id/20170704105728.mwb72jebfmok2nm2@zip.com.au
[13]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=ff98a5e1e49de061600feb6b4de5ce0a22d386af
[14]:https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=ff98a5e1e49de061600feb6b4de5ce0a22d386af
[15]:https://www.postgresql.org/message-id/CA%2BTgmoax6DhnKsuE_gzY5qkvmPEok77JAP1h8wOTbf%2Bdg2Ycrw%40mail.gmail.com











