[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Automate password resets with PWM)
[#]: via: (https://opensource.com/article/19/4/automate-password-resets-pwm)
[#]: author: (James Mawson https://opensource.com/users/dxmjames)

Automate password resets with PWM
======
PWM puts responsibility for password resets in users' hands, freeing IT
for more pressing tasks.
![Password][1]

One of the things that can be "death by a thousand cuts" for any IT team's sanity and patience is constantly being asked to reset passwords.

The best way we've found to handle this is to ditch your hashing algorithms and store your passwords in plaintext so that your users can retrieve them at any time.

Ha! I am, of course, kidding. That's a terrible idea.

When your users forget their passwords, you'll still need to reset them. But is there a way to break free from the monotonous, repetitive task of doing it manually?

### PWM puts password resets in users' hands

[PWM][2] is an open source ([GPLv2][3]) [JavaServer Pages][4] application that provides a webpage where users can submit their own password resets. If certain conditions are met—which you can configure—PWM will send a password reset instruction to whichever directory service you've connected it to.

![PWM password reset screen][5]

One thing that's great about PWM is it's very easy to add it to an existing network. If you're largely happy with what you've already built—just sick of processing password requests manually—you can just throw PWM into the mix.

PWM works with any implementation of [LDAP][6] and written to run on [Apache Tomcat][7]. Once you get it up and running, you can administer it through a browser-based dashboard.

### Why PWM is better than Microsoft SSPR

As much as our team prefers open source, we still have to deal with Windows networks. Of course, Microsoft has its own password-reset tool, called Self Service Password Reset (SSPR). But I prefer PWM, and not just because of a general preference for open source. I believe PWM is better for my use case for the following reasons:

  * **SSPR has a very complex licensing system**. You need different products depending on what servers you're running and whose metal they're running on. This is a constraint on your flexibility and a whole extra pain in the neck when it's time to move to new architecture. For [the busy admin who wants to go home on time][8], it's extra bureaucracy to get the purchase approved. PWM just works on what it's configured to work on at no cost.

  * **PWM is not just for Windows**. It works with any kind of LDAP server. So, it's one less part you need to worry about if you ever stop using Windows for a certain role. It also means that, once you've gotten the hang of it, you have something in your bag of tricks that you can use in many different environments.

  * **PWM is easy to install**. If you know how to install Linux as a virtual machine—and, let's face it, if you're running a network, you probably do—then you're already most of the way there.




PWM can run on Windows, but we prefer to include it in a Windows network by running it on a Linux virtual machine, [for example, Ubuntu Server 16.04][9].

### Risks and rewards of automation

Password resets are an attack vector, so be thoughtful about where and how you use PWM. Automating your password resets can mean an attacker is potentially just one unencrypted email connection away from resetting a password.

To some extent, automating your password resets trades a bit of security for some convenience. So maybe this isn't the right way to handle C-suite user accounts that approve large payments.

On the other hand, manual resets are not 100% secure either—they can be gamed with targeted attacks like spear phishing and social engineering. It's much easier to fall for these scams if your team gets frequent reset requests and is sick of dealing with them. You may benefit from automating the bulk of lower-risk requests so you can focus on protecting the higher-risk accounts manually; this is possible given the time you can save using PWM.

Some of the risks associated with shifting resets to users can be mitigated with PWM's built-in features, such as insisting users verify their password reset request by email or SMS. You can also make PWM accessible only on the intranet.

![PWM configuration options][10]

PWM doesn't store any passwords, so that's one less headache. It does, however, store answers to users' secret questions in a MySQL database that can be configured to be stored locally or on a separate server, depending on your preference.

There are a ton of ways to make PWM look and feel like a polished part of your team's infrastructure. With a little bit of CSS know-how, you can customize the user interface for your business' branding. There are also more options for implementation than you can shake a stick at.

### Wrapping up

PWM is a great open source project, it's actively developed, and it has a helpful online community. It's a great alternative to Microsoft's Azure SSPR solution for small to midsized businesses that have to keep a tight grip on the purse strings, and it slots in neatly to any existing Active Directory infrastructure. It also saves IT's time by outsourcing this mundane task to users.

I advise every network admin to dive in and have a look at the cool stuff PWM offers. Check out the [getting started resources][11] and reach out to the community if you have any questions.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/automate-password-resets-pwm

作者：[James Mawson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dxmjames
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/password.jpg?itok=ec6z6YgZ (Password)
[2]: https://github.com/pwm-project/pwm
[3]: https://github.com/pwm-project/pwm/blob/master/LICENSE
[4]: https://www.oracle.com/technetwork/java/index-jsp-138231.html
[5]: https://opensource.com/sites/default/files/uploads/pwm_password-reset.png (PWM password reset screen)
[6]: https://opensource.com/business/14/5/top-4-open-source-ldap-implementations
[7]: http://tomcat.apache.org/
[8]: https://opensource.com/article/18/7/tools-admin
[9]: https://blog.dxmtechsupport.com.au/adding-pwm-password-reset-tool-to-windows-network/
[10]: https://opensource.com/sites/default/files/uploads/pwm-configuration.png (PWM configuration options)
[11]: https://github.com/pwm-project/pwm#links
