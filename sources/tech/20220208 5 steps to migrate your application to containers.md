[#]: subject: "5 steps to migrate your application to containers"
[#]: via: "https://opensource.com/article/22/2/migrate-application-containers"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 steps to migrate your application to containers
======
If you're new to containers, don't be intimidated by terminology. These
key principles will help you migrate your application to the cloud.
![A person holding on to clouds that look like balloons][1]

Generally, you consider it a good thing when people want to use your application. However, when the application runs on a server, there's a cost for popularity. With users come increased demands on resources, and at some point, you may find that you need to scale your app. One option is to throw more servers at the problem, establish a [load balancer][2] like Nginx, and let the demand sort itself out. That option can be expensive, though, because there are no savings when demand is low, and you're running instances of your app on servers devoid of traffic. Containers have the advantage of being ephemeral, launching when new instances are available and fading away with decreased demand. If that sounds like a feature you need, then it may be time to migrate your app to containers.

Migrating an app to a container can quickly become disorienting. While the environment within a container may feel familiar, many container images are minimal, and they are designed to be stateless. In a way, though, this is one of the strengths of containers. Like a Python virtual environment, it's a blank slate that lets you build (or rebuild) your application without the invisible defaults that many other environments provide.

Every migration is unique, but here are a few important principles you should address before porting your application to containers.

### 1\. Understand your dependencies

Porting your application to a container is an excellent opportunity to get to know what your app actually depends upon. With very few default installs of all but the most essential system components, your application is unlikely to run within a container at first.

Before refactoring, identify your dependencies. Start with a `grep` through your source code for `include` or `import` or `require` or `use` or whatever keyword your language of choice uses to declare dependencies.


```


$ find ~/Code/myproject -type f \
-iname ".java" \
-exec grep import {} \;

```

It may not be enough to identify just language-specific libraries you use, though. Audit dependencies, so you know whether there are low-level libraries required for the language itself to run or a specific module to function as expected.

### 2\. Evaluate your data storage

Containers are stateless, and when one crashes or otherwise stops running, that instance of the container is gone forever. If you were to save data in that container, the data would also disappear. If your application stores user data, all storage must occur outside of the container, in some location accessible to an instance of your application.

You can use local storage mapped to a location within your container for simple application configuration files. This is a common technique for web apps that require the administrator to provide simple config values, such as an admin email address, a website title, and so on. For example:


```


$ podman run \
\--volume /local/data:/storage:Z \
mycontainer

```

However, you can configure a database like MariaDB or PostgreSQL as shared storage across several containers for large amounts of data. For private information, such as passwords, [you can configure a `secret`][3].

**[ Download our [MariaDB cheat sheet][4] ]**

Regarding how you need to refactor your code, you must adapt the storage locations accordingly. This might mean changing paths to new container storage mappings, ports to different database destinations, or even incorporating container-specific modules.

### 3\. Prepare your Git repo

Containers generally pull source code from a Git repository as they get built. You must have a plan for managing your Git repository once it becomes the canonical source of production-ready code for your application. Have a release or production branch, and consider using [Git hooks][5] to reject accidental unapproved commits.

### 4\. Know your build system

Containerized applications probably don't have traditional release cycles. They're pulled from Git when a container gets built. You can initiate any number of build systems as part of your container build, but that might mean adjusting your build system to be more automated than it used to be. You should refactor your build process such that you have total confidence that it works completely unattended.

### 5\. Build an image

Building an image doesn't have to be a complex task. You can use [existing container images][6] as a basis, adapting them with a simple Dockerfile. Alternately, you can build your own from scratch using [Buildah][7].

The process of building a container is, in a way, as much a part of development as actually refactoring your code. It's the container build that obtains, assembles, and executes your app, so the process must be automated and robust. Build a good image, and you're building a solid and reliable foundation for your app.

### Containerize it

If you're new to containers, don't be intimidated by terminology. A container is just another environment. The perceived constraints of containerized development can actually help you focus your application and better understand how it runs, what it needs to run reliably, and what potential risks there are when something goes wrong. Conversely, this results in far fewer constraints for sysadmins installing and running your app because containers are, by nature, a controlled environment. Review your code carefully, understand what your app needs, and refactor it accordingly.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/migrate-application-containers

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/business_clouds.png?itok=IRsi1qOF (A person holding on to clouds that look like balloons)
[2]: https://opensource.com/article/21/4/load-balancing
[3]: https://www.redhat.com/sysadmin/new-podman-secrets-command
[4]: https://opensource.com/downloads/mariadb-mysql-cheat-sheet
[5]: http://redhat.com/sysadmin/git-hooks
[6]: https://www.redhat.com/sysadmin/top-container-images
[7]: https://opensource.com/article/22/1/build-your-own-container-scratch
