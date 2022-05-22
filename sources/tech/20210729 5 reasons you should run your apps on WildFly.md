[#]: subject: (5 reasons you should run your apps on WildFly)
[#]: via: (https://opensource.com/article/21/7/run-apps-wildfly)
[#]: author: (Ranabir Chakraborty https://opensource.com/users/ranabir-chakraborty)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 reasons you should run your apps on WildFly
======
WildFly is a popular choice for users and developers worldwide who
develop enterprise-capable applications.
![Person drinking a hot drink at the computer][1]

WildFly, formerly known as JBoss Application Server, is an open source Java EE application server. Its primary goal is to provide a set of vital tools for enterprise Java applications.

According to the Jakarta EE 2020/2021 [survey][2], WildFly is head and shoulders above in the recent application servers and in the rating categories. Here are some of the reasons why:

### 1. Save time with faster development

WildFly supports the newest standards for REST-based data access, including JAX-RS 2 and JSON-P, and because it's building on Jakarta EE, which provides rich enterprise capabilities with ease of use of frameworks that eliminate boilerplate and reduce technical burden.

The quick boot feature of WildFly, integrated with the easy-to-use Arquillian framework, allows for test-driven development using the actual environment in which your code runs. This test code is separate and deployed alongside the application, where it has full access to server resources.

### 2\. Powerful but simple to use

WildFly configuration setup is centralized, simple, and user-focused. 
The configuration file—organized by subsystems—is easy to understand and has no internal server wiring that will be exposed. All management capabilities appear in a unified manner across all forms of access. These include a command-line interface, a web-based administration console, a native Java API, an HTTP/JSON-based REST API, and a JMX gateway. These options allow for custom automation using the tools and languages that best suit your needs.

### 3. Modular and lightweight

WildFly does classloading right. And it does it smoothly. It uses JBoss Modules to provide true application isolation while hiding server implementation classes from the application and only connects to JARs that your application needs. Appearance rules have sensible defaults but are usually customized. The dependency resolution algorithm means that classloading performance isn't affected by the number of versions of libraries you've got installed.

In WildFly base, they've developed runtime services to attenuate heap allocation using standard cached indexed metadata over duplicate full parses, which reduces heap and object churn. One hundred percent of the administration console is stateless and purely client-driven. It starts immediately and requires zero memory on the server. This integrated configuration enables WildFly to run with stock JVM settings—even on small devices while leaving more headroom for application data and supporting high-level scalability.

### 4\. Save resources with efficient management

WildFly takes a more aggressive approach to memory management and relies on pluggable subsystems, installed or removed as required. Subsystems use smart and intelligent defaults but can still be customized to best suit your needs. When working with domain mode, all participating servers' configuration is laid out in a well-organized, consistent manner within the same file.

### 5. Leverage open source

WildFly is an open source community project and is out there to be used and distributed using the LGPL v2.1 license, which means it's available for you to download and use for whatever you need. This allows organizations to develop unique new technologies and federates the world of technology to help successful startups to spring up anywhere.

## 8 ways to contribute to WildFly

Now that you know a bit about WildFly, Let’s try to understand the ways you can get involved with WildFly.

WildFly relies on contributions from people like you. I’ve joined Red Hat and contributed to WildFly for a year now, and it’s fun to work with great minds around you, and you’ll get to learn a lot. Here are some ways by which you can be a part of and assist the community.

### 1\. Check out the repository.

Here are the [WildFly][3] and [WildFly Core][4] (WildFly Core provides the core runtime used by the Wildfly application server). If you want to get more details, you can check out this [document][5].

### 2\. Raise a ticket or work on existing issues.

After checking out the WildFly repositories, if you feel some enhancements or fixes are needed, you can create issues for [WildFly][6] and [WildFly Core][7], or work on pre-existing issues.

### 3\. Edit the website

Like the WildFly project, the website is open source too. You can check out the [repository][8] and contribute here too, with some new and attractive modifications.

### 4\. Blog with us

You have a [blog][9], and all entries are maintained in a Git repository. If you have new ideas, you can share your experience and ideas in the form of an editorial. We use [markdown][10] and [AsciiDoc][11] so that you can submit your blog post as a pull request.

### 5\. Edit the Documentation

You can also help us to [make better documentation][12]. Let us know if you find a typo or an error, and feel free to send a pull request. Your input is valuable to us, and always welcome.

### 6\. Help somebody out

You can check out our [forums][13] and if you run into an issue, post your question and check the previous issues if you see some similarities. You can also share your knowledge and answer some of the queries because your knowledge can help others.

### 7\. Join our chatroom and follow the latest news

Our Project team has an open (and open source) and active [chatroom][14] where you can ask your questions and check out the [latest news][15] section to find what are the new things we are working on. Stop by, say hello, interact with the team members, but keep in mind that basic rules of civility apply.

### 8\. Spread the word

The simplest and easiest way to help the WildFly community is to act as a project ambassador by spreading the news, educating others about the usage of WildFly, and showing up to the community events in your area.

## **Final thoughts**

WildFly is a popular choice for users and developers worldwide who develop enterprise-capable applications. WildFly is an active project, so there are always new features in the works, and we're all delighted to be a part of it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/run-apps-wildfly

作者：[Ranabir Chakraborty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ranabir-chakraborty
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://arjan-tijms.omnifaces.org/2021/02/jakarta-ee-survey-20202021-results.html
[3]: https://github.com/wildfly/wildfly
[4]: https://github.com/wildfly/wildfly-core
[5]: https://developer.jboss.org/docs/DOC-48381
[6]: https://issues.redhat.com/browse/WFLY-14541?jql=project%20%3D%20WFLY%20AND%20resolution%20%3D%20Unresolved%20ORDER%20BY%20priority%20DESC%2C%20updated%20DESC
[7]: https://issues.redhat.com/projects/WFCORE/issues/WFCORE-4827?filter=allopenissues
[8]: https://github.com/wildfly/wildfly.org
[9]: https://github.com/wildfly/wildfly.org/tree/master/_posts
[10]: https://opensource.com/article/19/9/introduction-markdown
[11]: https://asciidoc.org/
[12]: https://github.com/wildfly/wildfly/tree/master/docs
[13]: https://groups.google.com/g/wildfly
[14]: https://wildfly.zulipchat.com/#recent_topics
[15]: https://www.wildfly.org/news/
