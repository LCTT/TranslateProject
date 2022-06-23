[#]: subject: "Interview with Shuah Khan, Kernel Maintainer & Linux Fellow"
[#]: via: "https://www.linux.com/news/interview-with-shuah-khan-kernel-maintainer-linux-fellow/"
[#]: author: "The Linux Foundation https://www.linuxfoundation.org/en/blog/interview-with-shuah-khan-kernel-maintainer-linux-fellow/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Interview with Shuah Khan, Kernel Maintainer & Linux Fellow
======
Jason Perlow, Director of Project Insights and Editorial Content at the Linux Foundation, had an opportunity to speak with Shuah Khan about her experiences as a woman in the technology industry. She discusses how mentorship can improve the overall diversity and makeup of open source projects, why software maintainers are important for the health of open source projects such as the Linux kernel, and how language inclusivity and codes of conduct can improve relationships and communication between software maintainers and individual contributors.

**JP:** So, Shuah, I know you wear many different hats at the Linux Foundation. What do you call yourself around here these days?

**SK:** <laughs> Well, I primarily call myself a Kernel Maintainer & Linux Fellow. In addition to that, I focus on two areas that are important to the continued health and sustainability of the open source projects in the Linux ecosystem. The first one is bringing more women into the Kernel community, and additionally, I am leading the mentorship program efforts overall at the Linux Foundation. And in that role, in addition to the Linux Kernel Mentorship, we are looking at how the Linux Foundation mentorship program is working overall, how it is scaling. I make sure the [LFX Mentorship][1] platform scales and serves diverse mentees and mentors’ needs in this role.

The LF mentorships program includes several projects in the Linux kernel, LFN, HyperLedger, Open MainFrame, OpenHPC, and other technologies. [The Linux Foundation’s Mentorship Programs][2] are designed to help developers with the necessary skills–many of whom are first-time open source contributors–experiment, learn, and contribute effectively to open source communities.

The mentorship program has been successful in its mission to train new developers and make these talented pools of prospective employees trained by experts to employers. Several graduated mentees have found jobs. New developers have improved the quality and security of various open source projects, including the Linux kernel. Several Linux kernel bugs were fixed, a new subsystem mentor was added, and a new driver maintainer is now part of the Linux kernel community. My sincere thanks to all our mentors for volunteering to share their expertise.

**JP:** How long have you been working on the Kernel?

**SK:** Since 2010, or 2011, I got involved in the [Android Mainlining project][3]. My [first patch removed the Android pmem driver][4].

**JP:** Wow! Is there any particular subsystem that you specialize in?

**SK:** I am a self described generalist. I maintain the [kernel self-test][5] subsystem, the [USB over IP driver][6], [usbip tool][7], and the [cpupower][8] tool. I contributed to the media subsystem working on [Media Controller Device Allocator API][9] to resolve shared device resource management problems across device drivers from different subsystems.

**JP:** Hey, I’ve [actually used the USB over IP driver][10] when I worked at Microsoft on Azure. And also, when I’ve used AWS and Google Compute.

**SK:** It’s a small niche driver used in cloud computing. Docker and other containers use that driver heavily. That’s how they provide remote access to USB devices on the server to export devices to be imported by other systems for use.

**JP:** I initially used it for IoT kinds of stuff in the embedded systems space. Were you the original lead developer on it, or was it one of those things you fell into because nobody else was maintaining it?

**SK:** Well, twofold. I was looking at USB over IP because I like that technology. it just so happened the driver was brought from the staging tree into the Mainline kernel, I volunteered at the time to maintain it. Over the last few years, we discovered some security issues with it, because it handles a lot of userspace data, so I had a lot of fun fixing all of those. <laugh>.

**JP:** What drew you into the Linux operating system, and what drew you into the kernel development community in the first place?

**SK:** Well, I have been doing kernel development for a very long time. I worked on the [LynxOS RTOS][11], a while back, and then HP/UX, when I was working at HP, after which I transitioned into  doing open source development — the [OpenHPI][12] project, to support HP’s rack server hardware, and that allowed me to work much more closely with Linux on the back end. And at some point, I decided I wanted to work with the kernel and become part of the Linux kernel community. I started as an independent contributor.

**JP:** Maybe it just displays my own ignorance, but you are the first female, hardcore Linux kernel developer I have ever met. I mean, I had met female core OS developers before — such as when I was at Microsoft and IBM — but not for Linux. Why do you suppose we lack women and diversity in general when participating in open source and the technology industry overall?

**SK:** So I’ll answer this question from my perspective, from what I have seen and experienced, over the years. You are right; you probably don’t come across that many hardcore women Kernel developers. I’ve been working professionally in this industry since the early 1990s, and on every project I have been involved with, I am usually the only woman sitting at the table. Some of it, I think, is culture and society. There are some roles that we are told are acceptable to women — even me, when I was thinking about going into engineering as a profession. Some of it has to do with where we are guided, as a natural path.

There’s a natural resistance to choosing certain professions that you have to overcome first within yourself and externally. This process is different for everybody based on their personality and their origin story. And once you go through the hurdle of getting your engineering degree and figuring out which industry you want to work in, there is a level of establishing credibility in those work environments you have to endure and persevere. Sometimes when I would walk into a room, I felt like people were looking at me and thinking, “why is she here?” You aren’t accepted right away, and you have to overcome that as well. You have to go in there and say, “I am here because I want to be here, and therefore, I belong here.” You have to have that mindset. Society sends you signals that “this profession is not for me” — and you have to be aware of that and resist it. I consider myself an engineer that happens to be a woman as opposed to a woman engineer.

**JP:** Are you from India, originally?

**SK:** Yes.

**JP:** It’s funny; my wife really likes this [Netflix show about matchmaking in India][13]. Are you familiar with it?

**SK:** <laughs> Yes I enjoyed the series, and [A Suitable Girl][14] documentary film that follows three women as they navigate making decisions about their careers and family obligations.

**JP:** For many Americans, this is our first introduction to what home life is like for Indian people. But many of the women featured on this show are professionals, such as doctors, lawyers, and engineers. And they are very ambitious, but of course, the family tries to set them up in a marriage to find a husband for them that is compatible. As a result, you get to learn about the traditional values and roles they still want women to play there — while at the same time, many women are coming out of higher learning institutions in that country that are seeking technical careers.

**SK:** India is a very fascinatingly complex place. But generally speaking, in a global sense, having an environment at home where your parents tell you that you may choose any profession you want to choose is very encouraging. I was extremely fortunate to have parents like that. They never said to me that there was a role or a mold that I needed to fit into. They have always told me, “do what you want to do.” Which is different; I don’t find that even here, in the US. Having that support system, beginning in the home to tell you, “you are open to whatever profession you want to choose,” is essential. That’s where a lot of the change has to come from.

**JP:** Women in technical and STEM professions are becoming much more prominent in other countries, such as China, Japan, and Korea. For some reason, in the US, I tend to see more women enter the medical profession than hard technology — and it might be a level of effort and perceived reward thing. You can spend eight years becoming a medical doctor or eight years becoming a scientist or an engineer, and it can be equally difficult, but the compensation at the end may not be the same. It’s expensive to get an education, and it takes a long time and hard work, regardless of the professional discipline.

**SK:** I have also heard that women also like to enter professions where they can make a difference in the world — a human touch, if you will. So that may translate to them choosing careers where they can make a larger impact on people — and they may view careers in technology as not having those same attributes. Maybe when we think about attracting women to technology fields, we might have to promote technology aspects that make a difference. That may be changing now, such as the [LF Public Health][15] (LFPH) project we kicked off last year. And with [LF AI & Data Foundation][16], we are also making a difference in people’s lives, such as [detecting earthquakes][17] or [analyzing climate change][18]. If we were to promote projects such as these, we might draw more women in.

**JP:** So clearly, one of the areas of technology where you can make a difference is in open source, as the LF is hosting some very high-concept and existential types of projects such as [LF Energy][19], for example — I had no idea what was involved in it and what its goals were until I spoke to [Shuli Goodman][20] in-depth about it. With the mentorship program, I assume we need this to attract fresh talent — because as folks like us get older and retire, and they exit the field, we need new people to replace them. So I assume mentorship, for the Linux Foundation, is an investment in our own technologies, correct?

**SK:** Correct. Bringing in new developers into the fold is the primary purpose, of course — and at the same time, I view the LF as taking on mentorship provides that neutral, level playing field across the industry for all open source projects. Secondly, we offer a self-service platform, [LFX Mentorship][21], where anyone can come in and start their project. So when the COVID-19 pandemic began, we [expanded this program to help displaced people][22] — students, et cetera, and less visible projects. Not all projects typically get as much funding or attention as others do — such as a Kubernetes or  Linux kernel — among the COVID mentorship program projects we are funding. I am particularly proud of supporting a climate change-related project, [Using Machine Learning to Predict Deforestation][23].

The self-service approach allows us to fund and add new developers to projects where they are needed. The LF mentorships are remote work opportunities that are accessible to developers around the globe. We see people sign up for mentorship projects from places we haven’t seen before, such as Africa, and so on, thus creating a level playing field.

The other thing that we are trying to increase focus on is how do you get maintainers? Getting new developers is a starting point, but how do we get them to continue working on the projects they are mentored on? As you said, someday, you and I and others working on these things are going to retire, maybe five or ten years from now. This is a harder problem to solve than training and adding new developers to the project itself.

**JP:** And that is core to our [software supply chain security mission][24]. It’s one thing to have this new, flashy project, and then all these developers say, “oh wow, this is cool, I want to join that,” but then, you have to have a certain number of people maintaining it for it to have long-term viability. As we learned in our [FOSS study with Harvard][25], there are components in the Linux operating system that are like this. Perhaps even modules within the kernel itself, I assume that maybe you might have only one or two people actively maintaining it for many years. And what happens if that person dies or can no longer work? What happens to that code? And if someone isn’t familiar with that code, it might become abandoned. That’s a serious problem in open source right now, isn’t it?

**SK:** Right. We have seen that with SSH and other security-critical areas. What if you don’t have the bandwidth to fix it? Or the money to fix it? I ended up volunteering to maintain a tool for a similar reason when the maintainer could no longer contribute regularly. It is true; we have many drivers where maintainer bandwidth is an issue in the kernel. So the question is, how do we grow that talent pool?

**JP:** Do we need a job board or something? We need X number of maintainers. So should we say, “Hey, we know you want to join the kernel project as a contributor, and we have other people working on this thing, but we really need your help working on something else, and if you do a good job, we know tons of companies willing to hire developers just like you?”

**SK:** With the kernel, we are talking about organic growth; it is just like any other open source project. It’s not a traditional hire and talent placement scenario. Organically they have to have credibility, and they have to acquire it through experience and relationships with people on those projects. We just talked about it at the previous [Linux Plumbers Conference][26], we do have areas where we really need maintainers, and the [MAINTAINERS][27] file does show areas where they need help.

To answer your question, it’s not one of those things where we can seek people to fill that role, like LinkedIn or one of the other job sites. It has to be an organic fulfillment of that role, so the mentorship program is essential in creating those relationships. It is the double-edged sword of open source; it is both the strength and weakness. People need to have an interest in becoming a maintainer and also a commitment to being one, long term.

**JP:** So, what do you see as the future of your mentorship and diversity efforts at the Linux Foundation? What are you particularly excited about that is forthcoming that you are working on?

**SK:** I view the Linux Foundation mentoring as a three-pronged approach to provide unstructured webinars, training courses, and structured mentoring programs. All of these efforts combine to advance a diverse, healthy, and vibrant open source community. So over the past several months, we have been morphing our speed mentorship style format into an expanded webinar format — the [LF Live Mentorship series][28]. This will have the function of growing our next level of expertise. As a complement to our traditional mentorship programs, these are webinars and courses that are an hour and a half long that we hold a few times a month that tackle specific technical areas in software development. So it might cover how to write great commit logs, for example, for your patches to be accepted, or how to find bugs in C code. Commit logs are one of those things that are important to code maintenance, so promoting good documentation is a beneficial thing. Webinars provide a way for experts short on time to share their knowledge with a few hours of time commitment and offer a self-paced learning opportunity to new developers.

Additionally, I have started the [Linux Kernel Mentorship forum][29] for developers and their mentors to connect and interact with others participating in the Linux Kernel Mentorship program and graduated mentees to mentor new developers. We kicked off [Linux Kernel mentorship Spring 2021][30] and are planning for Summer and Fall.

A big challenge is we are short on mentors to be able to scale the structured program. Solving the problem requires help from LF member companies and others to encourage their employees to mentor, “it takes a village,” they say.

**JP:** So this webinar series and the expanded mentorship program will help developers cultivate both hard and soft skills, then.

**SK:** Correct. The thing about doing webinars is that if we are talking about this from a diversity perspective, they might not have time for a full-length mentorship, typically like a three-month or six-month commitment. This might help them expand their resources for self-study. When we ask for developers’ feedback about what else they need to learn new skill sets, we hear that they don’t have resources, don’t have time to do self-study, and learn to become open source developers and software maintainers. This webinar series covers general open source software topics such as the Linux kernel and legal issues. It could also cover topics specific to other LF projects such as CNCF, Hyperledger, LF Networking, etc.

**JP:** Anything else we should know about the mentorship program in 2021?

**SK:** In my view,  attracting diversity and new people is two-fold. One of the things we are working on is inclusive language. Now, we’re not talking about curbing harsh words, although that is a component of what we are looking at. The English you and I use in North America isn’t the same English used elsewhere. As an example, when we use North American-centric terms in our email communications, such as when a maintainer is communicating on a list with people from South Korea, something like “where the rubber meets the road” may not make sense to them at all. So we have to be aware of that.

**JP:** I know that you are serving on the [Linux kernel Code of Conduct Committee][31] and actively developing the handbook. When I first joined the Linux Foundation, I learned what the Community Managers do and our governance model. I didn’t realize that we even needed to have codes of conduct for open source projects. I have been covering open source for 25 years, but I come out of the corporate world, such as IBM and Microsoft. Codes of Conduct are typically things that the Human Resources officer shows you during your initial onboarding, as part of reviewing your employee manual. You are expected to follow those rules as a condition of employment.

So why do we need Codes of Conduct in an open source project? Is it because these are people who are coming from all sorts of different backgrounds, companies, and ways of life, and may not have interacted in this form of organized and distributed project before? Or is it about personalities, people interacting with each other over long distance, and email, which creates situations that may arise due to that separation?

**SK:** Yes, I come out of the corporate world as well, and of course, we had to practice those codes of conduct in that setting. But conduct situations arise that you have to deal with in the corporate world. There are always interpersonal scenarios that can be difficult or challenging to work with — the corporate world isn’t better than the open source world in that respect. It is just that all of that happens behind a closed setting.

But there is no accountability in the open source world because everyone participates out of their own free will. So on a small, traditional closed project, inside the corporate world, where you might have 20 people involved, you might get one or two people that could be difficult to work with. The same thing happens and is multiplied many times in the open source community, where you have hundreds of thousands of developers working across many different open source projects.

The biggest problem with these types of projects when you encounter situations such as this is dealing with participation in public forums. In the corporate world, this can be addressed in private. But on a public mailing list, if you are being put down or talked down to, it can be extremely humiliating.

These interactions are not always extreme cases; they could be simple as a maintainer or a lead developer providing negative feedback — so how do you give it? It has to be done constructively. And that is true for all of us.

**JP:** Anything else?

**SK:** In addition to bringing our learnings and applying this to the kernel project, I am also doing this on the [ELISA][32] project, where I chair the Technical Steering Committee, where I am bridging communication between experts from the kernel and the safety communities. To make sure we can use the kernel the best ways in safety-critical applications, in the automotive and medical industry, and so on. Many lessons can be learned in terms of connecting the dots, defining clearly what is essential to make Linux run effectively in these environments, in terms of dependability. How can we think more proactively instead of being engaged in fire-fighting in terms of security or kernel bugs? As a result of this, I am also working on any necessary kernel changes needed to support these safety-critical usage scenarios.

**JP:** Before we go, what are you passionate about besides all this software stuff? If you have any free time left, what else do you enjoy doing?

**SK:** I read a lot. COVID quarantine has given me plenty of opportunities to read. I like to go hiking, snowshoeing, and other outdoor activities. Living in Colorado gives me ample opportunities to be in nature. I also like backpacking — while I wasn’t able to do it last year because of COVID — I like to take backpacking trips with my son. I also love to go to conferences and travel, so I am looking forward to doing that again as soon as we are able.

Talking about backpacking reminded me of the two-day, 22-mile backpacking trip during the summer of 2019 with my son. You can see me in the picture above at the end of the road, carrying a bearbox, sleeping bag, and hammock. It was worth injuring my foot and hurting in places I didn’t even know I had.

**JP:** Awesome. I enjoyed talking to you today. So happy I finally got to meet you virtually.

The post [Interview with Shuah Khan, Kernel Maintainer & Linux Fellow][33] appeared first on [Linux Foundation][34].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/interview-with-shuah-khan-kernel-maintainer-linux-fellow/

作者：[The Linux Foundation][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxfoundation.org/en/blog/interview-with-shuah-khan-kernel-maintainer-linux-fellow/
[b]: https://github.com/lkxed
[1]: https://lfx.linuxfoundation.org/tools/mentorship/
[2]: https://linuxfoundation.org/about/diversity-inclusivity/mentorship/
[3]: https://elinux.org/Android_Mainlining_Project
[4]: https://lkml.org/lkml/2012/1/26/368
[5]: https://www.kernel.org/doc/html/v4.15/dev-tools/kselftest.html
[6]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/usbip
[7]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/usb/usbip
[8]: https://www.systutorials.com/docs/linux/man/1-cpupower/
[9]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/mc/mc-dev-allocator.c
[10]: https://www.linux-magazine.com/Issues/2018/208/Tutorial-USB-IP
[11]: https://en.wikipedia.org/wiki/LynxOS
[12]: http://www.openhpi.org/Developers
[13]: https://www.netflix.com/title/80244565
[14]: https://en.wikipedia.org/wiki/A_Suitable_Girl_(film)
[15]: https://www.lfph.io/
[16]: https://lfaidata.foundation/
[17]: https://openeew.com/
[18]: https://www.os-climate.org/
[19]: https://www.lfenergy.org/
[20]: https://www.linux.com/mailto:sgoodman@contractor.linuxfoundation.org
[21]: https://mentorship.lfx.linuxfoundation.org/
[22]: https://linuxfoundation.org/about/diversity-inclusivity/mentorship/
[23]: https://mentorship.lfx.linuxfoundation.org/project/926665ac-9b96-45aa-bb11-5d99096be870
[24]: https://www.linuxfoundation.org/en/blog/preventing-supply-chain-attacks-like-solarwinds/
[25]: https://www.linuxfoundation.org/en/press-release/new-open-source-contributor-report-from-linux-foundation-and-harvard-identifies-motivations-and-opportunities-for-improving-software-security/
[26]: https://www.linuxplumbersconf.org/
[27]: https://www.kernel.org/doc/linux/MAINTAINERS
[28]: https://events.linuxfoundation.org/lf-live-mentorship-series/
[29]: https://forum.linuxfoundation.org/categories/lfx-mentorship-linux-kernel
[30]: https://forum.linuxfoundation.org/discussion/858202/linux-kernel-mentorship-spring-projects-are-now-accepting-applications#latest
[31]: https://www.kernel.org/code-of-conduct.html
[32]: https://elisa.tech/
[33]: https://www.linuxfoundation.org/en/blog/interview-with-shuah-khan-kernel-maintainer-linux-fellow/
[34]: https://www.linuxfoundation.org/
