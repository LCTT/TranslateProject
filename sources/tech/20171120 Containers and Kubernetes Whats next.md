YunfengHe Translating
Containers and Kubernetes: What's next?
============================================================

### What's ahead for container orchestration and Kubernetes? Here's an expert peek

![CIO_Big Data Decisions_2](https://enterprisersproject.com/sites/default/files/styles/620x350/public/images/CIO_Big%20Data%20Decisions_2.png?itok=Y5zMHxf8 "CIO_Big Data Decisions_2")

If you want a basic idea of where containers are headed in the near future, follow the money. There’s a lot of it: 451 Research projects that the overall market for containers will hit roughly [$2.7 billion in 2020][4], a 3.5-fold increase from the $762 million spent on container-related technology in 2016.

There’s an obvious fundamental factor behind such big numbers: Rapidly increasing containerization. The parallel trend: As container adoption grows, so will container  _orchestration_  adoption.

As recent survey data from  [_The New Stack_][5]  indicates, container adoption is the most significant catalyst of orchestration adoption: 60 percent of respondents who’ve deployed containers broadly in production report they’re also using Kubernetes widely in production. Another 19 percent of respondents with broad container deployments in production were in the initial stages of broad Kubernetes adoption. Meanwhile, just 5 percent of those in the initial phases of deploying containers in production environments were using Kubernetes broadly – but 58 percent said they were preparing to do so. It’s a chicken-and-egg relationship.


Most experts agree that an orchestration tool is essential to the scalable [long-term management of containers][6] – and corresponding developments in the marketplace. “The next trends in container orchestration are all focused on broadening adoption,” says Alex Robinson, software engineer at [Cockroach Labs][7].

This is a quickly shifting landscape, one that is just starting to realize its future potential. So we checked in with Robinson and other practitioners to get their boots-on-the-ground perspective on what’s next in container orchestration – and for Kubernetes itself.

### **Container orchestration shifts to mainstream**

We’re at the precipice common to most major technology shifts, where we transition from the careful steps of early adoption to cliff-diving into commonplace use. That will create new demand for the plain-vanilla requirements that make mainstream adoption easier, especially in large enterprises.

“The gold rush phase of early innovation has slowed down and given way to a much stronger focus on stability and usability,” Robinson says. “This means we'll see fewer major announcements of new orchestration systems, and more security options, management tools, and features that make it easier to take advantage of the flexibility already inherent in the major orchestration systems.”

### **Reduced complexity**

On a related front, expect an intensifying effort to cut back on the complexity that some organizations face when taking their first plunge into container orchestration. As we’ve covered before, deploying a container might be “easy,” but [managing containers long-term ][8]requires more care.

“Today, container orchestration is too complex for many users to take full advantage,” says My Karlsson, developer at [Codemill AB][9]. “New users are often struggling just to get single or small-size container configurations running in isolation, especially when applications are not originally designed for it. There are plenty of opportunities to simplify the orchestration of non-trivial applications and make the technology more accessible.”

### **Increasing focus on hybrid cloud and multi-cloud**

As adoption of containers and container orchestration grows, more organizations will scale from a starting point of, say, running non-critical workloads in a single environment to more [complex use cases][10] across multiple environments. For many companies, that will mean managing containerized applications (and particularly containerized microservices) across [hybrid cloud][11] and [multi-cloud][12] environments, often globally.

"Containers and Kubernetes have made hybrid cloud and application portability a reality,” says [Brian Gracely][13], director of [Red Hat][14] OpenShift product strategy. “Combined with the Open Service Broker, we expect to see an explosion of new applications that combine private and public cloud resources."

“I believe that federation will get a push, enabling much-wanted features such as seamless multi-region and multi-cloud deployments,” says Carlos Sanchez, senior software engineer at [CloudBees][15]. 

**[ Want CIO wisdom on hybrid cloud and multi-cloud strategy? See our related resource, **[**Hybrid Cloud: The IT leader's guide**][16]**. ]**

### **Continued consolidation of platforms and tools**

Technology consolidation is common trend; container orchestration is no exception.

“As containerization goes mainstream, engineers are consolidating on a very small number of technologies to run their [microservices and] containers and Kubernetes will become the dominant container orchestration platform, far outstripping other platforms,” says Ben Newton, analytics lead at [Sumo Logic][17]. “Companies will adopt Kubernetes to drive a cloud-neutral approach as Kubernetes provides a reasonably clear path to reduce dependence on [specific] cloud ecosystems.**”**

### **Speaking of Kubernetes, what’s next?**

"Kubernetes is here for the long haul, and the community driving it is doing great job – but there's lots ahead,” says Gadi Naor, CTO and co-founder of [Alcide][18]. Our experts shared several predictions specific to [the increasingly popular Kubernetes platform][19]: 

 **_Gadi Naor at Alcide:_**  “Operators will continue to evolve and mature, to a point where applications running on Kubernetes will become fully self-managed. Deploying and monitoring microservices on top of Kubernetes with [OpenTracing][20] and service mesh frameworks such as [istio][21] will help shape new possibilities.”

 **_Brian Gracely at Red Hat:_**  “Kubernetes continues to expand in terms of the types of applications it can support. When you can run traditional applications, cloud-native applications, big data applications, and HPC or GPU-centric applications on the same platform, it unlocks a ton of architectural flexibility.”

 **_Ben Newton at Sumo Logic: _ “**As Kubernetes becomes more dominant, I would expect to see more normalization of the operational mechanisms – particularly integrations into third-party management and monitoring platforms.”

 **_Carlos Sanchez at CloudBees: _** “In the immediate future there is the ability to run without Docker, using other runtimes...to remove any lock-in. [Editor’s note: [CRI-O][22], for example, offers this ability.] “Also, [look for] storage improvements to support enterprise features like data snapshotting and online volume resizing.”


 **_Alex Robinson at Cockroach Labs: _ “**One of the bigger developments happening in the Kubernetes community right now is the increased focus on managing [stateful applications][23]. Managing state in Kubernetes right now is very difficult if you aren't running in a cloud that offers remote persistent disks, but there's work being done on multiple fronts [both inside Kubernetes and by external vendors] to improve this.”

--------------------------------------------------------------------------------

via: https://enterprisersproject.com/article/2017/11/containers-and-kubernetes-whats-next

作者：[Kevin Casey ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://enterprisersproject.com/user/kevin-casey
[1]:https://enterprisersproject.com/article/2017/11/kubernetes-numbers-10-compelling-stats
[2]:https://enterprisersproject.com/article/2017/11/how-enterprise-it-uses-kubernetes-tame-container-complexity
[3]:https://enterprisersproject.com/article/2017/11/5-kubernetes-success-tips-start-smart?sc_cid=70160000000h0aXAAQ
[4]:https://451research.com/images/Marketing/press_releases/Application-container-market-will-reach-2-7bn-in-2020_final_graphic.pdf
[5]:https://thenewstack.io/
[6]:https://enterprisersproject.com/article/2017/10/microservices-and-containers-6-management-tips-long-haul
[7]:https://www.cockroachlabs.com/
[8]:https://enterprisersproject.com/article/2017/10/microservices-and-containers-6-management-tips-long-haul
[9]:https://codemill.se/
[10]:https://www.redhat.com/en/challenges/integration?intcmp=701f2000000tjyaAAA
[11]:https://enterprisersproject.com/hybrid-cloud
[12]:https://enterprisersproject.com/article/2017/7/multi-cloud-vs-hybrid-cloud-whats-difference
[13]:https://enterprisersproject.com/user/brian-gracely
[14]:https://www.redhat.com/en
[15]:https://www.cloudbees.com/
[16]:https://enterprisersproject.com/hybrid-cloud?sc_cid=70160000000h0aXAAQ
[17]:https://www.sumologic.com/
[18]:http://alcide.io/
[19]:https://enterprisersproject.com/article/2017/10/how-explain-kubernetes-plain-english
[20]:http://opentracing.io/
[21]:https://istio.io/
[22]:http://cri-o.io/
[23]:https://opensource.com/article/17/2/stateful-applications
[24]:https://enterprisersproject.com/article/2017/11/containers-and-kubernetes-whats-next?rate=PBQHhF4zPRHcq2KybE1bQgMkS2bzmNzcW2RXSVItmw8
[25]:https://enterprisersproject.com/user/kevin-casey