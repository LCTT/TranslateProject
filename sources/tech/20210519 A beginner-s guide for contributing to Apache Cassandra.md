[#]: subject: (A beginner's guide for contributing to Apache Cassandra)
[#]: via: (https://opensource.com/article/21/5/apache-cassandra)
[#]: author: (Ekaterina Dimitrova https://opensource.com/users/edimitrova)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

A beginner's guide for contributing to Apache Cassandra
======
Start participating in an open source database project used to power
internet services worldwide.
![An intersection of pipes.][1]

[Apache Cassandra][2] is an open source NoSQL database trusted by thousands of companies around the globe for its scalability and high availability that does not compromise performance. Contributing to such a widely used distributed system may seem daunting, so this article aims to provide you an easy entry point.

There are good reasons to contribute to Cassandra, such as:

  * Gaining recognition with the Apache Software Foundation (ASF) as a contributor
  * Contributing to an open source project used by millions of people worldwide that powers internet services for companies such as American Express, Bloomberg, Netflix, Yelp, and more
  * Being part of a community adding new features and building on the release of Cassandra 4.0, our most stable in the project's history



### How to get started

Apache Cassandra is a big project, which means you will find something within your skillset to contribute to. Every contribution, regardless of how small, counts and is greatly appreciated. An excellent place to start is the [Getting Started guide][3].

The Apache Cassandra project also participates in Google Summer of Code. For an idea of what's involved, please read this [blog post][4] by PMC member Paolo Motta.

### Choose what to work on

Submitted patches can include bug fixes, changes to the Java codebase, improvements for tooling (Java or Python), documentation, testing, or any other changes to the codebase. Although the process of contributing code is always the same, the amount of work and time it takes to get a patch accepted depends on the kind of issue you're addressing.

Reviewing other people's patches is always appreciated. To learn more, read the [Review Checklist][5]. If you are a Cassandra user and can help by responding to some of the questions on the user list, that makes an excellent contribution.

The simplest way to find a ticket to work on is to search Cassandra's Jira for issues marked as [Low-Hanging Fruit][6]. We use this label to flag issues that are good starter tasks for beginners. If you don't have a login to ASF's Jira, you'll need to [sign up][7].

A few easy ways to start getting involved include:

  * **Testing:** By learning about Cassandra, you can add or improve tests, such as [CASSANDRA-16191][8]. You can learn more about the Cassandra test framework on our [Testing][9] page. Additional testing and Jira-reported bugs or suggestions for improvements are always welcome.
  * **Documentation:** This isn't always low-hanging fruit, but it's very important. Here's a sample ticket: [CASSANDRA-16122][10]. You can find more information on contributing to the Cassandra documentation on our [Working on documentation][11] page.
  * **Investigate or fix reported bugs:** Here's an example: [CASSANDRA-16151][12].
  * **Answer questions:** Subscribe to the user mailing list, look out for questions you know the answer to, and help others by replying. See the [Community][13] page for details on how to subscribe to the mailing list.



These are just four ways to start helping the project. If you want to learn more about distributed systems and contribute in other ways, check the [documentation][11].

### What you need to contribute code

To make code contributions, you will need:

  * Java SDK
  * Apache Ant
  * Git
  * Python



#### Get the code and test

Get the code with Git, work on the topic, use your preferred IDE, and follow the [Cassandra coding style][14]. You can learn more on our [Building and IDE integration][15] page.


```
`$ git clone https://git-wip-us.apache.org/repos/asf/cassandra.git cassandra-trunk`
```

Many contributors name their branches based on ticket number and Cassandra version. For example:


```
$ git checkout -b CASSANDRA-XXXX-V.V
$ ant
```

Test the environment:


```
`$ ant test`
```

### Testing a distributed database

When you are done, please, make sure all tests (including your own) pass using Ant, as described in [Testing][9]. If you suspect a test failure is unrelated to your change, it may be useful to check the test's status by searching the issue tracker or looking at [CI][16] results for the relevant upstream version.

The full test suites take many hours to complete, so it is common to run relevant tests locally before uploading a patch. Once a patch has been uploaded, the reviewer or committer can help set up CI jobs to run the complete test suites.

Additional resources on testing Cassandra include:

  * The [Cassandra Distributed Tests][17] repository. You can find setup information and prerequisites in the README file.
  * The [Cassandra Cluster Manager][18] README
  * A great blog post from the community on [approaches to testing Cassandra 4.0][19]
  * [Harry][20], a fuzz testing tool for Apache Cassandra.



### Submitting your patch

Before submitting a patch, please verify that you follow Cassandra's [Code Style][21] conventions. The easiest way to submit your patch is to fork the Cassandra repository on GitHub and push your branch:


```
`$ git push --set-upstream origin CASSANDRA-XXXX-V.V`
```

Submit your patch by publishing the link to your newly created branch in your Jira ticket. Use the **Submit Patch** button.

To learn more, read the complete docs on [Contributing to Cassandra][22]. If you still have questions, get in touch with the [developer community][23].

* * *

_The author wants to thank the Apache Cassandra community for their tireless contributions to the project, dedication to the project users, and continuous efforts in improving the process of onboarding new contributors._

_The contributions and dedication of many individuals to the Apache Cassandra project and community have enabled us to reach 4.0—a significant milestone. As we look to the future and seek to encourage new contributors, we want to recognize everyone's efforts since its inception over 12 years ago. It would not have been possible without your help. Thank you!_

You don't need to be a master coder to contribute to open source. Jade Wang shares 8 ways you can...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/apache-cassandra

作者：[Ekaterina Dimitrova][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/edimitrova
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://cassandra.apache.org/
[3]: https://cassandra.apache.org/doc/latest/development/gettingstarted.html
[4]: https://cassandra.apache.org/blog/2021/03/10/join_cassandra_gsoc_2021.html
[5]: https://cassandra.apache.org/doc/latest/development/how_to_review.html
[6]: https://issues.apache.org/jira/issues/?jql=project%20%3D%20CASSANDRA%20AND%20Complexity%20%3D%20%22Low%20Hanging%20Fruit%22%20and%20status%20!%3D%20resolved
[7]: https://issues.apache.org/jira/secure/Signup!default.jspa
[8]: https://issues.apache.org/jira/browse/CASSANDRA-16191?jql=project%20%3D%20CASSANDRA%20AND%20Complexity%20%3D%20%22Low%20Hanging%20Fruit%22%20and%20status%20!%3D%20resolved%20AND%20component%20%3D%20%22Test%2Fdtest%2Fjava%22
[9]: https://cassandra.apache.org/doc/latest/development/testing.html
[10]: https://issues.apache.org/jira/browse/CASSANDRA-16122?jql=project%20%3D%20CASSANDRA%20and%20status%20!%3D%20resolved%20AND%20component%20%3D%20%22Documentation%2FBlog%22
[11]: https://cassandra.apache.org/doc/latest/development/documentation.html
[12]: https://issues.apache.org/jira/browse/CASSANDRA-16151?jql=project%20%3D%20CASSANDRA%20AND%20Complexity%20%3D%20%22Low%20Hanging%20Fruit%22%20and%20status%20!%3D%20resolved%20AND%20component%20%3D%20Packaging
[13]: http://cassandra.apache.org/community/
[14]: https://cwiki.apache.org/confluence/display/CASSANDRA2/CodeStyle
[15]: https://cassandra.apache.org/doc/latest/development/ide.html
[16]: https://builds.apache.org/
[17]: https://github.com/apache/cassandra-dtest
[18]: https://github.com/riptano/ccm
[19]: https://cassandra.apache.org/blog/Testing-Apache-Cassandra-4.html
[20]: https://github.com/apache/cassandra-harry
[21]: https://cassandra.apache.org/doc/latest/development/code_style.html
[22]: https://cassandra.apache.org/doc/latest/development/index.html
[23]: https://cassandra.apache.org/community/
