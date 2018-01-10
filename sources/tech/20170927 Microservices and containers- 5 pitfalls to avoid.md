Translating by qhwdw
Microservices and containers: 5 pitfalls to avoid
======

![](https://enterprisersproject.com/sites/default/files/styles/620x350/public/images/CIO%20Containers%20Ecosystem.png?itok=lDTaYXzk)

Because microservices and containers are a [match made in heaven][1], it might seem like nothing could go wrong. Let's get these babies into production as quickly as possible, then kick back and wait for the IT promotions and raises to start flooding in. Right?

(We'll pause while the laughter subsides.)

Yeah, sorry. That's just not how it works. While the two technologies can be a powerful combination, realizing their potential doesn't happen without some effort and planning. In previous posts, we've tackled what you should [know at the start][2]. But what about the most common problems organizations encounter when they run microservices in containers?

Knowing these potential snafus in advance can help you avoid them and lay a more solid foundation for success.

It starts with being realistic about your organization's needs, knowledge, resources, and more. "One common [mistake] is to try to adopt everything at once," says Mac Browning, engineering manager at [DigitalOcean][3]. "Be realistic about how your company adopts containers and microservices."

**[ Struggling to explain microservices to your bosses and colleagues? Read our primer on[how to explain microservices in plain English][4]. ]**

Browning and other IT pros shared five pitfalls they see organizations encounter with containerized microservices, especially early in their production lifespan. Knowing them will help you develop your own realistic organizational assessment as you build your strategy for microservices and containers.

### 1. Trying to learn both from scratch simultaneously

If you're just starting to move away from 100% monolithic applications, or if your organization doesn't already a deep knowledge base for containers or microservices, remember this: Microservices and containers aren't actually tethered to one another. That means you can develop your in-house expertise with one before adding the other. Kevin McGrath, senior CTO architect at [Sungard Availability Services][5], recommends building up your team's knowledge and skills with containers first, by containerizing existing or new applications, and then moving to a microservices architecture where beneficial in a later phase.

"Companies that run microservices extremely well got there through years of iteration that gave them the ability to move fast," McGrath says. "If the organization cannot move fast, microservices are going to be difficult to support. Learn to move fast, which containers can help with, then worry about killing the monolith."

### 2. Starting with a customer-facing or mission-critical application

A related pitfall for organizations just getting started with containers, microservices, or both: Trying to tame the lion in the monolithic jungle before you've gotten some practice with some animals lower on the food chain.

Expect some missteps along your team's learning curve - do you want those made with a critical customer-facing application or, say, a lower-stakes service visible only to IT or other internal teams?

"If the entire ecosystem is new, then adding their use into lower-impact areas like your continuous integration system or internal tools may be a low-risk way to gain some operational expertise [with containers and microservices," says Browning of DigitalOcean. "As you gain experience, you'll naturally find new places you can leverage these technologies to deliver a better product to your customers. The fact is, things will go wrong, so plan for them in advance."

### 3. Introducing too much complexity without the right team in place

As your microservices architecture scales, it can generate complex management needs.

As [Red Hat][6] technology evangelist [Gordon Haff][7] recetly wrote, "An OCI-compliant container runtime by itself is very good at managing single containers. However, when you start using more and more containers and containerized apps, broken down into hundreds of pieces, management and orchestration gets tricky. Eventually, you need to take a step back and group containers to deliver services - such as networking, security, and telemetry - across your containers."

"Furthermore, because containers are portable, it's important that the management stack that's associated with them be portable as well," Haff notes. "That's where orchestration technologies like [Kubernetes][8] come in, simplifying this need for IT." (See the full article by Haff: [5 advantages of containers for writing applications][1]. )

In addition, you need the right team in place. If you're already a  [DevOps shop][9], you might be particularly well-suited for the transition. Regardless, put a cross-section of people at the table from the start.

"As more services get deployed overtime, it can become unwieldy to manage," says Mike Kavis, VP and principal cloud architect at [Cloud Technology Partners][10]. "In the true essence of DevOps, make sure that all domain experts - dev, test, security, ops, etc. - are participating up front and collaborating on the best ways to build, deploy, run, and secure container-based microservices.

### 4. Ignoring automation as a table-stakes requirement

In addition to the having the right team, organizations that have the most success with container-based microservices tend to tackle the inherent complexity with an "automate as much as possible" mindset.

"Distributed architectures are not easy, and elements like data persistence, logging, and debugging can get really complex in microservice architectures," says Carlos Sanchez, senior software engineer at [CloudBees][11], of some of the common challenges. By definition, those distributed architectures that Sanchez mentions will become a Herculean operational chore as they grow. "The proliferation of services and components makes automation a requirement," Sanchez advises. "Manual management will not scale."

### 5. Letting microservices fatten up over time

Running a service or software component in a container isn't magic. Doing so does not guarantee that, voila, you've got a microservice. Manual Nedbal, CTO at [ShieldX Networks][12], notes that IT pros need to ensure their microservices stay microservices over time.

"Some software components accumulate lots of code and features over time. Putting them into a container does not necessarily generate microservices and may not yield the same benefits," Nedbal says. "Also, as components grow in size, engineers need to be watchful for opportunities to break up evolving monoliths again."

--------------------------------------------------------------------------------

via: https://enterprisersproject.com/article/2017/9/using-microservices-containers-wisely-5-pitfalls-avoid

作者：[Kevin Casey][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://enterprisersproject.com/user/kevin-casey
[1]:https://enterprisersproject.com/article/2017/8/5-advantages-containers-writing-applications
[2]:https://enterprisersproject.com/article/2017/9/microservices-and-containers-6-things-know-start-time
[3]:https://www.digitalocean.com/
[4]:https://enterprisersproject.com/article/2017/8/how-explain-microservices-plain-english?sc_cid=70160000000h0aXAAQ
[5]:https://www.sungardas.com/
[6]:https://www.redhat.com/en
[7]:https://enterprisersproject.com/user/gordon-haff
[8]:https://www.redhat.com/en/containers/what-is-kubernetes
[9]:https://enterprisersproject.com/article/2017/8/devops-jobs-how-spot-great-devops-shop
[10]:https://www.cloudtp.com/
[11]:https://www.cloudbees.com/
[12]:https://www.shieldx.com/
