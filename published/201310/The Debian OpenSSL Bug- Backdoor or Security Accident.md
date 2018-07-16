Debian OpenSSL Bug - 后门还是安全事故?
======================================================

之前，Ed 写了篇文章[《软件透明度》][1]，主旨是如果软件开发的过程是透明的，那么软件对恶意的后门（以及无心的安全漏洞）就更具抵抗性。

软件透明的因素包括公开源代码，可以阅读源代码或为一个项目反馈的问题做出贡献，以及参与内部开发讨论。他提到一种情况，在这儿我想详细讨论一下：在2008年，Debian项目（一个用于web服务器的很流行的linux发行版），[宣称][2]Debian中[OpenSSL][3]的伪随机数生成器遭到破解，已经不安全了。

首先，了解一些背景信息：伪随机数生成器（PRNG）就是一个程序，假定代号为F。给定一个随机种子s，则会得到一个看起来随机的长的二进制序列F(s)。如果我和你都使用同样的种子s，两个人会得到同样的二进制序列。但是如果我随机选择一个s，也不告诉你s是什么，你根本不能够推测F(s)的结果，如你所期望的，F(s)就是随机的。OpenSSL中的PRNG试图从系统中抓取不可预测的信息（称之为"熵"）,比如当前进程ID，或者很有可能是不同的内存内容（比如，由其它一些进程控制或可能控制的未初始化的内存）等等。把这些东西转换成种子s，就会得到随机比特流F(s)。

2006年，为了解决一个用于查找软件内存存取bug的[工具][5]的[警告问题][4]，一名Debian维护者[决定注释掉][6]OpenSSL PRNG里的[两行代码][7]。但是这两行代码非常重要，它们负责抓取几乎所有的不可预测的熵，以作为OpenSSL PRNG的种子。没有这些代码，PRNG只有总共32,767个选择可作为种子s，因而也只有这么多的F(s)供选择。

这样一来，很多依赖于OpenSSL随机数生成器的程序，其实并没有它们以为的那么多的随机选择。比如，一个这样的程序要为SSL（安全网络浏览）和SSH（安全远程登录）生成秘钥。严格来说，这些秘钥必须是随机的：如果你可以猜到我的秘钥，你就可以破解我使用该秘钥保护的任何东西。这意味着你有能力读取加密的通讯信息，[登录到远程服务器][8]，或者[伪造看起来似乎是真实的信息][9]。这个漏洞是2006年第一次引入，而且[进入到Ubuntu中][10](另一个流行的linux发行版，广泛应用于网络服务器)。漏洞影响到数以千计的服务器而且[存在了很长一段时间][11]，因为只是给受影响的服务器打补丁还不足以解决问题，必须替换掉任何在漏洞存在情况下生成的秘钥。

顺便说一句，为伪随机数生成器寻找熵是个[著名][12]的[难题][13]。事实上，在今天来看要解决这个问题依然是个[巨大的挑战][14]。随机错误难以检测，因为当你盯着输出看时，每次运行程序结果都不一样，就像随机的一样。弱随机性很难发现，但是它可以使（貌似）安全的加密系统失效。不过，Debian中的那个漏洞很醒目，被发现后[在安全社区][15][引起了很多嘲笑][16]。

于是有人问，这是个故意设置的后门吗？似乎不大可能。做出这个更改的代码维护者 [Kurt Roeckx][17]，后来成为[Debian项目的主管][18]。这意味着他是个可靠的家伙，不是为了插入漏洞而由NSA伪造出来的身份。想进入Debian项目组的核心，需要做出巨大的努力，那真是出了名的难进。这样看来，错误根本不是有意为之，而是[一系列失误][19]导致的，而且后果严重。

漏洞确实是在一个透明的环境下发生的。所做的任何一件事都是公开的。但是漏洞还是引入了，而且长时间未被注意到。部分原因在于，透明引起了很多混乱，导致本应发现这个显而易见的漏洞的人们也都没太在意。
另外，也因为漏洞本身太过微妙，一个随意的观察者很难发现修改带来的影响。

这是否意味着软件透明没什么帮助？ 我可不这么认为。许多人都赞同透明软件要比不透明软件更安全。但是这也并不表示漏洞不会产生，或者认为有其他人都看着呢而我们自己就可以掉以轻心。

至少，多年以后，透明可以让我们回顾，究竟是什么导致了某个漏洞--本文例子中，就是工程上的纰漏，而非人为破坏。

---

via: https://freedom-to-tinker.com/blog/kroll/software-transparency-debian-openssl-bug/

译者：[l3b2w1](https://github.com/l3b2w1) 校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出


[1]:https://freedom-to-tinker.com/blog/felten/software-transparency/
[2]:http://www.debian.org/security/2008/dsa-1571
[3]:https://www.openssl.org/
[4]:http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=363516
[5]:http://valgrind.org/
[6]:http://marc.info/?l=openssl-dev&m=114651085826293&w=2
[7]:http://svn.debian.org/viewsvn/pkg-openssl/openssl/trunk/rand/md_rand.c?rev=141&view=diff&r1=141&r2=140&p1=openssl/trunk/rand/md_rand.c&p2=/openssl/trunk/rand/md_rand.c
[8]:http://www.exploit-db.com/exploits/5622/
[9]:http://plog.sesse.net/blog/tech/2008-05-14-17-21_some_maths.html
[10]:http://www.ubuntu.com/usn/usn-612-1/
[11]:http://cseweb.ucsd.edu/~hovav/dist/debiankey.pdf
[12]:http://xkcd.com/221/
[13]:http://dilbert.com/strips/comic/2001-10-25/
[14]:https://factorable.net/weakkeys12.extended.pdf
[15]:http://www.links.org/?p=327
[16]:http://www.xkcd.com/424/
[17]:http://www.roeckx.be/journal/
[18]:http://lists.debian.org/debian-devel-announce/2009/02/msg00009.html
[19]:http://research.swtch.com/openssl 
