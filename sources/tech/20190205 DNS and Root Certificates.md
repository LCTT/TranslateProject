[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (DNS and Root Certificates)
[#]: via: (https://lushka.al/dns-and-certificates/)
[#]: author: (Anxhelo Lushka https://lushka.al/)

DNS and Root Certificates
======

Due to recent events we (as in we from the Privacy Today group) felt compelled to write an impromptu article on this matter. It’s intended for all audiences so it will be kept simple - technical details may be posted later.

### What Is DNS And Why Does It Concern You?

DNS stands for Domain Name System and you encounter it daily. Whenever your web browser or any other application connects to the internet, it will most likely do so using a domain. A domain is simply the address you type: i.e. [duckduckgo.com][1]. Your computer needs to know where this leads to and will ask a DNS resolver for help. It will return an IP like [176.34.155.23][2]; the public network address you need to know to connect. This process is called a DNS lookup.

There are certain implications for both your privacy and your security as well as your liberty:

#### Privacy

Since you ask the resolver for an IP for a domain name, it knows exactly which sites you’re visiting and, thanks to the “Internet Of Things”, often abbreviated as IoT, even which appliances you use at home.

#### Security

You’re trusting the resolver that the IP it returns is correct. There are certain checks to ensure it is so, under normal circumstances, that is not a common source of issues. These can be undermined though and that’s why this article is important. If the IP is not correct, you can be fooled into connecting to malicious 3rd parties - even without ever noticing any difference. In this case, your privacy is in much greater danger because, not only are the sites you visit tracked, but the contents as well. 3rd parties can see exactly what you’re looking at, collect personal information you enter (such as passwords), and a lot more. Your whole identity can be taken over with ease.

#### Liberty

Censorship is commonly enforced via DNS. It’s not the most effective way to do so but it is extremely widespread. Even in western countries, it’s routinely used by corporations and governments. They use the same methods as potential attackers; they will not return the correct IP when you ask. They could act as if the domain doesn’t exist or direct you elsewhere entirely.

### Ways DNS lookups can happen

#### 3rd Party DNS Resolvers Hosted By Your ISP

Most people are using 3rd party resolvers hosted by their Internet Service Provider. When you connect your modem, they will automatically be fetched and you might never bother with it at all.

#### 3rd Party DNS Resolver Of Your Choice

If you already knew what DNS means then you might have decided to use another DNS resolver of your choice. This might improve the situation since it makes it harder for your ISP to track you and you can avoid some forms of censorship. Both are still possible though, but the methods required are not as widely used.

#### Your Own (local) DNS Resolver

You can run your own and avoid some of the possible perils of using others’. If you’re interested in more information drop us a line.

### Root Certificates

#### What Is A Root Certificate?

Whenever you visit a website starting with https, you communicate with it using a certificate it sends. It enables your browser to encrypt the communication and ensures that nobody listening in can snoop. That’s why everybody has been told to look out for the https (rather than http) when logging into websites. The certificate itself only verifies that it has been generated for a certain domain. There’s more though:

That’s where the root certificate comes in. Think of it as the next higher level that makes sure the levels below are correct. It verifies that the certificate sent to you has been authorized by a certificate authority. This authority ensures that the person creating the certificate is actually the real operator.

This is also referred to as the chain of trust. Your operating system includes a set of these root certificates by default so that the chain of trust can be guaranteed.

#### Abuse

We now know that:

  * DNS resolvers send you an IP address when you send a domain name
  * Certificates allow encrypting your communication and verify they have been generated for the domain you visit
  * Root certificates verify that the certificate is legitimate and has been created by the real site operator



**How can it be abused?**

  * A malicious DNS resolver can send you a wrong IP for the purpose of censorship as said before. They can also send you to a completely different site.
  * This site can send you a fake certificate.
  * A malicious root certificate can “verify” this fake certificate.



This site will look absolutely fine to you; it has https in the URL and, if you click it, it will say verified. All just like you learned, right? **No!**

It now receives all the communication you intended to send to the original. This bypasses the checks created to avoid it. You won’t receive error messages, your browser won’t complain.

**All your data is compromised!**

### Conclusion

#### Risks

  * Using a malicious DNS resolver can always compromise your privacy but your security will be unharmed as long as you look out for the https.
  * Using a malicious DNS resolver and a malicious root certificate, your privacy and security are fully compromised.



#### Actions To Take

**Do not ever install a 3rd party root certificate!** There are very few exceptions why you would want to do so and none of them are applicable to general end users.

**Do not fall for clever marketing that ensures “ad blocking”, “military grade security”, or something similar**. There are methods of using DNS resolvers on their own to enhance your privacy but installing a 3rd party root certificate never makes sense. You are opening yourself up to extreme abuse.

### Seeing It Live

**WARNING**

A friendly sysadmin provided a live demo so you can see for yourself in realtime. This is real.

**DO NOT ENTER PRIVATE DATA! REMOVE THE CERT AND DNS AFTERWARDS!**

If you do not know how to, don’t install it in the first place. While we trust our friend you still wouldn’t want to have the root certificate of a random and unknown 3rd party installed.

#### Live Demo

Here is the link: <http://https-interception.info.tm/>

  * Set the provided DNS resolver
  * Install the provided root certificate
  * Visit <https://paypal.com> and enter random login data
  * Your data will show up on the website



### Further Information

If you are interested in more technical details, let us know. If there is enough interest, we might write an article but, for now, the important part is sharing the basics so you can make an informed decision and not fall for marketing and straight up fraud. Feel free to suggest other topics that are important to you.

This post is mirrored from [Privacy Today channel][3]. [Privacy Today][4] is a group about all things privacy, open source, libre philosophy and more!

All content is licensed under CC BY-NC-SA 4.0. ([Attribution-NonCommercial-ShareAlike 4.0 International][5]).

--------------------------------------------------------------------------------

via: https://lushka.al/dns-and-certificates/

作者：[Anxhelo Lushka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://lushka.al/
[b]: https://github.com/lujun9972
[1]: https://duckduckgo.com
[2]: http://176.34.155.23
[3]: https://t.me/privacytoday
[4]: https://t.me/joinchat/Awg5A0UW-tzOLX7zMoTDog
[5]: https://creativecommons.org/licenses/by-nc-sa/4.0/
