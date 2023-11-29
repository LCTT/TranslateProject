[#]: subject: "Microsoft is Locking Down Search for Public Code on GitHub"
[#]: via: "https://news.itsfoss.com/microsoft-github-open-source-code/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Microsoft is Locking Down Search for Public Code on GitHub
======
Microsoft, what are you up to with GitHub?
Many users were disappointed to realize [Microsoft acquired GitHub][1]. Of course, it was nothing something users could prevent.

So, some decided to move to GitLab or other [GitHub alternatives][2], while some decided to stay irrespective of how they felt.

GitHub is a familiar place for countless developers. No matter who owns it now, the platform has its benefits, which is why users still choose to use it as per their requirements.

Unfortunately, there have been certain changes to the platform only after Microsoft came to the scene, and some of them have been inconvenient. One of those changes (made back in June 2023) has come to the spotlight with a new discussion over it.

### Code Search Now Requires Log-in

A GitHub user/contributor [complained][3] that it is extremely disappointing to not being able to search for code in a public repository without logging in.

📋

Global code search across GitHub has been restricted to logged-in users for years now. This situation is regarding the in-repository search.

Here's what he had to say:

> This is revolting and an anathema to the open source movement. A movement, I might add, Microsoft is abusing here.
>
> We're told that this is for security... But what _possible_ point is there when I can simply clone the repository and use more dedicated tools for proper searching and analysis?
>
> So what possible reason is there?! Do you NOT have enough of our data? Is it not enough to monetize every bowel movement, you now feel the need to track which individual lines of code I'm browsing?

Furthermore, he explained the inconvenience of logging in to search code in his repository, which he wants accessible to the public without any hassle.

> I was on an older machine and needed to search for something in OUR OWN REPOSITORY and couldn't. I actually want people to be able to search our codebase.
>
> So what did I have to do? I tried logging in. Didn't have my password manager nearby. So I had to grab my phone. Oh! Now I need to 2FA. So back to my office to grab my Yubi key. The old laptop doesn't have USB-C ports? Well now I'm SOL.
>
> Not only is this change unncecessary, it's downright **hostile** towards your own customers. _Ambitiously_ hostile!

It is practically a big inconvenience to access a code repository that is supposed to be public and accessible to " **everyone** ".

That is how open-source code should be accessible, right?

Martin Woodward, the **VP of Developer Relations at GitHub** responded to the feedback by simply stating that this has been a change for a while, primarily to keep bots at bay.

> Sorry for the inconvenience [@koepnick][4] \- while searching across all repos has required being logged in for a long time, when we enhanced the search capabilities earlier in the 2023 we had to extend this to repos as well (see [https://github.blog/changelog/2023-06-07-code-search-now-requires-login/][5]).
>
> This is primarily to ensure we can support the load for developers on GitHub and help protect the servers from being overwhelmed by anonymous requests from bots etc.

Sure, that is an expected response from a big company. Unfortunately, it does not sound convincing as to why is that a change to GitHub while other platforms do not have this restriction in place.

The statement says more about "when this change was implemented".

Fortunately, [a member of the Code Search team][6] tried to chip in with the advantages they get with the restriction.

**TLDR: _It lets them reduce the abuse, but still does not stop all the bots._**

So, that makes us think, Microsoft, being a major player in the tech industry, does not have a capable infrastructure to ward off bots without restricting access to the code? Is there no other way to protect the code from bots and other malicious scrapers without disabling the search functionality?

Moreover, some users in the discussion pointed out that the whole point of open-source code is the intent of everyone accessing it, whether the identity is known or unknown.

Despite the open-source license associated with the code, the restriction makes it go against the concept of open-source.

_Is Microsoft secretly trying to chain the benefits of open-source on GitHub?_ 🤔

💬 _Maybe Microsoft needs to re-consider this change for the better? Or, perhaps come up with a better explanation than what the statement says?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/microsoft-github-open-source-code/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/microsoft-github/
[2]: https://itsfoss.com/github-alternatives/
[3]: https://github.com/orgs/community/discussions/77046
[4]: https://github.com/koepnick
[5]: https://github.blog/changelog/2023-06-07-code-search-now-requires-login/
[6]: https://github.com/orgs/community/discussions/77046#discussioncomment-7683240
