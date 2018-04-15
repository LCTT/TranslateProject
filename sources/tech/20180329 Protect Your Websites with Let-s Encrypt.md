pinewall translating

Protect Your Websites with Let's Encrypt
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/lock-1920.jpg?itok=7sjbOYkU)
Back in the bad old days, setting up basic HTTPS with a certificate authority cost as much as several hundred dollars per year, and the process was difficult and error-prone to set up. Now we have [Let's Encrypt][1] for free, and the whole thing takes just a few minutes.

### Why Encrypt?

Why encrypt your sites? Because unencrypted HTTP sessions are wide open to multiple abuses:

 +  Eavesdropping on your users
 +  Capturing user logins
 +  Injecting ads and "important" messages
 +  Injecting spyware
 +  Injecting SEO spam and links
 +  Injecting cryptocurrency miners

Internet service providers lead the code-injecting offenders. How to foil their nefarious desires? Your best defense is HTTPS. Let's review how HTTPS works.

### Chain of Trust

You could set up asymmetric encryption between your site and everyone who is allowed to access it. This is very strong protection: GPG (GNU Privacy Guard, see [How to Encrypt Email in Linux][2]), and OpenSSH are common tools for asymmetric encryption. These rely on public-private key pairs. You can freely share public keys, while your private keys must be protected and never shared. The public key encrypts, and the private key decrypts.

This is a multi-step process that does not scale for random web-surfing, however, because it requires exchanging public keys before establishing a session, and you have to generate and manage key pairs. An HTTPS session automates public key distribution, and sensitive sites, such as shopping and banking, are verified by a third-party certificate authority (CA) such as Comodo, Verisign, or Thawte.

When you visit an HTTPS site, it provides a digital certificate to your web browser. This certificate verifies that your session is strongly encrypted and supplies information about the site, such as organization's name, the organization that issued the certificate, and the name of the certificate authority. You can see all of this information, and the digital certificate, by clicking on the little padlock in your web browser's address bar (Figure 1).


![page information][4]

Figure 1: Click on the padlock in your web browser's address bar for information.

[Used with permission][5]

The major web browsers, including Opera, Firefox, Chromium, and Chrome, all rely on the certificate authority to verify the authenticity of the site's digital certificate. The little padlock gives the status at a glance; green = strong SSL encryption and verified identity. Web browsers also warn you about malicious sites, sites with incorrectly configured SSL certificates, and they treat self-signed certificates as untrusted.

So how do web browsers know who to trust? Browsers include a root store, a batch of root certificates, which are stored in `/usr/share/ca-certificates/mozilla/`. Site certificates are verified against your root store. Your root store is maintained by your package manager, just like any other software on your Linux system. On Ubuntu, they are supplied by the `ca-certificates` package. The root store itself is [maintained by Mozilla][6] for Linux.

As you can see, it takes a complex infrastructure to make all of this work. If you perform any sensitive online transactions, such as shopping or banking, you are trusting a whole lot of unknown people to protect you.

### Encryption Everywhere

Let's Encrypt is a global certificate authority, similar to the commercial CAs. Let's Encrypt was founded by the non-profit Internet Security Research Group (ISRG) to make it easier to secure Websites. I don't consider it sufficient for shopping and banking sites, for reasons which I will get to shortly, but it's great for securing blogs, news, and informational sites that don't have financial transactions.

There are at least three ways to use Let's Encrypt. The best way is with the [Certbot client][7], which is maintained by the Electronic Frontier Foundation (EFF). This requires shell access to your site.

If you are on shared hosting then you probably don't have shell access. The easiest method in this case is using a [host that supports Let's Encrypt][8].

If your host does not support Let's Encrypt, but supports custom certificates, then you can [create and upload your certificate manually][8] with Certbot. It's a complex process, so you'll want to study the documentation thoroughly.

When you have installed your certificate use [SSL Server Test][9] to test your site.

Let's Encrypt digital certificates are good for 90 days. When you install Certbot it should also install a cron job for automatic renewal, and it includes a command to test that the automatic renewal works. You may use your existing private key or certificate signing request (CSR), and it supports wildcard certificates.

### Limitations

Let's Encrypt has some limitations: it performs only domain validation, that is, it issues a certificate to whoever controls the domain. This is basic SSL. It does not support Organization Validation (OV) or Extended Validation (EV) because it is not possible to automate identity validation. I would not trust a banking or shopping site that uses Let's Encrypt-- let 'em spend the bucks for a complete package that includes identity validation.

As a free-of-cost service run by a non-profit organization there is no commercial support, but only documentation and community support, both of which are quite good.

The Internet is full of malice. Everything should be encrypted. Start with [Let's Encrypt][10]to protect your site visitors.

Learn more about Linux through the free ["Introduction to Linux" ][11]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/3/protect-your-websites-lets-encrypt

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://letsencrypt.org
[2]:https://www.linux.com/learn/how-encrypt-email-linux
[3]:https://www.linux.com/files/images/fig-11png-0
[4]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-1_1_1.png?itok=_PPiSNx6 (page information)
[5]:https://www.linux.com/licenses/category/used-permission
[6]:https://www.mozilla.org/en-US/about/governance/policies/security-group/certs/policy/
[7]:https://certbot.eff.org/
[8]:https://community.letsencrypt.org/t/web-hosting-who-support-lets-encrypt/6920
[9]:https://www.ssllabs.com/ssltest/
[10]:https://letsencrypt.org/
[11]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
