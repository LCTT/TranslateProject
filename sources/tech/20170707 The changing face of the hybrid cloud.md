Translating by ZH1122
The changing face of the hybrid cloud
============================================================

### Terms and concepts around cloud computing are still new, but evolving.

 
![﻿The changing face of the hybrid cloud](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/bus-cloud.png?itok=bdROR1aE "﻿The changing face of the hybrid cloud")
Image credits : 

[Flickr user: theaucitron][9] (CC BY-SA 2.0)

Depending upon the event you use to start the clock, cloud computing is only a little more than 10 years old. Some terms and concepts around cloud computing that we take for granted today are newer still. The National Institute of Standards and Technology (NIST) document that defined now-familiar cloud terminology—such as Infrastructure-as-a-Service (IaaS)—was only published in 2011, although it widely circulated in draft form for a while before that.

Among other definitions in that document was one for  _hybrid cloud_ . Looking at how that term has shifted during the intervening years is instructive. Cloud-based infrastructures have moved beyond a relatively simplistic taxonomy. Also, it highlights how priorities familiar to adopters of open source software—such as flexibility, portability, and choice—have made their way to the hybrid cloud.

Explore the open source cloud

*   [What is the cloud?][1]

*   [What is OpenStack?][2]

*   [What is Kubernetes?][3]

*   [﻿Why the operating system matters for containers][4]

*   [Keeping Linux containers safe and secure][5]

NIST's original hybrid cloud definition was primarily focused on cloud bursting, the idea that you might use on-premise infrastructure to handle a base computing load, but that you could "burst" out to a public cloud if your usage spiked. Closely related were efforts to provide API compatibility between private clouds and public cloud providers and even to create spot markets to purchase capacity wherever it was cheapest.

Implicit in all this was the idea of the cloud as a sort of standardized compute utility with clear analogs to the electrical grid, a concept probably most popularized by author Nick Carr in his book  [_The Big Switch_][10] . It made for a good story but, even early on, the [limitations of the analogy became evident][11]. Computing isn't a commodity in the manner of electricity. One need look no further than the proliferation of new features by all of the major public cloud providers—as well as in open source cloud software such as OpenStack—to see that many users aren't simply looking for generic computing cycles at the lowest price.

The cloud bursting idea also largely ignored the reality that computing is usually associated with data and you can't just move large quantities of data around instantaneously without incurring big bandwidth bills and having to worry about the length of time those transfers take. Dave McCrory coined the term  _data gravity_  to describe this limitation.

Given this rather negative picture I've painted, why are we talking about hybrid clouds so much today?

As I've discussed, hybrid clouds were initially thought of mostly in the context of cloud bursting. And cloud bursting perhaps most emphasized rapid, even real-time, shifts of workloads from one cloud to another; however, hybrid clouds also implied application and data portability. Indeed, as [I wrote in a CNET post][12] back in 2011: "I think we do ourselves a disservice by obsessing too much with 'automagical' workload shifting—when what we really care about is the ability to just move from one place to another if a vendor isn't meeting our requirements or is trying to lock us in."

Since then, thinking about portability across clouds has evolved even further.

Linux always has been a key component of cloud portability because it can run on everything from bare-metal to on-premise virtualized infrastructures, and from private clouds to public clouds. Linux provides a well-established, reliable platform with a stable API contract against which applications can be written.

The widespread adoption of containers has further enhanced the ability of Linux to provide application portability across clouds. By providing an image that also contains an application's dependencies, a container provides portability and consistency as applications move from development, to testing, and finally to production.

Linux containers can be applied in many different ways to problems where ultimate portability, configurability, and isolation are needed. This is true whether running on-premise, in a public cloud, or a hybrid of the two.

Container tools use an image-based deployment model. This makes sharing an application or set of services with all of their dependencies across multiple environments easy.

Specifications developed under the auspices of the Open Container Initiative (OCI) work together to define the contents of a container image and those dependencies, environments, arguments, and so forth necessary for the image to be run properly. As a result of these standardization efforts, the OCI has opened the door for many other tooling efforts that can now depend on stable runtime and image specs.

At the same time, distributed storage can provide data portability across clouds using open source technologies such as Gluster and Ceph. Physical constraints will always impose limits on how quickly and easily data can be moved from one location to another; however, as organizations deploy and use different types of infrastructure, they increasingly desire open, software-defined storage platforms that scales across physical, virtual, and cloud resources.

