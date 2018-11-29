The open organization and inner sourcing movements can share knowledge
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gov_collaborative_risk.png?itok=we8DKHuL)
Image by : opensource.com

Red Hat is a company with roughly 11,000 employees. The IT department consists of roughly 500 members. Though it makes up just a fraction of the entire organization, the IT department is still sufficiently staffed to have many application service, infrastructure, and operational teams within it. Our purpose is "to enable Red Hatters in all functions to be effective, productive, innovative, and collaborative, so that they feel they can make a difference,"--and, more specifically, to do that by providing technologies and related services in a fashion that is as open as possible.

Being open like this takes time, attention, and effort. While we always strive to be as open as possible, it can be difficult. For a variety of reasons, we don't always succeed.

In this story, I'll explain a time when, in the rush to innovate, the Red Hat IT organization lost sight of its open ideals. But I'll also explore how returning to those ideals--and using the collaborative tactics of "inner source"--helped us to recover and greatly improve the way we deliver services.

### About inner source

Before I explain how inner source helped our team, let me offer some background on the concept.

Inner source is the adoption of open source development practices between teams within an organization to promote better and faster delivery without requiring project resources be exposed to the world or openly licensed. It allows an organization to receive many of the benefits of open source development methods within its own walls.

In this way, inner source aligns well with open organization strategies and principles; it provides a path for open, collaborative development. While the open organization defines its principles of openness broadly as transparency, inclusivity, adaptability, collaboration, and community--and covers how to use these open principles for communication, decision making, and many other topics--inner source is about the adoption of specific and tactical practices, processes, and patterns from open source communities to improve delivery.

