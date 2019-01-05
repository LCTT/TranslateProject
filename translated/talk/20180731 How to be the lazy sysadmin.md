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



如何成为一名懒惰的系统管理员
---

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cat-yawn-vm.png?itok=0c_zy6aQ)

Linux 的系统管理员的工作总是复杂的，并且总是伴随这各种陷阱和障碍。从没有足够时间做任何事情，当你想完成那个半秃头老板（PHB）给的任务的时候，他（只会）不停在你的后面.盯着，而最核心的服务器总是在最不合时宜的时间点崩溃，问题和挑战比比皆是。

（译者注：半秃头老板 [PHB](https://en.wikipedia.org/wiki/Pointy-haired_Boss)，译者：那是[呆伯特漫画](https://zh.wikipedia.org/wiki/%E5%91%86%E4%BC%AF%E7%89%B9)中的角色，缺乏一般知识常识及其职位所应具有的管理能力，爱说大话且富有向物理显示挑战的精神,大概长成这样）

![](https://cdn-images-1.medium.com/max/1600/1*qu5upg6tgVSXx4KqL-4gZw.jpeg)

我在即将出版的新书 《 The Linux Philosophy for SysAdmins 》（译者注：暂叫《系统管理员的 Liunx 哲学》 ） 中更详细地讨论如何成为一个懒惰的系统管理员，那书预计会在9月出版。这本的部分内容摘录自该书，特别是第九章，「成为一名懒惰的系统管理员」。在我们讨论如何做到这点前，让我们简单了解一下成为一个名懒惰的系统管理员意味着什么。

### 真实生产力vs.虚假生产力
#### 虚假生产力

在我工作的地方，半秃头老板相信的管理风格叫「走动式管理」（ management by walking around ）。假设某人不在他的键盘上输入东西，或者至少检查他们显示的东西，判断他们的工作是否有效率的。这是一个糟糕的工作场所。它的各部门间有道很高的行政墙，这会造就了许多小型沟通壁垒，大量无用的文书工作，以及获得任何事情的许可都要等待漫长的时间。因为这些或者其他原因，不可能高效地做任何事情 ——如果真的是这样——所以我们是非常低效。为了看起来很忙，我们都有自己的一套 Look Busy 工具包（ Look Busy Kits, LBKs ），可能是一些短小的、用来显示一些行为行为活动的 Bash 脚本，或者是 `top`，`htop`，`iotop` 之类的程序，或者是一些持续显示某些行为活动的监控工具。这个工作场所的风气让人不可能真正高效， 我讨厌这个地方, 也讨厌那个几乎不可能完成任何有价值的事情的事实。

这糟糕场所对真实的系统管理员来讲是场噩梦。我们中没有人会感到快乐。（在那里）花费四五月才能完成的事，在其他地方只需的一个早晨。我们没有什么实际工作要做，却要花大量的时间干活来（让自己）看起来很忙。我们有一个无言竞赛，创造最好的 LBK（ Look Busy Kits） ，这就是我们花费最多时间的地方了。那份工作我只做了几个月，但好像已经过完一生。如果你看到的这个监狱的表面，你可能会说我们是很懒，因为我们只完成了几乎为 0 的实际工作。

这是个极端的例子，它完全与我所说的“我是一个懒惰的系统管理员”的意思相反，做一个懒惰的系统管理是件好事。

#### 真实生产力

我很幸运，曾为一些真正的经理工作——他们明白，系统管理员的生产力并不是以每天花多少小时敲键盘来衡量。毕竟，即使一只猴子能敲击他们的键盘，但也不能说明结果的价值。

正如我书中所言

> 「我是一个懒惰的系统管理员，同时我也是一个高效的系统管理员。这两者看似矛盾的说法不是相互排斥的，而是会以一种非常积极的方式相辅相成。。。
>
> 「一个系统管理员在思考的时候是最高效的——思考关于如何解决现有问题和避免未来的问题；思考怎样监控 Linux 计算机，以便找到预测和预示这些未来的问题的线索；思考如何让他们的工作更有效率；思考如何自动化所有这些要执行的任务, 无论是每天还是每年一次的任务。
>
> 「系统管理员冥思苦想的那一面是不会被非系统管理员所熟知的，那些人包括很多掌管着系统管理员的人，比如那个半秃头老板。系统管理员都会以不同的方式解决他们工作中苦思的部分。一些我认识的系统管理员会在沙滩、骑自行车、参加马拉松或者攀岩时找到最好的想法。另一些人会认为静坐或听音乐的时候思考得最好。还有一些会在阅读小说、学习不相关的学科、甚至在学习 Linux 系统的时候会想得最好。关键是我们都有不同的方式激发我们的创造力，而这些创造力的推进器中很多并不涉及键盘上的一个按键。我们真正的生产力对于系统管理员周围的人来说可能是完全看不见的。」

成为懒惰的系统管理员有一些简单的秘诀——系统管理员要完成一切需要完成的事，而且更多的是，当所有人都处于恐慌的状态时要保持冷静和镇定。（秘诀的）一部分是高效工作，另一部分是把预防问题放在首位。

### 成为懒惰系统管理员的方法

#### 多思考

我相信关于懒惰系统管理员最重要的秘诀在于思考。正如上面的摘录所言，优秀的系统管理员会花大量的时候思考这些事情，如何更有效率地工作，在异常成为问题前如何定位，更聪明地工作，做其他所有东西的同时会考虑如何完成这些的事等等。

例如，现在——除了撰写本文之外——我正在想一个项目，我打算在新部件从亚马逊和本地计算机商店到达时才开始。 我不那么重要的计算机上的主板坏了，最近它的崩溃更频率。 但我旧的和最小的服务器——处理我的电子邮件和外部网站，以及为我的网络的其余部分提供 DHCP 和 DNS 服务——并没有出现故障，但必须处理由于各种外部攻击而导致的间歇性过载。

我一开始想，我只要替换故障单元中的主板及其直接部件——内存、CPU，可能还有电源。但是在考虑了一段时间之后，我决定将新部件放到服务器中，并将旧的（但仍然可用的）部件从服务器移到故障系统中。可以这样做的，只需一、两个小时就可以从服务器上移除旧部件并安装新的。然后我就可以花时间更换出故障的电脑里的部件了。太好了。所以我开始在脑海中列出要完成的任务。

然而，当我查看列表时，我意识到服务器中唯一不能替换的部件是机箱和硬盘驱动器，这两台计算机的机箱几乎完全相同。在有了这个小小的发现之后，我开始考虑用新的部件替换出故障的计算机的部件，并将之作为我的服务器。经过一些测试之后，我只需从当前的服务器移除硬盘，并将它安装到新的组件中，改下网络配置项，再更改 KVM 交换机端口上的主机名，并更改主机名标签，就可以了。这将大大减少服务器停机时间，大大减少我的压力。此外，如果出现故障，我可以简单地将硬盘移回原来的服务器，直到我可以用新服务器解决问题为止。

所以，现在我在脑海中已经创建了一个我需要做的任务清单，以完成这项工作。而且——我希望你能仔细观察——当我脑子里想着这一切的时候，我的手指从来没有碰过键盘。我新的心理行动计划风险很低，与我最初的计划相比，涉及的服务器停机时间要少得多。

当我在 IBM 工作的时候，我经常看到很多语言中都有写着“思考”的标语。思考可以节省时间和压力，是懒散的系统管理员的主要标志。

#### 做预防性维护

在 1970 年代中期，我被 IBM 聘为客户工程师，我的领地由相当多的穿孔卡片设备组成。这也就是说，它们是处理打孔卡的重型机械设备—— 一些可以追溯到20世纪30年代。因为这些机器主要是机械的，所以它们的部件经常磨损或失调。我的部分工作是在他们损坏时修复这些他们。我工作的主要部分——最重要的部分 ——首先要防止它们。预防性维护的目的是在磨损部件损坏之前进行更换，并对还在运行的部件进行润滑和调整，以确保它们工作正常。


正如我在《系统管理员的 Linux哲学》（ The Linux Philosophy for SysAdmins）中所言：

>「我在 IBM 的经理们明白这只是冰山一角；他们——和我——都是我的工作是让顾客满意。虽然这通常意味着修复损坏的硬件，但也意味着减少硬件损坏的次数。这对客户来说是好事，因为他们的机器在工作时工作效率更高。这对我有好处，因为我从那些快乐的客户那里接到的电话要少得多。我也睡了更多的觉，因为这样做的结果是更少的非工作时间的紧急电话。我是个懒惰的（客户工程师）。通过提前做额外的工作，从长远来看，我需要做的工作要少得多。
>
>「这一原则已成为系统管理员的 Linux 哲学的功能原则之一。作为系统管理员，我们的时间最好用在最大限度地减少未来工作量的任务上。」

在 Linux 计算机中查找要解决的问题相当于项目管理。我检查系统日志，寻找以后可能会变得非常危险的问题的暗示。如果出现了一些小问题，或者我注意到我的工作站、服务器没有做出该有的响应，或者如果日志显示了一些不寻常的东西——所有这些都可以暗示出潜在的问题，而对于用户或半秃头老板来说，这些问题并没有产生明显的症状。

我经常检查 `/var/log/` 中的文件，特别是 messages 和 security 文件。我最常见的问题之一是许多脚本小子在我的防火墙系统上尝试各种类型的攻击。而且，不，我不依赖 ISP（Internet Service Provider，网络服务提供者）提供的调制解调器/路由器中的所谓的防火墙。这些日志包含了大量关于企图攻击来源的信息，非常有价值。但是要扫描不同主机上的日志并将解决方案部署到位，需要做大量的工作。所以我转向自动化。

#### 自动化

我发现我的工作有很大一部分可以通过某种形式的自动化来完成。系统管理员的 Linux 哲学的原则之一是 「自动化一切」，这包括每天扫描日志文件等枯燥乏味的任务。

像是 [Logwatch][3] 这类的程序能够监控你的日志文件中的异常条目，并在异常条目发生时通知您。Logwatch通常作为 cron jobs（译者注，Linux/Unix 中周期作业程序）每天运行一次，并向本地主机上的 root 用户发送电子邮件。你可以从命令行运行 Logwatch，并立即在显示器上查看结果。现在我只需要每天查看 Logwatch 的电子邮件通知。

但现实是，仅仅收到通知是不够的，因为我们不能坐以待毙。有时需要立即作出反应。我喜欢的另一个程序是——它能为我做所有事——（让大家看到，这就是懒惰的管理员）——它就是[Fail2ban][4]。Fail2Ban 会扫描指定的日志文件，查找各种类型的黑客攻击和入侵尝试，如果它发现某个 IP 地址在做特定类型的持续活动够了，它会向防火墙添加一个条目，在指定的时间内阻止来自该 IP 地址的任何进一步的黑客尝试。默认值通常在 10 分钟左右，但我喜欢为大多数类型的攻击指定为 12 或 24 小时。每种类型的黑客攻击都是单独配置的，例如尝试通过 SSH 登录和那些 Web 服务器的攻击。

#### 写脚本

自动化是哲学的关键组成部分之一。一切可以自动化的东西都应该自动化的，其余的尽可能地自动化。所以，我也写了很多脚本来解决问题，也就说说我编写脚本来完成我的大部分工作。

我的脚本帮我节省了大量时间，因为它们包含执行特定任务的命令，这大大减少了我需要输入的数量。例如，我经常重新启动我的电子邮件服务器和垃圾邮件处理软件（当修改 SpamAssassin 的 `local.cf` 配置文件时，就需要重启）。必须按特定顺序停止并重新启动这些服务。因此，我用几个命令编写了一个简短的脚本，并将其存储在可访问的 `/usr/local/bin` 中。现在，不用键入几个命令并等待每个命令都完成，然后再键入下一个命令——更用记住正确的命令顺序和每个命令的正确语法——我输入一个三个字符的命令，其余的留给我的脚本来完成。

#### 简化键入

另一种成为懒惰的系统管理员的方法是减少我们需要键入的数量。而且，我的打字技巧真的很糟糕（也就是说，我一点也没有——顶多是几个笨拙的手指）。导致错误的一个可能原因是我的打字不好，所以我会尽量少打字。

绝大多数 GNU 和 Linux 核心实用程序都有非常短的名称。然而，它们都是有意义的名字。诸如用于更改目录的 `cd` 、用于列出（目录内容）的 `ls` 和用于磁盘转储的 `dd` 等工具都非常明显。短名字意味着更少的打字和更少的产生错误机会。我认为短的名字通常更容易记住。

当我编写 shell 脚本时，我喜欢保持名称简短而意义（至少对我来说是），比如用于 rsync 备份的 `rsbu`（译者注，Rsync Backup 的简写）。在某些情况下，我喜欢使用更长的名称，比如 `doUpdates` 来执行系统更新。在后一种情况下，长一点名让脚本的目的就越明显。这可以节省时间，因为很容易记住脚本的名称。

其他减少键入的方法包括命令行别名（alias）、命令行调回（recall）和编辑。别名只是你在 Bash shell 键入命令时才做的替换。键入 `alias` 命令会看到默认配置的别名列表。例如，当你输入命令 `ls` 时，会被条目 `alias ls='ls –color=auto'` 替成较长的命令，因此你只需键入 2 个字符而不是 14 个字符即可获得带有颜色的列表。还可以使用 `alias` 命令添加你自己（定义）的别名。

命令行调回允许你使用键盘的向上和向下箭头键滚动浏览命令历史记录。如果需要再次使用相同的命令，只需在找到所需的命令时按 Enter 键即可。如果在找到命令后需要更改该命令，则可以使用标准命令行编辑功能进行更改。

### 结束语

一名懒惰的系统管理员实际上也有很多的工作。但我们是聪明地工作，而不是刻苦工作。早在一堆小问题汇聚成大问题之前, 我们就花时间探索我们负责的主机,并处理好所有的小问题。我们花了很多时间思考解决问题的最佳方法, 我们也花了很多时间来发现新的方法, 让自己更聪明地工作, 成为懒惰的系统管理员。

除了这里描述的少数方法外, 还有许多其他的方式可以成为懒惰的系统管理员。我相信你也有一些自己的方式;请在评论中和我们分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/how-be-lazy-sysadmin

作者：[David Both][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[zgj1024](https://github.com/zgj1024)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://www.apress.com/us/book/9781484237298
[2]:https://en.wikipedia.org/wiki/Unit_record_equipment
[3]:https://www.techrepublic.com/article/how-to-install-and-use-logwatch-on-linux/
[4]:https://www.fail2ban.org/wiki/index.php/Main_Page