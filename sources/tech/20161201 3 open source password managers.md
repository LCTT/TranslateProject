3 open source password managers
============================================================

### Keep your data and accounts safe by using a secure open source password manager to store unique, complex passwords.

 ![Open source password managers](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/locks_keys_bridge_paris.png?itok=S4HMI29u) 

>Image by : [Jason Baker][1]. [CC BY-SA 4.0][2].

Maintaining complex, unique passwords for each site and service you use is among the most common pieces of advice that security professionals provide to the public every year.

Yet no matter how many times it is said, it seems like a week doesn't go by where a high-profile hacking story hits the news, revealing that users of the service in question more often than not had such _secure_ passwords as "12345" or "password" as the only wall of protection on their account.

Or perhaps a user offers up just enough variation on the classic password selection to get past the minimal rules of the service. Unfortunately, "Pa$$w0rd!" isn't secure in any meaningful way, either. At this point, almost every variation of words and phrases strung together with a few numbers or substitutions is simply too easy for a password cracking tool to make its way through, and the shorter the password, the easier.

The best passwords are long, random or pseudo-random combinations of every possible character allowed, with a different password for each unique use. But how could a normal person remember the hundreds or even thousands of individual passwords associated with each account they've ever created? The short answer is: they can't. And don't even think about writing a password down in plain text, whether in the physical world or the digital.

Perhaps the easiest way to keep track of these complex, unique passwords is with a password manager, which provides easy access to strong encryption. While proprietary commercial solutions like LastPass are popular, there are several open source solutions as well. And with passwords, being able to audit the source code of your password manager is especially important, as it helps ensure that your passwords are encrypted properly and are not vulnerable to backdoors.

So without further ado, here are a few open source password managers we hope you will consider.

### KeePass

[KeePass][3] is a GPLv2-licensed password manager, primarily designed for Windows but also running elsewhere. KeePass offers multiple strong encryption options, easy exports, multiple user keys, advanced searching features, and more. Designed for desktop use, there are plugins that allow direct use from your web browser, and it can run from a USB stick if you'd prefer to physically carry your passwords from machine to machine. More on KeePass can be found in this [past article][4] from Ricardo Frydman.

[KeePassX][5], which started as a Linux port of KeePass, is another project you may consider. KeyPassX is compatible with KeePass 2 password files, and has also been ported to run on different operating systems. In fact, the list of [unofficial releases][6] of KeePass covers ports to just about every system in common use.

### Padlock

[Padlock][7] is a very new entrant into the world of open source password managers. Currently available for Windows, Mac, iOS, and Android, with a Linux client in the works, Padlock is designed as a "minimalist" password manager. Its [source][8] is available on GitHub under a [GPLv3][9] license. The project is also developing a [cloud backend][10], also open source, which will be a welcomed addition to anyone tired of managing password files or setting up syncing across multiple computers.

### Passbolt

[Passbolt][11] is another relatively new option, with plugins available for Firefox and Chrome and mobile and command-line options on the way. Based on OpenPGP, you can check out its online [demo][12] which shows off some of the features (you'll need to install the plugin for your browser, though). Licensed under the [GPL Affero version 3 license][13], you can check out the source code on [GitHub][14] or view the project's [roadmap][15] for a list of current features and more on what is planned.

* * *

Using a password manager that you trust alongside complex passwords is not a substitute for taking other security precautions, nor is it foolproof. But for many users, it can be an important part of keeping your digital life secured. These definitely aren't the only options out there. There are some older options, like [Clipperz][16] and [Password Safe][17], and web-based tools like [RatticDB][18] that I would be interested to try out. Which open source password manager do you use, and why?

--------------------------------------------------------------------------------

via: https://opensource.com/article/16/12/password-managers

作者：[Jason Baker ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://opensource.com/users/jason-baker
[2]:https://creativecommons.org/licenses/by-sa/4.0/
[3]:http://keepass.info/
[4]:https://opensource.com/business/16/5/keepassx
[5]:https://www.keepassx.org/
[6]:http://keepass.info/download.html
[7]:https://padlock.io/
[8]:https://github.com/MaKleSoft/padlock
[9]:https://github.com/MaKleSoft/padlock/blob/master/LICENSE
[10]:https://github.com/maklesoft/padlock-cloud
[11]:https://www.passbolt.com/
[12]:https://demo.passbolt.com/auth/login
[13]:https://github.com/passbolt/passbolt_browser_extension/blob/master/LICENCE
[14]:https://github.com/passbolt
[15]:https://www.passbolt.com/roadmap
[16]:https://clipperz.is/
[17]:https://pwsafe.org/
[18]:http://rattic.org/
