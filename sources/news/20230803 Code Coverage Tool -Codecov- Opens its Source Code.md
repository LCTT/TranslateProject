[#]: subject: "Code Coverage Tool 'Codecov' Opens its Source Code"
[#]: via: "https://news.itsfoss.com/codecov-open-source/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Code Coverage Tool 'Codecov' Opens its Source Code
======
Codecov platform has opened its source code to public.
Codecov is a platform for developers and organizations who want valuable insights into their code to quickly test things and let them conveniently investigate the code while saving some time.

It blends in with a developer's workflow, integrating via Slack, keeping up with GitHub checks, pull requests, and lots more.

The platform completed a total overhaul of all its products at the end of 2022, when the founders decided to make it open-source.

So, with this change, you can expect **Codecov's core repositories to be open** and find a **new self-hosted repo** that will let you run Codecov.

🚧

They have decided to stick to the [BUSL license][1], which is not an approved OSI Open Source license but makes sense to their business.

In other words, you can view the source code, contribute to it, download it, and run it yourself.

### Codecov Inviting Contributions

![Official image showing Codecov's platform][2]

As part of the process, [Codecov's][3] repositories that will now be open-source include the following:

  * [codecov-api][4]: Codecov's API layer
  * [worker][5]: Codecov's asynchronous task processing layer
  * [gazebo][6]: Front-end application for end-users
  * [shared][7]: shared functions and classes
  * [self-hosted][8]: host Codecov with Docker compose



Considering it is hosted on GitHub, you can check it out to explore them better. You can contribute to all the repositories mentioned above per their contribution guidelines.

Regarding the self-hosted repo, Codecov shared more details in the announcement post:

> We will provide an [open source repository containing a Docker Compose orchestration][8] of our service for anyone to clone and use. This repository will be intended for low volume and proof-of-concept style deployments of Codecov. We will also offer support for organizations that opt to deploy self-hosted Codecov in this way.

Not to forget, you can also open issues and submit feedback.

In addition to the repositories and the ability for the community to self-host, Codecov's planning and project management decisions will also be made public by utilizing GitHub projects soon.

It is essential to know that if you want reliable deployment of Codecov with support options, Codevov's cloud offering is recommended. Of course, it depends on your use case and if you need any expert support options for your deployment.

Unlike some other self-hosted offerings that do not get regularly updated, Codecov interestingly promised the following:

> Internally, Codecov uses a continuous deployment approach to update production. We will use this same approach to keep our self-hosted images up to date in a rolling release style.

So, you can also expect the latest releases for self-hosting, which is a good thing.

_💬 What do you think about Codecov's open-source shift? Do you think the license is an issue for you? Share your thoughts in the comments._

* * *

### More from It's FOSS...

  * Learn Bash scripting for FREE with this [Bash Tutorial series][9].
  * Join our [community forum][10].
  * 📩 Stay updated with the latest on Linux and Open Source. Get our [weekly Newsletter][11].



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/codecov-open-source/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://spdx.org/licenses/BUSL-1.1.html?ref=news.itsfoss.com
[2]: https://news.itsfoss.com/content/images/2023/08/source-code-coverage-codecov.png
[3]: https://about.codecov.io/?ref=news.itsfoss.com
[4]: https://github.com/codecov/codecov-api?ref=news.itsfoss.com
[5]: https://github.com/codecov/worker?ref=news.itsfoss.com
[6]: https://github.com/codecov/gazebo?ref=news.itsfoss.com
[7]: https://github.com/codecov/shared?ref=news.itsfoss.com
[8]: https://github.com/codecov/self-hosted?ref=news.itsfoss.com
[9]: https://linuxhandbook.com/tag/bash-beginner/
[10]: https://itsfoss.community/
[11]: https://itsfoss.com/newsletter/
