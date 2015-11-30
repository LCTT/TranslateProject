14 tips for teaching open source development
================================================================================
Academia is an excellent platform for training and preparing the open source developers of tomorrow. In research, we occasionally open source software we write. We do this for two reasons. One, to promote the use of the tools we produce. And two, to learn more about the impact and issues other people face when using them. With this background of writing research software, I was tasked with redesigning the undergraduate software engineering course for second-year students at the University of Bradford.

It was a challenge, as I was faced with 80 students coming for different degrees, including IT, business computing, and software engineering, all in the same course. The hardest part was working with students with a wide range of programming experience levels. Traditionally, the course had involved allowing students to choose their own teams, tasking them with building a garage database system and then submitting a report in the end as part of the assessment.

I decided to redesign the course to give students insight into the process of working on real-world software teams. I divided the students into teams of five or six, based on their degrees and programming skills. The aim was to have an equal distribution of skills across the teams to prevent any unfair advantage of one team over another.

### The core lessons ###

The course format was updated to have both lectures and lab sessions. However, the lab session functioned as mentoring sessions, where instructors visited each team to ask for updates and see how the teams were progressing with the clients and the products. There were traditional lectures on project management, software testing, requirements engineering, and similar topics, supplemented by lab sessions and mentor meetings. These meetings allowed us to check up on students' progress and monitor whether they were following the software engineering methodologies taught in the lecture portion. Topics we taught this year included:

- Requirements engineering
- How to interact with clients and other team members
- Software methodologies, such as agile and extreme programming approaches
- How to use different software engineering approaches and work through sprints
- Team meetings and documentations
- Project management and Gantt charts
- UML diagrams and system descriptions
- Code revisioning using Git
- Software testing and bug tracking
- Using open source libraries for their tools
- Open source licenses and which one to use
- Software delivery

Along with these lectures, we had a few guest speakers from the corporate world talk about their practices in software product deliveries. We also managed to get the university’s intellectual property lawyer to come and talk about IP issues surrounding software in the UK, and how to handle any intellectual properties issues in software.

### Collaboration tools ###

To make all of the above possible, a number of tools were introduced. Students were trained on how to use them for their projects. These included:

- Google Drive folders shared within the team and the tutor, to maintain documents and spreadsheets for project descriptions, requirements gathering, meeting minutes, and time tracking of the project. This was an extremely efficient way to monitor and also provide feedback straight into the folders for each team.
- [Basecamp][1] for document sharing as well, and later in the course we considered this as a possible replacement for Google Drive.
- Bug reporting tools such as [Mantis][2] again have a limited users for free reporting. Later Git itself was being used for bug reports n any tools by the testers in the teams
- Remote videoconferencing tools were used as a number of clients were off-campus, and sometimes not even in the same city. The students were regularly using Skype to communicate with them, documenting their meetings and sometimes even recording them for later use.
- A number of open source tool kits were also used for students' projects. The students were allowed to choose their own tool kits and languages based on the requirements of the projects. The only condition was that these have to be open source and could be installed in the university labs, which the technical staff was extremely supportive of.
- In the end all teams had to deliver their projects to the client, including complete working version of the software, documentation, and open source licenses of their own choosing. Most of the teams chose the GPL version 3 license.

### Tips and lessons learned ###

In the end, it was a fun year and nearly all students did very well. Here are some of the lessons I learned which may help improve the course next year:

1. Give the students a wide variety of choice in projects that are interesting, such as game development or mobile application development, and projects with goals. Working with mundane database systems is not going to keep most students interested. Working with interesting projects, most students became self-learners, and were also helping others in their teams and outside to solve some common issues. The course also had a message list, where students were posting any issues they were encountering, in hopes of receiving advice from others. However, there was a drawback to this approach. The external examiners have advised us to go back to a style of one type of project, and one type of language to help narrow the assessment criteria for the students.
1. Give students regular feedback on their performance at every stage. This could be done during the mentoring meetings with the teams, or at other stages, to help them improve the work for next time.
1. Students are more than willing to work with clients from outside university! They look forward to working with external company representatives or people outside the university, just because of the new experience. They were all able to display professional behavior when interacting with their mentors, which put the instructors at ease.
1. A lot of teams left developing unit testing until the end of the project, which from an extreme programming methodology standpoint was a serious no-no. Maybe testing should be included at the assessments of the various stages to help remind students that they need to be developing unit tests in parallel with the software.
1. In the class of 80, there were only four girls, each working in different teams. I observed that boys were very ready to take on roles as team leads, assigning the most interesting code pieces to themselves and the girls were mostly following instructions or doing documentation. For some reason, the girls choose not to show authority or preferred not to code even when they were encouraged by a female instructor. This is still a major issue that needs to be addressed.
1. There are different styles of documentation such as using UML, state diagrams, and others. Allow students to learn them all and merge with other courses during the year to improve their learning experience.
1. Some students were very good developers, but some doing business computing had very little coding experience. The teams were encouraged to work together to prevent the idea that developer would get better marks than other team members if they were only doing meeting minutes or documentations. Roles were also encouraged to be rotated during mentoring sessions to see that everyone was getting a chance to learn how to program.
1. Allowing the team to meet with the mentor every week was helpful in monitoring team activities. It also showed who was doing the most work. Usually students who were not participating in their groups would not come to meetings, and could be identified by the work being presented by other members every week.
1. We encouraged students to attach licenses to their work and identify intellectual property issues when working with external libraries and clients. This allowed students to think out of the box and learn about real-world software delivery problems.
1. Give students room to choose their own technologies.
1. Having teaching assistants is key. Managing 80 students was very difficult, especially on the weeks when they were being assessed. Next year I would definitely have teaching assistants helping me with the teams.
1. A supportive tech support for the lab is very important. The university tech support was extremely supportive of the course. Next year, they are talking about having virtual machines assigned to teams, so the teams can install any software on their own virtual machine as needed.
1. Teamwork helps. Most teams exhibited a supportive nature to other team members, and mentoring also helped.
1. Additional support from other staff members is a plus. As a new academic, I needed to learn from experience and also seek advice at multiple points on how to handle certain students and teams if I was confused on how to engage them with the course. Support from senior staff members was very encouraging to me.

In the end, it was a fun course—not only for the me as an instructor, but for the students as well. There were some issues with learning objectives and traditional grading schemes that still need to be ironed out to reduce the workload it produced on the instructors. For next year, I plan to keep this same format, but hope to come up with a better grading scheme and introduce more software tools that can help monitor project activities and code revisions.

--------------------------------------------------------------------------------

via: http://opensource.com/education/15/9/teaching-open-source-development-undergraduates

作者：[Mariam Kiran][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://opensource.com/users/mariamkiran
[1]:https://basecamp.com/
[2]:https://www.mantisbt.org/
