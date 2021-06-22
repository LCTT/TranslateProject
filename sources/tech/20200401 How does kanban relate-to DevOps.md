[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How does kanban relate to DevOps?)
[#]: via: (https://opensource.com/article/20/4/kanban-devops)
[#]: author: (Willy-Peter Schaub https://opensource.com/users/wpschaub)

How does kanban relate to DevOps?
======
Reduce waste, optimize the flow of value, and continuously deliver value
to delighted users.
![two women kanban brainstorming and brainmapping with post-it notes on a whiteboard ][1]

Kanban is nothing new; in fact, it predates most readers of this article. Its age becomes apparent when we add the year Toyota introduced kanban in its main plant machine shop (1953) to the timeline image from our [analyzing the DNA of DevOps][2] article.

![DevOps timeline][3]

I have intuitively been using kanban, in one form or the other, for more than two decades to track personal plans, engineering projects, and digital transformations. Only in the past few weeks have I pondered the origins, power, and synergy of kanban with other frameworks and systems, while introducing teams to kanban and helping them embrace it as a powerful system in our common engineering system.

### What is kanban?

Kanban means "visual signal" and has its roots in the Toyota manufacturing industry. It was developed by [Taiichi Ohno][4] to improve manufacturing efficiency. When we jump a few decades into the future, kanban complements agile and lean, often used with frameworks such as scrum, Scaled Agile Framework, and Disciplined Agile to visualize and manage work.

![Kanban complements agile and lean][5]

You can explore the many interpretations of kanban on the internet, in books, and in vibrant discussions with other engineers who have embraced the system. In the context of our common collaboration and engineering system, kanban delivers four pivotal practices:

  * **Visualize work:** We visualize all work and look for triggers such as cards turning **red** when the work they represent is blocked or has been dormant for more than two days.
  * **Limit work in progress:** We agree on and enforce (soft) work-in-progress limits to encourage reduced batch sizes and manage queue lengths.
  * **Focus on flow:** We _pull_ not push work, which helps us to defer commitment until we meet our definition of done (_DoD_) and we have the capacity to commit to the next _activity_.
  * **Continuous improvement:** It is important to measure work from when it enters our backlog, how long it takes to get through the process (lead time), and how efficient we are working (cycle/lead time). This enables us to continuously inspect and improve how we work and track progress.



![Kanban practices and terminology][6]

We use colorful, visual cards to represent activities that flow through one or more _activities_ in one of many _swim lanes_. Each kanban column represents an activity, and each swim lane represents a person, group, or another bucket to segment the cards. There are no rules for the color of the cards, but **red** typically signals a problem. But remember to combine color with a meaningful icon to visualize special states for users who are color-blind.

> "_We should defer commitment until our Definition of Ready (DOR) is met so that we can ensure that our Definition of Done (DOD) is achieved sooner and with high quality. I like the two distinct terms (DOR and DOD) because the [project owner] should be accountable for the DOR while the team can take ownership of the DOD_." —[Mathew Mathai][7]

I often use this analogy to explain the difference between _lead_ and _cycle_ time to new teams: Imagine you walk into a restaurant. You sit down, study the menu, and decide what you would like to drink and eat. When the waiter takes your order, the _lead_ cycle time starts ticking. When the bar starts pouring your favorite potion and the kitchen starts preparing your meal, the _cycle_ time starts ticking. As the order arrives at your table, both the lead and cycle time are stopped if (and only if) you are satisfied.

Therefore, the _lead_ time measures how long you, the customer, had to wait until you received your order. The _cycle_ time measures the process time of an activity to prepare your order. From a customer perspective, the _lead_ time is important.

It is important to _make your policies explicit_, such as when you start measuring lead and cycle times. Some customers start their "impatience" clock when they enter the restaurant, while others start the clock when they place their order. In both cases, they need to understand how you measure your flow to avoid misunderstandings, unfeasible expectations, and disappointment.

This image is extracted from one of our information transfer posters, and it summarizes key learnings when we started adopting the kanban system.

![Key kanban learnings][8]

### What about DevOps?

In _[Using PowerShell to automate Linux, macOS, and Windows processes][9]_, we briefly introduced value-stream mapping. It enables us to measure individual and total lead times, cycle times, efficiency, and quality and unearth different activities, groups, and silos that cancel out each other.

![value-stream mapping][10]

You will notice a similarity between the kanban board and the value-stream mapping images. Both _visualize_ and _focus_ on the flow of activities represented by individual cards pulled across a visual board.

![Continuous delivery pipeline][11]

Continuous flow and efficiency are core to a healthy DevOps mindset. It transforms into a continuous delivery pipeline, as shown above, which unites different teams, such as business, development, security, and quality assurance, to implement ideas from ideation to production. Continuously measuring and streamlining the delivery pipeline not only helps improve the flow of value, but also the quality of value.

It should be evident that (similar to kanban) the focus here is on flow. Flipping back and forth between activities is frowned upon in kanban and impractical with continuous delivery pipelines. It reminds me of a recent whiteboard discussion where we discussed the challenge of visualizing and managing the flow of work that requires two teams.

![Dividing a job between two teams][12]

As shown here, we slice a job that requires team X to perform activities, then team Y, and again team X, into three stories. The three stories are visualized by three cards on two kanban boards, flowing from A to B to C, with clear ownership by team X and Y, which we can measure independently as lead and cycle time.

We are drifting into another exciting topic of flow optimization … let's get back to the original question.

### What is the relationship between kanban and DevOps?

[Donovan Brown][13] defines DevOps as "_the union of people, process, and products to enable continuous delivery of value to our end users._"

When we unpack this definition, we realize that the core of the DevOps [mindset][14] is to continuously deliver value and delight our customers.

  * _"Feedback from stakeholders is essential."_
  * _"Improve beyond the limits of today's processes."_
  * _"No new silos to break down silos."_
  * _"Knowing your customers means cross-organization collaboration."_
  * _"Inspire adoption through enthusiasm."_



The kanban system helps us visualize and improve the efficiency of value delivery, resulting in delighted customers. I argue that if you are comfortable with kanban, you will enjoy the full benefits of DevOps through _visualization_, _flow improvement_, _feedback_, and _continuous innovation_.

We have collaboration at its finest—_synergy_**,** or is that _symbiosis_?

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/kanban-devops

作者：[Willy-Peter Schaub][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/wpschaub
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/whiteboard-brainstorming-brainmapping-design-thinking-postits-kanban.png?itok=Is2Tg1Jk (Brainstorming with post-it notes on a whiteboard)
[2]: https://opensource.com/article/18/11/analyzing-devops
[3]: https://opensource.com/sites/default/files/uploads/devops-timeline.png (DevOps timeline)
[4]: https://en.wikipedia.org/wiki/Taiichi_Ohno
[5]: https://opensource.com/sites/default/files/uploads/kanban-agile-lean-devops.png (Kanban complements agile and lean)
[6]: https://opensource.com/sites/default/files/uploads/kanban-practices-terms.png (Kanban practices and terminology)
[7]: https://opensource.com/users/anicheinc
[8]: https://opensource.com/sites/default/files/uploads/kanban-key-learnings.png (Key kanban learnings)
[9]: https://opensource.com/article/20/2/devops-automation
[10]: https://opensource.com/sites/default/files/uploads/value-stream-mapping.png (value-stream mapping)
[11]: https://opensource.com/sites/default/files/uploads/cd-pipeline.png (Continuous delivery pipeline)
[12]: https://opensource.com/sites/default/files/uploads/splitting-jobs.png (Dividing a job between two teams)
[13]: https://www.donovanbrown.com/post/what-is-devops
[14]: https://opensource.com/article/19/5/values-devops-mindset
