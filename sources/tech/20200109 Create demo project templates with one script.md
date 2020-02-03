[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create demo project templates with one script)
[#]: via: (https://opensource.com/article/20/1/initsh-script)
[#]: author: (Eric D. Schabell https://opensource.com/users/eschabell)

Create demo project templates with one script
======
This init.sh script makes it easier to create demos to convince your
customers, team, and boss that your project is exactly what they need.
![Person using a laptop][1]

When you're standing on a stage or doing a live demo in an online session, getting your project into a perfect-looking state may appear easy. But a lot of work goes on behind the scenes to create working, easy to use, and repeatable demo projects.

When you're doing a demo, the technology in a project must support your bigger story about the project without failing. My fellow JBoss technology evangelists and I often have to set up different technologies, so it became necessary for us to tune some sort of generic framework or template to put these demo projects into.

Achieving this goal was guided by three principles:

  * KISS (keep it simple, stupid)
  * Consistency
  * Repeatability



These stem from our aim to support anyone who wants to explore and get started with a JBoss technology. Note that while the order of these principles has some significance about what is most important, they all have to balance each other.

If one must be weighed more heavily, when using technology, it is KISS. Therefore, you will find that this principle is followed almost religiously when deciding how to solve anything within the demo project template.

### Simple

The demos need to have a simple set up, taking almost no effort to get them started or, more realistically, the least amount of effort possible.

Each project requires just three steps to get going:

  1. Download and unzip the project.
  2. Add products to the project's **installs** directory.
  3. Run **init.sh** (for Unix) or **init.bat** (for Windows) to install the project.



That's it; just watch the install's output to continue with the project as you see fit.

This setup also relies on the very smallest or most basic set of dependencies that are physically possible for Unix- and Windows-based systems—Java and Maven, nothing more than that.

A demo is all about learning what the project in front of you does, so it must be clear and offer the possibility to explore how the project is set up, configured, and runs. Based on users' feedback over the years, full automation is not desirable, as it takes the project out of the user's learning sphere.

There is a balance offered when installing a project with autoconfiguration and setup, but there are still some steps that allow you to pause, consider, and explore what has been done.

### Consistent

The only way for people to be able to jump between our various technologies and products is to have some consistency in our demo projects. A customer, partner, or interested party needs to be able to recognize a simple and clear form of project setup.

This is done with a simple and clear project template structure:

  * **docs/** contains project documentation and screenshots.
  * **installs/** is where you place needed products.
  * **projects/** contains sources for services, clients, or other project-based code.
  * **support/** holds all other configuration, setup, or other necessary files and utilities.
  * **init.{sh|bat}** stores installation scripts needed to set up the project.



That's it; every single time it will look like this.

### Repeatable

Nothing is worse than spending a large amount of time to provide a demo project and only being able to run it one time. Often, there is some factor that rushes a project's completion so that you have little chance to bring some sort of order to it.

Our template allows you to develop a demo project while saving its repeatability. Note that the entire setup is done in a new directory called **target**, where you can throw it all away and just set the project up again (with the initial **init** script).

This is a golden rule: Every demo project should be repeatable in minutes, if not less.

### Generic demo template project

You want to create your own awesome demo to convince your friends, team, and boss that your project is exactly what the doctor ordered? This template will provide the tools to set up simple, consistent and easily repeatable demo projects.

### Getting started with this template

  1. [Download and unzip it][2].



Run **init.sh** to populate a project, and see the README files that are generated for how to use it:


```
`$ ./init.sh PROJECTNAME`
```

####

![Setting up your project][3]

#### Released versions

  * v2.0—Updated to generic template project creation
  * v1.0—Image added and final touches



 

![Installing the template][4]

![Installing the template][5]

_This article is adapted from "How to create simple, consistent, repeatable demo projects" on [Eric D. Schabell's blog][6] and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/initsh-script

作者：[Eric D. Schabell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/eschabell
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://github.com/jbossdemocentral/jboss-demo-template/archive/master.zip
[3]: https://opensource.com/sites/default/files/uploads/settingup_demotemplate.png (Setting up your project)
[4]: https://opensource.com/sites/default/files/uploads/install_eric_schabell.png (Installing the template)
[5]: https://opensource.com/sites/default/files/uploads/install-2_eric_schabell.png (Installing the template)
[6]: http://www.schabell.org/2015/02/jboss-evangelist-howto-create-demo-projects.html
