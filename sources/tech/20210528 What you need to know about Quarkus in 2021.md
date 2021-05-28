[#]: subject: (What you need to know about Quarkus in 2021)
[#]: via: (https://opensource.com/article/21/5/quarkus)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What you need to know about Quarkus in 2021
======
Quarkus benefits from 20 years of Java history to make developing
applications faster and easier.
![Tools in a cloud][1]

Part of publishing services on the cloud is providing users and developers easy access to those services through easy and reliable means. One of the most popular methods of interfacing with applications online is through an application programming interface (API), a fancy term that means you allow users to interact with your app through code.

The API concept is significant because it helps others build upon your app. Suppose you design a website that returns a random number when a user clicks a button. Normally, that would require a user to navigate to your site and click a button. The site might be useful, but only to a point. If you included an API, a user could just send a signal to your server requesting a random number, or they could program something of their own that "calls" your server for a number with no clicking or manual interaction required. A developer could use your random number as a value for a game or as part of a passphrase generator or whatever else developers need random numbers for (there's always something). A good API unlocks your application for others to use your code's results, transforming your work on the web into, essentially, a software library.

### What is Quarkus?

[Quarkus][2] is a Kubernetes Native Java stack designed for serverless application delivery. Compared to Java, which is 20 years old, [Quarkus is relatively young][3] but benefits from those two decades of development to produce, in the project's terms, "Supersonic Subatomic Java." Probably nobody knows exactly what that phrase means, but you can certainly get a feel for what Quarkus can mean to your development life just by using it for an afternoon.

Quarkus lets you develop applications with a useful API with little to no configuration and without worrying about bootstrapping a complex environment. You don't have to learn everything there is to know about the cloud or about edge computing to learn and excel at Quarkus. Getting to know Quarkus makes your development faster, and it helps you produce flexible applications for the modern computer network.

Here are some of our recent articles covering Quarkus.

### Getting started with Quarkus

In Saumya Singh's _[How to create your first Quarkus application][4]_, you learn about the benefits of Quarkus and serverless delivery and create a simple demo application in about 10 minutes. In fact, _under_ 10 minutes is more accurate because between Maven and Quarkus, there's not nearly as much setup as you might expect. It barely feels like Java (I mean that in the bad way), but it feels so much like Java (and I mean that in the good way.)

### Edge development

Linux is a popular platform for creating Internet of Things (IoT) [edge applications][5]. There are many reasons for this, including security, the wide choices for programming languages and development models, and protocol support. Unsurprisingly, Quarkus handles IoT really well. Quarkus is efficient with memory, is quick to launch, and uses a fast runtime, so it's not just a viable solution for IoT; it's ideal. You can get started with Quarkus and the Internet of Things with Daniel Oh's _[Getting started with edge development on Linux using open source][6]_.

### Quarkus and VS Code

An integrated development environment (IDE) makes all the difference when you're working on code. Microsoft's open source [VS Code][7] (or the non-branded [VSCodium][8]) is a popular text editor disguised as an IDE (or is it an IDE disguised as a text editor?) with lots of extensions that can make it into a specialized environment for nearly any programming language. If you're using, or considering using, VS Code, then read Daniel Oh's walkthrough for using [Quarkus in VS Code][9] for some pro tips on how Maven, Quarkus, and VS Code work together.

### Get Quarkus

Developing with Quarkus makes setting up your environment as easy as Python, but it provides you with the power of the Java language and its many, many libraries. It's a great entry point to the cloud, [Knative][10], and edge computing. Get Quarkus and get coding.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/quarkus

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT (Tools in a cloud)
[2]: https://quarkus.io
[3]: https://developers.redhat.com/blog/2019/03/07/quarkus-next-generation-kubernetes-native-java-framework/
[4]: https://opensource.com/article/21/4/quarkus-tutorial
[5]: https://opensource.com/article/17/9/what-edge-computing
[6]: https://opensource.com/article/21/5/edge-quarkus-linux
[7]: https://github.com/microsoft/vscode
[8]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[9]: https://opensource.com/article/20/4/java-quarkus-vs-code
[10]: https://www.openshift.com/learn/topics/quarkus
