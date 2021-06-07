[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What makes Java open source?)
[#]: via: (https://opensource.com/article/20/8/open-source-java)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

What makes Java open source?
======
Clearing up the confusion about developing in Java while staying in the
open source ecosystem.
![Coffee beans][1]

If you're using [Java][2] to write business applications, you may know that Java Standard Edition (SE) is not open source software. It is not managed by a foundation, like Python or JavaScript, and in January 2019, Oracle changed its policy to require a commercial license for any use of SE, from the developer's local environment to production.

This change also raised a lot of questions in open source communities about licensing compliance and Java usage. If you're still confused, this article will guide you through how these changes apply to Java developers.

### Evolving platforms in the Java community

[OpenJDK][3] (Open Java Development Kit) is a free and open source implementation of Java SE. It is an alternative that allows more than 70% of Java developers to continue stabilizing their Java application environments while remaining within the open source ecosystem. OpenJDK is primarily licensed under the [GNU GPLv2][4]. The freedoms guaranteed by this distribution strategy have made OpenJDK the default choice for Java developers to build desktop applications that are compatible with Java SE.

Oracle continued developing and maintaining Enterprise Java (Java EE), which is built on the Java SE platform. Java EE includes additional features outside SE's scope to support large-scale, scalable, multi-tier, and secured applications for a variety of enterprise environments. In September 2017, the Java EE platform was transferred to the [Eclipse Foundation][5], leading to the adoption of more agile processes, changing the governance process, and implementing more flexible licensing. One year later, in 2018, the Eclipse Foundation announced a new brand name, [Jakarta EE][6], with a new logo and working groups to support developers transitioning from Java EE to the new platform. The evolution from Java EE to Jakarta EE also impacted many enterprise Java developers in implementing new business logic.

### Evolving frameworks as Java evolved

In the meantime, new technologies, such as RESTful APIs (2000), HTTP 2 (2015), and JSON (2017), were being developed alongside fast-changing web architectures. Interest in microservices architectures was growing, but because Java EE was in transition, it did not pick up on these new paradigms as they happened.

In response, the broader Java community and several vendors (IBM, Red Hat, and Tomitribe) created [MicroProfile][7] in 2016 to optimize the Enterprise Java platform for microservices architectures. MicroProfile [later joined the Eclipse Foundation][8], giving enterprise Java developers two options for implementing microservice architectures: SpringBoot or MicroProfile. MicroProfile allows developers to create portable Java-based microservices across vendor solutions while ensuring compatibility between matching Java/Jakarta EE and MicroProfile APIs in the same application.

If you are interested in Enterprise Java development, [MicroProfile Starter][9] is a great resource to explore microservices in practice. MicroProfile Starter's graphical user interface requires a few details to generate code to create a monolithic Java application server.

A MicroProfile runtime supports deploying an application artifact (e.g., a JAR or WAR file) and executing it as a Java application server with a MicroProfile specification. You can choose the cloud-native runtime you prefer (e.g., [Quarkus][10]) from MicroProfle Starter's runtime list, then select specifications to gain additional enterprise features, such as fault tolerance, OpenAPI, OpenTracing, and more. Once you've completed these steps, click on "Download" to begin developing your application.

![MicroProfile Starter GUI][11]

(Daniel Oh, [CC BY-SA 4.0][12])

### Conclusion

Navigating Java from an open source perspective can be a bit confusing given the language's long history, acquisitions, and relicenses. Sticking with OpenJDK and Jakarta EE allows Java developers to maintain standard enterprise applications without compromising open source freedoms. If you want to dive in further, take a look at MicroProfile or delve deeper into runtimes by exploring Quarkus.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/open-source-java

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-beans.jpg?itok=3hkjX5We (Coffee beans)
[2]: https://opensource.com/resources/java
[3]: https://openjdk.java.net/
[4]: https://openjdk.java.net/legal/gplv2+ce.html
[5]: https://www.eclipse.org/org/
[6]: https://opensource.com/article/18/5/jakarta-ee
[7]: https://microprofile.io/
[8]: https://opensource.com/article/18/1/eclipse-microprofile
[9]: https://start.microprofile.io/
[10]: https://quarkus.io/
[11]: https://opensource.com/sites/default/files/uploads/microprofile.png (MicroProfile Starter GUI)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
