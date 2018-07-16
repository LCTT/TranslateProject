Write fast apps with Pronghorn, a Java framework
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/Collaboration%20for%20health%20innovation.png?itok=s4O5EX2w)

In 1973, [Carl Hewitt][1] had an idea inspired by quantum mechanics. He wanted to develop computing machines that were capable of parallel execution of tasks, communicating with each other seamlessly while containing their own local memory and processors.

Born was the [actor model][2], and with that, a very simple concept: Everything is an actor. This allows for some great benefits: Separating business and other logic is made vastly easier. Security is easily gained because each core component of your application is separate and independent. Prototyping is accelerated due to the nature of actors and their interconnectivity.

### What is Pronghorn?

However, what ties it all together is the ability to pass messages between these actors concurrently. An actor responds based on an input message; it can then send back an acknowledgment, deliver content, and designate behaviors to be used for the next time a message gets received. For example, one actor is loading image files from disk while simultaneously streaming chunks to other actors for further processing; i.e., image analysis or conversion. Another actor then takes these as inputs and writes them back to disk or logs them to the terminal. Independently, these actors alone can’t accomplish much—but together, they form an application.

Today there are many implementations of this actor model. At [Object Computing][3], we’ve been working on a highly scalable, performant, and completely open source Java framework called [Pronghorn][4], named after one of the world’s fastest land animals.

Pronghorn, recently released to 1.0, attempts to address a few of the shortcomings of [Akka][5] and [RxJava][6], two popular actor frameworks for Java and Scala.

As a result, we developed Pronghorn with a comprehensive list of features in mind:

  1. We wanted to produce as little garbage as possible. Without the Garbage Collector kicking in regularly, it is able to reach performance levels never seen before.
  2. We wanted to make sure that Pronghorn has a minimal memory footprint and is mechanical-sympathetic. Built from the ground up with performance in mind, it leverages CPU prefetch functions and caches for fastest possible throughput. Using zero copy direct access, it loads fields from schemas in nanoseconds and never stall cores, while also being non-blocking and lock-free.
  3. Pronghorn ensures that you write correct code securely. Through its APIs and contracts, and by using "[software fortresses][7]" and industry-leading encryption, Pronghorn lets you build applications that are secure and that fail safely.
  4. Debugging and testing can be stressful and annoying, especially when you need to hit a deadline. Pronghorn easily integrates with common testing frameworks and simplifies refactoring and debugging through its automatically generated and live-updating telemetry graph, fuzz testing (in work) based on existing message schemas, and warnings when certain actors are misbehaving or consuming too many resources. This helps you rapidly prototype and spend more time focusing on your business needs.



For more details, visit the [Pronghorn Features list][8].

### Why Pronghorn?

Writing concurrent and performant applications has never been easy, and we don’t promise to solve the problems entirely. However, to give you an idea of the benefits of Pronghorn and the power of its API, we wrote a small HTTP REST server and benchmarked it against common industry standards such as [Node & Express][9] and [Tomcat][10] & [Spring Boot][11]:

![](https://opensource.com/sites/default/files/uploads/requests_per_second.png)

We encourage you to [run these numbers yourself][12], share your results, and add your own web server.

As you can see, Pronghorn does exceptionally well in this REST example. While almost being 10x faster than conventional solutions, Pronghorn could help cut server costs (such as EC2 or Azure) in half or more through its garbage-free, statically-typed backend. HTTP requests can be parsed, and responses are generated while actors are working concurrently. The scheduling and threading are automatically handled by Pronghorn's powerful default scheduler.

As mentioned above, Pronghorn allows you to rapidly prototype and envision your project, generally by following three basic steps:

  1. **Define your data flow graph**



This is a crucial first step. Pronghorn takes a data-first approach; processing large volumes of data rapidly. In your application, think about the type of data that should flow through the "pipes"—for example, if you’re building an image analysis tool, you will need actors to read, write, and analyze image files. The format of the data between actors needs also to be established; it could be schemas containing JPG MCUs or raw binary BMP files. Pick the format that works best for your application.

  2. **Define the contracts between each stage**



Contracts allow you to easily define your messages using [FAST][13], a proven protocol used by the finance industry for stock trading. These contracts are used in the testing phase to ensure implementation aligns with your message field definitions. This is a contractual approach; it must be respected for actors to communicate with each other.

  3. **Test first development by using generative testing as the graph is implemented**



Schemas are code-generated for you as you develop your application. Test-driven development allows for correct and safe code, saving valuable time as you head towards release. As your program grows, the graph grows as well, describing every single interaction between actors and illustrating your message data flow on pipes between stages. Through its automatically telemetry, you can easily keep track of even the most complex applications, as shown below:

![](https://opensource.com/sites/default/files/uploads/tracking_apps.png)

### What does it look like?

You may be curious about what Pronghorn code looks like. Below is some sample code for generating the message schemas in our "[Hello World][14]" example.

To define a message, create a new XML file similar to this:
```
<?xml version="1.0" encoding="UTF-8"?>
<templates xmlns="http://www.fixprotocol.org/ns/fast/td/1.1">
    <template name="HelloWorldMessage" id="1">
        <string name="GreetingName" id="100" charset="unicode"/>
    </template>
</templates>
```

This schema will then be used by the stages described in the Hello World example. Populating a graph in your application using this schema is even easier:
```
private static void populateGraph(GraphManager gm) {
       Pipe<HelloWorldSchema> messagePipe =
HelloWorldSchema.instance.newPipe(10, 10_000);
       new GreeterStage(gm, "Jon Snow", messagePipe);
       new GuestStage(gm, messagePipe);
  }
```

This uses the stages created in the [Hello World tutorial][14].

We use a [Maven][15] archetype to provide you with everything you need to start building Pronghorn applications.

### Start using Pronghorn

We hope this article has offered a taste of how Pronghorn can help you write performant, efficient, and secure applications in Java using Pronghorn, an alternative to Akka and RXJava. We’d love your feedback on how to make this an ideal platform for developers, managers, CFOs, and others.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/writing-applications-java-pronghorn

作者：[Tobi Schweiger][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tobischw
[1]:https://en.wikipedia.org/wiki/Carl_Hewitt
[2]:https://en.wikipedia.org/wiki/Actor_model
[3]:https://objectcomputing.com/
[4]:https://oci-pronghorn.gitbook.io/pronghorn/chapter-0-what-is-pronghorn/home
[5]:https://akka.io/
[6]:https://github.com/ReactiveX/RxJava
[7]:https://www.amazon.com/Software-Fortresses-Modeling-Enterprise-Architectures/dp/0321166086
[8]:https://oci-pronghorn.gitbook.io/pronghorn/chapter-0-what-is-pronghorn/features
[9]:https://expressjs.com/
[10]:http://tomcat.apache.org/
[11]:https://spring.io/projects/spring-boot
[12]:https://github.com/oci-pronghorn/GreenLoader
[13]:https://en.wikipedia.org/wiki/FAST_protocol
[14]:https://oci-pronghorn.gitbook.io/pronghorn/chapter-1-getting-started-with-pronghorn/1.-hello-world-introduction/0.-getting-started
[15]:https://maven.apache.org/
