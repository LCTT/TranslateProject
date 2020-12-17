[#]: collector: (lujun9972)
[#]: translator: (zhangxiangping)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The state of the art of microservices in 2020)
[#]: via: (https://www.linux.com/news/the-state-of-the-art-of-microservices-in-2020/)
[#]: author: (Linux.com Editorial Staff https://www.linux.com/author/linuxdotcom/)

The state of the art of microservices in 2020
======

### _“The microservice architectural style is an approach to developing a_ _**single application**_ _as a suite of_ _**small services**_*, each running in its* _**own process and communicating with lightweight mechanisms**_*, often an HTTP resource API. These services are* _**built around business capabilities**_ _and_ _**independently deployable**_ _by_ _**fully automated deployment machinery**_*. There is a bare minimum of centralized management of these services, which may be written in* _**different programming languages**_ _and_ _**use different data storage technologies.**__“_

### James Lewis and Martin Fowler (2014) [6]

## Introduction

It is expected that in 2020, the global cloud microservices market will grow at a rate of 22.5%, with the US market projected to maintain a growth rate of 27.4% [5]. The tendency is that developers will move away from locally hosted applications and shift into the cloud. Consequently, this will help businesses minimize downtime, optimize resources, and reduce infrastructure costs. Experts also predict that by 2022, 90% of all applications will be developed using microservices architecture [5]. This article will help you to learn what microservices are and how companies have been using it nowadays. 

## What are microservices?

Microservices have been widely used around the world. But what are microservices? Microservice is an architectural pattern in which the application is based on many small interconnected services. They are based on the **single responsibility principle**, which according to Robert C. Martin is “gathering things that change for the same reason, and separate those things that change for different reasons” [2]. The microservices architecture is also extended to the **loosely coupled services** that can be **developed, deployed, and maintained independently** [2]. 

## Moving away from monolithic architectures

Microservices are often compared to traditional monolithic software architecture. In a monolithic architecture, a software is designed to be self-contained, i.e., the program’s components are interconnected and interdependent rather than loosely coupled. In a tightly-coupled architecture (monolithic), each component and its associated components must be present in order for the code to be executed or compiled [7]. Additionally, if any component needs to be updated, the whole application needs to be rewritten.

That’s not the case for applications using the microservices architecture. Since each module is independent, it can be changed without affecting other parts of the program. Consequently, reducing the risk that a change made to one component will create unanticipated changes in other components. 

Companies might run in trouble if they cannot scale a monolithic architecture if their architecture is difficult to upgrade or the maintenance is too complex and costly [4]. Breaking down a complex task into smaller components that work independently from each other is the solution to this problem.

![Monolithic vs. microservices architecture. Image extracted from \[3\].][1]

## How developers around the world build their microservices

Microservices are well known for improving _scalability_ and _performance_. However, are those the main reasons that developers around the world build their microservices? The State of Microservices 2020 research project [1] has found out how developers worldwide build their microservices and what they think about it. The report was created with the help of 660 microservice experts from Europe, North America, Central and South America, the Middle East, South-East Asia, Australia, and New Zealand. The table below presents the average rating on questions related to the maturity of microservices [1]. 

**Category** | **Average rating (out of 5)**
---|---
Setting up a new project | 3.8
Maintenance and debugging | 3.4
Efficiency of work | 3.9
Solving scalability issues | 4.3
Solving performance issues | 3.9
Teamwork | 3.9

 

As observed on the table, most experts are happy with microservices for solving scalability issues. On the contrary, maintenance and debugging seem to be a challenge for them.

According to their architecture’s leading technologies, most experts reported that they use Javascript/Typescript (almost ⅔ of microservices are built on those languages). In the second place, they mostly use Java.

Although there are plenty of options to choose to deploy microservices, most experts use Amazon Web Services (49%), followed by their own server. Additionally, 62% prefer AWS Lambda as a serverless solution.

Most microservices used by the experts use HTTP for communication, followed by events and gRPC. Additionally, most experts use RabbitMQ for message-brokers, followed by Kafka and Redis.

Also, most people work with microservices continuous integration (CI). In the report, 87% of the respondents use CI solutions such as GitLab CI, Jenkins, or GitHub Actions.

The most popular debugging solution among 86% of the respondents was logging, in which 27% of the respondents ONLY use logs. 

Finally, most people think that microservice architecture will become either a standard for more complex systems or backend development.

## Successful use cases of Microservices

Many companies have changed from a monolithic architecture to microservices. 

### Amazon

In 2001, development delays, coding challenges, and service interdependencies didn’t allow Amazon to address its growing user base’s scalability requirements. With the need to refactor their monolithic architecture from scratch, Amazon broke its monolithic applications into small, independent, and service-specific applications [3][9].

In 2001, Amazon decided to change to microservices, which was years before the term came into fashion. This change led Amazon to develop several solutions to support microservices architectures, such as Amazon AWS. With the rapid growth and adaptation to microservices, Amazon became the most valuable company globally, valued by market cap at $1.433 trillion on July 1st, 2020 [8].

### Netflix

Netflix started its movie-streaming service in 2007, and by 2008 it was suffering scaling challenges. They experienced a major database corruption, and for three days, they could not ship DVDs to their members [10]. This was the starting point when they realized the need to move away from single points of failure (e.g., relational databases) towards a more scalable and reliable distributed system in the cloud. In 2009, Netflix started to refactor its monolithic architecture into microservices. They began by migrating its non-customer-facing, movie-coding platform to run on the cloud as an independent microservices [11]. Changing to microservices allowed Netflix to overcome its scaling challenges and service outages. Despite that, it allowed them to reduce costs by having cloud costs per streaming instead of costs with a data center [10]. Today, Netflix streams approximately 250 million hours of content daily to over 139 million subscribers in 190 countries [11].

### Uber

After launching Uber, they struggled to develop and launch new features, fix bugs, and rapidly integrate new changes. Thus, they decided to change to microservices, and they broke the application structure into cloud-based microservices. In other words, Uber created one microservice for each function, such as passenger management and trip management. Moving to microservices brought Uber many benefits, such as having a clear idea of each service ownership. This boosted speed and quality, facilitating fast scaling by allowing teams to focus only on the services they needed to scale, updating virtual services without disrupting other services, and achieving more reliable fault tolerance [11].

## It’s all about scalability!

A good example of how to provide scalability is by looking at China. With its vast number of inhabitants, China had to adapt by creating and testing new solutions to solve new challenges at scale. Statistics show that China serves roughly 900 million Internet users nowadays [14]. During the 2019 Single’s Day (the equivalent of Black Friday in China), the peak transaction of Alibaba’s various shopping platforms was 544,00 transactions per second. The total amount of data processed on Alibaba Cloud was around 970 petabytes [15]. So, what’s the implication of these numbers of users in technology?

Many technologies have emerged from the need to address scalability. For example, [Tars][2] was created in 2008 by Tencent and [contributed to the Linux Foundation in 2018][3]. It’s being used at scale and enhanced for ten years [12]. Tars is open source, and many organizations are significantly contributing and extending the framework’s features and value [12]. Tars supports multiple programming languages, including C++, Golang, Java, Node.js, PHP, and Python; and it can quickly build systems and automatically generate code, allowing the developer to focus on the business logic to improve operational efficiency effectively. Tars has been widely used in Tencent’s QQ, WeChat social network, financial services, edge computing, automotive, video, online games, maps, application market, security, and many other core businesses. [In March of 2020, the Tars project transitioned into the TARS Foundation][4], an open source microservice foundation to support the rapid growth of contributions and membership for a community focused on building an open microservices platform [12].

**Be sure to check out the Linux Foundation’s new free training course,** [Building Microservice Platforms with TARS][5]

*About the authors: *

_Isabella Ferreira is an Advocate at TARS Foundation,_ a cloud-native open-source microservice foundation under the Linux Foundation*. *

*Mark Shan is Chairman at Tencent Open Source Alliance and also Board Chair at TARS Foundation. *

**References:**

[1] <https://tsh.io/state-of-microservices/#ebook>

[2]<https://medium.com/hashmapinc/the-what-why-and-how-of-a-microservices-architecture-4179579423a9>

[3] <https://www.plutora.com/blog/understanding-microservices>

[4] <https://www.leanix.net/en/blog/a-brief-history-of-microservices>

[5] <https://www.charterglobal.com/five-microservices-trends-in-2020/>

[6] <https://martinfowler.com/articles/microservices.html#footnote-etymology>

[7] <https://whatis.techtarget.com/definition/monolithic-architecture>

[8] <https://ycharts.com/companies/AMZN/market_cap>

[9] <https://thenewstack.io/led-amazon-microservices-architecture/>

[10] <https://media.netflix.com/en/company-blog/completing-the-netflix-cloud-migration>

[11] <https://blog.dreamfactory.com/microservices-examples/>

[12] <https://www.linuxfoundation.org/blog/2020/03/the-tars-foundation-the-formation-of-a-microservices-ecosystem/>

[13] <https://medium.com/microservices-architecture/top-10-microservices-framework-for-2020-eefb5e66d1a2>

[14] <https://www.statista.com/statistics/265140/number-of-internet-users-in-china/>

[15] <https://interconnected.blog/china-scale-technology-sandbox/>

#### _This Linux Foundation Platinum Sponsor content was contributed by Tencent._

--------------------------------------------------------------------------------

via: https://www.linux.com/news/the-state-of-the-art-of-microservices-in-2020/

作者：[Linux.com Editorial Staff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/zxp93)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/linuxdotcom/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2020/11/microservices_diagram_a.png
[2]: https://tarscloud.org/foundation/index
[3]: https://www.linuxfoundation.org/press-release/2018/06/tars-and-tseer-form-open-source-project-communities-under-the-linux-foundation-to-expand-adoption-and-pace-of-development/
[4]: https://www.linuxfoundation.org/blog/2020/03/the-tars-foundation-the-formation-of-a-microservices-ecosystem/
[5]: https://www.edx.org/course/building-microservice-platforms-with-tars
