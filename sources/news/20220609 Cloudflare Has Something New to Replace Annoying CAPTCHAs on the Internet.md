[#]: subject: "Cloudflare Has Something New to Replace Annoying CAPTCHAs on the Internet"
[#]: via: "https://news.itsfoss.com/cloudflare-pat/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Cloudflare Has Something New to Replace Annoying CAPTCHAs on the Internet
======
Don’t want to complete CAPTCHA challenges to prove that you are a human? Cloudflare might have a solution for that.

![cloudflare][1]

Cloudflare, the internet services giant, has [just announced][2] Private Access Tokens. These aim to reduce the number of CAPTCHAs you see on the web while improving your privacy.

As you may have found out, CAPTCHAs are a horrible experience on mobile. They often end up occupying the entire screen and can be impossible to complete at times.

As an alternative, websites can elect to collect uniquely identifying data to prove that you are a human. Of course, from a privacy standpoint, this practice is terrible, leaving many privacy-valuing companies with little to prevent them from bot attacks.

Fortunately, the release of Private Access Tokens, or PATs, is set to change this.

### What Impact Will Private Access Tokens Have?

In short, PATs will:

* Reduce the number of CAPTCHAs on supported devices
* Increase user privacy
* Allow website owners to ensure that visitors are coming from actual devices

However, diving in a little deeper, we can see that PATs are much more impactful than at first glance. With traditional CAPTCHAs, there are multiple entities that can access your data.

Firstly, the website you are visiting knows your IP address and the URL you are visiting. Of course, this data is the minimum required to establish a connection. Additionally, for more advanced functionality, websites are also sent some user agent data, which is not uniquely identifiable.

However, the second party, the CAPTCHA provider, can collect a lot more data. Like with the website you want to visit, it knows your IP address, user agent data, and the URL you visit. Unfortunately, they also collect additional data, like your device information and interaction data. When tied back with previous times you have completed a CAPTCHA, they can build up an astonishingly detailed profile of you.

Fortunately, PATs by Cloudflare prevent such data from being collected, by ultimately bypassing the CAPTCHA altogether.

### How Do PATs Work?

![][3]

Unlike the CAPTCHA method of aggregating as much data as possible, PATs decentralize the data so that no single party can uniquely identify you. Before you mention data sharing, Cloudflare has specifically mentioned that data is not shared between parties.

When you go on to a website utilizing Cloudflare and PATs, a total of three parties will handle different portions of your data.

1. The website. This will only know your IP, URL, and user agent, which again, is required for establishing a connection.
2. Your device manufacturer. This will only know the device data required to verify that your device is genuine. They will NOT know what website you are visiting, or your IP address. After verifying your device, they will generate a token, which will be sent to Cloudflare.
3. Cloudflare. Cloudflare will receive the token, which does not contain any of your device data, only a ‘guarantee’ of sorts from the manufacturer that it is genuine. The only other data they know is the website you are visiting, which is required to serve you the content.

The result of this is a system that gives Cloudflare confidence in you being a human, without ever having to touch your data.

### Supported Operating Systems: No Linux?

As you may have realized, PATs need specific operating system features to work. Currently, they are only present on the latest operating systems by Apple, namely iOS and iPadOS 16, as well as macOS Ventura. This is because Apple’s operating systems run on a limited set of hardware, making device verification significantly easier.

Linux, on the other hand, is a general-purpose operating system designed to run on a wide range of hardware. As a result, I don’t expect to see it support PATs in the near future.

Going back to Apple, it occurs to me that PATs could also cause some issues with consumers’ right to repair their devices. If, for example, I replaced a worn-out iPhone battery with a non-genuine one, would this be flagged by the PAT system?

What about Linux Phones? Manufacturers of these, like Pine64 and Purism, may not have the infrastructure to support such a system. Will it be possible to use PATs on these?

In the [announcement post][4], Cloudflare mentions:

> We are actively working to get other clients and device makers utilizing the PAT framework as well. Any time a new client begins utilizing the PAT framework, traffic coming to your site from that client will automatically start asking for tokens, and your visitors will automatically see fewer CAPTCHAs.

So, we hope to see it being adopted by more devices, and operating systems. What do you think about PATs by Cloudflare? Let me know your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/cloudflare-pat/

作者：[Jacob Crume][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/cloudflare-private-access-tokens.jpg
[2]: https://blog.cloudflare.com/eliminating-captchas-on-iphones-and-macs-using-new-standard/
[3]: https://news.itsfoss.com/wp-content/uploads/2022/06/PAT-Data-transfer-chart-1024x650.png
[4]: https://blog.cloudflare.com/eliminating-captchas-on-iphones-and-macs-using-new-standard/
