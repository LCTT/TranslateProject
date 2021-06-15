[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Communication by example: Which methods do high-performing open source communities use?)
[#]: via: (https://www.linux.com/news/communication-by-example-which-methods-do-high-performing-open-source-communities-use/)
[#]: author: (Linux.com Editorial Staff https://www.linux.com/author/linuxdotcom/)

Communication by example: Which methods do high-performing open source communities use?
======

#### ![][1]

#### _“Good words are worth much, and cost little.”_ _George Herbert_

Although effective communication is an essential life skill, it is the most critical element in any business [2]. Lack of accurate communication is the common cause of any organization’s issues, causing conflicts, reducing client relationships, team effectiveness, and profitability [2]. According to the Project Management Institute (PMI), ineffective communication is the main contributor to project failure one-third of the time. It has a negative impact on project success more than half of the time [1].

In open source projects where there is a diverse and world spread community, effective communication is the key to projects’ success. Using the right technology is crucial for that. So, which tools do open source communities use for communication?

### Open Source community communication by example

#### Ubuntu

The Ubuntu community uses [**mailing lists**][2] for _development_ and _team coordination._ The mailing lists are split into announcements and news, support, development, testing and quality assurance, and general (such as translation, marketing, and documentation) [3]. Despite the mailing lists, [**IRC (Internet Relay Chat) channels**][3] are used for informal daily chats and short-term coordination tasks [3]. If someone wants to know what is going on on Ubuntu, but doesn’t want to subscribe to the high traffic mailing list, the [**web forum**][4] can be used to get support and discuss the future of Ubuntu. Finally, [Ask Ubuntu][5] can be used to ask technical questions.

#### Linux Kernel

**Mailing lists** are the main communication channels in the Linux Kernel. For newcomers that would like to learn more about the Linux kernel development, there is the [**kernelnewbies**][6] resource and #kernelnewbies IRC channel on OFTC. This online resource provides information on basic kernel development questions. Additionally, the **kernelnewbies ** **IRC channel** is a vehicle for contributors to ask questions in real-time and get help from experts in the kernel community. The [Linux Kernel Mailing List (LKML)][7] is where most development discussions and announcements are made. Kernel developers send patches to the mailing lists as outlined in the [Submitting patches: the essential guide to getting your code into the kernel][8]. The archives from each mailing list can be found at <https://lore.kernel.org/lists.html>.

Shuah Khan, a Linux Fellow, mentioned in an interview [4] that before contributing to the Linux Kernel, it’s important to subscribe to the kernel-related mailing lists _“to understand the dynamics.”_ Khan said, _“The process works like this: you walk into a room. People are gathering in small groups and are talking to each other. You have to break into one of these conversations. That is the process of watching the mailing lists, watching the interaction, and learning from that before you start sending out a patch.”_

#### OpenStack

OpenStack has many communication channels such as [IRC channels][9] for both public meetings and projects as well as [mailing lists][10]. The mailing lists are used to asynchronously communicate and share information, team communication, and cross-project communication. Additionally, mailing lists in OpenStack are used to communicate with non-developer community members of OpenStack [5]. 

#### GNOME

[IRC channels][11] are one of the most important communication methods in Gnome. They are a google place to know what the community is talking about and also ask for help. There are many channels on [Discourse][12], including discussions about Gnome’s sub-projects, community-related topics, internationalization, etc. Similar to other communities, [mailing lists][13] can be used for discussing specific topics. Finally, [PlanetGnome][14] and [GnomeNews][15] can be used to follow the latest news of the project.

So, where does communication occur in open source projects?

As observed in our previous discussion, _mailing lists_ seem to be the _most_ used communication method. Previous work has also found that _“mailing lists are the bread and butter of project communications”_ [11] and that _“the developer mailing list is the primary communication channel for an OSS project”_ [12]_._ However, as we have previously mentioned, mailing lists are not the _only_ communication channel used in OSS. Other channels (such as IRC channels and forums) also play an important role.

Guzzy et. al [10] mention that when more than one communication repository exists, the policy of most OSS is to transfer all official decisions and useful discussions to the mailing lists, so that they can later be _retrieved._ Thus, traceability and transparency of information is an important matter here.

The benefit of using mailing lists is that it is an asynchronous form of communication, and it is an easy resource to share information with the entire community. Additionally, mailing lists allow people that are in different timezones to engage, as well as people that have different levels of English proficiency, may better manage it in text messages [5].

However, mailing lists might also have their disadvantages. Previous work [10] found that developers have problems maintaining awareness of each other’s work when discussing on the mailing lists. Additionally, recovering traceability links among different communication repositories might help researchers and community members to have a more complete picture of the development process.

#### What are the common DOs and DON’Ts when using OSS mailing lists?

Given that mailing lists are one of the common ways to communicate in open source projects, it is worth knowing how to communicate in mailing lists. Although each project has its own set of rules, certain conventions should be followed.

##### **DOs**

**Subject**

  *     *       * _**Prefix the subject**_ with topic tags in square brackets. This makes email threads easier for readers to categorize and decide what they should read quickly. For example, OpenStack has documentation [13] establishing how to prefix the subject, i.e., community members should use **[docs]** to address any kind of documentation discussions that are cross-projects and so on.


  *     *       * Sometimes it’s appropriate to _**change the subject**_ rather than start a new thread.
        * **Exceptions:** Linux Kernel mailing lists use “bottom post” protocol (writing the message below the original text) rather than “top post” (writing the message above the original text of an email, which is what most mail clients are set to do by default.)



**Formating**

  *     *       * **Plain text:** Send your email as plain text only! Please, don’t send HTML emails.
      * **Line wrapping:** Lines should be wrapped at 72 characters or fewer.



**Replies**

  *     *       * Always use [**inline replies**][16], i.e., break the original message by replying to each specific part of the message.
      * When replying to long discussions, [**trim**][17] your message and leave only the relevant parts to the reply.



##### **DON’Ts**

  *     *       * _**Avoid cross-posting**_, i.e., posting the same message to many mailing lists at the same time.
        * **Exceptions:** The Linux Kernel maintains mailing lists for each subsystem, and patches are often sent to multiple mailing lists for review and discussion. However, avoid “top posting” on a Linux Kernel mailing list.


  *     *       * Avoid sending the _**wrong topic**_ to the _**wrong mailing list**_. Make sure that your topic is the topic of the mailing list.



#### Setting up your email client

The Linux Kernel has great [documentation][18] on setting different email clients according to the rules mentioned above.

#### How to minimize the harm caused by conflicts?

Even if the code of conduct is applied, conflicts might exist. Many actions can be taken in case of dispute, and here are some examples:

##### Gather information about the situation

If someone has violated the code of conduct, you should carefully analyze the situation according to the experience working with that person [6]. It is essential to read the past comments and interactions with that person to have an unbiased perspective about what happened. Stephanie Zvan [7] has mentioned that the best way to avoid a conflict is not to get pulled into an argument. It is important to focus on what you need to do instead of getting sidetracked into dealing with others’ behaviors.

##### Take appropriate actions

Two ways to respond to the code of conduct violation is that the moderator of the community (i) in a thoughtful way explain in public how the person’s behavior affected the community, or (ii) privately reach out to the person and explain how that behavior was negative [6].

#### _“A code of conduct that isn’t (or can’t be) enforced is worse than no code of conduct at all: it sends the message that the values in the code of conduct aren’t actually important or respected in your community.”_ [_Ada Initiative_][19]

#### General tips

  * Open source projects are, in large part, successful due to the collaborative nature of projects. Thus, **start conversations that lead to collaboration.** That means, give feedback, support each other’s communication, and share your ideas.
  * There is no additional cost to being transparent and authentic with your community. In that way, it is easy to keep your team informed, empowered, and focused on one specific goal or task.



***About the author: ***

_Isabella Ferreira is an Advocate at TARS Foundation,_ a cloud-native open-source microservice foundation under the Linux Foundation*.*

**References:**

[1]<https://www.pmi.org/-/media/pmi/documents/public/pdf/learning/thought-leadership/pulse/the-essential-role-of-communications.pdf>

[2]<https://www.orangescrum.org/articles/communication-challenges-in-project-management-how-to-overcome.html>

[3] <https://wiki.ubuntu.com/ContributeToUbuntu#Community_Communication>

[4] <https://thenewstack.io/how-to-begin-your-journey-as-a-contributor-to-the-linux-kernel/>

[5] <https://docs.openstack.org/project-team-guide/open-community.html>

[6] <https://opensource.guide/code-of-conduct/#:~:text=A%20code%20of%20conduct%20is,just%20your%20participants%2C%20but%20yourself.>

[7] 

<https://the-orbit.net/almostdiamonds/2014/04/10/so-youve-got-yourself-a-policy-now-what/>

[9] <https://www.forbes.com/sites/forbescommunicationscouncil/2019/11/22/open-source-software-a-model-for-transparent-organizational-communication/#1b834e0d32c4>

[10] Guzzi, Anja, et al. “Communication in open source software development mailing lists.” 2013 10th Working Conference on Mining Software Repositories (MSR). IEEE, 2013.

[11] Fogel, Karl. _Producing open source software: How to run a successful free software project_. ” O’Reilly Media, Inc.”, 2005.

[12] Gutwin, Carl, Reagan Penner, and Kevin Schneider. “Group awareness in distributed software development.” _Proceedings of the 2004 ACM conference on Computer supported cooperative work_. 2004.

[13] <https://docs.openstack.org/project-team-guide/open-community.html#mailing-lists>

_This Linux Foundation Platinum Sponsor content was contributed by Tencent._

--------------------------------------------------------------------------------

via: https://www.linux.com/news/communication-by-example-which-methods-do-high-performing-open-source-communities-use/

作者：[Linux.com Editorial Staff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/linuxdotcom/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2019/08/email2git-linux-kernel.jpg
[2]: https://lists.ubuntu.com/
[3]: https://help.ubuntu.com/community/InternetRelayChat
[4]: https://ubuntuforums.org/index.php
[5]: https://askubuntu.com/
[6]: https://kernelnewbies.org
[7]: https://lore.kernel.org/lkml/
[8]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html
[9]: https://docs.openstack.org/project-team-guide/glossary.html#term-IRC
[10]: http://lists.openstack.org/cgi-bin/mailman/listinfo
[11]: https://wiki.gnome.org/Community/GettingInTouch/IRC
[12]: https://discourse.gnome.org/
[13]: https://mail.gnome.org/mailman/listinfo/
[14]: https://planet.gnome.org/
[15]: https://www.gnome.org/news/
[16]: https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
[17]: https://en.wikipedia.org/wiki/Posting_style#Trimming_and_reformatting
[18]: https://www.kernel.org/doc/html/v4.10/process/email-clients.html
[19]: https://adainitiative.org/2014/02/18/howto-design-a-code-of-conduct-for-your-community/
