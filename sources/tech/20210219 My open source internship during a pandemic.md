[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My open source internship during a pandemic)
[#]: via: (https://opensource.com/article/21/2/python-pulp-internship)
[#]: author: (Gerrod Ubben https://opensource.com/users/gerrod-ubben)

My open source internship during a pandemic
======
Working remotely during my summer internship didn't hinder my ability to
contribute my Python skills or learn new capabilities.
![Looking at a map for career journey][1]

In May 2020, in the early months of the coronavirus pandemic, I started a summer internship with Red Hat. COVID-19 had cut short my third year studying computer engineering at Georgia Tech, and I learned I would have to work remotely all summer. I wasn't sure what to expect from a virtual internship.

This was my second internship but my first time working completely remotely. I adjusted quickly to the new virtual environment—I think having so little experience in a physical workspace helped me. The hardest part of working remotely was knowing when to stop working and call it a day. It was easy to get wrapped up in my work, write another line of code, and just finish one more task. However, I will say that I didn't miss the commute.

I spent my internship working on the Pulp team. [Pulp][2] is a platform for managing repositories of software packages and making them available to many consumers. Pulp can mirror all or part of a repository locally, host software packages in repositories, and manage many types of content from multiple sources in one place. To manage a certain type of content with Pulp, you just add a content plugin to it.

### Bringing the Pulp Python plugin up to date

Since Pulp 3's release in December 2019, the Pulp community has been working on a rapid stream of releases. In my internship, I was focused on bringing the Pulp Python plugin up to date and adding functionality so that the Pulp Python plugin could mirror the entire [PyPI][3] repository, which is huge with thousands of packages. While this was technically possible before, it was extremely time-consuming and required a huge volume of requests to PyPI's servers, which isn't practical.

I was mentored by Pulp engineers Daniel Alley, Dennis Kliban, and Grant Gainey. As we looked at how to approach the problem, Daniel suggested that the Pulp plugin should interact with Python's repository-mirroring software, [Bandersnatch][4].

However, nothing worth doing is ever that easy. The Bandersnatch API required some updates to work with Pulp's Python plugin. Daniel opened a conversation with the Bandersnatch community and explained what we intended to do. They were very receptive to our ideas and very willing to broaden the code so that it could be more widely used. So, I ended up contributing to both Pulp Python and Bandersnatch so that the Pulp Python plugin could take advantage of the Bandersnatch filtering toolset.

Now that this work is complete, you can use the Pulp Python plugin to mirror the entire PyPI in just over an hour. With the Pulp team's contributions to Bandersnatch, it should also be possible to use the Bandersnatch API to mirror Python content from sources other than PyPI (including Pulp itself).

### Working across communities

From working in both the Pulp and the Python Bandersnatch communities, I learned that every open source community does things differently. It is important to understand each open source community's preferred methods for issue tracking, testing, commit messages, pull requests, and changelog submissions. I also learned that in any community you're working with, understanding its members and their goals is crucial in getting work done that benefits everyone.

The latest version of the Pulp Python plugin is available with Pulp 3.9 and higher. You can check out all of its features and how to use them through the [documentation][5]. If you'd like to try it out, Pulp Python can be [installed][6] from [PyPI][7] or [source][8]. Client bindings for [Python][9] and [Ruby][10] are also available.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/python-pulp-internship

作者：[Gerrod Ubben][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gerrod-ubben
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/career_journey_road_gps_path_map_520.png?itok=PpL6jJgY (Looking at a map for career journey)
[2]: https://opensource.com/article/20/8/manage-repositories-pulp
[3]: https://pypi.org/
[4]: https://pypi.org/project/bandersnatch/
[5]: https://pulp-python.readthedocs.io/en/latest/
[6]: https://pulp-python.readthedocs.io/en/latest/installation.html
[7]: https://pypi.org/project/pulp-python/
[8]: https://github.com/pulp/pulp_python/
[9]: https://pypi.org/project/pulp-python-client/3.0.0/
[10]: https://rubygems.org/gems/pulp_python_client/versions/3.0.0
