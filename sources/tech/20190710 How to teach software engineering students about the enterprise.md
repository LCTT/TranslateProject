[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to teach software engineering students about the enterprise)
[#]: via: (https://opensource.com/article/19/7/enterprise-technology)
[#]: author: (Tomas Cerny https://opensource.com/users/tomcze)

How to teach software engineering students about the enterprise
======
Start with a solid foundation of polymorphism, object-oriented
programming, collections, lambda, and design patterns.
![Tall building with windows][1]

In this opinion article, you will find a set of suggestions for the inclusion of enterprise technology into software engineering courses. This piece goes through the difficulties that students face and proposes simplifications successfully used in the past. The continual advancement of enterprise technologies leads to a simplifying of the inclusion process in education.

In the coming years, one can expect that industry demand for experts who know the technology used in enterprise development processes and production systems will increase. Academic institutions are here to prepare experts and leaders for industry, and thus they should know the technologies being used.

It has been ten years since I taught my first software engineering course. Since then, I have taught this course every year. Many software engineering courses put emphasis on analysis and design from the abstract perspective, involving UML models and notations, and letting students develop software projects on their own.

However, in my course, I chose a harder path rooted in theory and practice. This path includes lectures and labs on enterprise Java technology. When we pinpoint where actual software engineering skills are needed, we can point to large and complex systems. How could you become a software engineer without being involved in the development of such a system?

For large systems, standard development technologies are no longer sufficient, since their constructs are too low-level to address the typical problems and situations in enterprise development. Moreover, why would someone build large systems from objects when we could involve components that are built for specific purposes? With objects, we are trying to reinvent the wheel of existing enterprise practice.

While there are many pros highlighted, frankly speaking, including enterprise technology in your coursework can turn a rather simple software engineering course into a quite difficult one, especially for the first few iterations.

### Unfamiliar territory

As long as we understand enterprise technology and standards, and have developed a larger system on our own, we are ready to include enterprise technologies into lectures. If we have not developed a large system before, we still can try to include the technology, but we must be ready to run through multiple examples and demos beforehand, and especially put it all together.

However, where do we start? I remember the times when early versions of enterprise Java were released with initial demos on hotel booking that seemed ideal for learning the technology, at least from an initial examination. The difficulties quickly became clear when students got stuck. The available tutorials with the documentation are not written for novice students and beginners; they are made for users who have already used similar technologies before.

### More than just Java

The first issue novices run into are related to running enterprise Java itself. Enterprise Java no longer needs only a Java virtual machine to run. Now, it needs a container and a web server compliant with the technology in order to use its many components.

Students of software engineering must suddenly assume the role of a system administrator to install a complex environment on their machines that requires further configuration. For many students who have never opened a terminal before, it becomes a tedious task just to prepare the needed environment.

Operating systems don’t always make it easy for novices, as not all terminals are as friendly as others. In the ideal case, students would need to reinstall their operating system to Linux, but that takes a software engineering course into a completely different level. Those who manage to install and configure the server are suddenly told that the server runs on a certain port. Perhaps the most breath-taking question to come from a student is, what is a port?

In such a case, the intent to deploy our first example takes another detour to explain networking, since we must connect to the enterprise system over the network. When we finally roll over operating systems and networking, student motivation is almost gone, and suddenly we face another challenge: where to store data?

Enterprise systems are all about big data, and one could barely imagine them without a database. However, it assumes that students not only know databases but also know to configure them to accept new connections. Our initial intention for a quick demo to students almost failed, as our software engineering efforts took multiple detours to get into our first demo.

When we finally got to a running demo, students wanted to update the demo and rerun it. They soon realized that the changes do not propagate to the running demo, and they need to blindly develop the code, and then redeploy it. This process takes up to a minute in some cases at school workstations.

At that point, students have lost most of their motivation and initial drive. And of all these efforts were just to run the initial demo, not to learn the technology itself.

In most cases, one has to further advise students about version control and [Maven][2], but we still have not gotten to the point of learning the various components needed to develop such systems. The initial great idea to expose students to enterprise technology thus changes into teaching them all the needed supportive materials.

This is simply too much work for a software engineering course to demonstrate component-based development. The actual fruit of the intention comes when students spent hours on configuration and setup, leaving not much space in the semester.

### Fixes for the problem

With recent technology example projects such as [kitchen-sink][3], we can find every piece of important technology applied in a single demo, which is great. From there, it is pretty straight-forward to cover topics on object-relational mapping and persistence, and session beans to handle business logic, as well as context and dependency injection, which very nicely correspond to the components and UML component diagrams commonly taught in software engineering courses.

While Java still promotes server-side user interface development, in many cases students reject the choice and prefer to go with [React][4] or [Angular][5] frameworks, which promote the need to cover XML bindings and JSON transformation.

Over the years of promoting enterprise technologies in my courses, I have experimented with many supportive instruments to reduce the initial efforts needed to learn and cover the introduction materials and deploy the first demo. Here’s what I found.

#### Back to the basics

Primarily, I must highlight that it is not possible to teach enterprise technology to immature students. It is much more important to teach such students polymorphism, object-oriented programming, collections, lambda, and design patterns so that they understand the primary design.

Why? Because otherwise, our students cannot become who we want them to be. In enterprise Java, great solutions are component-based, but in the background, they are full of polymorphism, patterns, and collections, and lacking a full understanding of these will yield significant issues in later design on real systems. Thus, it is better to exclude enterprise Java when students lack basics, and instead focus on the core skills, and possibly postpone the topic for a later course if allowed by the curriculum.

#### Primer courses

At my previous university, one of the new undergraduate programs perfected the curriculum with well-formed preceding courses. Students taking software engineering had covered all of the prerequisites, such as networks, operating systems, databases, and object-oriented programming, before starting the course. However, the mentioned curriculum was to prepare bachelors for industry needs, and thus theoretical coursework was not as emphasized.

#### Multimedia

One significant time reduction for the initial demo setup could be achieved through step-by-step video tutorials detailing each stage on how to run, debug, and redeploy it. This seems great, but often students want to install the demo on their personal machine, and it is simply hard to make a perfect tutorial prepared for all conditions that can be found on multiple operating systems. Students found videos very helpful, as they may perform the learning process when they choose. Skipping all the errors faced with the initial demo helps students keep their motivation and drive.

#### Virtual machines

Another significant improvement is to prepare a virtual image of the operating system, with a setup demo and environment for the students. In the simplest case, students only need to start their integrated development environment (IDE) and click a button to see the demo running. Later, they can install the demo in their own environment, but only after they have a running example in place and hands-on experience.

#### The right technology

My last semester, with a course on a slightly different topic, I came across a significant improvement, and perhaps something that changes enterprise development forever. Enterprise microservice architecture came recently as the answer to cloud-based demands.

Eclipse [MicroProfile][6] is perhaps the right ingredient to teach enterprise development. It allows developers to only include technologies that are needed for the particular application. The idea is to run an enterprise application from a JAR file that contains only the needed libraries. This practice allows running the application from outside of the container. One could see it as a configurable microcontainer that includes the minimum setup for your JAR and runs as a server. This is exactly what we need to simplify our coursework.

We no longer need to explain all of the technologies provided by enterprise containers, and can instead focus our attention on a much smaller set. This can bring us quickly to the point we want to make in academia. We can focus on teaching our students components, and skip the necessity of container knowledge and complicated redeploys.

While everyone loves standards, it seems that the [Spring][7] framework—a strong competitor to enterprise Java—predated the idea of running applications outside of a container almost by a decade. Thus, to get to the point in an academic environment, it might be the right way to go (on the other hand, such a choice sacrifices the standardized technology agreed upon by the main industry players).

### Next steps

What should we do for our next course? First, know who your audience is and whether they are mature enough to learn enterprise technology. A simple evaluation test can tell more. With a large class audience, you should consider including video tutorials. Otherwise, labs could turn into underprovisioned debugging sessions. With video tutorials used as homework, you make use of the time for lectures and labs more effectively and cover other important topics.

If you are expecting troubles with operating systems, consider making a virtual machine image, or prepare [Docker][8] images for particular pieces such as the database, etc. Most importantly, keep innovating since technologies come and leave, such as the [JRebel][9] (for hot deploying changes) academic license that is no longer available.

Fortunately, recent advancements in enterprise technologies bring simplifications, and learning technology will be easier for the next generations. In the end, we will be able to focus on the intended topics to take students in our intended direction. Nevertheless, starting with enterprise technology too early would be counterproductive, and no advancement can change that.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/enterprise-technology

作者：[Tomas Cerny][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tomcze
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/windows_building_sky_scale.jpg?itok=mH6CAX29 (Tall building with windows)
[2]: https://maven.apache.org/index.html
[3]: https://developers.redhat.com/quickstarts/eap/kitchensink/
[4]: https://reactjs.org/
[5]: https://angular.io/
[6]: https://microprofile.io/
[7]: https://spring.io/
[8]: https://www.docker.com/
[9]: https://jrebel.com/
