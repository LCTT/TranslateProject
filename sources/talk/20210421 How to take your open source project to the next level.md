[#]: subject: (How to take your open source project to the next level)
[#]: via: (https://opensource.com/article/21/4/open-source-saas)
[#]: author: (Stef Walter https://opensource.com/users/stefw)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to take your open source project to the next level
======
Merely releasing your SaaS's source code is not enough to make it open
source.
![Green graph of measurements][1]

Open sourcing the code to your software as a service (SaaS) is not sufficient to make it actually be open source. Does that sound contradictory to you? Let me explain.

Most services that espouse "open source" do so by simply throwing the code over the wall. It's better than nothing but really misses the point that powers open source: enabling users to make a change to the software they're using.

Some other popular services powered by Open Source software, do include the tools used to operate/deploy their service. Pause for applause.

But that’s also insufficient to actually enable users to become contributors effectively.

Much of a service's value comes from things other than the code. It comes from the infrastructure it runs on, the operational processes, the monitoring, the backups, the metrics, the high availability, the scalability. It comes from data, from the network effect—with other users, with other interconnected services, with integrated tools, from legal agreements, and so on.

Any non-toy service is not reproducible.

Launching a clone of the service to contribute effectively is a high barrier. Certain kinds of contributions clearly are possible. But contributors are essentially asked to "fork" the non-code aspects of the service to iterate on their changes against their real-world use cases.

What's more, without true open source principles, we are missing a way to have a community develop with a center of gravity around the service itself. This leads to companies forking the service in a way that typical open source projects with a true community are resilient to.

I believe that if we enable contributions to services _rather than just the software_, we reap the advantages of true open source. That means enabling users to make a change to a running service and experience that change themselves.

You still with me?

Yes, that means opening a pull request against a running service and experiencing that change before it's merged.

This is not as insane as it sounds.

It appears that every technique we need to enable such a capability is already in use in modern deployment and operations methodology. We just have to connect the dots.

### Why should I care?

I've been part of open source for over 20 years now. Although I'm just one contributor, together, we've changed something fundamental about the world. Our lives are too short, and software is too complex to have one company or one individual invent everything from scratch. So, we work together across humanity to accomplish what no individual team could. This is our legacy, and it has become commonplace.

And yet, there's a very simple principle that drives open source:

> Open source thrives when it converts some
>  small percentage of users into contributors.

If you interrupt that principle, you starve open source. SaaS does just that: When someone else runs your software for you, the intuitive mechanisms for you to change that software are not available.

![How users become contributors][2]

(Source: Stef Walter, [CC-BY-SA][3])

"But," you may say, "if the source code for that running service was _open_, then I could still change it."

Sure, you could change the code in some components. Still, for any reasonably complex service, you wouldn't be able to run your changes or experience your changes against real-world workflows, much less iterate on them, until they're good enough to share with others.

In reality, the threat here is far more fundamental: Users of services cannot readily change something in the service, not only because the processes are operated by someone else but because they have explicitly chosen not to be involved in operating the software.

If the primary way to use Postgres was "as a service," then that (fabulous) project would be starved for contributors. This is because the number of contributors in such a project is a function of some small percentage of users deciding to try to make change.

As this mechanism for using SaaS takes over the world, the pool of users who can contribute to open source shrinks dramatically.

For a long time, I saw this as a fundamental threat that would starve open source. I was unable to reconcile SaaS with a healthy open source ecosystem.

But recently, I've become convinced that if we enable an effective contribution model on a service, one that doesn't require that the users become operators of the service, then we can reconcile this threat, and open source will thrive on services instead of being starved by them.

### You want me to do what?!?

To enable contributions by users of a service, users that have explicitly chosen not to operate the software themselves, we have to set up a process by which they can make a change to a running service and experience that change before others do.

For example, a user of such a hypothetical service should be able to:

  1. Discover which component of a service to contribute to
  2. Make a nonsensical change (like adding a printf-style log statement) or change the spelling of a word
  3. Experience that change when they use the service or when it acts on their data



After discussing this with others, I firmly believe we have all the techniques we need, whether they're canary deployments, load balancing, continuous delivery, infrastructure as code, and so on. It's been hard to find a single problem that an existing practice doesn't solve.

It turns out that many experienced engineering teams have come to that same conclusion. Rapid deployment of changes to services is a powerful capability that's highly sought after. For example, [GitHub deploys changes before they're merged][4]. Whereas [Facebook rapidly deploys changes][5] to a few canary machines and scales each change up to production. Everyone has their own version of continuous delivery. It's hard to take an engineering team seriously if they haven't figured out how their team members can get a change rapidly deployed.

Open source has all the ingredients to have a decisive advantage here. To effectively collaborate on _open source services_, with contributors working across all of humanity. 

Let's try to craft a playbook to achieve this basic capability that drives open source software and apply it to open source services: That is, the ability to change code and interact with that change… on a service.

_Note: [Thanks to the reviewers of this article!][6]_

* * *

_This originally appeared on [stef.thewalter.net][7] and is republished with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/open-source-saas

作者：[Stef Walter][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stefw
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_lead-steps-measure.png?itok=DG7rFZPk (Green graph of measurements)
[2]: https://opensource.com/sites/default/files/uploads/funneling-open-source-service.png (How users become contributors)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://github.blog/2015-06-02-deploying-branches-to-github-com/
[5]: https://engineering.fb.com/2017/08/31/web/rapid-release-at-massive-scale/
[6]: https://github.com/stefwalter/blog/pull/1
[7]: http://stef.thewalter.net/open-source-services.html
