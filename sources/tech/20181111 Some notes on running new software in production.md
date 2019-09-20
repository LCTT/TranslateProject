[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Some notes on running new software in production)
[#]: via: (https://jvns.ca/blog/2018/11/11/understand-the-software-you-use-in-production/)
[#]: author: (Julia Evans https://jvns.ca/)

Some notes on running new software in production
======

I’m working on a talk for kubecon in December! One of the points I want to get across is the amount of time/investment it takes to use new software in production without causing really serious incidents, and what that’s looked like for us in our use of Kubernetes.

To start out, this post isn’t blanket advice. There are lots of times when it’s totally fine to just use software and not worry about **how** it works exactly. So let’s start by talking about when it’s important to invest.

### when it matters: 99.99%

If you’re running a service with a low SLO like 99% I don’t think it matters that much to understand the software you run in production. You can be down for like 2 hours a month! If something goes wrong, just fix it and it’s fine.

At 99.99%, it’s different. That’s 45 minutes / year of downtime, and if you find out about a serious issue for the first time in production it could easily take you 20 minutes or to revert the change. That’s half your uptime budget for the year!

### when it matters: software that you’re using heavily

Also, even if you’re running a service with a 99.99% SLO, it’s impossible to develop a super deep understanding of every single piece of software you’re using. For example, a web service might use:

  * 100 library dependencies
  * the filesystem (so there’s linux filesystem code!)
  * the network (linux networking code!)
  * a database (like postgres)
  * a proxy (like nginx/haproxy)



If you’re only reading like 2 files from disk, you don’t need to do a super deep dive into Linux filesystems internals, you can just read the file from disk.

What I try to do in practice is identify the components which we rely on the (or have the most unusual use cases for!), and invest time into understanding those. These are usually pretty easy to identify because they’re the ones which will cause the most problems :)

### when it matters: new software

Understanding your software especially matters for newer/less mature software projects, because it’s morely likely to have bugs &amp; or just not have matured enough to be used by most people without having to worry. I’ve spent a bunch of time recently with Kubernetes/Envoy which are both relatively new projects, and neither of those are remotely in the category of “oh, it’ll just work, don’t worry about it”. I’ve spent many hours debugging weird surprising edge cases with both of them and learning how to configure them in the right way.

### a playbook for understanding your software

The playbook for understanding the software you run in production is pretty simple. Here it is:

  1. Start using it in production in a non-critical capacity (by sending a small percentage of traffic to it, on a less critical service, etc)
  2. Let that bake for a few weeks.
  3. Run into problems.
  4. Fix the problems. Go to step 3.



Repeat until you feel like you have a good handle on this software’s failure modes and are comfortable running it in a more critical capacity. Let’s talk about that in a little more detail, though:

### what running into bugs looks like

For example, I’ve been spending a lot of time with Envoy in the last year. Some of the issues we’ve seen along the way are: (in no particular order)

  * One of the default settings resulted in retry &amp; timeout headers not being respected
  * Envoy (as a client) doesn’t support TLS session resumption, so servers with a large amount of Envoy clients get DDOSed by TLS handshakes
  * Envoy’s active healthchecking means that you services get healthchecked by every client. This is mostly okay but (again) services with many clients can get overwhelmed by it.
  * Having every client independently healthcheck every server interacts somewhat poorly with services which are under heavy load, and can exacerbate performance issues by removing up-but-slow clients from the load balancer rotation.
  * Envoy doesn’t retry failed connections by default
  * it frequently segfaults when given incorrect configuration
  * various issues with it segfaulting because of resource leaks / memory safety issues
  * hosts running out of disk space between we didn’t rotate Envoy log files often enough



A lot of these aren’t bugs – they’re just cases where what we expected the default configuration to do one thing, and it did another thing. This happens all the time, and it can result in really serious incidents. Figuring out how to configure a complicated piece of software appropriately takes a lot of time, and you just have to account for that.

And Envoy is great software! The maintainers are incredibly responsive, they fix bugs quickly and its performance is good. It’s overall been quite stable and it’s done well in production. But just because something is great software doesn’t mean you won’t also run into 10 or 20 relatively serious issues along the way that need to be addressed in one way or another. And it’s helpful to understand those issues **before** putting the software in a really critical place.

### try to have each incident only once

My view is that running new software in production inevitably results in incidents. The trick:

  1. Make sure the incidents aren’t too serious (by making ‘production’ a less critical system first)
  2. Whenever there’s an incident (even if it’s not that serious!!!), spend the time necessary to understand exactly why it happened and how to make sure it doesn’t happen again



My experience so far has been that it’s actually relatively possible to pull off “have every incident only once”. When we investigate issues and implement remediations, usually that issue **never comes back**. The remediation can either be:

  * a configuration change
  * reporting a bug upstream and either fixing it ourselves or waiting for a fix
  * a workaround (“this software doesn’t work with 10,000 clients? ok, we just won’t use it with in cases where there are that many clients for now!“, “oh, a memory leak? let’s just restart it every hour”)



Knowledge-sharing is really important here too – it’s always unfortunate when one person finds an incident in production, fixes it, but doesn’t explain the issue to the rest of the team so somebody else ends up causing the same incident again later because they didn’t hear about the original incident.

### Understand what is ok to break and isn’t

Another huge part of understanding the software I run in production is understanding which parts are OK to break (aka “if this breaks, it won’t result in a production incident”) and which aren’t. This lets me **focus**: I can put big boxes around some components and decide “ok, if this breaks it doesn’t matter, so I won’t pay super close attention to it”.

For example, with Kubernetes:

ok to break:

  * any stateless control plane component can crash or be cycled out or go down for 5 minutes at any time. If we had 95% uptime for the kubernetes control plane that would probably be fine, it just needs to be working most of the time.
  * kubernetes networking (the system where you give every pod an IP addresses) can break as much as it wants because we decided not to use it to start



not ok:

  * for us, if etcd goes down for 10 minutes, that’s ok. If it goes down for 2 hours, it’s not
  * containers not starting or crashing on startup (iam issues, docker not starting containers, bugs in the scheduler, bugs in other controllers) is serious and needs to be looked at immediately
  * containers not having access to the resources they need (because of permissions issues, etc)
  * pods being terminated unexpectedly by Kubernetes (if you configure kubernetes wrong it can terminate your pods!)



with Envoy, the breakdown is pretty different:

ok to break:

  * if the envoy control plane goes down for 5 minutes, that’s fine (it’ll keep working with stale data)
  * segfaults on startup due to configuration errors are sort of okay because they manifest so early and they’re unlikely to surprise us (if the segfault doesn’t happen the 1st time, it shouldn’t happen the 200th time)



not ok:

  * Envoy crashes / segfaults are not good – if it crashes, network connections don’t happen
  * if the control server serves incorrect or incomplete data that’s extremely dangerous and can result in serious production incidents. (so downtime is fine, but serving incorrect data is not!)



Neither of these lists are complete at all, but they’re examples of what I mean by “understand your sofware”.

### sharing ok to break / not ok lists is useful

I think these “ok to break” / “not ok” lists are really useful to share, because even if they’re not 100% the same for every user, the lessons are pretty hard won. I’d be curious to hear about your breakdown of what kinds of failures are ok / not ok for software you’re using!

Figuring out all the failure modes of a new piece of software and how they apply to your situation can take months. (this is is why when you ask your database team “hey can we just use NEW DATABASE” they look at you in such a pained way). So anything we can do to help other people learn faster is amazing
--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/11/11/understand-the-software-you-use-in-production/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
