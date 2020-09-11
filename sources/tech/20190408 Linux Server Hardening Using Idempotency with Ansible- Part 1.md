[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Server Hardening Using Idempotency with Ansible: Part 1)
[#]: via: (https://www.linux.com/blog/linux-server-hardening-using-idempotency-ansible-part-1)
[#]: author: (Chris Binnie https://www.linux.com/users/chrisbinnie)

Linux Server Hardening Using Idempotency with Ansible: Part 1
======

![][1]

[Creative Commons Zero][2]

I think it’s safe to say that the need to frequently update the packages on our machines has been firmly drilled into us. To ensure the use of latest features and also keep security bugs to a minimum, skilled engineers and even desktop users are well-versed in the need to update their software.

Hardware, software and SaaS (Software as a Service) vendors have also firmly embedded the word “firewall” into our vocabulary for both domestic and industrial uses to protect our computers. In my experience, however, even within potentially more sensitive commercial environments, few engineers actively tweak the operating system (OS) they’re working on, to any great extent at least, to bolster security.

Standard fare on Linux systems, for example, might mean looking at configuring a larger swap file to cope with your hungry application’s demands. Or, maybe adding a separate volume to your server for extra disk space, specifying a more performant CPU at launch time, installing a few of your favorite DevOps tools, or chucking a couple of certificates onto the filesystem for each new server you build. This isn’t quite the same thing.

### Improve your Security Posture

What I am specifically referring to is a mixture of compliance and security, I suppose. In short, there’s a surprisingly large number of areas in which a default OS can improve its security posture. We can agree that tweaking certain aspects of an OS are a little riskier than others. Consider your network stack, for example. Imagine that, completely out of the blue, your server’s networking suddenly does something unexpected and causes you troubleshooting headaches or even some downtime. This might happen because a new application or updated package suddenly expects routing to behave in a less-common way or needs a specific protocol enabled to function correctly.

However, there are many changes that you can make to your servers without suffering any sleepless nights. The version and flavor of an OS helps determine which changes and to what extent you might want to comfortably make. Most importantly though what’s good for the goose is rarely good for the gander. In other words every single server estate has different, both broad and subtle, requirements which makes each use case unique. And, don’t forget that a database server also has very different needs to a web server so you can have a number of differing needs even within one small cluster of servers.

Over the last few years I’ve introduced these hardening and compliance tweaks more than a handful of times across varying server estates in my DevSecOps roles. The OSs have included: Debian, Red Hat Enterprise Linux (RHEL) and their respective derivatives (including what I suspect will be the increasingly popular RHEL derivative, Amazon Linux). There have been times that, admittedly including a multitude of relatively tiny tweaks, the number of changes to a standard server build was into the hundreds. It all depended on the time permitted for the work, the appetite for any risks and the generic or specific nature of the OS tweaks.

In this article, we’ll discuss the theory around something called idempotency which, in hand with an automation tool such as Ansible, can provide the ongoing improvements to your server estate’s security posture. For good measure we’ll also look at a number of Ansible playbook examples and additionally refer to online resources so that you can introduce idempotency to a server estate near you.

### Say What?

In simple terms the word “idempotent” just means returning something back to how it was prior to a change. It can also mean that lots of things you wanted to be the same, for consistency, are exactly the same, too.

Picture that in action for a moment on a server estate; we’ll use AWS (Amazon Web Services) as our example. You create a new server image (Amazon Machine Images == AMIs) precisely how you want it with compliance and hardening introduced, custom packages, the removal of unwanted packages, SSH keys, user accounts etc and then spin up twenty servers using that AMI.

You know for certain that all the servers, at least at the time that they are launched, are absolutely identical. Trust me when I say that this is a “good thing” ™. The lack of what’s known as “config drift” means that if one package on a server needs updated for security reasons then all the servers need that package updated too. Or if there’s a typo in a config file that’s breaking an application then it affects all servers equally. There’s less administrative overhead, less security risk and greater levels of predictability in terms of achieving better uptime.

What about config drift from a security perspective? As you’ve guessed it’s definitely not welcome. That’s because engineers making manual changes to a “base OS build” can only lead to heartache and stress. The predictability of how a system is working suffers greatly as a result and servers running unique config become less reliable. These server systems are known as “snowflakes” as they’re unique but far less beautiful than actual snow.

Equally an attacker might have managed to breach one aspect, component or service on a server but not all of its facets. By rewriting our base config again and again we’re able to, with 100% certainty (if it’s set up correctly), predict exactly what a server will look like and therefore how it will perform. Using various tools you can also trigger alarms if changes are detected to request that a pair of human eyes have a look to see if it’s a serious issue and then adjust the base config if needed.

To make our machines idempotent we might overwrite our config changes every 20 or 30 minutes, for example. When it comes to running servers, that in essence, is what is meant by idempotency.

### Central Station

My mechanism of choice for repeatedly writing config across a large number of servers is running Ansible playbooks. It’s relatively easy to implement and removes the all-too-painful additional logic required when using shell scripts. Of the popular configuration management tools I’ve seen in action is Puppet, used successfully on a large government estate in an idempotent manner, but I prefer Ansible due to its more logical syntax (to my mind at least) and its readily available documentation.

Before we look at some simple Ansible examples of hardening an OS with idempotency in mind we should explore how to trigger our Ansible playbooks.

This is a larger area for debate than you might first imagine. Say, for example, you have nicely segmented server estate with production servers being carefully locked away from development servers, sitting behind a production-grade firewall. Consider the other servers on the estate, belonging to staging (pre-production) or other development environments, intentionally having different access permissions for security reasons.

If you’re going to run a centralized server that has superuser permissions (which are required to make privileged changes to your core system files) then that server will need to have high-level access permissions potentially across your entire server estate. It must therefore be guarded very closely.

You will also want to test your playbooks against development environments (in plural) to test their efficacy which means you’ll probably need two all-powerful centralised Ansible servers, one for production and one for the multiple development environments.

The actual approach of how to achieve other logistical issues is up for debate and I’ve heard it discussed a few times. Bear in mind that Ansible runs using plain, old SSH keys (a feature that something other configuration management tools have started to copy over time) but ideally you want a mechanism for keeping non-privileged keys on your centralised servers so you’re not logging in as the “root” user across the estate every twenty minutes or thirty minutes.

From a network perspective I like the idea of having firewalling in place to enforce one-way traffic only into the environment that you’re affecting. This protects your centralised host so that a compromised server can’t attack that main Ansible host easily and then as a result gain access to precious SSH keys in order to damage the whole estate.

Speaking of which, are servers actually needed for a task like this? What about using AWS Lambda (<https://aws.amazon.com/lambda>) to execute your playbooks? A serverless approach stills needs to be secured carefully but unquestionably helps to limit the attack surface and also potentially reduces administrative responsibilities.

I suspect how this all-powerful server is architected and deployed is always going to be contentious and there will never be a one-size-fits-all approach but instead a unique, bespoke solution will be required for every server estate.

### How Now, Brown Cow

It’s important to think about how often you run your Ansible and also how to prepare for your first execution of the playbook. Let’s get the frequency of execution out of the way first as it’s the easiest to change in the future.

My preference would be three times an hour or instead every thirty minutes. If we include enough detail in our configuration then our playbooks might prevent an attacker gaining a foothold on a system as the original configuration overwrites any altered config. Twenty minutes seems more appropriate to my mind.

Again, this is an aspect you need to have a think about. You might be dumping small config databases locally onto a filesystem every sixty minutes for example and that scheduled job might add an extra little bit of undesirable load to your server meaning you have to schedule around it.

Next time, we’ll take a look at some specific changes that can be made to various systems.

_Chris Binnie’s latest book, Linux Server Security: Hack and Defend, shows you how to make your servers invisible and perform a variety of attacks. You can find out more about DevSecOps, containers and Linux security on his website:[https://www.devsecops.cc][3]_

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/linux-server-hardening-using-idempotency-ansible-part-1

作者：[Chris Binnie][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/chrisbinnie
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/geometric-1732847_1280.jpg?itok=YRux0Tua
[2]: /LICENSES/CATEGORY/CREATIVE-COMMONS-ZERO
[3]: https://www.devsecops.cc/
