New OpenSSL breach is no Heartbleed, but needs to be taken seriously
================================================================================
> Summary: While the newest OpenSSL security problems are troubling, and you should address it, it's nothing as bad as Heartbleed.

It's been a bad week for open-source Secure Socket Layer (SSL) programs.

First, the obscure, [GnuTLS was revealed to have a trivial][1] but damning flaw. Then, the massively popular OpenSSL was found to have [a man-in-the-middle vulnerability][2]. After the [Heartbleed fiasco][3], OpenSSL needed this like a hole in the head.

![](http://cdn-static.zdnet.com/i/r/story/70/00/030273/openssl-200x55.png?hash=MwyxMwt0MJ&upscale=1)

This vulnerability, according to Adam Langley, a senior staff software engineer at Google, has been [around for at least 15 years][4]. It's a pity the Core Infrastructure Initiative (CII) [riding to OpenSSL's rescue with more developer funding][5] didn't happen any sooner than it did.

That said, this bug is still is nowhere near as bad as Heartbleed. For starters, an attacker needs to be running a system between the web browser or other SSL-enabled client program to make use of the security hole.

Be that as it may, you still need to address it by upgrading as soon as possible. As Chris Camejo, Director of Assessment Services for [NTT Com Security][6] said in an e-mail interview, "It's bad because it has been around for a long time and looks to be fairly widespread."

He added: "If exploited it would allow the attacker to decrypt traffic. This is serious given that the whole point of SSL is to encrypt traffic and it is widely used to protect passwords, credit card numbers, and all other manner of sensitive transactions that happen on web sites as well as certain email connections."

In a separate interview, Mark Cox, Red Hat's senior director of product security, [went into deeper detail][7]. Cox said, OpenSSL has fixed a number of security flaws, but given the Heartbleed episode we needed to find a way to tell people not to panic.

Cox explained that Heartbleed had been patched before it was revealed but news of the exploit spread before news of the patches, hence so much of the upset around it. In this latest case, there have been seven security issues patched but only two of them need concern administrators and users.

The first, Cox continued, is the Datagram Transport Layer Security (DTLS) bug. There is no known exploit of it at this time, but there is the potential for a successful attack against it.

Therefore, while DTLS is not widely used, if you do use it, it should be patched as soon as possible.

Cox then said the "real meat of the issue is the man-in-the-middle attack." Even here, for this work, someone really must be "in the middle" between a vulnerable server and client to make use of the hole.

But if someone can do this, they could "bypass SSL and get to the raw data... This is quite a serious issue."

Still, with Heartbleed anyone could theoretically exploit vulnerable SSL servers. To attack using this hole would require network access to the traffic between the client and server. For example, a successful attack might be made with a fake coffee house Wi-Fi access point being used to connect the Android version of the Chrome Web browser and an unpatched Web server. Fortunately, Google has [already released an updated version of this browser][8], 35.0.1916.141, to eliminate this problem.

The most vulnerable systems, according to Cox, are unpatched Android devices using a bogus Wi-Fi hot spot. Morrell added that since Android users are at the mercy of their phone vendors and telcos for security updates they may be stuck with vulnerabilities for quite a long time.

Fortunately, if the servers they connect with have been updated, they still can't be attacked.

The OpenSSL security community has known about this problem since early May. The group, working with Red Hat, other major Linux and open-source groups, and hardware vendors, went to a great deal of trouble to not simply patch the bug but to take the next steps of testing the repair, so that they could be as certain (as anyone can ever be in security) that it would fix the hole, but also not introduce any new security problems, and work with most combinations of OpenSSL servers and clients.

Now that the patch is out there, OpenSSL is trying to get the solid facts, as well as the patch, out to people so there won't be any undue panic over these problems. Cox added that the major Linux vendors, such as Red Hat and Ubuntu, already have the patches available.

All server administrators need do is to download and install them and instead of a security crisis this will prove to be business as usual.

--------------------------------------------------------------------------------

via: http://www.zdnet.com/new-openssl-breech-is-no-heartbleed-but-needs-to-be-taken-seriously-7000030273/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.zdnet.com/another-serious-gnutls-bug-exposes-linux-clients-to-server-attacks-7000030205
[2]:http://www.zdnet.com/openssl-fixes-another-severe-vulnerability-7000030253/
[3]:http://www.zdnet.com/heartbleed-serious-openssl-zero-day-vulnerability-revealed-7000028166
[4]:https://www.imperialviolet.org/2014/06/05/earlyccs.html
[5]:http://www.zdnet.com/corporations-put-their-cash-where-their-open-source-security-is-7000030023/
[6]:http://www.nttcomsecurity.com/us/
[7]:http://ec.libsyn.com/p/6/a/5/6a58036510bae37c/CloudEvangelistPodcast_Ep92_MarkCox.mp3?d13a76d516d9dec20c3d276ce028ed5089ab1ce3dae902ea1d06c88537d1ce596fdc&c_id=7251647)
[8]:http://googlechromereleases.blogspot.com/2014/06/chrome-for-android-update.html