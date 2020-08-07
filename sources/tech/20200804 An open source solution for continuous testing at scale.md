[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An open source solution for continuous testing at scale)
[#]: via: (https://opensource.com/article/20/8/cerberus-test-automation)
[#]: author: (Antoine Craske https://opensource.com/users/acraske)

An open source solution for continuous testing at scale
======
Cerberus focuses on testing usability, scalability, and integration.
![Coding on a computer][1]

In Sogeti's most recent [World Quality Report][2], software testing ranked No. 1 in terms of its contributions to business objectives and growth, making it a key enabler for business digitalization. Despite this, the software testing industry still reports major pain points related to test maintenance, automation, tooling, and skills. Most of the tooling in common use lacks capabilities, is too complex to integrate, provides insufficient intelligence, or is too difficult to use.

[Cerberus Testing][3] provides a solution to these problems. It is a test automation solution built by retail companies to support digitalization initiatives and focuses on usability, scalability, and integration of the test lifecycle process.

![Cerberus supports test lifecycle to accelerate feedback loops][4]

(Cerberus, [CC BY-SA 4.0][5])

### What is Cerberus?

Our IT team at La Redoute, a French clothing fashion retailer, began writing the first lines of code of what would become Cerberus in 2010. Our objectives were to automate manual non-regression tests for existing web applications to accelerate and increase the quality of software delivery. We also wanted our in-house solution to enable iterations through test management, execution, and reporting in minutes, rather than weeks.

Cerberus is based on a Selenium web driver and a three-tier traditional architecture with a Java technology stack. A key requirement for development was to limit code to support usability, reuse, and keeping tests simple.

At the time we developed Cerberus, most solutions were commercial and designed to address specific silos such as test repositories, execution, or analytics. Cerberus combines the three test silos and enables web, API, and database testing. This is why we chose the name Cerberus, after the [three-headed dog that guards Hades][6] in Greek mythology.

### Releasing Cerberus as open source

The first version automated functional testing for an internal customer-relationship management (CRM) solution, and once it was shown to successfully detect dangerous release defects, we considered it to be a product.

Next, we began using Cerberus to test La Redoute's e-commerce platform. As we shared our experience with the industry, we learned our peers were still struggling with test automation. So, in 2013, knowing the value of open source software for product innovation and development, we released Cerberus on [SourceForge][7] and [GitHub][8] under a GNU General Public License to encourage our community to share code and ideas. As with all open source projects, we make a continuous effort to ensure code quality, documentation, and transparency.

![Cerberus GitHub repository][9]

(Antoine Craske, [CC BY-SA 4.0][5])

During this period, [digital transformation][10] was escalating, making it essential for Cerberus to enable full regression test automation and monitoring. We focused on improving flexibility in test management, execution scalability, and traceability to meet those objectives. Adding end-to-end tests alongside functional tests was key. It enabled us to accelerate the software delivery cycle by more than 10x in certain cases. We published a [case study][11] about our 96% success in daily deployments and more than 6,000 automated tests in a year.

### Growing interest

Other French retailers, including Decathlon, Norauto, Leroy Merlin, and Midas, became interested in Cerberus. The emerging community of testers then shared it with other organizations that used the solution to accelerate their digital transformation, primarily for e-commerce and backoffice transformations.

![Cerberus integrations][12]

(Cerberus, [CC BY-SA 4.0][5])

We added standard integrations to Cerberus to increase its usability. A [Jenkins][13] plugin was a key addition to facilitate deployment of CI/CD pipelines with test automation and feedback. Adding support for REST APIs, advanced scheduling, retries, and screenshots enabled Cerberus to further accelerate testing-cycle time. For example, French retailer Leroy Merlin uses Cerberus for [mobile testing at scale][14].

### Support for continuous testing

With recent and ongoing updates, organizations can leverage Cerberus' features from development to operations. It expands digital experience test coverage by executing tests on a variety of browsers, devices, and apps. Its native connectors for APIs (including SOAP and REST), desktop applications, and [Apache Kafka][15] enable testing legacy apps, APIs, event-driven microservices, streaming services, business intelligence, data science applications, and other use cases.

During the software development lifecycle, Cerberus supports fast iterations in test management, execution, and reporting. Users can create test specifications in plain English, compose tests using a library, execute in parallel on various devices, and do advanced reporting. Native integration with CI/CD solutions, such as Jenkins, Bitbucket, and others, combined with one-click ticket creation in Jira and other tools, makes bug resolution faster and easier.

![Cerberus use cases][16]

(Cerberus, [CC BY-SA 4.0][5])

Cerberus can also monitor customer experience and business operations. Tests can be functional and technical, allowing organizations to test complex scenarios. For example, France's leading TV channel, TF1, uses it for quality assurance on its streaming platform.

Capabilities such as advanced scheduling, alerting, notifications, and web-performance and analytics dashboards make it easier to discover issues and identify bottlenecks with third-party integrations or customer experience problems.

### Next steps

We are focusing now on engaging and growing the Cerberus community to accelerate the product's development and adoption. We hold community meetings every two weeks to align the product roadmap and improvements and to balance our product vision with community needs. Improving integrations and usability is vital to producing a successful product experience.

If you would like to try Cerberus or contribute to the community, please visit our [Cerberus Testing page][8] on GitHub. You can also find us on [LinkedIn][17], [Twitter][18], and [YouTube][19].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/cerberus-test-automation

作者：[Antoine Craske][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/acraske
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://www.sogeti.se/utforska/rapporter/world-quality-report-2019-2020/
[3]: https://cerberus-testing.org/
[4]: https://opensource.com/sites/default/files/uploads/cerberus_test-lifecycle_0.png (Cerberus supports test lifecycle to accelerate feedback loops)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://en.wikipedia.org/wiki/Cerberus
[7]: https://sourceforge.net/projects/cerberus-source/files/cerberus-testing-4.4/
[8]: https://github.com/cerberustesting/cerberus-source
[9]: https://opensource.com/sites/default/files/uploads/cerberus_github.png (Cerberus GitHub repository)
[10]: https://enterprisersproject.com/what-is-digital-transformation
[11]: https://laredoute.io/blog/96-successful-daily-web-production-deploy/
[12]: https://opensource.com/sites/default/files/uploads/cerberus_integrations.png (Cerberus integrations)
[13]: https://www.jenkins.io/
[14]: https://medium.com/leroymerlin-tech-digital/on-a-construit-une-plateforme-de-test-mobile-b44e2c785c7f
[15]: https://kafka.apache.org/
[16]: https://opensource.com/sites/default/files/uploads/cerberus_use-cases.png (Cerberus use cases)
[17]: https://www.linkedin.com/company/cerberus-testing/
[18]: https://twitter.com/cerberustesting
[19]: https://www.youtube.com/channel/UCkG4csTjR0V5gl77BHhldBQ