For instance, [the Open Organization Maturity Model][1] suggests that in order to be transparent, teams should, at minimum, share all project resources with the project team (though it suggests that it's generally better to share these resources with the entire organization). The common pattern in both inner source and open source development is to host all resources in a publicly available version control system, for source control management, which achieves the open organization goal of high transparency.

Inner source aligns well with open organization strategies and principles.

Another example of value alignment appears in the way open source communities accept contributions. In open source communities, source code is transparently available. Community contributions in the form of patches or merge requests are commonly accepted practices (even expected ones). This provides one example of how to meet the open organization's goal of promoting inclusivity and collaboration.

### The challenge

Early in 2014, Red Hat IT began its first steps toward making Amazon Web Services (AWS) a standard hosting offering for business critical systems. While teams within Red Hat IT had built several systems and services in AWS by this time, these were bespoke creations, and we desired to make deploying services to IT standards in AWS both simple and standardized.

In order to make AWS cloud hosting meet our operational standards (while being scalable), the Cloud Enablement team within Red Hat IT decided that all infrastructure in AWS would be configured through code, rather than manually, and that everyone would use a standard set of tools. The Cloud Enablement team designed and built these standard tools; a separate group, the Platform Operations team, was responsible for provisioning and hosting systems and services in AWS using the tools.

The Cloud Enablement team built a toolset, obtusely named "Template Util," based on AWS Cloud Formations configurations wrapped in a management layer to enforce certain configuration requirements and make stamping out multiple copies of services across environments easier. While the Template Util toolset technically met all our initial requirements, and we eventually provisioned the infrastructure for more than a dozen services with it, engineers in every team working with the tool found using it to be painful. Michael Johnson, one engineer using the tool, said "It made doing something relatively straightforward really complicated."

Among the issues Template Util exhibited were:

  * Underlying cloud formations technologies implied constraints on application stack management at odds with how we managed our application systems.
  * The tooling was needlessly complex and brittle in places, using multiple layered templating technologies and languages making syntax issues hard to debug.
  * The code for the tool--and some of the data users needed to manipulate the tool--were kept in a repository that was difficult for most users to access.
  * There was no standard process to contributing or accepting changes.
  * The documentation was poor.



As more engineers attempted to use the Template Util toolset, they found even more issues and limitations with the tools. Unhappiness continued to grow. To make matters worse, the Cloud Enablement team then shifted priorities to other deliverables without relinquishing ownership of the tool, so bug fixes and improvements to the tools were further delayed.

The real, core issues here were our inability to build an inclusive community to collaboratively build shared tooling that met everyone's needs. Fear of losing "ownership," fear of changing requirements, and fear of seeing hard work abandoned all contributed to chronic conflict, which in turn led to poorer outcomes.

### Crisis point

By September 2015, more than a year after launching our first major service in AWS with the Template Util tool, we hit a crisis point.

Many engineers refused to use the tools. That forced all of the related service provisioning work on a small set of engineers, further fracturing the community and disrupting service delivery roadmaps as these engineers struggled to deal with unexpected work. We called an emergency meeting and invited all the teams involved to find a solution.

During the emergency meeting, we found that people generally thought we needed immediate change and should start the tooling effort over, but even the decision to start over wasn't unanimous. Many solutions emerged--sometimes multiple solutions from within a single team--all of which would require significant work to implement. While we couldn't reach a consensus on which solution to use during this meeting, we did reach an agreement to give proponents of different technologies two weeks to work together, across teams, to build their case with a prototype, which the community could then review.

While we didn't reach a final and definitive decision, this agreement was the first point where we started to return to the open source ideals that guide our mission. By inviting all involved parties, we were able to be transparent and inclusive, and we could begin rebuilding our internal community. By making clear that we wanted to improve things and were open to new options, we showed our commitment to adaptability and meritocracy. Most importantly, the plan for building prototypes gave people a clear, return path to collaboration.

When the community reviewed the prototypes, it determined that the clear leader was an Ansible-based toolset that would eventually become known, internally, as Ansicloud. (At the time, no one involved with this work had any idea that Red Hat would acquire Ansible the following month. It should also be noted that other teams within Red Hat have found tools based on Cloud Formation extremely useful, even when our specific Template Util tool did not find success.)

This prototyping and testing phase didn't fix things overnight, though. While we had consensus on the general direction we needed to head, we still needed to improve the new prototype to the point at which engineers could use it reliably for production services.

So over the next several months, a handful of engineers worked to further build and extend the Ansicloud toolset. We built three new production services. While we were sharing code, that sharing activity occurred at a low level of maturity. Some engineers had trouble getting access due to older processes. Other engineers headed in slightly different directions, with each engineer having to rediscover some of the core design issues themselves.

### Returning to openness

This led to a turning point: Building on top of the previous agreement, we focused on developing a unified vision and providing easier access. To do this, we:

  1. created a list of specific goals for the project (both "must-haves" and "nice-to-haves"),
  2. created an open issue log for the project to avoid solving the same problem repeatedly,
  3. opened our code base so anyone in Red Hat could read or clone it, and
  4. made it easy for engineers to get trusted committer access



Our agreement to collaborate, our finally unified vision, and our improved tool development methods spurred the growth of our community. Ansicloud adoption spread throughout the involved organizations, but this led to a new problem: The tool started changing more quickly than users could adapt to it, and improvements that different groups submitted were beginning to affect other groups in unanticipated ways.

These issues resulted in our recent turn to inner source practices. While every open source project operates differently, we focused on adopting some best practices that seemed common to many of them. In particular:

  * We identified the business owner of the project and the core-contributor group of developers who would govern the development of the tools and decide what contributions to accept. While we want to keep things open, we can't have people working against each other or breaking each other's functionality.
  * We developed a project README clarifying the purpose of the tool and specifying how to use it. We also created a CONTRIBUTING document explaining how to contribute, what sort of contributions would be useful, and what sort of tests a contribution would need to pass to be accepted.
  * We began building continuous integration and testing services for the Ansicloud tool itself. This helped us ensure we could quickly and efficiently validate contributions technically, before the project accepted and merged them.



With these basic agreements, documents, and tools available, we were back onto the path of open collaboration and successful inner sourcing.

### Why it matters

Why does inner source matter?

From a developer community point of view, shifting from a traditional siloed development model to the inner source model has produced significant, quantifiable improvements:

  * Contributions to our tooling have grown 72% per week (by number of commits).
  * The percentage of contributions from non-core committers has grown from 27% to 78%; the users of the toolset are driving its development.
  * The contributor list has grown by 15%, primarily from new users of the tool set, rather than core committers, increasing our internal community.



And the tools we've delivered through this project have allowed us to see dramatic improvements in our business outcomes. Using the Ansicloud tools, 54 new multi-environment application service deployments were created in 385 days (compared to 20 services in 1,013 days with the Template Util tools). We've gone from one new service deployment in a 50-day period to one every week--a seven-fold increase in the velocity of our delivery.

What really matters here is that the improvements we saw were not aberrations. Inner source provides common, easily understood patterns that organizations can adopt to effectively promote collaboration (not to mention other open organization principles). By mirroring open source production practices, inner source can also mirror the benefits of open source code, which have been seen time and time again: higher quality code, faster development, and more engaged communities.

This article is part of the [Open Organization Workbook project][2].

### about the author
Tom Benninger - Tom Benninger is a Solutions Architect, Systems Engineer, and continual tinkerer at Red Hat, Inc. Having worked with startups, small businesses, and larger enterprises, he has experience within a broad set of IT disciplines. His current area of focus is improving Application Lifecycle Management in the enterprise. He has a particular interest in how open source, inner source, and collaboration can help support modern application development practices and the adoption of DevOps, CI/CD, Agile,...

--------------------------------------------------------------------------------

via: https://opensource.com/open-organization/18/1/open-orgs-and-inner-source-it

作者：[Tom Benninger][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tomben
[1]:https://opensource.com/open-organization/resources/open-org-maturity-model
[2]:https://opensource.com/open-organization/17/8/workbook-project-announcement
