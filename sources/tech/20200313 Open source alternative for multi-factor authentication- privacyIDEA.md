[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open source alternative for multi-factor authentication: privacyIDEA)
[#]: via: (https://opensource.com/article/20/3/open-source-multi-factor-authentication)
[#]: author: (Cornelius Kölbel https://opensource.com/users/cornelius-k%C3%B6lbel)

Open source alternative for multi-factor authentication: privacyIDEA
======
As technology changes, so too will our need to adapt our authentication
mechanisms.
![Three closed doors][1]

Two-factor authentication, or multi-factor authentication, is not a topic only for nerds anymore. Many services on the internet provide it, and many end-users demand it. While the average end-user might only realize that his preferred web site either offers MFA or it does not, there is more to it behind the scene.

The two-factor market is changing, and changing rapidly. New authentication methods arise, classical vendors are merging, and products have disappeared.

The end-user might not be bothered at all, but organizations and companies who want to require multi-factor authentication for their users may wonder where to turn to and which horse to bet on.

Companies like Secure Computing, Aladdin, SafeNet, Cryptocard, Gemalto, and Thales have been providing authentication solutions for organizations for some decades and have been involved in a round dance of [mergers and acquisitions][2] during the last ten years. And the user was the one who suffered. While the IT department thought it was rolling out a reliable software of a successful vendor, a few years later, they were confronted with the product being end-of-life.

### How the cloud changes things

In 1986, RSA released RSA SecurID, a physical hardware token displaying magic numbers based on an unknown, proprietary algorithm. But, almost 20 years later, thanks to the Open Authentication Initiative, HOTP (RFC4226) and TOTP (RFC6238) were specified—originally for OTP hardware tokens.

SMS Passcode, which specialized in authenticating by sending text messages, was founded in 2005; no hardware token required. While other on-premises solutions kept the authentication server and the enrollment in a confined environment, with SMS Passcode, the authentication information (a secret text message) was transported via the mobile network to the user.

The iPhone 1 was released in 2007, and the Android phone quickly followed. DUO Security was founded in 2009 as a specific cloud MFA provider, with the smartphone acting as a second factor. Both vendors concentrated on a new second factor—the phone with a text message or the smartphone with an app—and they offered and used infrastructure that was not part of the company's network anymore.

Classical on-premises vendors started to move to the cloud, either by offering their new services or acquiring smaller vendors with cloud solutions, such as SafeNet's [acquisition of Cryptocard in 2012][3]. It seemed tempting for classical vendors to offer cloud services—no software updates on-premises, no support cases, unlimited scaling, and unlimited revenue.

Even the old top dog, RSA, now offers a "Cloud Authentication Service." And doesn't it make sense to put authentication services in the cloud? The data is hosted at cloud services like Azure, the identities are hosted in the cloud at Azure AD, so why not put authentication there with Azure MFA? This approach might make sense for companies with a complete cloud-centric approach, but it also probably locks you into one specific vendor.

Cloud seems a big topic also for multi-factor authentication. But what if you want to stay on-prem?

### The state of multi-factor authentication technology

Multi-factor authentication has also come a long way since 1986, when RSA introduced its first OTP tokens. A few decades ago, well-paid consultants made a living by rolling PKI concepts, since smartcard authentication needed a working certificate infrastructure.

After having OTP keyfob tokens and smartphones with HOTP and TOTP apps and even push notification, the current state-of-the-art authentication seems to be FIDO2/WebAuthn. While U2F was specified by the FIDO Alliance alone, WebAuthn was specified by no one else than W3C, and the good news is, the base requirements have been integrated into all browsers except Internet Explorer.

However, applications still need to add a lot of code when supporting Webauthn. But WebAuthn allows for new authentication devices like TPM chips in tablets, computers, and smartphones or cheap and small hardware devices. But U2F also looked good back then, and even it did not make the breakthrough. Will WebAuthn do it?

So these are challenging times since currently, you probably cannot use WebAuthn, but in two years, you'll probably want to. Thus, you need a system that allows you to adapt your authentication mechanisms.

### Getting actual requirements

This is one of the first requirements when you are about to choose a flexible multi-factor authentication solution. It will not work out to solely rely on text messages, or on one single smartphone app or only WebAuthn tokens. The smartphone app may vanish; the WebAuthn devices might not be applicable in all situations.

When looking at the mergers and acquisitions, we learned that it did happen and can happen again; that the software goes end-of-life, or the vendors cease their cloud services. And sometimes it is only the last few months that hurt, when the end of sales means that you cannot buy any new user licenses or onboard any new users! To get a lasting solution, you need to be independent on cloud services and vendor decisions. The safest way to do so is to go for an open source solution.

But when going for an open source solution, you want to get a reliable system, reliable meaning that you can be sure to get updates that do not break and that bugs will be fixed, and there are people to be asked.

### An open source alternative: privacyIDEA

Concentrated experiences in the two-factor market since 2004 have been incorporated into the open source software alternative: [privacyIDEA][4].

privacyIDEA is an open source solution providing a wide variety of different authentication technologies. It started with HOTP and TOTP tokens, but it also supports SMS, email, push notifications, SSH keys, X.509 certificates, Yubikeys, Nitrokeys, U2F, and a lot more. Currently, the support for WebAuthn is added.

The modular structure of the token types (being Python classes) allows new types to be added quickly, making it the most flexible in regards to authentication methods. It runs on-premises at a central location in your network. This way, you stay flexible, have control over your network, and keep pace with the latest developments.

privacyIDEA comes with a mighty and flexible policy framework that allows you to adapt privacyIDEA to your needs. The unique event handler modules enable you to fit privacyIDEA into your existing workflows or create new workflows that work the best for your scenario. It is also plays nice with the others and integrates with identity and authentication solutions like FreeRADIUS, simpleSAMLphp, Keycloak, or Shibboleth. This flexibility may be the reason organizations like the World Wide Web Consortium and companies like Axiad are using privacyIDEA.

privacyIDEA is developed [on GitHub][5] and backed by a Germany-based company providing services and support worldwide.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/open-source-multi-factor-authentication

作者：[Cornelius Kölbel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cornelius-k%C3%B6lbel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_UnspokenBlockers_1110_A.png?itok=x8A9mqVA (Three closed doors)
[2]: https://netknights.it/en/consolidation-of-the-market-and-migrations/
[3]: https://www.infosecurity-magazine.com/news/safenet-acquires-cryptocard/
[4]: https://privacyidea.org
[5]: https://github.com/privacyidea/privacyidea
