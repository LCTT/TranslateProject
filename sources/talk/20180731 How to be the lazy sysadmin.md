How to be the lazy sysadmin
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cat-yawn-vm.png?itok=0c_zy6aQ)

The job of a Linux SysAdmin is always complex and often fraught with various pitfalls and obstacles. Ranging from never having enough time to do everything, to having the Pointy-Haired Boss (PHB) staring over your shoulder while you try to work on the task that she or he just gave you, to having the most critical server in your care crash at the most inopportune time, problems and challenges abound. I have found that becoming the Lazy Sysadmin can help.

I discuss how to be a lazy SysAdmin in detail in my forthcoming book, [The Linux Philosophy for SysAdmins][1], (Apress), which is scheduled to be available in September. Parts of this article are taken from that book, especially Chapter 9, "Be a Lazy SysAdmin." Let's take a brief look at what it means to be a Lazy SysAdmin before we discuss how to do it.

### Real vs. fake productivity

#### Fake productivity

At one place I worked, the PHB believed in the management style called "management by walking around," the supposition being that anyone who wasn't typing something on their keyboard, or at least examining something on their display, was not being productive. This was a horrible place to work. It had high administrative walls between departments that created many, tiny silos, a heavy overburden of useless paperwork, and excruciatingly long wait times to obtain permission to do anything. For these and other reasons, it was impossible to do anything efficiently—if at all—so we were incredibly non-productive. To look busy, we all had our Look Busy Kits (LBKs), which were just short Bash scripts that showed some activity, or programs like `top`, `htop`, `iotop`, or any monitoring tool that constantly displayed some activity. The ethos of this place made it impossible to be truly productive, and I hated both the place and the fact that it was nearly impossible to accomplish anything worthwhile.

That horrible place was a nightmare for real SysAdmins. None of us was happy. It took four or five months to accomplish what took only a single morning in other places. We had little real work to do but spent a huge amount of time working to look busy. We had an unspoken contest going to create the best LBK, and that is where we spent most of our time. I only managed to last a few months at that job, but it seemed like a lifetime. If you looked only at the surface of that dungeon, you could say we were lazy because we accomplished almost zero real work.

This is an extreme example, and it is totally the opposite of what I mean when I say I am a Lazy SysAdmin and being a Lazy SysAdmin is a good thing.

#### Real productivity

I am fortunate to have worked for some true managers—they were people who understood that the productivity of a SysAdmin is not measured by how many hours per day are spent banging on a keyboard. After all, even a monkey can bang on a keyboard, but that is no indication of the value of the results.

As I say in my book:

> "I am a lazy SysAdmin and yet I am also a very productive SysAdmin. Those two seemingly contradictory statements are not mutually exclusive, rather they are complementary in a very positive way. …
>
> "A SysAdmin is most productive when thinking—thinking about how to solve existing problems and about how to avoid future problems; thinking about how to monitor Linux computers in order to find clues that anticipate and foreshadow those future problems; thinking about how to make their work more efficient; thinking about how to automate all of those tasks that need to be performed whether every day or once a year.
>
> "This contemplative aspect of the SysAdmin job is not well known or understood by those who are not SysAdmins—including many of those who manage the SysAdmins, the Pointy Haired Bosses. SysAdmins all approach the contemplative parts of their job in different ways. Some of the SysAdmins I have known found their best ideas at the beach, cycling, participating in marathons, or climbing rock walls. Others think best when sitting quietly or listening to music. Still others think best while reading fiction, studying unrelated disciplines, or even while learning more about Linux. The point is that we all stimulate our creativity in different ways, and many of those creativity boosters do not involve typing a single keystroke on a keyboard. Our true productivity may be completely invisible to those around the SysAdmin."

There are some simple secrets to being the Lazy SysAdmin—the SysAdmin who accomplishes everything that needs to be done and more, all the while keeping calm and collected while others are running around in a state of panic. Part of this is working efficiently, and part is about preventing problems in the first place.

### Ways to be the Lazy SysAdmin

#### Thinking

