Translating by GOLinux!
50 ways to avoid getting hacked in 2017
============================================================

### Paul Simon outlined "50 Ways to Leave Your Lover," whereas we present 50 ways to secure your systems.

 ![secure your systems](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=VNmpz6K- "secure your systems") 

Image by : 

Opensource.com

When I was young, Paul Simon released his hit song, [50 Ways to Leave Your Lover][3]. Inspired by this song, I've collected 50 ways sysadmins and laypeople can avoid getting hacked:

### "You just slip out the back, Jack"

1\. Backup your data. If you get hit with ransomware, you don't have to pay if you have backups.

2\. Use a [syncstop][4] when you have to charge your phone in a public place, or bring your own battery backup.

3\. Take advantage of the auditing subsystems. There are lots of cool tools to help monitor your system. If you do have a break in, the audit system might well be able to tell you what happened and what the attacker did.

4\. Speaking of logs, offloading the logs to a centralized server is always a good idea because if a hacker breaks into your system, the first thing he is going to attack is the logging system to cover his tracks. Having a good intrusion system watching the logs also helps.

### "Make a new plan, Stan"

5\. Run SELinux in enforcing mode (see [stopdisablingselinux.com][5]). Didn't think it would take me this long to get to that one? SELinux prevents escalations of zero day vulnerabilities. When [Shell Shock][6] came out, SELinux was the only defense.

6\. Run applications in the [SELinux Sandbox][7] whenever possible—it was a container before containers were cool. Also follow the development of [Flatpack][8], which soon should be developing sandboxing capabilities.

7\. Don't install or use Flash. Firefox no longer supports it, and hopefully most web servers are moving away from it.

8\. Use [confined SELinux users][9] to control what users do in your systems. If you are running a shared login system, set up users as **guest_t**.

### "You don't need to be coy, Roy"

9\. Take [advantage of systemd tools][10] to help secure your services. Most system attacks are going to come through a service listening on the network. Systemd provides great ways to lock down the service. For example, use **[PrivateTmp=yes][1]**. PrivateTmp takes advantage of the mount namespace to set up a private **tmpfs** mount for the server's **/tmp**. This prevents a hacked service from getting access to content in the host's **/tmp** and potentially attacking the rest of the system based on services listening on **/tmp**.

10. **InaccessibleDirectories=/home** is a systemd unit flag that uses the mount namespace to eliminate the **/home** (or any other directory) from the services view, which makes it more difficult for a hacked service ability to attack the content.

11. **ReadOnlyDirectories=/var** is another systemd unit flag that uses the mount namespace to turn the directories contents into read-only mode. You probably should always run with **/usr** in **ReadOnlyMode**. This would prevent a hacked application from rewriting the binary, so the next time it started the service, you would already be hacked.

12\. Drop capabilities from a service (**CapabilityBoundingSet=CAP_CHOWN CAP_KILL**). In the kernel, priviliged processes are broken down into a series of distinct capabilities. Most services do not need many (if any), and systemd provides a simple switch to drop them from a service.

13\. If your service is not going to use the network, then you can turn it off for the service using **PrivateNetwork=yes**. Just turning this on in a service unit file takes advantage of the network namespace and turns off all networks available to the service. Oftentimes a hacker does not actually want to break into your machine—he just wants to use it as an attack server to attack other machines. If the service can't see the network, it cannot attack it.

>Control the devices available to your service.

14\. Control the devices available to your service. Systemd provides the **DeviceAllow** directive, which controls the devices available to the service. **DeviceAllow=/dev/null rw** will limit access to **/dev/null** and only this device node, disallowing access to any other device nodes. The feature is implemented on top of the device's cgroup controller.

15\. Coming soon to a systemd system near you is a new feature, **[ProtectSystem Strict][2]**, which can turn on all of these namespaces to fully lock down the environment in which a service runs.

### "Just get yourself free"

16\. Don't use a cell phone without SELinux ([SEAndroid][11]) in enforcing mode. Luckily, I heard that more than 90% of all Android phones now run with SEAndroid on in enforcing mode. That makes me happy. Now if we could only get those Apple guys to use SELinux.

>Only install software from trusted sources.

17\. Only install software from trusted sources. Don't install dodgy things you find on the Internet. This goes for your cell phone, computer system, virtual machines, containers, and so on.

