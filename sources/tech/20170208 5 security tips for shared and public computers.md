translating---geekpi

[5 security tips for shared and public computers][1]
=============================================


 ![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/09/securitytips-945x400.png) 

For many of us, the most important part of security is making our personal data safe. The best security will withstand any abuse, theoretically. However, in the real world, you can’t cover _all_ possible situations of abuse. Therefore, the best strategy is to use multiple techniques for increasing security. Most normal people don’t need complicated schemes and [cryptography][2] to be safe. But it’s good to make it hard for intruders to get access to your data.

It may sound silly, but the computer in a library, a classroom, or a lab — or your friend’s phone for that matter — aren’t yours. Even cloud or cloud services in general are usually just someone else’s computer. In general, treat any devices you don’t own as if they’re owned by a villain — in other words, someone who wants your data for evil purposes.

Here are some simple ways you can increase your data security against miscreants or intruders.

### Close open sessions

When you’re finished with the device, log out of services such as Facebook or other sites. This helps keep an evildoer from reopening the windows and having access to your account.

### Clean browser and other cache

Clear all your history, passwords, and cookies from the browser you used. Don’t assume this is the default behavior on logout. Depending on the platform, check caches as well. You can delete the _~/.cache_ folder if you’re on a modern Linux system.

### Empty the trash

Remove any items left behind on the desktop, if applicable, and empty the account’s Trash or Recycle Bin.

### Use service security options

Enable login notifications or approvals for your services and accounts. Some services have an option that notifies you when someone logs into your account from a new device or location. You’ll also get a notice when you login legitimately. But it’s helpful to know if someone tries to use your login unexpectedly from another computer or location.

Other services may allow you to approve any login activity via an email notice. Access is only granted if you approve via a link in the email you receive. Check your services to see if they offer either of these security options.

### Limit sensitive data

The easiest way to keep data safe on a computer you don’t own is not to process it to begin with. Try to avoid or limit work that needs sensitive information. For example, you might not want to access bank or credit card accounts, or secure systems for your workplace.

You may want to consider using a Live USB-based operating system for these purposes. Live USB limits or even completely avoids any data storage on the host computer system where you run it. You can [download a Live Fedora Workstation operating system][3] for use on a USB stick, for example.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/5-security-tips-shared-public-computers/

作者：[Sylvia Sánchez][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://lailah.id.fedoraproject.org/
[1]:https://fedoramagazine.org/5-security-tips-shared-public-computers/
[2]:https://en.wikipedia.org/wiki/Cryptography
[3]:https://getfedora.org/workstation/download/
