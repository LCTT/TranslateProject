How DevOps eliminated bottlenecks for Ranger community
======
![配图](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/traffic-light-go.png?itok=nC_851ys)
The Visual Studio Application Lifecycle Management (ALM) [Ranger][1] program is a community of volunteers that gives professional guidance, practical experience, and gap-filling solutions to the developer community. It was created in 2006 as an internal Microsoft community to "connect the product group with the field and remove adoption blockers." By 2009, the community had more than 200 members, which led to collaboration and planning challenges, bottlenecks due to dependencies and manual processes, and increasing delays and dissatisfaction within the developer community. In 2010, the program evolved to include Microsoft Most Valued Professionals (MVPs), expanding into a geographically distributed community that spans the globe.

The community is divided into roughly a dozen active teams. Each team is committed to design, build, and support one guidance or tooling project through its lifetime. In the past, teams typically bottlenecked at the team management level due to a rigid, waterfall-style process and high dependency on one or more program managers. The program managers intervened in decision making, releases, and driving the "why, what, and how" for projects. Also, a lack of real-time metrics prevented teams from effectively monitoring their solutions, and alerts about bugs and issues typically came from the community.

It was time to find a better way of doing things and delivering value to the developer community.

### DevOps to the rescue

> "DevOps is the union of people, process, and products to enable continuous delivery of value to our end users." --[Donovan Brown][2]

To address these challenges, the community stopped all new projects for a couple of sprints to explore Agile practices and new products. The aim was to re-energize the community, to find ways to promote autonomy, mastery, and purpose, as outlined in the book [Drive][3], by Daniel H. Pink, and to overhaul the rigid processes and products.

> Mature self-organizing, self-managed, and cross-functional teams thrive on autonomy, mastery, and purpose." --Drive, Daniel H. Pink.

Getting the culture--the people--right was the first step to embrace DevOps. The community implemented the [Scrum][4] framework, used [kanban][5] to improve the engineering process, and adopted visualization to improve transparency, awareness, and most important, trust. With self-organization of teams, the traditional hierarchy and chain-of-command disappeared. Self-management encouraged teams to actively monitor and evolve their own process.

In April 2010, the community took another pivotal step by switching and committing its culture, process, and products to the cloud. While the core focus of the free "by-the-community-for-the-community" [solutions][6] remains on guidance and filling gaps, there's a growing investment in open source solutions (OSS) to research and share outcomes from the DevOps transformations.

Continuous integration (CI) and continuous delivery (CD) replaced rigid manual processes with automated pipelines. This empowered teams to deploy solutions to canary and early-adopter users without intervention from program management. Adding telemetry enabled teams to watch their solutions and often detect and address unknown issues before users noticed them.

The DevOps transformation is an ongoing evolution, using experiments to explore and validate people, process, and product innovations. Recent experiments introduced pipeline innovations that are continuously improving the value flow. Scanning components automatically, continuously, and silently checks security, licensing, and quality of open source components. Deployment rings and feature flags enable teams to have fine-grained control of features for all or specific users.

In October 2017, the community moved most of its private version control repositories to [GitHub][7]. Transferring ownership and administration responsibilities for all repositories to the ALM DevOps Rangers community gives the teams autonomy and an opportunity to energize the broader community to contribute to the open source solutions. Teams are empowered to deliver quality and value to their end users.

### Benefits and accomplishments

Embracing DevOps enabled the Ranger community to become nimble, realize faster-to-market and quicker-to-learn-and-react processes, reduce investment of precious time, and proclaim autonomy.

Here's a list of our observations from the transition, listed in no specific order:

  * Autonomy, mastery, and purpose are core.
  * Start with something tangible and iterate--avoid the big bang.
  * Tangible and actionable metrics are important--ensure it does not turn into noise.
  * The most challenging parts of transformation are the people (culture).
  * There's no blueprint; every organization and every team is unique.
  * Transformation is continuous.
  * Transparency and visibility are key.
  * Use the engineering process to reinforce desired behavior.



Table of transformation changes:

PAST CURRENT ENVISIONED Branching Servicing and release isolation Feature Master Build Manual and error prone Automated and consistent  Issue detection Call from user Proactive telemetry  Issue resolution Days to weeks Minutes to days Minutes Planning Detailed design Prototyping and storyboards  Program management 2 program managers (PM) 0.25 PM 0.125 PM Release cadence 6 to 12 months 3 to 5 sprints Every sprint Release Manual and error prone Automated and consistent  Sprints 1 month 3 weeks  Team size 10 to 15 2 to 5  Time to build Hours Seconds  Time to release Days Minutes

But, we're not done! Instead, we're part of an exciting, continuous, and likely never-ending transformation.

If you'd like to learn more about our transformation, positive experiences, and known challenges that need to be addressed, see "[Our journey of transforming to a DevOps culture][8]."

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/devops-rangers-transformation

作者：[Willy Schaub][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/wpschaub
[1]:https://aka.ms/vsaraboutus
[2]:http://donovanbrown.com/post/what-is-devops
[3]:http://www.danpink.com/books/drive/
[4]:http://www.scrumguides.org/scrum-guide.html
[5]:https://leankit.com/learn/kanban/what-is-kanban/
[6]:https://aka.ms/vsarsolutions
[7]:https://github.com/ALM-Rangers
[8]:https://github.com/ALM-Rangers/Guidance/blob/master/src/Stories/our-journey-of-transforming-to-a-devops-culture.md
