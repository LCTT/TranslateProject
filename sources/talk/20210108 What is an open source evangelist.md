[#]: collector: (lujun9972)
[#]: translator: (rsqrt2b)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is an open source evangelist?)
[#]: via: (https://opensource.com/article/21/1/open-source-evangelist)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)

什么是开源传教士？
======
了解如何成为产品用户和开发人员之间的桥梁。
![Teamwork starts with communication][1]

当人们得知我是个开源传教士（专注于 [syslog-ng][2] 和 [sudo][3]）的时候，他们经常问我在 Linux 世界如此知名是什么感觉。我的回答非常简短：这很棒！

我不会感到无聊，因为我是研发的一部分。当人们实践我教他们的东西以及我收集到的用户反馈影响产品开发的时候，我感觉我起了作用。

### 什么是传教士？

我将传教士定义为一座桥梁——软件（或其他产品）用户和开发人员之间的桥梁。传教士不仅仅将好消息分享给用户，还要从他们那里收集反馈。

传教士们有着各式各样的背景：有的具有市场营销背景，对技术有着浓厚的兴趣；有的是喜欢和用户交流的开发人员。我属于第三类——“高级用户”，或者说从用户视角对软件产品有深入了解的人。

我和很多很多用户一起工作。syslog-ng 的用户群体非常庞大，它适用于大多数 Linux 发行版和 BSD 变体。数以亿计的设备运行着 syslog-ng，其中包括 BMW i3 和 Kinidle。大多数基于 BSD 的设备，譬如 FreeNAS，使用用 syslog-ng 记录日志 就像基于 Linux 的<ruby>网络附属存储<rt>Network Attached Storage</rt></ruby>（NAS）使用 Synology 和 QNAP 一样。就算 syslog-ng 运行在太空的某处，我也不会感到惊讶。


大多数 Linux 和 Unix 用户使用 sudo，因为它几乎被安装在每一台 Linux 设备上。社区很大，有几千万人。人们经常问我是如何处理那么多用户的，但这并不困难。

### 我是如何成为一名传教士的

我成为传教士的旅程是一个跨越近20年的进化过程。它始于许多年前，我在大学教书的时候。我的下一步是和 POWER/PowerPC 的 Linux 用户、开发人员合作。最后，我开始在 [Balabit][4] 的工作中使用 syslog-ng，再后来我开始在 sudo 方面工作。


我在 Balabit 的第一份工作是帮助 Linux 发行版将它们的 syslog-ng 包升级到上游的最新版本。随着我越来越多地了解 syslog-ng 的细节，我被要求帮助它的用户。一年后，我在匈牙利和国际会议上发表关于 syslog-ng的演说。不久之后，我从用户那里收集到的数据开始对产品开发产生影响。

八年后，也就是2018年，Balabit 被 [One Identity][5] 收购，sudo 的维护者 [Todd Miller][6] 成为了我的同事。在那之前我只是了解一些基本的 sudo 功能，但我变得对 sudo 更感兴趣并开始了解它的高级功能。恒快，我开始传教 sudo，从一名 syslog-ng 传教士进化为一个更一般的开源传教士。

### 技术传教的四大支柱

技术传教士做很多事情，大致可以分为四类：开发人员、支持人员、技术产品营销和产品经理

#### 开发人员

我不是开发人员，但我做很多开发人员的工作，例如为各式各样的 Linux 发行版和 FreeBSD 打包 syslog-ng，做很多测试，将 syslog-ng 集成到其他软件中并在外国平台上测试。我做的开发人员的工作帮助社区和我自己更好地了解其需求。

#### 支持人员

关注 bug 追踪器，在 Google Alerts 和 Twitter 上查看 syslog-ng 关键词以及阅读邮件列表都能让我更好地帮助我们的用户群体。同我帮助他人，我也能能更好地理解他们的问题所在。

#### 技术产品营销

I really do not like the term "marketing," but writing blogs and talking at conferences *is* marketing. As a former sysadmin, I know my audience, and we have a common voice. Along with my own Twitter handle, [@PCzanik][7], I also post under the [@sngOSE][8] (syslog-ng open source edition) and [@SudoProject][9] (sudo) handles.
我真的不喜欢“营销”这个词，但是写博客和在会议上演说 *确实是* 营销。

Twitter is a fantastic platform to collect and share technical news. Marketing is the most visible part of my work as an evangelist, even if it is just one aspect of my job.

  * **Event survival tips for introverts:** When people learn that I am doing this job even though I am an introvert, they often ask me how I do it. Giving a talk or working at a conference booth all day long can be difficult; there are too many people, too much noise. Here are my survival tips for events:
    * Focus on the results. Events are the best opportunity to collect feedback from users. After your talk, you can have good discussions anywhere, even at the booth or in the hallway. Users give a lot of feedback in real life at events, and remembering their comments helps a lot.
    * Keep in mind when the event is over. Knowing that you have to stay only one more hour in an environment with a high level of noise helps a lot.
    * Enjoy that you get to talk to like-minded people who have the same shyness, insecurity, and technical interests as you have.
  * **Marketing tips during a pandemic:** Many people have asked me how COVID-19 has affected my work since I haven't been able to travel since March 2020. I came back from talking at the [RSA Conference][10] and [Southern California Linux Expo][11] just two days before flights were suspended and borders were closed. Even though all conferences are virtual right now, I can still give talks about sudo and syslog-ng. But this means feedback is missing or minimal—there is no hallway track to meet users nor a dinner for speakers to discuss the latest and greatest technologies. Participation and attention are also less focused, as there are plenty of distractions when people are working from home. I have seen many different efforts to work around this situation. Each has its own drawbacks and advantages:
    * A global chat room is good for a smaller event. But if an event has more than just a few dozen people, then it turns into a continuous roll of 'Hi from Boston, MA' and similar messages without a chance for a meaningful conversation.
    * If an event has multiple tracks, a dedicated chat for each track can be helpful. Both the users and the speaker can learn a lot from the questions and remarks posted in the chat. A moderator can make it twice as much useful, keeping the discussion on topic and making sure that questions reach the speaker during the Q&amp;A part of the talk.
    * A chat roulette is good to connect random strangers and might result in good discussions. But for a speaker, it is way too random.
    * Tracking chats is good but many people are uncomfortable to post questions or share experiences in public. A possibility for direct chat with the speaker can resolve this problem.



#### Product management

I am not a product manager, even though sometimes I wish that the feedback I collect could be turned directly into features. However, I regularly share users' feedback with developers and product management. In internal discussions, I always represent the users' side rather than the easiest way forward for developers or what will generate the most revenue.

### Why evangelize broadly known and used software?

Every Linux user knows sudo, and many of them also know syslog-ng. So why evangelize? Well, most people know just the very basics of these applications, which they learned when they started to play with Linux. But neither is a simple utility that has been in maintenance mode for decades; both are living software still under continuous development.

What most people know about syslog-ng is that it collects log messages and saves them to text files. But it has a lot of [other features][12], including parsing messages, enriching messages with geographical information, precise message routing (filtering), and saving messages to databases, Hadoop, or message queues.

Sudo is mostly known as a prefix for administrative commands, but it can do a lot more. It can record sessions that run through it, allowing you to check what your users are doing when they exercise their superpowers through sudo. You can also extend sudo with plugins. [Starting with sudo version 1.9][13], you can even extend sudo in Python, making the process a lot easier.

### Conclusion

Being an open source evangelist is a very interesting and fun job, even in the COVID-19 era, which has certainly added difficulties to my work. If you have other questions about the role or have a story about how a technical evangelist or developer advocate has helped you, please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/open-source-evangelist

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/rsqrt2b)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop-stickers-team-happy_0.png?itok=G2-GcSPp (Teamwork starts with communication )
[2]: https://www.syslog-ng.com/
[3]: https://www.sudo.ws/
[4]: https://en.wikipedia.org/wiki/Balabit
[5]: https://www.oneidentity.com/
[6]: https://www.linkedin.com/in/millert/
[7]: https://twitter.com/PCzanik
[8]: https://twitter.com/sngose
[9]: https://twitter.com/SudoProject
[10]: https://www.rsaconference.com/usa/us-2020
[11]: https://www.socallinuxexpo.org/scale/18x
[12]: https://www.syslog-ng.com/community/b/blog/posts/building-blocks-of-syslog-ng
[13]: https://opensource.com/article/20/10/sudo-19
