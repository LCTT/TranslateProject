[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create flexible web content with a headless management system)
[#]: via: (https://opensource.com/article/19/5/headless-cms)
[#]: author: (Sam Bocetta https://opensource.com/users/sambocetta)

Create flexible web content with a headless management system
======
Get the versatility and freedom to deliver content however you think is
best.
![Browser of things][1]

In recent years, we’ve witnessed an explosion in the number of technological devices that deliver web-based content to users. Smartphones, tablets, smartwatches, and more—all with progressively advancing technical capabilities and support for an ever-widening list of operating systems and web browsers—swarm anew onto the market each year.

What does this trend have to do with web development and headless versus traditional Content Management Systems (CMS)? Quite a lot.

### CMS creates the internet

A CMS is an application or set of computer programs used to manage digital content like images, videos, blog posts—essentially anything you would post on a website. An obvious example of a CMS is [WordPress][2].

The word "manage" is used broadly here. It can refer to creating, editing, or updating any kind of digital content on a website, as well as indexing the site to make it easily searchable.

So, a CMS essentially separates the content displayed on a website from how that content is displayed. It also allows you, the website administrator, to set permissions on who can access, edit, modify, or otherwise manage that content.

Suppose you want to post a new blog entry, update or correct something in an old post, write on your Facebook page, share a social media link to a video or article, or embed a video, music file, or pre-written set of text into a page on your website. If you have ever done anything like this, you have made use of CMS features.

### Traditional CMS architecture: Benefits and flaws

There are two major components that make up a CMS: the Content Management Application (CMA) and the Content Delivery Application (CDA). The CMA pertains to the front-end portion of the website. This is what allows authors or other content managers to edit and create content without help from a web developer. The CDA pertains to the back end portion of a website. By organizing and compiling content to make website content updates possible, it automates the function of a website administrator.

Traditionally, these two pieces are joined into a single unit as a "coupled" CMS architecture. A **coupled CMS** uses a specific front-end delivery system (CMA) built into the application itself. The term "coupled" comes from the fact that the front-end framework—the templates and layout of the pages and how those pages respond to being opened in certain browsers—is coupled to the website’s content. In other words, in a coupled CMS architecture the Content Management Application (CMA) and Content Delivery Application (CDA) are inseparably merged.

#### Benefits of the traditional CMS

Coupled architecture does offer advantages, mainly in simplicity and ease of use for those who are not technically sophisticated. This fact explains why a platform like WordPress, which retains a traditional CMS setup, [remains so popular][3] for those who create websites or blogs.

Further simplifying the web development process [are website builder applications][4], such as [Wix][5] and [Squarespace][6], which allow you to build drag-and-drop websites. The most popular of these builders use open source libraries but are themselves closed source. These sites allow almost anyone who can find the internet to put a website together without wading through the relatively short weeds of a CMS environment. While builder applications were [the object of derision][7] not so long ago amongst many in the open source community—mainly because they tended to give websites a generic and pre-packaged look and feel—they have grown increasingly functional and variegated.

#### Security is an issue

However, for all but the simplest web apps, a traditional CMS architecture results in inflexible technology. Modifying a static website or web app with a traditional CMS requires tremendous time and effort to produce updates, patches, and installations, preventing developers from keeping up with the growing number of devices and browsers.

Furthermore, coupled CMSs have two built-in security flaws:

**Risk #1** : Since content management and delivery are bound together, hackers who breach your website through the front end automatically gain access to the back-end database. This lack of separation between data and its presentation increases the likelihood that data will be stolen. Depending on the kind of user data stored on your website’s servers, a large-scale theft could be catastrophic.

**Risk #2** : The risk of successful [Distributed Denial of Service][8] (DDoS) attacks increases without a separate system for delivering content to your website. DDoS attacks flood content delivery networks with so many traffic requests that they become overwhelmed and go offline. If your content delivery network is separated from your actual web servers, attackers will be less able to bring down your site.

To avoid these problems, developers have introduced headless and decoupled CMSs.

### Comparing headless and decoupled CMSs

The "head" of a CMS is a catch-all term for the Content Delivery Application. Therefore, a CMS without one—and so with no way of delivering content to a user—is called "headless."

This lack of an established delivery method gives headless CMSs enormous versatility. Without a CDA there is no pre-established delivery method, so developers can design separate frameworks as the need arises. The problem of constantly patching your website, web apps, and other code to guarantee compatibility disappears.

Another option, a **decoupled CMS** , includes many of the same features and benefits as a headless CMS, but there is one crucial difference. Where a headless CMS leaves it entirely to the developer to deliver and present content to their users, a decoupled CMS offers pre-established delivery tools that developers can either take or leave. Decoupled CMSs thus offer both the simplicity of the traditional CMS and the versatility of the headless ones.

In short, a decoupled CMS is sometimes called a **hybrid CMS ****since it's a hybrid of the coupled and headless designs. Decoupled CMSs are not a new concept. As far back as 2015, PHP core repository developer David Buchmann was [calling on devs][9] to decouple their CMSs to meet a wider set of challenges.

### Security improvements with a headless CMS

Perhaps the most important point to make about headless versus decoupled content management architectures, and how they both differ from traditional architecture, is the added security benefit. In both the headless and decoupled designs, content and user data are located on a separate back-end system protected by a firewall. The user can’t access the content management application itself.

However, it's important to keep in mind that the major consequence of this change in architectures is that since the architecture is fragmented, developers have to fill in the gaps and design content delivery and presentation mechanisms on their own. This means that whether you opt to go headless or decoupled, your developer needs to understand security. While separating content management and content delivery gives hackers one fewer vector through which to attack, this isn’t a security benefit in itself. The burden will be on your devs to properly secure your resulting CDA.

A firewall protecting the back end provides a [crucial layer of security][10]. Headless and decoupled architectures can distribute your content among multiple databases, so if you take advantage of this possibility you can lower the chance of successful DDoS attacks even further. Open source headless CMS can also benefit from the installation of a [Linux VPN][11] or Linux kernel firewall management tool like [iptables][12]. All of these options combine to provide the added security developers need to create no matter what kind of CDA or back end setup they choose.

Benefits aside, keep in mind that headless CMS platforms are a fairly new tech. Before making the switch to headless or decoupled, consider whether the host you’re using can support your added security so that you can host your application behind network security systems to block attempts at unauthorized access. If they cannot, a host change might be in order. When evaluating new hosts, also consider any existing contracts or security and compliance restrictions in place (GDPR, CCPA, etc.) which could cause migration troubles.

### Open source options

As you can see, headless architecture offers designers the versatility and freedom to deliver content however they think best. This spirit of freedom fits naturally with the open source paradigm in software design, in which all source code is available to public view and may be taken and modified by anyone for any reason.

There are a number of open source headless CMS platforms that allow developers to do just that: [Mura,][13] [dotCMS][14], and [Cockpit CMS][15] to name a few. For a deeper dive into the world of open source headless CMS platforms, [check out this article][16].

### Final thoughts

For web designers and developers, the idea of a headless CMS marks a significant rethinking of how sites are built and delivered. Moving to this architecture is a great way to future-proof your website against changing preferences and whatever tricks future hackers may cook up, while at the same time creating a seamless user experience no matter what device or browser is used. You might also take a look at [this guide][17] for UX tips on designing your website in a way that meshes with headless and decoupled architectures.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/headless-cms

作者：[Sam Bocetta][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sambocetta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_desktop_website_checklist_metrics.png?itok=OKKbl1UR (Browser of things)
[2]: https://wordpress.org/
[3]: https://kinsta.com/wordpress-market-share/
[4]: https://hostingcanada.org/website-builders/
[5]: https://www.wix.com/
[6]: https://www.squarespace.com
[7]: https://arstechnica.com/information-technology/2016/11/wordpress-and-wix-trade-shots-over-alleged-theft-of-open-source-code/
[8]: https://www.cloudflare.com/learning/ddos/what-is-a-ddos-attack/
[9]: https://opensource.com/business/15/3/decoupling-your-cms
[10]: https://www.hostpapa.com/blog/security/why-your-small-business-needs-a-firewall/
[11]: https://surfshark.com/download/linux
[12]: https://www.linode.com/docs/security/firewalls/control-network-traffic-with-iptables/
[13]: https://www.getmura.com/
[14]: https://dotcms.com/
[15]: https://getcockpit.com/
[16]: https://www.cmswire.com/web-cms/13-headless-cmss-to-put-on-your-radar/
[17]: https://medium.com/@mat_walker/tips-for-content-modelling-with-the-headless-cms-contentful-7e886a911962
