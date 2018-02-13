Why an involved user community makes for better software
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_cubestalk.png?itok=Ozw4NhGW)

Imagine releasing a major new infrastructure service based on open source software only to discover that the product you deployed had evolved so quickly that the documentation for the version you released is no longer available. At Bloomberg, we experienced this problem firsthand in our deployment of OpenStack. In late 2016, we spent six months testing and rolling out [Liberty][1] on our OpenStack environment. By that time, Liberty was about a year old, or two versions behind the latest build.

As our users started taking advantage of its new functionality, we found ourselves unable to solve a few tricky problems and to answer some detailed questions about its API. When we went looking for Liberty's documentation, it was nowhere to be found on the OpenStack website. Liberty, it turned out, had been labeled "end of life" and was no longer supported by the OpenStack developer community.

The disappearance wasn't intentional, rather the result of a development community that had not anticipated the real-world needs of users. The documentation was stored in the source branch along with the source code, and, as Liberty was superseded by newer versions, it had been deleted. Worse, in the intervening months, the documentation for the newer versions had been completely restructured, and there was no way to easily rebuild it in a useful form. And believe me, we tried.

The disappearance wasn't intentional, rather the result of a development community that had not anticipated the real-world needs of users. ]After consulting other users and our vendor, we found that OpenStack's development cadence of two releases per year had created some unintended, yet deeply frustrating, consequences. Older releases that were typically still widely in use were being superseded and effectively killed for the purposes of support.

Eventually, conversations took place between OpenStack users and developers that resulted in changes. Documentation was moved out of the source branch, and users can now build documentation for whatever version they're using—more or less indefinitely. The problem was solved. (I'm especially indebted to my colleague [Chris Morgan][2], who was knee-deep in this effort and first wrote about it in detail for the [OpenStack Superuser blog][3].)

Many other enterprise users were in the same boat as Bloomberg—running older versions of OpenStack that are three or four versions behind the latest build. There's a good reason for that: On average it takes a reasonably large enterprise about six months to qualify, test, and deploy a new version of OpenStack. And, from my experience, this is generally true of most open source infrastructure projects.

For most of the past decade, companies like Bloomberg that adopted open source software relied on distribution vendors to incorporate, test, verify, and support much of it. These vendors provide long-term support (LTS) releases, which enable enterprise users to plan for upgrades on a two- or three-year cycle, knowing they'll still have support for a year or two, even if their deployment schedule slips a bit (as they often do). In the past few years, though, infrastructure software has advanced so rapidly that even the distribution vendors struggle to keep up. And customers of those vendors are yet another step removed, so many are choosing to deploy this type of software without vendor support.

Losing vendor support also usually means there are no LTS releases; OpenStack, Kubernetes, and Prometheus, and many more, do not yet provide LTS releases of their own. As a result, I'd argue that healthy interaction between the development and user community should be high on the list of considerations for adoption of any open source infrastructure. Do the developers building the software pay attention to the needs—and frustrations—of the people who deploy it and make it useful for their enterprise?

There is a solid model for how this should happen. We recently joined the [Cloud Native Computing Foundation][4], part of The Linux Foundation. It has a formal [end-user community][5], whose members include organizations just like us: enterprises that are trying to make open source software useful to their internal customers. Corporate members also get a chance to have their voices heard as they vote to select a representative to serve on the CNCF [Technical Oversight Committee][6]. Similarly, in the OpenStack community, Bloomberg is involved in the semi-annual Operators Meetups, where companies who deploy and support OpenStack for their own users get together to discuss their challenges and provide guidance to the OpenStack developer community.

The past few years have been great for open source infrastructure. If you're working for a large enterprise, the opportunity to deploy open source projects like the ones mentioned above has made your company more productive and more agile.

As large companies like ours begin to consume more open source software to meet their infrastructure needs, they're going to be looking at a long list of considerations before deciding what to use: license compatibility, out-of-pocket costs, and the health of the development community are just a few examples. As a result of our experiences, we'll add the presence of a vibrant and engaged end-user community to the list.

Increased reliance on open source infrastructure projects has also highlighted a key problem: People in the development community have little experience deploying the software they work on into production environments or supporting the people who use it to get things done on a daily basis. The fast pace of updates to these projects has created some unexpected problems for the people who deploy and use them. There are numerous examples I can cite where open source projects are updated so frequently that new versions will, usually unintentionally, break backwards compatibility.

As open source increasingly becomes foundational to the operation of so many enterprises, this cannot be allowed to happen, and members of the user community should assert themselves accordingly and press for the creation of formal representation. In the end, the software can only be better.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/important-conversation

作者：[Kevin P.Fleming][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/kpfleming
[1]:https://releases.openstack.org/liberty/
[2]:https://www.linkedin.com/in/mihalis68/
[3]:http://superuser.openstack.org/articles/openstack-at-bloomberg/
[4]:https://www.cncf.io/
[5]:https://www.cncf.io/people/end-user-community/
[6]:https://www.cncf.io/people/technical-oversight-committee/
