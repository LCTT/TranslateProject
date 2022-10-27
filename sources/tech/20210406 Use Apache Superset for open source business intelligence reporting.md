[#]: subject: (Use Apache Superset for open source business intelligence reporting)
[#]: via: (https://opensource.com/article/21/4/business-intelligence-open-source)
[#]: author: (Maxime Beauchemin https://opensource.com/users/mistercrunch)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use Apache Superset for open source business intelligence reporting
======
Since its creation in 2015 at an Airbnb hackathon, Apache Superset has
matured into a leading open source BI solution.
![metrics and data shown on a computer screen][1]

They say software is eating the world, but it's equally clear that open source is taking over software.

Simply put, open source is a superior approach for building and distributing software because it provides important guarantees around how software can be discovered, tried, operated, collaborated on, and packaged. For those reasons, it is not surprising that it has taken over most of the modern data stack: Infrastructure, databases, orchestration, data processing, AI/ML, and beyond.

Looking back, the main reason why I originally created both [Apache Airflow][2] and [Apache Superset][3] while I was at Airbnb from 2014-17 is that the vendors in the data space were failing to:

  * Keep up with the pace of innovation in the data ecosystem
  * Give power to users who wanted to satisfy their more advanced use cases



As is often the case with open source, the capacity to integrate and extend was always at the core of how we approached the architecture of those two projects.

### Headaches with Tableau

More specifically, for Superset, the main driver to start the project at the time was the fact that Tableau (which was, at the time, our main data visualization tool) couldn't connect natively to [Apache Druid][4] and [Trino][5]/[Presto][6]. These were our data engines of choice that provided the properties and guarantees that we needed to satisfy our data use cases.

With Tableau's "Live Mode" misbehaving in intricate ways at the time (I won't get into this!), we were steered towards using Tableau Extracts. Extracts crumbled under the data volumes we had at Airbnb, creating a whole lot of challenges around non-additive metrics (think distinct user counts) and forcing us to intricately pre-compute multiple "grouping sets," which broke down some of the Tableau paradigms and confused users. Secondarily, we had a limited number of licenses for Tableau and generally had an order of magnitude more employees that wanted/needed access to our internal than our contract allowed. That's without mentioning the fact that for a cloud-native company, Tableau's Windows-centric approach at the time didn't work well for the team.

Some of the above premises have since changed, but the power of open source and the core principles on which it's built have only grown. In this blog post, I will explain why the future of business intelligence is open source.

## Benefits of open source

If I could only use a single word to describe why the time is right for organizations to adopt open source BI, the word would be _freedom_. Flowing from the principle of freedom comes a few more concrete superpowers for an organization:

  * The power to customize, extend and integrate
  * The power of the community
  * Avoid vendor lock-in



### Extend, customize, and integrate

Airbnb wanted to integrate in-house tools like Dataportal and Minerva with a dashboarding tool to enable data democratization within their organization. Because Superset is open source and Airbnb actively contributes to the project, they could supercharge Superset with in-house components with relative ease.

On the visualization side, organizations like Nielsen create new visualizations and deploy them in their Superset environments. They're going a step further by empowering their engineers to contribute to Superset's customizability and extensibility. The Superset platform is now flexible enough so that anyone can build their [own custom visualization plugins][7], a benefit that is unmatched in the marketplace.

Many report using the rich [REST API that ships with Superset][8] within the wider community, allowing them full programmatic control over all aspects of the platform. Given that pretty much everything that users can do in Superset can be done through the API, the sky is the limit for automating processes in and around Superset.

Around the topic of integration, members from the Superset community have added support for over 30 databases ([and growing!][9]) by submitting code and documentation contributions. Because the core contributors bet on the right open source components ([SQLAlchemy][10] and Python [DB-API 2.0][11]), the Superset community both gives and receives to/from the broader Python community.

### The power of the community

Open source communities are composed of a diverse group of people who come together over a similar set of needs. This group is empowered to contribute to the common good. Vendors, on the other hand, tend to focus on their most important customers. Open source is a fundamentally different model that's much more collaborative and frictionless. As a result of this fundamentally de-centralized model, communities are very resilient to changes that vendor-led products struggle with. As contributors and organizations come and go, the community lives on!

At the core of the community are the active contributors that typically operate as a dynamic meritocracy. Network effects attract attention and talent, and communities welcome and offer guidance to newcomers because their goals are aligned. With the rise of platforms like Gitlab and Github, software is pretty unique in that engineers and developers from around the world seem to be able to come together and work collaboratively with minimal overhead. Those dynamics are fairly well understood and accepted as a disruptive paradigm shift in how people collaborate to build modern software.

![Growth in Monthly Unique Contributors][12]

Growth in Monthly Unique Contributors

Beyond the software at the core of the project, dynamic communities contribute in all sorts of ways that provide even more value. Here are some examples:

  * Rich and up-to-date documentation
  * Example use cases and testimonials, often in the form of blog posts
  * Bug reports and bug fixes, contributing to stability and quality
  * Ever-growing online knowledge bases and FAQs
  * How-to videos and conference talks
  * Real-time support networks of enthusiasts and experts in forums and on [chat platforms][13]
  * Dynamic mailing lists where core contributors propose and debate over complex issues
  * Feedback loops, ways to suggest features and influence roadmaps



### Avoid lock-in

Recently, [Atlassian acquired the proprietary BI platform Chart.io][14], started to downsize the Chart.io team, and announced their intention to shut down the platform. Their customers now have to scramble and find a new home for their analytics assets that they now have to rebuild.

![Chart.io Shutting Down][15]

Chart.io Shutting Down

This isn't a new phenomenon. Given how mature and dynamic the BI market is, consolidation has been accelerating over the past few years:

  * Tableau was acquired by Salesforce
  * Looker was acquired by Google Cloud
  * Periscope was acquired by Sisense
  * Zoomdata was acquired by Logi Analytics



While consolidation is likely to continue, these concerns don't arise when your BI platform is open source. If you're self-hosting, you are essentially immune to vendor lock-in. If you choose to partner with a commercial open source software (COSS), you should have an array of options from alternative vendors to hiring expertise in the marketplace, all the way to taking ownership and operating the software on your own.

For example, if you were using Apache Airflow service to take care of your Airflow needs, and your cloud provider decided to shut down the service, you'd be left with a set of viable options:

  * Select and migrate to another service provider in the space, such as Apache Airflow specialist [Astronomer][16].
  * Hire or consult Airflow talent that can help you take control. The community has fostered a large number of professionals who know and love Airflow and can help your organization.
  * Learn and act. That is, take control and tap into the community's amazing resources to run the software on your own (Docker, Helm, k8s operator, and so on.)



Even at [Preset][17], where we offer a cloud-hosted version of Superset, we don't fork the Superset code and instead run the same Superset that's available to everyone. In the Preset cloud, you can freely import and export data sources, charts, and dashboards. This is not unique to Preset. Many vendors understand that "no lock-in!" is integral to their value proposition and are incentivized to provide clear guarantees around this.

## Open source for your data

Open source is disruptive in the best of ways, providing freedom, and a set of guarantees that really matter when it comes to adopting software. These guarantees fully apply when it comes to business intelligence. In terms of business intelligence, Apache Superset has matured to a level where it's a compelling choice over any proprietary solution. Since its creation in 2015 at an Airbnb hackathon, the project has come a very long way indeed. Try it yourself to discover a combination of features and guarantees unique to open source BI. To learn more, visit and [join our growing community][18].

In this article, I review some of the top open source business intelligence (BI) and reporting...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/business-intelligence-open-source

作者：[Maxime Beauchemin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mistercrunch
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://airflow.apache.org/
[3]: https://superset.apache.org/
[4]: https://druid.apache.org/
[5]: https://trino.io/
[6]: https://prestodb.io/
[7]: https://preset.io/blog/2020-07-02-hello-world/
[8]: https://superset.apache.org/docs/rest-api/
[9]: https://superset.apache.org/docs/databases/installing-database-drivers
[10]: https://www.sqlalchemy.org/
[11]: https://www.python.org/dev/peps/pep-0249/
[12]: https://opensource.com/sites/default/files/uniquecontributors.png
[13]: https://opensource.com/article/20/7/mattermost
[14]: https://www.atlassian.com/blog/announcements/atlassian-acquires-chartio
[15]: https://opensource.com/sites/default/files/chartio.jpg
[16]: https://www.astronomer.io/
[17]: https://preset.io/
[18]: https://superset.apache.org/community/
