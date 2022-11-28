[#]: subject: (How to create your first Quarkus application)
[#]: via: (https://opensource.com/article/21/4/quarkus-tutorial)
[#]: author: (Saumya Singh https://opensource.com/users/saumyasingh)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to create your first Quarkus application
======
The Quarkus framework is considered the rising star for
Kubernetes-native Java.
![woman on laptop sitting at the window][1]

Programming languages and frameworks continuously evolve to help developers who want to develop and deploy applications with even faster speeds, better performance, and lower footprint. Engineers push themselves to develop the "next big thing" to satisfy developers' demands for faster deployments.

[Quarkus][2] is the latest addition to the Java world and considered the rising star for Kubernetes-native Java. It came into the picture in 2019 to optimize Java and commonly used open source frameworks for cloud-native environments. With the Quarkus framework, you can easily go serverless with Java. This article explains why this open source framework is grabbing lots of attention these days and how to create your first Quarkus app.

## What is Quarkus?

Quarkus reimagines the Java stack to give the performance characteristics and developer experience needed to create efficient, high-speed applications. It is a container-first and cloud-native framework for writing Java apps.

You can use your existing skills to code in new ways with Quarkus. It also helps reduce the technical burden in moving to a Kubernetes-centric environment. High-density deployment platforms like Kubernetes need apps with a faster boot time and lower memory usage. Java is still a popular language for developing software but suffers from its focus on productivity at the cost of RAM and CPU.

In the world of virtualization, serverless, and cloud, many developers find Java is not the best fit for developing cloud-native apps. However, the introduction of Quarkus (also known as "Supersonic and Subatomic Java") helps to resolve these issues.

## What are the benefits of Quarkus?

![Quarkus benefits][3]

(Saumya Singh, [CC BY-SA 4.0][4])

Quarkus improves start-up times, execution costs, and productivity. Its main objective is to reduce applications' startup time and memory footprint while providing "developer joy." It fulfills these objectives with native compilation and hot reload features.

### Runtime benefits

![How Quarkus uses memory][5]

(Saumya Singh, [CC BY-SA 4.0][4])

  * Lowers memory footprint
  * Reduces RSS memory, using 10% of the memory needed for a traditional cloud-native stack
  * Offers very fast startup
  * Provides a container-first framework, as it is designed to run in a container + Kubernetes environment.
  * Focuses heavily on making things work in Kubernetes



### Development benefits

![Developers love Quarkus][6]

(Saumya Singh, [CC BY-SA 4.0][4])

  * Provides very fast, live reload during development and coding
  * Uses "best of breed" libraries and standards
  * Brings specifications and great support
  * Unifies and supports imperative and reactive (non-blocking) styles



## Create a Quarkus application in 10 minutes

Now that you have an idea about why you may want to try Quarkus, I'll show you how to use it.

First, ensure you have the prerequisites for creating a Quarkus application

  * An IDE like Eclipse, IntelliJ IDEA, VS Code, or Vim
  * JDK 8 or 11+ installed with JAVA_HOME configured correctly
  * Apache Maven 3.6.2+



You can create a project with either a Maven command or by using code.quarkus.io.

### Use a Maven command:

One of the easiest ways to create a new Quarkus project is to open a terminal and run the following commands, as outlined in the [getting started guide][7]. 

**Linux and macOS users:**


```
mvn io.quarkus:quarkus-maven-plugin:1.13.2.Final:create \
    -DprojectGroupId=org.acme \
    -DprojectArtifactId=getting-started \
    -DclassName="org.acme.getting.started.GreetingResource" \
    -Dpath="/hello"
cd getting-started
```

**Windows users:**

  * If you are using `cmd`, don't use the backward slash (`\`): [code]`mvn io.quarkus:quarkus-maven-plugin:1.13.2.Final:create -DprojectGroupId=org.acme -DprojectArtifactId=getting-started -DclassName="org.acme.getting.started.GreetingResource" -Dpath="/hello"`
```
* If you are using PowerShell, wrap `-D` parameters in double-quotes:
```
`mvn io.quarkus:quarkus-maven-plugin:1.13.2.Final:create "