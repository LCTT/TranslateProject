[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SimpleLogin: Open Source Solution to Protect Your Email Inbox From Spammers)
[#]: via: (https://itsfoss.com/simplelogin/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

SimpleLogin: Open Source Solution to Protect Your Email Inbox From Spammers
======

_**Brief: SimpleLogin is an open-source service to help you protect your email address by giving you a permanent alias email address.**_

Normally, you have to use your real email address to sign up for services that you want to use personally or for your business.

In the process, you’re sharing your email address – right? And, that potentially exposes your email address to spammers (depending on where you shared the information).

What if you can protect your real email address by providing an alias for it instead? No – I’m not talking about disposable email addresses like 10minutemail which could be useful for temporary sign-ups – even though they’ve been blocked by certain services.

I’m talking about something similar to “_[Hide My Emai for Sign in with Apple ID][1]_” but a free and open-source solution i.e [SimpleLogin][2].

### SimpleLogin: An open source service to protect your email inbox

![][3]

_It is worth noting that you still have to use your existing email client (or email service) to receive and send emails – but with this service, you get to hide your real email ID._

SimpleLogin is an open-source project (you can find it on [GitHub][4]) available for free (with premium upgrade options) that aims to keep your email private.

Unlike temporary email services, it generates a permanent random alias for your email address that you can use to sign up for services without revealing your real email.

The alias works as a point of contact to forward the emails intended to your real email ID.

**You’ll receive the emails sent to the alias email address in your real email inbox and if you believe that the alias is receiving too many spams, you block the alias. This way, you completely stop getting spam emails sent to the particular aliased email address.**

Not just limited to receiving emails but you can also send emails through the alias email address. Interesting, right? And, using this coupled with [secure email services][5] should be a good combination to protect your privacy.

**Recommended Read:**

![][6]

#### [Best VPN Services for Privacy Minded Linux Users][7]

Here are our recommendations for best VPN services for Linux users to secure their privacy and enhance their online security. Check it out.

### Features of SimpleLogin

![][8]

Before taking a look at how it works, let me highlight what it offers overall to the Internet users and web developers as well:

  * Protects your real email address by generating an alias address
  * Send/Recieve emails through your alias
  * Block the alias if emails get too spammy
  * Custom domain supported with premium plans
  * You can choose to self-host it
  * If you’re a web developer, you can follow the [documentation][9] to integrate a “**Sign in with SimpleLogin**” button to your login page.



You can either utilize the web browser or use the extension for Firefox, Chrome and Safari.

[SimpleLogin][2]

### How SimpleLogin Works?

![][10]

To start with, you’ll have to sign up for the service with your primary email ID that you want to keep private.

Once done – you have to use your alias email to sign up for any other services you want.

![][11]

The number of aliases generated is limited in the free plan – however, you can upgrade to the premium plan if you want to generate different alias email addresses for every site.

You don’t necessarily need to use the web portal, you can use the browser extension to generate aliases and use them when needed as shown in the image below:

![][12]

Even if you want to send an email without revealing your real email ID, just generate an alias email by typing in the receiver’s email ID and paste the alias in your email client to send it.

### Brief conversation with SimpleLogin’s founder

I was quite impressed to see an open-source service like this – so I reached out to [**Son Nguyen Kim**][13] (_SimpleLogin’s founder_). Here’s a few things I asked along with the responses I got:

**How can you assure users that they can rely on your service for their personal/business use?**

**Son Nguyen Kim:** SimpleLogin follows all the best practices in terms of [email deliverability][14] to reduce the emails ending up in the Spam folder. To mention a few:

  * SPF, DKIM and strict DMARC
  * TLS everywhere
  * “Clean” IP: we made sure that our IP addresses are not blacklisted anywhere
  * Constant monitoring to avoid abuses.
  * Participate in email providers postmaster programs



**How sustainable is your business currently? **

**Son Nguyen Kim:** Though in Beta, we already have paying customers. They use SimpleLogin both personally (to protect privacy) and for their business (create emails with their domains).

**What features have you planned for the future?**

**Son Nguyen Kim**: An iOS app is already in progress, the Android app will follow just after.

  * [PGP][15] to encrypt emails
  * Able to strip images from emails. Email tracking is usually done [using a 1-pixel image][16] so tracking will also be removed with this feature enabled.
  * [U2F][17] support (Yubikey)
  * Better integration with existing email infrastructure for people who want to self-host SimpleLogin



You can also find a public roadmap to their plans on [Trello][18].

**Wrapping Up**

Personally, I would really love to see this succeed as a privacy-friendly alternative to social network sign-up options implemented on various web services.

In addition to that, as it stands now as a service to generate alias email – that should suffice a lot of users who do not want to share their real email address. My initial impressions on SimpleLogin’s beta phase is quite positive. I’d recommend you to give it a try!

They also have a [Patreon][19] page – if you wish to donate instead of opting for a paying customer to help the development of SimpleLogin.

Have you tried something like this before? How exciting do you think SimpleLogin is? Feel free to share your thoughts in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/simplelogin/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://support.apple.com/en-us/HT210425
[2]: https://simplelogin.io/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/simplelogin-website.jpg?ssl=1
[4]: https://github.com/simple-login/app
[5]: https://itsfoss.com/secure-private-email-services/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/best-vpn-linux.png?fit=800%2C450&ssl=1
[7]: https://itsfoss.com/best-vpn-linux/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/simplelogin-settings.jpg?ssl=1
[9]: https://docs.simplelogin.io/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/simplelogin-details.png?ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/simplelogin-dashboard.jpg?ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/simplelogin-extensions.jpg?ssl=1
[13]: https://twitter.com/nguyenkims
[14]: https://blog.hubspot.com/marketing/email-delivery-deliverability
[15]: https://www.openpgp.org/
[16]: https://www.theverge.com/2019/7/3/20681508/tracking-pixel-email-spying-superhuman-web-beacon-open-tracking-read-receipts-location
[17]: https://en.wikipedia.org/wiki/Universal_2nd_Factor
[18]: https://trello.com/b/4d6A69I4/open-roadmap
[19]: https://www.patreon.com/simplelogin
