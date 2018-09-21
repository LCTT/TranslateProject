Building a Secure Ecosystem for Node.js
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/node-collective.jpg?itok=0e7Y9Iy3)

At[Node+JS Interactive][1], attendees collaborate face to face, network, and learn how to improve their skills with JS in serverless, IoT, and more. [Stephanie Evans][2], Content Manager for Back-end Web Development at LinkedIn Learning, will be speaking at the upcoming conference about building a secure ecosystem for Node.js. Here she answers a few questions about teaching and learning basic security practices.

**Linux.com: Your background is in tech education, can you provide more details on how you would define this and how you got into this area of expertise?**

**Stephanie Evans:** It sounds cliché, but I’ve always been passionate about education and helping others. After college, I started out as an instructor of a thoroughly analog skill: reading. I worked my way up to hiring and training reading teachers and discovered my passion for helping people share their knowledge and refine their teaching craft. Later, I went to work for McGraw Hill Education, publishing self-study certification books on popular IT certs like CompTIA’s Network+ and Security+, ISAAP’s CISSP, etc. My job was to figure out who the biggest audiences in IT were; what they needed to know to succeed professionally; hire the right book author; and help develop the manuscript with them.

I moved into online learning/e-learning 4 years ago and shifted to video training courses geared towards developers. I enjoy working with people who spend their time building and solving complex problems. I now manage the video training library for back-end web developers at LinkedIn Learning/Lynda.com and figure out what developers need to know; hire instructors to create that content; and work together to figure out how best to teach it to them. And, then update those courses when they inevitably become out of date.

**Linux.com: What initially drove you to use your skill set in education to help with security practices?**

**Evans:** I attend a lot of conferences, watch a lot of talks, and chat to a lot of developers as part of my job. I distinctly remember attending a security best practices talk at a very large, enterprise-tech focused conference and was surprised by the rudimentary content being covered. Poor guy, I’d thought…he’s going to get panned by this audience. But then I looked around and most everyone was engaged. They were learning something new and compelling. And it hit me: I had been in a security echo chamber of my own making. Just like the mainstream developer isn’t working with the cutting-edge technology people are raving about on Twitter, they aren’t necessarily as fluent in basic security practices as I’d assumed. A mix of unawareness, intense time pressure, and perhaps some misplaced trust can lead to a “security later” mentality. But with the global cost of cybercrime up to 6 00 billion a year from 500 billion in 2014 as well as the [exploding amount of data on the web][3]. We can’t afford to be working around security or assuming everyone knows the basics.

**Linux.com: What do you think are some common misconceptions about security with Node.js and in general with developers?**

**Evans:** I think one of the biggest misconceptions is that security awareness and practices should come “later” in a developer’s career (and later in the development cycle). Yes, your first priority is to learn that Java and JavaScript are not the same thing—that’s obviously most important. And you do have to understand how to create a form before you can understand how to prevent cross-site -scripting attacks. But helping developers understand—at all stages of their career and learning journey—what the potential vulnerabilities are and how they can be exploited needs to be a much higher priority and come earlier than we may intuitively think.

I joke with my instructors that we have to sneak in the ‘eat your vegetables’ content to our courses. Security is an exciting, complex and challenging topic, but it can feel like you’re having to eat your vegetables as a developer when you dig into it. Often ‘security’ is a separate department (that can be perceived as ‘slowing things down’ or getting in the way of deploying code) and it can further distance developers from their role in securing their applications.

I also think that those who truly understand security can feel that it’s overwhelmingly complex to teach—but we have to start somewhere. I attended an introductory npm talk last year that talked about how to work with dependencies and packages…but never once mentioned the possibility of malicious code making it into your application through these packages. I’m all about teaching just enough at the right time and not throwing the kitchen sink of knowledge at new developers. We should stop thinking of security—or even just security awareness—as an intermediate or advanced skill and start bringing it up early and often.

**Linux.com: How can we infuse tech education into our security practices? Where does this begin?**

**Evans:** It definitely goes both ways. Clear documentation and practical resources right alongside security recommendations go a long way towards ensuring understanding and adoption. You have to make things as easy as possible if you want people to actually do it. And you have to make those best practices accessible enough to understand.

The [2018 Node User Survey Report][4] from the Node.js Foundation showed that while learning resources around Node.js and JavaScript development improved, the availability and quality of learning resources for Node.js Security received the lowest scores across the board.

After documentation and Stack Overflow, many developers rely on online videos and tutorials—we need to push security education to the forefront, rather than expecting developers to seek it out. OWASP, the nodegoat project, and the Node.js Security Working Group are doing great work here to move the needle. I think tech education can do even more to bring security in earlier in the learning journey and create awareness about common exploits and important resources.

Learn more at [Node+JS Interactive][1], coming up October 10-12, 2018 in Vancouver, Canada.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/node-js/2018/9/building-secure-ecosystem-nodejs

作者：[The Linux Foundation][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/ericstephenbrown
[1]: https://events.linuxfoundation.org/events/node-js-interactive-2018/?utm_source=Linux.com&utm_medium=article&utm_campaign=jsint18
[2]: https://jsi2018.sched.com/speaker/stevans1?iframe=no
[3]: https://www.forbes.com/sites/bernardmarr/2018/05/21/how-much-data-do-we-create-every-day-the-mind-blowing-stats-everyone-should-read/#101d261a60ba
[4]: https://nodejs.org/en/user-survey-report/
