[#]: subject: "Why we built an open source testing framework"
[#]: via: "https://opensource.com/article/22/1/open-source-testing-framework"
[#]: author: "Toni Freger https://opensource.com/users/toni-freger"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why we built an open source testing framework
======
Building software and participating in an open source community was and
continues to be a fun, educational, and fulfilling experience.
![Teamwork starts with communication][1]

If you've ever wanted to join an open source community and contribute or start an open source project of your own, then read on to find out about our fun and awesome open source project we created from scratch at Red Hat. I'm a Software Quality Engineering Manager in the OpenStack Networking group, and together with a team of engineers both from my team and from R&amp;D, we collaborated to create the Tobiko open source testing framework.

Sometimes, you just have to start a new open source project.

Our starting point was good. We already had an official open source testing framework called [Tempest][2], which strived for complete coverage of the OpenStack API and common scenarios that simulate a working cloud.

The OpenStack teams I work with frequently build new tests and execute them against various cloud configurations, with the help of Continuous Integration open source systems—[Jenkins][3] for downstream and [Zuul][4] for upstream.

But OpenStack cloud is seeing massive adoption by the telco and enterprise industries. We were experiencing rapid growth in complexity, which meant more tests scenarios, and we were discovering that our old tooling just wasn't a great fit anymore.

### Define the challenge, define the needs

We recognized quickly that the first fundamental step was to define our customers' new needs. This required us to research the issues reported to us by the customers. We reviewed the database of bugs from the field, split all issues into several sections, and analyzed the data.

The next step was to review existing projects. It stands to reason that adopting an existing project should go faster than inventing a new project from scratch. And yet, we hadn't found a suitable tool for our needs, nor had we found any open source tools we could easily adapt.

### How it happened

That's when we realized it.

It was time to move forward with shaping and designing a new project.

We didn't want to make this move without serious thought and diverse input. So we chose to use the [Open Decision Framework][5] (ODF).** **The main benefit of this methodology is to get as much feedback as possible in the early stages of project development, which helped us save a lot of time later.

After a few meetings, during which we had productive brainstorming sessions, we first drafted some positive and negative feedback we wanted to give serious consideration to.

We iterated. We took our discussions and feedback seriously, and we worked hard to come to a resolution.

Finally, we felt ready to move to the implementation phase.

We started by gathering a group of people who had the time, the abilities, and perhaps most importantly, the passion for driving the project according to the decisions we'd reached during planning. Once the project started to take shape, more and more contributors reached out to the team to consider it for their new framework. 

It seems so fast when it's written down in just a few paragraphs, but this process was deliberate, and we treated it with great respect. For the last year or so, we've had a strong core of very capable engineers who collaborated on various development challenges to support the cloud's fast-changing infrastructure.

Below are their testimonies on the work they've done, gathered from several different perspectives of people involved in the project.

#### Slawomir Kaplonski, Principal Software Engineer at Red Hat

**What drives you to contribute to open source projects?**

I contribute to the projects which I am using. If I see that there is some bug that annoys me or some feature missing that I would like to see there, I try to investigate why it's like that, at least report a bug or a request for enhancement (RFE) for the project. And in the best case, I try to propose a patch, too.

This may be the main reason people contribute to a project, or at least why they start. It's because later when you're more involved in a project, you care about that project more, you know other people around the project, and things are different.

**What is the benefit of Tobiko being open source?**

If (when) it gets used by people from different teams, maybe even companies, they can directly contribute to the project, bringing their ideas and use cases there. And they can, and will, contribute code to fix bugs they encounter and add new features they need.

Making a project open source makes it available to a wide audience, which can help a project grow.

#### Federico Ressi, Senior Software Quality Engineer at Red Hat

**As a leading contributor to this effort from the beginning of the project, what were the main lessons you learned by working on Tobiko?**

**​​**Some of the lessons I got from Tobiko in no particular order are:

  * Avoid getting things to work as soon as possible because future refactoring often has a much greater cost. It's better to submit little tiny incremental changes over time.
  * Start work only once you have very well articulated requirements.
  * Use a Continuous Integration system to assist with testing your own code. This leads to stability.



**What is the benefit of Tobiko being open source?**

The biggest benefit of Tobiko being open source is being able to reuse other open source code and OpenDev infrastructure. It also increases end-user trust and user understanding of the project.

#### Eduardo Olivares Toledo, Senior Software Quality Engineer at Red Hat

**You joined the team after the project was in production already. How was it to join the existing project and community?**

I started attending the Tobiko meetings and taking small tasks from their kanban board. Core contributors were the main technical points of contact, and soon I started asking them technical questions when I started contributing to the project.

I also joined the Tobiko IRC channel and the mailing list to be updated on and participate in different discussions.

**What resources helped you to learn the project?**

Some upstream documentation mainly helped me start downloading, installing, and running Tobiko tests.

I also spent some time reviewing the existing CI jobs, and this was an excellent way to understand how Tobiko was used with Openstack, how the Tobiko tests work, and I could start contributing to fixing some issues I found.

Tobiko is based on standard Python libraries, such as testtools and [paramiko][6], which makes the ramp-up process easier (either you're familiar with them if you have some experience with Python test frameworks, or there's plenty of documentation available).

**What is the benefit of it being open source?**

There are several well-known benefits of open source projects. I would highlight the following ones:

  * Contribution and feedback from people from different organizations and companies. The Tobiko project has not yet achieved this because all of the contributors are Red Hat associates. Federico presented Tobiko during the last OpenStack PTG to the Neutron community, and hopefully, some more people will get involved in the project.
  * Shorter feedback loops due to CI jobs running upstream. This is already in place because Tobiko CI jobs get executed with every new Tobiko patch on the latest OpenStack version. Due to this, some OpenStack bugs got found in a really early stage. Tobiko is running in a periodic jobs queue for Neutron, which means it checks master branch daily gates, a remarkable achievement for Tobiko.



### Build software together

From my point of view as a manager in the organization and part of the team and project, I identified several critical points that helped the project grow faster and realize the value we were looking for: 

  * **Experience: **Early in the project, I recognized a need for an experienced member in the open source community to join the team to help out with community-related topics.
  * **Division of labor: **We decided to promote more people to the role of core reviews to speed up the development cycle and split the responsibility among team members.
  * **Education: **We needed to bring more attention to the project to interest more people to join the effort. We organized lectures in relevant meetings inside and outside the company, sent emails with examples of new features and achievements, and generally helped promote the project.



Building software and participating in an open source community was and continues to be a fun, educational, and fulfilling experience. It taught me the value of open source more than ever, and I'm happy that I had the chance to work on it with a very talented and motivated group of people.

Thank you Federico Ressi, Slawek Kaplonski, Pini Komarov, Eduardo Olivares Toledo, Alex Katz, Omer Scwartz, Assaf Muller, and Arie Bergman.

If you're interested in OpenStack testing, [join our project][7]!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/open-source-testing-framework

作者：[Toni Freger][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/toni-freger
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop-stickers-team-happy_0.png?itok=G2-GcSPp (Teamwork starts with communication )
[2]: https://docs.openstack.org/tempest/latest/
[3]: https://www.jenkins.io/
[4]: https://zuul-ci.org/
[5]: https://opensource.com/open-organization/resources/open-decision-framework
[6]: https://opensource.com/article/20/1/logtool-root-cause-identification#paramiko
[7]: https://opendev.org/x/tobiko
