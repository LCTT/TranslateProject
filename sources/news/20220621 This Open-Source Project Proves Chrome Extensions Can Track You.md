[#]: subject: "This Open-Source Project Proves Chrome Extensions Can Track You"
[#]: via: "https://news.itsfoss.com/chrome-extension-tracking/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

This Open-Source Project Proves Chrome Extensions Can Track You
======
Is this a reason to ditch Chromium-based browsers and start using Firefox? Maybe, you decide.

![chrome extension tracker][1]

Even with all the privacy extensions and fancy protection features, there are still ways to identify you or track you.

Note that it is not the case for all browsers, here, we focus on Chromium-based browsers and Google Chrome as the prime suspect.

While detecting installed extensions in a Chromium browser was already possible, numerous extensions implemented certain protections to prevent it.

However, a security researcher, also known as  “**z0ccc**”, discovered a new method to detect installed Chrome browser extensions, which can be further used to track you through browser fingerprinting.

**In case you did not know**: Browser fingerprinting refers to the tracking method where various information about your device/browser gets collected to create a unique fingerprint ID (hash) to identify you across the internet. Information like browser name, version, operating system, extensions installed, screen resolution, and similar technical data.

It sounds like a harmless data collection technique, but you can be tracked online with this tracking method.

### Detecting Google Chrome Extensions 

The researcher shared an open-source project “**Extension Fingerprints**” which you can use to test if Chrome extensions installed on your browser are being detected.

The new technique involves a time-difference method where the tool compares the time to fetch resources for the extensions. A protected extension takes more time to fetch compared to other extensions not installed on your browser. So, that helps identify some extensions from the list of over 1000 extensions.

The point is—even with all the advancements and techniques to prevent tracking, extensions from the Google Web Store can be detected.

![][2]

And, with the installed extensions detected, you can be tracked online using browser fingerprinting.

Surprisingly, even if you have extensions like **uBlocker, AdBlocker,**or**Privacy Badger** (some popular privacy-focused extensions), they all get detected using this method.

You can explore all the technical details on its [GitHub page][3]. And, if you want to test it yourself, head to its [Extension Fingerprints site][4] to check for yourself.

### Firefox To The Rescue?

It seems like it, considering [I keep coming back to Firefox][5] for various reasons.

The discovered method should work with all the Chromium-based browsers. I tested it with Brave and Google Chrome. The researcher also mentions that the tool does not work with Microsoft Edge using extensions from Microsoft’s store. But, it is possible with the same method of tracking.

Mozilla Firefox is safe from this because the extension IDs for every browser instance are unique, as the researcher suggested.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/chrome-extension-tracking/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/opensource-project-tracker-chrome-extensions.jpg
[2]: https://news.itsfoss.com/wp-content/uploads/2022/06/extension-fingerprints.jpg
[3]: https://github.com/z0ccc/extension-fingerprints
[4]: https://z0ccc.github.io/extension-fingerprints/
[5]: https://news.itsfoss.com/why-mozilla-firefox/
