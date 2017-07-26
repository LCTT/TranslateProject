How modelling helps you avoid getting a stuck OpenStack
============================================================


### Share or save

![](https://insights.ubuntu.com/wp-content/uploads/bd5d/airbus.jpg)

 _Lego model of an Airbus A380-800\. Airbus run OpenStack_ 

A “StuckStack” is a deployment of OpenStack that usually, for technical but sometimes business reasons, is unable to be upgraded without significant disruption, time and expense. In the last post on this topic we discussed how many of these clouds became stuck and how the decisions made at the time were consistent with much of the prevailing wisdom of the day. Now, with OpenStack being 7 years old, the recent explosion of growth in container orchestration systems and more businesses starting to make use of cloud platforms, both public and private, OpenStack are under pressure.

### No magic solution

If you are still searching for a solution to upgrade your existing StuckStack in place without issues, then I have bad news for you: there are no magic solutions and you are best focusing your energy on building a standardised platform that can be operated efficiently and upgraded easily.

The low cost airlines industry has shown that whilst flyers may aspire to best of breed experience and sit in first or business class sipping champagne with plenty of space to relax, most will choose to fly in the cheapest seat as ultimately the value equation doesn’t warrant them paying more. Workloads are the same. Long term, workloads will run on the platform where it is most economic to run them as the business really doesn’t benefit from running on premium priced hardware or software.

Amazon, Microsoft, Google and other large scale public cloud players know this which is why they have built highly efficient data centres and used models to build, operate and scale their infrastructure. Enterprises have long followed a policy of using best of breed hardware and software infrastructure that is designed, built, marketed, priced, sold and implemented as first class experiences. The reality may not have always lived up to the promise but it matters not now anyway, as the cost model cannot survive in today’s world. Some organisations have tried to tackle this by switching to free software alternatives yet without a change in their own behaviour. Thus find that they are merely moving cost from software acquisition to software operation.The good news is that the techniques used by the large operators, who place efficient operations above all else, are available to organisations of all types now.

### What is a software model?

Whilst for many years software applications have been comprised of many objects, processes and services, in recent years it has become far more common for applications to be made up of many individual services that are highly distributed across servers in a data centre and across different data centres themselves.

![](https://insights.ubuntu.com/wp-content/uploads/f881/OpenStack-graphic.png)

 _A simple representation of OpenStack Services_ 

Many services means many pieces of software to configure, manage and keep track of over many physical machines. Doing this at scale in a cost efficient way requires a model of how all the components are connected and how they map to physical resources. To build the model we need to have a library of software components, a means of defining how they connect with one another and a way to deploy them onto a platform, be it physical or virtual. At Canonical we recognised this several years ago and built [Juju][2], a generic software modelling tool that enables operators to compose complex software applications with flexible topologies, architectures and deployment targets from a catalogue of 100s of common software services.

![](https://insights.ubuntu.com/wp-content/uploads/7790/jjuju.png)

 _Juju modelling OpenStack Services_ 

In Juju, software services are defined in something called a Charm. Charms are pieces of code, typically written in python or bash that give information about the service – the interfaces declared, how the service is installed, what other services it can connect to etc.

Charms can be simple or complex depending on the level of intelligence you wish to give them. For OpenStack, Canonical, with help from the upstream OpenStack community, has developed a full set of Charms for the primary OpenStack services. The Charms represents the instructions for the model such that it can be deployed, operated scaled and replicated with ease. The Charms also define how to upgrade themselves including, where needed, the sequence in which to perform the upgrade and how to gracefully pause and resume services when required. By connecting Juju to a bare metal provisioning system such as [Metal As A Service (MAAS)][3] the logical model of OpenStack can is deployed to physical hardware. By default, the Charms will deploy services in LXC containers which gives greater flexibility to relocate services as required based on the cloud behaviour. Config is defined in the Charms or injected at deploy time by a 3rd party tool such as Puppet or Chef.

There are 2 distinct benefits from this approach: 1 – by creating a model we have abstracted each of the cloud services from the underlying hardware and 2: we have the means to compose new architectures through iterations using the standardised components from a known source. This consistency is what enables us to deploy very different cloud architectures using the same tooling, safe in the knowledge that we will be able to operate and upgrade them easily.

With hardware inventory being managed with a fully automated provisioning tool and software applications modelled, operators can scale infrastructure much more efficiently than using legacy enterprise techniques or building a bespoke system that deviates from core. Valuable development resources can be focused on innovating in the application space, bringing new software services online faster rather than altering standard, commodity infrastructure in a way which will create compatibility problems further down the line.

In the next post I’ll highlight some of the best practises for deploying a fully modelled OpenStack and how you can get going quickly. If you have an existing StuckStack then whilst we aren’t going to be able to rescue it that easily, we will be able to get you on a path to fully supported, efficient infrastructure with operations cost that compares to public cloud.

### Upcoming webinar

If you are stuck on an old version of OpenStack and want to upgrade your OpenStack cloud easily and without downtime, watch our [on-demand webinar][4] with live demo of an upgrade from Newton to Ocata.

### Contact us

If you would like to learn more about migrating to a Canonical OpenStack cloud, [get in touch][5].

--------------------------------------------------------------------------------

作者简介：

Cloud Product Manager focused on Ubuntu OpenStack. Previously at MySQL and Red Hat. Likes motorcycles and meeting people who do interesting stuff with Ubuntu and OpenStack


------


via: https://insights.ubuntu.com/2017/07/18/stuckstack-how-modelling-helps-you-avoid-getting-a-stuck-openstack/

作者：[Mark Baker  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/markbaker/
[1]:https://insights.ubuntu.com/author/markbaker/
[2]:https://www.ubuntu.com/cloud/juju
[3]:https://www.ubuntu.com/server/maas
[4]:http://ubunt.eu/Bwe7kQ
[5]:http://ubunt.eu/3OYs5s
