[#]: subject: "How to get the most out of GitOps right now"
[#]: via: "https://opensource.com/article/21/8/gitops"
[#]: author: "Itiel Shwartz https://opensource.com/users/itielschwartz2021"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to get the most out of GitOps right now
======
GitOps is a great starting point to understand what is running in
production, but it may need a little more augmentation to get it working
just right for your engineering team.
![Team checklist and to dos][1]

You may have encountered this brief introduction to GitOps shared by prevalent cloud software engineer, [Kelsey Hightower][2]:

> GitOps: versioned CI/CD on top of declarative infrastructure. Stop scripting and start shipping. <https://t.co/SgUlHgNrnY>
>
> — Kelsey Hightower (@kelseyhightower) [January 17, 2018][3]

In the world of [infrastructure as code][4], GitOps is a popular way to manage automated deployments through continuous integration/continuous development (CI/CD) and microservices architecture in general, as most of our infrastructure is essentially defined in config files today (e.g., YAML, JSON, HCL). This is not limited to Kubernetes (K8s), but it's often highly associated with K8s clusters. (I'll explain why in a second.) This basically means that changing anything in your production infrastructure is as simple as changing a line of code.

The reason GitOps is so closely identified with K8s is that K8s is completely configured in declarative YAML, and therefore, you can quickly achieve the benefits of using GitOps as it is really just software-defined infrastructure. When it comes to properly applying GitOps in your engineering organization, the main thing you need to pay attention to is how you enforce changes to your cluster or infrastructure.

When you choose the GitOps path, you can only do it through a single source of truth: your source-code management (SCM) repository (e.g., GitLab, GitHub, Bitbucket, or your own hosting solution) that enforces the version-control policy for your entire organization. This means the only way to make changes to your infrastructure is through a pull request in your repository. This is how version control is maintained at scale in large engineering organizations using GitOps.

### The state of real-world deployments

The GitOps doctrine claims to be the new and simpler way to achieve CI/CD, except that the CD part of CI/CD is a much more complex beast than GitOps practices would have you believe. With GitOps, the CD part breaks down to a very binary approach to engineering environments. You're either in staging or production, where you just flip the switch and your code is in production. In my years of experience as an engineer, I have yet to participate in a significant code change, feature rollout, or another major deployment that is that simple.

There is plenty more legwork encapsulated in staging or production versioning completely abstracted from the CD process with GitOps. This means that any engineering process that takes quality seriously will have a few stages between the CI and CD phases of a major deployment. These include testing, validating results, verifying that changes propagated, retesting, and often doing partial rollouts (canary and such). These are just a few examples of how CD is managed in engineering organizations.

#### GitOps tips for doing deployments better

When it comes to GitOps, there's no need to reinvent the CI/CD (and particularly the CD) wheel. If you're like most people and achieve CI/CD by duct taping your CD process with some custom scripts before and after deployment to get it over the finish line, know there are better ways to do this with GitOps facilitators. Using GitOps facilitators such as the open source, Cloud Native Computing Foundation (CNCF)-hosted [Argo CD][5] enables users to take all those custom scripts and manage them at scale in a single place. This ensures best practices when using scripts in your CI/CD process, making them canonical and repeatable every time they run.

What's more, since there is an agent that is continuously syncing state, it reduces human errors by enforcing the committed state.

### Manage chaos across repositories with GitOps

With complex deployment architectures such as K8s or even just plain old microservices, even small changes to the code often affect other interdependent services. Mapping these dependencies with GitOps tends to become a hellscape. Often with shared repos and files, you need to sync the state. However, what you'll also often find is that errors, misconfigurations, or even just bugs can create a [butterfly effect][6] that starts a cascade of failures that becomes extremely hard to track and understand in GitOps.

One common method to solve this challenge with GitOps is to create a "super repo," which is essentially a centralized monorepo that contains pointers to all the relevant dependencies, files, resources, and such. However, this quickly becomes a messy garbage bag "catchall" of a repository, where it is extremely hard to understand, track, and log changes.

When you have many dependencies, for this to work in GitOps, these dependencies need to be represented in Git. This requires your organization to be "Git native." This means you'll need to do a lot of duct-tape automation work to create modules and submodules to connect and correlate between your super repo and the relevant subrepos. Many times, this comes with a lot of maintenance overhead that becomes extremely difficult to maintain over time.

If you don't do this, you're not achieving the benefits of GitOps, and you're mostly just stuck with the downsides. You could achieve similar capabilities through a YAML file that encapsulates all the versions and dependencies, similar to a Helm umbrella chart. Without going fully Git native, you could essentially be anything else—and not GitOps.

While in the GitOps world, repos represent the single source of truth for environments, in practice, there are many third-party integrations in any given deployment. These integrations can be anything from your authentication and authorization (e.g., Auth0) to your database, which are, for the most part, updated externally to your repo. These changes to external resources, which could significantly impact your production and deployments, have no representation inside your single-source-of-truth repo at all. This could be a serious blind spot in your entire deployment.

#### GitOps tips for managing chaos better

When using GitOps, treat your configurations the same way you would treat your code. Don't scrimp on validation pipelines, ensure proper pull request hygiene, and maintain any other practices you apply when managing code at scale to avoid this chaos. Don't panic! If something incorrect gets pushed and you're concerned it will propagate to all servers, clusters, and repos, all you need to do is run `git revert`, and you can undo your last commit.

Also, similar to my recommendation regarding syncing state, using GitOps facilitators can help with managing Git practices, being Git native, and handling Kubernetes deployments (as well as being Kubernetes native).

Last, to avoid any disorder or complexity, ensure that your Git repository's state is as close as possible to your production environments to avoid any drift of your environments from your GitOps operation.

### 3 tips for using GitOps

Here are my tips for getting the most out of GitOps:

  1. Make sure to build visibility into your GitOps automation early, so you're not running blind across your many repos. When it comes to making GitOps work optimally, you should work out of a single repo per application. When these start to add up, visibility can become a real pain point. Think about the dependencies and how to engineer enough visibility into the system, so if something goes wrong, you'll know how to track it down to its source and fix it.
  2. One way to do that is to plan for every kind of failure scenario. What happens when dependencies crash? When it comes to GitOps, merge conflicts are a way of life. How do you manage high-velocity deployments and promotions to production that can overwhelm a GitOps system? Think about the many potential challenges, failures, and conflicts, and have a playbook for each. Also, following up on the first point, make sure there is sufficient visibility for each to troubleshoot rapidly. And of course, don't forget the `git revert` command in the event failure happens.
  3. Use a monorepo. There, I said it. The age-old mono vs. multi-repo debate. When it comes to GitOps, there's no question which is the better choice. While a centralized monorepo has disadvantages (e.g., it can get messy, become a nightmare to understand build processes, etc.), it also can help solve a large majority of hassles with cross-repo dependencies.



As an engineer, I felt this pain directly. I realized there's a pressing need for something to correlate these dependencies and visibility challenges I felt every single day of my GitOps life.

I wanted a better solution for tracking and cascading failures in a complex microservices setup to a root cause or code change. Everything I had tried to date, including GitOps, provided only partial information, very little correlation, and almost no causation.

GitOps tools (like Argo CD) help solve many issues that arise with DIY GitOps. Using such tools can be a good thing to consider when going down the GitOps route because they:

  * Are natively designed for Kubernetes
  * Are suitable for small teams using image-puller
  * Have strong community support (e.g., Argo CD through the CNCF, which is also easy to use with other Argo tools)
  * Provide an improved developer experience with a good user interface for applications
  * Natively integrate with Git, which helps minimize chaos and complexity



### The bottom line

Deployment processes, particularly with new versions, are a _complex_ engineering feat. To get these right, you need to invest effort in both the technology and design of the process. For example, what is the best way to deploy and validate my application in production?

GitOps is a really good starting point to understand what is running in production. Just bear in mind that it may also need a little more augmentation with additional tools and DIY automation to get it working just right for your engineering team. This way, GitOps' shine is 24K rather than fool's gold for your organization.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/gitops

作者：[Itiel Shwartz][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/itielschwartz2021
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/todo_checklist_team_metrics_report.png?itok=oB5uQbzf (Team checklist and to dos)
[2]: https://twitter.com/kelseyhightower
[3]: https://twitter.com/kelseyhightower/status/953638870888849408?ref_src=twsrc%5Etfw
[4]: https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac
[5]: https://argoproj.github.io/argo-cd/
[6]: https://en.wikipedia.org/wiki/Butterfly_effect
