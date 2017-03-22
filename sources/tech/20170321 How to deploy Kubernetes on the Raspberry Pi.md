How to deploy Kubernetes on the Raspberry Pi
============================================================

> In a few steps, set up your Raspberry Pi with Kubernetes using Weave Net.


 ![How to deploy Kubernetes on the Raspberry Pi ](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/raspberrypi_cartoon.png?itok=sntNdheJ "How to deploy Kubernetes on the Raspberry Pi ") 
>Image by : opensource.com

When I became interested in [ARM][6] devices, and in the Raspberry Pi in particular, my first project was an OpenVPN server.

By having the Raspberry Pi as a secure gateway to my home network, I could use my phone to control my desktop and remotely play Spotify, open documents, and a bunch of other fun things. I used an existing tutorial for that first project because I was afraid of piping anything into the command line on my own.

More on Raspberry Pi

*   [Our latest on Raspberry Pi][1]
*   [What is Raspberry Pi?][2]
*   [Getting started with Raspberry Pi][3]
*   [Send us your Raspberry Pi projects and tutorials][4]

After a few months, that fear dissipated. I expanded upon my original project and isolated the OpenVPN server from the file server using a [Samba server][7]. This was my first project where I didn't follow a tutorial verbatim. Unfortunately, by the end of my Samba project, I realized I hadn't documented anything, so I couldn't replicate it. To recreate it, I had to reread all of the separate guides I had used for reference and piece the project back together.

I learned a valuable lesson about developer workflow—track all of your changes. I made myself a small git repo locally and recorded all of the commands that I typed into the command line.

### Discovering Kubernetes

In May 2015, I discovered Linux containers and Kubernetes. With Kubernetes, I thought it was fascinating that I could take part in a concept still technically in development—and I actually had access to it. The platform itself and the possibilities it presented were exciting. Up until that point, I had just been running a single program on one Raspberry Pi device. With Kubernetes, I could make more advanced configurations than what was possible previously.

At that time, Docker (v1.6, if I remember correctly) on ARM had a bug, which meant running Kubernetes on a Raspberry Pi device was virtually impossible. During those early 0.x releases, Kubernetes changed very quickly. Every time I found a guide for how to set up Kubernetes on AMD64, it was for an older version and it was totally incompatible with what I had at the time.

I hacked my way to creating a Kubernetes node on Raspberry Pi anyway, and by the v1.0.1 Kubernetes release, [I had it working][8], using Docker v1.7.1\. This was the first fully functional way to deploy Kubernetes to ARM.

The advantage of running Kubernetes on Raspberry Pi is that because ARM devices are so small they don't draw a lot of power. If programs are built the right way, it's possible to use the same commands for the same programs on AMD64\. Having small IoT boards creates a great opportunity for education. It's also beneficial for setting up demonstrations you need to travel for, like a conference. Bringing your Raspberry Pi is a lot easier than lugging your (often) large Intel machines.

Now that ARM (both 32- and 64-bit) support is merged into the core in line with [my proposal][9] for it, ARM binaries are automatically released with Kubernetes. Although we haven't got an automated CI (continuous integration) system for ARM yet that automatically makes sure it's working on ARM before PRs can be merged, it's working quite well at the moment.

### Distributed networking on the Raspberry Pi

I discovered Weave Net through [kubeadm][10]. [Weave Mesh][11] is an interesting solution for distributed networking, so I began to read more about it. In December of 2016, I received my first contracting job ever with [Weaveworks][12]. I was part of the internal team that made Weave Net support ARM.

I'm excited for the possibility of industrial use cases for running Weave Net on Raspberry Pi, such as factories that need devices to be more mobile. Currently, deploying Weave Scope or Weave Cloud to Raspberry Pi might not be possible (though it is conceivable with other ARM devices) because I guess the software needs more available memory to run well. Ideally, with the 2GB upgrade of Raspberry Pi, I think I would be able to spin up Weave Cloud successfully.

With the Weave Net 1.9 release, Weave Net how has ARM support. Kubeadm (and Kubernetes in general) works on multiple platforms. You can deploy Kubernetes to ARM with Weave just as you would on any AMD64 device by installing Docker, kubeadm, kubectl, and kubelet as usual on all machines. Then, initialize the master machine where the control plane components will run using:

```
kubeadm init
```

Next, install your pod network with the following command:

```
kubectl apply -f https://git.io/weave-kube
```

Previously, you could only install a pod network with Flannel when running on ARM, but this has changed since the Weave Net 1.9 release, which now also supports ARM officially.

Finally, join your nodes:

```
kubeadm join --token <token> <master-ip>
```

And that's it! Kubernetes is deployed to your Raspberry Pi device. You didn't have to do anything special compared to running on Intel/AMD64; Weave Net on ARM just works.

### Raspberry Pi community

I hope the Raspberry Pi community grows and their mentality spreads to other parts of the world. They're successful in Great Britain and other countries, but not so much here in Finland. I want the ecosystem to expand and for more people to learn how to deploy Kubernetes or Weave to ARM devices. After all, that's how I learned. By teaching myself on a Raspberry Pi device, I think I understand both ARM devices and the software deployed on them a lot better than I would have otherwise.

### Final thoughts

Everything I learned about the Raspberry Pi and Kubernetes, I learned online by joining user communities, asking questions, and testing with different levels of success.

I am a Swedish-speaking upper secondary school student living in Finland, and to date, I've never attended a programming or computing class. I was still able to join the open source community because there are no restrictions on age or education: your work is judged based on its merits.

For anyone nervous about making their first contributions to any open source project I'd say: Dive right in, it's totally worth it. There are no limitations to what you can do, and you'll never know which kinds of opportunities the open source world will offer you. It's gonna be fun, I promise!

--------------------------------------------------------------------------------

作者简介：

Lucas Käldström - Hi there and thanks for finding my profile! I'm a Swedish-speaking Upper Secondary School Student from Finland.

------------------

via: 网址

作者：[ Lucas Käldström][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/luxas
[1]:https://opensource.com/tags/raspberry-pi?src=raspberry_pi_resource_menu
[2]:https://opensource.com/resources/what-raspberry-pi?src=raspberry_pi_resource_menu
[3]:https://opensource.com/article/16/12/getting-started-raspberry-pi?src=raspberry_pi_resource_menu
[4]:https://opensource.com/article/17/2/raspberry-pi-submit-your-article?src=raspberry_pi_resource_menu
[5]:https://opensource.com/article/17/3/kubernetes-raspberry-pi?rate=xHFaLw4Y4mkFiZww6sIHYnkEleqbqObgjXTC0ALUn9s
[6]:https://en.wikipedia.org/wiki/ARM_architecture
[7]:https://www.samba.org/samba/what_is_samba.html
[8]:https://github.com/luxas/kubernetes-on-arm
[9]:https://github.com/kubernetes/community/blob/master/contributors/design-proposals/multi-platform.md
[10]:https://kubernetes.io/docs/getting-started-guides/kubeadm/
[11]:https://github.com/weaveworks/mesh
[12]:https://www.weave.works/
[13]:https://opensource.com/user/113281/feed
[14]:https://opensource.com/users/luxas
