Linux System Administration Skills are Changing 
================================================================================
When was the last time you compiled a kernel? For many of the latest generation of Linux admins, the answer is really simple: never. I am one of those, provided we don't count a few times I tried it just for fun, then couldn't see why I would need a custom kernel and went back to my out-of-the-box kernel.  
 
For many of the longer-time Linux admins and engineers this may seem laughable, but it is a reality: As Linux adoption grows in the enterprise, a new generation of Linux admins is created that has extremely good technical skills, but lacks these 'simple' low level skills seen by many as fundamental to being a good Linux admin. We can build a high performance, highly available web infrastructure that uses the latest of the latest techniques, but don't ask us to fix a non-booting Linux machine: our advice will be to ditch it and set up a new vm.
 
Over the past decade or so, we have seen some interesting trends. Linux became a commodity in the enterprise, and as that happened the various distributions became powerful yet flexible enough to remove the need for the average admin to ever have to do low level things like compiling a kernel. 
 
Next, we welcomed virtual machine technology as a commodity, which added another layer of abstraction. Users of clouds like amazon or VPS providers will possibly never have to deal with deploying Linux on bare metal. As hybrid and private clouds are becoming common as well, many enterprise admins will also not have to deal with this kind of thing anymore, they will just log into a web interface and spin up 5 more apache vm's.
 
The newest two trends add even more abstraction: configuration management and the seemingly brand new (yet not new at all) containerization with tools like docker. Whenever a client asks us at [OlinData][1] to configure a Linux machine, our first action will be to set up [Puppet][2]. With our trusted library of well-functioning Puppet modules, that is very easy and will cost me less time then doing this manually.

For example with Puppet, I can install Apache on a new machine as simple as this:

    node 'web01.olindata.com' {
      include apache
      apache::vhost{ 'www.olindata.com':
        docroot => '/var/www/olindata'
      }
    }

Depending on the environment, I don't even have to log into the machine anymore. Deploying this code through Continuous Deployment tools like [Jenkins][3] will allow me to deploy my infrastructure code automatically as it passes the tests I set up.

### SysAdmin skills move up the stack ###

Even as we move toward higher levels of abstraction, ongoing Linux training is still highly valuable and desirable for admins today and will be well into the future. Knowing the fundamentals is key but as abstraction removes some of the old tasks, this requires sysadmins to move up further in the stack and enhance their skills in the higher level tools and practices. It is critical for a sysadmin to become familiar with the tools that enable these higher levels of abstraction. It pushes them to become more skilled in things like coding so that they can do more with these "new" tools. 
 
Will the need for low(er) level linux skills ever go away completely? Of course not. We still have many other uses for Linux then just the commodity server deployments. Also, people will still benefit hugely from knowing how to do lower level operations in their everyday work. On top of that, with demonstrable Linux skills on your resume, I (and many other employers with me) will always prefer you over candidates that don't have them. You never know when you need those low-level skills!


----------
![Walter Heck is CEO and Founder of Olindata, an open source training and consulting company based in The Netherlands.](http://www.linux.com/images/stories/41373/Walter-Heck.jpg)

Walter Heck is CEO and Founder of OlinData, an authorized Linux Foundation training partner. Here's a list of [scheduled official Linux Foundation courses by OlinData][4]. 

--------------------------------------------------------------------------------

via: http://www.linux.com/news/enterprise/systems-management/780956-linux-system-administration-skills-are-changing

原文作者：[Walter Heck][a]

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/59207
[1]:http://olindata.com/
[2]:http://puppetlabs.com/
[3]:http://jenkins.org/
[4]:http://www.olindata.com/training/upcoming?technology=295