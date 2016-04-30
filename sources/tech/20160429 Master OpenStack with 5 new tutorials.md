Master OpenStack with 5 new tutorials
=======================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/EDUCATION_tools.png?itok=ybxr0Qe9)


Returning from OpenStack Summit this week, I am reminded of just how vast the open source cloud ecosystem is and just how many different projects and concepts you need to be familiar with in order to succeed. Although, we're actually quite fortunate with the resources available for keeping up. In addition to the [official documentation][1], many great educational tools are out there, from third party training and certification, to in-person events, and many community-contributed tutorials as well.

To help you stay on top of things, every month we round up a collection of new tutorials, how-tos, guides, and tips created by the OpenStack community. Here are some of the great pieces published this past month.

- First up, if you're looking for a (reasonably) affordable home OpenStack test lab, the Intel NUC is a great platform to consider. Small in form factor, but reasonably well-powered, you can get a literal stack of them running OpenStack pretty quickly with this guide to using [TripleO to deploy OpenStack][2] on the NUC, and read about some common quirks to watch out for.
- After you've been running OpenStack for a while, the various processes keeping your cloud alive have probably generated quite a pile of log files. While some are probably safe to purge, you still need to have a plan for managing them. Here are some [quick thoughts][3] on managing logs in Ceilometer after nine-months in to a production deployment.
- The OpenStack infrastructure project can be an intimidating place for a newcomer just trying to land a patch. What's a gate job, what's a test, and what are all of these steps my commit is going through? Get a quick overview of the whole process from Arie Bregman in this [handy blog post][4].
- Compute hosts fail occasionally, and whether the cause is hardware or software, the good news is that OpenStack makes it easy to migrate your running instance to another host. However, some people have found the commands to perform this migration a little confusing. Learn the difference between the migrate and evacuate commands in plain English in [this great writeup][5].
- Network Functions Virtualization technologies require some functionality from OpenStack that are outside of what other users might be familiar with. For example, SR-IOV and PCI passthrough are ways of exposing physical hardware directly for maximizing performance. Learn the [steps involved][6] to make this happen within an OpenStack deployment.

That wraps up our collection for this month, but if you're still looking for more, be sure to check out our past archive of [OpenStack tutorials][7] for even more learning resources. And if there's a tutorial or guide you think we ought to include in our next roundup, be sure to let us know in the comments below.

------------------------------------------------------------------------------

via: https://opensource.com/business/16/4/master-openstack-new-tutorials

作者：[Jason Baker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker

[1]: http://docs.openstack.org/
[2]: http://acksyn.org/posts/2016/03/tripleo-on-nucs/
[3]: http://silverskysoft.com/open-stack-xwrpr/2016/03/long-term-openstack-usage-summary/
[4]: http://abregman.com/2016/03/05/openstack-infra-jenkins-jobs/
[5]: http://www.danplanet.com/blog/2016/03/03/evacuate-in-nova-one-command-to-confuse-us-all/
[6]: https://trickycloud.wordpress.com/2016/03/28/openstack-for-nfv-applications-sr-iov-and-pci-passthrough/
[7]: https://opensource.com/resources/openstack-tutorials
