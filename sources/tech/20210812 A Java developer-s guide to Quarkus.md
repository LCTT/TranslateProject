[#]: subject: "A Java developer's guide to Quarkus"
[#]: via: "https://opensource.com/article/21/8/java-quarkus-ebook"
[#]: author: "Daniel Oh https://opensource.com/users/daniel-oh"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A Java developer's guide to Quarkus
======
A new eBook demonstrates how developers can keep using the Java
framework to build new serverless functions.
![Coffee beans and a cup of coffee][1]

[Serverless][2] architecture has already become an efficient solution to align overprovisioning and underprovisioning resources (e.g., CPU, memory, disk, networking) with actual workloads regardless of physical servers, virtual machines, and cloud environments. Yet, there is a concern for Java developers when choosing new programming languages to develop serverless applications. The Java framework seems too heavyweight and slow for serverless deployment on the cloud, especially [Kubernetes][3].

What if you, Java developer, could keep using the Java framework to build traditional cloud-native microservices as well as new serverless functions at the same time? This approach should be exciting since you don’t have to worry about a steep learning curve for new serverless application frameworks.

Furthermore, what if the Java framework could not only provide developers the joy of familiar technologies but also optimize Java serverless functions in Kubernetes by milliseconds at startup and offer tiny memory footprints?

### What is Quarkus?

[Quarkus][4] is the new Java framework that can provide these features and benefits to Java developers, enterprise architects, and DevOps engineers. It aims to design serverless applications and write cloud-native microservices for running on cloud infrastructures (for example, Kubernetes).

Quarkus also supports a portable Java API extension named [Funqy][5] for developers to write and deploy serverless functions to heterogeneous serverless runtimes.

Quarkus Funqy enables developers to bind [CloudEvents][6] for handling reactive streams with serverless functions on the Knative environment. This is beneficial for developers building a common messaging format to describe events and increase interoperability among multi- and hybrid cloud platforms.

Start your journey with Quarkus with the help of my new eBook, [**A guide to Java serverless functions**][7]. Share your Quarkus experiences with others so everyone can enjoy serverless development with Java and Quarkus.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/java-quarkus-ebook

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://opensource.com/article/21/1/devapps-strategies
[3]: https://opensource.com/article/19/6/reasons-kubernetes
[4]: https://quarkus.io/
[5]: https://quarkus.io/guides/funqy
[6]: https://cloudevents.io/
[7]: https://opensource.com/downloads/java-serverless-ebook
