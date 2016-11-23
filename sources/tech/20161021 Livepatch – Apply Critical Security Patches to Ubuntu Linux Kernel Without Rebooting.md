Livepatch – Apply Critical Security Patches to Ubuntu Linux Kernel Without Rebooting
============================================================

If you are a system administrator in charge of maintaining critical systems in enterprise environments, we are sure you know two important things:

1) Finding a downtime window to install security patches in order to handle kernel or operating system vulnerabilities can be difficult. If the company or business you work for does not have security policies in place, operations management may end up favoring uptime over the need to solve vulnerabilities. Additionally, internal bureaucracy can cause delays in granting approvals for a downtime. Been there myself.

2) Sometimes you can’t really afford a downtime, and should be prepared to mitigate any potential exposures to malicious attacks some other way.

The good news is that Canonical has recently released (actually, a couple of days ago) its Livepatchservice to apply critical kernel patches to Ubuntu 16.04 (64-bit edition / 4.4.x kernel) without the need for a later reboot. Yes, you read that right: with Livepatch, you don’t need to restart your Ubuntu 16.04 server in order for the security patches to take effect.

### Signing up for Ubuntu Livepatch

In order to use Canonical Livepatch Service, you need to sign up at [https://auth.livepatch.canonical.com/][1] and indicate if you are a regular Ubuntu user or an Advantage subscriber (paid option). All Ubuntu users can link up to 3 different machines to Livepatch through the use of a token:

[
 ![Canonical Livepatch Service](http://www.tecmint.com/wp-content/uploads/2016/10/Canonical-Livepatch-Service.png) 
][2]

Canonical Livepatch Service

In the next step you will be prompted to enter your Ubuntu One credentials or sign up for a new account. If you choose the latter, you will need to confirm your email address in order to finish your registration:

[
 ![Ubuntu One Confirmation Mail](http://www.tecmint.com/wp-content/uploads/2016/10/Ubuntu-One-Confirmation-Mail.png) 
][3]

Ubuntu One Confirmation Mail

Once you click on the link above to confirm your email address, you’ll be ready to go back to [https://auth.livepatch.canonical.com/][4] and get your Livepatch token.

### Getting and Using your Livepatch Token

To begin, copy the unique token assigned to your Ubuntu One account:

[
 ![Canonical Livepatch Token](http://www.tecmint.com/wp-content/uploads/2016/10/Livepatch-Token.png) 
][5]

Canonical Livepatch Token

Then go to a terminal and type:

```
$ sudo snap install canonical-livepatch
```

The above command will install the livepatch, whereas

```
$ sudo canonical-livepatch enable [YOUR TOKEN HERE]
```

will enable it for your system. If this last command indicates it can’t find canonical-livepatch, make sure `/snap/bin` has been added to your path. A workaround consists of changing your working directory to `/snap/bin` and do.

```
$ sudo ./canonical-livepatch enable [YOUR TOKEN HERE]
```
[
 ![Install Livepatch in Ubuntu](http://www.tecmint.com/wp-content/uploads/2016/10/Install-Livepatch-in-Ubuntu.png) 
][6]

Install Livepatch in Ubuntu

Overtime, you’ll want to check the description and the status of patches applied to your kernel. Fortunately, this is as easy as doing.

```
$ sudo ./canonical-livepatch status --verbose
```

as you can see in the following image:

[
 ![Check Livepatch Status in Ubuntu](http://www.tecmint.com/wp-content/uploads/2016/10/Check-Livepatch-Status.png) 
][7]

Check Livepatch Status in Ubuntu

Having enabled Livepatch on your Ubuntu server, you will be able to reduce planned and unplanned downtimes at a minimum while keeping your system secure. Hopefully Canonical’s initiative will award you a pat on the back by management – or better yet, a raise.

Feel free to let us know if you have any questions about this article. Just drop us a note using the comment form below and we will get back to you as soon as possible.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/livepatch-install-critical-security-patches-to-ubuntu-kernel

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://auth.livepatch.canonical.com/
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Canonical-Livepatch-Service.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Ubuntu-One-Confirmation-Mail.png
[4]:https://auth.livepatch.canonical.com/
[5]:http://www.tecmint.com/wp-content/uploads/2016/10/Livepatch-Token.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/10/Install-Livepatch-in-Ubuntu.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Check-Livepatch-Status.png
