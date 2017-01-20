Why Linux Installers Need to Add Security Features
============================================================

>_With the heightened security concerns, Linux distros need to make basic security options prominently available in their installers rather than options that users can add manually later._

Twelve years ago, Linux distributions were struggling to make installation simple. Led by Ubuntu and Fedora, they long ago achieved that goal. Now, with the growing concerns over security, they need to reverse directions slightly, and make basic security options prominently available in their installers rather than options that users can add manually later.

At the best of times, of course, convincing users to come anywhere near security features is difficult. Too many users are reluctant even to add features as simple as unprivileged user accounts or passwords, apparently preferring the convenience of the moment to reducing the risk of an intrusion that will require reinstallation, or a consultation with a computer expert at eighty dollars an hour.

However, if average users are ever going to pay attention to security, it will probably be during installation. They may never think of it again for another eighteen months, but perhaps for one moment during installation when their attention is focused, they might be persuaded to select a check box, especially if visible online help explains the advantages.

Nor is this shift such a great one. Many installers already offer the choice of automatic logins -- a feature that might be acceptable for a virtue install that contains no personal data, but is all too likely to be selected by those who find logins inconvenient. Similarly, thanks to Ubuntu, choosing to encrypt filesystems -- or at least home directories -- has already become standard in many installers. All I am really suggesting is more of the same.

Moreover, outside installers, Firefox has merged Private Browsing seamlessly into user choices, and [Signal Private Messenger][8] is a drop-in replacement for standard Android Phone and Contact apps.

The suggestion, then, is far from radical. It simply requires the will and the imagination to implement it.

### Linux Security First Steps

What sort of security features should be added to installers?

To start with, a firewall. Dozens of graphical interfaces are available for setting up firewalls, but to paraphrase Byron talking about Coleridge's metaphysical speculations, despite seventeen years of experience, I sometimes wish someone would explain their explanations.

Despite being well-intentioned, most of these firewall tools make dealing directly with iptables seem straightforward. [Bastille Linux][9], the now-defunct system hardener, used to install a basic firewall, and I see no reason why other distributions could not do the same.

Other tools already exist for post-installation use, and could be added without much difficulty in an installer. For instance, [Grub 2][10], the boot manager used by most distribution includes basic password protection. Admittedly, the password can be bypassed by booting from a Live CD, but it still provides a certain amount of protection in everyday circumstances, including remote log ins.

Similarly, a post-install password enforcer like [pwgen][11] could be added to the section of the installer for setting up accounts. These tools enforce the length of acceptable passwords, and their combination of upper and lower case letters, numbers, and special characters. Many generate a password for you, some even making it pronouncable for help in remembering.

Still other tools could be added as part of the installation. For example, an installer could ask for a schedule for regular backups, and add a cronjob and a simple backup tool like [kbackup][12].

And what about encrypted email? Most popular email readers today include the capacity for encrypted email, but setting up and using encryption require extra steps to be taken by the users, complicating common tasks to the point that the temptation to ignore them is almost irresistible. Yet seeing how simple Signal makes encryption on phones, it is obvious that much more can be done to make encryption easier on laptops and workstations as well. Probably, most distributions would prefer peer to peer encryption rather than Signal's centralized servers, but applications like [Ring][13] could provide that feature.

Whatever features are added to the installer, perhaps the precautions could also be extended to productivity software such as LibreOffice. Most efforts at security focus on email, web browsing, and chat, yet word processors and spreadsheets, with their macro languages, are an obvious source of malware infection, and a privacy concern as well. Yet aside from a few outliers like [Qubes OS][14] or [Subgraph][15], few make any effort to include productivity software in their security precautions -- a lapse that potentially leaves a gaping security hole.

### Modern Adaptations

Of course, users who take such matters seriously will probably settle on a security-conscious approach. However, such users can be trust to take care of themselves.

What I am concerned about here are users who are less knowledgeable or less inclined to do their own tinkering. Easy to use security is a growing need, and overdue to be addressed.

The examples here are simply places to start. Most of them already exist, and the need is to implement them in such a way that users cannot ignore them, and can use them with a minimum of knowledge. Probably, implementing all of them would require no more than a month's work by a single coder, including prototyping,UI design, and testing.

Yet, until such features are added, most major Linux distributions can hardly be said to be concerned about security at all. After all, what good are tools if users never use them?

--------------------------------------------------------------------------------

via: http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html

作者：[Bruce Byfield][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.datamation.com/author/Bruce-Byfield-6030.html
[1]:http://www.datamation.com/feedback/http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html
[2]:http://www.datamation.com/author/Bruce-Byfield-6030.html
[3]:http://www.datamation.com/e-mail/http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html
[4]:http://www.datamation.com/print/http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html
[5]:http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html#comment_form
[6]:http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html#
[7]:http://www.datamation.com/author/Bruce-Byfield-6030.html
[8]:https://whispersystems.org/
[9]:http://bastille-linux.sourceforge.net/
[10]:https://help.ubuntu.com/community/Grub2/Passwords
[11]:http://pwgen-win.sourceforge.net/downloads.html
[12]:http://kbackup.sourceforge.net/
[13]:https://savannah.gnu.org/projects/ring/
[14]:https://www.qubes-os.org/
[15]:https://subgraph.com/sgos/
