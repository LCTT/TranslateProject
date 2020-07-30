[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 ways I contribute to open source as a Linux systems administrator)
[#]: via: (https://opensource.com/article/20/7/open-source-sysadmin)
[#]: author: (Elizabeth K. Joseph https://opensource.com/users/pleia2)

4 ways I contribute to open source as a Linux systems administrator
======
You don't have to be a coder to make valuable contributions to the open
source community; here are some other important roles you can fill as a
sysadmin.
![open source button on keyboard][1]

I recently participated in The Linux Foundation Open Source Summit North America, held virtually June 29-July 2, 2020. In the course of that event, I had the opportunity to speak with a fellow attendee about my career in Linux systems administration and how it had led me to a career focused on [open source][2]. Specifically, he asked, how does a systems administrator who doesn't do a lot of coding participate in open source projects?

That's a great question!

A lot of focus in open source projects is placed on the actual code, but there's a lot more to it than that. The following are some ways that I've been deeply involved in open source projects, without writing code.

### Improving documentation

I got my official start in open source by rewriting a quickstart guide for a project I used heavily. We spend most of our time using software in production and at scale. We routinely run into configuration gotchas and edge cases, and we often privately develop best practices for managing services effectively.

Inevitably, we run into things that aren't documented, have out of date documentation, or need improvements to the documentation to be made. This is a great opportunity! The developers and documentation writers are often unaware of these issues, and you have the key to solving them. Typically it starts with a bug report to the documentation project, but if you know the answer, you can often submit a patch to the documentation to improve it.

### Contributing "recipes"

We often spend too much time reinventing the wheel when we're launching common services. I remember my early days of slogging through MySQL configuration files to figure out the best settings for the databases for a particular customer. Today, a lot of that has been simplified, allowing us to use Ansible playbooks, Puppet modules, and more to get a basic configuration going. This is a place where you can contribute! Whether it's an official "recipe" you contribute to the appropriate hub or a sample rundown of your configuration or architecture diagram of Logstash, sharing your expertise in the form of examples can be incredibly helpful to others who are facing the same configuration challenges.

### Hosting project resources

I spent part of my career as a full-time systems administrator, directly working on hosting project resources for OpenStack, an infrastructure that is fully open source—every config file and Puppet change is done through public code review and tracked in a public Git repository. There are several projects out there that host their infrastructures in an open source manner, many of which are listed on the [Open Source Infrastructure (#openinfra) homepage][3]. These range from KDE and Debian to the Apache Software Foundation. In these communities, external participants can submit improvements to the infrastructure as their time and expertise allow. Since a lot of this is peer-reviewed, it's also a nice opportunity to build your skills in areas you may not be strictly focused on at work.

I've also done work on specific projects where the need was not broadcasted but was clear once I joined the community. For instance, one of my Linux communities needed a place to host a development website environment so we could try out new plugins and features outside of our production environment. We also found that giving shell accounts to participants was a valuable way to make sure they were always connected to IRC and had a sandbox beyond their own desktop. I now manage two virtual servers for this project to address these needs and have built up my own little systems team inside the project, so I'm not the only administrator.

### Supporting your fellow users

As someone who is using software in production, your operational experience is essential to a thriving support outlet, so don't be shy. Participation in user forums, mailing lists, and chat may seem like something that only experts can do, but regardless of your level, you will always have more experience than someone who just started out. A newcomer to the space can help out with simple questions, and give the more experienced participants the energy to answer more complicated questions. The more experience you gain, the more involved you can get in the community.

### Be a better sysadmin by contributing

Whatever way you decide to participate, the value gained from contributing to open source projects as a [systems administrator][4] cannot be understated. Your contributions will be noticed by members of the community, and often result in opportunities to chat on the latest project podcast, sit for an interview on the project blog, or speak at an event. All of these things raise your profile in the project as someone who is knowledgeable about the technology. You can also point to your public expertise when you're interviewing for your next role, having a public track record of giving advice in a project where a company is looking for expertise is a huge vote in your favor.

Finally, I've also found that participating in open source projects to be tremendously valuable on a personal level. I feel good about contributing to the community, and it's rewarding to know that your expertise is valuable to folks outside the walls of your organization.

Looking for a place to start? Find the communities behind the open source technology you already use and love. Or, if you're looking for a place to [write][5], you've found it here at Opensource.com.

You don't need to be a master coder to contribute to open source. Jade Wang shares 8 ways you can...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/open-source-sysadmin

作者：[Elizabeth K. Joseph][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pleia2
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/button_push_open_keyboard_file_organize.png?itok=KlAsk1gx (open source button on keyboard)
[2]: https://opensource.com/resources/what-open-source
[3]: https://opensourceinfra.org/
[4]: https://opensource.com/article/19/7/be-a-sysadmin
[5]: https://opensource.com/how-submit-article
