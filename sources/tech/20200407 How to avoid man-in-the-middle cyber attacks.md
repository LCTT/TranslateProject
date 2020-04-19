[#]: collector: (lujun9972)
[#]: translator: (tinyeyeser )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to avoid man-in-the-middle cyber attacks)
[#]: via: (https://opensource.com/article/20/4/mitm-attacks)
[#]: author: (Jackie Lam https://opensource.com/users/beenverified)

How to avoid man-in-the-middle cyber attacks
======
Understanding MITM attacks is the first step in not being a victim of
this high-tech style of eavesdropping.
![Security monster][1]

Whether you're sending data on your computer or talking to someone online, you want to assume some level of security and privacy.

But what if a third party is eavesdropping online, unbeknownst to you? And worse, what if they're impersonating someone from a business you trust in order to gain damaging information? This could put your personal data into the hands of dangerous, would-be thieves.

Welcome to what's called a man-in-the-middle (MITM) attack.

### What are man-in-the-middle attacks?

A man-in-the-middle attack occurs when a cybercriminal inserts themselves into communications between you, the targeted victim, and a device in order to steal sensitive information that can be used for a variety of criminal purposes—most notably identity theft, says Steve J. J. Weisman, founder of Scamicide.

"A man-in-the-middle-attack can also occur when the victim believes he or she is communicating with a legitimate app or website," says Weisman, "when the truth is that the victim is communicating with a phony website or app and thereby providing sensitive information to the criminal."

One of the oldest forms of cyberattacks, MITM attacks have been around since the 1980s. What's more, they're quite common. As Weisman explains, there are a handful of ways a MITM attack can happen:

  * **Attacking a WiFi router that is not properly secured:** This typically occurs when someone is using public WiFi. "While home routers might be vulnerable, it's more common for criminals to attack public WiFi networks," says Weisman. The goal is to spy on unsuspecting people who are handling sensitive information, such as their online bank accounts, he adds.
  * **Hacking email accounts of banks, financial advisers, and other companies:** "Once [the criminals] have hacked these email systems, they send out emails that appear to come from the legitimate bank or other company," Weisman says. "[They ask] for personal information, such as usernames and passwords, under the guise of an emergency. The targeted victim is lured into providing that information."
  * **Sending phishing emails:** Thieves might also send emails pretending to be legitimate companies that the targeted victim does business with, asking the recipient for their personal information. "In many instances, the spear-phishing emails will direct the victim to a counterfeit website that appears to be that of a legitimate company with which the victim does business," says Weisman.
  * **Using malicious code in legitimate websites:** Attackers can also place malicious code—usually JavaScript—into a legitimate website by way of a web application. "When the victim loads the legitimate page, the malicious code just sits in the background until the user enters sensitive information, such as account login or credit card details, which the malicious code then copies and sends to the attackers' servers," says Nicholas McBride, a cybersecurity consultant.



### What is an example of an MITM attack?

The Lenovo case is a well-known example of an MITM attack. In 2014 and 2015, the major computer manufacturer sold consumer laptops with preinstalled software that meddled with how a user's browser communicated with websites. Whenever the user's cursor hovered over a product, this software, called VisualDiscovery, sent pop-up ads from retail partners that sold similar products.

Here's the kicker: This MITM attack allowed VisualDiscovery to access all of the user's personal data, including social security numbers, info about financial transactions, medical info, and logins and passwords. All without the user knowing or granting permission beforehand. The FTC deemed this a deceptive and unfair online scam. Lenovo agreed to pay $8.3 million in a class-action settlement in 2019.

### How can I protect myself from an online attack?

  * **Avoid using public WiFi:** Weisman recommends never using public WiFi for financial transactions unless you've installed a reliable virtual private network (VPN) client on your device and have a VPN host you can use and trust. Over a VPN connection, your communications are encrypted, so your information can't be stolen.

  * **Be on the lookout:** Be wary of emails or text messages that ask you to update your password or provide your username or personal information. These methods can be used to steal your identity.

If you are unsure of the actual identity of the party sending you the email, you can use tools such as a reverse phone or email search. With a reverse phone number lookup, you may be able to find out more about the identity of an unknown texter. And with a reverse email lookup, you can try to determine who might have sent you a message.

Generally, if something's actually a problem, you'll hear from someone you know and trust within your company, or from someone you can also go and meet, in person, at your bank or school or other organization. Important account information is never the purview of an unknown technician.

  * **Don't click on links contained in emails:** If someone sends you an email telling you that you need to sign into an account, don't click on the link provided in the email. Instead, navigate to the site yourself, log in as you normally would, and look for an alert there. If you don't see an alert message in your account settings, contact a representative by phone using contact information on the site and _not_ from the email.

  * **Install reliable security software:** If you're on Windows, install good open source antivirus like [ClamAV][2]. On all platforms, keep your software up to date with the latest security patches.

  * **Take alerts seriously:** If you're visiting a site that starts with HTTPS, your browser might alert you to an issue, says McBride. For instance, if the domain name on the site's certificate doesn't match the one you're trying to visit. Don't ignore the alert. Heed it and navigate away from the site for now. Verify that you haven't [mistyped it][3], and if the problem persists, contact the site owner if you can.

  * **Use an ad blocker:** Pop-up ads (also known as _adware attacks_) can be used to intercept your personal information, so use an ad blocker. "The truth is, as an individual user, it's hard to protect against a MITM attack," says McBride, "as it is designed to leave the victim in the dark and to prevent them from noticing that there is anything wrong."

A good open source ad blocker (or "wide-spectrum blocker," in the developer's words) is [uBlock origin][4]. It's available for both Firefox and Chromium (and all Chromium-based browsers, such as Chrome, Brave, Vivaldi, Edge, and so on), and even Safari.




### Stay alert

Remember, you don't have to click anything online right away, and you don't have to follow random people's instructions, no matter how urgent they may seem. The internet will still be there after you step away from the computer and verify the identity of a person or site demanding your attention.

While MITM attacks can happen to anyone, understanding what they are, knowing how they happen, and actively taking steps to prevent them can safeguard you from being a victim.

* * *

_This article was originally published on [BeenVerified.com][5] under a [CC BY-SA 2.0][6] license._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/mitm-attacks

作者：[Jackie Lam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/beenverified
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_password_chaos_engineer_monster.png?itok=J31aRccu (Security monster)
[2]: https://www.clamav.net
[3]: https://opensource.com/article/20/1/stop-typosquatting-attacks
[4]: https://github.com/gorhill/uBlock
[5]: https://www.beenverified.com/crime/what-is-a-man-in-the-middle-attack/
[6]: https://creativecommons.org/licenses/by-sa/2.0/
