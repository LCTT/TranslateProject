[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a Kubernetes Minecraft server with Ansible's Helm modules)
[#]: via: (https://opensource.com/article/20/10/kubernetes-minecraft-ansible)
[#]: author: (Jeff Geerling https://opensource.com/users/geerlingguy)

Build a Kubernetes Minecraft server with Ansible's Helm modules
======
Deploy a Minecraft server into a Kubernetes cluster with Ansible's new
collections.
![Ship captain sailing the Kubernetes seas][1]

One of the best outcomes of Ansible's [move towards content collections][2] is it spreads the thousands of modules in [Ansible][3]'s "core" repository into many more independent repositories. This means movement on issues and modules that had long been delayed (often due to the [sheer volume of issues and pull requests][4] in the repo) can progress more rapidly.

Obviously, not all modules will get the same love and appreciation as others—that's the way open source works: more popular things flourish, as others may languish a bit—but one bright example of the positive impact has been the [Kubernetes][5] collection's ability to incorporate some long-awaited [Helm][6] modules.

Thanks especially to the work of [LucasBoisserie][7], three new Helm modules were merged into the Kubernetes collection:

  * helm
  * helm_info
  * helm_repository



Ansible has long had a [helm module][8], but it was fairly broken for a long time, only worked with older versions of Helm, and was slated for deprecation in Ansible 2.14. That version of the module will still work the same in the regular community distribution of Ansible, as it's now been moved to the [community.general][9] collection.

But if you want to use these new modules to automate your Helm deployments using the Kubernetes container orchestration system, you can do it with the [community.kubernetes][10] collection.

### What is Helm?

Helm says it is "the best way to find, share, and use software built for Kubernetes."

There are currently dozens of ways to deploy software into Kubernetes and [OpenShift][11] clusters (you can even do it using Ansible natively with the [k8s module][12]), but Helm is often the easiest onramp to Kubernetes deployments, especially when you're starting out on your Kubernetes journey.

The way Helm works is that people maintain "charts," which are templates describing "how to deploy application XYZ" into Kubernetes. Charts can have "values" that override the default settings for a deployment's chart.

There are thousands of [charts on Helm Hub][13] you can use to install popular software. If your software is not included, you can build and host your own Helm chart repositories.

### What is Minecraft?

For a certain generation (or their parents), this question doesn't need an answer: [Minecraft][14] is the [best-selling video game of all time][15], and it appeals to an extremely wide audience because there are so many different ways you can play it.

I remember spending an hour here or there during my post-college years tending to a farm that I built in my little virtual Minecraft world. Minecraft can now run on almost any computing device with a screen, and networked play has become very popular. To support this, the Minecraft team maintains a [Minecraft server][16] application you can run to play networked games with your friends.

### Where does Ansible fit in?

I like to think of Ansible as the "glue" that holds automation together. I previously wrote about [how Ansible is useful in a cloud-native environment][17], so I won't rehash why I use Ansible to manage my Kubernetes infrastructure.

In this article, I'll show you how to write a short Ansible playbook to manage the setup of Helm's Minecraft chart in a cluster. In a real-world infrastructure, this playbook would be one small part of a set of plays that:

  * Build or configure a Kubernetes cluster
  * Deploy monitoring tools into the cluster
  * Deploy applications into the cluster



Before you can write the playbook, you have to install Ansible's official [Kubernetes collection][10]. You can do this either by requiring it in a **requirements.yml** file (which could be used by Ansible Tower to install the collection automatically) or by manually installing it:


```
`ansible-galaxy collection install community.kubernetes`
```

Once you have the collection, it's time to write the playbook. To make it easy for you to view the code or download the file, I've posted my **[minecraft.yml][18] **playbook as a Gist on GitHub.

The playbook uses many of the Kubernetes collection's modules:

  1. The `k8s` module creates a namespace, `minecraft`.
  2. The `helm_repository` module adds the `itzg` Helm repository, which contains the Minecraft Helm chart.
  3. The `helm` module deploys the chart and creates the Minecraft server instance.
  4. The `k8s_info` module retrieves the NodePort where Minecraft is running so that you can connect to it from Minecraft.



The playbook assumes you have a running Kubernetes or OpenShift cluster and a kubeconfig file that points to that cluster already. If not, create a Minikube cluster on your workstation:

  1. Make sure you have [Minikube][19] installed.
  2. Run `minikube start`, and wait for the cluster to be created.



Make sure you have [Ansible][20] and [Helm][21] installed, then run the playbook:


```
`ansible-playbook minecraft.yml`
```

After a few minutes, the Minecraft server will generate a spawn area and be ready for connections! The playbook should provide the Minecraft NodePort at the end of its output (e.g., Minecraft NodePort: 32393).

Get the IP address of your Minikube cluster with `minikube ip`, add the NodePort to it (in my case, 192.168.64.19:32393), then open up Minecraft and connect to it:

  1. Click **Multiplayer**.
  2. Click **Direct Connection**.
  3. Enter the server address (the Minikube IP and Minecraft NodePort).
  4. Click **Join Server**.



And voila! You should be able to play around in the little virtual Minecraft world that's running on your very own Kubernetes cluster.

![Minecraft gameplay][22]

(Jeff Geerling, [CC BY-SA 4.0][23])

View the server logs with:


```
`kubectl logs -f -n minecraft -l app=minecraft-minecraft;`
```

In the logs, you can see that I was successful in finding many ways to die inside my little Minecraft world!

![Minecraft server logs][24]

(Jeff Geerling, [CC BY-SA 4.0][23])

### Take a step beyond

There are dozens of ways to deploy applications like a Minecraft server into a Kubernetes cluster. Luckily for us, Ansible already supports most of those options through its Kubernetes collection! And if you want to take a step beyond simple deployments and chart updates, you can use Ansible to build a [Kubernetes operator][25] with the Operator SDK—in fact, someone already made a [community operator][26] built with Ansible that runs a Minecraft server!

I was inspired to write this after using Ansible to manage a seven-node Kubernetes cluster built with Raspberry Pis. You can learn more about that in the [Turing Pi Cluster][27] GitHub repository.

* * *

If you want to learn more about Ansible, make sure to register for [AnsibleFest][28], a virtual experience on October 13-14.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/kubernetes-minecraft-ansible

作者：[Jeff Geerling][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/geerlingguy
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://github.com/ansible-collections/overview
[3]: https://www.ansible.com/
[4]: https://emeraldreverie.org/2020/03/02/collections-the-backlog-view/
[5]: https://kubernetes.io/
[6]: https://helm.sh/
[7]: https://github.com/LucasBoisserie
[8]: https://docs.ansible.com/ansible/2.9/modules/helm_module.html
[9]: https://github.com/ansible-collections/community.general/blob/master/plugins/modules/cloud/misc/helm.py
[10]: https://github.com/ansible-collections/community.kubernetes
[11]: https://www.openshift.com/
[12]: https://docs.ansible.com/ansible/latest/collections/community/kubernetes/k8s_module.html#ansible-collections-community-kubernetes-k8s-module
[13]: https://hub.helm.sh/
[14]: https://www.minecraft.net/
[15]: https://en.wikipedia.org/wiki/List_of_best-selling_video_games#List
[16]: https://www.minecraft.net/en-us/download/server/
[17]: https://www.ansible.com/blog/how-useful-is-ansible-in-a-cloud-native-kubernetes-environment
[18]: https://gist.github.com/geerlingguy/2f4b0c06b4b696c8983b82dda655adf3
[19]: https://kubernetes.io/docs/tasks/tools/install-minikube/
[20]: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
[21]: https://helm.sh/docs/intro/install/
[22]: https://opensource.com/sites/default/files/uploads/minecraft.png (Minecraft gameplay)
[23]: https://creativecommons.org/licenses/by-sa/4.0/
[24]: https://opensource.com/sites/default/files/uploads/serverlogs.png (Minecraft server logs)
[25]: https://www.redhat.com/en/topics/containers/what-is-a-kubernetes-operator
[26]: https://github.com/fabianvf/game-server-operator
[27]: https://github.com/geerlingguy/turing-pi-cluster
[28]: https://www.ansible.com/ansiblefest
