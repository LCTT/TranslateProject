[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is WireGuard? Why Linux Users Going Crazy Over it?)
[#]: via: (https://itsfoss.com/wireguard/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

What is WireGuard? Why Linux Users Going Crazy Over it?
======

From normal Linux users to Linux creator [Linus Torvalds][1], everyone is in awe of WireGuard. What is WireGuard and what makes it so special?

### What is WireGuard?

![][2]

[WireGuard][3] is an easy to configure, fast, and secure open source [VPN][4] that utilizes state-of-the-art cryptography. It’s aim is to provide a faster, simpler and leaner general purpose VPN that can be easily deployed on low-end devices like Raspberry Pi to high-end servers.

Most of the other solutions like [IPsec][5] and OpenVPN were developed decades ago. Security researcher and kernel developer Jason Donenfeld realized that they were slow and difficult to configure and manage properly.

This made him create a new open source VPN protocol and solution which is faster, secure easier to deploy and manage.

WireGuard was originally developed for Linux but it is now available for Windows, macOS, BSD, iOS and Android. It is still under heavy development.

### Why is WireGuard so popular?

![][6]

Apart from being a cross-platform, one of the biggest plus point for WireGuard is the ease of deployment. Configuring and deploying WireGuard is as easy as configuring and using SSH.

Look at [WireGuard set up guide][7]. You install WireGuard, generate public and private keys (like SSH), set up firewall rules and start the service. Now compare it to the [OpenVPN set up guide][8]. There are way too many things to do here.

Another good thing about WireGuard is that it has a lean codebase with just 4000 lines of code. Compare it to 100,000 lines of code of [OpenVPN][9] (another popular open source VPN). It is clearly easier to debug WireGuard.

Don’t go by its simplicity. WireGuard supports all the state-of-the-art cryptography like like the [Noise protocol framework][10], [Curve25519][11], [ChaCha20][12], [Poly1305][13], [BLAKE2][14], [SipHash24][15], [HKDF][16], and secure trusted constructions.

Since WireGuard runs in the [kernel space][17], it provides secure networking at a high speed.

These are some of the reasons why WireGuard has become increasingly popular. Linux creator Linus Torvalds loves WireGuard so much that he is merging it in the [Linux Kernel 5.6][18]:

> Can I just once again state my love for it and hope it gets merged soon? Maybe the code isn’t perfect, but I’ve skimmed it, and compared to the horrors that are OpenVPN and IPSec, it’s a work of art.
>
> Linus Torvalds

### If WireGuard is already available, then what’s the fuss about including it in Linux kernel?

This could be confusing to new Linux users. You know that you can install and configure a WireGuard VPN server on Linux but then you also read the news that Linux Kernel 5.6 is going to include WireGuard. Let me explain it to you.

At present, you can install WireGuard on Linux as a [kernel module][19]. Regular applications like VLC, GIMP etc are installed on top of the Linux kernel (in [user space][20]), not inside it.

When you install WireGuard as a kernel module, you are basically modifying the Linux kernel on your own and add some code to it. Starting kernel 5.6, you won’t need manually add the kernel module. It will be included in the kernel by default.

The inclusion of WireGuard in Kernel 5.6 will most likely [extend the adoption of WireGuard and thus change the current VPN scene][21].

**Conclusion**

WireGuard is gaining popularity for the good reasons. Some of the popular [privacy focused VPNs][22] like [Mullvad VPN][23] are already using WireGuard and the adoption is likely to grow in the near future.

I hope you have a slightly better understanding of WireGuard. Your feedback is welcome, as always.

--------------------------------------------------------------------------------

via: https://itsfoss.com/wireguard/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
