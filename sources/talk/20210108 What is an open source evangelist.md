[#]: collector: (lujun9972)
[#]: translator: (rsqrt2b)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is an open source evangelist?)
[#]: via: (https://opensource.com/article/21/1/open-source-evangelist)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)

What is an open source evangelist?
======
Learn what it takes to be a bridge between a product's users and its
developers.
![Teamwork starts with communication][1]

When people learn that I work as an open source evangelist (focusing on [syslog-ng][2] and [sudo][3]), they often ask me what it's like to represent such well-known names in the Linux world. My short answer: It's good!

I am part of research and development, so it is never boring. I feel that I make an impact when people implement what they learn from me and when the feedback I collect from users influences the development of the product.

### What is an evangelist?

I define an evangelist as a bridge between a software's (or other product's) users and its developers. It is not just about sharing good news with users but also collecting feedback from them.

Evangelists come from a wide range of backgrounds. Some people have a marketing background with a strong interest in technology. Some are developers who like talking to users. I belong to a third group, "power users," or people with in-depth knowledge about a software product from the user's point of view.

In my job, I work with many, many users. The syslog-ng user base is enormous. It is available on most Linux distributions and BSD variants. Hundreds of millions of devices run syslog-ng, including both the BMW i3 and the Kindle. Most BSD-based appliances, like FreeNAS, run syslog-ng for logging, as do Linux-based network-attached storages (NAS) devices from Synology and QNAP. I would not be surprised to learn that syslog-ng is running somewhere in space.

Most Linux and Unix users use sudo since it is installed on almost every Linux machine out there. Its community is huge, with tens of millions of people. People often ask me how I cope with these large numbers of users, but it is not difficult.

### How I became an evangelist

My journey to becoming an evangelist was an evolutionary process that spanned nearly 20 years. It started many years ago while I was teaching at a university. My next step was working with POWER/PowerPC Linux users and developers. Finally, I started to cover syslog-ng in my job at [Balabit][4] and later began working with sudo.

My first job at Balabit was to help Linux distributions update the syslog-ng package to the latest upstream version. As I learned more and more about syslog-ng's details, I was asked to help its users. A year later, I was giving talks about syslog-ng at Hungarian and international conferences. Soon after, the feedback I collected from users started to make an impact on product development.

Eight years later, in 2018, Balabit was acquired by [One Identity][5], and [Todd Miller][6], sudo's maintainer, became my colleague. Until then, I knew only some basic sudo features, but I became more interested in sudo and learning about its advanced features. Soon, I was also evangelizing sudo and evolving from a syslog-ng evangelist into a more generic open source evangelist.

### Four pillars of technical evangelism

Technical evangelists do many things that can be broadly divided into four categories: developer, support, technical product marketing, and product management. I'll look at each of these four pillars of technical evangelism in more detail.

#### Developer

I am not a developer, but I do many things that developers do, such as packaging syslog-ng for various Linux distributions and FreeBSD, doing lots of testing, integrating syslog-ng with other software, and testing it on exotic platforms. The developer tasks I do help the community and helps me understand its needs better.

#### Support

Following bug trackers, watching the syslog-ng keyword in Google Alerts and Twitter, and reading the mailing list enable me to help our user base better. By helping our users, I also understand their problems better.

#### Technical product marketing

I really do not like the term "marketing," but writing blogs and talking at conferences *is *marketing. As a former sysadmin, I know my audience, and we have a common voice. Along with my own Twitter handle, [@PCzanik][7], I also post under the [@sngOSE][8] (syslog-ng open source edition) and [@SudoProject][9] (sudo) handles.

Twitter is a fantastic platform to collect and share technical news. Marketing is the most visible part of my work as an evangelist, even if it is just one aspect of my job.

  * **Event survival tips for introverts: **When people learn that I am doing this job even though I am an introvert, they often ask me how I do it. Giving a talk or working at a conference booth all day long can be difficult; there are too many people, too much noise. Here are my survival tips for events:
    * Focus on the results. Events are the best opportunity to collect feedback from users. After your talk, you can have good discussions anywhere, even at the booth or in the hallway. Users give a lot of feedback in real life at events, and remembering their comments helps a lot.
    * Keep in mind when the event is over. Knowing that you have to stay only one more hour in an environment with a high level of noise helps a lot.
    * Enjoy that you get to talk to like-minded people who have the same shyness, insecurity, and technical interests as you have.
  * **Marketing tips during a pandemic: **Many people have asked me how COVID-19 has affected my work since I haven't been able to travel since March 2020. I came back from talking at the [RSA Conference][10] and [Southern California Linux Expo][11] just two days before flights were suspended and borders were closed. Even though all conferences are virtual right now, I can still give talks about sudo and syslog-ng. But this means feedback is missing or minimal—there is no hallway track to meet users nor a dinner for speakers to discuss the latest and greatest technologies. Participation and attention are also less focused, as there are plenty of distractions when people are working from home. I have seen many different efforts to work around this situation. Each has its own drawbacks and advantages:
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
译者：[译者ID](https://github.com/译者ID)
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
