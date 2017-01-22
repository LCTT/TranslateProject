How to Keep Hackers out of Your Linux Machine Part 1: Top Two Security Tips
============================================================


 ![Keep hackers out](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/security-webinar.jpg?itok=af6QqiAm "Keep hackers out") 
In this series, we’ll cover the five easiest ways to keep hackers out. Watch the free webinar on-demand for more information.[Creative Commons Zero][1]Pixabay

There is nothing a hacker likes more than a tasty Linux machine available on the Internet. In my recent Linux Foundation webinar I shared tactics, tools, and methods hackers use to invade your space.

In this blog series, we’ll cover the five easiest ways to keep hackers out and know if they have made it in. Want more information? Watch the[ ][3][free webinar on-demand][4].

### Easy Linux Security Tip #1

**If you are not using Secure Shell, you should be.**

This has been a thing for a very, very long time. Telnet is insecure. rLogin is insecure. There are still services out there that require those services but they shouldn't be exposed to the Internet. If you don’t have SSH just turn off your Internet connection. As we always say: use SSH keys.

Rule No. 1 of SSH: Don't use password authentication. The second rule of SSH is: Don't use password authentication. This is really, really important.

If you have a Linux machine on the Internet for any period of time, you are going to get brute forced. It is just going to happen. The brute force is scripted.  Scanners see port 22 open to the Internet and they have to hammer it hard.

The other thing you can do is you can move SSH off of the standard port which many of us do. That works to prevent a small number of brute force attacks but, in general, just don't use password authentication and you'll be safe.

The third rule of SSH is: All keys have passphrases. A no-passphrase key may as well not be a key at all. I realize that makes services hard to deal with if you are trying to log into something automatically or trying to automate stuff but all keys should have passphrases.

My favorite thing to do is to compromise a host and find home directories with private keys. As soon as I have private keys, it's game over. I can log into anything that the public key provides access to.

If you provide a passphrase or even a password, it doesn't have to be a long passphrase on your keys, then it makes my life much, much more difficult.

### Easy Linux Security Tip #2

**Install Fail2ban.**

Those brute force attacks that I was talking about? This helps dramatically. It will automatically activate iptables rules to block repeated attempts to SSH into your machine. Be sure to configure it in such a way that it doesn't lock you out or doesn't take up too many resources. But use it, love it, and watch it.

It has its own logs so make sure to watch them and check to see if it’s actually functioning. That's a really important thing as well.

In [part 2 of this series][5], I’ll give you three more easy security tips for keeping hackers out of your  Linux machine. You can also [watch the entire free webinar on-demand][6] now.

--------------------------------------------------------------------------------

via: https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-1-top-two-security-tips

作者：[Mike Guthrie][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/anch
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/security-webinarjpg
[3]:http://bit.ly/2j89ISJ
[4]:http://bit.ly/2j89ISJ
[5]:https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-2-three-more-easy-security-tips
[6]:http://bit.ly/2j89ISJ
