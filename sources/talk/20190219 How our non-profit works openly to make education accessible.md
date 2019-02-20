[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How our non-profit works openly to make education accessible)
[#]: via: (https://opensource.com/open-organization/19/2/building-curriculahub)
[#]: author: (Tanner Johnson https://opensource.com/users/johnsontanner3)

How our non-profit works openly to make education accessible
======
To build an open access education hub, our team practiced the same open methods we teach our students.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Education_2_OpenAccess_1040x584_12268077_0614MM.png?itok=xb96iaHe)

I'm lucky to work with a team of impressive students at Duke University who are leaders in their classrooms and beyond. As members of [CSbyUs][1], a non-profit and student-run organization based at Duke, we connect university students to middle school students, mostly from [title I schools][2] across North Carolina's Research Triangle Park. Our mission is to fuel future change agents from under-resourced learning environments by fostering critical technology skills for thriving in the digital age.

The CSbyUs Tech R&D team (TRD for short) recently set an ambitious goal to build and deploy a powerful web application over the course of one fall semester. Our team of six knew we had to do something about our workflow to ship a product by winter break. In our middle school classrooms, we teach our learners to use agile methodologies and design thinking to create mobile applications. On the TRD team, we realized we needed to practice what we preach in those classrooms to ship a quality product by semester's end.

This is the story of how and why we utilized the principles we teach our students in order to deploy technology that will scale our mission and make our teaching resources open and accessible.

### Setting the scene

For the past two years, CSbyUs has operated "on the ground," connecting Duke undergraduates to Durham middle schools via after-school programming. After teaching and evaluating several iterations of our unique, student-centered mobile app development curriculum, we saw promising results. Our middle schoolers were creating functional mobile apps, connecting to their mentors, and leaving the class more confident in their computer science skills. Naturally, we wondered how to expand our programming.

We knew we should take our own advice and lean into web-based technologies to share our work, but we weren't immediately sure what problem we needed to solve. Ultimately, we decided to create a web app that serves as a centralized hub for open source and open access digital education curricula. "CurriculaHub" (name inspired by GitHub) would be the defining pillar of CSbyUs's new website, where educators could share and adapt resources.

But the vision and implementation didn't happen overnight.

Given our sense of urgency and the potential of "CurriculaHub," we wanted to start this project with a well defined plan. The stakes were (and are) high, so planning, albeit occasionally tedious, was critical to our success. Like the curriculum we teach, we scaffolded our workflow process with design thinking and agile methodology, two critical 21st century frameworks we often fail to practice in higher ed.

What follows is a step-wise explanation of our design thinking process, starting from inspiration and ending in a shipped prototype.

```
This is the story of how and why we utilized the principles we teach our students in order to deploy technology that will scale our mission and make our teaching resources open and accessible.
```

### Our Process

#### **Step 1: Pre-Work**

In order to understand the why to our what, you have to know who our team is.

The members of this team are busy. All of us contribute to CSbyUs beyond our TRD-related responsibilities. As an organization with lofty goals beyond creating a web-based platform, we have to reconcile our "on the ground" commitments (i.e., curriculum curation, research and evaluation, mentorship training and practice, presentations at conferences, etc.) with our "in the cloud" technological goals.

In addition to balancing time across our organization, we have to be flexible in the ways we communicate. As a remote member of the team, I'm writing this post from Spain, but the rest of our team is based in North Carolina, adding collaboration challenges.

Before diving into development (or even problem identification), we knew we had to set some clear expectations for how we'd operate as a team. We took a note from our curriculum team's book and started with some [rules of engagement][3]. This is actually [a well-documented approach][4] to setting up a team's [social contract][5] used by teams across the tech space. During a summer internship at IBM, I remember pre-project meetings where my manager and team spent more than an hour clarifying principles of interaction. Whenever we faced uncertainty in our team operations, we'd pull out the rules of engagement and clear things up almost immediately. (An aside: I've found this strategy to be wildly effective not only in my teams, but in all relationships).

Considering the remote nature of our team, one of our favorite tools is Slack. We use it for almost everything. We can't have sticky-note brainstorms, so we create Slack brainstorm threads. In fact, that's exactly what we did to generate our rules of engagement. One [open source principle we take to heart is transparency][6]; Slack allows us to archive and openly share our thought processes and decision-making steps with the rest of our team.

#### **Step 2: Empathy Research**

We're all here for unique reasons, but we find a common intersection: the desire to broaden equity in access to quality digital era education.

Each member of our team has been lucky enough to study at Duke. We know how it feels to have limitless opportunities and the support of talented peers and renowned professors. But we're mindful that this isn't normal. Across the country and beyond, these opportunities are few and far between. Where they do exist, they're confined within the guarded walls of higher institutes of learning or come with a lofty price tag.

While our team members' common desire to broaden access is clear, we work hard to root our decisions in research. So our team begins each semester [reviewing][7] [research][8] that justifies our existence. TRD works with CRD (curriculum research and development) and TT (teaching team), our two other CSbyUs sub-teams, to discuss current trends in digital education access, their systemic roots, and novel approaches to broaden access and make materials relevant to learners. We not only perform research collaboratively at the beginning of the semester but also implement weekly stand-up research meetings with the sub-teams. During these, CRD often presents new findings we've gleaned from interviewing current teachers and digging into the current state of access in our local community. They are our constant source of data-driven, empathy-fueling research.

Through this type of empathy-based research, we have found that educators interested in student-centered teaching and digital era education lack a centralized space for proven and adaptable curricula and lesson plans. The bureaucracy and rigid structures that shape classroom learning in the United States makes reshaping curricula around the personal needs of students daunting and seemingly impossible. As students, educators, and technologists, we wondered how we might unleash the creativity and agency of others by sharing our own resources and creating an online ecosystem of support.

#### **Step 3: Defining the Problem**

We wanted to avoid [scope creep][9] caused by a poorly defined mission and vision (something that happens too often in some organizations). We needed structures to define our goals and maintain clarity in scope. Before imagining our application features, we knew we'd have to start with defining our north star. We would generate a clear problem statement to which we could refer throughout development.

Before imagining our application features, we knew we'd have to start with defining our north star.

This is common practice for us. Before committing to new programming, new partnerships, or new changes, the CSbyUs team always refers back to our mission and vision and asks, "Does this make sense?" (in fact, we post our mission and vision to the top of every meeting minutes document). If it fits and we have capacity to pursue it, we go for it. And if we don't, then we don't. In the case of a "no," we are always sure to document what and why because, as engineers know, [detailed logs are almost always a good decision][10]. TRD gleaned that big-picture wisdom and implemented a group-defined problem statement to guide our sub-team mission and future development decisions.

To formulate a single, succinct problem statement, we each began by posting our own takes on the problem. Then, during one of our weekly [30-minute-no-more-no-less stand-up meetings][11], we identified commonalities and differences, ultimately [merging all our ideas into one][12]. Boiled down, we identified that there exist massive barriers for educators, parents, and students to share, modify, and discuss open source and accessible curricula. And of course, our mission would be to break down those barriers with user-centered technology. This "north star" lives as a highly visible document in our Google Drive, which has influenced our feature prioritization and future directions.

#### **Step 4: Ideating a Solution**

With our problem defined and our rules of engagement established, we were ready to imagine a solution.

We believe that effective structures can ensure meritocracy and community. Sometimes, certain personalities dominate team decision-making and leave little space for collaborative input. To avoid that pitfall and maximize our equality of voice, we tend to use "offline" individual brainstorms and merge collective ideas online. It's the same process we used to create our rules of engagement and problem statement. In the case of ideating a solution, we started with "offline" brainstorms of three [S.M.A.R.T. goals][13]. Those goals would be ones we could achieve as a software development team (specifically because the CRD and TT teams offer different skill sets) and address our problem statement. Finally, we wrote these goals in a meeting minutes document, clustering common goals and ultimately identifying themes that describe our application features. In the end, we identified three: support, feedback, and open source curricula.

From here, we divided ourselves into sub-teams, repeating the goal-setting process with those teams—but in a way that was specific to our features. And if it's not obvious by now, we realized a web-based platform would be the most optimal and scalable solution for supporting students, educators, and parents by providing a hub for sharing and adapting proven curricula.

To work efficiently, we needed to be adaptive, reinforcing structures that worked and eliminating those that didn't. For example, we put a lot of effort in crafting meeting agendas. We strive to include only those subjects we must discuss in-person and table everything else for offline discussions on Slack or individually organized calls. We practice this in real time, too. During our regular meetings on Google Hangouts, if someone brings up a topic that isn't highly relevant or urgent, the current stand-up lead (a role that rotates weekly) "parking lots" it until the end of the meeting. If we have space at the end, we pull from the parking lot, and if not, we reserve that discussion for a Slack thread.

This prioritization structure has led to massive gains in meeting efficiency and a focus on progress updates, shared technical hurdle discussions, collective decision-making, and assigning actionable tasks (the next-steps a person has committed to taking, documented with their name attached for everyone to view).

#### **Step 5: Prototyping**

This is where the fun starts.

Our team was only able to unite new people with highly varied experience through the power of open principles and methodologies.

Given our requirements—like an interactive user experience, the ability to collaborate on blogs and curricula, and the ability to receive feedback from our users—we began identifying the best technologies. Ultimately, we decided to build our web app with a ReactJS frontend and a Ruby on Rails backend. We chose these due to the extensive documentation and active community for both, and the well-maintained libraries that bridge the relationship between the two (e.g., react-on-rails). Since we chose Rails for our backend, it was obvious from the start that we'd work within a Model-View-Controller framework.

Most of us didn't have previous experience with web development, neither on the frontend nor the backend. So, getting up and running with either technology independently presented a steep learning curve, and gluing the two together only steepened it. To centralize our work, we use an open-access GitHub repository. Given our relatively novice experience in web development, our success hinged on extremely efficient and open collaborations.

And to explain that, we need to revisit the idea of structures. Some of ours include peer code reviews—where we can exchange best-practices and reusable solutions, maintaining up-to-date tech and user documentation so we can look back and understand design decisions—and (my personal favorite) our questions bot on Slack, which gently reminds us to post and answer questions in a separate Slack #questions channel.

We've also dabbled with other strategies, like instructional videos for generating basic React components and rendering them in Rails Views. I tried this and in my first video, [I covered a basic introduction to our repository structure][14] and best practices for generating React components. While this proved useful, our team has since realized the wealth of online resources that document various implementations of these technologies robustly. Also, we simply haven't had enough time (but we might revisit them in the future—stay tuned).

We're also excited about our cloud-based implementation. We use Heroku to host our application and manage data storage. In next iterations, we plan to both expand upon our current features and configure a continuous iteration/continuous development pipeline using services like Jenkins integrated with GitHub.

#### **Step 6: Testing**

Since we've [just deployed][1], we are now in a testing stage. Our goals are to collect user feedback across our feature domains and our application experience as a whole, especially as they interact with our specific audiences. Given our original constraints (namely, time and people power), this iteration is the first of many to come. For example, future iterations will allow for individual users to register accounts and post external curricula directly on our site without going through the extra steps of email. We want to scale and maximize our efficiency, and that's part of the recipe we'll deploy in future iterations. As for user testing: We collect user feedback via our contact form, via informal testing within our team, and via structured focus groups. [We welcome your constructive feedback and collaboration][15].

Our team was only able to unite new people with highly varied experience through the power of open principles and methodologies. Luckily enough, each one I described in this post is adaptable to virtually every team.

Regardless of whether you work—on a software development team, in a classroom, or, heck, [even in your family][16]—principles like transparency and community are almost always the best foundation for a successful organization.


--------------------------------------------------------------------------------

via: https://opensource.com/open-organization/19/2/building-curriculahub

作者：[Tanner Johnson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/johnsontanner3
[b]: https://github.com/lujun9972
[1]: http://csbyus.org
[2]: https://www2.ed.gov/programs/titleiparta/index.html
[3]: https://docs.google.com/document/d/1tqV6B6Uk-QB7Psj1rX9tfCyW3E64_v6xDlhRZ-L2rq0/edit
[4]: https://www.atlassian.com/team-playbook/plays/rules-of-engagement
[5]: https://openpracticelibrary.com/practice/social-contract/
[6]: https://opensource.com/open-organization/resources/open-org-definition
[7]: https://services.google.com/fh/files/misc/images-of-computer-science-report.pdf
[8]: https://drive.google.com/file/d/1_iK0ZRAXVwGX9owtjUUjNz3_2kbyYZ79/view?usp=sharing
[9]: https://www.pmi.org/learning/library/top-five-causes-scope-creep-6675
[10]: https://www.codeproject.com/Articles/42354/The-Art-of-Logging#what
[11]: https://opensource.com/open-organization/16/2/6-steps-running-perfect-30-minute-meeting
[12]: https://docs.google.com/document/d/1wdPRvFhMKPCrwOG2CGp7kP4rKOXrJKI77CgjMfaaXnk/edit?usp=sharing
[13]: https://www.projectmanager.com/blog/how-to-create-smart-goals
[14]: https://www.youtube.com/watch?v=52kvV0plW1E
[15]: http://csbyus.org/
[16]: https://opensource.com/open-organization/15/11/what-our-families-teach-us-about-organizational-life