18\. I don't do online banking on my phone—only on my Linux computer. If a hacker steals my credit card, I lose 50 bucks; if he gets into my bank account, I lose a lot more. I guess I am old. (Get off my lawn.)

19\. One cool thing I did do with my phone is set up my credit card companies to send me a text every time my credit card has been charged. That way if the number gets stolen, I will know a lot quicker.

>I don't do online banking on my phone—only on my Linux computer.

20\. When you need to communicate securely, use the [Signal secure messaging app][12].

### "Hop on the bus gus"

21\. Run Linux on your systems. When I first hooked my father up with a computer system, I barely got home before his system was infested with viruses. I returned and installed Linux on his system, and he has been running it ever since. I believe Linux generally is a more secure system because of the way it was designed, but I also believe the desktop is less likey to be hacked because of the smaller user base. Some would argue that Windows has improved greatly over the years, but for me, I am still sticking with what I know.

22\. Only run distributions with a [Security Response Team][13] watching over the security of the distribution. Enterprise Software is important.

23\. Run an enterprise-level kernel. In containers, the single point of failure is the kernel. If you want to keep it secure, use an enterprise-level kernel, which means it has the latest security fixes, but is not bleeding edge. Remember the latest kernel comes with the latest security fixes, but it also comes with a ton of new code that could have vulnerabilities.

### "You don't need to discuss much"

24\. Most hacks are social engineering—for example, email links, web browser attacks, and phone calls. The best option here is to be educated and skeptical. No one from Nigeria is giving you money. The IRS is not calling your house demanding money. If you get a link to a web site in email from your bank, don't use the link. Type the address directly on the web browser.

25\. Always keep your systems fully up to date with the latest security fixes. The number of systems that are outdated and have known security vulnerabilities is scarey. Script kiddies rely on you **not** to update your system.

>Always keep your systems fully up to date with the latest security fixes.

26\. Always use HTTPS when connecting to services on the network. Chrome and Firefox now have modes to enforce this. If a web site does not support secure communications by 2016, it is probably not worth your visit.

27\. Use [seccomp][14] in your containers. This limits the attack surface on the kernel, which is the single point of failure. Limit what the processes can discuss.

### "Just drop off the key, Lee"

28\. Use a [YubiKey][15] for storing private keys.

29\. Encrypt your data on your systems. At least for laptops, keep your **homedir**and your other data directories encrypted. I was riding the subway in London a few years ago, and had my Laptop "nicked"—the door of the train car closed, and I noticed by laptop was gone and the train was pulling out of the station. Luckily, the disks were encrypted.

