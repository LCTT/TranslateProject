[#]: subject: (5 more reasons to run Kubernetes in your Linux homelab)
[#]: via: (https://opensource.com/article/21/6/kubernetes-linux-homelab)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (chai001125)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 more reasons to run Kubernetes in your Linux homelab
======
Kubernetes' advantages aren't just what it can do, they're also what
knowing it can do for you.
![Working from home at a laptop][1]

In [5 reasons to run Kubernetes on your Raspberry Pi homelab][2], I explain why you might want to use Kubernetes at home. Those reasons are relatively arbitrary, and they mostly focus on outcomes. Aside from what Kubernetes can do, there are several other good reasons to look at Kubernetes as an important next step in your personal computing experience.

### 1\. It's built on the foundation of Linux

![T-shirt reading "Containers are Linux"][3]

(Seth Kenlon, [CC BY-SA 4.0][4])

Kubernetes has a certain reputation. More accurately, it has several reputations. For some people, it's a mysterious technology with an unpronounceable name. To other people, it's a sheepdog helping them herd an over-abundance of containers. For others, it's a kind of operating system for the cloud, a useful interface to effective cloud development. And for most people, probably, it's back-end software they've never even heard of. As you might expect, it's all of these things and more.

Not everyone interacts with Kubernetes the same way, but if you have an inclination toward systems administration, you'll find that Kubernetes is _just another Linux command_.

I have a t-shirt that reads "Containers are Linux," which states what is, upon reflection, obvious. Container technology uses cgroups to run images of a minimal Linux operating system containing an application or set of applications. From start to finish, when you choose to run a container, you're choosing to run Linux. While Kubernetes commands run on many platforms, it's managing Linux containers, and when you interact with Kubernetes through a terminal, it's Linux business as usual: command, options, args, syntax. Running `kubeadm` or (on OKD or OpenShift) `oc` commands feels familiar because they work like any other Linux command you're used to running. What starts out seeming foreign feels natural in no time, and any Linux user interested in spending time in the terminal can find plenty of fun things to explore in Kubernetes.

### 2\. Flexible

Kubernetes used to be a little rigid. It supported, essentially, one container runtime—so stringently, in fact, that there's a hardcoded shim to this day to get around that legacy. Luckily, today Kubernetes has become flexible enough to allow for admins' many diverse needs. There's [Podman][5] and [CRI-O][6] available as container engines, both of which can integrate with [systemd][7]. (I meant what I said when I told you it was all Linux underneath.) You have choices of filesystems, cluster size and construction, monitoring tools, images, programming languages, and much more. Frankly, some people say there's _too much_ choice, which is usually when I suspect that after a few more years, it'll have just enough choice for me.

### 3\. Personal development

Containers are a fruitful business, and they have the habit of multiplying rapidly. That's by design. Containers are meant to scale, and they scale by spawning clones. Stick the containers into groups (call them _pods_), and automate how pod lifecycles are managed. That's all Kubernetes really is, and it's changing how servers can run.

You might not need an infinitely scaleable collection of containers, and you may not need anything to help you manage the one or two containers you do run. However, if you're looking to profit from your ability to wrangle pods, then Kubernetes is exactly the tool you want. As more and more companies and organizations go global and embrace [digital transformation][8], Kubernetes is becoming a required skill in IT. If that's the path you're on, it's a good investment to learn it now and get familiar with common problems and their solutions.

### 4\. Make containers make sense

You may remember several years ago when open source projects started distributing their code as container images. For many, it was puzzling at the time. Not many admins really [understood what a container was][9], or where the boundaries of the imaginary container were, or how to get into the container, or why data couldn't live inside the container.

Now, the IT world—including developers—is comfortable with the concept of containers. Delivery to containers just makes sense for a modern [CI/CD workflow][10]. For the sysadmin, though, the advantages of containers are twofold: installation is (theoretically) easier than waiting for a distro to update its packages, and containers scale. Yet it's very likely that neither of these benefits really manifests for you until you've used Kubernetes. Once you start managing containers with Kubernetes and related tools, the benefits of continuous delivery and the ability to scale are probably merely ideas you've read about. Integrate containers into how you manage your servers, and you suddenly understand what the excitement is all about.

![Apache JMeter][11]

(Seth Kenlon, [CC BY-SA 4.0][4])

The most basic of tests makes it pretty clear. Just spin up your favorite web server in a container, create a pod, then hit your server with traffic from [Apache JMeter][12], and watch containers respond.

### 5\. Cloud-native

If you do more development than systems administration, Kubernetes provides an excellent platform for what has easily become the biggest target of all: web apps. We all use web apps now, even though most people just think of them as "websites." The web has a hugely significant user base (to say the least), so it makes sense to provide open source applications through the browser. There are some great open source applications that run over a network, and many of those are delivered as containers to provide easy installation and a consistent user experience.

### Bonus: It's fun

Remember when you were still new to Linux? For some people, that might have been decades ago, and for others, it's still around the corner. For all of us, though, learning something new can be a fun challenge. If you've reached the point that Linux installs are more a bother than a challenge, you might want to try building a Kubernetes cluster in your broom closet. It will reintroduce you to all kinds of concepts you'd forgotten about. Hacking on plain-text ([YAML][13] specifically) configuration files, configuring network interfaces and networks, routing traffic, poring over the advantages and disadvantages of one backend over another, running `--dry-run` after `--dry-run` tests, tentatively pressing Return to find out whether you got everything right. Honestly, Kubernetes is just fun.

If you want to build your own infrastructure, there's nothing quite like building your own Kubernetes cluster. A whole new world will open to you. You quickly become a cloud architect, perfecting your open cloud, installing amazing open source web applications in containers, and maybe even offering access to your family and friends.

You become the solution. It's so very satisfying.

### Explore Kubernetes

Kubernetes might seem out of reach at first. It's new, a little scary, and worst yet, it apparently requires a cloud. However, there are a few ways to get started.

First, install either [Minikube][14] or [Minishift][14]. Both of these allow you to run a local instance of Kubernetes on your personal computer. It's not quite as satisfying as building a cluster and opening it up to your friends, but it's a great, safe way to get familiar with the landscape, commands, and toolkit.

Once you're ready for the real thing, read Chris Collins' article [Build a Kubernetes cluster with the Raspberry Pi][15]. After that, download our free ebook [Running Kubernetes on your Raspberry Pi homelab][16]. Before you know it, you'll find yourself wearing Kubernetes t-shirts, too.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/kubernetes-linux-homelab

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/article/20/8/kubernetes-raspberry-pi
[3]: https://opensource.com/sites/default/files/uploads/containers-are-linux.jpg (T-shirt reading "Containers are Linux")
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: http://podman.io
[6]: http://cri-o.io
[7]: https://opensource.com/article/21/5/systemd
[8]: https://enterprisersproject.com/what-is-digital-transformation
[9]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[10]: https://opensource.com/article/18/8/what-cicd
[11]: https://opensource.com/sites/default/files/uploads/jmeter.png (Apache JMeter)
[12]: https://jmeter.apache.org
[13]: https://www.redhat.com/sysadmin/yaml-beginners
[14]: https://opensource.com/article/18/10/getting-started-minikube
[15]: https://opensource.com/article/20/6/kubernetes-raspberry-pi
[16]: https://opensource.com/downloads/kubernetes-raspberry-pi
