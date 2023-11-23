[#]: subject: "An Interesting CMS With Version Control is Now Open-Source!"
[#]: via: "https://news.itsfoss.com/tinacms-open-source/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

An Interesting CMS With Version Control is Now Open-Source!
======
Welcoming another project to the open-source world!
Another one joins the [open-source CMS][1] club! With a recent announcement, **TinaCMS has gone completely open-source** , and is now **easier to self-host**.

If you are not familiar, a CMS (content management system) is a handy way of managing the content of a website; some popular names include **WordPress** , **Ghost** and **Joomla**.

In the case of [TinaCMS][2], it is a [headless CMS][3] that features support for the Git version control system, with a focus on being code-first and fully typed. A couple of popular companies like Unity utilize it to maintain their documentation 🤯

Without further ado, let's dive into this.

**Suggested Read** 📖

![][4]

### TinaCMS: What to Expect?

![][5]

Building on the work they did on the first release of their self-hosted TinaCMS backend, the developers have now made TinaCMS completely open-source, available under the [Apache 2.0 license][6].

Earlier, **the self-hosted backend was offered under a “source available” license.** But, as we have seen in the past, it can turn out to be limiting in certain cases. The updated license should now more accurately reflect the open-source nature of TinaCMS.

James O'Halloran from TinaCMS also added that:

> While this was a very permissive license, we still want developers to feel comfortable building on TinaCMS without fearing that they'll hit a ceiling.

More power to the developers if you ask me! 😄

![][7]

Seeing that, would you be **interested in deploying your own TinaCMS instance?**

If yes, then there are two main ways of self-hosting TinaCMS.

The first one is the most straightforward, with the developers also showcasing a demo for it. It is via a [GitHub][8]/[Vercel][9] implementation that can be built in a matter of minutes.

You can see for yourself. 👇

📋

You can access the self-hosted demo on [GitHub][10].

The other way is to **deploy it on other platforms** , the **self-hosted version of TinaCMS does not require Vercel** , it can be used with any [framework supported by TinaCMS][11].

You just have to **make sure that your platform supports express request handlers** so that the backend API can function properly.

For additional information regarding deployment, I suggest that you visit the [official documentation][12].

You may also through the official [announcement blog][13] to dive deeper.

_💬 This year has seen plenty of projects being made open-source. Which ones do you think should be made open next?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/tinacms-open-source/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/open-source-cms/
[2]: https://tina.io/
[3]: https://en.wikipedia.org/wiki/Headless_content_management_system
[4]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[5]: https://news.itsfoss.com/content/images/2023/11/TinaCMS.png
[6]: https://www.apache.org/licenses/LICENSE-2.0
[7]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[8]: https://github.com/
[9]: https://vercel.com/
[10]: https://github.com/tinacms/tina-self-hosted-demo
[11]: https://tina.io/docs/integration/frameworks/
[12]: https://tina.io/docs/self-hosted/overview/
[13]: https://tina.io/blog/Tinacms-is-now-fully-open-source/
