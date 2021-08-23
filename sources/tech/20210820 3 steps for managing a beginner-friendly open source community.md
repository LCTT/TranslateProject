[#]: subject: "3 steps for managing a beginner-friendly open source community"
[#]: via: "https://opensource.com/article/21/8/beginner-open-source-community"
[#]: author: "Isabel Costa https://opensource.com/users/isabelcmdcosta"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 steps for managing a beginner-friendly open source community
======
As a member of an open source project, there's a lot you can do to help
beginners find a way to contribute. 
![Working from home at a laptop][1]

When someone is new to contributing to open source, the best place to start is often beginner-friendly bugs and issues. But before they can do that, they have to be able to find those kinds of issues. As a member of an open source project, there's a lot you can do to help beginners find a way to contribute. 

Bearing this in mind, the [AnitaB.org open source community][2] prioritizes making our community beginner-friendly. We have initiatives to ensure that we're inclusive for contributors at different levels of experience and for different types of contributions that don't only relate to coding.

I recently presented some of the community work we do at the [AnitaB.org][3] community at [Upstream 2021][4], the Tidelift event, which kicked off Maintainer Week, a weeklong celebration of open source maintainers. I discussed how there are three main parts to our strategy:

  * How we communicate
  * Projects and issues
  * Open source programs



### How we communicate

Transparency is such an essential part of open source, and we apply transparency principles to our approach to communication. In practical terms, this means that all our community sessions are run openly, affect how we've set up Zulip chat and how we provide documentation.

#### **Open sessions**

Anyone can join our sessions and discuss topics related to our community. They can participate in discussions or just listen. These are available for everyone to see in our community calendar. We usually only use audio in these calls, which we've found can make people feel more comfortable participating.

We host project-focused sessions and a couple of category-related sessions, where people from different areas can discuss the same project and help improve our processes. Occasionally, we have "Ask Me Anything" sessions, where anyone can come and ask questions about anything related to open source.

We take notes of all sessions in a shared document and share the summary and a document link in [our Zulip][5].

#### **Our Zulip chat**

The open source Zulip chat platform is our primary community communication channel, although we also use the comments section on issues and pull requests on Github. In general, we have disabled private messaging to make sure we are as transparent as possible. We have only a few exceptions to this rule, where we have private streams for admins dealing with the logistics of the programs we run. We've found this approach is more welcoming, and it also enables us to have more visibility into conduct violations in the public chat.

We share all session summaries on the Zulip chat, including the main points discussed, action items, and documentation. This process might sound like an obvious requirement, but I've been surprised at how many open source projects don't provide notes so that people who did not attend can remain informed.

On Zulip, we discuss project roadmaps, answer questions and queries from the community, and actively **promote ways for people to contribute and where they can contribute. **Sometimes we celebrate contributors' wins—whether it's to highlight the first PR they have tested, reviewed, or the excellent work our volunteers do.

#### **Documentation**

We try to keep **open documentation about our processes**, such as FAQs, so those community members can learn at their own pace and in their own time about the community. This is intended to give them an idea of how we work and what type of work we do before reaching out to us.

### Projects and issues

Regarding our projects and issues management, we encourage multiple ways to contribute, create specific issues for first-timers only, and try to have an easy setup for projects.

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
译者：[译者ID](https://github.com/译者ID)
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
