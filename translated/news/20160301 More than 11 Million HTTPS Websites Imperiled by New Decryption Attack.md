超过一千万个使用 https 的站点有可能收到新型的加密攻击的影响
===========================================================================

![](https://www.linux.com/images/stories/66866/drown-explainer.jpg)


低成本的淹没攻击会在几个小时内完成解密操作，同时这也不利于采用了 TLS 的邮件服务器。


一个国际研究小组在周二发出的警告说，超过 1100 万的网站和邮件服务采用了[传输层安全协议][1]，以此来保护自己的服务，而这些都是处于一个新发现的、低成本的攻击的威胁之下，这种攻击会在几个小时内解密敏感的通信，在某些情况下甚至是立即解密。 1 百万个最流行的网站中有超过 81,000 个就处于这些受到威胁的 HTTPS 协议保护之下。


处于 TLS 保护的通信协议，依赖于 [RSA 加密系统][2]，如果密钥被泄露了，即使是间接的通过 SSLv2 ——一种在 20 年前就因为自身缺陷而退休了的安全协议，也就是 TLS 的前辈协议——泄露也会处于这种新型攻击的威胁之下。这种危险性在于允许一个入侵者通过反复的使用 SSLv2 来连接到服务器，可以解密一个被中途拦截下来的 TLS 连接。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/software/applications/889455--more-than-11-million-https-websites-imperiled-by-new-decryption-attack

作者：[ArsTechnica][a]
译者：[Ezio](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/community/forums/person/112
[1]: https://en.wikipedia.org/wiki/Transport_Layer_Security
[2]: https://en.wikipedia.org/wiki/RSA_(cryptosystem)