30\. Use [Let's Encrypt][16] for all your web sites. There's no reason not to run HTTPS anymore.

31\. Never use the same password on different web servers. This one is difficult not to fall into the trap. Tools like Let's Encrypt help a lot. It's even better if you use ssh keys to log into systems.

32\. Use two-factor authentication (2FA). Passwords have become just about useless. Using YubiKeys and the like make two-factor easy. We all have cell phones. Having a secret in your head and one generated on the phone is always better than a password.

33\. Nothing aggravates me more than websites always asking me to set up an account—can't we do better? Always use a password-generating tool for your website passwords. I am old school: I use [Password Safe][17] and cut and paste into the web browser. I have heard that other people have good luck with [LastPass][18]and other tools that integrate your phone and web service.

34\. Set up a service like [FreeIPA][19] to use for identity services. Using tools such as [Kerberos][20] for authentication and authorization makes keeping track of employees and their access to systems much easier (and it has cool crypto services). Using Active Directory is ok, but I am a little prejudiced.

>When you must use a password that you need to type in often, use an easily remembered sentence rather the a word.

35\. When you must use a password that you need to type in often, use an easily remembered sentence rather the a word. My preferred way to remember passwords is to use a phrase several words long that is easy to type.

### "And get yourself free"

36\. Use [USBGuard][21] to protect your system from rogue USB devices.

37\. The past few years, I have been working on containers, so now let's dive into security on containers. First run them on a system with SELinux turned on in enforcing mode. If your system does not support SELinux, switch the distribution to one that does. SELinux is the best tool for protecting against container break out using the file system.

38\. Run your service inside of a container whenever possible. I believe this is the future—applications using [OCI Image Format][22] and Linux container technology. Launch these containers with Docker, [runC][23], OCID, RKT, Systemd-nspawn, and so on. Although I have often said "containers do not contain," they do contain better than not running them inside of a container.

39\. Run your container in a VM. Virtual machines provide better isolation than containers. Running like containers on virtual machines provides you scalability and isolation from each other.

40\. Run containerized apps with different security needs on different virtual machines. Run your web service containers on virtual machines in the DMZ, but run the database containers on virtual machines outside of the DMZ.

41\. Also remember to run your virtual machines requiring the most security on different physical machines, on different virtual machines inside of containers (a.k.a., defense in depth).

42\. Run your containers in [read-only mode.][24] Containers in development need to be able to write to **/usr**, but a container in production should only be able to write to **tmpfs** and volumes mounted into the container.

43. [Drop capabilities from your containers][25]. We run our processes in and outside of containers with many more "capabiltiies" than they need. You can make your processes more secure by dropping capabilties.

44. [Don't run your processes in containers as root][26]. Most services never need root privileges, or they need it to bind to a port < 1024 and then switch to a non-root user. I would advise always running apps as non-root.

45\. Keep your containers updated with the latest CVEs fixes. Using a system like OpenShift for building and maintaining your container images is a good idea, because it automatically rebuilds container images when a new security fix appears.

46\. An associate of mine says, "Docker is all about running random code from the Internet as root on your host." Get your software from a trusted source. Don't grab the first Apache application that you find at docker.io. The [operating system matters][27].

47\. Run your containers in production on a limited containerized optimized host, such as an [Atomic Host][28], which comes with all of the security turned on, optimized for running containers, with a limited attack surface and atomic updates. What is not to like there?

48\. Use tools like [OpenScap][29] to scan your systems for vulnerabilities. Sadly, new vulnerabilities are always popping up, so you must keep your scanners up to date. (Take a look at [atomic scan][30] for scanning your containers, as well.)

49\. OpenScap also has features to scan for [security configuration][31], such as STIGs (Security Technical Implementation Guides).

50\. Set up a special guest network for all those Christmas IoT devices your kids receive. I love my Amazon Echo and automated lights and power switches ("Alexa, turn on the Christmas Lights"), but each one of these is a Linux operating system that has questionable security.

### "There must be 50 more ways not to get hacked"

What would you add to the list? Let us know in the comments.

_Josh Bressers contributed to this article._

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/walsh1.jpg?itok=JbZWFm6J)

Daniel J Walsh - Daniel Walsh has worked in the computer security field for almost 30 years. Dan joined Red Hat in August 2001.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/yearbook-50-ways-avoid-getting-hacked

作者：[Daniel J Walsh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rhatdan
[1]:http://danwalsh.livejournal.com/51459.html
[2]:https://www.phoronix.com/scan.php?page=news_item&px=systemd-New-Protect-Tunables
[3]:https://www.youtube.com/watch?v=0H5chfbcWtY
[4]:http://syncstop.com/
[5]:http://stopdisablingselinux.com/
[6]:http://danwalsh.livejournal.com/71122.html
[7]:http://danwalsh.livejournal.com/31146.html
[8]:http://flatpak.org/
[9]:http://danwalsh.livejournal.com/37404.html
[10]:http://0pointer.de/blog/projects/security.html
[11]:https://source.android.com/security/selinux/
[12]:https://whispersystems.org/
[13]:https://access.redhat.com/blogs/766093/posts/2695561
[14]:https://lwn.net/Articles/656307/
[15]:https://www.yubico.com/
[16]:https://letsencrypt.org/
[17]:https://pwsafe.org/
[18]:https://www.lastpass.com/
[19]:https://www.freeipa.org/page/Main_Page
[20]:https://web.mit.edu/kerberos/
[21]:https://github.com/dkopecek/usbguard
[22]:https://www.opencontainers.org/
[23]:https://runc.io/
[24]:http://www.projectatomic.io/blog/2015/12/making-docker-images-write-only-in-production/
[25]:http://rhelblog.redhat.com/2016/10/17/secure-your-containers-with-this-one-weird-trick/
[26]:https://www.projectatomic.io/blog/2016/01/how-to-run-a-more-secure-non-root-user-container/
[27]:https://opensource.com/16/12/yearbook-why-operating-system-matters
[28]:https://access.redhat.com/articles/rhel-atomic-getting-started
[29]:https://www.open-scap.org/
[30]:https://developers.redhat.com/blog/2016/05/02/introducing-atomic-scan-container-vulnerability-detection/
[31]:https://www.open-scap.org/security-policies/scap-security-guide/