This is especially the case as data storage requirements grow rapidly, because of trends in predictive analytics, internet-of-things, and real-time monitoring. In [one 2016 study][13], 98% of IT decision makers said a more agile storage solution could benefit their organization. In the same study, they listed inadequate storage infrastructure as one of the greatest frustrations that their organizations experience.

And it's really this idea of providing appropriate portability and consistency across a heterogeneous set of computing capabilities and resources that embodies what hybrid cloud has become. Hybrid cloud is not so much about using a private cloud and a public cloud in concert for the same applications. It's about using a set of services of many types, some of which are probably built and operated by your IT department, and some of which are probably sourced externally.

They'll probably be a mix of Software-as-a-Service applications, such as email and customer relationship management. Container platforms, orchestrated by open source software such as Kubernetes, are increasingly popular for developing new applications. Your organization likely is using one of the big public cloud providers for  _something_ . And you're almost certain to be operating some of your own infrastructure, whether it's a private cloud or more traditional on-premise infrastructure.

This is the face of today's hybrid cloud, which really can be summed up as choice—choice to select the most appropriate types of infrastructure and services, and choice to move applications and data from one location to another when you want to.

 **_Also read: [Multi-cloud vs. hybrid cloud: What's the difference?][6]_**

--------------------------------------------------------------------------------

作者简介：

Gordon Haff is Red Hat’s cloud evangelist, is a frequent and highly acclaimed speaker at customer and industry events, and helps develop strategy across Red Hat’s full portfolio of cloud solutions. He is the author of Computing Next: How the Cloud Opens the Future in addition to numerous other publications. Prior to Red Hat, Gordon wrote hundreds of research notes, was frequently quoted in publications like The New York Times on a wide range of IT topics, and advised clients on product and marketing strategies. Earlier in his career, he was responsible for bringing a wide range of computer systems, from minicomputers to large UNIX servers, to market while at Data General. Gordon has engineering degrees from MIT and Dartmouth and an MBA from Cornell’s Johnson School.


via: https://opensource.com/article/17/7/hybrid-cloud

作者：[  Gordon Haff (Red Hat) ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ghaff
[1]:https://opensource.com/resources/cloud?src=cloud_resource_menu1
[2]:https://opensource.com/resources/what-is-openstack?src=cloud_resource_menu2
[3]:https://opensource.com/resources/what-is-kubernetes?src=cloud_resource_menu3
[4]:https://opensource.com/16/12/yearbook-why-operating-system-matters?src=cloud_resource_menu4
[5]:https://opensource.com/business/16/10/interview-andy-cathrow-anchore?src=cloud_resource_menu5
[6]:https://enterprisersproject.com/article/2017/7/multi-cloud-vs-hybrid-cloud-whats-difference
[7]:https://opensource.com/article/17/7/hybrid-cloud?rate=ztmV2D_utD03cID1u41Al08w0XFm6rXXwCJdTwqI4iw
[8]:https://opensource.com/user/21220/feed
[9]:https://www.flickr.com/photos/theaucitron/5810163712/in/photolist-5p9nh3-6EkSKG-6EgGEF-9hYBcr-abCSpq-9zbjDz-4PVqwm-9RqBfq-abA2T4-4nXfwv-9RQkdN-dmjSdA-84o2ER-abA2Wp-ehyhPC-7oFYrc-4nvqBz-csMQXb-nRegFf-ntS23C-nXRyaB-6Xw3Mq-cRMaCq-b6wkkP-7u8sVQ-yqcg-6fTmk7-bzm3vU-6Xw3vL-6EkzCQ-d3W8PG-5MoveP-oMWsyY-jtMME6-XEMwS-2SeRXT-d2hjzJ-p2ZZVZ-7oFYoX-84r6Mo-cCizvm-gnnsg5-77YfPx-iDjqK-8gszbW-6MUZEZ-dhtwtk-gmpTob-6TBJ8p-mWQaAC/
[10]:http://www.nicholascarr.com/?page_id=21
[11]:https://www.cnet.com/news/there-is-no-big-switch-for-cloud-computing/
[12]:https://www.cnet.com/news/cloudbursting-or-just-portable-clouds/
[13]:https://www.redhat.com/en/technologies/storage/vansonbourne
[14]:https://opensource.com/users/ghaff
[15]:https://opensource.com/users/ghaff
