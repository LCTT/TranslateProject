[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Ansible got started and grew)
[#]: via: (https://opensource.com/article/21/2/ansible-origin-story)
[#]: author: (Ben Rometsch https://opensource.com/users/flagsmith)

How Ansible got started and grew
======
Ansible's founder Michael DeHaan shares how his background led him to
develop the IT automation software.
![gears and lightbulb to represent innovation][1]

Recently, Flagsmith founder Ben Rometsch [spoke to Michael DeHaan][2], founder of open source IT automation software Ansible (now part of IBM/Red Hat), on [The Craft of Open Source podcast][3] about how he developed Ansible and what he's been doing since.

> "If people aren't successful trying (your app/tool) out in about 30 minutes, they're going to move on. You have to make somebody successful within their lunch hour. I spent a lot of time thinking about the documentation."
>  —Michael DeHaan

His remarks were fascinating and enlightening, especially for anyone interested in open source software as a developer, creator, or community member. Read on for a summary of the conversation.

### How Michael started in open source

When Michael joined Red Hat's emerging technologies team in 2005, it was the beginning of his journey with open source projects. The team gave him carte blanche to work on any projects he wanted, as long as they helped customers.

At the time, Xen and KVM were becoming available, and the team wanted to create a good solution to automate a PXE bare-metal infrastructure. Michael created his first open source project, [Cobbler][4], to automate those installs, and it became fairly widely used.

Func was Michael's next open source project. It came from filling in the gaps between software that enabled bare-metal provisioning and configuration management tools. Func became fairly well deployed, with Fedora using it in some of its infrastructure. Some of Func's concepts and ideas later influenced Ansible.

### The birth of Ansible

Ansible came after Michael spent a short spell working for Puppet. Afterward, he worked for another company that was trying to create an integration, but the job wasn't a good fit, and he wanted to return to working on a project in the open source community.

Frustrated that it still took several days (or longer) to get a setup working due to [DNS][5] and [NTP][6] problems, Michael decided to create an open source solution to automate installations. The idea was to build something SSH- and push-based, without a load of management agents.

[Ansible][7] was the result of this design goal. It provided an easy, quick solution, rather than spending hours or days using tools like Chef and Puppet. At the time, companies were employing full-time teams of people to manage cloud installations and configurations. Ansible provided a solution that one person could employ in less than one day.

### Ansible: The right tool for the right time

Part of Ansible's success was due to timing, Michael says. There was a demand for greater cloud integration and a quick, convenient way to upload content and install apps on cloud systems.

It would be difficult for a full-time developer to have the time to create something like Ansible in today's world, as things are much more highly scheduled. He says people expect a complete product, not a work in progress with a supportive user community that has the time to experiment and play with a new coding language. Times have changed.

Also, Ansible was released in 2012, when the demand for [automation was growing][8] more rapidly than now. While some companies have mastered the art of automation and are focusing more on Kubernetes and other things, others continue to discover it. Most companies do their own programming now, with teams of developers creating fully polished solutions. These days, people are using React and Kubernetes, which build on dependencies, rather than starting from scratch on an open source project.

With Ansible, most of the open source work was in the libraries and the packaging. Michael remembers that they were learning as they went along, initially unsure of how to run a systems-management project in a way that gets lots of feedback from people and can evolve. Puppet and Chef provided a template for how to accomplish this, mostly through trial and error. Michael set up a large number of IRC channel conversations, which allowed direct communication with various use cases.

Ansible's documentation was key for developers taking it to the next level. It was simple, to the point, used short and persuasive sentences, and included free trial offers. The documentation made it clear to users that Ansible could be run on their own infrastructure without security concerns.

### Marketing and promotion

The buzz around Ansible was generated mainly through blog posts, articles, tutorials, and opinions shared on social media. Occasionally, it would break through onto the pages of Hacker News, or a Reddit thread would become popular. 

Michael focused on creating shareworthy content that people could link to. He also made sure that he read every comment and tweet to gain as much feedback as possible to take the project in the right direction.

As momentum grew, Michael hired some employees to help him scale up, but he retained creative control and overall project management. When Michael left the Ansible team in 2015, there were around 400 modules, which made management pretty tricky.

### Life after Ansible

Michael now works mainly on Django and Python software development, with some apps and projects on the side, including the [WARP][9] music sequencer.

To discover more about Ansible and Michael's views on today's open source landscape, burnout, GitHub, Google Reader, and much more, [check out the full podcast][2].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/ansible-origin-story

作者：[Ben Rometsch][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/flagsmith
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M (gears and lightbulb to represent innovation)
[2]: https://www.flagsmith.com/podcast/03-ansible
[3]: https://www.flagsmith.com/podcast
[4]: https://en.wikipedia.org/wiki/Cobbler_(software)
[5]: https://en.wikipedia.org/wiki/Domain_Name_System
[6]: https://en.wikipedia.org/wiki/Network_Time_Protocol
[7]: https://www.ansible.com/
[8]: https://www.redhat.com/en/blog/new-report-finds-automation-paves-way-business-and-technical-benefits-alike
[9]: https://warpseq.com/
