[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A brief history of the Content Management System)
[#]: via: (https://opensource.com/article/20/7/history-content-management-system)
[#]: author: (Pierre Burgy https://opensource.com/users/pierreburgy)

A brief history of the Content Management System
======
CMS have gone from static page to JAMstack, and its history is at the
heart of open source and the evolution of the web.
![Text editor on a browser, in blue][1]

Content management system (CMS) is a prolific software category that covers all types of applications for the creation and modification of digital content. So it should come as no huge surprise that the history of the CMS traces back to the first website in history, by [Tim Berners-Lee][2] in 1990, which was modeled on an internet-based hypertext system HTML, which represented just text and links.

![timeline of CMS market evolution][3]

The humble beginnings of the world wide web lay in static sites that served content without the need for a back-end database. They consumed very little computing resources, so they loaded quickly—because there were no database queries, no templates to render, and no client-server requests to process. There was also little in the way of web traffic, given that few people were regular "web surfers," especially compared to today.

And, of course, it was all open source software that facilitated this interoperability. Indeed, open source has always played an important role in the evolution of CMS.

### Rise of the CMS

Fast-forward to the mid-nineties, as the popularity of the world wide web grows and websites increase the need for frequent updates—a change from its origins hosting brochure-type static content. This led to the introduction of a plethora of CMS products from FileNet, StoryBuilder from Vignette, Documentum, and many others. These were all proprietary, closed source products, which was not unusual for that time period.

However, in the early 2000s, open source CMS alternatives emerged, including WordPress, Drupal, and Joomla. WordPress included an extensible plugin architecture and provided templates that could be used to build websites without requiring users to have knowledge of HTML and CSS. The WordPress CMS software installed on a web server and typically paired with a MySQL or MariaDB database (both open source, of course). The big shift to WordPress was, in part, accelerated by the fact that the CMS is open-source.

Even today, about one-third of websites are built using these first-generation content management systems. These traditional CMS are monolithic systems that include the back-end user interface, plugins, front-end templates, Cascading Style Sheets (CSS), a web server, and a database. With every user request for a website page, a server first queries a database, then combines the result with data from the page's markup and plugins to generate an HTML document in the browser.

### Trend to LAMPstack

The emergence of the open source CMS was consistent with infrastructure built on the LAMP (Linux, Apache, MySQL, and PHP/Perl/Python) stack. This new structure represented the start of monolithic web development that enabled the creation of dynamic websites that use database queries to deliver unique content for different end users. At this point, the previous model of static sites sitting on a server—where individual files (HTML, CSS, JavaScript) consisting of text and links are delivered the same way to all end users—really started to disappear.

### Mobile web changes everything

As we move deeper and deeper into the first decade of the 2000s, early mobile devices like Palm and Blackberry provide access to web content, then the introduction of smartphones and tablets around 2010 brings more and more users to the web via mobile devices. In 2016, the scales tip and [web access from mobile devices and tablets exceeds desktops][4] worldwide.

The monolithic CMS wasn't suited to serving content to these different types of access devices, which necessitated different versions of websites—usually stripped-down versions of the website for mobile users. The emergence of new Web-ready device types—like smartwatches, gaming consoles, and voice assistants like [Alexa][5]—only exacerbated this problem, and the need for omnichannel content delivery became clear.

### The emergence of headless CMS and JAMstack

A headless CMS decouples the backend—which stores all the content, databases, and files—from the frontend. Typically, a headless CMS uses APIs so that content from databases (SQL and NoSQL) and files can be accessed for display on websites, smartphones, and even Internet of Things (IoT) devices. Additionally, a headless CMS is front-end framework-agnostic, making it compatible with a variety of static site generators and front-end frameworks (e.g., Gatsby.js, Next.js, Nuxt.js, Angular, React, and Vue.js), which gives developers the freedom to choose their favorite tools.

Headless CMS is particularly suitable for the JAM (Javascript, API, and Markup) stack web development architecture that is emerging as a popular solution as it delivers better web performance and SEO rankings, as well as strong security considerations. JAMstack does not depend on a web server and serves static files immediately when a request is made. There is no need to query the database as the files are already compiled and served to the browser.

The shift to headless CMS is driven by a new wave of players, either with a SaaS approach such as Contentful, or self-hosted open source alternatives such as [Strapi][6]. Headless is also disrupting the e-commerce industry, with new software editors such as Commerce Layer and [Saleor][7] (also open source) offering solutions to manage multiple SKUs, prices, and inventory data in a true omnichannel fashion.

### Conclusion

Throughout the evolution of the content management system, which has been driven by how information on the internet is consumed, open source software has progressed along the same trend lines, with new technologies emerging to solve arising requirements. Indeed, it seems there is an interdependency between CMS, the world wide web, and open source. The need to manage the growing volumes of content isn't going away anytime soon. There is every reason to expect even more widespread adoption of open source software in the coming ahead.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/history-content-management-system

作者：[Pierre Burgy][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pierreburgy
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://www.w3.org/People/Berners-Lee/#:~:text=A%20graduate%20of%20Oxford%20University,refined%20as%20Web%20technology%20spread.
[3]: https://opensource.com/sites/default/files/uploads/timeline.market.png (timeline of CMS market evolution)
[4]: https://techcrunch.com/2016/11/01/mobile-internet-use-passes-desktop-for-the-first-time-study-finds/
[5]: https://opensource.com/article/20/6/open-source-voice-assistant
[6]: https://strapi.io/
[7]: https://saleor.io/
