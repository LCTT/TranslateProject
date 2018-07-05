Translating by qhwdw
Getting started with Open edX to host your course
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesgen_rh_032x_0.png?itok=cApG9aB4)

Now in its [seventh major release][1], the [Open edX platform][2] is a free and open source course management system that is used [all over the world][3] to host Massive Open Online Courses (MOOCs) as well as smaller classes and training modules. To date, Open edX software has powered more than 8,000 original courses and 50 million course enrollments. You can install the platform yourself with on-premise equipment or by leveraging any of the industry-leading cloud infrastructure services providers, but it is also increasingly being made available in a Software-as-a-Service (SaaS) model from several of the project’s growing list of [service providers][4].

The Open edX platform is used by many of the world’s premier educational institutions as well as private sector companies, public sector institutions, NGOs, non-profits, and educational technology startups, and the project’s global community of service providers continues to make the platform accessible to ever-smaller organizations. If you plan to create and offer educational content to a broad audience, you should consider using the Open edX platform.

### Installation

There are multiple ways to install the software, which might be an unwelcome surprise, at least initially. But you get the same application software with the same feature set regardless of how you go about [installing Open edX][5]. The default installation includes a fully functioning learning management system (LMS) for online learners plus a full-featured course management studio (CMS) that your instructor teams can use to author original course content. You can think of the CMS as a “[Wordpress][6]” of course content creation and management, and the LMS as a “[Magento][7]” of course marketing, distribution, and consumption.

Open edX application software is device-agnostic and fully responsive, and with modest effort, you can also publish native iOS and Android apps that seamlessly integrate to your instance’s backend. The code repositories for the Open edX platform, the native mobile apps, and the installation scripts are all publicly available on [GitHub][8].

#### What to expect

The Open edX platform [GitHub repository][9] contains performant, production-ready code that is suitable for organizations of all sizes. Thousands of programmers from hundreds of institutions regularly contribute to the edX repositories, and the platform is a veritable case study on how to build and manage a complex enterprise application the right way. So even though you’re certain to face a multitude of concerns about how to move the platform into production, you should not lose sleep about the general quality and robustness of the Open edX Platform codebase itself.

With minimal training, your instructors will be able to create good online course content. But bear in mind that Open edX is extensible via its [XBlock][10] component architecture, so your instructors will have the potential to turn good course content into great course content with incremental effort on their parts and yours.

The platform works well in a single-server environment, and it is highly modular, making it nearly infinitely horizontally scalable. It is theme-able, localizable, and completely open source, providing limitless possibilities to tailor the appearance and functionality of the platform to your needs. The platform runs reliably as an on-premise installation on your own equipment.

#### Some assembly required

Bear in mind that a handful of the edX software modules are not included in the default installation and that these modules are often on the requirements lists of organizations. Namely, the Analytics module, the e-commerce module, and the Notes/Annotations course feature are not part of the default platform installation, and each of these individually is a non-trivial installation. Additionally, you’re entirely on your own with regard to data backup-restore and system administration in general. Fortunately, there’s a growing body of community-sourced documentation and how-to articles, all searchable via Google and Bing, to help make your installation production-ready.

Setting up [oAuth][11] and [SSL/TLS][12] as well as getting the platform’s [REST API][13] up and running can be challenging, depending on your skill level, even though these are all well-documented procedures. Additionally, some organizations require that MySQL and/or MongoDB databases be managed in an existing centralized environment, and if this is your situation, you’ll also need to work through the process of hiving these services out of the default platform installation. The edX design team has done everything possible to simplify this for you, but it’s still a non-trivial change that will likely take some time to implement.

Not to be discouraged—if you’re facing resource and/or technical headwinds, Open edX community SaaS providers like [appsembler][14] and [eduNEXT][15] offer compelling alternatives to a do-it-yourself installation, particularly if you’re just window shopping.

### Technology stack

Poking around in an Open edX platform installation is a real thrill, and architecturally speaking, the project is a masterpiece. The application modules are [Django][16] apps that leverage a plethora of the open source community’s premier projects, including [Ubuntu][17], [MySQL][18], [MongoDB][19], [RabbitMQ][20], [Elasticsearch][21], [Hadoop][22], and others.

![edx-architecture.png][24]

The Open edX technology stack (CC BY, by edX)

Getting all of these components installed and configured is a feat in and of itself, but packaging everything in such a way that organizations of arbitrary size and complexity can tailor installations to their needs without having to perform heart surgery on the codebase would seem impossible—that is, until you see how neatly and intuitively the major platform configuration parameters have been organized and named. Mind you, there’s a learning curve to the platform’s organizational structure, but the upshot is that everything you learn is worth knowing, not just for this project but large IT projects in general.

One word of caution: The platform's UI is in flux, with the aim of eventually standardizing on [React][25] and [Bootstrap][26]. Meanwhile, you'll find multiple approaches to implementing styling for the base theme, and this can get confusing.

### Adoption

The edX project has enjoyed rapid international adoption, due in no small measure to how well the software works. Not surprisingly, the project’s success has attracted a large and growing list of talented participants who contribute to the project as programmers, project consultants, translators, technical writers, and bloggers. The annual [Open edX Conference][27], the [Official edX Google Group][28], and the [Open edX Service Providers List][4] are good starting points for learning more about this diverse and growing ecosystem. As a relative newcomer myself, I’ve found it comparatively easy to engage and to get directly involved with the project in multiple facets.

Good luck with your journey, and feel free to reach out to me as a sounding board while you’re conceptualizing your project.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/getting-started-open-edx

作者：[Lawrence Mc Daniel][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mcdaniel0073
[1]:https://openedx.atlassian.net/wiki/spaces/DOC/pages/11108700/Open+edX+Releases
[2]:https://open.edx.org/about-open-edx
[3]:https://www.edx.org/schools-partners
[4]:https://openedx.atlassian.net/wiki/spaces/COMM/pages/65667081/Open+edX+Service+Providers
[5]:https://openedx.atlassian.net/wiki/spaces/OpenOPS/pages/60227779/Open+edX+Installation+Options
[6]:https://wordpress.com/
[7]:https://magento.com/
[8]:https://github.com/edx
[9]:https://github.com/edx/edx-platform
[10]:https://open.edx.org/xblocks
[11]:https://oauth.net/
[12]:https://en.wikipedia.org/wiki/Transport_Layer_Security
[13]:https://en.wikipedia.org/wiki/Representational_state_transfer
[14]:https://www.appsembler.com/
[15]:https://www.edunext.co/
[16]:https://www.djangoproject.com/
[17]:https://www.ubuntu.com/
[18]:https://www.mysql.com/
[19]:https://www.mongodb.com/
[20]:https://www.rabbitmq.com/
[21]:https://www.elastic.co/
[22]:http://hadoop.apache.org/
[23]:/file/400696
[24]:https://opensource.com/sites/default/files/uploads/edx-architecture_0.png (edx-architecture.png)
[25]:%E2%80%9Chttps://reactjs.org/%E2%80%9C
[26]:%E2%80%9Chttps://getbootstrap.com/%E2%80%9C
[27]:https://con.openedx.org/
[28]:https://groups.google.com/forum/#!forum/openedx-ops
