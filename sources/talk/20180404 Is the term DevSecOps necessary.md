Is the term DevSecOps necessary?
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2)
First came the term "DevOps."

It has many different aspects. For some, [DevOps][1] is mostly about a culture valuing collaboration, openness, and transparency. Others focus more on key practices and principles such as automating everything, constantly iterating, and instrumenting heavily. And while DevOps isn’t about specific tools, certain platforms and tooling make it a more practical proposition. Think containers and associated open source cloud-native technologies like [Kubernetes][2] and CI/CD pipeline tools like [Jenkins][3]—as well as native Linux capabilities.

However, one of the earliest articulated concepts around DevOps was the breaking down of the “wall of confusion” specifically between developers and operations teams. This was rooted in the idea that developers didn’t think much about operational concerns and operators didn’t think much about application development. Add the fact that developers want to move quickly and operators care more about (and tend to be measured on) stability than speed, and it’s easy to see why it was difficult to get the two groups on the same page. Hence, DevOps came to symbolize developers and operators working more closely together, or even merging roles to some degree.

Of course, calls for improved communications and better-integrated workflows were never just about dev and ops. Business owners should be part of conversations as well. And there are the actual users of the software. Indeed, you can write up an almost arbitrarily long list of stakeholders concerned with the functionality, cost, reliability, and other aspects of software and its associated infrastructure. Which raises the question that many have asked: “What’s so special about security that we need a DevSecOps term?”

I’m glad you asked.

The first is simply that it serves as a useful reminder. If developers and operations were historically two of the most common silos in IT organizations, security was (and often still is) another. Security people are often thought of as conservative gatekeepers for whom “no” often seems the safest response to new software releases and technologies. Security’s job is to protect the company, even if that means putting the brakes on a speedy development process.

Many aspects of traditional security, and even its vocabulary, can also seem arcane to non-specialists. This has also contributed to the notion that security is something apart from mainstream IT. I often share the following anecdote: A year or two ago I was leading a security discussion at a [DevOpsDays][4] event in London in which we were talking about traditional security roles. One of the participants raised his hand and admitted that he was one of those security gatekeepers. He went on to say that this was the first time in his career that he had ever been to a conference that wasn’t a traditional security conference like RSA. (He also noted that he was going to broaden both his and his team’s horizons more.)

So DevSecOps perhaps shouldn’t be a needed term. But explicitly calling it out seems like a good practice at a time when software security threats are escalating.

The second reason is that the widespread introduction of cloud-native technologies, particularly those built around containers, are closely tied to DevOps practices. These new technologies are both leading to and enabling greater scale and more dynamic infrastructures. Static security policies and checklists no longer suffice. Security must become a continuous activity. And it must be considered at every stage of your application and infrastructure lifecycle.

**Here are a few examples:**

You need to secure the pipeline and applications. You need to use trusted sources for content so that you know who has signed off on container images and that they’re up-to-date with the most recent patches. Your continuous integration system must integrate automated security testing. You’ll sometimes hear people talking about “shifting security left,” which means earlier in the process so that problems can be dealt with sooner. But it’s actually better to think about embedding security throughout the entire pipeline at each step of the testing, integration, deployment, and ongoing management process.

You need to secure the underlying infrastructure. This means securing the host Linux kernel from container escapes and securing containers from each other. It means using a container orchestration platform with integrated security features. It means defending the network by using network namespaces to isolate applications from other applications within a cluster and isolate environments (such as dev, test, and production) from each other.

And it means taking advantage of the broader security ecosystem such as container content scanners and vulnerability management tools.

In short, it’s DevSecOps because modern application development and container platforms require a new type of Dev and a new type of Ops. But they also require a new type of Sec. Thus, DevSecOps.

**[See our related story,[Security and the SRE: How chaos engineering can play a key role][5].]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/devsecops

作者：[Gordon Haff][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ghaff
[1]:https://opensource.com/resources/devops
[2]:https://kubernetes.io/
[3]:https://jenkins.io/
[4]:https://www.devopsdays.org/
[5]:https://opensource.com/article/18/3/through-looking-glass-security-sre