I believe the most important secret about being the Lazy SysAdmin is thinking. As in the excerpt above, great SysAdmins spend a significant amount of time thinking about things we can do to work more efficiently, locate anomalies before they become problems, and work smarter, all while considering how to accomplish all of those things and more.

For example, right now—in addition to writing this article—I am thinking about a project I intend to start as soon as the new parts arrive from Amazon and the local computer store. The motherboard on one of my less critical computers is going bad, and it has been crashing more frequently recently. But my very old and minimal server—the one that handles my email and external websites, as well as providing DHCP and DNS services for the rest of my network—isn't failing but has to deal with intermittent overloads due to external attacks of various types.

I started by thinking I would just replace the motherboard and its direct components—memory, CPU, and possibly the power supply—in the failing unit. But after thinking about it for a while, I decided I should put the new components into the server and move the old (but still serviceable) ones from the server into the failing system. This would work and take only an hour, or perhaps two, to remove the old components from the server and install the new ones. Then I could take my time replacing the components in the failing computer. Great. So I started generating a mental list of tasks to do to accomplish this.

However, as I worked the list, I realized that about the only components of the server I wouldn't replace were the case and the hard drive, and the two computers' cases are almost identical. After having this little revelation, I started thinking about replacing the failing computer's components with the new ones and making it my server. Then, after some testing, I would just need to remove the hard drive from my current server and install it in the case with all the new components, change a couple of network configuration items, change the hostname on the KVM switch port, and change the hostname labels on the case, and it should be good to go. This will produce far less server downtime and significantly less stress for me. Also, if something fails, I can simply move the hard drive back to the original server until I can fix the problem with the new one.

So now I have created a mental list of the tasks I need to do to accomplish this. And—I hope you were watching closely—my fingers never once touched the keyboard while I was working all of this out in my head. My new mental action plan is low risk and involves a much smaller amount of server downtime compared to my original plan.

When I worked for IBM, I used to see signs all over that said "THINK" in many languages. Thinking can save time and stress and is the main hallmark of a Lazy SysAdmin.

#### Doing preventative maintenance

In the mid-1970s, I was hired as a customer engineer at IBM, and my territory consisted of a fairly large number of [unit record machines][2]. That just means that they were heavily mechanical devices that processed punched cards—a few dated from the 1930s. Because these machines were primarily mechanical, their parts often wore out or became maladjusted. Part of my job was to fix them when they broke. The main part of my job—the most important part—was to prevent them from breaking in the first place. The preventative maintenance was intended to replace worn parts before they broke and to lubricate and adjust the moving components to ensure that they were working properly.

As I say in The Linux Philosophy for SysAdmins:

> "My managers at IBM understood that was only the tip of the iceberg; they—and I—knew my job was customer satisfaction. Although that usually meant fixing broken hardware, it also meant reducing the number of times the hardware broke. That was good for the customer because they were more productive when their machines were working. It was good for me because I received far fewer calls from those happier customers. I also got to sleep more due to the resultant fewer emergency off-hours callouts. I was being the Lazy [Customer Engineer]. By doing the extra work upfront, I had to do far less work in the long run.
>
> "This same tenet has become one of the functional tenets of the Linux Philosophy for SysAdmins. As SysAdmins, our time is best spent doing those tasks that minimize future workloads."

Looking for problems to fix in a Linux computer is the equivalent of project management. I review the system logs looking for hints of problems that might become critical later. If something appears to be a little amiss, or I notice my workstation or a server is not responding as it should, or if the logs show something unusual—all of these can be indicative of an underlying problem that has not generated symptoms obvious to users or the PHB.

I do frequent checks of the files in `/var/log/`, especially messages and security. One of my more common problems is the many script kiddies who try various types of attacks on my firewall system. And, no, I do not rely on the alleged firewall in the modem/router provided by my ISP. These logs contain a lot of information about the source of the attempted attack and can be very valuable. But it takes a lot of work to scan the logs on various hosts and put solutions into place. So I turn to automation.

#### Automating

I have found that a very large percentage of my work can be performed by some form of automation. One of the tenets of the Linux Philosophy for SysAdmins is "automate everything," and this includes boring, drudge tasks like scanning logfiles every day.

