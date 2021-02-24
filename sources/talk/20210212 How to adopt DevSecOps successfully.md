[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to adopt DevSecOps successfully)
[#]: via: (https://opensource.com/article/21/2/devsecops)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

How to adopt DevSecOps successfully
======
Integrating security throughout the software development lifecycle is
important, but it's not always easy.
![Target practice][1]

Adopting [DevOps][2] can help an organization transform and speed how its software is delivered, tested, and deployed to production. This is the well-known "DevOps promise" that has led to such a large surge in adoption.

We've all heard about the many successful DevOps implementations that changed how an organization approaches software innovation, making it fast and secure through agile delivery to get [ahead of competitors][3]. This is where we see DevOps' promises achieved and delivered.

But on the flipside, some DevOps adoptions cause more issues than benefits. This is the DevOps dilemma where DevOps fails to deliver on its promises.

There are many factors involved in an unsuccessful DevOps implementation, and a major one is security. A poor security culture usually happens when security is left to the end of the DevOps adoption process. Applying existing security processes to DevOps can delay projects, cause frustrations within the team, and create financial impacts that can derail a project.

[DevSecOps][4] was designed to avoid this very situation. Its purpose "is to build on the mindset that 'everyone is responsible for security…'" It also makes security a consideration at all levels of DevOps adoption.

### The DevSecOps process

Before DevOps and DevSecOps, the app security process looked something like the image below. Security came late in the software delivery process, after the software was accepted for production.

![Old software development process with security at the end][5]

(Michael Calizo, [CC BY-SA 4.0][6])

Depending on the organization's security profile and risk appetite, the application might even bypass security reviews and processes during acceptance. At that point, the security review becomes an audit exercise to avoid unnecessary project delays.

![Security as audit in software development][7]

(Michael Calizo, [CC BY-SA 4.0][6])

The DevSecOps [manifesto][8] says that the reason to integrate security into dev and ops at all levels is to implement security with less friction, foster innovation, and make sure security and data privacy are not left behind.

Therefore, DevSecOps encourages security practitioners to adapt and change their old, existing security processes and procedures. This may be sound easy, but changing processes, behavior, and culture is always difficult, especially in large environments.

The DevSecOps principle's basic requirement is to introduce a security culture and mindset across the entire application development and deployment process. This means old security practices must be replaced by more agile and flexible methods so that security can iterate and adapt to the fast-changing environment. According to the DevSecOps manifesto, security needs to "operate like developers to make security and compliance available to be consumed as services."

DevSecOps should look like the figure below, where security is embedded across the delivery cycle and can iterate every time there is a need for change or adjustment.

![DevSecOps considers security throughout development][9]

(Michael Calizo, [CC BY-SA 4.0][6])

### Common DevSecOps obstacles

Any time changes are introduced, people find faults or issues with the new process. This is natural human behavior. The fear and inconvenience associated with learning new things are always met with adverse reactions; after all, humans are creatures of habit.

Some common obstacles in DevSecOps adoption include:

  * **Vendor-defined DevOps/DevSecOps:** This means principles and processes are focused on product offerings, and the organization won't be able to build the approach. Instead, they will be limited to what the vendor provides.
  * **Nervous people managers:** The fear of losing control is a real problem when change happens. Often, anxiety affects people managers' decision-making.
  * **If ain't broke, don't fix it:** This is a common mindset, and you really can't blame people for thinking this way. But the idea that the old way will survive despite new ways of delivering software and solutions must be challenged. To adapt to the agile application lifecycle, you need to change the processes to support the speed and agility it requires.
  * **The Netflix and Uber effect:** Everybody knows that Netflix and Uber have successfully implemented DevSecOps; therefore, many organizations want to emulate them. Because they have a different culture than your organization, simply emulating them won't work.
  * **Lack of measurement:** DevOps and DevSecOps transformation must be measured against set goals. Metrics might include software delivery performance or overall organization performance over time.
  * **Checklist-driven security:** By using a checklist, the security team follows the same old, static, and inflexible processes that are neither useful nor applicable to modern technologies that developers use to make software delivery lean and agile. The introduction of the "[as code][10]" approach requires security people to learn how to code.
  * **Security as a special team:** This is especially true in organizations transitioning from the old ways of delivering software, where security is a separate entity, to DevOps. Because of the separations, trust is questionable among devs, ops, and security. This will cause the security team to spend unnecessary time reviewing and governing DevOps processes and building pipelines instead of working closely with developers and ops teams to improve the software delivery flow.



### How to adopt DevSecOps successfully

Adopting DevSecOps is not easy, but being aware of common obstacles and challenges is key to your success.

Clearly, the biggest and most important change an organization needs to make is its culture. Cultural change usually requires executive buy-in, as a top-down approach is necessary to convince people to make a successful turnaround. You might hope that executive buy-in makes cultural change follow naturally, but don't expect smooth sailing—executive buy-in alone is not enough.

To help accelerate cultural change, the organization needs leaders and enthusiasts that will become agents of change. Embed these people in the dev, ops, and security teams to serve as advocates and champions for culture change. This will also establish a cross-functional team that will share successes and learnings with other teams to encourage wider adoption.

Once that is underway, the organization needs a DevSecOps use-case to start with, something small with a high potential for success. This enables the team to learn, fail, and succeed without affecting the organization's core business.

The next step is to identify and agree on the definition of success. The DevSecOps adoption needs to be measurable; to do that, you need a dashboard that shows metrics such as:

  * Lead time for a change
  * Deployment frequency
  * Mean time to restore
  * Change failure



These metrics are a critical requirement to be able to identify processes and other things that require improvement. It's also a tool to declare if an adoption is a win or a bust. This methodology is called [event-driven transformation][11].

### Conclusion

When implemented properly, DevOps enables an organization to deliver software to production quickly and gain advantages over competitors. DevOps allows it to fail small and recover faster by enabling flexibility and efficiency to go to market early.

In summary, DevOps and DevSecOps adoption needs:

  * Cultural change
  * Executive buy-in
  * Leaders and enthusiasts to act as evangelists
  * Cross-functional teams
  * Measurable indicators



Ultimately, the solution to the DevSecOps dilemma relies on cultural change to make the organization better.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/devsecops

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/target-security.png?itok=Ca5-F6GW (Target practice)
[2]: https://opensource.com/resources/devops
[3]: https://www.imd.org/research-knowledge/articles/the-battle-for-digital-disruption-startups-vs-incumbents/
[4]: http://www.devsecops.org/blog/2015/2/15/what-is-devsecops
[5]: https://opensource.com/sites/default/files/uploads/devsecops_old-process.png (Old software development process with security at the end)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/devsecops_security-as-audit.png (Security as audit in software development)
[8]: https://www.devsecops.org/
[9]: https://opensource.com/sites/default/files/uploads/devsecops_process.png (DevSecOps considers security throughout development)
[10]: https://www.oreilly.com/library/view/devopssec/9781491971413/ch04.html
[11]: https://www.openshift.com/blog/exploring-a-metrics-driven-approach-to-transformation
