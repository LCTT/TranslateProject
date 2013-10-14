Debian OpenSSL Bug - 后门还是安全事故?
======================================================

周一，Ed 写了篇文章《软件透明度》[1]，主旨是如果软件开发的过程是透明的，那么软件本身对恶意的后门（无心的安全漏洞）更具抵抗性。
软件透明的因素包括公开源代码，可以获取一个项目的追踪议题，以及允许参与内部开发者会议。他提到一种情况，在这儿我想详细讨论一下：
2008年，Debian项目（一个流行的用于web服务器的linux发行版），宣称[2]Debian中OpenSSL[3]的伪随机数生成器遭到破解，已经不安全了。

首先，了解一些背景信息：伪随机数生成器（PRNG）就是一个程序，假定代号为F。给定一个随机种子s，通过F(s)进行处理后，
会得到一个长的比特流。如果我和你都使用同样的种子s，两个人会得到同样的比特流。但是如果我随机选择一个s，也不告诉你s是什么，
你根本不能够推测F(s)的结果，如你所知，F(s)也是随机的。OpenSSL中的PRNG试图从系统中抓取不可预测的信息（"熵"）,比如当前进程ID，
或者很有可能是不同的内存数据（比如，未初始化的内存，该内存，可能或者就是，由其它一些进程控制）等等。把这些东西转换成种子s，
经F(s)处理，就会得到随机比特流。

2006年，为了解决一条从一个查找软件内存存取bug的工具[5]生成的警告[4]，一名Debian维护者决定注释掉[6]OpenSSL PRNG里的两行代码[7]。
结果这两行代码非常重要，代码负责抓取几乎所有的不可预测的熵，抓取的熵会作为OpenSSL PRNG的种子。没有这些代码，
PRNG只有总共32,767个选择可作为种子，因而也就是说只有这么多的选择可用于F(s)进行处理。

很多依赖于OpenSSL随机数生成器的程序，其实并不拥有那么多的随机选择，但是他们原以为会有那么多的。
一个这样的程序要为SSL（安全网络浏览）和SSH（安全远程登录）生成秘钥。问题的关键在于，这些秘钥必须是随机的：如果你可以猜到我的秘钥，
你就可以破解我使用该秘钥保护的任何东西。这意味着你有能力读取加密的通讯信息，登录到远程服务器[8]，或者伪造看起来似乎是真实的信息[9]。
这个漏洞是2006年第一次引入，而且进入到Ubuntu中[10](另一个流行的linux发行版，广泛应用于网络服务器)。漏洞影响到数以千计的服务器而且
存在了很长一段时间[11]，因为只是给受影响的服务器打补丁还不足以解决问题，必须替换掉任何在漏洞存在情况下生成的秘钥。

顺便说一句，为伪随机数生成器寻找熵是个著名[12]的难题[13]。事实上，在今天来看要解决这个问题依然是个巨大的挑战。随机错误难以检测，
因为当你盯着输出看，每次运行程序结果都不一样，就像随机的一样。弱随机性很难定位，但是它可以使（貌似）安全的加密系统失效。
依然如此，Debian中的那个漏洞一经发现在安全界[15]就常常被当做笑柄[16]。

这是个后门，故意设置的吗？似乎不大可能。[Kurt Roeckx][17]，代码维护者，后来成为Debian项目的主管。显然他是个可靠的家伙，
不是为了故意设置漏洞而由NSA伪造出来的身份。想进入Debian项目组的核心，需要做出巨大的努力，那真是出了名的难进。
这样看来，错误根本不是自己冒出来，而是一系列失误导致的，而且后果严重。

漏洞确实是在一个透明的环境下引入的。所做的任何一件事都是公开的。但是漏洞就在那儿，而且呆了相当长一段时间。
部分原因在于，正因为所有的事情都是透明的，才导致极大的混乱，人们对那个显而易见的漏洞也都没太在意。
另外，也因为漏洞本身太过微妙。让修改带来的影响随便给谁看都能那么明显，这也不是设计该系统的目的。

这是否意味着软件透明没什么益处？ 我可不这么认为。许多人都赞同透明软件要比不透明软件更安全。
但是这也并不表示漏洞不会产生，或者认为有其他人都看着呢而我们自己就可以掉以轻心。

至少，多年以后，透明可以让我们回想起，究竟是什么导致的那个漏洞，原来是工程上的纰漏而非人为破坏。
---

via: https://freedom-to-tinker.com/blog/kroll/software-transparency-debian-openssl-bug/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[l3b2w1](https://github.com/l3b2w1) 校对：[校对者ID](https://github.com/校对者ID)


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
