[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Kubernetes basics: Learn how to drive first)
[#]: via: (https://opensource.com/article/19/6/kubernetes-basics)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux/users/fatherlinux/users/fatherlinux)

Kubernetes basics: Learn how to drive first
======
Quit focusing on new projects and get focused on getting your Kubernetes
dump truck commercial driver's license.
![Truck steering wheel and dash][1]

In the first two articles in this series, I explained how Kubernetes is [like a dump truck][2] and that there are always [learning curves][3] to understanding elegant, professional tools like [Kubernetes][4] (and dump trucks, cranes, etc.). This article is about the next step: learning how to drive.

Recently, I saw a thread on Reddit about [essential Kubernetes projects][5]. People seem hungry to know the bare minimum they should learn to get started with Kubernetes. The "driving a dump truck analogy" helps frame the problem to stay on track. Someone in the thread mentioned that you shouldn't be running your own registry unless you have to, so people are already nibbling at this idea of driving Kubernetes instead of building it.

The API is Kubernetes' engine and transmission. Like a dump truck's steering wheel, clutch, gas, and brake pedal, the YAML or JSON files you use to build your applications are the primary interface to the machine. When you're first learning Kubernetes, this should be your primary focus. Get to know your controls. Don't get sidetracked by all the latest and greatest projects. Don't try out an experimental dump truck when you are just learning to drive. Instead, focus on the basics.

### Defined and actual states

First, Kubernetes works on the principles of defined state and actual state.

![Defined state and actual state][6]

Humans (developers/sysadmins/operators) specify the defined state using the YAML/JSON files they submit to the Kubernetes API. Then, Kubernetes uses a controller to analyze the difference between the new state defined in the YAML/JSON and the actual state in the cluster.

In the example above, the Replication Controller sees the difference between the three pods specified by the user, with one Pod running, and schedules two more. If you were to log into Kubernetes and manually kill one of the Pods, it would start another one to replace it—over and over and over. Kubernetes does not stop until the actual state matches the defined state. This is super powerful.

### **Primitives**

Next, you need to understand what primitives you can specify in Kubernetes.

![Kubernetes primitives][7]

It's more than just Pods; it's Deployments, Persistent Volume Claims, Services, routes, etc. With Kubernetes platform [OpenShift][8], you can add builds and BuildConfigs. It will take you a day or so to get decent with each of these primitives. Then you can dive in deeper as your use cases become more complex.

### Mapping developer-native to traditional IT environments

Finally, start thinking about how this maps to what you do in a traditional IT environment.

![Mapping developer-native to traditional IT environments][9]

The user has always been trying to solve a business problem, albeit a technical one. Historically, we have used things like playbooks to tie business logic to sets of IT systems with a single language. This has always been great for operations staff, but it gets hairier when you try to extend this to developers.

We have never been able to truly specify how a set of IT systems should behave and interact together, in a developer-native way, until Kubernetes. If you think about it, we are extending the ability to manage storage, network, and compute resources in a very portable and declarative way with the YAML/JSON files we write in Kubernetes, but they are always mapped back to "real" resources somewhere. We just don't have to worry about it in developer mode.

So, quit focusing on new projects in the Kubernetes ecosystem and get focused on driving it. In the next article, I will share some tools and workflows that help you drive Kubernetes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/kubernetes-basics

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux/users/fatherlinux/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/truck_steering_wheel_drive_car_kubernetes.jpg?itok=0TOzve80 (Truck steering wheel and dash)
[2]: https://opensource.com/article/19/6/kubernetes-dump-truck
[3]: https://opensource.com/article/19/6/kubernetes-learning-curve
[4]: https://opensource.com/resources/what-is-kubernetes
[5]: https://www.reddit.com/r/kubernetes/comments/bsoixc/what_are_the_essential_kubernetes_related/
[6]: https://opensource.com/sites/default/files/uploads/defined_state_-_actual_state.png (Defined state and actual state)
[7]: https://opensource.com/sites/default/files/uploads/new_primitives.png (Kubernetes primatives)
[8]: https://www.openshift.com/
[9]: https://opensource.com/sites/default/files/uploads/developer_native_experience_-_mapped_to_traditional.png (Mapping developer-native to traditional IT environments)
