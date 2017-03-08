How to Keep Hackers out of Your Linux Machine Part 3: Your Questions Answered
============================================================

 ![Computer security](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/keep-hackers-out.jpg?itok=lqgHDxDu "computer security") 
Mike Guthrie answers some of the security-related questions received during his recent Linux Foundation webinar. Watch the free webinar on-demand.[Creative Commons Zero][1]

Articles [one][6] and [two][7] in this series covered the five easiest ways to keep hackers out of your Linux machine, and know if they have made it in. This time, I’ll answer some of the excellent security questions I received during my recent Linux Foundation webinar. [Watch the free webinar on-demand.][8]

**How can I store a passphrase for a private key if private key authentication is used by automated systems?**

This is tough. This is something that we struggle with on our end, especially when we are doing Red Teams because we have stuff that calls back automatically. I use Expect but I tend to be old-school on that. You are going to have to script it and, yes, storing that passphrase on the system is going to be tough; you are going to have to encrypt it when you store it.

My Expect script encrypts the passphrase stored and then decrypts, sends the passphrase, and re-encrypts it when it's done. I do realize there are some flaws in that, but it's better than having a no-passphrase key.

If you do have a no-passphrase key, and you do need to use it. Then I would suggest limiting the user that requires that to almost nothing. For instance, if you are doing some automated log transfers or automated software installs, limit the access to only what it requires to perform those functions.

You can run commands by SSH, so don't give them a shell, make it so they just run that command and it will actually prevent somebody from stealing that key and doing something other than just that one command.

**What do you think of password managers such as KeePass2?**

Password managers, for me, are a very juicy target. With the advent of GPU cracking and some of the cracking capabilities in EC2, they become pretty easy to get past.  I steal password vaults all the time.

Now, our success rate at cracking those, that's a different story. We are still in about the 10 percent range of crack versus no crack. If a person doesn't do a good job at keeping a secure passphrase on their password vault, then we tend to get into it and we have a large amount of success. It's better than nothing but still you need to protect those assets. Protect the password vault as you would protect any other passwords.

**Do you think it is worthwhile from a security perspective to create a new Diffie-Hellman moduli and limit them to 2048 bit or higher in addition to creating host keys with higher key lengths?**

Yeah. There have been weaknesses in SSH products in the past where you could actually decrypt the packet stream. With that, you can pull all kinds of data across. People use this safes to transfer files and passwords and they do it thoughtlessly as an encryption mechanism. Doing what you can to use strong encryption and changing your keys and whatnot is important. I rotate my SSH keys -- not as often as I do my passwords -- but I rotate them about once a year. And, yeah, it's a pain, but it gives me peace of mind. I would recommend doing everything you can to make your encryption technology as strong as you possibly can.

**Is using four completely random English words (around 100k words) for a passphrase okay?**

Sure. My passphrase is actually a full phrase. It's a sentence. With punctuation and capitalization. I don't use anything longer than that.

I am a big proponent of having passwords that you can remember that you don’t have to write down or store in a password vault. A password that you can remember that you don't have to write down is more secure than one that you have to write down because it's funky.

Using a phrase or using four random words that you will remember is much more secure than having a string of numbers and characters and having to hit shift a bunch of times. My current passphrase is roughly 200 characters long. It's something that I can type quickly and that I remember.

**Any advice for protecting Linux-based embedded systems in an IoT scenario?**

IoT is a new space, this is the frontier of systems and security. It is starting to be different every single day. Right now, I try to keep as much offline as I possibly can. I don't like people messing with my lights and my refrigerator. I purposely did not buy a connected refrigerator because I have friends that are hackers, and I know that I would wake up to inappropriate pictures every morning. Keep them locked down. Keep them locked up. Keep them isolated.

The current malware for IoT devices is dependent on default passwords and backdoors, so just do some research into what devices you have and make sure that there's nothing there that somebody could particularly access by default. Then make sure that the management interfaces for those devices are well protected by a firewall or another such device.

**Can you name a firewall/UTM (OS or application) to use in SMB and large environments?**

I use pfSense; it’s a BSD derivative. I like it a lot. There's a lot of modules, and there's actually commercial support for it now, which is pretty fantastic for small business. For larger devices, larger environments, it depends on what admins you can get a hold of.

I have been a CheckPoint admin for most of my life, but Palo Alto is getting really popular, too. Those types of installations are going to be much different from a small business or home use. I use pfSense for any small networks.

**Is there an inherent problem with cloud services?**

There is no cloud; there are only other people's computers. There are inherent issues with cloud services. Just know who has access to your data and know what you are putting out there. Realize that when you give something to Amazon or Google or Microsoft, then you no longer have full control over it and the privacy of that data is in question.

**What preparation would you suggest to get an OSCP?**

I am actually going through that certification right now. My whole team is. Read their materials. Keep in mind that OSCP is going to be the offensive security baseline. You are going to use Kali for everything. If you don't -- if you decide not to use Kali -- make sure that you have all the tools installed to emulate a Kali instance.

It's going to be a heavily tools-based certification. It's a good look into methodologies. Take a look at something called the Penetration Testing Framework because that would give you a good flow of how to do your test and their lab seems to be great. It's very similar to the lab that I have here at the house.

 _[Watch the full webinar on demand][3], for free. And see [parts one][4] and [two][5] of this series for five easy tips to keep your Linux machine secure._ 

 _Mike Guthrie works for the Department of Energy doing Red Team engagements and penetration testing._

--------------------------------------------------------------------------------

via: https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-3-your-questions-answered

作者：[MIKE GUTHRIE][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/anch
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/keep-hackers-outjpg
[3]:http://portal.on24.com/view/channel/index.html?showId=1101876&showCode=linux&partnerref=linco
[4]:https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-1-top-two-security-tips
[5]:https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-2-three-more-easy-security-tips
[6]:https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-1-top-two-security-tips
[7]:https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-2-three-more-easy-security-tips
[8]:http://portal.on24.com/view/channel/index.html?showId=1101876&showCode=linux&partnerref=linco
