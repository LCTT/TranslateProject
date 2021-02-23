[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (8 Kubernetes insights for 2021)
[#]: via: (https://opensource.com/article/21/1/kubernetes)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

8 Kubernetes insights for 2021
======
Review the top five Kubernetes articles of 2020, then preview three
tools you should learn about in 2021.
![Ship captain sailing the Kubernetes seas][1]

The end of the year is the perfect time to look back and explore where we've been and where we're going in the Kubernetes world. I particularly want to focus on the ecosystem that formed around Kubernetes in 2020, which several great articles on Opensource.com covered. I'll review them in the order they were published.

It all started in February with a great article called [_Basic kubectl and Helm commands for beginners_][2] by Jessica Cherry. Jess introduces readers to two simple tools to get started with Kubernetes: kubectl, technically part of Kubernetes, and Helm, which makes it easier to install and set up applications on Kubernetes. These tools are extremely useful for new Kubernetes users.

In March, Lee Carpenter wrote about [_Directing Kubernetes traffic with Traefik_][3]. The article gives a good background on how networking works in Kubernetes and how to configure things in the application definition (Kube YAML). Before reading Lee's article, I hadn't tracked Kubernetes networking closely for a while, and I learned that Traefik comes preconfigured now as an Ingress controller. Very cool.

Kubernetes was a popular topic on Opensource.com in March because Manuel Dewald published [_Build a Kubernetes Operator in 10 minutes with Operator SDK_][4]. This article is a bit more advanced than the first two. Manuel explains a powerful concept in Kubernetes called Operators. You can think of Operators as robot sysadmins that are deployed side-by-side with applications on Kubernetes. They do things like installing and upgrading applications, checking database tables, and backing up or restoring data. Manuel shows how to build a simple Operator to install software.

In June, my friend Chris Collins published [_Manage your Kubernetes cluster with Lens_][5], a user interface that describes itself as "the Kubernetes IDE." Lens runs on a laptop or a jump box and connects to Kubernetes. It gives the ability to gather metrics and cluster status and do a whole bunch of other things.

In July, Jess Cherry was back with [_A guide to Terraform for Kubernetes beginners_][6]. Some Kubernetes objects, like Deployments, track state changes, but many don't. Jess shows how to use Terraform to control all state changes to a Kubernetes cluster, making it easy to return to a pristine state after testing a bunch of software on a Kubernetes cluster.

### Bonus tools to learn about in 2021

And, as we enter this new year, I want to share a few bonus tools to put on your 2021 learning list.

First, check out [KIND (Kubernetes in Docker)][7]. It lets you run a whole Kubernetes cluster with a single command. But don't let the name fool you; you can also use Podman as the container engine. It's very cool to see these kinds of upstream integrations between different projects. Showing KIND using Podman to fire up Kubernetes would be a great article for 2021!

Another tool to know about is [KubeInit][8], which uses Ansible to deploy Kubernetes clusters. If you speak Spanish, watch our interview with Carlos Camacho on [OpenShift Commons En Vivo][9].

Finally, if you are looking for a super-simple way to get started with Kubernetes, check out [Minikube][10]. Like KIND, Minkube can start a Kube cluster with a single command. Also like KIND, there is a driver for Podman ([Minikube Podman Driver][11]). Multiple authors mentioned Minikube in 2020, but it's been a little while since we've had a dedicated article on the tool.

Like most of us, I am looking forward to 2021 being a better year, and I'm excited to see what great Kubernetes articles are published on Opensource.com!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/kubernetes

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: http://opensource.com/article/20/2/kubectl-helm-commands
[3]: http://opensource.com/article/20/3/kubernetes-traefik
[4]: http://opensource.com/article/20/3/kubernetes-operator-sdk
[5]: http://opensource.com/article/20/6/kubernetes-lens
[6]: http://opensource.com/article/20/7/terraform-kubernetes
[7]: https://kind.sigs.k8s.io/docs/contributing/1.0-roadmap
[8]: https://github.com/Kubeinit/kubeinit
[9]: https://www.youtube.com/watch?v=9_6H7Ahsdm4
[10]: https://minikube.sigs.k8s.io/docs/start/
[11]: https://minikube.sigs.k8s.io/docs/drivers/podman/
