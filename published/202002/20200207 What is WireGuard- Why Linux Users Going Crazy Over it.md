[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11916-1.html)
[#]: subject: (What is WireGuard? Why Linux Users Going Crazy Over it?)
[#]: via: (https://itsfoss.com/wireguard/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

什么是 WireGuard？为什么 Linux 用户为它疯狂？
======

从普通的 Linux 用户到 Linux 创建者 [Linus Torvalds][1]，每个人都对 WireGuard 很感兴趣。什么是 WireGuard，它为何如此特别？

### 什么是 WireGuard？

![][2]

[WireGuard][3] 是一个易于配置、快速且安全的开源 [VPN][4]，它利用了最新的加密技术。目的是提供一种更快、更简单、更精简的通用 VPN，它可以轻松地在树莓派这类低端设备到高端服务器上部署。

[IPsec][5] 和 OpenVPN 等大多数其他解决方案是几十年前开发的。安全研究人员和内核开发人员 Jason Donenfeld 意识到它们速度慢且难以正确配置和管理。

这让他创建了一个新的开源 VPN 协议和解决方案，它更加快速、安全、易于部署和管理。

WireGuard 最初是为 Linux 开发的，但现在可用于 Windows、macOS、BSD、iOS 和 Android。它仍在活跃开发中。

### 为什么 WireGuard 如此受欢迎？

![][6]

除了可以跨平台之外，WireGuard 的最大优点之一就是易于部署。配置和部署 WireGuard 就像配置和使用 SSH 一样容易。

看看 [WireGuard 设置指南][7]。安装 WireGuard、生成公钥和私钥（像 SSH 一样），设置防火墙规则并启动服务。现在将它和 [OpenVPN 设置指南][8]进行比较——有太多要做的了。

WireGuard 的另一个好处是它有一个仅 4000 行代码的精简代码库。将它与 [OpenVPN][9]（另一个流行的开源 VPN）的 100,000 行代码相比。显然，调试 WireGuard 更加容易。

不要因其简单而小看它。WireGuard 支持所有最新的加密技术，例如 [Noise 协议框架][10]、[Curve25519][11]、[ChaCha20][12]、[Poly1305][13]、[BLAKE2][14]、[SipHash24][15]、[HKDF][16] 和安全受信任结构。

由于 WireGuard 运行在[内核空间][17]，因此可以高速提供安全的网络。

这些是 WireGuard 越来越受欢迎的一些原因。Linux 创造者 Linus Torvalds 非常喜欢 WireGuard，以至于将其合并到 [Linux Kernel 5.6][18] 中：

> 我能否再次声明对它的爱，并希望它能很快合并？也许代码不是完美的，但我不在乎，与 OpenVPN 和 IPSec 的恐怖相比，这是一件艺术品。
>
> Linus Torvalds

### 如果 WireGuard 已经可用，那么将其包含在 Linux 内核中有什么大惊小怪的？

这可能会让新的 Linux 用户感到困惑。你知道可以在 Linux 上安装和配置 WireGuard VPN 服务器，但同时也会看到 Linux Kernel 5.6 将包含 WireGuard 的消息。让我向您解释。

目前，你可以将 WireGuard 作为[内核模块][19]安装在 Linux 中。而诸如 VLC、GIMP 等常规应用安装在 Linux 内核之上（在 [用户空间][20]中），而不是内部。

当将 WireGuard 安装为内核模块时，基本上需要你自行修改 Linux 内核并向其添加代码。从 5.6 内核开始，你无需手动添加内核模块。默认情况下它将包含在内核中。

在 5.6 内核中包含 WireGuard 很有可能[扩展 WireGuard 的采用，从而改变当前的 VPN 场景][21]。

### 总结

WireGuard 之所以受欢迎是有充分理由的。诸如 [Mullvad VPN][23] 之类的一些流行的[关注隐私的 VPN][22] 已经在使用 WireGuard，并且在不久的将来，采用率可能还会增长。

希望你对 WireGuard 有所了解。与往常一样，欢迎提供反馈。

--------------------------------------------------------------------------------

via: https://itsfoss.com/wireguard/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linus-torvalds-facts/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/wireguard.png?ssl=1
[3]: https://www.wireguard.com/
[4]: https://en.wikipedia.org/wiki/Virtual_private_network
[5]: https://en.wikipedia.org/wiki/IPsec
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/wireguard-logo.png?ssl=1
[7]: https://www.linode.com/docs/networking/vpn/set-up-wireguard-vpn-on-ubuntu/
[8]: https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-16-04
[9]: https://openvpn.net/
[10]: https://noiseprotocol.org/
[11]: https://cr.yp.to/ecdh.html
[12]: https://cr.yp.to/chacha.html
[13]: https://cr.yp.to/mac.html
[14]: https://blake2.net/
[15]: https://131002.net/siphash/
[16]: https://eprint.iacr.org/2010/264
[17]: http://www.linfo.org/kernel_space.html
[18]: https://itsfoss.com/linux-kernel-5-6/
[19]: https://wiki.archlinux.org/index.php/Kernel_module
[20]: http://www.linfo.org/user_space.html
[21]: https://www.zdnet.com/article/vpns-will-change-forever-with-the-arrival-of-wireguard-into-linux/
[22]: https://itsfoss.com/best-vpn-linux/
[23]: https://mullvad.net/en/
