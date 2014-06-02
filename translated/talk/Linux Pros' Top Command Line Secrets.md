Linux大神们的顶级命令行秘诀
================================================================================
![](http://www.linuxinsider.com/images/rw509807/command-line.jpg)

> “命令行秘诀？根本就没这玩样。”博主罗伯特·柏格森说。“新手们，你们失望了？那就猛敲‘help’吧。还想要点提示？随便‘man’个什么吧。想更多来点不同？敲‘ls /bin /sbin /usr/bin /usr/sbin | less’，随便捡几个宝贝命令出来，整晚地‘man’去吧。我已经干那活超过十年了，到现在还玩得不亦乐乎。”当然，“某人可要对破坏之类的事情上瘾了。”

**好**吧，Linux博客圈这里这周相对比较平静，给网民们一个拖了很久的机会集体喘口气吧，去享受一下龙舌兰、燕尾服、鸡尾酒带来的欢快吧，然后评估一下过去几周来发生的和自由开放软件相关的事件吧。

有些人错过了这些重大新闻：[IEEE][2]的[颁奖礼][1]，计算机世界的2014计算机先驱奖正是颁发给了李纳斯·托沃兹；Tails OS 1.0的[到来][3]；以及，也许是最令人激动的事情，位于西雅图的乐队[网猫][5][发布了][4]作为Linux内核模块的首张唱片。

“你是否曾经在听一张专辑的时候想过‘伙计，这听起来不错，但是我希望它能经常从用户空间过渡到内核空间去！’”网猫在Facebook上写道，“我们会全力支持你的。我们的专辑现在完全可以作为一个可加载的Linux内核模块来播放。”
Linux Girl thought she had seen it all here in the Linux world, but now she realizes she was wrong. Thank you, netcat, for keeping life interesting!

### 'Command Line Secrets'  ###

![](http://www.linuxinsider.com/images/article_images/linuxgirl_bg_pinkswirl_150x245.jpg)

Speaking of interesting, there's nothing like a little shop talk around the bar to pass the time during a quiet week, and last week afforded a dose of that as well. Life is good here in the Linux blogosphere!

The forum was Linux Voice -- that shiny, new magazine alert readers may remember [launched late last year][6] -- and the topic was none other than [command line secrets][7].

Linux Girl couldn't resist.

### 'It Manages to Render Most Web Pages'  ###

"There are loads of really good reasons to use the command line," wrote the masterminds at Linux Voice. "It's the most powerful and concise method of interacting with your computer.

"However, we decided to take a moment to look at some of its more obscure (and some would say pointless) uses," they added.

Top of the magazine's list is the elinks Web browser: "It might not be as colorful as its more famous rivals, but it manages to render most Web pages," they explained. "As well has having geek-chic, it can come in handy when you just need to quickly check if a Web page is accessible from a computer you only have SSH access to."

The list goes on from there to include looking up definitions on Wikipedia, among other tips.

Down at the Broken Windows Lounge, patrons had plenty of suggestions of their own.

### 'Great for Maintenance'  ###

"Very nice tips on CL commands, very nice," enthused Google+ blogger Alessandro Ebersol, for example. "But they forgot [cowsay][8], which is great for having some laughs in the darkness of a terminal."

The command line "is great for maintenance," he added. "One can automate with bash scripts and make complex tasks with few (or just one) keystrokes."

Other command line secrets Ebersol would add to the original list are sl (steam locomotive), along with [these nuggets][9]:

    * % cat "food in cans"
    cat: can't open food in cans
    * % nice man woman
    No manual entry for woman.
    * % [Where is Jimmy Hoffa?
    Missing ].
    * % make love
    Make: Don't know how to make love. Stop.
    * % man: why did you get a divorce?
    man:: Too many arguments.

### 'The Most Precious Gem'  ###

"Command-line secrets? There aren't any such things," blogger [Robert Pogson][10] told Linux Girl. "Desperate newbie? Type 'help.' Still need a hint? Type 'man whatever.' Want more diversity? Type 'ls /bin /sbin /usr/bin /usr/sbin | less,' pick out a few gems and type 'man whatever' all night long. I've been at it more than a decade. Still having fun."

Pogson doesn't remember how long ago he discovered 'ssh,' but "it's the most precious gem of the FLOSS world," he said.

"The awesome power of ssh is that the joy you have with typing commands on one computer can allow you a hundred times the joy on 100 computers," he added. "Of course, it's not fun to type passwords 100 times, so learn to use secure passwordless logins with ssh to make logging in remotely transparent."

### 'Use It With Respect'  ###

Of course, "just as with any pleasurable activity, one can be addicted to the point of destruction," Pogson warned. "As root, you can type commands to delete everything or otherwise mess things up.

"This is the nuclear option, and just as world leaders should sit on their hands and think carefully before pushing the button, value this power and use it with respect and higher motivations," he added.

"I once deleted a file system because my thumb dragged the space bar into a command," Pogson concluded. "I only did that once. Honest."

### 'Very Powerful'  ###

Google+ blogger Gonzalo Velasco C. was no less enthusiastic.

"Even though the [GUI][11] tools are easier, in the *nix universe, the command line remains very powerful," he told Linux Girl. "Even some power MacOS users use them."

As for Gonzalo Velasco C. himself, "the only commands I would like to master are the process control and killing, to use with ctrl+alt+backspace, so I can handle the one process that is giving me trouble, and the tar.gz files management -- that to this very day remains a pain for me," he said.

#### 'Ur Doing It Wrong' ####

Last but not least, SoylentNews blogger hairyfeet had a different perspective altogether.

"The only thing I would add to a story about CLI is this: If you aren't working in IT and performing repetitive tasks where having an extremely simplistic, primitive way to script something is useful, and yet you are still using CLI, then 'ur doing it wrong,'" hairyfeet told Linux Girl. "A CLI isn't magic -- it's a GUI from the 1970s!"

Today there are "useful GUIs thanks to actually having more CPU and RAM than a dollar-store watch -- we even have IDEs and scripting languages that can run rings around that 70s throwback, work across the WAN or LAN and interact with the deepest levels of the OS, all while being easier to use thanks to technologies like intellisense and autocomplete," he explained. "So why in God's name, if you aren't one of the 3 percent who are administering systems where every single byte counts, would you be dragging that old pile of junk out of mothballs?"

Hairyfeet's best CLI advice? "Don't -- join the rest of the planet in the 21st century and learn how to use real languages and tools," he concluded. "Let CLI join bubble memory and floppies on the dustbin of history."

> atherine Noyes is always on duty in her role as Linux Girl, whose cape she has worn since 2007. A mild-mannered journalist by day, she spends her evenings haunting the seedy bars and watering holes of the Linux blogosphere in search of the latest gossip. You can also find her on [Twitter][12] and [Google+][13].

--------------------------------------------------------------------------------

via: http://www.linuxinsider.com/story/80437.html?rss=1

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.computer.org/portal/web/pressroom/Linus-Torvalds-Named-Recipient-of-the-2014-IEEE-Computer-Society-Computer-Pioneer-Award
[2]:http://www.ieee.org/
[3]:http://www.linuxinsider.com/story/80386.html
[4]:https://www.facebook.com/netcatband/posts/755205877853161?stream_ref=10
[5]:http://www.netcat.co/
[6]:http://www.linuxinsider.com/story/79448.html
[7]:http://www.linuxvoice.com/commandline-secrets/
[8]:http://en.wikipedia.org/wiki/Cowsay
[9]:https://www.linux.com/community/blogs/133-general-linux/10408
[10]:http://mrpogson.com/
[11]:http://en.wikipedia.org/wiki/GUI
[12]:http://twitter.com/noyesk
[13]:https://plus.google.com/+KatherineNoyes?rel=author