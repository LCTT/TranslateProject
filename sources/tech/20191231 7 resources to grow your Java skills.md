[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 resources to grow your Java skills)
[#]: via: (https://opensource.com/article/19/12/java-resources)
[#]: author: (Stephon Brown https://opensource.com/users/stephb)

7 resources to grow your Java skills
======
Java is still evolving and going strong decades after its launch. Catch
up with our hottest Java articles from 2019.
![Coffee beans and a cup of coffee][1]

Java is still one of the most influential programming languages today. It only recently dropped from #2 to the third most used [programming language on GitHub][2]. You may say usage is not everything, but Java also remains popular. According to [Stack Overflow's Developer Survey Results for 2019][3], Java is the fifth most popular programming language. It was first released to the public in 1998, and it stays high on the usage and popularity scale after all this time. A big reason for that fact is that Java has grown and evolved significantly since its release. As a strongly-typed language, Java continues to push the envelope of the object-oriented programming (OOP) paradigm and is continually used to implement new concepts and technologies.

Testifying to its ongoing popularity, Opensource.com publishes many excellent articles about the language. The following seven are Opensource.com's top read Java articles of 2019.

### What is an object in Java?

Chris Hermansen provides an in-depth look at the OOP paradigm and its importance to Java development in [_What is an object in Java?_][4] OOP is based on the idea that data and programs should all be viewed as "objects." Each object has properties and behaviors that describe how it is used in a program.

There are a number of principals that define OOP and its use of objects for all aspects of programming. These include:

  * **Inheritance:** This is the hierarchical use of objects for mutating and reusing object properties and behaviors from parent objects to child objects.
  * **Typing:** Static and strong typing express the idea that, at compile time, the type should be defined and constant unless explicitly converted or changed, which helps with both debugging and consistent functionality.
  * **Classes and primitives:** Objects natively implemented into OOP languages are called "primitives," including int, long, etc.; however, objects designed and implemented using class declarations and by assigning properties and behaviors to primitives are called classes.
  * **Object class:** In Java, the Object class is the parent class that all classes inherit from. It allows the use of basic functions and properties, including comparison and **hashCode** functionality.



Overall, objects are the basis of Java development, and Chris expounds upon them in his in-depth article.

### What is a Java constructor?

As a great follow-up to Chris Hermansen's overview of the Java object, I recommend reading [_What is a Java constructor?_][5] The constructor is an important concept to understand when working within the realms of OOP and Java, and Seth Kenlon introduces it in this easy-to-understand guide. The constructor in Java (and most OOP languages) is where you instantiate or create an instance of an object you have defined. In many languages, an instance is created with the **new** keyword and the object you want to create. For example, **Dog fluffy = new Dog();** will create a new instance of **Dog**. Constructors can also set properties within the object you are instantiating; therefore, if you have an implementation for a constructor to set your object's size, height, and type, you can set those all from the constructor. By default, Java allows objects to be instantiated with the **new** keyword without having an explicit constructor defined and creates them at compilation time.

### Initializing arrays in Java

An array is a longstanding data structure that originates in early math concepts. In computer science, as Chris Hermansen says in [_Initializing arrays in Java_][6], it represents "…a contiguous block of memory where each location is a certain type," which can be any type—from primitives (int, long, etc.) to custom objects (Dog, Cat, Car). An array is initialized with a specific type of constructor that reserves the fixed length of the array; in other words, it is a defined amount of memory that the array is reserving. It looks like this: **int[] a = new int[15]**. Much like instantiating a new object, arrays are similar in form and functions. In addition, because arrays inherit from the Object class, they can utilize methods and properties associated with the Object class, including **GetClass()**.

In addition to simple arrays, Java implements **ArrayLists** and **Map** objects by default. Both of these collection types allow elements to be added or removed dynamically; there is no need to set the size of each manually. The ArrayList allows the addition, retrieval, and removal of elements dynamically as your code runs. These lists must be of one type, which is defined when it is instantiated. The Map allows a dictionary object to be created, which means each index, or "key," is connected to another object. For example, **Map&lt;string, Integer&gt; scores = new Map&lt;String, Integer&gt;()** would allow you to insert a student's score, with the key being their name, with **scores.put("Stephon", 50)**. Arrays, ArrayLists, and Maps are excellent ways to store, retrieve, and manipulate data within your Java application.

### Getting started with blockchain for Java developers

Blockchain is an amalgamation of cryptography, computer science, cryptocurrency, and many other fields. It is the technology at the heart of Bitcoin and other cryptocurrencies, but it can stand alone and is powerful when implemented with other concepts. As Bilgin Ibrayam writes in [_Getting started with blockchain for Java developers_][7], "the technologies most people know, such as Java, .NET, and relational databases, are not common in the blockchain space; instead, blockchain is primarily dominated by C, Go, and Rust on the server side, and JavaScript on the client side." However, this should not deter you from using Java for developing blockchain projects, and Ibrayam provides seven Java-based open source technologies that leverage the Java language and the Java Virtual Machine (JVM) for blockchain development.

The seven technologies he presents are: Corda, a business-focused, blockchain technology that focuses on building smart contracts to process and streamline business transactions on the chain; Hyperledger's Pantheon (or Besu), an Ethereum client that enables use of private and public networks and was created to introduce Java developers to blockchain development; Bitcoinj, a Java implementation of the Bitcoin protocol that allows the use of a wallet and transactions without Bitcoin Core; Web3j, a lightweight Ethereum client that has implementations for both Android and Java for smart contract development; Hyperledger Fabric SDK, a complete solution for building and providing security for a localized or distributed blockchain; FundRequest, a decentralized platform/marketplace that enables requesting open source work and is completely implemented in Java on top of the Ethereum network; and Eventeum, which allows monitoring of the Ethereum network and storage of events and their details on a messaging server like Kafka or RabbitMQ.

### 7 Java tips for new developers

When learning a new language, there are always obstacles, whether they be syntactical differences or entire development paradigm shifts. Seth Kenlon provides [_7 Java tips for new developers_][8], focusing on what to look for when diving into Java programming. Installing Java and the Java Development Kit (JDK) are the first steps to developing in Java. Most computers may already have Java and JVM installed, but you will need JDK to begin programming.

In brief, Seth's tips are:

  * Most other languages allow importing and exporting libraries or other code that you may require when developing a project. Java packages are external or internal libraries that need to be managed. The packages are separated and organized by namespaces, which are like buckets for organizing code.
  * Packages are imported with the simple syntax of **import** with the library's namespace.
  * Declaring a class allows you to create an object in your program. These classes can use different access modifiers; within the classes are properties and methods or functions that also can have access modifiers that define whether they can be used only inside of the class, outside of the class with inherited classes, or by any other class.
  * The class modifier **Static** allows the use of properties or functions without having to instantiate or create an instance of an object.
  * Code will eventually have bugs; it is inevitable. "Try and catch" flow control allows you to catch errors and exceptions and implement recovery and logging mechanisms.
  * To run a Java application outside an integrated development environment (IDE), such as Netbeans or Eclipse, navigate to your Java project folders from the command line and type **java &lt;filename.java&gt;** or, if the application is already compiled into a .jar file, **java -jar &lt;filename.jar&gt;**.



### Using the Java Persistence API

[_Using the Java Persistence API_][9] (JPA) is my introduction to connecting Java to various data persistence solutions, whether they be relational, NoSQL, or basic file representations in a system. Java provides a broad interface that allows connection to generally any type of persistence solution. This tutorial walks through creating an application with common libraries, including Spring Boot, a module/template for quickly configuring applications in Java; Maven, a package manager for Java; Lombok, a library that simplifies defining object accessors/mutators; and Netbeans, a popular IDE for developing in Java.

The tutorial uses these libraries to create models for a fictitious bike shop's database. The models' accessors/mutators are defined with Lombok and provide data annotations that are used when persisting to the chosen database. Then the database is set up and configured through the **application.properties** file, which the JPA reads to connect and persist data. The persisting and fetching implementation is done mostly with the Spring framework for Mongo; however, you can also override functions for more control of what should be fetched when finding, updating, or persisting objects. In a matter of minutes, you will be able to define objects and call basic functions on local databases without much boilerplate.

### How to compare strings in Java

Flexibility is often considered a gift, and while there are tradeoffs between statically typed and dynamically typed languages, one of Java's strengths is its ability to compare types and equality of types. In fact, Girish Managoli explains in [_How to compare strings in Java_][10], there six different ways to compare the immutable string type in Java.

The double-equal operator (**==**) compares memory location rather than string content. When the compiler sees two strings that are equal, it will allocate the same memory for both. If a new string is instantiated, it will not share the same memory location or object reference.

The **equals** method compares the case-sensitive content of the string, not the object information. For example, if you use **equals** to compare **Dog** and **Dog**, the result would be true, even if they are two different objects; however, **dog** and **Dog** would be false because the function is case-sensitive. The **equalsIgnoreCase** function is the same as **equals**, except that it removes case-sensitivity; therefore, comparing **dog** and **Dog** would be true. The **compareTo** and **compareToIgnoreCase** functions compare strings based on the Unicode value of each character in the string; they compare the total value to the other string and return the total lexical value difference between the two (with case-sensitivity and case-insensitivity, respectively). Last but not least, the **Objects equals** function allows the comparison of two string object references and of null values.

### Java: Still growing and evolving

Java is still going strong, evolving, and staying relevant after all this time, and there is continued optimism in its growth. Since its release, the Java platform has continued to change with the times, from OpenJDK to release schedule changes, and push the envelope of what you can accomplish with it.

As you can see from the top Java articles on Opensource.com in 2019, it never hurts to know the language, because you never know where you can use it for your next project. These (and other) Opensource.com articles have been really helpful to me as a [new developer transitioning from higher education][11]. I look forward to reading and sharing more in 2020, and I hope you'll join me.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/java-resources

作者：[Stephon Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stephb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://octoverse.github.com/#top-languages
[3]: https://insights.stackoverflow.com/survey/2019
[4]: https://opensource.com/article/19/8/what-object-java
[5]: https://opensource.com/article/19/6/what-java-constructor
[6]: https://opensource.com/article/19/10/initializing-arrays-java
[7]: https://opensource.com/article/19/4/blockchain-java-developers
[8]: https://opensource.com/article/19/10/java-basics
[9]: https://opensource.com/article/19/10/using-java-persistence-api
[10]: https://opensource.com/article/19/9/compare-strings-java
[11]: https://opensource.com/article/19/6/5-transferable-higher-education-skills
