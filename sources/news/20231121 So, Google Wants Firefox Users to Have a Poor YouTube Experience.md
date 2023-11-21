[#]: subject: "So, Google Wants Firefox Users to Have a Poor YouTube Experience?"
[#]: via: "https://news.itsfoss.com/youtube-firefox/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

So, Google Wants Firefox Users to Have a Poor YouTube Experience?
======
YouTube loads up slower on Firefox, just because Google wants it to or
not?
It has been just over a month since [Mozilla announced that they are collaborating with Google's web services][1] team to improve the user experience.

And, now, we are learning of an interesting phenomenon.

YouTube seems to be loading slower for Firefox users compared to Chrome 🤯

Wait, what? Is that a deliberate thing, or is Chrome a better browser even if [Firefox is one of the best browsers][2]? Let me highlight all about what's happening here.

### YouTube Pushing Monetization Aggressively

It is no surprise that recently YouTube has been encouraging everyone to allow advertisements or subscribe to YouTube premium.

Of course, with the increase in adblocker options and privacy-focused browsers blocking the ads by default, the ad revenue must have bled significantly.

While all of that is a business side of things, deliberately breaking the YouTube experience for Firefox users, should that be even a thing?

Well, as per numerous Redditors ([1][3], [2][4]), whenever you try to access YouTube videos as a Firefox user, the **webpage adds a five-second delay**. And, right after you change the user agent using developer tweaks or change the browser, the delay is not observed.

![Source: r/firefox][5]

Of course, all the users are not making things up. They must have faced the issue.

I tried to reproduce the issue with uBlock Origin extension enabled and disabled, but YouTube worked fine for me. You can try the [solution mentioned by uBlock][6], adding a filter to bypass the delay if you face it.

If you are curious, a [Redditor][7] set out to point out to a code in a [JavaScript file][8] (polymer js) where they added a five-second delay:

```

    setTimeout(function(){c();a.resolve(1)},5E3);

```

You can check for yourself. But, we are not sure if this is specifically for Firefox.

To this fiasco, YouTube has provided a statement to [AndroidAuthority][9] where they say:

> _**To support a diverse ecosystem of creators globally and allow billions to access their favorite content on YouTube, we’ve launched an effort to urge viewers with ad blockers enabled to allow ads on YouTube or try YouTube Premium for an ad free experience. Users who have ad blockers installed may experience suboptimal viewing, regardless of the browser they are using.**_

Honestly, this statement sounds more like " _we can neither confirm or deny that this piece code targets Firefox users_ ". **I do not claim anything, either.**

In a nutshell, YouTube means to say that this issue only affects users with adblockers. And, if that is the case, why were the Redditors able to bypass this issue by changing the user agent?

Pretty confusing, isn't it? (or is it supposed to be?)

### Polymer JavaScript, Ring a Bell?

Interestingly, [TechRadar][10] reported in 2018 that Mozilla's Technical Program Manager accused Google's YouTube redesign making the performance worse for Firefox users.

And, the highlight of the YouTube redesign back then was **Google's Polymer technology**.

The code that the Redditors pointed out exists in one of the files for that same tech used in YouTube's webpage. Coincidence?

Or, is it that Google has always been hard at work to cleverly dial down the user experience on the competitor browsers like Firefox? 🤦

### Google Being Google

Google and its products are constantly in the line of fire when it comes to anticompetitive behavior, privacy, or user-conflicting changes.

Considering YouTube is a major platform, and it can genuinely encourage users unaware to switch from Firefox to Chrome if they face such an issue.

**Suggested Read** 📖

![][11]

Despite all of that, I suggest you should give [Firefox a try][12] for its strong privacy-focused features.

_💬 What do you think of this event? Share your thoughts in the comments below._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/youtube-firefox/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/mozilla-firefox-progress/
[2]: https://itsfoss.com/best-browsers-ubuntu-linux/
[3]: https://www.reddit.com/r/firefox/comments/17ywbjj/comment/k9w3ei4/?context=3
[4]: https://www.reddit.com/r/youtube/comments/17z8hsz/youtube_has_started_to_artificially_slow_down/
[5]: https://news.itsfoss.com/content/images/2023/11/firefox-reddit-1.png
[6]: https://old.reddit.com/r/uBlockOrigin/comments/17tm9rp/youtube_antiadblock_and_ads_november_12_2023_mega/k9i62zu/
[7]: https://www.reddit.com/user/vk6_/
[8]: https://www.youtube.com/s/desktop/96766c85/jsbin/desktop_polymer_enable_wil_icons.vflset/desktop_polymer_enable_wil_icons.js
[9]: https://www.androidauthority.com/youtube-reportedly-slowing-down-videos-firefox-3387206/
[10]: https://www.techradar.com/news/mozilla-claims-google-has-made-youtube-perform-worse-on-edge-and-firefox
[11]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[12]: https://news.itsfoss.com/why-mozilla-firefox/
