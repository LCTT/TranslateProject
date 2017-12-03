Reasons Kubernetes is cool
============================================================

When I first learned about Kubernetes (a year and a half ago?) I really didn’t understand why I should care about it.

I’ve been working full time with Kubernetes for 3 months or so and now have some thoughts about why I think it’s useful. (I’m still very far from being a Kubernetes expert!) Hopefully this will help a little in your journey to understand what even is going on with Kubernetes!

I will try to explain some reason I think Kubenetes is interesting without using the words “cloud native”, “orchestration”, “container”, or any Kubernetes-specific terminology :). I’m going to explain this mostly from the perspective of a kubernetes operator / infrastructure engineer, since my job right now is to set up Kubernetes and make it work well.

I’m not going to try to address the question of “should you use kubernetes for your production systems?” at all, that is a very complicated question. (not least because “in production” has totally different requirements depending on what you’re doing)

### Kubernetes lets you run code in production without setting up new servers

The first pitch I got for Kubernetes was the following conversation with my partner Kamal:

Here’s an approximate transcript:

*   Kamal: With Kubernetes you can set up a new service with a single command

*   Julia: I don’t understand how that’s possible.

*   Kamal: Like, you just write 1 configuration file, apply it, and then you have a HTTP service running in production

*   Julia: But today I need to create new AWS instances, write a puppet manifest, set up service discovery, configure my load balancers, configure our deployment software, and make sure DNS is working, it takes at least 4 hours if nothing goes wrong.

*   Kamal: Yeah. With Kubernetes you don’t have to do any of that, you can set up a new HTTP service in 5 minutes and it’ll just automatically run. As long as you have spare capacity in your cluster it just works!

*   Julia: There must be a trap

There kind of is a trap, setting up a production Kubernetes cluster is (in my experience) is definitely not easy. (see [Kubernetes The Hard Way][3] for what’s involved to get started). But we’re not going to go into that right now!

So the first cool thing about Kubernetes is that it has the potential to make life way easier for developers who want to deploy new software into production. That’s cool, and it’s actually true, once you have a working Kubernetes cluster you really can set up a production HTTP service (“run 5 of this application, set up a load balancer, give it this DNS name, done”) with just one configuration file. It’s really fun to see.

### Kubernetes gives you easy visibility & control of what code you have running in production

IMO you can’t understand Kubernetes without understanding etcd. So let’s talk about etcd!

Imagine that I asked you today “hey, tell me every application you have running in production, what host it’s running on, whether it’s healthy or not, and whether or not it has a DNS name attached to it”. I don’t know about you but I would need to go look in a bunch of different places to answer this question and it would take me quite a while to figure out. I definitely can’t query just one API.

In Kubernetes, all the state in your cluster – applications running (“pods”), nodes, DNS names, cron jobs, and more – is stored in a single database (etcd). Every Kubernetes component is stateless, and basically works by

*   Reading state from etcd (eg “the list of pods assigned to node 1”)

*   Making changes (eg “actually start running pod A on node 1”)

*   Updating the state in etcd (eg “set the state of pod A to ‘running’”)

This means that if you want to answer a question like “hey, how many nginx pods do I have running right now in that availabliity zone?” you can answer it by querying a single unified API (the Kubernetes API!). And you have exactly the same access to that API that every other Kubernetes component does.

This also means that you have easy control of everything running in Kubernetes. If you want to, say,

*   Implement a complicated custom rollout strategy for deployments (deploy 1 thing, wait 2 minutes, deploy 5 more, wait 3.7 minutes, etc)

*   Automatically [start a new webserver][1] every time a branch is pushed to github

*   Monitor all your running applications to make sure all of them have a reasonable cgroups memory limit

all you need to do is to write a program that talks to the Kubernetes API. (a “controller”)

Another very exciting thing about the Kubernetes API is that you’re not limited to just functionality that Kubernetes provides! If you decide that you have your own opinions about how your software should be deployed / created / monitored, then you can write code that uses the Kubernetes API to do it! It lets you do everything you need.

### If every Kubernetes component dies, your code will still keep running

One thing I was originally promised (by various blog posts :)) about Kubernetes was “hey, if the Kubernetes apiserver and everything else dies, it’s ok, your code will just keep running”. I thought this sounded cool in theory but I wasn’t sure if it was actually true.

So far it seems to be actually true!

I’ve been through some etcd outages now, and what happens is

1.  All the code that was running keeps running

2.  Nothing  _new_  happens (you can’t deploy new code or make changes, cron jobs will stop working)

3.  When everything comes back, the cluster will catch up on whatever it missed

This does mean that if etcd goes down and one of your applications crashes or something, it can’t come back up until etcd returns.

### Kubernetes’ design is pretty resilient to bugs

