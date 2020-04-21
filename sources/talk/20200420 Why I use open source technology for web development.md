[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why I use open source technology for web development)
[#]: via: (https://opensource.com/article/20/4/open-source-web-development)
[#]: author: (Jimmy McArthur https://opensource.com/users/jimmymcarthur)

Why I use open source technology for web development
======
Micro-frontends with an API-driven approach power the OpenStack
Foundation's platforms.
![Text editor on a browser, in blue][1]

Every day, millions of people all over the world access the [OpenStack Foundation][2]'s (OSF) web properties to learn about open infrastructure. This level of usage requires a platform and toolsets that are fast, flexible, and affordable—and this is where open source comes in. Not only that, but given that we work for an open source software foundation, we naturally incorporate open source technologies into everything we do, including web development.

### Considerations for web development

When thinking about web development technologies, we must consider how we manage our software lifecycles. All software development includes some sort of [lifecycle management][3] with the opportunity to plan, analyze, design, and implement the code. Our web development team usually works on the fly, often under tight deadlines, and with other departments. That means our requirements and workflow must be flexible enough to allow for quick iterations, updates, and corrections. I'd rather push out something quickly and, if needed, go back in and make things pixel perfect after the fact.

Our team also has to consider all the stakeholders involved in the website, including our talented marketing teams who aren't familiar with Git workflows. That led us, like many others, to utilize a content management system (CMS), so those professionals can make updates without having to use Git.

### Building a CMS-agnostic web architecture

In order to uphold this need for flexibility, traditionally, we relied on an open source CMS, [SilverStripe][4]. However, our requirements quickly outgrew the system. So, we built a standalone API and use static micro-sites with [React][5] JavaScript components to pull data into custom-designed presentation layers. We use this system in everything from mobile apps to websites to digital signs. This has become known as a [Jamstack][6] architecture. We found this model was extensible enough that it allowed us to move our data anywhere while being CMS-agnostic.

When adopting this API-driven workflow, we realized that our data was used in many different places and presented in many different ways. Across our seven web properties, we share everything from graphics to dynamic content. A standard CMS won't do this without a lot of custom development work along with either cron jobs or costly database queries.

When things are API-driven, you can access all these different datasets across a variety of platforms while largely protecting your infrastructure from major traffic spikes. For example, the OSF collaborated with [Tipit][7], the OSF's digital design and development partner, to develop a completely open source end-to-end event management software. Our event-schedule data is presented on web pages, mobile apps, and digital signage. It's the same data, managed from a single place, but with different presentation layers, formats, and platforms.

### Open source identity access management

A cornerstone of moving to a decentralized Jamstack architecture is the need to establish identity and access rights. When using JavaScript to call for things in an API, we may need to require authentication and authorization. Therefore, we had to separate the identity provider from any individual implementation. There are two concepts to this: identity (authN) and identity access management (authZ). The identity provider confirms who you are, while access management confirms what roles and permissions you have to do different things. One of the first requirements when developing the event-management software was to establish a standalone identity provider.

Enter [OpenStackID][8], which is an [OpenID Connect][9] with oAuth2 SSO solution. OpenStackID started out as a more secure way for users to log into [Openstack.org][10] and manage their profiles. Even as the number of websites and event apps we manage grows, this creates a seamless authentication experience for users. The access-management portion allows us to build standalone React-based apps that use the identity provider to determine if a particular user has the rights to do the things they want to do in that specific application.

One thing that runs through everyone's mind—especially in a global open source community—is privacy. It's a large factor in creating our web and event properties. With OpenStackID, users can log into their [OpenStackID account][11] and set application permissions using the OAuth 2 console. If they decide they no longer want their app associated with their OpenStackID, they can simply remove permissions.

For example, we have users for our events that do not want their personal information to be associated with their presence at our conferences. The way the platforms are set up, all personally identifiable data is managed securely on the OpenID server, and it's not shared between applications unless the user strictly enables it. Beyond that, we never share things like the events a user attends or pieces of their user profile unless it's completely anonymized, or they specifically allow it in order to remain aligned with the [Four Opens][12] or our community philosophy.

### Better web infrastructure using open source

Taking our considerations and shifting toward a more flexible implementation of a CMS has helped our teams collaborate more effectively. Most importantly, we continue to follow our community values by providing great privacy and security options thanks to open source technology.

If you're interested in our approach, check out the OSF Foundation website's [source code][13]. You can also access the following source code repos to see the approach in action:

  * [Zuul website][14]
  * [Airship website][15]
  * [StarlingX website][16]
  * [Kata Containers website][17]
  * [MOC and Open Infra Labs website][18]
  * [Open Stack Foundation website][19]
  * [Open Infrastructure Summit admin][20]
  * [Open Infrastructure Summit CFP][21]
  * [Open Infrastructure Summit Signage][22]
  * [OpenStack Survey GraphQL API to access survey data and reports][23]
  * [OpenStack Survey Graphene API to feed summit reports][24]
  * [OpenStackID authentication system][25]
  * [OpenStackID resource server][26]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/open-source-web-development

作者：[Jimmy McArthur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jimmymcarthur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://osf.dev/
[3]: https://en.wikipedia.org/wiki/Systems_development_life_cycle
[4]: https://www.silverstripe.org/
[5]: https://reactjs.org/
[6]: https://jamstack.org/
[7]: https://www.tipit.net/
[8]: https://opendev.org/explore/repos?q=openstackid&tab=&sort=recentupdate
[9]: https://openid.net/connect/
[10]: http://Openstack.org
[11]: https://openstackid.org/
[12]: https://osf.dev/about/four-opens/
[13]: https://github.com/OpenStackweb/openstack-org
[14]: https://opendev.org/zuul/zuul-website
[15]: https://github.com/AirshipWeb/airship-website
[16]: https://github.com/StarlingXWeb/starlingx-website
[17]: https://github.com/kata-containers/www.katacontainers.io
[18]: https://github.com/OpenStackweb/openinfralabs-website
[19]: https://github.com/OpenStackweb/osf-website
[20]: https://github.com/OpenStackweb/summit-admin
[21]: https://github.com/OpenStackweb/call-for-presentations
[22]: https://github.com/OpenStackweb/openstacksignage
[23]: https://github.com/OpenStackweb/openstack-survey-api
[24]: https://github.com/OpenStackweb/summit-reports-api
[25]: https://opendev.org/osf/openstackid
[26]: https://opendev.org/osf/openstackid-resources
