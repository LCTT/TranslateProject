申请翻译 by WangYueScream
=========================

The Children's Illustrated Guide to Kubernetes
============================================================


Introducing Phippy, an intrepid little PHP app, and her journey to Kubernetes.

What is this? Well, I wrote a book that explains Kubernetes. We posted [a video version][1] to the Kubernetes community blog. If you find us at a conference, you stand a chance to pick up a physical copy. But for now, here's a blog post version!

And after you've finished reading, tweet something at [@opendeis][2] for a chance to win a squishy little Phippy toy of your own. Not sure what to tweet? Why don't you tell us about yourself and how you use Kubernetes!

### The Other Day...

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-1.png)

The other day, my daughter sidled into my office, and asked me, "Dearest Father, whose knowledge is incomparable, what is Kubernetes?"

Alright, that's a little bit of a paraphrase, but you get the idea.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-diagram-1.png)

And I responded, "Kubernetes is an open source orchestration system for Docker containers. It handles scheduling onto nodes in a compute cluster and actively manages workloads to ensure that their state matches the users' declared intentions. Using the concepts of "labels" and "pods", it groups the container which make up an application into logical units for easy management and discovery."

And my daughter said to me, "Huh?"

And so I give you...

### The Children's Illustrated Guide to Kubernetes

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-2.png)

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-3.png)

Once upon a time there was an app named Phippy. And she was a simple app. She was written in PHP and had just one page. She lived on a hosting provider and she shared her environment with scary other apps that she didn't know and didn't care to associate with. She wished she had her own environment: just her and a webserver she could call home.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-diagram-2.png)

An app has an environment that it relies upon to run. For a PHP app, that environment might include a webserver, a readable file system, and the PHP engine itself.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-4.png)

One day, a kindly whale came along. He suggested that little Phippy might be happier living in a container. And so the app moved. And the container was nice, but… It was a little bit like having a fancy living room floating in the middle of the ocean.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-diagram-3.png)

A container provides an isolated environment in which an app, together with its environment, can run. But those isolated containers often need to be managed and connected to the external world. Shared file systems, networking, scheduling, load balancing, and distribution are all challenges.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-5.png)

The whale shrugged his shoulders. "Sorry, kid," he said, and disappeared beneath the ocean's surface. But before Phippy could even begin to despair, a captain appeared on the horizon, piloting a gigantic ship. The ship was made of dozens of rafts all lashed together, but from the outside, it looked like one giant ship.

"Hello there, friend PHP app. My name is Captain Kube" said the wise old captain.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-diagram-4.png)

"Kubernetes" is the Greek word for a ship's captain. We get the words  _Cybernetic_  and  _Gubernatorial_  from it. Led by Google, the Kubernetes project focuses on building a robust platform for running thousands of containers in production.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-6.png)

"I'm Phippy," said the little app.

"Nice to make your acquaintance," said the Captain as he slapped a name tag on her.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-diagram-5.png)

Kubernetes uses labels as "nametags" to identify things. And it can query based on these labels. Labels are open-ended: You can use them to indicate roles, stability, or other important attributes.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-7.png)

Captain Kube suggested that the app might like to move her container to a pod on board the ship. Phippy happily moved her container inside of the pod aboard Kube's giant ship. It felt like home.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-diagram-6.png)

In Kubernetes, a Pod represents a runnable unit of work. Usually, you will run a single container inside of a Pod. But for cases where a few containers are tightly coupled, you may opt to run more than one container inside of the same Pod. Kubernetes takes on the work of connecting your pod to the network and the rest of the Kubernetes environment.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-8.png)

Phippy had some unusual interests. She was really into genetics and sheep. And so she asked the captain, "What if I want to clone myself… On demand… Any number of times?"

"That's easy," said the captain. And he introduced her to the replication controllers.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-diagram-7.png)

Replication controllers provide a method for managing an arbitrary number of pods. A replication controller contains a pod template, which can be replicated any number of times. Through the replication controller, Kubernetes will manage your pods' lifecycle, including scaling up and down, rolling deployments, and monitoring.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-9.png)

For many days and nights the little app was happy with her pod and happy with her replicas. But only having yourself for company is not all it's cracked up to be…. even if it is N copies of yourself.

Captain Kube smiled benevolently, "I have just the thing."

No sooner had he spoken than a tunnel opened between Phippy's replication controller and the rest of the ship. With a hearty laugh, Captain Kube said, "Even when your clones come and go, this tunnel will stay here so you can discover other pods, and they can discover you!"

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-diagram-8.png)

A service tells the rest of the Kubernetes environment (including other pods and replication controllers) what  _services_  your application provides. While pods come and go, the service IP addresses and ports remain the same. And other applications can find your service through Kurbenetes service discovery.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-10.png)

Thanks to the services, Phippy began to explore the rest of the ship. It wasn't long before Phippy met Goldie. And they became the best of friends. One day, Goldie did something extraordinary. She gave Phippy a present. Phippy took one look and the saddest of sad tears escaped her eye.

"Why are you so sad?" asked Goldie.

"I love the present, but I have nowhere to put it!" sniffled Phippy.

But Goldie knew what to do. "Why not put it in a volume?"

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-diagram-9.png)

A volume represents a location where containers can access and store information. For the application, the volume appears as part of the local filesystem. But volumes may be backed by local storage, Ceph, Gluster, Elastic Block Storage, and a number of other storage backends.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-11.png)

Phippy loved life aboard Captain Kube's ship and she enjoyed the company of her new friends (every replicated pod of Goldie was equally delightful). But as she thought back to her days on the scary hosted provider, she began to wonder if perhaps she could also have a little privacy.

"It sounds like what you need," said Captain Kube, "is a namespace."

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-diagram-10.png)

A namespace functions as a grouping mechanism inside of Kubernetes. Services, pods, replication controllers, and volumes can easily cooperate within a namespace, but the namespace provides a degree of isolation from the other parts of the cluster.

![](https://deis.com/images/blog-images/kubernetes-illustrated-guide-illustration-12.png)

Together with her new friends, Phippy sailed the seas on Captain Kube's great boat. She had many grand adventures, but most importantly, Phippy had found her home.

And so Phippy lived happily ever after.

--------------------------------------------------------------------------------


作者简介：

Platform Architect at Deis. Lover of wisdom, coffee, and finely crafted code.

via: https://deis.com/blog/2016/kubernetes-illustrated-guide/

作者：[Matt Butcher ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/@technosophos
[1]:http://blog.kubernetes.io/2016/06/illustrated-childrens-guide-to-kubernetes.html
[2]:https://twitter.com/opendeis
