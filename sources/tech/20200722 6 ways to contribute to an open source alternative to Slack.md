[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 ways to contribute to an open source alternative to Slack)
[#]: via: (https://opensource.com/article/20/7/mattermost)
[#]: author: (Jason Blais https://opensource.com/users/jasonblais)

6 ways to contribute to an open source alternative to Slack
======
Join thousands who have contributed code, translations, documentation,
and more to Mattermost, an open source messaging platform.
![Chat bubbles][1]

[Mattermost][2] is a messaging platform built in Go and React for DevOps teams. You can discuss topics in channels, private groups, or one-to-one with rich [Markdown][3] formatting and easily share code snippets with syntax highlighting in more than 50 programming languages. You can self-host or deploy on a private cloud to connect in-house systems with plugins, Slack-compatible integrations, and extensive API support. And you can collaborate with your team using the [Linux desktop application][4].

![Mattermost user interface on Linux Desktop App][5]

(Mattermost, [CC BY-SA 4.0][6])

The platform's open source nature offers three direct benefits over proprietary messaging platforms like Slack, Microsoft Teams, and Discord:

  1. **No vendor lock-in:** With open source software, the code is available to everyone. Users, third-party vendors, and organizations have access to the code at all times, free of cost. Moreover, users get peace of mind with full control over their data, security, and infrastructure.
  2. **Stronger security:** With a large community of developers, security flaws are detected, fixed, and communicated quickly to all users, often before a flaw ships in the product. As highlighted in Red Hat's report on [The State of Enterprise Open Source][7], high-quality software and better security are top benefits of enterprise open source software.
  3. **Community-powered:** A growing community accelerates innovation by collaborating on problems, finding solutions, and creating new use cases, all leading to rapid feature development not possible with proprietary solutions. A thriving community is a force-multiplier for open source projects.



Mattermost is no different, and the community has been a major driving force behind the project. From the 100 most popular features to the 700,000-plus translations contributed to Mattermost, the open source community's impact on the project has been enormous. We've sent swag (such as a customized mug to all first-time contributors) to more than 1,000 contributors, and our [Contributor Wall of Fame][8] keeps growing every month.

If you are interested in contributing to open source, DevOps, or the Go and React technologies, consider joining the Mattermost community. We have [good first help-wanted issues][9] for new contributors, [contribution guidelines][10] to help get you started, and other resources at [developers.mattermost.com][11]. Moreover, you don't have to be a developer to contribute. You can help with translations, documentation, and more.

Interested in contributing to Mattermost? To make it easier to learn about all the ways to get involved with our community, we've gathered some information from our [Handbook][12], [Contribute page][13], [Security page][14], and more to help you get started.

### Platform

Build new features, improve existing ones, and fix bugs across the Mattermost platform. There are a variety of technologies and frameworks to choose from:

  * **Server:** Written in Go, includes the API, data model, logging, and more
  * **Webapp:** Written in React (JavaScript library), includes all components and actions of the Mattermost user interface 
  * **Mobile apps:** Written in React Native (JavaScript library), includes all components and actions of the mobile apps on iOS and Android
  * **Desktop apps:** Written on top of the Electron framework for Windows, macOS, and Linux clients
  * **Redux:** Written in JavaScript and TypeScript, includes storage, web utilities, and logic for webapp and React Native mobile clients



Contribute in four steps:

  1. Sign up to our Mattermost community site and join the Contributors channel for questions.
  2. Set up your developer environment by following our instructions. If you're working on mobile apps, you'll also need a mobile dev environment.
  3. Choose a [help-wanted ticket][15] and comment to let people know you're working on it. If there's no ticket for what you want to work on, follow the contributions without tickets process.
  4. Start developing! Check out our [developer flow][16] for tips, and review our [checklist for pull requests][17] when your changes are ready. If it's your first contribution, there is a standard contributor license agreement ([CLA][18]) to sign.



### Integrations

Create a host of technologies to empower Mattermost to solve real-world problems. These include:

  * **Self-hosted integration solutions:** Include connectivity and integration with third-party applications such as Jira, Jitsi, GitLab, Jenkins, and other tools
  * **SaaS-based integration solutions:** Include connectivity and integration with services like Twitter, Zendesk, Salesforce, and hundreds of other extensions with services like Zapier
  * **Federated experiences:** Include bridges with IRC, Slack, and other messaging applications through solutions like [Matterbridge][19]
  * **Programming solutions:** Include language-specific drivers and connectors to simplify the work of other developers
  * **Mattermost user-experience plugins:** Include server- and client-side plugins that enhance the native capabilities of a Mattermost server, such as voice, video, and screen sharing
  * **Custom user experiences:** Include integrations into Terminal like [Matterhorn][20] and [Pidgin][21] built off the same core [Mattermost APIs][22]



Contribute in four steps:

  1. Sign up to our Mattermost community site and join the [Developer Toolkit channel][23] for questions.
  2. Visit the Mattermost Integrations Directory for a current list of open source integrations and projects to get ideas on how to get started.
  3. Start developing! Read our [integrations guide][24] for tips on how to integrate with the Mattermost server.
  4. Have you built something for Mattermost? We want to hear about it! [Let us know here][25].



### Localization

Today, Mattermost ships in 16 languages, and 26 other languages are in progress by hundreds of contributors. If you're interested in translating, here's how to get involved:

  1. Sign up to our Mattermost community site and join the Localization channel for questions.
  2. Sign up to our translations server.
  3. Choose your language. If the language is already listed in the translations server, you can offer help by translating, reviewing, or making suggestions to existing strings. If it's not listed, ask in the Localization channel to set up your language.
  4. Start translating! Read our Localization documentation for more information on the translation rules and maintenance process.



### Documentation

Write software and troubleshooting documentation used by thousands of people across the world. These include:

  * **[Product documentation][26]:** Includes feature documentation for users and administrators, including troubleshooting notes and frequently asked questions
  * **[Developer documentation][11]:** Includes documentation for contributor and developer workflows, integrations, and extensions
  * **[API documentation][22]:** Includes documentation of the RESTful API used by the Mattermost platform



Contribute in three steps:

  1. Sign up to our Mattermost community site and join the [Documentation channel][27] for questions.
  2. Choose a [ticket][15] and comment to let people know you're working on it. See the [process][28] for contributing.
  3. Review our [documentation guidelines][29] for tips on how to create effective docs. Note that if it is your first pull request, you will be asked to sign a standard [CLA][18].



### Peer-to-peer support and feedback

Not a developer but still want to contribute to open source? No problem! In addition to localization and documentation mentioned above, you can:

  * **Report bugs:** Sign up to our Mattermost community site and join the [Bugs channel][30] for questions. Then, go to our [GitHub page][2] and open a new issue in the relevant repository. Read our docs on [steps for filing bugs][31].
  * **Test and find issues:** Go to our [community test server][32] or any of Mattermost's open source codebases to test and find issues. If you find a bug, go to our GitHub page and open a new issue in the relevant repository. Read our docs on [steps for filing bugs][31].
  * **Troubleshoot issues:** Sign up to our Mattermost community site and join the [Peer-to-Peer Help channel][33] to help answer questions. Follow questions in Mattermost [Forums][34] and GitHub Issues to help others.
  * **Suggest new features:** Sign up to our Mattermost community site and join the [Feature Proposals channel][35] to ask questions. Then, go to [Uservoice][36] to propose new features. Read our docs on [contributing feature proposals][37].
  * **Share feedback:** Sign up to our Mattermost community site and join the Peer-to-Peer Help channel to ask questions and share feedback about Mattermost.



### Security vulnerabilities

Safety and data security are top priorities for the Mattermost community. If you are a security researcher and discover a security vulnerability in our codebase, we appreciate your help in disclosing it to us in a responsible manner.

If the security bug you found is valid, the fix will be posted on our [Security Updates][38] page 30 days after its release, and you will be added to our [Security Research Hall of Fame][14]. If you'd like, we will publicly acknowledge your responsible disclosure. If not, you can remain anonymous.

Here's how to contribute through our [responsible disclosure policy][14]:

  1. Contact us to report any security vulnerabilities found in any of Mattermost's open source codebases or any of our commercial offerings.
  2. We will let you know if your report is reproducible as an exploit and results in a change to a Mattermost product's codebase or documentation.



After a fix is made, we ask security researchers to wait 30 days after a release before announcing the specific details of a vulnerability and to provide Mattermost with a link to any such announcements.

### Getting help

If you have any questions or need help getting started, join our [Mattermost Contributors channel][39]. You can reach me at @jason.blais. See you there!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/mattermost

作者：[Jason Blais][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jasonblais
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_communication_team.png?itok=CYfZ_gE7 (Chat bubbles)
[2]: https://github.com/mattermost
[3]: https://opensource.com/downloads/cheat-sheet-markdown
[4]: https://mattermost.com/download/#mattermostApps
[5]: https://opensource.com/sites/default/files/uploads/mattermostui.png (Mattermost user interface on Linux Desktop App)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://www.redhat.com/en/enterprise-open-source-report/2020
[8]: https://developers.mattermost.com/contribute/team_contributions/
[9]: https://github.com/mattermost/mattermost-server/issues?q=label%3A%22Help+Wanted%22+label%3A%22Good+First+Issue%22+label%3A%22Up+For+Grabs%22+is%3Aopen+is%3Aissue+
[10]: https://developers.mattermost.com/contribute/getting-started/
[11]: https://developers.mattermost.com/
[12]: https://handbook.mattermost.com/contributors/contributors/community
[13]: https://mattermost.com/contribute/
[14]: https://mattermost.com/security-vulnerability-report/
[15]: https://github.com/mattermost/mattermost-server/issues?q=is%3Aissue+is%3Aopen+label%3A%22Up+For+Grabs%22
[16]: https://developers.mattermost.com/contribute/server/developer-workflow/
[17]: https://developers.mattermost.com/contribute/getting-started/contribution-checklist/
[18]: https://www.mattermost.org/mattermost-contributor-agreement/
[19]: https://github.com/42wim/matterbridge
[20]: https://github.com/matterhorn-chat/matterhorn
[21]: https://github.com/EionRobb/purple-mattermost/
[22]: https://api.mattermost.com/
[23]: https://community.mattermost.com/core/channels/developer-toolkit
[24]: https://developers.mattermost.com/integrate/getting-started/
[25]: https://www.mattermost.org/share-your-mattermost-projects/
[26]: http://docs.mattermost.com/
[27]: https://community.mattermost.com/core/channels/documentation
[28]: https://github.com/mattermost/docs#contributing
[29]: https://handbook.mattermost.com/operations/operations/publishing/publishing-guidelines/voice-tone-and-writing-style-guidelines
[30]: https://community.mattermost.com/core/channels/bugs
[31]: https://www.mattermost.org/filing-issues/
[32]: https://rc.test.mattermost.com/
[33]: https://community.mattermost.com/core/channels/peer-to-peer-help
[34]: https://forum.mattermost.org/
[35]: https://community.mattermost.com/core/channels/feature-ideas
[36]: https://mattermost.uservoice.com/forums/306457-general
[37]: https://www.mattermost.org/feature-ideas/
[38]: https://mattermost.com/security-updates/
[39]: https://community-release.mattermost.com/core/channels/tickets
