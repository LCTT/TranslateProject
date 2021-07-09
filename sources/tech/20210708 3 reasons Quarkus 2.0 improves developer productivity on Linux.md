[#]: subject: (3 reasons Quarkus 2.0 improves developer productivity on Linux)
[#]: via: (https://opensource.com/article/21/7/developer-productivity-linux)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

3 reasons Quarkus 2.0 improves developer productivity on Linux
======
New features in Quarkus 2.0 make it easier to test code in the developer
console.
![Person using a laptop][1]

No matter how long you work as an application developer and no matter what programming language you use, you probably still struggle to increase your development productivity. Additionally, new paradigms, including cloud computing, DevOps, and test-driven development, have significantly accelerated the development lifecycle for individual developers and multifunctional teams.

You might think open source tools could help fix this problem, but I'd say many open source development frameworks and tools for coding, building, and testing make these challenges worse. Also, it's not easy to find appropriate [Kubernetes][2] development tools to install on Linux distributions due to system dependencies and support restrictions.

Fortunately, you can increase development productivity on Linux with [Quarkus][3], a Kubernetes-native Java stack. Quarkus 2.0 was released recently with useful new features for testing in the developer console.

### Interactive developer UX/UI

If you need to add more than 10 dependencies (e.g., database connections, object-relational mapping, JSON formatting, REST API specifications) to your Java Maven project, you must define more than 60 configurations with keys and values in one or more `application.properties` files. More configurations decrease readability for individual developers and are harder for developer teams to manage.

Quarkus has an interactive interface to display all dependencies that have been added. It is available at the `localhost:8080/q/dev` endpoint after you start Quarkus dev mode with the `mvn quarkus:dev` command. You can also update configurations in the DEV user interface (UI), as Figure 1 shows, and the changes will automatically sync with the `application.properties` file.

(Note: You can find the entire Quarkus application code for this article in my [GitHub repository][4].)

![Quarkus DEV UI][5]

Figure 1. Quarkus DEV UI (Daniel Oh, [CC BY-SA 4.0][6])

### Better continuous testing

When developing an application, anything from a monolith to microservices, you have to test your code. Often, a dedicated quality assurance (QA) team using external continuous integration (CI) tools is responsible for verifying unit tests. That's worked for years, and it still does, but Quarkus allows programmers to run tests in the runtime environment where their code is running as it's being developed. Quarkus 2.0 provides this continuous testing feature through the command-line interface (CLI) and the DEV UI, as shown in Figure 2.

![Quarkus Testing in DEV UI][7]

Figure 2. Quarkus testing in DEV UI (Daniel Oh, [CC BY-SA 4.0][6])

Continuous testing is not running when a Quarkus application starts. To start it, click "Tests not running" on the bottom-right of the DEV UI. You can also open a web terminal by clicking "Open" on the left-hand side of the DEV UI. Both of those options are highlighted in Figure 2, and an example test result is shown in Figure 3.

![Quarkus console in DEV UI][8]

Figure 3. Quarkus console in DEV UI (Daniel Oh, [CC BY-SA 4.0][6])

If you change the code (e.g., "Hello" to "Hi" in the `hello()` method) but not the test code (regardless of whether the feature works), the test will fail, as shown in Figure 4. To fix it, update the test code along with the logic code.

![Test failures in Quarkus DEV UI][9]

Figure 4. Test failures in Quarkus DEV UI (Daniel Oh, [CC BY-SA 4.0][6])

You can rerun the test cases implemented in the `src/test/java/` directory. This feature alleviates the need to integrate with an external CI tool and ensures functionality while developing business logic continuously.

### Zero configuration with dev services

When you're developing for a specific target, it's important that your development environment is an accurate reflection of the environment where it is meant to run. That can make installing a database in a place like a local environment a little difficult. If you're developing on Linux, you could run the requisite database in a container, but they tend to run differently based on what resources are available, and your local environment probably doesn't have the same resources as the target production environment.

Quarkus 2.0 helps solve this problem by providing dev services built on [Testcontainers][10]. For example, you can test applications if they work in the production database, PostgreSQL, rather than an H2 in-memory datastore with the following [configurations][11]:


```
quarkus.datasource.db-kind = postgresql (1)
quarkus.hibernate-orm.log.sql = true

quarkus.datasource.username=person (2)
quarkus.datasource.password=password (3)
quarkus.hibernate-orm.database.generation=drop-and-create

%prod.quarkus.datasource.db-kind = postgresql (4)
%prod.quarkus.datasource.jdbc.url = jdbc:postgresql://db:5432/person (5)
%prod.quarkus.datasource.jdbc.driver=postgresql

quarkus.datasource.devservices.image-name=postgres:latest (6)
```

In the code above:

(1) The kind of database you will connect for development and test
(2) Datasource username
(3) Datasource password
(4) The kind of database you will connect for production
(5) Datasource URL
(6) The container image name to use for DevServices providers; if the provider is not container-based (e.g., H2 database), then this has no effect

When Quarkus restarts with the new configuration, the Postgres container image will be created and start running automatically, as in Figure 5.

![Quarkus DevServices][12]

Figure 5. Quarkus DevServices (Daniel Oh, [CC BY-SA 4.0][6])

This feature enables you to remove the production datastore integration test. It also increases your development productivity due to avoiding environmental disparities in the development loop.

### Conclusion

Quarkus 2.0 increases developer productivity with built-in continuous testing, an interactive DEV UI, and dev services. In addition, it offers additional features for improving developer experiences such as [live coding][13], [remote development mode on Kubernetes][14], and unified configurations that accelerate the development loop. Quarkus 2.0 is certainly no exception! Try it out for yourself [here][15]!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/developer-productivity-linux

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://quarkus.io/
[4]: https://github.com/danieloh30/quarkus-testing
[5]: https://opensource.com/sites/default/files/uploads/quarkus-devui.png (Quarkus DEV UI)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/quarkustesting.png (Quarkus Testing in DEV UI)
[8]: https://opensource.com/sites/default/files/uploads/quarkusconsole.png (Quarkus console in DEV UI)
[9]: https://opensource.com/sites/default/files/uploads/failedtest.png (Test failures in Quarkus DEV UI)
[10]: https://www.testcontainers.org/
[11]: https://github.com/danieloh30/quarkus-testing/blob/main/src/main/resources/application.properties
[12]: https://opensource.com/sites/default/files/uploads/quarkusdevservices.png (Quarkus DevServices)
[13]: https://quarkus.io/guides/getting-started#development-mode
[14]: https://developers.redhat.com/blog/2021/02/11/enhancing-the-development-loop-with-quarkus-remote-development
[15]: https://quarkus.io/quarkus2/
