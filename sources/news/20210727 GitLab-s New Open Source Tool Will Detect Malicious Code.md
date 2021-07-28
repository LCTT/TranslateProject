[#]: subject: (GitLab’s New Open Source Tool Will Detect Malicious Code)
[#]: via: (https://news.itsfoss.com/gitlab-open-source-tool-malicious-code/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

GitLab’s New Open Source Tool Will Detect Malicious Code
======

There are several open-source tools available for security researchers. Now, GitLab has introduced a new one to the arsenal that lets you detect malicious code in dependencies.

The tool is also known as “Package Hunter” and is an important addition that could help secure every type of software.

### What is Package Hunter?

Every software includes some form of dependencies, which makes it possible for a developer to quickly build an app.

While this facilitates the reuse of code to achieve the task, they often just “trust” the dependencies used without separate review.

Package Hunter comes to the rescue here and lets you easily detect malicious code in a dependency package.

### Enhanching Software Supply Chain Security

Many supply chain attacks involve a compromised dependency package.

Normally, the attacker injects malicious code in the dependency code available to the public or creates a separate private repository to distribute the malicious dependency that looks safe.

Even if you are using a package manager to get trusted packages, it can be tricked to download packages from a private repository. And, you will have no idea about it.

Hence, with an additional check to the supply chain which is as convenient as Package Hunter, the software supply chain security should improve.

And, especially, if the open-source supply chain security improves, [open source software security][1] will gradually get a boost as well.

### How Does it Work? How Can You Get it?

Package Hunter scans for malicious code and keeps an eye on unexpected behavior of the dependencies.

It installs the dependencies in a sandbox environment to monitor and detect any anomalies.

As of now, it supports testing NodeJS modules and Ruby Jems.

GitLab has been using the tool internally for a while. And, now, it seamlessly integrates with GitLab.

You can learn more about setting it up by referring to the [official documentation][2] and the [Package Hunter CLI instructions][3].

It is available as a free and open-source project on [GitLab][4].

_What do you think about GitLab’s open-source tool to help detect malicious code? Feel free to share your thoughts in the comments below._

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gitlab-open-source-tool-malicious-code/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/open-source-software-security/
[2]: https://gitlab.com/gitlab-org/security-products/package-hunter/-/blob/main/README.md
[3]: https://gitlab.com/gitlab-org/security-products/package-hunter-cli/-/blob/main/README.md#gitlab-ci
[4]: https://gitlab.com/gitlab-org/security-products/package-hunter/activity
