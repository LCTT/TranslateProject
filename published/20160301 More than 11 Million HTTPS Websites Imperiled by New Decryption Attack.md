逾千万使用 https 的站点受到新型解密攻击的威胁
===========================================================================

![](https://www.linux.com/images/stories/66866/drown-explainer.jpg)


低成本的 DROWN 攻击能在数小时内完成数据解密，该攻击对采用了 TLS 的邮件服务器也同样奏效。

一个国际研究小组于周二发出警告，据称逾 1100  万家网站和邮件服务采用的用以保证服务安全的 [传输层安全协议 TLS][1]，对于一种新发现的、成本低廉的攻击而言异常脆弱，这种攻击会在几个小时内解密敏感的通信，在某些情况下解密甚至能瞬间完成。 前一百万家最大的网站中有超过 81,000 个站点正处于这种脆弱的 HTTPS 协议保护之下。

这种攻击主要针对依赖于 [RSA 加密系统][2]的 TLS 所保护的通信，密钥会间接的通过 SSLv2 暴露，这是一种在 20 年前就因为自身缺陷而退休了的 TLS 前代协议。该漏洞允许攻击者可以通过反复使用 SSLv2 创建与服务器连接的方式，解密截获的 TLS 连接。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/software/applications/889455--more-than-11-million-https-websites-imperiled-by-new-decryption-attack

作者：[ArsTechnica][a]
译者：[Ezio](https://github.com/oska874)
校对：[martin2011qi](https://github.com/martin2011qi), [wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/community/forums/person/112
[1]: https://en.wikipedia.org/wiki/Transport_Layer_Security
[2]: https://en.wikipedia.org/wiki/RSA_(cryptosystem)
