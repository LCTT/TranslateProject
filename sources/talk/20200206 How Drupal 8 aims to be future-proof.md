[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Drupal 8 aims to be future-proof)
[#]: via: (https://opensource.com/article/20/2/drupal-8-promises)
[#]: author: (Shefali Shetty https://opensource.com/users/shefalishetty)

How Drupal 8 aims to be future-proof
======
What you need to know about Drupal 8 updates.
![Drupal logo with gray and blue][1]

Thomas Edison famously said, "The three great essentials to achieve anything worthwhile are, first, hard work; second, stick-to-itiveness; third, common sense." This quote made me wonder if "sticking-to-it" is contradictory to innovation; does it make you resistant to change? But, the more I pondered on it, I realized that innovation is fueled by perseverance.

Before Drupal 8 was introduced, the Core committee had not just promised to innovate; they decided to be persistent. Persistent in continuous reinvention. Persistent in making Drupal easier to adopt—not only by the market but also by developers with various levels of expertise. However, to be able to make Drupal successful and relevant in the long run, a drastic change was needed—a change that would build a better future. For this, Drupal 8 had to dismantle the Drupal 7 architecture and lay a fresh foundation for a promising future. Moving on to Drupal 9 (coming soon) and subsequent versions will now be easy and straightforward.

### Freedom to innovate with open source

Innovation brings freedom, and freedom creates innovation. Open source gives you the freedom to access, learn, contribute, and, most importantly, the freedom to innovate. The ability to learn, catch up, and reinvent is extremely crucial today. Drupal began as a small internal news website and later went on to become an open source content management system (CMS) because there was a potential to make it much more compelling by attracting more contributions. It gave developers the freedom to collaborate, re-use components, and improvise on it to create something more modern, powerful, and relevant.

### Promises delivered: Drupal 8 version history

The web is always changing. To stay relevant, [Drupal][2] had to introduce changes that were revolutionary but, at the same time, not so hard to accept. Drupal 7, as a content management system, was widely welcomed. But it lacked in certain aspects like developer adoptability, easy upgrade paths, better API support, and more. Drupal 8 changed everything. They did not choose to build upon Drupal 7, which would have been an easier choice for an open source CMS. For a more future-proof CMS that is ready to accept changes, Drupal 8 had to be rebuilt with more modern components like Symfony, Twig, PHP 7, and initiatives like the API-first initiative, mobile-first initiative, Configuration Management initiative, etc.

Drupal 8 was released with a promise of providing more ambitious digital experiences with better UX improvements and mobile compatibilities. The goal was to continuously innovate and reinvent itself. For this to work, these practices needed to be put in place: semantic versioning (major.minor.patch), scheduled releases (two minor releases per year), and introducing experimental modules in Core. All of this while providing backward compatibility and removing deprecated code.

Let’s look at some of the promises that have been delivered with each minor version of Drupal 8.

  * **Drupal 8.0**
    * Modern and sophisticated PHP practices, object-oriented programming, and libraries.
    * Storage and management of configuration was a bit of a messy affair with Drupal 7. The Configuration Management Initiative was introduced with Drupal 8.0, which allowed for cleaner installations and config management. Configurations are now stored in easily readable YAML format files. These config files can also be readily imported. This allows for smooth and easy transitions to different deployment environments.
    * Adding Symfony components drastically improved Drupal 8’s flexibility, performance, and robustness. Symfony is an open source PHP framework, and it abides by the MVC (Model-View-Controller) architecture.
    * Twig is a powerful template engine for PHP, replaced Drupal’s engine since 2005, PHPTemplate. With Twig, the code is now more readable, and the theme system is less complex, uses inheritance to avoid redundant code, and offers more security by sanitizing variables and functions.
    * The Entity API, which was quite limited and a contributed module in Drupal 7, is now full-fledged and is in Drupal 8 Core. Since Drupal 8 treats everything as an "entity," the Entity API provides a standardized method of working with them.
    * The CKEditor, which is a WYSIWYG (What You See Is What You Get) editor, was introduced. It allows for editing on the go, in-context editing, and previewing your changes before it gets published.
  * **Drupal 8.1**
    * The alpha version of the BigPipe module got introduced to Core as an experimental module. BigPipe renders Drupal 8 pages faster using methods like caching and auto-placeholder-ing.
    * A Migrate UI module suite got introduced to Core as an experimental module. It makes migrating from Drupal 7 to Drupal 8 easier.
    * The CKEditor now includes spell-check functionality and the ability to add optional languages in text.
    * Improved testing infrastructure and support especially for Javascript interactions.
    * Composer is an essential tool to manage third-party dependencies of websites and modules. With Drupal 8.1, Drupal Core and all its dependencies are now managed and packaged by Composer.
  * **Drupal 8.2**
    * The Place Block module is now an experimental module in Core. With this module, you can easily play around with blocks right from the web UI. Configuring and editing blogs can be done effortlessly.
    * A new Content Moderation module that is based on the contributed module Workbench Moderation has been introduced as an experimental module in Core. It allows for granular workflow permissions and support.
    * Content authoring experiences have been enhanced with better revision history and recovery.
    * Improved page caching for 404 responses.
  * **Drupal 8.3**
    * The BigPipe module is now stable!
    * More improvements in the CKEditor. A smooth copy-paste experience from Word, drag and drop images, and an Autogrow plugin that lets you work with bigger screen sizes and more.
    * Better admin status reporting for improved administrator experience.
    * The Field Layout module was added as an experimental module in Core. This module replaces the Display Suite in Drupal 7 and allows for arranging and assigning layouts to different content types.
  * **Drupal 8.4**
    * The 8.4 version calls for many stable releases of previously experimental modules.
    * Inline Form Errors module, which was introduced in Drupal 8.0, is now stable. With this module, form errors are placed next to the form element in question, and a summary of the errors is provided on the top of the form.
    * Another stable release—the DateTime Range module that allows date formats to match that of the Calendar module.
    * The Layout Discovery API, which was added as an experimental module in Drupal 8.3, is now stable and ready to roll. With this module, the Layout API is added to Drupal 8 Core. It has adopted the previously popular contributed modules—Panels and Panelizer—that were used extensively to create amazing layouts. Drupal 8’s Layout initiative has ensured that you have a powerful Layout building tool right out of the box.
    * The very popular Media module is added as an API for developers to be able to port a wide range of Media contributed modules from Drupal 7. For example, media modules like the Media entity, media entity document, media entity browser, media entity image, and more. However, this module is still hidden from site builders till the porting and fixing of issues are over with.
  * **Drupal 8.5**
    * One of the top goals that Drupal 8 set out to reach was making rich images, media integration, and asset management easier and better for content authors. It has successfully achieved this goal by adding the Media module now in Core (and it isn’t hidden anymore). 
    * Content Moderation module is now stable. Defining various levels and statuses of workflow and moving them around is effortless.
    * The Layout builder module is introduced as an experimental module. It gives site builders full control and flexibility to customize and built layouts from other layout components, blocks, and regions. This has been one of the top goals for Drupal 8 site builders.
    * The Migrate UI module suite that was experimental in Drupal 8.1 is now considered stable.
    * Big pipe module which got previously stable in version 8.5, now comes by default in the standard installation profile. All Drupal 8 sites are now faster by default.
    * PHP 7.2 is here, and Drupal 8.5 now runs on it and fully supports the new features and performance improvements that it offers.
  * **Drupal 8.6**
    * The very helpful oEmbed format is now supported in the Drupal 8.6 Media module. The oEmbed API helps in displaying embedded content when a URL for that resource is posted. Also included within the Media module is support for embedding YouTube and Vimeo videos.
    * An experimental Media Library module is now in Core. Adding and browsing multiple media is now supported and can also be customized.
    * A new demo site called Umami has been introduced that demonstrates Drupal 8's Core features. This installation profile can give a new site builder a peek into Drupal’s capabilities and allows them to play around with views, fields, and pages for learning purposes. It also acts as an excellent tool for Drupal agencies to showcase Drupal 8 to its customers.
    * Workspaces module is introduced as an experimental module. When you have multiple content packages that need to be reviewed (status change) and deployed, this module lets you do all of it together and saves you a lot of time.
    * Installing Drupal has now gotten easier with this version. It offers two new easy ways of installing Drupal. One with a "quick start" command that only requires you to have PHP installed. In the other option, the installer automatically identifies if there has been a previous installation and lets you install it from there.
  * **Drupal 8.7**
    * One of the most significant additions to Drupal Core that went straight there as a stable module is the JSON:API module. It takes forward Drupal’s API-first initiative and provides an easy way to build decoupled applications.
    * The Layout Builder module is now stable and better than ever before. It now even lets you work with unstructured data as well as fieldable entities.
    * Media Library module gets a fresh new look with this version release. Marketers and Content editors now have it much easier with the ability to search, attach, drag, and drop media files whenever and wherever they need it.
    * Fully supports PHP 7.3.
    * Taxonomy and Menu items are revision-able, which means that they can be used in editorial workflows and can be assigned statuses.
  * **Drupal 8.8**
    * This version is going to be the last minor version of Drupal 8 where you will find new features or deprecations. The next version, Drupal 8.9, will not include any new additions but will be very similar to Drupal 9.0.
    * The Media Library module is now stable and ready to use.
    * Workspaces module is now enhanced to include adding hierarchical workspaces. This gives more flexibility in the hands of the content editor. It also works with the Content Moderation module now.
    * Composer now receives native support and does not need external projects to package Drupal with its dependencies. You can create new projects with just a one-line command using Composer.
    * Keeping its promises on making Drupal easier to learn for newbies, a new experimental module for Help Topics has been introduced. Each module, theme, and installation profile can have task-based help topics.



### Opening doors to a wider set of developers

Although Drupal was largely accepted and loved for its flexibility, resilience, and, most of all, its content management abilities, there was a nagging problem—the "deep learning curve" issue. While many Drupalers argue that the deep learning curve is part and parcel of a CMS that can build highly complex and powerful applications, finding Drupal talent is a challenge. Dries, the founder of Drupal, says, "For most people new to Drupal, Drupal 7 is really complex." He also adds that this could be because of holding on to procedural programming, large use of structured arrays, and more such "Drupalisms" (as he calls them).

This issue needed to be tackled. With Drupal 8 adopting modern platforms and standards like object-oriented programming concepts, latest PHP standards, Symfony framework, and design patterns, the doors are now flung wide open to a broad range of talent (site builders, themes, developers).

### Final thoughts

"The whole of science is nothing more than a refinement of everyday thinking."– Albert Einstein.

Open source today is more than just free software. It is a body of collaborated knowledge and effort that is revolutionizing the digital ecosystem. The digital world is moving at a scarily rapid pace, and I believe it is only innovation and perseverance from open source communities that can bring it to speed. The Drupal community unwaveringly reinvents and refines itself each day, which is especially seen in the latest release of Drupal 8.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/drupal-8-promises

作者：[Shefali Shetty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shefalishetty
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/drupal_blue_gray_lead.jpeg?itok=eSkFp_ur (Drupal logo with gray and blue)
[2]: https://www.specbee.com/drupal-web-development-services
