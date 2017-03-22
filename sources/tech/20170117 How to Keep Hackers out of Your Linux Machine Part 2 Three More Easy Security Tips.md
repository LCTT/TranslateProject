How to Keep Hackers out of Your Linux Machine Part 2: Three More Easy Security Tips
============================================================


 ![security tips](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/security-tips.jpg?itok=JMp34oc3 "security tips") 
In this series, we’ll cover essential information for keeping hackers out of your system. Watch the free webinar on-demand for more information.[Creative Commons Zero][1]Pixabay

In [part 1][3] of this series, I shared two easy ways to prevent hackers from eating your Linux machine. Here are three more tips from my recent Linux Foundation webinar where I shared more tactics, tools and methods hackers use to invade your space. Watch the entire [webinar on-demand][4] for free.

### Easy Linux Security Tip #3

**Sudo.**

Sudo is really, really important. I realize this is just really basic stuff but these basic things make my life as a hacker so much more difficult. If you don't have it configured, configure it.

Also, all your users must use their password. Don't all “sudo all” with no password. That doesn't do anything other than make my life easy when I have a user that has “sudo all” with no password. If I can “sudo <blah>” and hit you without having to authenticate again and I have your SSH key with no passphrase, that makes it pretty easy to get around. I now have root on your machine.

Keep the timeout low. We like to hijack sessions, and if you have a user that has Sudo and the timeout is three hours and I hijack your session, then you've given me a free pass again even though you require a password.

I recommend a timeout of about 10 minutes, or even 5 minutes. They’ll enter their password over and over again but if you keep the timeout low, then you reduce your attack surface.

Also limit the available commands and don't allow shell access with sudo. Most default distributions right now will allow you to do “sudo bash” and get a root shell, which is great if you are doing massive amounts of admin tasks. However, most users should have a limited amount of commands that they need to actually run. The more you limit them, the smaller your attack surface. If you give me shell access I am going to be able to do all kinds of stuff.

### Easy Linux Security Tip #4

**Limit running services.**

Firewalls are great. Your perimeter firewall is awesome. There are several manufacturers out there that do a fantastic job when the traffic comes across your network. But what about the people on the inside?

Are you using a host-based firewall or host-based intrusion detection system? If so, configure it right. How do you know if something goes wrong that you are still protected?

The answer is to limit the services that are currently running. Don't run mySQL on a machine that doesn't need it. If you have a distribution that installs a full LAMP stack by default and you're not running anything on top of it, then uninstall it. Disable those services and don't start them.

And make sure users don't have default credentials. Make sure that those contents are configured securely. If you are running Tomcat, you are not allowed to upload your own applets. Make sure they don't run as root. If I am able to run an applet, I don't want to be able to run an applet as root and give myself access. The more you can restrict the amount of things that people can do the better off it is going to be.

### Easy Linux Security Tip #5

**Watch your logs.**

Look at them. Seriously. Watch your logs. We ran into an issue six months ago where one of our customers wasn't looking at their logs and they have been owned for a very, very long time. Had they been watching it, they would have been able to tell that their machines have been compromised and their whole network was wide open. I do this at home. I have a regimen every morning. I get up, I check my email. I go through my logs, and it takes me 15 minutes but it tells me a wealth of information about what's going on.

Just this morning, I had three systems fail in the cabinet and I had to go and reboot them, and I have no idea why but I could tell in my logs that they weren't responding. They were lab systems. I really don't care about them but other people do.

Centralizing your logging via Syslog or Splunk or any of those logging consolidation tools is fantastic. It is better than keeping them local. My favorite thing to do is to edit your logs so you don't know that I have been there. If I can do that then you have no clue. It's much more difficult for me to modify a central set of logs than a local set.

Just like your significant other, bring them flowers, aka, disk space. Make sure you have plenty of disk space available for logging. Going into a read-only file system is not a good thing.

Also, know what's abnormal. It’s such a difficult thing to do but in the long run it is going to pay dividends. You’ll know what's going on and when something’s wrong. Be sure you know that.

In the [third and final blog post][5], I’ll answer some of the excellent security questions asked during the webinar. [Watch the entire free webinar on-demand][6] now.

_Mike Guthrie works for the Department of Energy doing Red Team engagements and penetration testing._

--------------------------------------------------------------------------------

via: https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-2-three-more-easy-security-tips

作者：[MIKE GUTHRIE][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/anch
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/security-tipsjpg
[3]:https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-1-top-two-security-tips
[4]:http://portal.on24.com/view/channel/index.html?showId=1101876&showCode=linux&partnerref=linco
[5]:https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-3-your-questions-answered
[6]:http://bit.ly/2j89ISJ
