How to choose the best Linux server for your business
=====================================================

The right Linux server for your business just might be the one that offers your staff the level of support they need.


![img](http://www.itworld.com/sites/default/files/best-penguin.jpg "penguins")
Image credit: flickr/Pete

There may only be dozens of Linux servers, compared to over a thousand Linux desktops, but it's still not easy picking the right one for your enterprise. Let me help. With over twenty years of Linux experience, I know a thing or two about Linux servers.

> [Ubuntu impresses in test of Linux servers][1]

> [The first rule of choosing a desktop Linux distribution: User, know thyself][2]

I think the single most important factor in choosing a Linux server is how experienced (or not) your IT staff already is with Linux. While Linux expertise is easier to find than it used to be, there's still nothing like enough Linux IT professionals out there.

When I went to OSCon, the major open-source convention, earlier this year in Portland OR, everyone, and I checked and it really was everyone (even some company named Microsoft), was looking to [hire people with Linux and open-source experience][3].

In particular, employers are having trouble finding staffers with [a few years of Linux experience][4] under their belts. That is to say, exactly the employees you need to keep your Linux server trains running on schedule.

What that means for you is that if you don't already have a crew of Linux veterans, you should avoid Linux server distributions, such as [Debian][5], that don't have a vendor to back them up with training and support.

Don't get me wrong. Debian's great with an experienced staff, but if your people can't tell BASH from C Shell you don't want them using Debian.

	The best Linux server for those new to Linux

	- RHEL
	- SUSE
	- Oracle Linux
	- Turnkey Linux

If your crew is new to Linux you need to use a commercial Linux. Here, as anyone can tell you, your Linux of choice is [Red Hat Enterprise Linux][6].

Red Hat didn't get to be the [first billion-dollar Linux company][7] by not supporting businesses. More so than any other Linux, RHEL has all the tools -- [corporate support][8], [professional certification][9], [hardware certification][10], and automatic online updates with [Red Hat Network (RHN)][11] -- that keeps CFOs and CIOs happy.

That said, Red Hat does have a serious rival: [SUSE Linux Enterprise Server (SLES)][12].

Like RHEL, SLES comes with [support][13]; [staff certification][14], via sister company Novell; [hardware certification][15]; and [online updating][16].

So, how do you choose between them? You do it by testing them out. Both make it free and easy to do. Personally, I've used both RHEL and SLES. For me it comes down to the exact fit between a business's requirements and the operating system. With the right situation, either will work.

There is another enterprise Linux choice: [Oracle Linux][17]. Although it is for all intents and purposes a copy of RHEL, I really don't care for it myself. The only people I know who use it are from businesses that have put all their IT eggs into the Oracle basket.

	The best Linux server for non-experts

	- CentOS
	- openSUSE
	- Ubuntu Server

Let's say you're in middle. Your people know some Linux but they're not Linux experts. What then?

For you I have several recommendations. First, if you like the RHEL way of doing things, [CentOS][18], a free RHEL clone, deserves your attention.

CentOS is very popular. If you have an Apache Web server on almost any Web hosting service, odds are good you're already running CentOS under your site. There are also many sources of free online support for this distribution.

If you’re worried about Red Hat pulling the rug out from underneath CentOS, don't be. While Red Hat has no love for Oracle Linux, Red Hat CEO James Whitehurst, recently said, "CentOS is one of the reasons that the [RHEL ecosystem is the default][19]. It helps to give us an ubiquity that RHEL might otherwise not have if we forced everyone to pay to use Linux. So, in a micro sense we lose some revenue, but in a broader sense, CentOS plays a very valuable role in helping to make Red Hat the de facto Linux."

Another useful choice for people who know some Linux, but not a lot, is [openSUSE][20]. This is SUSE's community Linux distribution. While it doesn't have the support bells and whistles of SLES, it's stable and easy to use. On a personal note, openSUSE is what I use for my in-house servers.

I cannot, however, recommend RHEL's community little brother [Fedora][21] for servers. Fedora is great for developers who are pushing Linux to its limits, but it's not for someone who wants a stable server.

Another reasonable mid-range choice is Canonical's Ubuntu. While Ubuntu has made its reputation as a desktop distribution with designs on tablets and smartphones, it also has a reasonably good server offering: [Ubuntu Server][22].

Like RHEL and SLES, Ubuntu also has support and certification offerings, but these aren't as deep as Red Hat and SUSE's resources. On the other hand, Ubuntu is easier to use for simple server tasks.

	The best Linux server for experts

	- Arch
	- Gentoo
	- Debian
	- Fedora

If you're interested in the cloud, Ubuntu (like RHEL) is [deeply integrated with OpenStack][23]. In addition, Canonical, Ubuntu's parent company, offers [Juju][24], a very handy DevOps (Developer/Operations) [set of tools][25], that makes it much easier to set up, configure, manage, maintain, deploy and scale server services.

While we’re talking cloud, you should also consider whether you actually need general purpose Linux servers running in your office or data center. It's quite possible that you can run the services you need on a dedicated Linux server on the cloud.

Most public cloud services, such as Amazon Web Services (AWS), Azure, and RackSpace, offer Linux servers. With these a lot of the hard work of setting up a server is done for you.

For example, on Amazon Elastic Cloud (AE2), Amazon offers ready-to-run Amazon Machine Images (AMIs) for all the Linux distributions I've mentioned in this story and their own house [Amazon Linux][26] as well. Microsoft's Azure, believe it or not, [supports CentOS, openSUSE, SUSE, and Ubuntu][27]. Finally, RackSpace, an OpenStack champion, [supports most of the major server Linux distributions][28] and two smaller Linuxes, Arch and Gentoo. Although, as with Debian, I recommend that only people who know Linux, and these distributions in particular use these for business-critical servers.

Who says that you need a full-powered Linux server even on the cloud? You might be able to do just fine with a Linux server dedicated to a particular job. This is what [Turnkey Linux][29] brings you.

Turnkey is built on top of 64-bit Debian Linux, but it requires minimal Linux expertise to use. That's because it really provides dedicated Linux server appliances rather than a full-featured distribution.

Turnkey has more than a hundred ready-to-run apps These range from such standards as the Apache Web service, a Linux, MySQL, PHP/Python/Perl (LAMP) stack; a WordPress blogging platform; and a Drupal content management system (CMS) to more exotic servers such as the Ushahidi crisis crowd-sourcing server; Zurmo, a gamified customer-relationship management (CRM) application; and Sahana Eden, a humanitarian response management system. You can run these dedicated application servers on AWS, bare metal, virtual machines (VM), or on Infrastructure as a Service (IaaS) clouds.

In short, whether you know next to nothing about Linux or you're a senior developer on the Linux kernel team, there's a Linux server for you and your business needs. Enjoy!

[1]:http://www.itworld.com/slideshow/119061/ubuntu-impresses-test-linux-servers-372374
[2]:http://www.itworld.com/operating-systems/370104/first-rule-choosing-desktop-linux-distribution-user-know-thyself
[3]:http://blog.smartbear.com/open-source/yes-open-source-jobs-are-hot-and-we-have-stats-to-prove-it/
[4]:http://www.itworld.com/it-managementstrategy/250988/where-are-all-linux-professionals
[5]:http://www.debian.org/
[6]:http://www.redhat.com/products/enterprise-linux/
[7]:http://www.itworld.com/it-managementstrategy/263212/red-hat-joins-billion-dollar-club
[8]:http://www.redhat.com/support/
[9]:http://www.redhat.com/training/certifications/
[10]:http://www.redhat.com/rhel/compatibility/hardware/
[11]:https://access.redhat.com/subscriptions/rhntransition/
[12]:https://www.suse.com/products/server/
[13]:https://www.suse.com/products/expandedsupport/
[14]:http://www.novell.com/training/certinfo/clp/
[15]:https://www.suse.com/partners/ihv/yes/
[16]:https://www.suse.com/products/register.html
[17]:http://www.oracle.com/us/technologies/linux/overview/index.html
[18]:http://www.centos.org/
[19]:http://readwrite.com/2013/08/13/red-hat-ceo-centos-open-source
[20]:http://www.opensuse.org/en/
[21]:http://fedoraproject.org/
[22]:http://www.ubuntu.com/server
[23]:http://www.ubuntu.com/cloud/build-a-cloud
[24]:https://juju.ubuntu.com/
[25]:https://community.csc.com/community/cio-engage/blog/2013/08/25/beyond-chef-and-puppet-ubuntu-juju
[26]:https://aws.amazon.com/marketplace/pp/B00635Y2IW/ref=mkt_ste_ec2_amznlinux
[27]:http://www.windowsazure.com/en-us/manage/linux/other-resources/endorsed-distributions/
[28]:http://www.rackspace.com/knowledge_center/article/choosing-a-linux-distribution
[29]:http://www.turnkeylinux.org/

via: http://www.itworld.com/operating-systems/372236/how-choose-best-linux-server-your-business

