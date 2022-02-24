[#]: subject: "GitHub Wants Open-Source Contributors to Improve its Security Database"
[#]: via: "https://news.itsfoss.com/github-security-database-open-source/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GitHub Wants Open-Source Contributors to Improve its Security Database
======

GitHub Advisory Database is the largest database of vulnerabilities in software dependencies.

It also lets the repository managers/contributors privately discuss and fix a vulnerability before disclosing it to the database.

While it was useful at times, it did not have any inputs from the community, but only verified sources.

Now, to add more information to the database, and enhance the awareness of security advisories, GitHub made the database open to community contribution.

**In other words**, any open-source contributor can now add more information for a vulnerability, or share any other insight they have.

Ultimately, it should help improve the [state of open-source software security][1]. Let me highlight more details on it.

### Free and Open Security Data

With [GitHub opening its security database][2], the Advisory Database has been listed in a [new public repository][3] licensed under a Creative Commons license.

Overall, the available information on the existing Advisory Database and the new public repository (combined) should benefit the industry and the community.

The advisories in the repository use the Open Source Vulnerabilities (OSV) format to keep things convenient for all.

**Oliver Chang**, a software engineer for Google’s Open Source Security Team said:

>  “In order for vulnerability management in open source to scale, security advisories need to be broadly accessible and easily contributed to by all,” “OSV provides that capability.”

The availability of the security database and the ability for the community to contribute their insights/knowledge should enhance the information available.

### Contributing to Security Advisory

As of now, any open-source contributor can use a pull request to add information to the public repository of security advisories.

To get started, you need to navigate through the advisories listed, and then access the details. If you think, you can add more information about the vulnerability, you can hit “**Suggest improvements for this vulnerability**“.

![][4]

Here, you will get a form where you can add the necessary details and submit your improvement suggestions.

![][5]

The pull requests/additions will be reviewed by the maintainers of the project, and the security researchers from the GitHub Security lab. So, a pull request does not mean that the information will be added to the database, it is subject to approval.

### Community Support Essential for Securing Software Supply Chains

With the huge number of open-source software dependencies and tools, it only makes sense to involve everyone interested to improve the information available for security vulnerabilities.

Every tip and trick added to the database should help developers, repository maintainers, and others to secure their tools while also being able to help their users quickly mitigate it.

The more awareness and information about known vulnerabilities, the easier it is to fix or tackle them.

_After all, the open-source way should solve a lot of problems for open-source software security. What do you think?_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/github-security-database-open-source/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/open-source-software-security/
[2]: https://github.blog/2022-02-22-github-advisory-database-now-open-to-community-contributions/
[3]: https://github.com/github/advisory-database
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM3NCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxNyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
