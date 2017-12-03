Introducing security alerts on GitHub
====================================


Last month, we made it easier for you to keep track of the projects your code depends on with the dependency graph, currently supported in Javascript and Ruby. Today, for the over 75 percent of GitHub projects that have dependencies, we’re helping you do more than see those important projects. With your dependency graph enabled, we’ll now notify you when we detect a vulnerability in one of your dependencies and suggest known fixes from the GitHub community.

 [![Security Alerts & Suggested Fix](https://user-images.githubusercontent.com/594029/32851987-76c36e4a-c9eb-11e7-98fc-feb39fddaadb.gif)][1] 

### How to start using security alerts

Whether your projects are private or public, security alerts get vital vulnerability information to the right people on your team.

Enable your dependency graph

Public repositories will automatically have your dependency graph and security alerts enabled. For private repositories, you’ll need to opt in to security alerts in your repository settings or by allowing access in the Dependency graph section of your repository’s Insights tab.

Set notification preferences

When your dependency graph is enabled, admins will receive security alerts by default. Admins can also add teams or individuals as recipients for security alerts in the dependency graph settings.

Respond to alerts

When we notify you about a potential vulnerability, we’ll highlight any dependencies that we recommend updating. If a known safe version exists, we’ll select one using machine learning and publicly available data, and include it in our suggestion.

### Vulnerability coverage

Vulnerabilities that have [CVE IDs][2] (publicly disclosed vulnerabilities from the [National Vulnerability Database][3]) will be included in security alerts. However, not all vulnerabilities have CVE IDs—even many publicly disclosed vulnerabilities don't have them. We'll continue to get better at identifying vulnerabilities as our security data grows. For more help managing security issues, check out our [security partners in the GitHub Marketplace][4].

This is the next step in using the world’s largest collection of open source data to help you keep code safer and do your best work. The dependency graph and security alerts currently support Javascript and Ruby—with Python support coming in 2018.

[Learn more about security alerts][5]

--------------------------------------------------------------------------------

via: https://github.com/blog/2470-introducing-security-alerts-on-github

作者：[mijuhan  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/mijuhan
[1]:https://user-images.githubusercontent.com/594029/32851987-76c36e4a-c9eb-11e7-98fc-feb39fddaadb.gif
[2]:https://cve.mitre.org/
[3]:https://nvd.nist.gov/
[4]:https://github.com/marketplace/category/security
[5]:https://help.github.com/articles/about-security-alerts-for-vulnerable-dependencies/
