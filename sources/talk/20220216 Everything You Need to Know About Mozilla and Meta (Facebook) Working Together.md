[#]: subject: "Everything You Need to Know About Mozilla and Meta (Facebook) Working Together"
[#]: via: "https://news.itsfoss.com/mozilla-meta-facebook/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Everything You Need to Know About Mozilla and Meta (Facebook) Working Together
======

I’m sure it is easy to make several assumptions about the story going by the headlines.

_Why?_

Well, it is **Facebook**, after all.

Even if it is “**Meta**” now, it does not change the fact that they were involved in some of the worst privacy practices ever.

If you think twice, Facebook isn’t an ideal privacy-focused social media platform (even though I still use it for certain use-cases).

_With so much more to complain about, how come a privacy-focused company “Mozilla” end up working with Meta (Facebook)?_

Surprisingly, Mozilla made several remarks about Facebook’s bad privacy practices in the past.

Not to forget, Mozilla Firefox was one of the first web browsers to prevent companies like Facebook from tracking users thanks to [total cookie protection][1] and some other technologies.

Furthermore, they recently started a study collaborating with **The Markup** to analyze the type of information Facebook collects.

So, why are they working with Facebook now?

### Privacy-Preserving Attribution Using IPA

Mozilla revealed in a [blog post][2] that it has been working with a team from Meta on a new proposal about a privacy-respecting attribution.

Attribution in advertising lets the advertisers/marketers know if their ad campaigns are performing as expected.

And, Mozilla plans to introduce **Interoperable Private Attribution** (or IPA) to give advertisers the ability to check insights while making the advertising privacy-friendly.

### How Does IPA Aim to Make Advertising Privacy-Friendly?

Mozilla is utilizing its expertise with its existing privacy-preserving telemetry technology, [Prio][3].

While that sounds promising, how does IPA work?

As described in the blog post, Mozilla says that IPA offers two privacy-preserving features:

  * It uses Multi-party Computation (MPC) to prevent a single entity (browser, advertisers, or websites) to learn about user behavior.
  * Instead of individual results linking to a track/profile users, IPA is an aggregated system that does not link back anything to individual users.



Technically, they plan to use “match keys” that are different from cookies but can be used across different browsers/devices to be able to generate useful reports.

These match keys will help produce summary statistics about the ad interaction events (whether it is clicked, seen, and if it made a conversion).

As per the proposal, the match keys would be writable but not readable, making it a critical component of the privacy properties in IPA.

### Is This Useful?

Taking a good look at its [proposal][4], it is safe to say that it sounds promising.

Considering ad revenue is still the major fuel for most businesses, it only makes sense to make it privacy-friendly and less intrusive.

The result could simply bring back the good old days when users weren’t worried about advertising but curious about what they see in them.

Unlike [Google’s FLoC][5], this can create a win-win scenario for both advertisers and the users as well.

### How Does Meta Fit in the Picture?

![][6]

I am really not sure about this.

I have no intention of making ill-informed remarks about the technology proposed by Mozilla, collaborating with Meta.

On the other hand, I can’t be confident about it, considering they chose “Meta” to collaborate on something that is important to improve the advertising industry without harming user privacy.

### Mozilla, What Are You Hiding?

I’m not stirring up controversy (or a wild theory).

But, a transparent, and privacy-respecting company just decided to collaborate with a company that isn’t really known for privacy?

Isn’t it too obvious that the team at Mozilla already knows this?

And, they still decided to go ahead with it, without any transparent public communication on their social media channels as well.

Yes, they did publish the blog post, but it wasn’t promoted, considering it is an important proposal affecting almost every industry on the web.

_Is it safe to assume that Mozilla no longer cares about its userbase with this move?_

_It’s totally up for discussion in the comments down below!_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/mozilla-meta-facebook/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/firefox-86-release/
[2]: https://blog.mozilla.org/en/mozilla/privacy-preserving-attribution-for-advertising/
[3]: https://crypto.stanford.edu/prio/
[4]: https://docs.google.com/document/d/1KpdSKD8-Rn0bWPTu4UtK54ks0yv2j22pA5SrAD9av4s/edit
[5]: https://techcrunch.com/2022/01/25/google-kills-off-floc-replaces-it-with-topics/
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
