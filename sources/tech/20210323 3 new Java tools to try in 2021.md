[#]: subject: (3 new Java tools to try in 2021)
[#]: via: (https://opensource.com/article/21/3/enterprise-java-tools)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

3 new Java tools to try in 2021
======
Empower your enterprise Java applications and your career with these
three tools and frameworks.
![Person drinking a hot drink at the computer][1]

Despite the popularity of [Python][2], [Go][3], and [Node.js][4] for implementing [artificial intelligence][5] and machine learning applications and [serverless functions][6] on Kubernetes, Java technologies still play a key role in developing enterprise applications. According to [_Developer Economics_][7], in Q3 2020, there were 8 million enterprise Java developers worldwide.

Although the programming language has been around for more than 25 years, there are always new trends, tools, and frameworks in the Java world that can empower your applications and your career.

The vast majority of Java frameworks are designed for long-running processes with dynamic behaviors for running mutable application servers such as physical servers and virtual machines. Things have changed since Kubernetes containers were unleashed in 2014. The biggest issue with using Java applications on Kubernetes is with optimizing application performance by decreasing memory footprints, speeding start and response times, and reducing file sizes.

### 3 new Java frameworks and tools to consider

Java developers are also always looking for easier ways to integrate shiny new open source tools and projects into their Java applications and daily work. This significantly increases development productivity and motivates more enterprises and individual developers to keep using the Java stack.

When trying to meet the expectations listed above for the enterprise Java ecosystem, these three new Java frameworks and tools are worth your attention.

#### 1\. Quarkus

[Quarkus][8] is designed to develop cloud-native microservices and serverless with amazingly fast boot time, incredibly low resident set size (RSS) memory, and high-density memory utilization in container orchestration platforms like Kubernetes. According to JRebel's [9th annual global Java developer productivity report][9], the usage of Quarkus by Java developers rose 6% from less than 1%, and [Micronaut][10] and [Vert.x][11] grew to 4% and 2%, respectively, both up from roughly 1% last year.

#### 2\. Eclipse JKube

[Eclipse JKube][12] enables Java developers to build container images based on cloud-native Java applications using [Docker][13], [Jib][14], or [Source-To-Image][15] build strategies. It also generates Kubernetes and OpenShift manifests at compile time and improves developers' experience with debug, watch, and logging tools.

#### 3\. MicroProfile

[MicroProfile][16] solves the biggest problems related to optimizing enterprise Java for a microservices architecture without adopting new frameworks or refactoring entire applications. Furthermore, MicroProfile [specifications][17] (i.e., Health, Open Tracing, Open API, Fault Tolerance, Metrics, Config) continue to develop in alignment with [Jakarta EE][18] implementation.

### Conclusion

It's hard to say which Java frameworks or tools are the best choices for enterprise Java developers to implement. As long as there is room for improvement in the Java stack and accelerating enterprise businesses, we can expect new frameworks, tools, and platforms, like the three above, to become available. Spend some time looking at them to see if they can improve your enterprise Java applications in 2021.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/enterprise-java-tools

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/18/11/learning-golang
[4]: https://opensource.com/article/18/7/node-js-interactive-cli
[5]: https://opensource.com/article/18/12/how-get-started-ai
[6]: https://opensource.com/article/19/4/enabling-serverless-kubernetes
[7]: https://developereconomics.com/
[8]: https://quarkus.io/
[9]: https://www.jrebel.com/resources/java-developer-productivity-report-2021
[10]: https://micronaut.io/
[11]: https://vertx.io/
[12]: https://www.eclipse.org/jkube/
[13]: https://opensource.com/resources/what-docker
[14]: https://github.com/GoogleContainerTools/jib
[15]: https://www.openshift.com/blog/create-s2i-builder-image
[16]: https://opensource.com/article/18/1/eclipse-microprofile
[17]: https://microprofile.io/
[18]: https://opensource.com/article/18/5/jakarta-ee
