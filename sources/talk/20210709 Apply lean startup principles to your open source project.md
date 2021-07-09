[#]: subject: (Apply lean startup principles to your open source project)
[#]: via: (https://opensource.com/article/21/7/lean-startup-open-source)
[#]: author: (Ip Sam https://opensource.com/users/ipkeisam)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Apply lean startup principles to your open source project
======
Lean startup principles help you manage your open source project with
efficiency and success.
![Mobile devices are a big part of our daily lives][1]

There are a lot of benefits to starting an open source project. In general, open source projects benefit from collaboration, adoption, transparency, lower ownership costs, development best practices, more contributors and reviewers, and better quality.

When you contribute to open source projects, you can build your technical and leadership skills, get good experience for your resume, learn new development tools, understand industry trends, work with top engineers around the world, gain mentorship opportunities, meet people with similar interests, improve your people skills, and more.

When you develop your own open source project, you are much like the CEO of a startup company, and many startups use lean principles. This article demonstrates how you can apply lean startup principles to develop and advance your open source projects.

### Come up with a good open source idea

When brainstorming a good open source idea, consider three domains: industry, inventory, and customers. You want to come up with an idea at the intersection of these domains. For example, I am working on an open source project for the hybrid cloud. Cloud computing is my industry. Inventory could be the set of Ansible playbooks available for the cloud computing industry. The customers could be my OpenShift clients interested in using Ansible playbooks to set up their hybrid cloud infrastructure. These get me to the intersection of the three domains, and this could be a great open source idea.

![A good open source idea][2]

(Ip Sam, [CC BY-SA 4.0][3])

Once you identify your open source idea, start developing a proof of concept (PoC) prototype project, put it into a Git repository, and create the project's backlog:

  1. Start a simple PoC prototype.
  2. Push the PoC into a public GitHub repository.
  3. Create your README, LICENSE, CONTRIBUTING, and CODE_OF_CONDUCT files.
  4. Set up high-level epics and stories in Jira.



Next, start working on positioning your open source idea for long-term success. Consider your competitors' offerings, customers' needs, and company capabilities. For example, if I know customers want to do cloud automation in an OpenShift cluster, I understand the customers' needs. My team's capabilities are producing Ansible automation to automate OpenShift cluster installation and upgrades. And I need to make sure no competitors are doing similar work. In my open source project, I use Ansible for automation. Other companies may be using shell scripts or PowerShell scripts. Even though they are developing automation technologies, their offerings do not directly interfere with what my open source project is doing. Therefore, I can get into the sweet spot below.

![Position your open source idea][4]

(Ip Sam, [CC BY-SA 4.0][3])

### Use lean startup principles

Managing risks is important for an open source project. At any time, a project can lose funding, people, and resources. Business requirements and scope can change. Release schedules can be delayed or canceled. Timelines can change with a lot of uncertainty. As the CEO of your open source project, you can use lean startup principles to minimize risks and maximize profits for your project.

The lean startup principles focus on developing the minimal viable project (MVP) that gives you value from production as soon as possible. It also pushes for smaller release cycles and fast iteration. Using validated learning through feedback loops from production, you can validate your open source project and make modifications as product data becomes available.

In the lean startup cycle, first, you come up with your open source idea. Then you convert your idea into code by doing a simple MVP. In between, you set up the build phase (where you build unit tests to ensure the quality of your code), continuous integration/continuous development (CI/CD) pipelines for automated deployments, the cloud computing infrastructure, the developer sandbox, and other development best practices. These are part of your build phase to enable your developers to code faster.

You need to measure everything from coding to production data. For example, measure the MVP's usability to make sure end users can use it properly. Use monitoring and alerts so that you know when production issues occur. Static code analysis helps you catch code issues and security vulnerabilities. Finally, use feedback data from product users and stakeholders; it helps you measure faster.

All of this data enables you to learn about your project. You can learn faster by doing more customer interviews or working with customers during development cycles. You can also learn faster by setting up cross-functional teams with other business departments. As you go through the lean startup cycles again in the second iteration, you should be able to code faster, measure faster, and learn faster than in the first iteration.

![The lean startup cycle diagram][5]

(Ip Sam, [CC BY-SA 4.0][3])

Lean startup methodologies help you create an idea, formulate hypotheses from your idea, create an MVP, and test the MVP to validate your hypotheses. Then you go through what you learned to fine-tune your hypotheses and start your second iteration.

![Lean startup methodologies][6]

(Ip Sam, [CC BY-SA 4.0][3])

Lean startup is a combination of customer development and agile development. It supports faster iterative development cycles and incremental product development.

### Leverage design thinking, lean startup, and agile

![Lean startup and agile][7]

(Ip Sam, [CC BY-SA 4.0][3])

The figure below shows the three cycles of design thinking, lean startup, and agile. The first part is always design thinking (the green cycle), where you gather requirements to define your idea. Often, these come from product managers. Then you move to the lean startup (blue) cycle, where you come up with prototypes, do some experiments, and go through the learning period. Based on your learning, you can enter the agile (yellow) cycle. These often involve the typical two-week sprints, coming up with stories in your product backlogs, bringing stories from the backlog to sprint planning, doing sprint execution, moving stories to completion, and shipping incremental products to production by doing a deployment. At the end, you have the sprint review, sprint demo, and sprint retrospective. After completing the agile cycle, you go back to the blue cycle to begin the build process, measurement, and the next iteration.

![Design thinking, lean startup, and agile cycles together][8]

(Ip Sam, [CC BY-SA 4.0][3])

Often, you have multiple MVPs before you get to the final product. Use customer feedback and product data to shape the next MVP version.

![Lean startup MVPs][9]

(Ip Sam, [CC BY-SA 4.0][3])

The project management triangle helps you maintain product quality. Scope, cost, and time are the corners of the triangle. The shape of the triangle represents product quality. If you reduce your scope and costs, the triangle's shape will change, meaning your quality will decrease.

![Lean project management][10]

(Ip Sam, [CC BY-SA 4.0][3])

Lean startup principles can help you manage scope, cost, and time. By doing each release with the lean startup principles, you can get to incremental changes, small release cycles, small release feature sets, and feedback loops. For each idea, measure if it works, is making money, and generating business value. If your answer to each is yes, begin the reinvestment process to generate more new ideas.

![Lean releases][11]

(Ip Sam, [CC BY-SA 4.0][3])

### Recruit contributors and build a team

Project marketing is an important starting point for recruiting contributors and investors into your open source project. Learn how to sell your project, present it at major conferences and events, and demo your PoC or MVP at local developer meetups. If you work for a large organization, you may be able to turn it into an internal project.

Different people with different backgrounds, working styles, and cultures will come into your project, and your goal is to develop them into a high-performing team. The team will go through learning curves as it finds how to work together. For example, when you get new team members, your team's current working style may not fit them well, and you might get resistance. When individuals do not want to get out of their comfort zone to learn new skills, you might also get resistance. This might create a chaos situation, where team members disagree about how to do things. The team may split into different camps with different ideas. This brings team performance to the lowest point of the team maturity curve. When you reach the lowest point, listen to team members and work to understand their ideas and why people push back, then transform the different ideas into action items. You can leverage voting systems or use product data to validate the ideas. As conflicts are resolved, the team members will start to work better together and integrate their different ways of working into the overall team culture. This is where your team will reach a new status quo and team maturity.

![Team maturity graph][12]

(Ip Sam, [CC BY-SA 4.0][3])

The lean team management method can help you achieve team maturity. It leverages four levers of control: believe, boundary, measurement, and interactive.

  * **Believe:** This is your team's set of core values. For example, my team believes in quality as a requirement for each product. Therefore, quality is the team's core value.
  * **Boundaries:** These relate to setting rules based on core values. For example, my team believes in quality, and we set rules to require unit and integration tests for each code change before committing it into the Git repository. This becomes a boundary for the team. If somebody checks in code without a test, that person is not following the rule, and it's time for you to educate the team members.
  * **Measurement:** This includes key performance indicators (KPIs), targets, and budget. For example, my team's KPIs include measuring story cycle time in the sprint, story release time, defect rates, test coverage rate, and product issues.
  * **Interactive:** The interactive process is where you revise the product based on your last cycle. Then you start the next iteration for the next set of core values.



![Lean team management][13]

(Ip Sam, [CC BY-SA 4.0][3])

### Minimize waste

Eight types of waste—defects, overproduction, waiting, non-utilized talent, transportation, inventory, motion, and extra processing—in your development lifecycle harm team productivity.

  * **Defects:** It is cheaper to fix a defect early in the development lifecycle, so many teams use [test-driven development][14] (TDD) to reduce defects.
  * **Overproduction:** If you are doing more than what you are asked to do, you are over-producing. This is tied to scope in stories; the scope should be small so that you do not risk overproduction.
  * **Waiting:** Waiting is not efficient and wastes your team's resources. During sprint daily standups, identify stories that are blocked or waiting on external dependencies. As a scrum master, it is your job to help escalate these blocking issues to reduce waiting time.
  * **Non-used talent:** Unused talent is always a waste, so ensure everyone on the team has enough work to do.
  * **Transportation:** If you are moving projects from one team to another, you introduce more learning curves and ramp-up time. Try to reduce how much projects are transported.
  * **Inventory:** Too much inventory that can't be sold is a waste. The inventory takes up space in your storage and consumes management time.
  * **Motion:** Excessive unnecessary movements, such as going to meetings in different locations or even commuting, are a waste. Many organizations have a work-from-home policy to reduce motion waste.
  * **Extra processing:** If you are doing the same validation test repeatedly on the same product, this extra processing might be a waste. Come up with a process flow in your development cycle so that you avoid extra processing.



![Lean waste management][15]

(Ip Sam, [CC BY-SA 4.0][3])

As the CEO of your open source project, your time is very valuable. If it's your job, you only have eight hours a day. If it's your side hustle, your time is even more limited. Lean time management involves a very simple matrix, as shown below. If you have a task that's important to the vision and must be done by you, go ahead and do it. If the task is important to the vision but can be done by a team member, delegate it. If the task is not important to the vision and must be done by you, minimize the time you spend on it. Finally, if the task is not vision-important and can be done by others, it is a waste of resources.

![Lean time management][16]

(Ip Sam, [CC BY-SA 4.0][3])

### Develop a lean strategy

Lean strategy is a good way to analyze your open source product to come up with a long-term strategy. Ask yourself these questions: If your open source product did not exist, would your customers suffer any real loss? If so, what type of loss would it be? Is it difficult for your customers to replace your products to meet their needs? For example, if I am doing Ansible playbooks for cluster automation, can my customers replace my Ansible playbooks using a set of shell scripts? What would be the impact on the operational costs and learning curve?

![Lean strategy questions][17]

(Ip Sam, [CC BY-SA 4.0][3])

The lean strategy hierarchy is (from bottom to top) mission, values, vision, strategy, and balanced scorecard. At the base is your mission: Why do your open source project and team exist? What is your mission statement? Next are the values your team believes in. Vision is how you expect your product to evolve in the next two years. Strategy requires strategic planning. At the very top is the balanced scorecard, where you implement and monitor the plan for your open source project.

![Lean strategy hierarchy][18]

(Ip Sam, [CC BY-SA 4.0][3])

Your lean strategy statement includes your objective, scope, and competitive advantage. The objective defines what your strategy is designed to do and achieve in a specific time frame. The scope identifies the strategy requirements for your open source product to be successful. Your competitive advantage is the core of your strategy. How will you compete with competitors using this product and your strategy to achieve your objective?

![Lean strategy statement][19]

(Ip Sam, [CC BY-SA 4.0][3])

Pricing and differentiation are two important factors for achieving profit. You want to offer low price and high differentiation. Ask yourself: How is your product different from your competitors'? What are some features that are unique to your product? If you can maximize differentiation and minimize pricing, you will get to the profit frontier line.

![Lean Profit Management][20]

(Ip Sam, [CC BY-SA 4.0][3])

### Look to the future

After running your open source project for a while and tracking everything, it's time to consider where you want to focus next on your journey as the CEO of your open source project.

Begin by assessing perspective, capability, and profit potential.

  * Perspective involves how your product fulfills customers' needs. For example, can my Ansible playbook reduce manual operations in the OpenShift cluster to save 20% of the customer's operation costs?
  * Capability is what your product can do and what new features it can offer. For example, can my Ansible playbooks operate in a way that supports OpenShift 3 and OpenShift 4 clusters? On-premises clusters versus AWS clusters?
  * Profit potential includes how much revenue your product is generating for you in a time frame. Does your product fall into the profit frontier margin in the image above?



![What's next?][21]

(Ip Sam, [CC BY-SA 4.0][3])

Open source is the future. There is a lot going on in the open source community, and many companies are moving to open source models. Open source is a great way to get people involved in your project, and lean startup principles help you manage your open source project with efficiency. It will help you and your open source project go a long way.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/lean-startup-open-source

作者：[Ip Sam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ipkeisam
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mobile-demo-device-phone.png?itok=y9cHLI_F (Mobile devices are a big part of our daily lives)
[2]: https://opensource.com/sites/default/files/uploads/1_opensourceidea.jpg (A good open source idea)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/2_positioning.jpg (Position your open source idea)
[5]: https://opensource.com/sites/default/files/uploads/3_leanstartupcycles.jpg (The lean startup cycle diagram)
[6]: https://opensource.com/sites/default/files/uploads/4_leanstartupmethodologies.jpg (Lean startup methodologies)
[7]: https://opensource.com/sites/default/files/uploads/5_leanstartupagile.jpg (Lean startup and agile)
[8]: https://opensource.com/sites/default/files/uploads/6_designthinkingleanstartupagile.jpg (Design thinking, lean startup, and agile cycles together)
[9]: https://opensource.com/sites/default/files/uploads/7_mvps.jpg (Lean startup MVPs)
[10]: https://opensource.com/sites/default/files/uploads/8_projectmanagementtriangle.jpg (Lean project management)
[11]: https://opensource.com/sites/default/files/uploads/9_leanreleases.jpg (Lean releases)
[12]: https://opensource.com/sites/default/files/uploads/10_teammaturity.jpg (Team maturity graph)
[13]: https://opensource.com/sites/default/files/uploads/11_leanteammanagement.jpg (Lean team management)
[14]: https://opensource.com/article/19/10/test-driven-development-best-practices
[15]: https://opensource.com/sites/default/files/uploads/12_leanwastemanagement.jpg (Lean waste management)
[16]: https://opensource.com/sites/default/files/uploads/13_leantimemanagement_0.jpg (Lean time management)
[17]: https://opensource.com/sites/default/files/uploads/14_leanstrategy.jpg (Lean strategy questions)
[18]: https://opensource.com/sites/default/files/uploads/15_leanstrategyhierarchy.jpg (Lean strategy hierarchy)
[19]: https://opensource.com/sites/default/files/uploads/16_leanstrategystatement.jpg (Lean strategy statement)
[20]: https://opensource.com/sites/default/files/uploads/17_profitfrontier.jpg (Lean Profit Management)
[21]: https://opensource.com/sites/default/files/uploads/18_whatsnext.jpg (What's next?)
