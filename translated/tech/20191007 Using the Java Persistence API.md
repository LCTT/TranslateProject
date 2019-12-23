[#]: collector: (lujun9972)
[#]: translator: (runningwater)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using the Java Persistence API)
[#]: via: (https://opensource.com/article/19/10/using-java-persistence-api)
[#]: author: (Stephon Brown https://opensource.com/users/stephb)

使用 Java 持久化 API
======
我们通过为自行车商店构建示例应用程序来学习如何使用 JPA。
![Coffee beans][1]

对应用开发者来说，Java 持久化 API （JPA）是一项重要的技能，需要透彻理解。它为 Java 开发人员定义了如何将对象的方法调用转换为访问、持久化及管理 NoSQL 和关系型数据库数据存储的问题的方案。

本文通过构建自行车借贷服务的教程示例来详细研究 JPA。此示例会使用 Spring Boot 框架、MongoDB 数据库（[已经不开源][2]）和 Maven 包管理来构建一个大型应用程序，并且创建一个创建、读取、更新和删除(CRUD) 层。这儿我选择 NetBeans 11 作为我的 IDE。

此教程仅从开源的角度来介绍 Java 持久化的工作原理，不涉及其作为工具的使用说明。这全是关于编写应用程序模式的学习，但对于理解具体的软件实现也很益处。可以从我的[ GitHub 源仓库][3] 来获取相关代码。

### Java: 不仅仅是 'beans'

Java 是一门面向对象的编程语言，自 1996 年发布第一版 Java 开发工具（JDK）起，已经变化了很多很多。要了解其特性和其虚拟机本身就是个很长的历史。简而言之，和 Linux 内核很相似，自发布以来，该语言已经向多个方向分支发展。有对社区免费的标准版本、有针对企业的企业版本及由多家供应商提供的开源替代品。主要版本每六个月发布一次，其功能往往差异很大，所以确认选用版本前得先做些研究。

总而言之，Java 的历史很悠久。本教程重点介绍 Java 11 的开源实现 [JDK 11][4]。因其是扔然有效的长期支持版本之一。

  * **Spring Boot: ** Spring Boot 是由 Pivotal 公司开发大型 Spring 框架的一个模块。Spring 是 Java 开发中一个非常流行的框架。它支持各种框架和配置，也支持 WEB 应用程序及提供了应用安全保障功能。Spring Boot 为快速启动项目集成了基本的配置。本教程使用 Spring Boot 来快速编写控制台应用程序并针对数据库编写测试用例。
  * **Maven:** Maven 是由 Apache 开发的项目/包管理工具。Maven 通过 `POM.xml`  文件来管理包及其依赖项。如果你们使用过 NPM 的话，可能会非常熟悉包管理器的功能。此外 Maven 也用来进行项目构建及生成功能报告。 
  * **Lombok:** Lombok 是一个库，它通过在对象文件里面添加注解来自动创建 getters/setters 方法。像 C# 这些语言已经实现了此功能，Lombok 只是把此功能引入 Java 语言而已。
  * **NetBeans: ** NetBeans 是一款很流行的开源 IDE，专门用于 Java 开发。它的许多工具都随着 Java SE 和 EE 的版本更新而更新。



我们会这组工具来创建一个简单的虚构自行车商店应用程序。会实现对 "Customer" 和 "Bike" 对象集合的的插入操作。

### 酿造完美

导航到 [Spring Initializr][5] 页面。该网站可以生成基于 Spring Boot 和其依赖项的基本项目。选择以下选项： 

  1. **项目:** Maven 工程
  2. **语言:** Java
  3. **Spring Boot:** 2.1.8 (或最稳定版本)
  4. **项目元数据:** 无论你使用什么名字，其命名约定都是像 **com.stephb** 这样的。
    * 你可以保留 Artifact 名字为 “Demo”。
  5. **依赖项:** 添加:
    * Spring Data MongoDB
    * Lombok



点击 **下载**，然后用你的 IDE（例如 NetBeans） 打开此新项目。

#### 模型层(Model)概要

项目里面，模型代表从数据库里取出的信息的具体对象。我们关注两个对象：**Customer** 和 **Bike**。首先，在 **src** 目录创建 **dto** 目录；然后，创建两个名为 **Customer.java** 和 **Bike.java** 的 Java 类对象文件。其结构如下示：

**Customer.Java**


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
14         private @Id String id;
15         private String emailAddress;
16         private String firstName;
17         private String lastName;
18         private String address;
19         
20 }
```

**Bike.java**


```Java
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
13         private @Id String id;
14         private String modelNumber;
15         private String color;
16         private String description;
17 
18         @Override
19         public String toString() {
20                 return "This bike model is " + this.modelNumber + " is the color " + this.color + " and is " + description;
21         }
22 }
```

如你所见，对象中使用 Lombok 注解来为定义的属性(特性)生成 getters/setters 方法。如果你不想对所有属于都生成 getters/setters 方法，可以在属性上定义这些注解。这两个类会变成容器，里面携带有数据，无论在何处想显示信息都可以使用。

#### 配置数据库

我使用 [Mongo Docker][7] 容器来进行此次测试。如果你的系统上已经安装了 MongoDB，则不必运行 Docker 实例。你也可以登陆其官网，然后按照安装说明，选择系统信息来安装 MongoDB。

安装后，就可以使用命令行、GUI（例如 MongoDB Compass）或用于连接数据源的 IDE 驱动程序来与新的 MongoDB 服务进行交互。到目前为止，可以开始定义数据层了，用来拉取、转换和持久化数据。需要设置数据库访问属性，请导航到程序中的 **applications.properties** 文件，然后添加如下内容：


```
 1 spring.data.mongodb.host=localhost
 2 spring.data.mongodb.port=27017
 3 spring.data.mongodb.database=BikeStore
```

#### 定义数据访问对象(数据)层

数据访问层（DAL）中的数据访问对象（DAO）定义了与数据库中的数据的交互过程。令人惊叹的就是在使用 **spring-boot-starter** 后，查询数据库的大部分工作已经完成。

让我们从 **Customer** DAO 开始。在 **src** 下的新目录 **dao** 中创建一个接口文件，然后再创建一个名为 **CustomerRepository.java** 的 Java 类文件，其内容如下示：


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
11 public interface CustomerRepository extends MongoRepository<Customer, String>{
12         @Override
13         public ListStringCustomer> findAll();
14         public List<Customer> findByFirstName(String firstName);
15         public List<Customer> findByLastName(String lastName);
16 }
```

这个类是一个接口，扩展或继承于 **MongoRepository** 类，而 MongoRepository 类依赖于 DTO （**Customer.java**）和一个字符串，它们用来实现自定义函数查询功能。因为您已继承自此类，所以您可以访问许多方法函数，这些函数允许持久化和查询对象，而无需实现或引用自己定义的方法函数。例如，在实例化 **CustomerRepository** 对象后，你就可以直接使用 **Save** 功能。如果你需要扩展更多的功能，也可以重写这些方法。我创建了一些自定义查询来搜索我的集合，这些集合对象是我自定义的元素。

**Bike** 对象也有一个存储源负责与数据库交互。与 **CustomerRepository** 的实现非常类似。其实现如下所示：

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
11 public interface BikeRepository extends MongoRepository<Bike,String>{
12         public Bike findByModelNumber(String modelNumber);
13         @Override
14         public List<Bike> findAll();
15         public List<Bike> findByColor(String color);
16 }
```

#### 运行程序

现在，你已经有了一种结构化数据的方式，可以对数据进行提取、转换和持久化，然后运行这个程序。

找到 **Application.java** 文件（有可能不是此名称，具体取决于你的应用程序名称，但都会包含有 “application” ）。在定义此类的地方，在后面加上 **CommandLineRunner 的实现**。这将允许你实现 **run** 方法来创建命令行应用程序。重写 **CommandLineRunner** 接口提供的 **run** 方法，并包含如下内容用来测试 **BikeRepository** ：


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
19     public static void main(String[] args) {
20                         SpringApplication.run(JavaMongoApplication.class, args);
21     }
22         @Override
23         public void run(String... args) throws [Exception] {
24                 Scanner scan = new Scanner(System.in);
25                 String response = "";
26                 boolean running = true;
27                 while(running){
28                         System.out.println("What would you like to create? \n C: The Customer \n B: Bike? \n X:Close");
29                         response = scan.nextLine();
30                         if ("B".equals(response.toUpperCase())) {
31                                 String[] bikeInformation = new String;
32                                 System.out.println("Enter the information for the Bike");
33                                 System.out.println("Model Number");
34                                 bikeInformation[0] = scan.nextLine();
35                                 System.out.println("Color");
36                                 bikeInformation[1] = scan.nextLine();
37                                 System.out.println("Description");
38                                 bikeInformation[2] = scan.nextLine();
39 
40                                 Bike bike = new Bike();
41                                 bike.setModelNumber(bikeInformation[0]);
42                                 bike.setColor(bikeInformation[1]);
43                                 bike.setDescription(bikeInformation[2]);
44 
45                                 bike = bikeRepo.save(bike);
46                                 System.out.println(bike.toString());
47 
48 
49                         } else if ("X".equals(response.toUpperCase())) {
50                                 System.out.println("Bye");
51                                 running = false;
52                         } else {
53                                 System.out.println("Sorry nothing else works right now!");
54                         }
55                 }
56                 
57         }
58 }
```

其中的 **@Autowired** 注解会自动依赖注入  **BikeRepository** 和 **CustomerRepository** Bean。我们将使用这些类来从数据库持久化和采集数据。

已经好了。你已经创建了一个命令行应用程序。该应用程序连接到数据库，并且能够以最少的代码执行 CRUD 操作

### 结论

从诸如对象和类之类的编程语言概念转换为用于在数据库中存储、检索或更改数据的调用对于构建应用程序至关重要。Java 持久化 API （JPA）正是为 Java 开发人员解决这一难题的重要工具。 你正在使用 Java 操纵哪些数据库呢？ 请在评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/using-java-persistence-api

作者：[Stephon Brown][a]
选题：[lujun9972][b]
译者：[runningwater](https://github.com/runningwater)
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
