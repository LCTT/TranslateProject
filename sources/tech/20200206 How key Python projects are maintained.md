[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How key Python projects are maintained)
[#]: via: (https://opensource.com/article/20/2/python-maintained)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

How key Python projects are maintained
======
A peek behind the scenes of the community that keeps open source Python
projects running smoothly.
![and old computer and a new computer, representing migration to new software or hardware][1]

Jannis Leidel is part of the [Jazzband][2] community. Jazzband is a collaborative community that shares the responsibility of maintaining [Python][3]-based projects.

Jazzband was born out of the stress of maintaining an open source project alone for a longer time. Jannis is a roadie, which means he does administrative tasks and makes sure the people in the band can play when they want.

Jazzband is not his first open source volunteer work—he is a former [Django][4] core developer, [Django Software Foundation][5] board member, has written many Django apps and Python projects, has been a [pip][6] and [virtualenv][7] core developer and release manager, co-founded the [Python Packaging Authority][8], and been a [PyPI][9] admin. On the community front, he co-founded the German Django Association, served as [DjangoCon Europe][10] 2010 co-chairperson, has spoken at several conferences, and for the last year has served as a director and co-communication chair of the [Python Software Foundation][11].

### Moshe Zadka: How did you get started with programming?

Jannis Leidel: I got started with programming as part of the regular German computer science lessons in high school, where I dabbled with Turbo Pascal and Prolog. I quickly got drawn into the world of web development and wrote small websites with PHP3, [Perl5][12], and [MySQL][13]. Later at university, I picked up programming again while working on media arts projects and found [Ruby][14], Perl, and Python to be particularly helpful. I eventually stuck with Python for its versatility and ease of use. I'm very happy to have been able to use Python and open web technologies (HTML/JS/CSS) in my career since then.

### Zadka: How did you get started with open source?

Leidel: As part of an art project at university, I needed a way to talk to various web services and interact with some electronics and found my prior PHP skills not up to the task. So I took a class about programming with Python and got interested in learning more about how frameworks work—compared to libraries—as they further enshrine best practices that I wanted to know about. In particular, the nascent Django Web Framework really appealed to me since it favored a pragmatic approach and provided lots of guidance for how to develop web applications. In 2007 I participated as a student in the Google Summer of Code for Django and later contributed more to Django and its ecosystem of reusable components—after a while as a Django core developer as well. While finishing my degree, I was able to use those skills to work as a freelancer and also spend time on many different parts of the Django community. Moving laterally to the broader Python community was only natural at that point.

### Zadka: What do you for your day job?

Leidel: I'm a Staff Software Engineer at Mozilla, working on data tools for the Firefox data pipeline. In practice, that means I'm working in the broader Firefox Engineering team on various internal and public-facing web-based projects that help Mozilla employees and community members to make sense of the telemetry data that the Firefox web browser sends. Part of my current focus is maintaining our data analysis and visualization platform, which is based on the open source project [Redash][15], and also contributing back to it. Other projects that I contribute to are our next-gen telemetry system [Glean][16] and a tool that allows you to do data science in the browser (including the Scientific Python stack) called [Iodide][17].

### Zadka: How did you get involved with Jazzband?

Leidel: Back in 2015, I was frustrated with maintaining projects alone that a lot of people depended on and saw many of my community peers struggle with similar issues. I didn't know a good way to reach more people in the community who may also have an interest in long-term maintenance. On some occasions, I felt that the new "social coding" paradigm was rarely social and often rather isolating and sometimes even traumatic for old and new contributors. I believe the inequality in our community that I find intolerable nowadays was even more rampant at the time, which made providing a safe environment for contributors difficult—something which we now know is essential for stable project maintenance. I wondered if we were missing a more collaborative and inclusive approach to software development.

The Jazzband project was launched in an attempt to lower the barriers to entry for maintenance and simplify some of the more boring aspects of it (e.g., best practices around [CI][18]).

### Zadka: What is your favorite thing about Jazzband?

Leidel: My favorite thing about Jazzband is the fact that we've secured the maintenance of many projects that a lot of people depend on while also making sure that new contributors of any level of experience can join.

### Zadka: What is the job of a "roadie" in Jazzband?

Leidel: A "roadie" is a go-to person when it comes to all things behind the scenes for Jazzband. That means, for example, dealing with onboarding new projects, maintaining the Jazzband website that handles user management and project releases, acting as a first responder to security or Code of Conduct incidents, and much more. The term "roadies" is borrowed from the music and event industry for support personnel that takes care of almost everything that needs to be done while traveling on tour, except for the actual artistic performance. In Jazzband, they are there to make sure the members can work on the projects. That also means that some tasks are partially or fully automated, where it makes sense, and that best practices are applied to the majority of the Jazzband projects like packaging setup, documentation hosting or continuous integration.

### Zadka: What is the most challenging aspect of your job as a roadie for Jazzband?

Leidel: At the moment, the most challenging aspect of my job as a roadie is to implement improvements for Jazzband that community members have proposed without risking the workflow that they have come to rely on. In other words, scaling the project on a conceptual level has become more difficult the bigger Jazzband gets. There is a certain irony in the fact that I'm the only roadie at the moment and handle some of the tasks alone while Jazzband tries to prevent that from happening for its projects. This is a big concern for the future of Jazzband.

### Zadka: What would you say to someone who is wondering whether they should join Jazzband?

Leidel: If you're interested in joining a group of people who believe that working collaboratively is better than working alone, or if you have struggled with maintenance burden on your own and don't know how to proceed, consider joining Jazzband. It simplifies onboarding new contributors, provides a framework for disputes, and automates releases to [PyPI][19]. There are many best practices that work well for reducing the risk of projects becoming unmaintained.

### Zadka: Is there anything else you want to tell our readers?

Leidel: I encourage everyone working on open source projects to consider the people on the other side of the screen. Be empathetic and remember that your own experience may not be the experience of your peers. Understand that you are members of a global and diverse community, which requires us always to take leaps of respect for the differences between us.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/python-maintained

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q (and old computer and a new computer, representing migration to new software or hardware)
[2]: https://jazzband.co/
[3]: https://opensource.com/resources/python
[4]: https://opensource.com/article/18/8/django-framework
[5]: https://www.djangoproject.com/foundation/
[6]: https://opensource.com/article/19/11/python-pip-cheat-sheet
[7]: https://virtualenv.pypa.io/en/latest/
[8]: https://www.pypa.io/en/latest/
[9]: https://pypi.org/
[10]: https://djangocon.eu/
[11]: https://www.python.org/psf/
[12]: http://opensource.com/article/18/1/why-i-love-perl-5
[13]: https://opensource.com/life/16/10/all-things-open-interview-dave-stokes
[14]: http://opensource.com/business/16/4/save-development-time-and-effort-ruby
[15]: https://redash.io/
[16]: https://firefox-source-docs.mozilla.org/toolkit/components/telemetry/start/report-gecko-telemetry-in-glean.html
[17]: https://alpha.iodide.io/
[18]: https://opensource.com/article/19/12/cicd-resources
[19]: https://opensource.com/downloads/7-essential-pypi-libraries
