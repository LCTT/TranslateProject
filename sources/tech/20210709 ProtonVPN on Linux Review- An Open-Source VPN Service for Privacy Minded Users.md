[#]: subject: (ProtonVPN on Linux Review: An Open-Source VPN Service for Privacy Minded Users)
[#]: via: (https://itsfoss.com/protonvpn-linux-review/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

ProtonVPN on Linux Review: An Open-Source VPN Service for Privacy Minded Users
======

[ProtonVPN][1] is a popular open-source VPN service available for Linux and other platforms that include Windows, Mac, iOS, and Android. You can also set it up for routers.

In fact, as far as I’m aware, ProtonVPN is one of the few [VPN services for Linux][2] that offer a GUI application.

I’ve been using it for a few years now, on and off. Now that it has a proper GUI app for Linux and the command-line tool is reliable enough, let me share some detailed insights on what you can expect from ProtonVPN.

### ProtonVPN: Is it Just Another VPN Service?

![][3]

While there are hundreds of VPN providers out there, often linked to common companies. ProtonVPN is a creation by the team behind ProtonMail.

The key highlights of the service include enhanced privacy, ad/tracker blocking capabilities, and open-source apps.

Also, they happen to own some of their servers while keeping them at secure locations, like an underground facility in Ireland.

So, among [privacy-oriented VPN services][2], ProtonVPN deserves some attention, I think.

But, is it worth it? How good is it? Can you use it for free? What exactly does it offer you if you pay?

Before I dive into some details, let me highlight the features that it offers.

### Key Highlights of ProtonVPN Service

While many of the features will be common to every other VPN of your choice, some are unique to ProtonVPN:

  * Strict no logs policy
  * All open-source apps and independently audited
  * Secure core servers
  * Adblocker
  * Website tracking protection
  * Forward Secrecy
  * Multiple protocols supported—IKEv2/IPSec, OpenVPN, L2TP, PPTP
  * Full disk encryption servers
  * Swiss-based
  * Tor over VPN support
  * Peer-to-Peer servers



To clarify some of the features:

  * [NetShield][4] lets you block advertisements and trackers when you visit websites in the DNS-level.
  * Secure Core server is another layer of protection (connecting any remote VPN server through a VPN server owned by ProtonVPN).



Both of these features are only accessible to paid subscribers.

Now that you know what you can expect from it, let us go through some of the details.

### ProtonVPN User Interface &amp; Features

ProtonVPN lets you use the command-line interface (CLI) or the GUI app on Linux. The application is user-friendly, so we’ll start with how useful it is.

![][5]

As you can notice from the screenshot above, it is quite simple, with options to enable features like NetShield, Kill Switch, and Secure Core.

Unfortunately, you do not get a choice to tweak the protocol of your connection with the GUI app.

But, you can choose between TCP/UDP using the command-line interface.

However, it integrates with the system tray, giving you a way to quickly disconnect or connect when needed.

![][6]

In case you do not use the GUI but prefer the CLI, here’s how that looks:

![][7]

No matter what you use, it will display the load (in percentage) for the server you want to choose.

In other words, the less load displayed, the faster the server can perform.

If you have a free plan, chances are that most of the servers are fully loaded with users and may perform poorly. With paid subscription, you can find more server options that have less load.

Here’s how it looks with the GUI:

![][8]

And, this is what you can expect in the CLI:

![][9]

Now that we’re done with what the user interface offers, let me show you some of my speedtest results to give a reference to how well it performs.

### ProtonVPN Performance

As I mentioned before, the free servers will have a significant impact on your Internet connection speed.

To expect the fastest performance, choose the nearest server and a server with less load.

For this test, I chose a “**Plus**” server from India with **13% load** on a 100 Mbps connection with UDP protocol.

Here’s what my speed looks like while being connected to ProtonVPN:

![][10]

Of course, the ping is high: **179 ms**, which could have been better, but you can try a variety of server locations to see if that improves for you.

The download speed recorded (**83 Mbps**) is not too bad, but with room for improvement.

However, the upload speed did take a big hit at **50 Mbps**.

To give it another go, I tried a Singapore-based server with a similar load and, surprisingly, that performed better than my nearest location.

![][11]

And, with **86ms ping**, **90 Mbps DL / 74 Mbps UL**, it is certainly impressive and doable.

This also tells us that you need to try a number of server locations available to find your best fit for performance and privacy.

Undoubtedly, if you opt for Tor over VPN or Secure Core servers, it may have a significant hit on your Internet speed.

This is what I ended up with when choosing a _Singapore-based Secure Core server_:

**300+ ms ping**, **80 Mbps DL, and 53 Mbps UL**.

It could have been worse, but I think that’s something that you can work with. And it should be comfortable enough to easily utilize [torrent clients for Linux][12] as well.

### ProtonVPN Server Availability and IP/DNS Protection Test

You get a wide range of server locations from across the globe. And, if you opt for a paid plan, no matter whether it is the “Basic” or “Plus” subscription, you should easily be able to find several server options with minimal load.

I shall highlight the differences in the pricing plans next, but before that, let us test whether ProtonVPN manages to successfully hide the IP address and DNS while using it.

To do that, we’re going to use an effective and popular online tool —[IPleak.net][13]

![][14]

And that looks to be perfectly fine, which is a good thing. Previously (almost a year ago), I did encounter some servers that were leaking IPv6, but looks like that is not a problem anymore.

It is worth noting that **ProtonVPN does not support IPv6** and blocks IPv6 traffic by default.

Additionally, you can also try using [DNS leak test][15] tool to see if it detects your ISP’s DNS. In my case, it was not leaking any DNS.

### ProtonVPN Pricing Plans

[ProtonVPN][1] is on the expensive side of VPN services. However, with their transparency through open-source applications and some unique features, it is an attractive offering.

The basic plan starts at **$48 per year or $5/month** if billed monthly. It gives you access to basic servers, which comes with P2P support and NetShield feature.

It should be good enough for most, but it is limited to just **two** devices and has no streaming support.

The plus plan starts at **$96 per year or $8/month** if billed monthly. You get access to Secure Core servers, streaming support, Tor over VPN, and way more server location choices.

With the plus plan, you can actively use it on up to **ten** devices. Also, if you have a super-fast Internet (say between of 1-10Gbps), you may want to go for the Plus plan to get that kind of speed.

And the visionary plan is for users who just want all the features and support ProtonVPN in the process with extra funds. You will also get access to all ProtonMail paid features with this plan.

### Installing and Using ProtonVPN on Linux

First, you need to sign up for ProtonVPN with a valid account. Once done, you need to download the **DEB or RPM package** available for the suitable distribution.

You should find the packages and the instructions to get it installed in their official [FAQ page for Linux][16].

[Get ProtonVPN][1]

The GUI and the CLI are not separately available. You will need to install the packages to install ProtonVPN on your Linux machine. And, then choose to use the command-line interface or the GUI.

Using the GUI is easy and to get started with the CLI, all you have to do is type in:

```
protonvpn-cli connect
```

And, replace **connect** with **disconnect** in the command to drop the VPN connection.

If you are using the command-line, you must enable the NetShield feature and adblocker protection before connecting to the VPN. To do that, just type in:

```
protonvpn-cli netshield --ads-malware
```

If you just want to block malware, type in:

```
protonvpn-cli netshield --malware
```

### Final Thoughts

If you want an enhanced level of privacy protection, transparency of the VPN service, and full-fledged Linux support, [ProtonVPN][1] is a fantastic choice.

However, the pricing plan may prove to be expensive if you want to use it on more than two devices compared to other VPN providers.

I think it is worth it if you regularly rely on a VPN connection to hide your IP address, use torrents, unblock geological restrictions, and more. And if you rarely use a VPN, you could look at some of the other [VPN options available for Linux][2].

What do you think about ProtonVPN? Have you tried it yet? Let me know your thoughts in the comments down below.

_The article contains affiliate links. Please read our [affiliate policy][17]._

--------------------------------------------------------------------------------

via: https://itsfoss.com/protonvpn-linux-review/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/recommends/protonvpn
[2]: https://itsfoss.com/best-vpn-linux/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/protonvpn-linux.png?resize=800%2C450&ssl=1
[4]: https://news.itsfoss.com/protonvpn-netshield/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/protonvpn-ui.png?resize=789%2C800&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/protonvpn-system-tray.png?resize=484%2C232&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/protonvpn-cli.png?resize=800%2C501&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/protonvpn-server-load.png?resize=800%2C769&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/protonvpn-cli-load.png?resize=800%2C505&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/protonvpn-india.png?resize=800%2C432&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/protonvpn-singapore.png?resize=800%2C383&ssl=1
[12]: https://itsfoss.com/best-torrent-ubuntu/
[13]: https://ipleak.net
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/protonvpn-ip-test.png?resize=800%2C617&ssl=1
[15]: https://www.dnsleaktest.com
[16]: https://protonvpn.com/support/linux-vpn-setup/#linux_app
[17]: https://itsfoss.com/affiliate-policy/