Like any piece of software, Kubernetes has bugs. For example right now in our cluster the controller manager has a memory leak, and the scheduler crashes pretty regularly. Bugs obviously aren’t good but so far I’ve found that Kubernetes’ design helps mitigate a lot of the bugs in its core components really well.

If you restart any component, what happens is:

*   It reads all its relevant state from etcd

*   It starts doing the necessary things it’s supposed to be doing based on that state (scheduling pods, garbage collecting completed pods, scheduling cronjobs, deploying daemonsets, whatever)

Because all the components don’t keep any state in memory, you can just restart them at any time and that can help mitigate a variety of bugs.

For example! Let’s say you have a memory leak in your controller manager. Because the controller manager is stateless, you can just periodically restart it every hour or something and feel confident that you won’t cause any consistency issues. Or we ran into a bug in the scheduler where it would sometimes just forget about pods and never schedule them. You can sort of mitigate this just by restarting the scheduler every 10 minutes. (we didn’t do that, we fixed the bug instead, but you  _could_  :) )

So I feel like I can trust Kubernetes’ design to help make sure the state in the cluster is consistent even when there are bugs in its core components. And in general I think the software is generally improving over time. The only stateful thing you have to operate is etcd

Not to harp on this “state” thing too much but – I think it’s cool that in Kubernetes the only thing you have to come up with backup/restore plans for is etcd (unless you use persistent volumes for your pods). I think it makes kubernetes operations a lot easier to think about.

### Implementing new distributed systems on top of Kubernetes is relatively easy

Suppose you want to implement a distributed cron job scheduling system! Doing that from scratch is a ton of work. But implementing a distributed cron job scheduling system inside Kubernetes is much easier! (still not trivial, it’s still a distributed system)

The first time I read the code for the Kubernetes cronjob controller I was really delighted by how simple it was. Here, go read it! The main logic is like 400 lines of Go. Go ahead, read it! => [cronjob_controller.go][4] <=

Basically what the cronjob controller does is:

*   Every 10 seconds:
    *   Lists all the cronjobs that exist

    *   Checks if any of them need to run right now

    *   If so, creates a new Job object to be scheduled & actually run by other Kubernetes controllers

    *   Clean up finished jobs

    *   Repeat

The Kubernetes model is pretty constrained (it has this pattern of resources are defined in etcd, controllers read those resources and update etcd), and I think having this relatively opinionated/constrained model makes it easier to develop your own distributed systems inside the Kubernetes framework.

Kamal introduced me to this idea of “Kubernetes is a good platform for writing your own distributed systems” instead of just “Kubernetes is a distributed system you can use” and I think it’s really interesting. He has a prototype of a [system to run an HTTP service for every branch you push to github][5]. It took him a weekend and is like 800 lines of Go, which I thought was impressive!

### Kubernetes lets you do some amazing things (but isn’t easy)

I started out by saying “kubernetes lets you do these magical things, you can just spin up so much infrastructure with a single configuration file, it’s amazing”. And that’s true!

What I mean by “Kubernetes isn’t easy” is that Kubernetes has a lot of moving parts learning how to successfully operate a highly available Kubernetes cluster is a lot of work. Like I find that with a lot of the abstractions it gives me, I need to understand what is underneath those abstractions in order to debug issues and configure things properly. I love learning new things so this doesn’t make me angry or anything, I just think it’s important to know :)

One specific example of “I can’t just rely on the abstractions” that I’ve struggled with is that I needed to learn a LOT [about how networking works on Linux][6] to feel confident with setting up Kubernetes networking, way more than I’d ever had to learn about networking before. This was very fun but pretty time consuming. I might write more about what is hard/interesting about setting up Kubernetes networking at some point.

Or I wrote a [2000 word blog post][7] about everything I had to learn about Kubernetes’ different options for certificate authorities to be able to set up my Kubernetes CAs successfully.

I think some of these managed Kubernetes systems like GKE (google’s kubernetes product) may be simpler since they make a lot of decisions for you but I haven’t tried any of them.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2017/10/05/reasons-kubernetes-is-cool/

作者：[ Julia Evans][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about
[1]:https://github.com/kamalmarhubi/kubereview
[2]:https://jvns.ca/categories/kubernetes
[3]:https://github.com/kelseyhightower/kubernetes-the-hard-way
[4]:https://github.com/kubernetes/kubernetes/blob/e4551d50e57c089aab6f67333412d3ca64bc09ae/pkg/controller/cronjob/cronjob_controller.go
[5]:https://github.com/kamalmarhubi/kubereview
[6]:https://jvns.ca/blog/2016/12/22/container-networking/
[7]:https://jvns.ca/blog/2017/08/05/how-kubernetes-certificates-work/
