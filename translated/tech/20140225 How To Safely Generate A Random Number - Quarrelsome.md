如何安全地生成随机数
======

### 使用 urandom

使用 [urandom][1]！使用 [urandom][2]！使用 [urandom][3]！

使用 [urandom][4]！使用 [urandom][5]！使用 [urandom][6]！

### 但对于密码学密钥呢？

仍然使用 [urandom][6]。

### 为什么不是 SecureRandom、OpenSSL、havaged 或者 c 语言实现呢？

这些是用户空间的 CSPRNG（伪随机数生成器）。你应该用内核的 CSPRNG，因为：

* 内核可以访问原始设备熵。  
* 它可以确保不在应用程序之间共享相同的状态。
* 一个好的内核 CSPRNG，像 FreeBSD 中的，也可以保证它播种之前不给你随机数据。

研究过去十年中的随机失败案例，你会看到一连串的用户空间的随机失败案例。[Debian 的 OpenSSH 崩溃][7]？用户空间随机！安卓的比特币钱包[重复 ECDSA 随机 k 值][8]？用户空间随机！可预测洗牌的赌博网站？用户空间随机！

用户空间的生成器几乎总是依赖于内核的生成器。即使它们不这样做，整个系统的安全性也会确保如此。**但用户空间的 CSPRNG 不会增加防御深度；相反，它会产生两个单点故障。**

### 手册页不是说使用 /dev/random 嘛？

这个稍后详述，保留你的意见。你应该忽略掉手册页。不要使用 `/dev/random`。`/dev/random` 和 `/dev/urandom` 之间的区别是 Unix 设计缺陷。手册页不想承认这一点，因此它产生了一个并不存在的安全顾虑。把 `random(4)` 中的密码学上的建议当作传说，继续你的生活吧。

### 但是如果我需要的是真随机值，而非伪随机值呢？

urandom 和 `/dev/random` 提供的是同一类型的随机。与流行的观念相反，`/dev/random` 不提供“真正的随机”。从密码学上来说，你通常不需要“真正的随机”。

urandom 和 `/dev/random` 都基于一个简单的想法。它们的设计与流密码的设计密切相关：一个小秘密被延伸到不可预测值的不确定流中。 这里的秘密是“熵”，而流是“输出”。

只在 Linux 上 `/dev/random` 和 urandom 仍然有意义上的不同。Linux 内核的 CSPRNG 定期进行密钥更新（通过收集更多的熵）。但是 `/dev/random` 也试图跟踪内核池中剩余的熵，并且如果它没有足够的剩余熵时，偶尔也会罢工。这种设计和我所说的一样蠢；这与基于“密钥流”中剩下多少“密钥”的 AES-CTR 设计类似。

如果你使用 `/dev/random` 而非 urandom，那么当 Linux 对自己的 RNG（随机数生成器）如何工作感到困惑时，你的程序将不可预测地（或者如果你是攻击者，非常可预测地）挂起。使用 `/dev/random` 会使你的程序不太稳定，但这不会让你在密码学上更安全。

### 这是个缺陷，对吗？

不是，但存在一个你可能想要了解的 Linux 内核 bug，即使这并不能改变你应该使用哪一个 RNG。

在 Linux 上，如果你的软件在引导时立即运行，或者这个操作系统你刚刚安装好，那么你的代码可能会与 RNG 发生竞争。这很糟糕，因为如果你赢了竞争，那么你可能会在一段时间内从 urandom 获得可预测的输出。这是 Linux 中的一个 bug，如果你正在为 Linux 嵌入式设备构建平台级代码，那你需要了解它。

在 Linux 上，这确实是 urandom（而不是 `/dev/random`）的问题。这也是 [Linux 内核中的错误][9]。 但它也容易在用户空间中修复：在引导时，明确地为 urandom 提供种子。长期以来，大多数 Linux  发行版都是这么做的。但**不要**切换到不同的 CSPRNG。

### 在其它操作系统上呢？

FreeBSD 和 OS X 消除了 urandom 和 `/dev/random` 之间的区别；这两个设备的行为是相同的。不幸的是，手册页在解释为什么这样做上干的很糟糕，并延续了 Linux 上 urandom 可怕的神话。

无论你使用 `/dev/random` 还是 urandom，FreeBSD 的内核加密 RNG 都不会停摆。 除非它没有被提供种子，在这种情况下，这两者都会停摆。与 Linux 不同，这种行为是有道理的。Linux 应该采用它。但是，如果你是一名应用程序开发人员，这对你几乎没有什么影响：Linux、FreeBSD、iOS，无论什么：使用 urandom 吧。

### 太长了，懒得看

直接使用 urandom 吧。

### 结语

[ruby-trunk Feature #9569][10]

> 现在，在尝试检测 `/dev/urandom` 之前，SecureRandom.random_bytes 会尝试检测要使用的 OpenSSL。 我认为这应该反过来。在这两种情况下，你只需要将随机字节进行解压，所以 SecureRandom 可以跳过中间人（和第二个故障点），如果可用的话可以直接与 `/dev/urandom` 进行交互。

总结：

> `/dev/urandom` 不适合用来直接生成会话密钥和频繁生成其他应用程序级随机数据。
>
> GNU/Linux 上的 random(4) 手册所述......

感谢 Matthew Green、 Nate Lawson、 Sean Devlin、 Coda Hale 和 Alex Balducci 阅读了本文草稿。公正警告：Matthew 只是大多同意我的观点。

--------------------------------------------------------------------------------

via: https://sockpuppet.org/blog/2014/02/25/safely-generate-random-numbers/

作者：[Thomas & Erin Ptacek][a]
译者：[kimii](https://github.com/kimii)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://sockpuppet.org/blog
[1]:http://blog.cr.yp.to/20140205-entropy.html
[2]:http://cr.yp.to/talks/2011.09.28/slides.pdf
[3]:http://golang.org/src/pkg/crypto/rand/rand_unix.go
[4]:http://security.stackexchange.com/questions/3936/is-a-rand-from-dev-urandom-secure-for-a-login-key
[5]:http://stackoverflow.com/a/5639631
[6]:https://twitter.com/bramcohen/status/206146075487240194
[7]:http://research.swtch.com/openssl
[8]:http://arstechnica.com/security/2013/08/google-confirms-critical-android-crypto-flaw-used-in-5700-bitcoin-heist/
[9]:https://factorable.net/weakkeys12.extended.pdf
[10]:https://bugs.ruby-lang.org/issues/9569
