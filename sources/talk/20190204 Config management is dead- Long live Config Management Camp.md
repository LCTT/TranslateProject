[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Config management is dead: Long live Config Management Camp)
[#]: via: (https://opensource.com/article/19/2/configuration-management-camp)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

Config management is dead: Long live Config Management Camp
======

CfgMgmtCamp '19 co-organizers share their take on ops, DevOps, observability, and the rise of YoloOps and YAML engineers.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc)

Everyone goes to [FOSDEM][1] in Brussels to learn from its massive collection of talk tracks, colloquially known as developer rooms, that run the gauntlet of curiosities, covering programming languages like Rust, Go, and Python, to special topics ranging from community, to legal, to privacy. After two days of nonstop activity, many FOSDEM attendees move on to Ghent, Belgium, to join hundreds for Configuration Management Camp ([CfgMgmtCamp][2]).

Kris Buytaert and Toshaan Bharvani run the popular post-FOSDEM show centered around infrastructure management, featuring hackerspaces, training, workshops, and keynotes. It's a deeply technical exploration of the who, what, and how of building resilient infrastructure. It started in 2013 as a PuppetCamp but expanded to include more communities and tools in 2014.

I spoke with Kris and Toshaan, who both have a healthy sense of humor, about CfgMgmtCamp's past, present, and future. Our interview has been edited for length and clarity.

**Matthew: Your opening[keynote][3] is called "CfgMgmtCamp is dead." Is config management dead? Will it live on, or will something take its place?**

**Kris:** We've noticed people are jumping on the hype of containers, trying to solve the same problems in a different way. But they are still managing config, only in different ways and with other tools. Over the past couple of years, we've evolved from a conference with a focus on infrastructure-as-code tooling, such as Puppet, Chef, CFEngine, Ansible, Juju, and Salt, to a more open source infrastructure automation conference in general. So, config management is definitely not dead. Infrastructure-as-code is also not dead, but it all is evolving.

**Toshaan:** We see people changing tools, jumping on hype, and communities changing; however, the basic ideas and concepts remain the same.

**Matthew: It's great to see[observability as the topic][4] of one of your keynotes. Why should those who care about configuration management also care about monitoring and observability?**

**Kris:** While the name of the conference hasn't changed, the tools have evolved and we have expanded our horizon. Ten years ago, [Devopsdays][5] was just #devopsdays, but it evolved to focus on culture—the C of [CAMS][6] in the DevOps' core principles of Culture, Automation, Measurement, and Sharing.

![](https://opensource.com/sites/default/files/uploads/cams.png)

[Monitorama][7] filled the gap on monitoring and metrics (tackling the M in CAMS). Config Management Camp is about open source Automation, the A. Since they are all open source conferences, they fulfill the Sharing part, completing the CAMS concept.

Observability sits on the line between Automation and Measurement. To go one step further, in some of my talks about open source monitoring, I describe the evolution of monitoring tools from #monitoringsucks to #monitoringlove; for lots of people (including me), the love for monitoring returned because we tied it to automation. We started to provision a service and automatically adapted the monitoring of that service to its state. Gone were the days where the monitoring tool was out of sync with reality.

Looking at it from the other side, when you have an infrastructure or application so complex that you need observability in it, you'd better not be deploying manually; you will need some form of automation at that level of complexity. So, observability and infrastructure automation are tied together.

**Toshaan:** Yes, while in the past we focused on configuration management, we will be looking to expand that into all types of infrastructure management. Last year, we played with this idea, and we were able to have a lot of cross-tool presentations. This year, we've taken this a step further by having more differentiated content.

**Matthew: Some of my virtualization and Linux admin friends push back, saying observability is a developer's responsibility. How would you respond without just saying "DevOps?"**

**Kris:** What you describe is what I call "Ooops Devs." This is a trend where the people who run the platform don't really care what they run; as long as port 80 is listening and the node pings, they are happy. It's equally bad as "Dev Ooops." "Ooops Devs" is where the devs rant about the ops folks because they are slow, not agile, and not responsive. But, to me, your job as an ops person or as a Linux admin is to keep a service running, and the only way to do that is to take on that task is as a team—with your colleagues who have different roles and insights, people who write code, people who design, etc. It is a shared responsibility. And hiding behind "that is someone else's responsibility," doesn't smell like collaboration going on.

**Toshaan:** Even in the dark ages of silos, I believe a true sysadmin should have cared about observability, monitoring, and automation. I believe that the DevOps movement has made this much more widespread, and that it has become easier to get this information and expose it. On the other hand, I believe that pure operators or sysadmins have learned to be team players (or, they may have died out). I like the analogy of an army unit composed of different specialty soldiers who work together to complete a mission; we have engineers who work to deliver products or services.

**Matthew: In a[Devopsdays Zurich talk][8], Kris offered an opinion that Americans build software for acquisition and Europeans build for resilience. In that light, what are the best skills for someone who wants to build meaningful infrastructure?**

**Toshaan:** I believe still some people don't understand the complexity of code sprawl, and they believe that some new hype will solve this magically.

**Kris:** This year, we invited [Steve Traugott][9], co-author of the 1998 USENIX paper "[Bootstrapping an Infrastructure][10]" that helped kickstart our community. So many people never read [Infrastructures.org][11], never experienced the pain of building images and image sprawl, and don't understand the evolution we went through that led us to build things the way we build them from source code.

People should study topics such as idempotence, resilience, reproducibility, and surviving the tenth floor test. (As explained in "Bootstrapping an Infrastructure": "The test we used when designing infrastructures was 'Can I grab a random machine and throw it out the tenth-floor window without adversely impacting users for more than 10 minutes?' If the answer to this was 'yes,' then we knew we were doing things right.") But only after they understand the service they are building—the service is the absolute priority—can they begin working on things like: how can we run this, how can we make sure it keeps running, how can it fail and how can we prevent that, and if it disappears, how can we spin it up again fast, unnoticed by the end user.

**Toshaan:** 100% uptime.

**Kris:** The challenge we have is that lots of people don't have that experience yet. We've seen the rise of [YoloOps][12]—just spin it up once, fire, and forget—which results in security problems, stability problems, data loss, etc., and they often grasp onto the solutions in YoloOps, the easy way to do something quickly and move on. But understanding how things will eventually fail takes time, it's called experience.

**Toshaan:** Well, when I was a student and manned the CentOS stand at FOSDEM, I remember a guy coming up to the stand and complaining that he couldn't do consulting because of the "fire once and forgot" policy of CentOS, and that it just worked too well. I like to call this ZombieOps, but YoloOps works also.

**Matthew: I see you're leading the second year of YamlCamp as well. Why does a markup language need its own camp?**

**Kris:** [YamlCamp][13] is a parody, it's a joke. Last year, Bob Walker ([@rjw1][14]) gave a talk titled "Are we all YAML engineers now?" that led to more jokes. We've had a discussion for years about rebranding CfgMgmtCamp; the problem is that people know our name, we have a large enough audience to keep going, and changing the name would mean effort spent on logos, website, DNS, etc. We won't change the name, but we joked that we could rebrand to YamlCamp, because for some weird reason, a lot of the talks are about YAML. :)

**Matthew: Do you think systems engineers should list YAML as a skill or a language on their CV? Should companies be hiring YAML engineers, or do you have "Long live all YAML engineers" on the website in jest?**

**Toshaan:** Well, the real question is whether people are willing to call themselves YAML engineers proudly, because we already have enough DevOps engineers.

**Matthew: What FOSS software helps you manage the event?**

**Toshaan:** I re-did the website in Hugo CMS because we were spending too much time maintaining the website manually. I chose Hugo, because I was learning Golang, and because it has been successfully used for other conferences and my own website. I also wanted a static website and iCalendar output, so we could use calendar tooling such as Giggity to have a good scheduling tool.

The website now builds quite nicely, and while I still have some ideas on improvements, maintenance is now much easier.

For the call for proposals (CFP), we now use [OpenCFP][15]. We want to optimize the submission, voting, selection, and extraction to be as automated as possible, while being easy and comfortable for potential speakers, reviewers, and ourselves to use. OpenCFP seems to be the tool that works; while we still have some feature requirements, I believe that, once we have some time to contribute back to OpenCFP, we'll have a fully functional and easy tool to run CFPs with.

Last, we switched from EventBrite to Pretix because I wanted to be GDPR compliant and have the ability to run our questions, vouchers, and extra features. Pretix allows us to control registration of attendees, speakers, sponsors, and organizers and have a single overview of all the people coming to the event.

### Wrapping up

The beauty of Configuration Management Camp to me is that it continues to evolve with its audience. Configuration management is certainly at the heart of the work, but it's in service to resilient infrastructure. Keep your eyes open for the talk recordings to learn from the [line up of incredible speakers][16], and thank you to the team for running this (free) show!

You can follow Kris [@KrisBuytaert][17] and Toshaan [@toshywoshy][18]. You can also see Kris' past articles [on his blog][19].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/configuration-management-camp

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://fosdem.org/2019/
[2]: https://cfgmgmtcamp.eu/
[3]: https://cfgmgmtcamp.eu/schedule/monday/intro00/
[4]: https://cfgmgmtcamp.eu/schedule/monday/keynote0/
[5]: https://www.devopsdays.org/
[6]: http://devopsdictionary.com/wiki/CAMS
[7]: http://monitorama.com/
[8]: https://vimeo.com/272519813
[9]: https://cfgmgmtcamp.eu/schedule/tuesday/keynote1/
[10]: http://www.infrastructures.org/papers/bootstrap/bootstrap.html
[11]: http://www.infrastructures.org/
[12]: https://gist.githubusercontent.com/mariozig/5025613/raw/yolo
[13]: https://twitter.com/yamlcamp
[14]: https://twitter.com/rjw1
[15]: https://github.com/opencfp/opencfp
[16]: https://cfgmgmtcamp.eu/speaker/
[17]: https://twitter.com/KrisBuytaert
[18]: https://twitter.com/toshywoshy
[19]: https://krisbuytaert.be/index.shtml
