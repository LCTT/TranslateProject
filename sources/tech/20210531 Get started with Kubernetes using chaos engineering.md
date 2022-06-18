[#]: subject: (Get started with Kubernetes using chaos engineering)
[#]: via: (https://opensource.com/article/21/5/kubernetes-chaos)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)
[#]: collector: (lujun9972)
[#]: translator: (Donkey-Hao)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Get started with Kubernetes using chaos engineering
======
Learn the basics of chaos engineering in this first article in a series
celebrating Kubernetes' 11th birthday.
![Scrabble letters spell out chaos for chaos engineering][1]

Kubernetes is turning 11, so I'll be celebrating its birthday by giving you some open source tools that will help you cause chaos. Chaos engineering is part science, part planning, and part experiments. It's the discipline of experimenting on a system to build confidence in the system's capability to withstand turbulent conditions in production.

Before I start passing out the gifts, in this introductory article, I will explain the basics of how chaos engineering works.

### How do I get started with chaos engineering?

In my experience, the best way to start chaos engineering is by taking an incident that has happened before in production and using it as an experiment. Use your past data, make a plan to break your system in a similar way, create a repair strategy, and confirm the outcome turns out exactly how you want. If your plan fails, you have a new way to experiment and move forward toward a new way to handle issues quickly.

Best of all, you can document everything as you go, which means, over time, your entire system will be fully documented so that anyone can be on call without too many escalations and everyone can have a nice break on weekends.

### What do you do in chaos engineering?

Chaos engineering has some science behind how these experiments work. I've documented some of the steps:

  1. **Define a steady state**: Use a monitoring tool to gather data about what your system looks like functionally when there are no problems or incidents.
  2. **Come up with a hypothesis or use a previous incident:** Now that you have defined a steady state, come up with a hypothesis about what would happen (or has happened) during an incident or outage. Use this hypothesis to generate a series of theories about what could happen and how to resolve the problems. Then you can start a plan to purposely cause the issue.
  3. **Introduce the problem:** Use that plan to break your system and begin real-world testing. Gather your broken metrics' states, use your planned fix, and keep track of how long it takes before you reach a resolution. Make sure you document everything for future outages.
  4. **Try to disprove your own hypothesis:** The best part of experimenting is trying to disprove what you think or plan. You want to create a different state, see how far you can take it, and generate a different steady state in the system.



Make sure to create a control system in a steady state before you generate the broken variables in another system. This will make it easier to spot the differences in various steady states before, during, and after your experiment.

### What do I need for chaos engineering?

The best tools for beginning chaos engineering are:

  * Good documentation practices
  * A monitoring system to capture your system in a steady state and a non-steady state
    * Grafana
    * Prometheus
  * Chaos engineering tools
    * Chaos mesh
    * Litmus
    * And more that I will cover in future articles
  * A hypothesis
  * A plan



### Go forth and destroy

Now that you have the basics in hand, it's time to go forth and destroy your system safely. I would plan to start causing chaos four times a year and work toward monthly destructions.

Chaos engineering is good practice and a great way to keep your internal documentation up to date. Also, new upgrades or application deployments will be smoother over time, and your daily life will be easier with Kubernetes administration.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/kubernetes-chaos

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brett-jordan-chaos-unsplash.jpg?itok=sApp5dVd (Scrabble letters spell out chaos for chaos engineering)
