[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 open source security practices from 2020)
[#]: via: (https://opensource.com/article/20/12/security)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 open source security practices from 2020
======
Here are manageable ways to keep your systems and data safe and secure.
![Lock][1]

Few of us really want to read articles about security. They're usually uncomfortable (and overwhelming) reminders of the things we aren't doing to keep our data safe and secure. Luckily for us, this year, Opensource.com authors specifically focused on writing about manageable security tasks. Some are afternoon projects, while others are small steps you can take to improve your default security settings.

Here are 13 of our favorites.

### Encryption

How often have you watched a talk or read something about cryptography that is either so theoretical that it is hard to understand or so high-level that you don't have a concrete example to build on its themes? In _[Never forget your password with this Python encryption algorithm][2],_ Moshe Zadka gives us the best of both worlds: theory and application. Check it out!

We live in an increasingly complex world where we often need to manage several calendars at once. We have our work calendar, our kids' school and activity calendars, our personal appointments, sports and TV schedules… and, if you're using CalDAV, managing all of those calendars could put your security and privacy at risk. Ivan Kupalov explains how to avoid these risks in [_How to replace CalDAV with a secure calendar protocol_][3].

Mike Bursell introduces Enarx, a new "application deployment system enabling applications to run within Trusted Execution Environments (TEEs) without rewriting for particular platforms or SDKs." In [_Why we open sourced our security project_][4], Mike explains why he and his co-developer decided to make the project open source.

### Email infrastructure

Here's a bargain for you—two articles for the price of one: Free! Victor Lopes and Marc Skinner explain how SSL can help secure your email solutions. Victor's [_Eliminate spam using SSL with an open source certification authority_][5] introduces MailCleaner as an open source anti-spam solution for your email infrastructure, and Marc's [_How to secure your Linux email services with SSL/TLS_][6] walks through enabling SSL/TLS between email endpoints.

You may not have needed to manage SSL certificates before, but you've surely been affected by them. As a user, you've probably gotten an error message on your browser or experienced an outage on a favorite online service. As a system administrator, it's your responsibility to minimize or eliminate these experiences for customers. In [_Manage your SSL certificates with the ssl-on-demand script_][7], Abhishek Tamrakar offers some ideas on managing these certs and avoiding guaranteed headaches if you ignore them.

### Firewalls

If firewalls are one of your responsibilities (and they probably are), Seth Kenlon has you covered. First, he introduces _[Getting started with Linux firewalls][8],_ and then he takes a deeper dive into more advanced capabilities of firewalld in _[Open ports and route traffic through your firewall][9]._

### Vulnerability management

WordPress is by far the [most popular][10] web content management system, making it a popular target for cyber threats. Therefore, it is imperative that system administrators keep WordPress installations secure, and Lucy Carney offers [_6 tips for securing your WordPress website_][11] to help you do so.

Two words you often hear in security are hardening and compliance. In fact, the process of securing your system can also be called "hardening," and depending on your industry, internal or external parties (e.g., your infosec team or a government regulatory agency) may require you to "harden" your system to a minimum security level. Lynis is a tool that will help you achieve that level and audit its capabilities. Gaurav Kamathe's [_Scan your Linux security with Lynis_][12] will help you get started with it.

After you read Gaurav's article, Ari Noman's [_Use this command-line tool to find security flaws in your code_][13] will help you take the principles of hardening to the code level by using the Graudit tool to uncover programming flaws and code vulnerabilities.

### Identity management

Will you do me a favor? Before you continue reading, turn on two-factor authentication (2FA) in all of your accounts. Everywhere! And if your organization is looking for an open source solution to produce multi-factor authentication (MFA) in your services, look no further than privacyIDEA. Find out more in Cornelius Kölbel's [_Open source alternative for multi-factor authentication: privacyIDEA_][14].

In _[Protect your network with open source tools][15],_ Chantale Benoit introduces a couple of open source security tools under the Apache Foundation umbrella. They are Syncope, "an open source system for managing digital identities in an enterprise environment," and Metron, an "advanced security analytics framework that detects cyber anomalies, such as phishing activity and malware infections."

### Living a security lifestyle

Security is an ongoing practice. As these articles demonstrate, good security is something you integrate into your life and into your code. Give them all a read, and see what you can do to improve your digital security over the coming year.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/security

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://opensource.com/article/20/6/python-passwords
[3]: https://opensource.com/article/20/3/caldav-security
[4]: https://opensource.com/article/20/8/why-open-source
[5]: https://opensource.com/article/20/6/secure-open-source-antispam
[6]: https://opensource.com/article/20/4/securing-linux-email
[7]: https://opensource.com/article/20/2/ssl-demand
[8]: https://opensource.com/article/20/2/firewall-cheat-sheet
[9]: https://opensource.com/article/20/9/firewall
[10]: https://w3techs.com/technologies/overview/content_management
[11]: https://opensource.com/article/20/4/wordpress-security
[12]: https://opensource.com/article/20/5/linux-security-lynis
[13]: https://opensource.com/article/20/8/static-code-security-analysis
[14]: https://opensource.com/article/20/3/open-source-multi-factor-authentication
[15]: https://opensource.com/article/20/10/apache-security-tools
