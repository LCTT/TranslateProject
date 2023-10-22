[#]: subject: "An open source developer's guide to 12-Factor App methodology"
[#]: via: "https://opensource.com/article/21/11/open-source-12-factor-app-methodology"
[#]: author: "Richard Conn https://opensource.com/users/richardaconn-0"
[#]: collector: "lujun9972"
[#]: translator: "trisbestever"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

An open source developer's guide to 12-Factor App methodology
======
How 12 basic principles can help teams build highly scalable apps
quickly and efficiently.
![Tips and gears turning][1]

The [12-Factor App methodology][2] provides guidelines for building apps in a short time frame and for making them scalable. It was created by the developers at Heroku for use with Software-as-a-Service (SaaS) apps, web apps, and potentially Communication-Platform-as-a-Service (CPaaS) ****apps. For organizing projects effectively and managing scalable applications, the 12-Factor App methodology has powerful advantages for open source development.

### The principles of 12-Factor App methodology

The principles of 12-Factor App methodology are strict rules that act as building blocks for developing and deploying SaaS applications, and they are not constrained to any programming language or database.

#### 1: One codebase tracked in revision control, many deploys

![An infographic illustrating one codebase, represented by green lines on the left, leading into four deployments on the right, represented by green boxes. A staging environment is represented by an orange box, and production is represented by a red box][3]

Seth Kenlon CC-0

Every application should have one codebase with multiple different environments/deploys.

Developers should not develop another codebase just for the sake of setup in different environments. Different environments represent different states, but these different environments should share the same codebase.

An environment can be considered a branch in the context of Subversion Control Systems like GitLab, where many open source projects are stored. For example, you could create a single repository for a cloud VoIP application ****named VoIP-app in any central version control system, then create two branches, development, and staging, with "master" as the release branch.

#### 2: Explicitly declare and isolate dependencies

All dependencies should be declared. Your app may depend on external system tools or libraries, but there should be no _implicit_ reliance on system tools or libraries. Your app must always explicitly declare all dependencies and their correct versions.

Including dependencies in the codebase can create problems, especially in open source projects where a change in an external library may introduce errors into the codebase. For example, a codebase might use an external library without explicitly declaring this dependence or which version. If the external library is updated to a newer, untested version, this could create compatibility issues with your code. Your codebase is protected from this issue with an explicit declaration of the dependency and its correct version.

Depending on the technology stack, it's better to use a package manager to download the dependencies on your respective system by reading a dependency declaration manifest representing the dependencies' names and versions.

#### 3: Store config in the environment

When you need to support multiple environments or clients, configurations become a vital part of an application. A configuration that varies between deployments should be stored in the environment variables. This makes it easy to change between the deploys without having to change the code.

For closed source apps, this principle is beneficial, as you would not want sensitive information like database connection information, or other secret data, to be given out publicly. However, in open source development, these details are open. In this case, the advantage is that you do not need to keep changing the code repeatedly. You just set the variables in such a way that you only have to change the environment to get your codebase to run perfectly.

#### 4: Treat backing services as attached resources

All backing services (such as databases, external storage, or message queues) are treated as attached resources and are attached and detached by the execution environment. With this principle, if the location or connection details of these services change, you still don't need to change the code. The details are available in the config instead.

Backing services can be attached or detached from deploys quickly. For example, if your cloud-based erp's database is not working correctly, the developer should be able to create a new database server restored from a recent backup—without any change to the codebase.

#### 5: Strictly separate build and run stages

A 12-Factor App requires a strict separation between build, release, and run stages.

  * The first stage is the _build_ ****phase. In this phase, the source code is assembled or compiled into an executable while also loading dependencies and creating assets. Every time a new code needs to be deployed, the build phase starts.

  * The second stage is the _release_ ****phase. In this phase, the code produced during the build stage is combined with the deployment's current config. The resulting release contains both the build and the config and is ready for immediate execution in the execution environment.

  * The third stage is the _run_ ****phase and is the final stage: the application is run in the execution environment. It should not be interrupted by any other stage.




By strictly separating these stages, we avoid code breaks and make system maintenance much more manageable.

#### 6: Execute the app as one or more stateless processes

An app is executed in an execution environment as a collection of one or more processes. These processes are stateless, with persisted data stored on a backing service, such as a database.

This is useful for open source, because a developer using a version of the app can create multinode deployments on their cloud platform for scalability. The data is not persisted in them, since data would be lost if any one of those nodes crashes.

#### 7: Export services via port binding

Your app should act as a standalone service that is independent of additional apps. It should be accessible to other services through a URL, acting as a service. In this way, your app can serve as a resource for other apps when required. Using this concept, you can build [REST APIS][4].

#### 8: Scale out via the process model

Also known as the concurrency principle, this principle indicates that each process in your app should be able to scale, restart, or clone itself.

Instead of making a process larger, a developer can create multiple processes and distribute the load of their apps among those processes. This approach allows you to build your app to handle diverse workloads by assigning each workload to a process type.

#### 9: Maximize robustness with fast startup and graceful shutdown

Your app should be built on simple processes, so developers can scale up processes while still allowing them to restart them if anything goes wrong. This makes the app's processes disposable.

Building an app on this principle means rapid deployment of code, fast elastic scaling, more agility for the release process, and robust production deploys. All of these are very helpful in an open source development environment.

#### 10: Keep development, staging, and production as similar as possible

Teams working on a project should use the same operating systems, backing services, and dependencies. This reduces the likelihood of bugs turning up, and less time is needed for development.

Putting this principle into practice could be a challenge for open source projects due to the dispersed nature of its developers, who may not be ****[able to communicate][5] about the systems, services, and dependencies they use. One possibility for reducing these differences is a development guideline suggesting what operating system, services, and dependencies to use.

#### 11: Treat logs as event streams

Logs are essential for troubleshooting production problems or understanding user behavior. However, a 12-Factor App shouldn't be concerned with the management of logs.

Instead, it should route log entries as event streams, written as standard outputs, to a separate service for analysis and archival. Robotic process automation (RPA) technologies could be useful as a third-party service to process and analyze the logs. The execution environment will decide how to process this stream. This provides greater flexibility and power for introspecting the app's behavior.

#### 12: Run admin/management tasks as one-off processes

This principle is not really related to development but is instead about app management. Admin processes should be run in an identical environment to the regular long-running processes of the app. In a local deploy, developers could use a direct shell command inside the app checkout directory to perform one-time admin processes.

### Conclusion

By developing your app using 12-Factor App methodology, you can increase efficiency and rollout faster. It may make sense to diverge from some of the guidelines in open source development, but it is best to try to follow these guidelines as strictly as possible.

Open source 12-Factor Apps are possible. One great example is [Jitsi][6][, an open source video conference platform][7], which scaled 100-fold during the pandemic with great success, was built with the 12-Factor App methodology.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/open-source-12-factor-app-methodology

作者：[Richard Conn][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/richardaconn-0
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://www.redhat.com/architect/12-factor-app
[3]: https://opensource.com/sites/default/files/uploads/codebase-deploy_1.png (Codebase)
[4]: https://opensource.com/article/21/9/ansible-rest-apis
[5]: https://opensource.com/article/21/10/global-communication-open-source
[6]: https://jitsi.org/
[7]: http://jitsi.org
