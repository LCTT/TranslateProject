 Vic020

Introduction to Eclipse Che, a next-generation, web-based IDE
============================================================
 ![Introduction to Eclipse Che, a next-generation, web-based IDE](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/EDU_OSDC_OpenClass_520x292_FINAL_JD.png?itok=ETOrrpcP "Introduction to Eclipse Che, a next-generation, web-based IDE") 

>Image by : opensource.com

Correctly installing and configuring an integrated development environment, workspace, and build tools in order to contribute to a project can be a daunting or time consuming task, even for experienced developers. Tyler Jewell, CEO of [Codenvy][1], faced this problem when he was attempting to set up a simple Java project when he was working on getting his coding skills back after dealing with some health issues and having spent time in managerial positions. After multiple days of struggling, Jewell could not get the project to work, but inspiration struck him. He wanted to make it so that "anyone, anytime can contribute to a project with installing software."

It is this idea that lead to the development of [Eclipse Che][2].

Eclipse Che is a web-based integrated development environment (IDE) and workspace. Workspaces in Eclipse Che are bundled with an appropriate runtime stack and serve their own IDE, all in one tightly integrated bundle. A project in one of these workspaces has everything it needs to run without the developer having to do anything more than picking the correct stack when creating a workspace.

The ready-to-go bundled stacks included with Eclipse Che cover most of the modern popular languages. There are stacks for C++, Java, Go, PHP, Python, .NET, Node.js, Ruby on Rails, and Android development. A Stack Library provides even more options and if that is not enough, there is the option to create a custom stack that can provide specialized environments.

Eclipse Che is a full-featured IDE, not a simple web-based text editor. It is built on Orion and the JDT. Intellisense and debugging are both supported, and version control with both Git and Subversion is integrated. The IDE can even be shared by multiple users for paired programming. With just a web browser, a developer can write and debug their code. However, if a developer would prefer to use a desktop-based IDE, it is possible to connect to the workspace with a SSH connection.

One of the major technologies underlying Eclipse Che are [Linux containers][3], using Docker. Workspaces are built using Docker and installing a local copy of Eclipse Che requires nothing but Docker and a small script file. The first time `che.sh start` is run, the requisite Docker containers are downloaded and run. If setting up Docker to install Eclipse Che is too much work for you, Codenvy does offer online hosting options. They even provide 4GB workspaces for open source projects for any contributor to the project. Using Codenvy's hosting option or another online hosting method, it is possible to provide a url to potential contributors that will automatically create a workspace complete with a project's code, all with one click.

Beyond Codenvy, contributors to Eclipse Che include Microsoft, Red Hat, IBM, Samsung, and many others. Several of the contributors are working on customized versions of Eclipse Che for their own specific purposes. For example, Samsung's [Artik IDE][4] for IoT projects. A web-based IDE might turn some people off, but Eclipse Che has a lot to offer, and with so many big names in the industry involved, it is worth checking out.

* * *

If you are interested in learning more about Eclipse Che, [CheConf 2016][5] takes place on November 15\. CheConf 2016 is an online conference and registration is free. Sessions start at 11:00 am Eastern time (4:00 pm UTC) and end at 5:30 pm Eastern time (10:30 pm UTC).

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/11/introduction-eclipse-che

作者：[Joshua Allen Holm][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/holmja
[1]:http://codenvy.com/
[2]:http://eclipse.org/che
[3]:https://opensource.com/resources/what-are-linux-containers
[4]:http://eclipse.org/che/artik
[5]:https://eclipse.org/che/checonf/
