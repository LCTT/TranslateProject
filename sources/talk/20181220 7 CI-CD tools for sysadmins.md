[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 CI/CD tools for sysadmins)
[#]: via: (https://opensource.com/article/18/12/cicd-tools-sysadmins)
[#]: author: (Dan Barker https://opensource.com/users/barkerd427)

7 CI/CD tools for sysadmins
======
An easy guide to the top open source continuous integration, continuous delivery, and continuous deployment tools.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc)

Continuous integration, continuous delivery, and continuous deployment (CI/CD) have all existed in the developer community for many years. Some organizations have involved their operations counterparts, but many haven't. For most organizations, it's imperative for their operations teams to become just as familiar with CI/CD tools and practices as their development compatriots are.

CI/CD practices can equally apply to infrastructure and third-party applications and internally developed applications. Also, there are many different tools but all use similar models. And possibly most importantly, leading your company into this new practice will put you in a strong position within your company, and you'll be a beacon for others to follow.

Some organizations have been using CI/CD practices on infrastructure, with tools like [Ansible][1], [Chef][2], or [Puppet][3], for several years. Other tools, like [Test Kitchen][4], allow tests to be performed on infrastructure that will eventually host applications. In fact, those tests can even deploy the application into a production-like environment and execute application-level tests with production loads in more advanced configurations. However, just getting to the point of being able to test the infrastructure individually is a huge feat. Terraform can also use Test Kitchen for even more [ephemeral][5] and [idempotent][6] infrastructure configurations than some of the original configuration-management tools. Add in Linux containers and Kubernetes, and you can now test full infrastructure and application deployments with prod-like specs and resources that come and go in hours rather than months or years. Everything is wiped out before being deployed and tested again.

However, you can also focus on getting your network configurations or database data definition language (DDL) files into version control and start running small CI/CD pipelines on them. Maybe it just checks syntax or semantics or some best practices. Actually, this is how most development pipelines started. Once you get the scaffolding down, it will be easier to build on. You'll start to find all kinds of use cases for pipelines once you get started.

For example, I regularly write a newsletter within my company, and I maintain it in version control using [MJML][7]. I needed to be able to host a web version, and some folks liked being able to get a PDF, so I built a [pipeline][8]. Now when I create a new newsletter, I submit it for a merge request in GitLab. This automatically creates an index.html with links to HTML and PDF versions of the newsletter. The HTML and PDF files are also created in the pipeline. None of this is published until someone comes and reviews these artifacts. Then, GitLab Pages publishes the website and I can pull down the HTML to send as a newsletter. In the future, I'll automatically send the newsletter when the merge request is merged or after a special approval step. This seems simple, but it has saved me a lot of time. This is really at the core of what these tools can do for you. They will save you time.

The key is creating tools to work in the abstract so that they can apply to multiple problems with little change. I should also note that what I created required almost no code except [some light HTML templating][9], some [node to loop through the HTML files][10], and some more [node to populate the index page with all the HTML pages and PDFs][11].

Some of this might look a little complex, but most of it was taken from the tutorials of the different tools I'm using. And many developers are happy to work with you on these types of things, as they might also find them useful when they're done. The links I've provided are to a newsletter we plan to start for [DevOps KC][12], and all the code for creating the site comes from the work I did on our internal newsletter.

Many of the tools listed below can offer this type of interaction, but some offer a slightly different model. The emerging model in this space is that of a declarative description of a pipeline in something like YAML with each stage being ephemeral and idempotent. Many of these systems also ensure correct sequencing by creating a [directed acyclic graph][13] (DAG) over the different stages of the pipeline.

These stages are often run in Linux containers and can do anything you can do in a container. Some tools, like [Spinnaker][14], focus only on the deployment component and offer some operational features that others don't normally include. [Jenkins][15] has generally kept pipelines in an XML format and most interactions occur within the GUI, but more recent implementations have used a [domain specific language][16] (DSL) using [Groovy][17]. Further, Jenkins jobs normally execute on nodes with a special Java agent installed and consist of a mix of plugins and pre-installed components.

Jenkins introduced pipelines in its tool, but they were a bit challenging to use and contained several caveats. Recently, the creator of Jenkins decided to move the community toward a couple different initiatives that will hopefully breathe new life into the project—which is the one that really brought CI/CD to the masses. I think its most interesting initiative is creating a Cloud Native Jenkins that can turn a Kubernetes cluster into a Jenkins CI/CD platform.

As you learn more about these tools and start bringing these practices into your company or your operations division, you'll quickly gain followers. You will increase your own productivity as well as that of others. We all have years of backlog to get to—how much would your co-workers love if you could give them enough time to start tackling that backlog? Not only that, but your customers will start to see increased application reliability, and your management will see you as a force multiplier. That certainly can't hurt during your next salary negotiation or when interviewing with all your new skills.

Let's dig into the tools a bit more. We'll briefly cover each one and share links to more information.

### GitLab CI

GitLab is a fairly new entrant to the CI/CD space, but it's already achieved the top spot in the [Forrester Wave for Continuous Integration Tools][20]. That's a huge achievement in such a crowded and highly qualified field. What makes GitLab CI so great? It uses a YAML file to describe the entire pipeline. It also has a functionality called Auto DevOps that allows for simpler projects to have a pipeline built automatically with multiple tests built-in. This system uses [Herokuish buildpacks][21] to determine the language and how to build the application. Some languages can also manage databases, which is a real game-changer for building new applications and getting them deployed to production from the beginning of the development process. The system has native integrations into Kubernetes and will deploy your application automatically into a Kubernetes cluster using one of several different deployment methodologies, like percentage-based rollouts and blue-green deployments.

In addition to its CI functionality, GitLab offers many complementary features like operations and monitoring with Prometheus deployed automatically with your application; portfolio and project management using GitLab Issues, Epics, and Milestones; security checks built into the pipeline with the results provided as an aggregate across multiple projects; and the ability to edit code right in GitLab using the WebIDE, which can even provide a preview or execute part of a pipeline for faster feedback.

### GoCD

GoCD comes from the great minds at Thoughtworks, which is testimony enough for its capabilities and efficiency. To me, GoCD's main differentiator from the rest of the pack is its [Value Stream Map][22] (VSM) feature. In fact, pipelines can be chained together with one pipeline providing the "material" for the next pipeline. This allows for increased independence for different teams with different responsibilities in the deployment process. This may be a useful feature when introducing this type of system in older organizations that intend to keep these teams separate—but having everyone using the same tool will make it easier later to find bottlenecks in the VSM and reorganize the teams or work to increase efficiencies.

It's incredibly valuable to have a VSM for each product in a company; that GoCD allows this to be [described in JSON or YAML][23] in version control and presented visually with all the data around wait times makes this tool even more valuable to an organization trying to understand itself better. Start by installing GoCD and mapping out your process with only manual approval gates. Then have each team use the manual approvals so you can start collecting data on where bottlenecks might exist.

### Travis CI

Travis CI was my first experience with a Software as a Service (SaaS) CI system, and it's pretty awesome. The pipelines are stored as YAML with your source code, and it integrates seamlessly with tools like GitHub. I don't remember the last time a pipeline failed because of Travis CI or the integration—Travis CI has a very high uptime. Not only can it be used as SaaS, but it also has a version that can be hosted. I haven't run that version—there were a lot of components, and it looked a bit daunting to install all of it. I'm guessing it would be much easier to deploy it all to Kubernetes with [Helm charts provided by Travis CI][26]. Those charts don't deploy everything yet, but I'm sure it will grow even more in the future. There is also an enterprise version if you don't want to deal with the hassle.

However, if you're developing open source code, you can use the SaaS version of Travis CI for free. That is an awesome service provided by an awesome team! This alleviates a lot of overhead and allows you to use a fairly common platform for developing open source code without having to run anything.

### Jenkins

Jenkins is the original, the venerable, de facto standard in CI/CD. If you haven't already, you need to read "[Jenkins: Shifting Gears][27]" from Kohsuke, the creator of Jenkins and CTO of CloudBees. It sums up all of my feelings about Jenkins and the community from the last decade. What he describes is something that has been needed for several years, and I'm happy CloudBees is taking the lead on this transformation. Jenkins will be a bit overwhelming to most non-developers and has long been a burden on its administrators. However, these are items they're aiming to fix.

[Jenkins Configuration as Code][28] (JCasC) should help fix the complex configuration issues that have plagued admins for years. This will allow for a zero-touch configuration of Jenkins masters through a YAML file, similar to other CI/CD systems. [Jenkins Evergreen][29] aims to make this process even easier by providing predefined Jenkins configurations based on different use cases. These distributions should be easier to maintain and upgrade than the normal Jenkins distribution.

Jenkins 2 introduced native pipeline functionality with two types of pipelines, which [I discuss][30] in a LISA17 presentation. Neither is as easy to navigate as YAML when you're doing something simple, but they're quite nice for doing more complex tasks.

[Jenkins X][31] is the full transformation of Jenkins and will likely be the implementation of Cloud Native Jenkins (or at least the thing most users see when using Cloud Native Jenkins). It will take JCasC and Evergreen and use them at their best natively on Kubernetes. These are exciting times for Jenkins, and I look forward to its innovation and continued leadership in this space.

### Concourse CI

I was first introduced to Concourse through folks at Pivotal Labs when it was an early beta version—there weren't many tools like it at the time. The system is made of microservices, and each job runs within a container. One of its most useful features that other tools don't have is the ability to run a job from your local system with your local changes. This means you can develop locally (assuming you have a connection to the Concourse server) and run your builds just as they'll run in the real build pipeline. Also, you can rerun failed builds from your local system and inject specific changes to test your fixes.

Concourse also has a simple extension system that relies on the fundamental concept of resources. Basically, each new feature you want to provide to your pipeline can be implemented in a Docker image and included as a new resource type in your configuration. This keeps all functionality encapsulated in a single, immutable artifact that can be upgraded and modified independently, and breaking changes don't necessarily have to break all your builds at the same time.

### Spinnaker

Spinnaker comes from Netflix and is more focused on continuous deployment than continuous integration. It can integrate with other tools, including Travis and Jenkins, to kick off test and deployment pipelines. It also has integrations with monitoring tools like Prometheus and Datadog to make decisions about deployments based on metrics provided by these systems. For example, the canary deployment uses a judge concept and the metrics being collected to determine if the latest canary deployment has caused any degradation in pertinent metrics and should be rolled back or if deployment can continue.

A couple of additional, unique features related to deployments cover an area that is often overlooked when discussing continuous deployment, and might even seem antithetical, but is critical to success: Spinnaker helps make continuous deployment a little less continuous. It will prevent a stage from running during certain times to prevent a deployment from occurring during a critical time in the application lifecycle. It can also enforce manual approvals to ensure the release occurs when the business will benefit the most from the change. In fact, the whole point of continuous integration and continuous deployment is to be ready to deploy changes as quickly as the business needs to change.

### Screwdriver

Screwdriver is an impressively simple piece of engineering. It uses a microservices approach and relies on tools like Nomad, Kubernetes, and Docker to act as its execution engine. There is a pretty good [deployment tutorial][34] for deploying to AWS and Kubernetes, but it could be improved once the in-progress [Helm chart][35] is completed.

Screwdriver also uses YAML for its pipeline descriptions and includes a lot of sensible defaults, so there's less boilerplate configuration for each pipeline. The configuration describes an advanced workflow that can have complex dependencies among jobs. For example, a job can be guaranteed to run after or before another job. Jobs can run in parallel and be joined afterward. You can also use logical operators to run a job, for example, if any of its dependencies are successful or only if all are successful. Even better is that you can specify certain jobs to be triggered from a pull request. Also, dependent jobs won't run when this occurs, which allows easy segregation of your pipeline for when an artifact should go to production and when it still needs to be reviewed.

This is only a brief description of these CI/CD tools—each has even more cool features and differentiators you can investigate. They are all open source and free to use, so go deploy them and see which one fits your needs best.

### What to read next

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/cicd-tools-sysadmins

作者：[Dan Barker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/barkerd427
[b]: https://github.com/lujun9972
[1]: https://www.ansible.com/
[2]: https://www.chef.io/
[3]: https://puppet.com/
[4]: https://github.com/test-kitchen/test-kitchen
[5]: https://www.merriam-webster.com/dictionary/ephemeral
[6]: https://en.wikipedia.org/wiki/Idempotence
[7]: https://mjml.io/
[8]: https://gitlab.com/devopskc/newsletter/blob/master/.gitlab-ci.yml
[9]: https://gitlab.com/devopskc/newsletter/blob/master/index/index.html
[10]: https://gitlab.com/devopskc/newsletter/blob/master/html-to-pdf.js
[11]: https://gitlab.com/devopskc/newsletter/blob/master/populate-index.js
[12]: https://devopskc.com/
[13]: https://en.wikipedia.org/wiki/Directed_acyclic_graph
[14]: https://www.spinnaker.io/
[15]: https://jenkins.io/
[16]: https://martinfowler.com/books/dsl.html
[17]: http://groovy-lang.org/
[18]: https://about.gitlab.com/product/continuous-integration/
[19]: https://gitlab.com/gitlab-org/gitlab-ce/
[20]: https://about.gitlab.com/2017/09/27/gitlab-leader-continuous-integration-forrester-wave/
[21]: https://github.com/gliderlabs/herokuish
[22]: https://www.gocd.org/getting-started/part-3/#value_stream_map
[23]: https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html
[24]: https://docs.travis-ci.com/
[25]: https://github.com/travis-ci/travis-ci
[26]: https://github.com/travis-ci/kubernetes-config
[27]: https://jenkins.io/blog/2018/08/31/shifting-gears/
[28]: https://jenkins.io/projects/jcasc/
[29]: https://github.com/jenkinsci/jep/blob/master/jep/300/README.adoc
[30]: https://danbarker.codes/talk/lisa17-becoming-plumber-building-deployment-pipelines/
[31]: https://jenkins-x.io/
[32]: https://concourse-ci.org/
[33]: https://github.com/concourse/concourse
[34]: https://docs.screwdriver.cd/cluster-management/kubernetes
[35]: https://github.com/screwdriver-cd/screwdriver-chart
