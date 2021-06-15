[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 tips for making documentation a priority in open source projects)
[#]: via: (https://opensource.com/article/20/8/documentation-open-source-projects)
[#]: author: (Ray Paik https://opensource.com/users/rpaik)

5 tips for making documentation a priority in open source projects
======
Documentation is as important as code, so make sure you treat it that
way. Here's how.
![Files in a folder][1]

[Open source software][2] is now mainstream; long gone are the days when open source projects attracted developers alone. Nowadays, users across numerous industries are active consumers of open source software, and you can't expect everyone to know how to use the software just by reading the code.

Even for developers (including those with plenty of experience in other open source projects), good documentation serves as a valuable onboarding tool when people join a community. People who are interested in contributing to a project often start by working on documentation to get familiar with the project, the community, and the community workflow.

### Common challenges with documentation in open source

Although everyone agrees that documentation is important and needs to be done, some of the ways we do it result in poor quality and lack of consistency across different parts of documentation in the project. For example, when developers are too focused on code, they don't start working on documentation until the last minute (e.g., right before the release). And all too often, documentation tasks are done by volunteers, people who have a hard time saying "no." To make things worse, people may forget about the documentation after the release, so they never change or improve it, and the vicious cycle repeats.

### 5 best practices

We have been involved in documentation in a number of open source projects at [Linux Foundation Networking][3] and [GitLab][4] over the past few years. Below, we're sharing some things we've learned that we hope will help make documentation a first-class citizen in your open source project.

  1. **Value contributions to documentation just as much as code contributions:** A lot of the focus in many open source communities tends to be on code. One easy way to make sure documentation contributions are valued by everyone is to give equal credit to documentation and code in your community metrics. It should not matter whether a commit, merge request, or pull request is for code or documentation. In addition, when you do community recognition, include key accomplishments by the people who contribute to documentation.

  2. **Put documentation and code in the same project repo:** We highly recommend that a project's code and documentation both reside in the same repository. (A good way is to make `/doc` or `/docs` a top-level directory in the repository.) For one, this makes documentation easy for anyone to find. More importantly, your documentation will be on equal footing as code and other project resources when everything is in the same repository.

  3. **Make documentation a requirement for a merge or release milestone:** If your project has a lengthy release cycle (e.g., three to six months or more), we highly recommend having interim checkpoints for documentation (like this [example][5] from the ONAP community). This ensures documentation work is not put off until right before the release, and instead, everyone works on documentation throughout the release cycle. If it's feasible for your community, you could make documentation a required step for all code contributions that will impact users (see this [example][6] from GitLab).

  4. **Have a consistent contribution process for code and documentation:** We also recommend having a consistent contribution process and using the same toolchains for code and documentation. As we noted earlier, many new community members start contributing by working on documentation, as you often don't need deep technical knowledge of the software to get started. It's good for new contributors to onboard in the community by getting familiar with the contribution workflow and meeting other community members. If these new contributors later want to get involved in other parts of the project (including code), you want the toolchains and contribution process to be familiar. Otherwise, they will need to go through another onboarding process, which creates an unnecessary hurdle for contributors. If your code and documentation have different contribution processes, you may risk creating an impression that documentation is less than a first-class citizen compared to code.

  5. **Have well-documented processes for contributing to documentation:** This may seem obvious, but it's easy to neglect. Since documentation is a good entry point for new contributors, you want to lower the barrier to entry as much as possible. Having good documentation on the contribution workflow, how to get started, where to find issues to work on, how to get help, and more will go a long way to helping new contributors feel welcome and get involved in your community.




### What else?

Do you have other tips for making documentation a first-class citizen in open source communities? If so, please share them in the comments.

* * *

*This article is based on [Ensuring that documentation Is a first-class citizen in open source projects][7] *presented *at Open Source Summit North America in June 2020. *

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/documentation-open-source-projects

作者：[Ray Paik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rpaik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://opensource.com/resources/what-open-source
[3]: https://www.linuxfoundation.org/projects/networking/
[4]: https://about.gitlab.com/
[5]: https://wiki.onap.org/display/DW/Guilin+Documentation
[6]: https://docs.gitlab.com/ee/development/contributing/merge_request_workflow.html#definition-of-done
[7]: https://sched.co/c3SY
