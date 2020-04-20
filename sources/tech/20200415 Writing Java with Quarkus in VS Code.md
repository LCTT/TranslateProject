[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Writing Java with Quarkus in VS Code)
[#]: via: (https://opensource.com/article/20/4/java-quarkus-vs-code)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

Writing Java with Quarkus in VS Code
======
In this tutorial, I'll walk you through how to rebuild, package, and
deploy cloud-native applications automatically with Quarkus.
![Person drinking a hat drink at the computer][1]

In the previous articles in this series about cloud-native [Java][2] applications, I shared [_6 requirements of cloud-native software_][3] and [_4 things cloud-native Java must provide_][4]. But now you might want to implement these advanced Java applications in your local machine without climbing a steep learning curve. In this article, I will walk through using the open source technologies [Quarkus][5] and [Visual Studio Code][6] (VS Code) to accelerate the development of both traditional cloud-native Java stacks and also serverless, reactive applications with easier and more familiar methods.

Quarkus is a Kubernetes-native Java stack tailored for GraalVM and OpenJDK HotSpot. It's crafted from best-of-breed Java libraries and standards with live coding, unified configuration, superfast startup, small memory footprint, and unified imperative and reactive development. VS Code is an open source integrated development environment (IDE) for editing code.

### Generate a Quarkus project

Begin by navigating to Quarkus' [Start coding][7] page to generate a Quarkus project that includes a RESTful endpoint. Leave all variables (i.e., Group, Artifact, Build Tool, Extensions) on the default settings, then click **Generate your application** at the top-right of the page. Note that the RESTEasy JAX-RS extension is preselected as default.

![Quarkus Generate application button][8]

The ZIP file will automatically download on your local machine. Extract the file with the following command:


```
$ unzip code-with-quarkus.zip
Archive: code-with-quarkus.zip
    creating: code-with-quarkus/
   inflating: code-with-quarkus/pom.xml
   ...
```

### Install VS Code

Download and install VS Code in your preferred way, whether that's [from the website][9] or through your package manager (dnf, apt, brew, etc). Once that's done, open the unzipped Quarkus project using VS Code's command-line tool:


```
$ cd code-with-quarkus/
$ code .
```

You will see the [Apache Maven][10] project structure with:

  * **ExampleResource** exposed on **/hello**
  * Associated JUnit test
  * Accessible landing page via <http://localhost:8080>
  * Dockerfiles for both [native compilation][11] and JVM HotSpot
  * A unified application configuration file



Add Quarkus tools to your IDE through the VS Code's extension feature.

![Add Quarkus tools to VS Code IDE][12]

### Start coding

Run the application using Quarkus development mode. To run the application, you need:

  * JDK 1.8+ installed with JAVA_HOME configured appropriately
  * Apache Maven 3.6.3+



Move to the **code-with-quarkus** directory then type **mvn compile quarkus:dev** in VS Code's terminal.

![Run application][13]

You will see that the Java application is running well with:

  * About one second to startup
  * Live coding activated
  * EnabledCDI and RESTEASY features



When you access the endpoint via a web browser, you will see the return code, **hello**.

!["Hello" return][14]

Now, you're ready to change the code! Move back to VS Code, then open the **ExampleResource.java** file in **src/main/java/org/acme**. Replace the return code with "**Welcome, Cloud-Native Java with Quarkus!"** Don't forget to **Save** the file.

![Editing the return][15]

Go back to the web browser and reload the page.

![New return][16]

_It's like magic!_ Behind the scenes, Quarkus rebuilt, packaged, and deployed the application for you automatically, and it only took half a second. This is one of the essential cloud-native Java runtime features for increasing development productivity.

![Quarkus output][17]

Continue running your cloud-native Java application in Quarkus.

### Integrate data transactions via Quakrus Tool

To add an in-memory database (H2) transaction capability, press **F1** then click on **Quarkus: Add extensions to the current project**.

![Adding extensions in Quarkus][18]

Enter **h2** in the search bar, then double-click on **JDBC Driver - H2 Data** in the result.

![JDBC Driver - H2 Data extension][19]

Select the following three extensions, which will simplify your persistence code and return JSON format data:

  * Hibernate ORM with Panache Data
  * JDBC Driver - H2
  * RESTEasy JSON-B Web



Press **Enter** to add those dependencies.

![Add Quarkus extensions][20]

You should see the following in a new VS Code terminal:

![VS Code adding extensions][21]

You should also find the following pulled dependencies in **POM.xml**:

![dependencies in POM.xml][22]

### Create an Inventory entity

With your project in place, you can get to work defining the business logic.

The first step is to define the model (entity) of an Inventory object. Since Quarkus uses Hibernate ORM Panache, create an **Inventory.java** file in the **src.main.java.org.acme** directory, and paste the following code into it:


```
package org.acme;

import javax.persistence.Cacheable;
import javax.persistence.Entity;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

@[Entity][23]
@Cacheable
public class Inventory extends PanacheEntity {
   
    public [String][24] itemId;
    public [String][24] location;
    public int quantity;
    public [String][24] link

    public Inventory() {

    }
   
}
```

#### Define the RESTful endpoint of Inventory

Next, mirror the abstraction of service so that you can inject the Inventory service into various places (like a RESTful resource endpoint) in the future. Create an **InventoryResource.java** file in the **src.main.java.org.acme** directory and add this code to it:


```
package org.acme;

import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("/services/inventory")
@ApplicationScoped
@Produces("application/json")
@Consumes("application/json")
public class InventoryResource {

    @GET
    <http://localhost:8080/services/inventory>
    public List&lt;Inventory&gt; getAll() {
        return Inventory.listAll();
    }
}
```

Don't forget to save these files. Go back to your web browser and access a new endpoint, <http://localhost:8080/services/inventory>. You will see:

![Inventory endpoint][25]

### Wrapping up

If you have an issue or get an error when you implement this, you can find and reuse the [code in my GitHub repository][26].

If you want to learn more, Quarkus has some [practical and useful guides][27] that show how to develop advanced cloud-native Java applications using Quarkus extensions with event-driven programming, serverless development, and Kubernetes deployment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/java-quarkus-vs-code

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://opensource.com/resources/java
[3]: https://opensource.com/article/20/1/cloud-native-software
[4]: https://opensource.com/article/20/1/cloud-native-java
[5]: https://quarkus.io/
[6]: https://code.visualstudio.com/
[7]: https://code.quarkus.io/
[8]: https://opensource.com/sites/default/files/uploads/quarkus_generateapplication.png (Quarkus Generate application button)
[9]: https://code.visualstudio.com/download
[10]: https://maven.apache.org/
[11]: https://quarkus.io/guides/building-native-image
[12]: https://opensource.com/sites/default/files/uploads/add-quarkus-to-ide.png (Add Quarkus tools to VS Code IDE)
[13]: https://opensource.com/sites/default/files/uploads/run-application.png (Run application)
[14]: https://opensource.com/sites/default/files/uploads/endpoint-hello.png ("Hello" return)
[15]: https://opensource.com/sites/default/files/uploads/edit-return-code.png (Editing the return)
[16]: https://opensource.com/sites/default/files/uploads/new-return-code.png (New return)
[17]: https://opensource.com/sites/default/files/uploads/quarkus-magic.png (Quarkus output)
[18]: https://opensource.com/sites/default/files/uploads/quarkus-add-extensions.png (Adding extensions in Quarkus)
[19]: https://opensource.com/sites/default/files/uploads/jbdc-driver-h2-data.png (JDBC Driver - H2 Data extension)
[20]: https://opensource.com/sites/default/files/uploads/add-extensions.png (Add Quarkus extensions)
[21]: https://opensource.com/sites/default/files/uploads/vscode-adding-extensions.png (VS Code adding extensions)
[22]: https://opensource.com/sites/default/files/uploads/dependencies-pomxml.png (dependencies in POM.xml)
[23]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+entity
[24]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[25]: https://opensource.com/sites/default/files/uploads/inventory-endpoint.png (Inventory endpoint)
[26]: https://github.com/danieloh30/code-with-quarkus
[27]: https://quarkus.io/guides/
