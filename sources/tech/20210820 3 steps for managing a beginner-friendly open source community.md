[#]: subject: "3 steps for managing a beginner-friendly open source community"
[#]: via: "https://opensource.com/article/21/8/beginner-open-source-community"
[#]: author: "Isabel Costa https://opensource.com/users/isabelcmdcosta"
[#]: collector: "lujun9972"
[#]: translator: "XiaotingHuang22"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3个步骤管理对新手友好的开源社区
======
作为开源项目的成员，您可以做很多事情来帮助新手找到为项目作出贡献的方式。
![在家使用笔记本电脑工作][1]

当有人刚开始为开源做贡献时，最好从对新手友好的故障和问题开始。但在他们修复故障之前，他们必须要能够找到这类问题。作为开源项目的成员，您可以做很多事情来帮助新手找到为项目贡献的方式。

牢记这一点，[AnitaB.org 开源社区][2] 优先考虑让我们的社区做到对新手友好。 我们提倡包容性，确保不同经验和水平的贡献者都可以参与进来，并且他们的贡献不止限于跟编程有关。

我最近在 [Upstream 2021][4] 上介绍了我们在 [AnitaB.org][3] 上所做的一些社区工作，Tidelift举办的活动启动了维护者周，这是一个为期一周的开源维护者庆祝活动。在活动中我讨论了我们战略的三个主要部分：

   * 我们如何沟通
   * 项目和问题
   * 开源项目


### 我们如何沟通


透明度是开源的重要组成部分，我们将透明度原则应用于我们的沟通方式。实际上，这意味着我们所有的社区会议都是公开进行的，并且影响我们设置Zulip聊天的方式以及我们提供文档的方式。

#### **Open sessions开放会议**

任何人都可以加入我们的会议并讨论与我们社区相关的话题。他们可以参与讨论或者旁听。会议相关信息在我们的社区日历中都可以找到。在这些通话中我们通常只使用语音聊天，我们发现这可以让人们在参与时感觉更自在。

我们举办以项目为中心的会议和一些与类别相关的会议。会议上，来自不同领域的人们可以讨论同一个项目并帮助改进我们的流程。偶尔，我们会有“自由提问（Ask Me Anything）”会议，任何人都可以来问任何与开源相关的问题。

所有会议我们都会在共享文档中进行记录，并在 [我们的Zulip（our Zulip）][5] 中共享摘要和文档链接。

#### **Our Zulip chat我们的Zulip聊天**


开源 Zulip 聊天平台是我们的主要社区交流渠道，虽然我们也在Github的评论区讨论问题和拉取请求（pull request）。一般来说，我们已禁用私人消息以确保我们尽可能透明。对于这条规则，我们只有少数例外，那些私人聊天是管理员在处理我们运行程序的后勤工作所用的。 我们发现这种方法更受欢迎，它还使我们能够更清楚公共聊天中的违规行为。

我们在 Zulip 聊天室分享所有会议摘要，包括讨论的要点、行动项目和文档。这些听起来好像是些显而易见的要求，但我一直惊讶于很多开源项目并不提供笔记，所以 Zulip可以让那些没有参加会议的人也随时了解情况。

在 Zulip上，我们讨论项目路线图，回答社区的问题和查询，并积极**促进人们通过不同的方式方法和在不同的场景下做出自己的贡献。 **有时我们为贡献者的成就而庆祝——无论是突出他们测试或者审查的第一个PR，还是强调我们志愿者所做的出色工作。

#### **文档**

我们尽量保持**关于我们流程的开放文档**，例如常见问题解答，以便这些社区成员可以按照自己的节奏和时间了解社区。这是为了让他们在联系我们之前了解我们的工作方式以及我们从事的工作类型。

### Projects and issues项目和问题

Regarding our projects and issues management, we encourage multiple ways to contribute, create specific issues for first-timers only, and try to have an easy setup for projects.
关于我们的项目和问题管理，我们鼓励通过多种方式做出贡献，我们为新手专门创建特定的问题，并尝试让我们的项目


#### **Multiple ways to contribute**

We make an effort to create **issues that require different contributions** such as documentation, testing, design, and outreach. This is to provide ways for anyone to contribute regardless of their experience level and area of interest. It helps the community get involved, and we've found that it enables members to work their way up and contribute to some low-effort but valuable tasks.

Types of contributions we promote are:

  * Coding tasks that range in complexity.
  * Quality assurance tasks—where contributors can test our apps or pull requests and report bugs.
  * Design sessions where members can participate in discussions. Also, opportunities to create mock-ups and redesign parts of our apps, and explore user experience improvements.
  * Outreach tasks, we primarily promote on Zulip, where we suggest blogging to our Medium publication about their open source experiences and their contributions.
  * Documentation tasks that can include general community documentation or our project's documentation on Docusaurus.



#### **First-timers only issues**

We label some **issues as "first-timers only."** These are for people who have not contributed yet to the issue's repository. Labeling issues also enable us to have work for people beginning their open source journey during times of contributor influx, for example, during [Google Summer of Code (GSoC)][6].

Sometimes these might be "low-hanging fruit" that can get them acquainted with the process of contributing and submitting pull requests.

#### **Easy project setup**

We also care about having a **beginner-friendly setup **for our projects. We notice that the most active project is generally the easiest to set up. We know that contributing to a project you aren't familiar with can take a lot of effort and make or break the experience of contributing.

We try to provide instructions on how to run our projects on multiple operating systems. In the past, we had some projects with separate instructions to run on Unix environments, and we noticed contributors having difficulties running these projects on Windows. We've improved since then to avoid confusion among contributors who would ask for help on our Zulip.

We have been improving the README for one of our most active projects, [mentorship-backend][7], according to contributors' experience. One of the struggles for beginners in this project was setting part of the environment variables related to configuring an email account to enable the backend functionality to send emails. However, because this feature was not critical for local development, by default, we made the email setup optional so that emails, instead of being sent to users, were printed to the terminal. This approach still made the emails visible to the contributor. Similar to this change, we made [the SQLite database][8] the default for local development to avoid additional setup for the Postgres database, even though we use this in our deployed version.

We have noticed that some contributors have struggled to contribute to one of our projects, [bridge-in-tech-backend][9], where its setup is complicated and includes many more steps than [mentorship-backend][7]. Since we noticed this in one of our open source programs, we have been exploring improving its structure.

For most of our projects, we also provide a live or bundled version of the apps so that contributors can test the project without setting it up. This helps us provide a way for contributors who are not interested or familiar with the development setup to try the most recent version of our apps and contribute by reporting any bugs found. We have the links to these apps deployed on our [Quality Assurance guide][10].

### Open source programs

We organize two main programs in our community: Open Source Hack (a one-month program) and Open Source Ambassadors (a six-month program).

#### **Open Source Hack (OSH)**

In this program, we create issues in multiple categories of contributions—Documentation, Coding, Outreach, Testing, and Design (similar to the [Google Code-in][11] contest). Participants can contribute and receive digital certificates for contributing at least once to each category. One issue may include multiple categories, and the pull requests don't need to be merged for their contributions to be valid.

We select a few projects for this program, then mentors brainstorm and create issues for participants. When the program starts, participants can claim issues and begin contributing. Mentors support and review their contributions.

This approach encourages diversity of contributions and welcomes anyone, regardless of their coding ability, to contribute in a friendly and fail-safe environment.

#### **Open Source Ambassadors**

In this program, we select ambassadors from the community that ideally will cover each category of contributions we aim to promote. We've run this program twice so far.

The program aims to have members grow in helping manage projects and initiatives by responding to questions from the community, assisting contributors to get involved, and advocating for their assigned category.

In the first program we ran, we accepted anyone who applied. We assessed where members' interests lay and provided a structure for people who wanted to contribute but were initially uncomfortable with taking that step.

This edition was very enlightening for us as a community. It required a lot of management from admins, as we had a mix of experienced and inexperienced open source contributors and community members. Some ambassadors were confident in stepping up and leading initiatives, while others needed more support. For our second program, we decided to scale down the initiative. We only accepted contributors who were already familiar with the community and could lead on initiatives and projects and help us train the less experienced.

The second program became a positive feedback loop. Ambassadors who started as beginners, contributing to the first program we ran, became comfortable leading after learning from their experience with the program.

This change of approach enabled admins to focus more on supporting the ambassadors' team, helping them propagate our mission and continue making the community beginner-friendly, and mentoring more people to contribute.

### Summary

These programs have helped us bring awareness to different ways to contribute and give back to open source. Through these, we've found volunteers helping by managing projects and hosting open sessions, which contributes to managing the community and providing mentorship to our contributors.

Even though we have had a good response from contributors and helped people make their first contributions, we still have a lot of room for improvement. We will continue to enhance our project's setup and contribution guidelines to improve contributors' experience. We'll also continue to focus on making sure we always have and promote available issues across the organization and in different categories to promote an inclusive environment so that anyone who wishes to can contribute.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/beginner-open-source-community

作者：[Isabel Costa][a]
选题：[lujun9972][b]
译者：[XiaotingHuang22](https://github.com/XiaotingHuang22)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/isabelcmdcosta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://github.com/anitab-org
[3]: https://anitab.org/
[4]: https://youtu.be/l8r50jCr-Yo
[5]: https://anitab-org.zulipchat.com/
[6]: https://summerofcode.withgoogle.com/
[7]: https://github.com/anitab-org/mentorship-backend#readme
[8]: https://opensource.com/article/21/2/sqlite3-cheat-sheet
[9]: https://github.com/anitab-org/bridge-in-tech-backend
[10]: https://github.com/anitab-org/documentation/blob/master/quality-assurance.md
[11]: https://codein.withgoogle.com/