Programs like [Logwatch][3] can monitor your logfiles for anomalous entries and notify you when they occur. Logwatch usually runs as a cron job once a day and sends an email to root on the localhost. You can run Logwatch from the command line and view the results immediately on your display. Now I just need to look at the Logwatch email notification every day.

But the reality is just getting a notification is not enough, because we can't sit and watch for problems all the time. Sometimes an immediate response is required. Another program I like, one that does all of the work for me—see, this is the real Lazy Admin—is [Fail2Ban][4]. Fail2Ban scans designated logfiles for various types of hacking and intrusion attempts, and if it sees enough sustained activity of a specific type from a particular IP address, it adds an entry to the firewall that blocks any further hacking attempts from that IP address for a specified time. The defaults tend to be around 10 minutes, but I like to specify 12 or 24 hours for most types of attacks. Each type of hacking attack is configured separately, such as those trying to log in via SSH and those attacking a web server.

#### Writing scripts

Automation is one of the key components of the Philosophy. Everything that can be automated should be, and the rest should be automated as much as possible. So, I also write a lot of scripts to solve problems, which also means I write scripts to do most of my work for me.

My scripts save me huge amounts of time because they contain the commands to perform specific tasks, which significantly reduces the amount of typing I need to do. For example, I frequently restart my email server and my spam-fighting software (which needs restarted when configuration changes are made to SpamAssassin's `local.cf` file). Those services must be stopped and restarted in a specific order. So, I wrote a short script with a few commands and stored it in `/usr/local/bin`, where it is accessible. Now, instead of typing several commands and waiting for each to finish before typing the next one—not to mention remembering the correct sequence of commands and the proper syntax of each—I type in a three-character command and leave the rest to my script.

#### Reducing typing

Another way to be the Lazy SysAdmin is to reduce the amount of typing we need to do. Besides, my typing skills are really horrible (that is to say I have none—a few clumsy fingers at best). One possible cause for errors is my poor typing, so I try to keep typing to a minimum.

The vast majority of GNU and Linux core utilities have very short names. They are, however, names that have some meaning. Tools like `cd` for change directory, `ls` for list (the contents of a directory), and `dd` for disk dump are pretty obvious. Short names mean less typing and fewer opportunities for errors to creep in. I think the short names are usually easier to remember.

When I write shell scripts, I like to keep the names short but meaningful (to me at least) like `rsbu` for Rsync BackUp. In some cases, I like the names a bit longer, such as `doUpdates` to perform system updates. In the latter case, the longer name makes the script's purpose obvious. This saves time because it's easy to remember the script's name.

Other methods to reduce typing are command line aliases and command line recall and editing. Aliases are simply substitutions that are made by the Bash shell when you type a command. Type the `alias` command and look at the list of aliases that are configured by default. For example, when you enter the command `ls`, the entry `alias ls='ls –color=auto'` substitutes the longer command, so you only need to type two characters instead of 14 to get a listing with colors. You can also use the `alias` command to add your own aliases.

Command line recall allows you to use the keyboard's Up and Down arrow keys to scroll through your command history. If you need to use the same command again, you can just press the Enter key when you find the one you need. If you need to change the command once you have found it, you can use standard command line editing features to make the changes.

### Parting thoughts

It is actually quite a lot of work being the Lazy SysAdmin. But we work smart, rather than working hard. We spend time exploring the hosts we are responsible for and dealing with any little problems long before they become large problems. We spend a lot of time thinking about the best ways to resolve problems, and we think a lot about discovering new ways to work smarter at being the Lazy SysAdmin.

There are many other ways to be the Lazy SysAdmin besides the few described here. I'm sure you have some of your own; please share them with the rest of us in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/how-be-lazy-sysadmin

作者：[David Both][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://www.apress.com/us/book/9781484237298
[2]:https://en.wikipedia.org/wiki/Unit_record_equipment
[3]:https://www.techrepublic.com/article/how-to-install-and-use-logwatch-on-linux/
[4]:https://www.fail2ban.org/wiki/index.php/Main_Page
