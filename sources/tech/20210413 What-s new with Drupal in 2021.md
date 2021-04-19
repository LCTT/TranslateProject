[#]: subject: (What's new with Drupal in 2021?)
[#]: via: (https://opensource.com/article/21/4/drupal-updates)
[#]: author: (Shefali Shetty https://opensource.com/users/shefalishetty)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What's new with Drupal in 2021?
======
Its newest initiatives include decoupled menus, automated updates, and
other usability-focused updates.
![Computer screen with files or windows open][1]

The success of open source projects is largely carried by the pillars of the community and group collaborations. Without putting a stake in the ground to achieve strategic initiatives, an open source project can lose focus. Open source strategic initiatives should aim at solving impactful problems through collaboration involving the project's stakeholders.

### The why and how of Drupal's strategic initiatives

As one of the leading open source projects, [Drupal][2]'s success largely thrives on implementing its various proposed strategic initiatives. Drupal's focus on strategic initiatives and continuous innovation since Drupal 7 brought huge architectural changes in Drupal 8, 9, and beyond that offer a platform for continuous innovation on the web and an easy upgrade path for end users.

The vision for Drupal's core strategic initiatives is determined by Dries Buytaert, Drupal project lead. These initiatives are backed by community collaboration and lead to significant developments driven by forces like:

  * Collaboration with the core maintainers
  * Survey data and usability studies
  * A vision to build a leading open source digital experience platform
  * Relevancy in the market by improving editorial, developer, and customer experiences
  * Validation by broader community discussions and collaborations



Once initiatives are **proposed**, they move ahead to the **planned** initiatives stage, where each initiative is nurtured with detailed plans and goals by a strong team of contributors. When an initiative passes through this stage, it moves to the **active** initiatives stage. Here's where the initiatives take structure and come alive.

Some of the most successful Drupal 8 initiatives, like Twig and Bigpipe, did not follow the traditional process. However, following a thoughtfully planned process will avoid a lot of [bike-shedding][3].

### Popular past initiatives

In 2011, at DrupalCon Chicago, Dries announced that Drupal 8 would feature core initiatives that would cause big changes to Drupal's architecture. To support the transition, each initiative would have a few leads involved in decision-making and coordination with Dries. Some popular initiatives included:

  * **Configuration Management Initiative (CMI):** This was the first key initiative announced at the 2011 DrupalCon. The idea was to offer site builders more powerful, flexible, and traceable configuration handling in Drupal 8 core. As planned, the Configuration Manager module is now a Drupal 8 core module that allows deploying configurations between different environments easily.
  * **Web Services and Context Core Initiative:** This initiative aimed at embracing a modern web and turned Drupal into a first-class REST server with a first-class content management system (CMS) on top of it. The result? Drupal is now a competent REST server providing the ability to manage content entities through HTTP requests. This is part of why Drupal has been the leading CMS for decoupled experiences for several years.
  * **Layout Initiative:** This initiative's focus was on improving and simplifying the site-building experience by non-technical users, like site builders and content authors. This initiative came alive in Drupal 8 by introducing the Layout Discovery API (a Layout plugin API) in v.8.4 and the Layout Builder module (a complete layout management solution) in v.8.5 core.
  * **Media Initiative:** The Media Initiative was proposed to launch a rich, intuitive, easy-to-use, API-based media solution with extensible media functionalities in the core. This resulted in bringing in the Media API (which manages various operations on media entities) and Media Library (a rich digital asset management tool) to Drupal 8 core.
  * **Drupal 9 Readiness Initiative:** The focus of this initiative was to get Drupal 9 ready by June 3, 2020, so that Drupal 7 and 8 users had at least 18 months to upgrade. Since Drupal 9 is just a cleaned-up version of the last version of Drupal 8 (8.9), the idea was to update dependencies and remove any deprecated code. And as planned, Drupal 9 was successfully released on June 3, 2020. Drupal 8-compatible modules were ported to Drupal 9 faster than any major version upgrade in Drupal's history, with more than 90% of the top 1,000 modules already ported (and many of the remaining now obsolete).



### The new strategic initiatives

Fast-forward to 2021, where everything is virtual. DrupalCon North America will witness a first-of-its-kind "Initiative Days" event added to the traditional DrupalCon content. Previously, initiatives were proposed during the [Driesnote][4] session, but this time, initiatives are more interactive and detailed. DrupalCon North America 2021 participants can learn about an initiative and participate in building components and contributing back to the project.

#### The Decoupled Menus Initiative

Dries proposed the Decoupled Menus Initiative in his keynote speech during DrupalCon Global 2020. While this initiative's broader intent is to make Drupal the best decoupled CMS, to accomplish the larger goal, the project chose to work on decoupled menus as a first step because menus are used on every project and are not easy to implement in decoupled architectures.

The goals of this initiative are to build APIs, documentation, and examples that can:

  * Give JavaScript front-end developers the best way to integrate Drupal-managed menus into their front ends.
  * Provide site builders and content editors with an easy-to-use experience to build and update menus independently.



This is because, without web services for decoupled menus in Drupal core, JavaScript developers are often compelled to hard-code menu items. This makes it really hard for a non-developer to edit or remove a menu item without getting a developer involved. The developer needs to make the change, build the JavaScript code, and then deploy it to production. With the Decoupled Menus Initiative, the developer can easily eliminate all these steps and many lines of code by using Drupal's HTTP APIs and using JavaScript-focused resources.

The bigger idea is to establish patterns and a roadmap that can be adapted to solve other decoupled problems. At DrupalCon 2021, on the [Decoupled Menus Initiative day][5], April 13, you can both learn about where it stands and get involved by building custom menu components and contributing them back to the project.

#### The Easy Out-Of-The-Box Initiative

During DrupalCon 2019 in Amsterdam, CMS users were asked about their perceptions of their CMS. The research found that beginners did not favor Drupal as much as intermediate- and expert-level users. However, it was the opposite for other CMS users; they seemed to like their CMS less over time.

![CMS users' preferences][6]

([Driesnote, DrupalCon Global 2020][7])

Hence, the Easy Out-Of-The-Box Initiative's goal is to make Drupal easy to use, especially for non-technical users and beginners. It is an extension of the great work that has been done for Layouts, Media, and Claro. Layout Builder's low-code design flexibility, Media's robust management of audio-visual content, and Claro's modern and accessible administrative UI combine to empower less-technical users with the power Drupal has under the hood.

This initiative bundles all three of these features into one initiative and aims to provide a delightful user experience. The ease of use can help attract new and novice users to Drupal. On April 14, DrupalCon North America's [Easy Out-Of-The-Box Initiative day][8], the initiative leads will discuss the initiative and its current progress. Learn about how you can contribute to the project by building a better editorial experience.

#### Automated Updates Initiative

The results of a Drupal survey in 2020 revealed that automated updating was the most frequently requested feature. Updating a Drupal site manually can be tedious, expensive, and time-consuming. Luckily, the initiative team has been on this task since 2019, when the first prototype for the Automated Update System was developed as a [contributed module][9]. The focus of the initiative now is to bring this feature into Drupal core. As easy as it may sound, there's a lot more work that needs to go in to:

  * Ensure site readiness for a safe update
  * Integrate composer
  * Verify updates with package signing
  * Safely apply updates in a way that can be rolled back in case of errors



In its first incarnation, the focus is on Drupal Core patch releases and security updates, but the intent is to support the contributed module ecosystem as well.

The initiative intends to make it easier for small to midsized businesses that sometimes overlook the importance of updating their Drupal site or struggle with the manual process. The [Automated Updates Initiative day][10] is happening on April 15 at DrupalCon North America. You will get an opportunity to know more about this initiative and get involved in the project.

#### Drupal 10 Readiness Initiative

With the release of Drupal 10 not too far away (as early as June 2022), the community is gearing up to welcome a more modern version of Drupal. Drupal now integrates more third-party technologies than ever. Dependencies such as Symfony, jQuery, Guzzle, Composer, CKEditor, and more have their own release cycles that Drupal needs to align with.

![CMS Release Cycles][11]

([Driesnote, DrupalCon 2020][7])

The goal of the initiative is to get Drupal 10 ready, and this involves:

  * Releasing Drupal 10 on time
  * Getting compatible with the latest versions of the dependencies for security
  * Deprecating the dependencies, libraries, modules, and themes that are no longer needed and removing them from Drupal 10 core.



At the [Drupal 10 Readiness Initiative day][12], April 16, you can learn about the tools you'll use to update your websites and modules from Drupal 9 to Drupal 10 efficiently. There are various things you can do to help make Drupal better. Content authors will get an opportunity to peek into the new CKEditor 5, its new features, and improved editing experience.

### Learn more at DrupalCon

Drupal is celebrating its 20th year and its evolution to a more relevant, easier to adopt open source software. Leading an evolution is close to impossible without taking up strategic initiatives. Although the initial initiatives did not focus on offering great user experiences, today, ease of use and out-of-the-box experience are Drupal's most significant goals.

Our ambition is to create software that works for everyone. At every DrupalCon, the intent is to connect with the community that fosters the same belief, learn from each other, and ultimately, build a better Drupal.

[DrupalCon North America][13], hosted by the Drupal Association, is the largest Drupal event of the year. Drupal experts, enthusiasts, and users will unite online April 12–16, 2021, share lessons learned and best practices, and collaborate on creating better, more engaging digital experiences. PHP and JavaScript developers, designers, marketers, and anyone interested in a career in open source will be able to learn, connect, and build by attending DrupalCon.

The [Drupal Association][14] is the nonprofit organization focused on accelerating Drupal, fostering the Drupal community's growth, and supporting the project's vision to create a safe, secure, and open web for everyone. DrupalCon is the primary source of funding for the Drupal Association. Your support and attendance at DrupalCon make our work possible.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/drupal-updates

作者：[Shefali Shetty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shefalishetty
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://www.drupal.org/
[3]: https://en.wikipedia.org/wiki/Law_of_triviality
[4]: https://events.drupal.org/global2020/program/driesnote
[5]: https://events.drupal.org/northamerica2021/decoupled-menus-day
[6]: https://opensource.com/sites/default/files/uploads/cms_preferences.png (CMS users' preferences)
[7]: https://youtu.be/RIeRpLgI1mM
[8]: https://events.drupal.org/northamerica2021/easy-out-box-day
[9]: http://drupal.org/project/automatic_updates/
[10]: https://events.drupal.org/northamerica2021/automatic-updates-day
[11]: https://opensource.com/sites/default/files/uploads/cms_releasecycles.png (CMS Release Cycles)
[12]: https://events.drupal.org/northamerica2021/drupal-10-readiness-day
[13]: https://events.drupal.org/northamerica2021?utm_source=replyio&utm_medium=email&utm_campaign=DCNA2021-20210318
[14]: https://www.drupal.org/association
