[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 interview questions every Kubernetes job candidate should know)
[#]: via: (https://opensource.com/article/19/12/kubernetes-interview-questions)
[#]: author: (Jessica Repka https://opensource.com/users/jrepka)

5 interview questions every Kubernetes job candidate should know
======
If you're interviewing people for Kubernetes-related roles, here's what
to ask and why it matters.
![Pair programming][1]

Job interviews are hard for people on both sides of the table, but I've discovered that interviewing candidates for Kubernetes-related jobs has seemed especially hard lately. Why, you ask? For one thing, it's hard to find someone who can answer some of my questions. Also, it has been hard to confirm whether they have the right experience, regardless of their answers to my questions.

I'll skip over my musings on that topic and get to some questions that you should ask of any job candidate who would be working with [Kubernetes][2].

### What is Kubernetes?

I've always found this question to be one of the best ones to ask in interviews. I always hear, "I work with Kubernetes," but when I ask, "what is it?" I never get a confident answer.

My favorite answer is from [Chris Short][3]: "Just an API with some YAML files."

While he is not wrong, I'll give you a more detailed version. Kubernetes is a portable container orchestration tool that is used to automate the tasks of managing, monitoring, scaling, and deploying containerized applications.

I've found that "an orchestration tool for deploying containerized applications" is probably as good as you're going to get as an answer, which in my opinion is good enough. While many believe Kubernetes adds a great deal more, overall, it offers many APIs to add to this core feature: container orchestration.

In my opinion, this is one of the best questions you can ask in an interview, as it at least proves whether the candidate knows what Kubernetes is.

### What is the difference between a Kubernetes node and a pod?

This question reveals a great first look at the complexity of Kubernetes. It shifts the conversation to an architectural overview and can lead to many interesting follow-up details. It has also been explained incorrectly to me an innumerable amount of times.

A [node][4] is the worker machine. This machine can be a virtual machine (VM) or a physical machine, depending on whether you are running on a hypervisor or on bare metal. The node contains services to run containers, including the kubelet, kube-proxy, and container runtime.

A [pod][5] includes (1) one or more containers (2) with shared network (3) and storage (4) and the specification on how to run the containers deployed together. All four of these details are important. For bonus points, an applicant could mention that, technically, a pod is the smallest deployable unit Kubernetes can create and manage—not a container.

The best short answer I've received for this question is: "The node is the worker, and the pod is the thing the containers are in." The distinction matters. Most of a Kubernetes administrator's job depends on knowing when to deploy what, and nodes can be very, very expensive, depending on where they are run. I wouldn't want someone deploying nodes over and over when what they needed to do was deploy a bunch of pods.

### What is kubectl? (And how do you pronounce it?)

This question is one of my higher priority questions, but it may not be relevant for you and your team. In my organization, we don't use a graphical interface to manage our Kubernetes environments, which means command-line actions are all we do.

So what is [kubectl][6]? It is the command-line interface to Kubernetes. You can get and set anything from there, from gathering logs and events to editing deployments and secrets. It's always helpful to pop in a random question about how to use this tool to test the interviewee's familiarity with kubectl.

How do you pronounce it? Well, that's up to you (there's a big disagreement on the matter), but I will gladly point you to this great video presentation by my friend [Waldo][7].

### What is a namespace?

I haven't received an answer to this question on multiple interviews. I am not sure that namespaces are used as often in other environments as they are in the organization I work in. I'll give a short answer here: a namespace is a virtual cluster in a pod. This abstraction is what enables you to keep several virtual clusters in various environments for isolation purposes.

### What is a container?

It always helps to know what is being deployed in your pod, because what's a deployment without knowing what you're deploying in it? A container is a standard unit of software that packages up code and all its dependencies. Two optional secondary answers I have received and am OK with include: a) a slimmed-down image of an OS and b) an application running in a limited OS environment. Bonus points if you can name orchestration software that uses containers other than [Docker][8], like your favorite public cloud's container service.

### Other questions

If you're wondering why I didn't add more to this list of questions, I have an easy answer for you: these are the minimum set of things _you_ should know when you are asking candidates interview questions. The next set of questions should come from a large list of questions based on your specific team, environment, and organization. As you think through these, try to find interesting questions about how technology interacts with each other to see how people think through infrastructure challenges. Think about recent challenges your team had (outages), ask to walk through deployments step-by-step, or about strategies to improve something your team actively wants to improve (like a reduction to deployment time). The less abstract the questions, the more your asking about skills that will actually matter after the interview.

**[Read more: [How to prepare for a Kubernetes job interview]][9]**

No two environments will be the same, and this also applies when you are interviewing people. I mix up questions in every interview. I also have a small environment I can use to test interviewees. I always find that answering the questions is the easiest part, and doing the work is the real test you need to give.

My last bit of advice for anyone giving interviews: If you meet someone who has potential but none of the experience, give them a chance to prove themselves. I wouldn't have the knowledge and experience I have today if someone hadn't seen the potential of what I could do and given me an opportunity.

What are other important questions to ask interviewees about Kubernetes? Please add your list in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/kubernetes-interview-questions

作者：[Jessica Repka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard.png?itok=kBeRTFL1 (Pair programming)
[2]: https://kubernetes.io/
[3]: https://twitter.com/ChrisShort
[4]: https://kubernetes.io/docs/concepts/architecture/nodes/
[5]: https://kubernetes.io/docs/concepts/workloads/pods/pod/
[6]: https://kubernetes.io/docs/reference/kubectl/kubectl/
[7]: https://opensource.com/article/18/12/kubectl-definitive-pronunciation-guide
[8]: https://opensource.com/resources/what-docker
[9]: https://enterprisersproject.com/article/2019/2/kubernetes-job-interview-questions-how-prepare
