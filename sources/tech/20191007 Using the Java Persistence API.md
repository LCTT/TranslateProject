[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using the Java Persistence API)
[#]: via: (https://opensource.com/article/19/10/using-java-persistence-api)
[#]: author: (Stephon Brown https://opensource.com/users/stephb)

Using the Java Persistence API
======
Learn how to use the JPA by building an example app for a bike store.
![Coffee beans][1]

The Java Persistence API (JPA) is an important Java functionality for application developers to understand. It translates exactly how Java developers turn method calls on objects into accessing, persisting, and managing data stored in NoSQL and relational databases.

This article examines the JPA in detail through a tutorial example of building a bicycle loaning service. This example will create a create, read, update, and delete (CRUD) layer for a larger application using the Spring Boot framework, the MongoDB database (which is [no longer open source][2]), and the Maven package manager. I also use NetBeans 11 as my IDE of choice.

This tutorial focuses on the open source angle of the Java Persistence API, rather than the tools, to show how it works. This is all about learning the pattern of programming applications, but it's still smart to understand the software. You can access the full code in my [GitHub repository][3].

### Java: More than 'beans'

Java is an object-oriented language that has gone through many changes since the Java Development Kit (JDK) was released in 1996. Understanding the language's various pathways and its virtual machine is a history lesson in itself; in brief, the language has forked in many directions, similar to the Linux kernel, since its release. There are standard editions that are free to the community, enterprise editions for business, and an open source alternatives contributed to by multiple vendors. Major versions are released at six-month intervals; since there are often major differences in features, you may want to do some research before choosing a version.

All and all, Java is steeped in history. This tutorial focuses on [JDK 11][4], which is the open source implementation of Java 11, because it is one of the long-term-support versions that is still active.

  * **Spring Boot: **Spring Boot is a module from the larger Spring framework developed by Pivotal. Spring is a very popular framework for working with Java. It allows for a variety of architectures and configurations. Spring also offers support for web applications and security. Spring Boot offers basic configurations for bootstrapping various types of Java projects quickly. This tutorial uses Spring Boot to quickly write a console application and test functionality against the database.
  * **Maven:** Maven is a project/package manager developed by Apache. Maven allows for the management of packages and various dependencies within its POM.xml file. If you have used NPM, you may be familiar with how package managers function. Maven also manages build and reporting functionality.
  * **Lombok:** Lombok is a library that allows the creation of object getters/setters through annotation within the object file. This is already present in languages like C#, and Lombok introduces this functionality into Java.
  * **NetBeans: **NetBeans is a popular open source IDE that focuses specifically on Java development. Many of its tools provide an implementation for the latest Java SE and EE updates.



This group of tools will be used to create a simple application for a fictional bike store. It will implement functionality for inserting collections for "Customer" and "Bike" objects.

### Brewed to perfection

Navigate to the [Spring Initializr][5]. This website enables you to generate basic project needs for Spring Boot and the dependencies you will need for the project. Select the following options:

  1. **Project:** Maven Project
  2. **Language:** Java
  3. **Spring Boot:** 2.1.8 (or the most stable release)
  4. **Project Metadata:** Whatever your naming conventions are (e.g., **com.stephb**)
    * You can keep Artifact as "Demo"
  5. **Dependencies:** Add:
    * Spring Data MongoDB
    * Lombok



Click **Download** and open the new project in your chosen IDE (e.g., NetBeans).

#### Model outline

The models represent information collected about specific objects in the program that will be persisted in your database. Focus on two objects: **Customer** and **Bike**. First, create a **dto** folder within the **src** folder. Then, create the two Java class objects named **Customer.java** and **Bike.java**. They will be structured in the program as follows:

**Customer. Java**


```
 1 package com.stephb.JavaMongo.dto;
 2 
 3 import lombok.Getter;
 4 import lombok.Setter;
 5 import org.springframework.data.annotation.Id;
 6 
 7 /**
 8  *
 9  * @author stephon
10  */
11 @Getter @Setter
12 public class Customer {
13 
14         private @Id [String][6] id;
15         private [String][6] emailAddress;
16         private [String][6] firstName;
17         private [String][6] lastName;
18         private [String][6] address;
19         
20 }
```

**Bike.java**


```
 1 package com.stephb.JavaMongo.dto;
 2 
 3 import lombok.Getter;
 4 import lombok.Setter;
 5 import org.springframework.data.annotation.Id;
 6 
 7 /**
 8  *
 9  * @author stephon
10  */
11 @Getter @Setter
12 public class Bike {
13         private @Id [String][6] id;
14         private [String][6] modelNumber;
15         private [String][6] color;
16         private [String][6] description;
17 
18         @Override
19         public [String][6] toString() {
20                 return "This bike model is " + this.modelNumber + " is the color " + this.color + " and is " + description;
21         }
22 }
```

As you can see, Lombok annotation is used within the object to generate the getters/setters for the properties/attributes. Properties can specifically receive the annotations if you do not want all of the attributes to have getters/setters within that class. These two classes will form the container carrying your data to wherever you want to display information.

#### Set up a database

I used a [Mongo Docker][7] container for testing. If you have MongoDB installed on your system, you do not have to run an instance in Docker. You can install MongoDB from its website by selecting your system information and following the installation instructions.

After installing, you can interact with your new MongoDB server through the command line, a GUI such as MongoDB Compass, or IDE drivers for connecting to data sources. Now you can define your data layer to pull, transform, and persist your data. To set your database access properties, navigate to the **applications.properties** file in your application and provide the following:


```
 1 spring.data.mongodb.host=localhost
 2 spring.data.mongodb.port=27017
 3 spring.data.mongodb.database=BikeStore
```

#### Define the data access object/data access layer

The data access objects (DAO) in the data access layer (DAL) will define how you will interact with data in the database. The awesome thing about using a **spring-boot-starter** is that most of the work for querying the database is already done.

Start with the **Customer** DAO. Create an interface in a new **dao** folder within the **src** folder, then create another Java class name called **CustomerRepository.java**. The class should look like:


```
 1 package com.stephb.JavaMongo.dao;
 2 
 3 import com.stephb.JavaMongo.dto.Customer;
 4 import java.util.List;
 5 import org.springframework.data.mongodb.repository.MongoRepository;
 6 
 7 /**
 8  *
 9  * @author stephon
10  */
11 public interface CustomerRepository extends MongoRepository&lt;Customer, String&gt;{
12         @Override
13         public List&lt;Customer&gt; findAll();
14         public List&lt;Customer&gt; findByFirstName([String][6] firstName);
15         public List&lt;Customer&gt; findByLastName([String][6] lastName);
16 }
```

This class is an interface that extends or inherits from the **MongoRepository** class with your DTO (**Customer.java**) and a string because they will be used for querying with your custom functions. Because you have inherited from this class, you have access to many functions that allow persistence and querying of your object without having to implement or reference your own functions. For example, after you instantiate the **CustomerRepository** object, you can use the **Save** function immediately. You can also override these functions if you need more extended functionality. I created a few custom queries to search my collection, given specific elements of my object.

The **Bike** object also has a repository for interacting with the database. Implement it very similarly to the **CustomerRepository**. It should look like:


```
 1 package com.stephb.JavaMongo.dao;
 2 
 3 import com.stephb.JavaMongo.dto.Bike;
 4 import java.util.List;
 5 import org.springframework.data.mongodb.repository.MongoRepository;
 6 
 7 /**
 8  *
 9  * @author stephon
10  */
11 public interface BikeRepository extends MongoRepository&lt;Bike,String&gt;{
12         public Bike findByModelNumber([String][6] modelNumber);
13         @Override
14         public List&lt;Bike&gt; findAll();
15         public List&lt;Bike&gt; findByColor([String][6] color);
16 }
```

#### Run your program

Now that you have a way to structure your data and a way to pull, transform, and persist it, run your program!

Navigate to your **Application.java** file (it may have a different name, depending on what you named your application, but it should include "application"). Where the class is defined, include an **implements CommandLineRunner** afterward. This will allow you to implement a **run** method to create a command-line application. Override the **run** method provided by the **CommandLineRunner** interface and include the following to test the **BikeRepository**:


```
 1 package com.stephb.JavaMongo;
 2 
 3 import com.stephb.JavaMongo.dao.BikeRepository;
 4 import com.stephb.JavaMongo.dao.CustomerRepository;
 5 import com.stephb.JavaMongo.dto.Bike;
 6 import java.util.Scanner;
 7 import org.springframework.beans.factory.annotation.Autowired;
 8 import org.springframework.boot.CommandLineRunner;
 9 import org.springframework.boot.SpringApplication;
10 import org.springframework.boot.autoconfigure.SpringBootApplication;
11 
12 
13 @SpringBootApplication
14 public class JavaMongoApplication implements CommandLineRunner {
15                 @Autowired
16                 private BikeRepository bikeRepo;
17                 private CustomerRepository custRepo;
18                 
19     public static void main([String][6][] args) {
20                         SpringApplication.run(JavaMongoApplication.class, args);
21     }
22         @Override
23         public void run([String][6]... args) throws [Exception][8] {
24                 Scanner scan = new Scanner([System][9].in);
25                 [String][6] response = "";
26                 boolean running = true;
27                 while(running){
28                         [System][9].out.println("What would you like to create? \n C: The Customer \n B: Bike? \n X:Close");
29                         response = scan.nextLine();
30                         if ("B".equals(response.toUpperCase())) {
31                                 [String][6][] bikeInformation = new [String][6][3];
32                                 [System][9].out.println("Enter the information for the Bike");
33                                 [System][9].out.println("Model Number");
34                                 bikeInformation[0] = scan.nextLine();
35                                 [System][9].out.println("Color");
36                                 bikeInformation[1] = scan.nextLine();
37                                 [System][9].out.println("Description");
38                                 bikeInformation[2] = scan.nextLine();
39 
40                                 Bike bike = new Bike();
41                                 bike.setModelNumber(bikeInformation[0]);
42                                 bike.setColor(bikeInformation[1]);
43                                 bike.setDescription(bikeInformation[2]);
44 
45                                 bike = bikeRepo.save(bike);
46                                 [System][9].out.println(bike.toString());
47 
48 
49                         } else if ("X".equals(response.toUpperCase())) {
50                                 [System][9].out.println("Bye");
51                                 running = false;
52                         } else {
53                                 [System][9].out.println("Sorry nothing else works right now!");
54                         }
55                 }
56                 
57         }
58 }
```

The **@Autowired** annotation allows automatic dependency injection of the **BikeRepository** and **CustomerRepository** beans. You will use these classes to persist and gather data from the database.

There you have it! You have created a command-line application that connects to a database and is able to perform CRUD operations with minimal code on your part.

### Conclusion

Translating from programming language concepts like objects and classes into calls to store, retrieve, or change data in a database is essential to building an application. The Java Persistence API (JPA) is an important tool in the Java developer's toolkit to solve that challenge. What databases are you exploring in Java? Please share in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/using-java-persistence-api

作者：[Stephon Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stephb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-beans.jpg?itok=3hkjX5We (Coffee beans)
[2]: https://www.techrepublic.com/article/mongodb-ceo-tells-hard-truths-about-commercial-open-source/
[3]: https://github.com/StephonBrown/SpringMongoJava
[4]: https://openjdk.java.net/projects/jdk/11/
[5]: https://start.spring.io/
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[7]: https://hub.docker.com/_/mongo
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+exception
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
