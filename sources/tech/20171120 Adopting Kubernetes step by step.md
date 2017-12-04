Adopting Kubernetes step by step
============================================================

Why Docker and Kubernetes?

Containers allow us to build, ship and run distributed applications. They remove the machine constraints from applications and lets us create a complex application in a deterministic fashion.

Composing applications with containers allows us to make development, QA and production environments closer to each other (if you put the effort in to get there). By doing so, changes can be shipped faster and testing a full system can happen sooner.

[Docker][1] — the containerization platform — provides this, making software  _independent_  of cloud providers.

However, even with containers the amount of work needed for shipping your application through any cloud provider (or in a private cloud) is significant. An application usually needs auto scaling groups, persistent remote discs, auto discovery, etc. But each cloud provider has different mechanisms for doing this. If you want to support these features, you very quickly become cloud provider dependent.

This is where [Kubernetes][2] comes in to play. It is an orchestration system for containers that allows you to manage, scale and deploy different pieces of your application — in a standardised way — with great tooling as part of it. It’s a portable abstraction that’s compatible with the main cloud providers (Google Cloud, Amazon Web Services and Microsoft Azure all have support for Kubernetes).

A way to visualise your application, containers and Kubernetes is to think about your application as a shark — stay with me — that exists in the ocean (in this example, the ocean is your machine). The ocean may have other precious things you don’t want your shark to interact with, like [clown fish][3]. So you move you shark (your application) into a sealed aquarium (Container). This is great but not very robust. Your aquarium can break or maybe you want to build a tunnel to another aquarium where other fish live. Or maybe you want many copies of that aquarium in case one needs cleaning or maintenance… this is where Kubernetes clusters come to play.


![](https://cdn-images-1.medium.com/max/1600/1*OVt8cnY1WWOqdLFycCgdFg.jpeg)
Evolution to Kubernetes

With Kubernetes being supported by the main cloud providers, it makes it easier for you and your team to have environments from  _development _ to  _production _ that are almost identical to each other. This is because Kubernetes has no reliance on proprietary software, services or infrastructure.

The fact that you can start your application in your machine with the same pieces as in production closes the gaps between a development and a production environment. This makes developers more aware of how an application is structured together even though they might only be responsible for one piece of it. It also makes it easier for your application to be fully tested earlier in the pipeline.

How do you work with Kubernetes?

With more people adopting Kubernetes new questions arise; how should I develop against a cluster based environment? Suppose you have 3 environments — development, QA and production — how do I fit Kubernetes in them? Differences across these environments will still exist, either in terms of development cycle (e.g. time spent to see my code changes in the application I’m running) or in terms of data (e.g. I probably shouldn’t test with production data in my QA environment as it has sensitive information).

So, should I always try to work inside a Kubernetes cluster, building images, recreating deployments and services while I code? Or maybe I should not try too hard to make my development environment be a Kubernetes cluster (or set of clusters) in development? Or maybe I should work in a hybrid way?


![](https://cdn-images-1.medium.com/max/1600/1*MXokxD8Ktte4_vWvTas9uw.jpeg)
Development with a local cluster

If we carry on with our metaphor, the holes on the side represent a way to make changes to our app while keeping it in a development cluster. This is usually achieved via [volumes][4].

A Kubernetes series

The Kubernetes series repository is open source and available here:

### [https://github.com/red-gate/ks][5]

We’ve written this series as we experiment with different ways to build software. We’ve tried to constrain ourselves to use Kubernetes in all environments so that we can explore the impact these technologies will have on the development and management of data and the database.

The series starts with the basic creation of a React application hooked up to Kubernetes, and evolves to encompass more of our development requirements. By the end we’ll have covered all of our application development needs  _and_  have understood how best to cater for the database lifecycle in this world of containers and clusters.

Here are the first 5 episodes of this series:

1.  ks1: build a React app with Kubernetes

2.  ks2: make minikube detect React code changes

3.  ks3: add a python web server that hosts an API

4.  ks4: make minikube detect Python code changes

5.  ks5: create a test environment

The second part of the series will add a database and try to work out the best way to evolve our application alongside it.

By running Kubernetes in all environments, we’ve been forced to solve new problems as we try to keep the development cycle as fast as possible. The trade-off being that we are constantly exposed to Kubernetes and become more accustomed to it. By doing so, development teams become responsible for production environments, which is no longer difficult as all environments (development through production) are all managed in the same way.

What’s next?

We will continue this series by incorporating a database and experimenting to find the best way to have a seamless database lifecycle experience with Kubernetes.

 _This Kubernetes series is brought to you by Foundry, Redgate’s R&D division. We’re working on making it easier to manage data alongside containerised environments, so if you’re working with data and containerised environments, we’d like to hear from you — reach out directly to the development team at _  [_foundry@red-gate.com_][6] 

* * *

 _We’re hiring_  _. Are you interested in uncovering product opportunities, building _  [_future technology_][7]  _ and taking a startup-like approach (without the risk)? Take a look at our _  [_Software Engineer — Future Technologies_][8]  _ role and read more about what it’s like to work at Redgate in _  [_Cambridge, UK_][9]  _._

--------------------------------------------------------------------------------

via: https://medium.com/ingeniouslysimple/adopting-kubernetes-step-by-step-f93093c13dfe

作者：[santiago arias][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@santiaago?source=post_header_lockup
[1]:https://www.docker.com/what-docker
[2]:https://kubernetes.io/
[3]:https://www.google.co.uk/search?biw=723&bih=753&tbm=isch&sa=1&ei=p-YCWpbtN8atkwWc8ZyQAQ&q=nemo+fish&oq=nemo+fish&gs_l=psy-ab.3..0i67k1l2j0l2j0i67k1j0l5.5128.9271.0.9566.9.9.0.0.0.0.81.532.9.9.0....0...1.1.64.psy-ab..0.9.526...0i7i30k1j0i7i10i30k1j0i13k1j0i10k1.0.FbAf9xXxTEM
[4]:https://kubernetes.io/docs/concepts/storage/volumes/
[5]:https://github.com/red-gate/ks
[6]:mailto:foundry@red-gate.com
[7]:https://www.red-gate.com/foundry/
[8]:https://www.red-gate.com/our-company/careers/current-opportunities/software-engineer-future-technologies
[9]:https://www.red-gate.com/our-company/careers/living-in-cambridge
