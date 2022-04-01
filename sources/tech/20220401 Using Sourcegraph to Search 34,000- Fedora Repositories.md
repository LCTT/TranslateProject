[#]: subject: "Using Sourcegraph to Search 34,000+ Fedora Repositories"
[#]: via: "https://fedoramagazine.org/using-sourcegraph-to-search-34000-fedora-repositories/"
[#]: author: "Justin Dorfman https://fedoramagazine.org/author/jdorfman/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using Sourcegraph to Search 34,000+ Fedora Repositories
======

![][1]

Photo by [Markus Winkler][2] on [Unsplash][3]

In October 2021, a Fedora Linux user [asked a question about licensing][4]. Fedora Project Leader Matthew Miller [left a response][5]: “Since we don’t have a complete, exploded, searchable repository of all of the packages in Fedora, I don’t have a quick way to check.” 

[Followed by][6]: “…or possibly pay Sourcegraph to do it for us. They seem like nice people.” He is correct, we (Sourcegraph) _are_ nice people, but we don’t want your money. Instead, we wanted to team up with the Fedora community.

The Fedora Community can now search their universe of open source code—currently over 34,000 repositories and counting.

### Introduction to code search

For those who aren’t familiar with the concept of [code search][7], it enables teams to onboard to a new codebase and find answers faster, helps to identify security risks, and many other use cases. Sourcegraph has indexed over two-million repositories across multiple code hosts such as GitHub and GitLab. **This article is going to focus strictly on code search for _src.fedoraproject.org_.** Sourcegraph provides both a [web app][8] and [CLI][9] interface.

### Using the Web app

When using the Sourcegraph [web app][8] you will need to start each search with **repo:^src.fedoraprojects.org** before entering any search queries. Using this link to the [web app][8] will include this initial string as shown here:

![Sourcegraph web app interface][10]

The following sections will provide some web app examples of searches that might be of interest.

#### Find repositories using popular OSI-approved licenses 

The following query will scan all the repositories for software that is compatible with the “Open Source Definition” (OSD).

```

    repo:^src.fedoraproject.org/ lang:"RPM Spec" License: ^.*apache|bsd|gpl|lgpl|mit|mpl|cddl|epl.*$

```

![License search][11]

[Try it!][12]

#### Find files with TODOs

The following query can find TODOs in 34k repositories. This is great for those looking to contribute to projects that need help.

```

    repo:^src.fedoraproject.org/ "TODO"

```

![Search for TODO][13]

[Try it!][14]

#### Find files being served via FTP

A co-worker of mine from back in the day told me “FTP is a dead protocol”. Is it? You can add to this query to find any other protocol such as irc, https, etc.

```

    repo:^src.fedoraproject.org/ (?:ftp)://[A-Za-z0-9-]{0,63}(.[A-Za-z0-9-]{0,63})+(:d{1,4})?/*(/*[A-Za-z0-9-._]+/*)*(?.*)?(#.*)?

```

![Search for protocol][15]

[Try it!][16]

#### Find files with a vulnerable version of Log4j

This query will find any files that are possibly vulnerable (false positives can happen) to CVE-2021-44228 aka Log4j. You can also search for other vulnerabilities that can then be reported to project maintainers.

```

    repo:^src.fedoraproject.org/ org.apache.logging.log4j 2.((0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15)(.[0-9]+)) count:all

```

![Search for log4j][17]

[Try it!][18]

### Use the CLI

Sourcegraph also has a command-line interface tool called [src][19], which allows you to do everything I just mentioned above, plus other useful commands like getting results in JSON for programmatic consumption.

```

    src search -json 'repo:^src.fedoraproject.org/ lang:"RPM Spec" License: ^.*apache|bsd|g
    pl|lgpl|mit|mpl|cddl|epl.*$'

```

#### JSON output

![JSON output][20]

[Try it!][21]

### Search Syntax

The examples shown may be a good starting point but are by no means the only queries that may be made. You can [view all search query syntaxes][22] and create your own as needed.

### Conclusion

As you can see, with Sourcegraph, the Fedora Linux community can now quickly search for all code hosted at [src.fedoraproject.org][23], regardless of whether they are literal or complex regex queries.

I appreciate the Fedora Linux community being so helpful and welcoming. If you have anything you want to add or questions, my team and I will be in the comments section below. You can also [join us on Slack][24].

Special thanks to [Vanesa Ortiz][25] for [making this collaboration happen][26], [Ben Venker][27] for his help fixing my broken regex (multiple times), as well as [Rebecca Dodd][28] and [Nick Moore][29] for their help with editing.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-sourcegraph-to-search-34000-fedora-repositories/

作者：[Justin Dorfman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jdorfman/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/03/sourcegraph-816x345.jpg
[2]: https://unsplash.com/@markuswinkler?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/magnifying-glass?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/thread/CBCJHOSP36YXQKCVGWVL5MXU64LZ6NZA/
[5]: https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/message/LTIQS2PX33FSCEIAPJS62UZXVPDT5JPB/
[6]: https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/message/5GEPBSRGUK5E2FLW4MQBVP6DI65XP2LQ/
[7]: https://codesearchguide.org/
[8]: https://sourcegraph.com/search?q=context:global+repo:%5Esrc.fedoraproject.org/&patternType=regexp
[9]: https://docs.sourcegraph.com/cli/quickstart
[10]: https://fedoramagazine.org/wp-content/uploads/2022/03/Image-2022-03-28-at-1.41.54-PM-1024x335.png
[11]: https://fedoramagazine.org/wp-content/uploads/2022/03/license-1024x513.png
[12]: https://sourcegraph.com/search?q=context:global+repo:%5Esrc.fedoraproject.org/+lang:%22RPM+Spec%22+License:+%5E.*apache%7Cbsd%7Cgpl%7Clgpl%7Cmit%7Cmpl%7Ccddl%7Cepl.*%24&patternType=regexp
[13]: https://fedoramagazine.org/wp-content/uploads/2022/03/todo-1024x605.png
[14]: https://sourcegraph.com/search?q=context:global+repo:%5Esrc.fedoraproject.org/+%22TODO%22&patternType=regexp&case=yes
[15]: https://fedoramagazine.org/wp-content/uploads/2022/03/protocol-1024x457.png
[16]: https://sourcegraph.com/search?q=context:global+repo:%5Esrc.fedoraproject.org/+%28%3F:ftp%29:%5C/%5C/%5BA-Za-z0-9%5C-%5D%7B0%2C63%7D%28%5C.%5BA-Za-z0-9%5C-%5D%7B0%2C63%7D%29%2B%28:%5Cd%7B1%2C4%7D%29%3F%5C/*%28%5C/*%5BA-Za-z0-9%5C-._%5D%2B%5C/*%29*%28%5C%3F.*%29%3F%28%23.*%29%3F&patternType=regexp
[17]: https://fedoramagazine.org/wp-content/uploads/2022/03/log4j-1024x295.png
[18]: https://sourcegraph.com/search?q=context:global+repo:%5Esrc.fedoraproject.org/+org%5C.apache%5C.logging%5C.log4j+2.%28%280%7C1%7C2%7C3%7C4%7C5%7C6%7C7%7C8%7C9%7C10%7C11%7C12%7C13%7C14%7C15%29%28%5C.%5B0-9%5D%2B%29%29+count:all&patternType=regexp
[19]: https://github.com/sourcegraph/src-cli#readme
[20]: https://fedoramagazine.org/wp-content/uploads/2022/03/Image-2022-03-22-at-9.46.26-AM-1024x521.png
[21]: https://sourcegraph.com/notebooks/Tm90ZWJvb2s6MzQ2
[22]: https://docs.sourcegraph.com/code_search/reference/queries
[23]: https://src.fedoraproject.org/
[24]: https://srcgr.ph/wp-join-community-space
[25]: https://twitter.com/vanesacodes
[26]: https://discussion.fedoraproject.org/t/fedora-sourcegraph-marketing-community-collaboration/36151
[27]: https://handbook.sourcegraph.com/team/#ben-venker
[28]: https://handbook.sourcegraph.com/team/#rebecca-dodd
[29]: https://twitter.com/nickwritesit
