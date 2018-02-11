3 Ways to Extend the Power of Kubernetes
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/chen-goldberg-kubecon.png?itok=WR_4i31u)

The ability to extend Kubernetes is its secret superpower, said Chen Goldberg, Director of Engineering at Google, speaking at the recent [KubeCon + CloudNativeCon][1] in Austin.

In the race to build tools that help engineers become more productive, Goldberg talked about how she once led a team that developed a platform that did just that. Despite the fact the platform initially worked, it was not extensible, and it was also difficult to modify.

Fortunately, said Goldberg, Kubernetes suffers from neither of these problems. To begin with, Kubernetes is self-healing system, as it uses controllers that implement what is called a " _Reconciliation Loop._ " In a reconciliation loop, a controller observes the current state of the system and compares it to its desired state. Once it has established the difference between each of these two states, it works towards achieving the desired state. This makes Kubernetes well-adapted to dynamic environments.

### 3 Ways to Extend Kubernetes

Goldberg then explained that to build the controllers, you need resources, that is, you need to extend Kubernetes. There are three ways to do that and, from the most flexible (but also more difficult) to the easiest they are: using a Kube aggregator, using an API server builder, or creating a Custom Resource Definition (or CRD).

The latter allows to extend Kubernetes' functionality even with minimal coding. To demonstrate how it is done, Goggle Software Engineer Anthony Yeh came on stage and showcased adding a stateful set to Kubernetes. (Stateful sets objects used to manage stateful applications, that is applications that need to store the state of the application, keeping track of, for example, a user's identity and their personal settings.) Using _catset_ , a CRD implemented in 100 lines of JavaScript in one single file, Yeh showed how you can add a stateful set to a Kubernetes deployment. A prior extension that was not a CRD, required 24 files and over 3,000 lines of code.

Addressing the issue of reliability of CRDs, Goldberg said Kubernetes had started a certification program that allows companies to register and certify their extensions for the Kubernetes community. In one month over 30 companies had signed up for the program.

Goldberg went on to explain how the extensibility of Kubernetes was a hot topic in this year's KubeCon, and how Google and IBM were building a platform to manage and secure microservices using CRDs. Or how some developers were bringing machine-learning to Kubernetes, and others were demonstrating open service broker and the consumption of services on hybrid settings.

In conclusion, Goldberg said, extensibility is about empowerment. And, the extensibility of Kubernetes makes it a general purpose and easy to use platform for developers, which allows them to run any application.

You can watch the entire video below:

https://www.youtube.com/embed/1kjgwXP_N7A?enablejsapi=1

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/event/kubecon/2018/2/3-ways-extend-power-kubernetes

作者：[PAUL BROWN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:http://events17.linuxfoundation.org/events/kubecon-and-cloudnativecon-north-america
