[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why Spinnaker matters to CI/CD)
[#]: via: (https://opensource.com/article/19/8/why-spinnaker-matters-cicd)
[#]: author: (Swapnil Bhartiya https://opensource.com/users/arnieswap)

Why Spinnaker matters to CI/CD
======
Spinnaker provides unique building blocks to create tailor-made, and
highly-collaborative continuous delivery pipelines. Join them at
Spinnaker Summit.
![CICD with gears][1]

It takes many tools to deliver an artifact into production. Tools for building and testing, tools for creating a deployable artifact like a container image, tools for authentication and authorization, tools for maintaining infrastructure, and more. Seamlessly integrating these tools into a workflow can be transformative for an engineering culture, but doing it yourself can be a tall order.

As organizations mature, both the number of tools and the number of people managing them tend to grow, often leading to confusing complexity and fragmentation. A bespoke continuous delivery (CD) process may work at a smaller scale, but it becomes increasingly challenging to maintain and understand. It can take a long time for new engineers to discover and sort through all the tools needed to deploy even the simplest of changes.

[Spinnaker][2] was created to address this issue. It is a generalizable and extensible tool that provides users with the building blocks to create tailor-made continuous delivery pipelines. There is no need to spend time and take on increased risk inventing your own approach when you can instead use a solution that is already trusted and developed by major companies like Netflix and Google for handling the delivery of thousands of applications.

### Spinnaker's origin

Netflix used to have a fragmented continuous delivery story. Each organization's delivery system was built specifically for that org, so others were often unable to benefit from that work. Teams considered themselves unique and wove together Jenkins jobs with [Asgard][3]. All of this duplicated effort was not only wasteful but also made it difficult to keep teams savvy and up-to-date with the latest delivery best practices.

In 2014, teams agreed that a general-purpose continuous integration (CI) tool like Jenkins did not provide a suitable foundation to build a continuous delivery platform with the safety and flexibility they needed. To that end, a new tool was born. Netflix's delivery engineering team collaborated with Google to build Spinnaker, a multi-cloud continuous delivery and infrastructure management tool that would be centrally managed and flexible enough to let teams customize their own delivery, but standardized enough to bring best practices and safety to everyone. Spinnaker codifies our decades of experience writing and delivering software into something everyone can use without going through the same growing pains.

Since the widespread adoption of Spinnaker in the open source community, the maintainers have continuously added new features and integrations to make Spinnaker even more useful and sticky across companies like Netflix, Google, Airbnb, Pinterest, and Snap.

### Spinnaker in practice

With Spinnaker, you can [build flexible pipelines made up of stages][4] to deliver your software the way you need. You can have a Deploy stage, which orchestrates the creation and cleanup of new infrastructure using a blue/green strategy for zero downtime. If you want more direct control on your release process, you can add a Manual Judgment stage that waits for external confirmation. These stages can be woven together into pipelines capable of representing complex and customized delivery workflows.

[![Spinnaker pipeline][5]][6]

The flexibility of pipelines, combined with a comprehensive set of built-in stages, enabled Spinnaker to catch on across teams. One clear example of this is our [Canary][7] stage, which evaluates a set of metrics to determine if a deploy is healthy or unhealthy. Before Spinnaker, many teams could not use canaries in their deploy pipelines because it was too cumbersome to integrate with their old canary system. This "batteries-included" Canary stage was the carrot that brought a lot of teams to Spinnaker.

If you need custom behavior, stages also offer an extension point to encapsulate logic specific to your organization or team. These extensions can be open or closed source. For example, you could add custom functionality that updates the status of a Jira ticket, refreshes a cache, or snapshots a database.

### Spinnaker customization

As a generalized tool, Spinnaker can do lots of things out of the box; however, it really shines when you customize it. When you add integrations to other tools in your organization or share best practices, it becomes easier to help teams deploy and operate software safely and reliably.

![Spinnaker concepts hierarchy][8]

We've added a diverse variety of custom integrations for Spinnaker to make it sticky. The following may spark ideas for how you could customize Spinnaker to fit your organization.

#### Improve developer efficiency

One simple UI customization we've done is to have an icon next to each instance that allows you to copy the SSH command to that instance. We did that by overriding the Instance Details panel in the UI with a Netflix-specific component that takes some information from the config file (the base SSH command), inserts the instance ID into that command, and makes it available as a little clipboard button next to the instance ID.

#### Improve security

We've worked closely with our security team for the last five years to work best practices into Spinnaker. One example of that is how we create identity and access management (IAM) roles automatically for each application and use those roles to restrict who can do what in AWS, allowing each team the permissions they need to get their job done.

We make this happen using two parts: (1) we add a custom class into [Clouddriver][9] (the microservice that does cloud operations) that talks to (2) a Lambda function maintained by our security team.

For each cloud mutating operation, we check with AWS to see if an IAM role exists with that app name; if it doesn't, we check with the security service to see if we should create one. If a role needs to be created, we call that security service with the info it needs to make sure the IAM role is created successfully.

Because of this setup, we can easily control the IAM profile that every instance is launched while leaving the meat of the IAM functionality to the security team. This provides them the flexibility to change their implementation, add functionality, or do additional auditing without having to make changes to Spinnaker.

We often use the pattern of a Spinnaker hook and a resulting partner team service call. It helps to separate Spinnaker's concern, which is to serve as a delivery platform, from the concerns managed by partner teams, such as security. This separation also supports partner teams' ability to innovate independently, resulting in a better, more secure delivery experience for our users.

#### Improve traceability and auditing

A final example of a custom integration is sending a [Spinnaker event stream][10] to another service. Spinnaker does a lot of mutating operations, and often you might need to record those events for auditing or compliance purposes. We send all events to our Big Data store so other teams within the company can make use of the data.

We also manage a [PCI][11]-compliant environment. Previously, we had a co-located Spinnaker instance that ran in this isolated environment to maintain compliance. This year, we enabled the [Fiat][12] authorization microservice in Spinnaker, hardened it, and converged on maintaining all properties with a single Spinnaker.

### Conclusion

Continuous delivery is hard to do correctly. Spinnaker is a hardened and well-maintained tool (with approximately 460 merged pull requests in the last month) that has many existing integrations to popular services while also supporting custom integrations for increased flexibility. Large companies like Netflix, Google, Amazon, Nike, Cisco, and Salesforce are actively contributing to Spinnaker. Adopting Spinnaker allows you to centralize your continuous delivery and gain access to best practices. Instead of reinventing the wheel, why not join the Spinnaker community?

* * *

_If this topic interests you, come talk to users, maintainers, and other people in the delivery space at the [Spinnaker Summit][13] November 15–17 in San Diego._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/why-spinnaker-matters-cicd

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/arnieswap
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc (CICD with gears)
[2]: https://www.spinnaker.io/
[3]: https://github.com/Netflix/asgard
[4]: https://www.spinnaker.io/concepts/
[5]: https://opensource.com/sites/default/files/uploads/spinnaker_edit-pipeline.png (Spinnaker pipeline)
[6]: https://www.spinnaker.io/concepts/pipelines/
[7]: https://www.spinnaker.io/guides/user/canary/
[8]: https://opensource.com/sites/default/files/images/spinnaker-pipeline-tasks-opensourcedotcom.png (Spinnaker concepts hierarchy)
[9]: https://github.com/spinnaker/clouddriver
[10]: https://www.spinnaker.io/setup/features/notifications/#add-a-listening-webhook-to-spinnaker
[11]: https://en.wikipedia.org/wiki/Payment_Card_Industry_Data_Security_Standard
[12]: https://github.com/spinnaker/fiat/
[13]: http://spinnakersummit.com/
