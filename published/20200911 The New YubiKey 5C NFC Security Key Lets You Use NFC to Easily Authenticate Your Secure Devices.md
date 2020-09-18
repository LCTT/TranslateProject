[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12630-1.html)
[#]: subject: (The New YubiKey 5C NFC Security Key Lets You Use NFC to Easily Authenticate Your Secure Devices)
[#]: via: (https://itsfoss.com/yubikey-5c-nfc/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

全新的 YubiKey 5C NFC 安全密钥让你可以使用 NFC 轻松认证你的安全设备
======

如果你格外谨慎，会使用最好的认证方法来保护你的在线帐户的安全，你可能知道 [Yubico][1]。他们制作的硬件认证安全密钥可以取代[双因素认证][2]，并摆脱在线账户的密码认证系统。

基本上，你只需将安全密钥插在电脑上，或者使用智能手机上的 NFC 来解锁访问账户。这样一来，你的认证方式就会完全保持离线状态。

![](https://img.linux.net.cn/data/attachment/album/202009/18/174323ior6v6xp1y1or1ov.jpg)

当然，你可以随时使用 [Linux 中好用的密码管理器][4]。但如果你拥有一家公司，或为公司工作，或者只是对自己的隐私和安全格外谨慎，想增加一层额外的安全保护，这些硬件安全密钥可能值得一试。这些设备最近得到的进一步普及。

Yubico 的最新产品 [YubiKey 5C NFC][5] 可能令人印象深刻，因为它既可以作为 Type-C 的 USB 密钥使用，也可以作为 NFC 使用（只要用密钥碰触你的设备）。

下面，让我们来看看这款安全密钥的概况。

（LCTT 译注：请注意本文中的购买连接是原文作者的受益链接，如果你对此担心，请阅读其[受益政策][6]。）

### Yubico 5C NFC：概述

![][7]

YubiKey 5C NFC 是最新的产品，它同时使用 USB-C 和 NFC。因此，你可以轻松地将它插入 Windows、macOS 和 Linux 电脑。除了电脑，你还可以将其与 Android 或 iOS 智能手机或平板电脑配合使用。

不仅仅局限于 USB-C 和 NFC 的支持（这是件好事），它也恰好是世界上第一个支持智能卡的多协议安全密钥。

对于普通消费者来说，硬件安全密钥并不那么常见，因为它的成本很高。但在疫情流行的过程中，随着远程办公的兴起，一个更安全的认证系统肯定会派上用场。

以下是 Yubico 在其新闻稿中提到的内容：

> Yubico 首席产品官 Guido Appenzeller 表示：“如今人们工作和上网的方式与几年前大不相同，尤其是在过去几个月内。用户不再仅仅被一种设备或服务所束缚，也不再希望受限于此。这就是为什么 YubiKey 5C NFC 是我们最受欢迎的安全密钥之一。它与大多数现代电脑和手机兼容，并可以在一系列传统和现代应用中良好运行。归根结底，我们的客户渴望的是无论如何都能“正常工作”的安全性。”

YubiKey 5C NFC 支持的协议有 FIDO2、WebAuthn、FIDO U2F、PIV（智能卡）、OATH-HOTP 和 OATH-TOTP （基于哈希和时间的一次性密码）、[OpenPGP][8]、YubiOTP 和挑战应答认证。

考虑到所有这些协议，你可以轻松地保护任何支持硬件认证的在线帐户，同时还可以访问身份访问管理 （IAM） 解决方案。因此，这对个人用户和企业来说都是一个很好的选择。

### 定价和渠道

YubiKey 5C NFC 的价格为 55 美元。你可以直接从他们的[在线商店][5]订购，或者从你所在国家的任何授权经销商处购买。花费可能也会根据运输费用的不同而有所不同，但对于那些想要为他们的在线账户提供最佳安全级别的用户而言，55 美元似乎是个不错的价格。

值得注意的是，如果你订购两个以上的 YubiKeys，你可以获得批量折扣。

- [订购 YubiKey 5C NFC][5]

### 总结

无论你是想保护你的云存储帐户还是其他在线帐户的安全，如果你不介意花点钱来保护你的数据安全，Yubico 的最新产品是值得一试的。

你是否使用过 YubiKey 或其他安全密钥，如 LibremKey 等？你对它的体验如何？你认为这些设备值得花钱吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/yubikey-5c-nfc/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/recommends/yubikey/
[2]: https://ssd.eff.org/en/glossary/two-factor-authentication
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/yubikey-5c-nfc-desktop.jpg?resize=800%2C671&ssl=1
[4]: https://itsfoss.com/password-managers-linux/
[5]: https://itsfoss.com/recommends/yubico-5c-nfc/
[6]: https://itsfoss.com/affiliate-policy/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/yubico-5c-nfc.jpg?resize=800%2C671&ssl=1
[8]: https://www.openpgp.org/
