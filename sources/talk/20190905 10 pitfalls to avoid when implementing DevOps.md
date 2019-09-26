[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 pitfalls to avoid when implementing DevOps)
[#]: via: (https://opensource.com/article/19/9/pitfalls-avoid-devops)
[#]: author: (Mehul Rajput https://opensource.com/users/mehulrajputhttps://opensource.com/users/daniel-ohhttps://opensource.com/users/genekimhttps://opensource.com/users/ghaff)

10 pitfalls to avoid when implementing DevOps
======
Make your DevOps implementation journey smoother by avoiding the
mistakes others have made.
![old postcard highway ][1]

In companies of every size, software is increasingly providing business value because of a shift in how technology teams define success. More than ever, they are defined by how the applications they build bring value to their customers. Tickets and stability at the cost of saying no are no longer the key value of IT. It's now about increasing developer velocity by partnering with the business.

In order to keep up with this faster pace, leading technology professionals are building software with precision and embracing standards of continuous delivery, integration, and DevOps. According to [Shanhong Liu][2], "As of 2018, only nine percent of technology professionals responsible for the development and quality of web and mobile applications stated that they had not adopted DevOps and had no plans to do so."

A significant value in a [DevOps culture][3] is to accept failure as a part of the journey toward value. For software, the journey comes in the form of [continuous delivery][4] with the expectation that we regularly release code. The fast pace ensures failure, but it also ensures that when you do fail, you learn from your mistakes and adapt quickly. This is how you grow as a business: you get more insights and let them guide you toward success.

Since those who have already adopted DevOps have made mistakes, you can use their experience to learn and avoid repeating the same mistakes. In the spirit of DevOps and open source—rapid iteration, building upon the work (and mistakes) of those who have gone before—following are some of the most common mistakes businesses encounter on their DevOps journey and how to work through them.

### 1\. Out-of-order delivery

Sometimes, developers will perform continuous delivery (CD) and continuous integration (CI) simultaneously to accelerate automated testing and feedback cycles. CI/CD as a practice has a lot of benefits when it comes to the pace of software delivery. The risk is that incorrect code configurations may be delivered to production environments without enough exploration on their impact, negating the value of automated testing before expansion.

I believe manual confirmation is still essential before code goes all the way through the software delivery cycle. There must be a pre-production stage—a layer of deployment and testing before production—that allows developers to correct and rectify errors that users could face if the code were pushed directly to production.

![Software delivery cycle][5]

It is extremely important to put monitoring in place before code reaches the end user. For instance, structuring the CD pipelines so testing is done alongside development will ensure that changes are not deployed automatically.

While DevOps standards declare that teams must expand beyond silos, deployment should always be validated by those familiar with the code that comes out at the end of the pipeline. This mandates a thorough examination before code reaches customers.

### 2\. Misunderstanding the DevOps title

Some organizations are bewildered about the DevOps title. They believe a DevOps engineer's object is to solve all problems associated with DevOps—even when DevOps means collaboration across Developers and Operators.

The way DevOps integrates development and operations roles can be a difficult career progression. Developers require more understanding of how their application runs in order to keep it running and potentially be on call for support if it goes down. Operations must become an expert on how to scale and understand the metrics that fit inside a larger [monitoring and observability strategy][6].

DevOps, in practice, helps companies accelerate time-consuming tasks in IT operations. For example, automating testing provides developers with faster feedback, and automating integration incorporates developers' changes more quickly into the codebase. DevOps may also be asked to automate procedures around collecting, expanding, and running apps.

Your organization's fundamental needs dictate whether your DevOps professionals' skill sets need to be stronger in operations or development, and this information must align with how you select or hire your DevOps team. For instance, it is important to prioritize past software development and scripting skills when automation is key (instead of requiring expertise around containerization). Hire for your unique DevOps experience needs, and let people learn the other skills on the job. If you hire people who are ready to learn, you will build the best possible team for your organization.

### 3\. Inflexibility around DevOps procedures

While DevOps principles provide a foundation, each organization must be ready to customize their journey for their desired outcomes. Companies need to make sure that, while the core DevOps pillars stay steady during implementation, they create internal modifications that are essential in measuring their predicted results.

It is important to master the fundamentals of DevOps, especially the [CALMS][7] (Culture, Automation, Lean, Measurement, and Sharing) pillars, to build a foundation for technology advancement. But there is no one-size-fits-all DevOps implementation. By recognizing that, the DevOps team can build a plan to address the key reason for the initiative and build from past failed results. Teams should be ready to modify their plan while staying within the recommendations of the fundamental DevOps principles.

### 4\. Selecting speed over quality

Many companies concentrate on product delivery without paying enough attention to product quality. If the effort's key performance indicators (KPIs) center only on time to production, it is easy for quality to fall off in the process. Endpoints that could monitor performance are left for future versions, and software that is not production-ready is seen as a success because it was pushed rapidly forward.

In a fast-paced market, teams can't afford to provide the best product quality with the time requirements dictated by either the customer or internal demand. Many companies are hurrying to get and finish as many DevOps projects as possible within a shorter time span to keep their position in a competitive market. That may sound like a good idea, but expecting DevOps to be a quick journey may result in more pain than gain.

Achieving both speed and quality improvement is an essential DevOps value. It is not achieved easily and requires operators and developers to write testing in new and improved ways. When done well, quality and speed improve simultaneously.

### 5\. Building a dedicated DevOps team

Theoretically, it makes sense to build a dedicated team to concentrate on training the newest professionals in IT. The movement to complete a DevOps journey must be hassle-free and seamless, right? But two issues quickly arise:

  * Existing quality assurance (QA), operations, and development team members feel overlooked and may try to hinder the new team's efforts.
  * This new team becomes another silo, providing new technology but not advancing the company's goals on a DevOps journey.



It is better to have a mix of new team members and current employees from QA, ops, and dev who are excited to join the DevOps initiative. The latter group has a lot of institutional knowledge that is valuable as you roll out such a large initiative.

### 6\. Overlooking databases

The database is one of the most essential technology areas overlooked while building out DevOps. New, ephemeral applications can fly through a DevOps pipeline at a speed unlike any application before. But data-hungry applications don't see the same ease of deployment.

Data snapshots in separate environments can and will drift toward inaccuracy without a concentrated effort to automate them effectively. Experts stress constant integration and code handling but fail in automating the database. Database management should be done properly, particularly for data-centric apps. The database plays an important role in such apps and may require separate expertise to automate it alongside other applications.

### 7\. Insufficient incident-handling procedures

In case something goes wrong (and it will), DevOps teams should have incident-handling procedures in place. Incident handling should be a continuous and active procedure clearly outlined for consistency and to avoid error. This means that in order for an incident-handling process to be documented, you must capture and describe the incident-response requirements. There is a lot of research into runbook documentation and [blameless post-mortems][8] that is important to learn to be successful.

### 8\. Insufficient knowledge of DevOps

Although acceptance of DevOps has expanded rapidly in recent years, application experts may be working without precise quality-control procedures. The team's ability to do all the technical, cultural, and process changes needed to succeed in DevOps sometimes falls short.

It's a wise move to adopt DevOps practices, but success requires ample experience and preparation. In some cases, getting the right expertise to meet your requirements means hiring outside experts (disclaimer: I manage a DevOps consultancy). These trained experts should have certifications in the required technologies, and companies should abstain from making rapid DevOps decisions without having a good handle on outcomes.

### 9\. Neglecting security

Security and DevOps should move side-by-side. Many organizations dismiss security guidelines because it's hard, and a DevOps journey can be hard enough. This leads to issues, such as initially maximizing the output of developers and later realizing that they neglected to secure those applications. Take security seriously, and look into [DevSecOps][9] to see if it makes sense to your organization.

### 10\. Getting fatigued while implementing DevOps

If you start a DevOps team with the goal to go from one product deployment a year to 10 pushes in a week, it will likely fail. The path to get to an arbitrary metric that looks good in a presentation will not motivate the team. DevOps is not a simple technology movement; it's a huge cultural upgrade.

The larger the enterprise, the longer it may take to get DevOps practices to stick. You should apply your DevOps methodology in a phased and measured approach with realistic results as milestones to celebrate. Train your employees, and schedule ample breaks before starting the initial round of application deployments. The first DevOps pipeline can be slow to achieve. That's what continuous improvement looks like in real life.

### The bottom line

Companies are rapidly moving towards DevOps to keep pace with their competition but make common mistakes in their implementations. To avoid these pitfalls, plan precisely and apply the right strategies to achieve a more successful DevOps outcome.

Just as with any transformational and disruptive movement, DevOps can be misunderstood or...

Is DevOps fundamentally about changing culture in an IT organization? That seemingly simple...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/pitfalls-avoid-devops

作者：[Mehul Rajput][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mehulrajputhttps://opensource.com/users/daniel-ohhttps://opensource.com/users/genekimhttps://opensource.com/users/ghaff
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/road2.jpeg?itok=chTVOSil (old postcard highway )
[2]: https://www.statista.com/statistics/673505/worldwide-software-development-survey-devops-adoption/
[3]: https://www.linkedin.com/pulse/10-facts-stats-every-devops-enthusiast-must-know-pavan-belagatti-/
[4]: https://opensource.com/article/19/4/devops-pipeline
[5]: https://opensource.com/sites/default/files/uploads/devopsmistakes_pipeline.png (Software delivery cycle)
[6]: https://opensource.com/article/18/8/now-available-open-source-guide-devops-monitoring-tools
[7]: https://whatis.techtarget.com/definition/CALMS
[8]: https://opensource.com/article/19/4/psychology-behind-blameless-retrospective
[9]: https://opensource.com/article/19/1/what-devsecops
