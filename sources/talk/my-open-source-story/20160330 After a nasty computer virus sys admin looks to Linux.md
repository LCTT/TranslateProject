After a nasty computer virus, sys admin looks to Linux
=======================================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/OPENHERE_blue.png?itok=3eqp-7gT)

My first brush with open source came while I was working for my university as a part-time system administrator in 2001. I was part of a small group that created business case studies for teaching not just in the university, but elsewhere in academia.

As the team grew, the need for a robust LAN setup with file serving, intranet applications, domain logons, etc. emerged. Our IT infrastructure consisted mostly of bootstrapped Windows 98 computers that had become too old for the university's IT labs and were reassigned to our department.

### Discovering Linux

One day, as part of the university's IT procurement plan, our department received an IBM server. We planned to use it as an Internet gateway, domain controller, file and backup server, and intranet application host.

Upon unboxing, we noticed that it came with Red Hat Linux CDs. No one on our 22-person team (including me) knew anything about Linux. After a few days of research, I met a friend of a friend who did Linux RTOS programming for a living. I asked him for some help installing it.

It was heady stuff as I watched the friend load up the CD drive with the first of the installation CDs and boot into the Anaconda install system. In about an hour we had completed the basic installation, but still had no working internet connection.

Another hour of tinkering got us connected to the Internet, but we still weren't anywhere near domain logons or Internet gateway functionality. After another weekend of tinkering, we were able to instruct our Windows 98 terminals to accept the IP of the the Linux PC as the proxy so that we had a working shared Internet connection. But domain logons were still some time away.

We downloaded [Samba][1] over our awfully slow phone modem connection and hand configured it to serve as the domain controller. File services were also enabled via NFS Kernel Server and creating user directories and making the necessary adjustments and configurations on Windows 98 in Network Neighborhood.

This setup ran flawlessly for quite some time, and we eventually decided to get started with Intranet applications for timesheet management and some other things. By this time, I was leaving the organization and had handed over most of the sys admin stuff to someone who replaced me.

### A second Linux experience

In 2004, I got into Linux once again. My wife ran an independent staff placement business that used data from services like Monster.com to connect clients with job seekers.

Being the more computer literate of the two of us, it was my job to set things right with the computer or Internet when things went wrong. We also needed to experiment with a lot of tools for sifting through the mountains of resumes and CVs she had to go through on a daily basis.

Windows [BSoDs][2] were a routine affair, but that was tolerable as long as the data we paid for was safe. I had to spend a few hours each week creating backups.

One day, we had a virus that simply would not go away. Little did we know what was happening to the data on the slave disk. When it finally failed, we plugged in the week-old slave backup and it failed a week later. Our second backup simply refused to boot up. It was time for professional help, so we took our PC to a reputable repair shop. After two days, we learned that some malware or virus had wiped certain file types, including our paid data, clean.

This was a body blow to my wife's business plans and meant lost contracts and delayed invoice payments. I had in the interim travelled abroad on business and purchased my first laptop computer from [Computex 2004][3] in Taiwan. It had Windows XP pre-installed, but I wanted to replace it with Linux. I had read that Linux was ready for the desktop and that [Mandrake Linux][4] was a good choice. My first attempt at installation went without a glitch. Everything worked beautifully. I used [OpenOffice][5] for my writing, presentation, and spreadsheet needs.

We got new hard drives for our computer and installed Mandrake Linux on them. OpenOffice replaced Microsoft Office. We relied on webmail for mailing needs, and [Mozilla Firefox][6] was a welcome change in November 2004. My wife saw the benefits immediately, as there were no crashes or virus/malware infections. More importantly, we bade goodbye to the frequent crashes that plagued Windows 98 and XP. She continued to use the same distribution.

I, on the other hand, started playing around with other distributions. I love distro-hopping and trying out new ones every once in a while. I also regularly try and test out web applications like Drupal, Joomla, and WordPress on Apache and NGINX stacks. And now our son, who was born in 2006, grew up on Linux. He's very happy with Tux Paint, Gcompris, and SMPlayer.

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/3/my-linux-story-soumya-sarkar

作者：[Soumya Sarkar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

[a]: https://opensource.com/users/ssarkarhyd
[1]: https://www.samba.org/
[2]: https://en.wikipedia.org/wiki/Blue_Screen_of_Death
[3]: https://en.wikipedia.org/wiki/Computex_Taipei
[4]: https://en.wikipedia.org/wiki/Mandriva_Linux
[5]: http://www.openoffice.org/
[6]: https://www.mozilla.org/en-US/firefox/new/
