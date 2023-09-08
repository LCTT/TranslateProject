[#]: subject: "Firefox 117 Release Adds Automated Translation Feature Support"
[#]: via: "https://news.itsfoss.com/firefox-117-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Firefox 117 Release Adds Automated Translation Feature Support
======
Firefox 117 release brings along necessary improvements and a new
feature support for the upcoming upgrade.
Firefox is a browser loved by many, hated by few. But, as **an open-source alternative to Chromium-based browsers** such as Chrome and Opera, it constantly evolves to add new features to its arsenal.

And this time around, with the **Firefox 117** release, we have an interesting addition that was in the making for quite some time now.

**Suggested Read** 📖

![][1]

Allow me to take you through that, and more in this article. Let's begin.

## 🆕 Firefox 117: What's New?

![][2]

Like most Firefox releases, this too has a lot to offer. Some notable highlights include:

  * **New privacy-focused native translation feature** ( _a work in progress_ )
  * **Expansion of the credit card autofill feature to more locales.**
  * **YouTube video lists now scroll correctly with a screen reader.**



While the feature set sounds good, let us focus on the translation feature.

### Privacy-Focused Translations

0:00

/

1×

As shown in the demo above, Firefox now features an in-built translation tool.

Its main selling point is that **all language translations happen locally** , without your data being sent to any server for processing.

This kind of functionality already existed in Firefox thanks to an add-on called '[Firefox Translations][3]'.

But, [back then][4], integrating this directly into Firefox was discarded owing to its third-party dependencies after Mozilla's internal security review of the engine codebase.

Luckily, now we have proper native functionality. **But, there's a catch.**

🚧

Thanks to [Ghack][5], I found that **the translation feature was disabled by default on Firefox 117. They plan to gradually roll it out to users, and by default on its next version update**.

So, to test it out, I had to manually enable it by going into ' **about:config** ', then enabling the 'b **rowser.translations.enable** ' flag among advanced preferences.

![][6]

### 🛠️ Other Changes and Improvements

Other than that, here are a few other changes that are worth noting:

  * Various security updates.
  * macOS users can now control the tabability of controls and links.
  * Web compatibility inspection has been enhanced for their new CSS compatibility tooltip. (useful for web developers)
  * A new preference to allow for the disabling of the context menu that appears when pressing shift+right-click.



You can go through the [release notes][7] to dive deeper into this release.

## 📥 Get Mozilla Firefox 117

You can grab the latest release of Firefox from its [FTP portal][8]. It should be available on the [official website][9] shortly, if it is not yet available.

[Mozilla Firefox 117][9]

**For existing installations:** You can update it by searching for ' **Update** ', in the settings menu, and clicking on ' **Check for Updates** '.

_💬 What do you think about the new automated translation feature support with Firefox 117? Share your thoughts in the comments down below._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/firefox-117-release/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[2]: https://news.itsfoss.com/content/images/2023/08/Mozilla_Firefox_Translate_1.png
[3]: https://addons.mozilla.org/en-US/firefox/addon/firefox-translations/
[4]: https://hacks.mozilla.org/2022/06/neural-machine-translation-engine-for-firefox-translations-add-on/
[5]: https://www.ghacks.net/2023/08/29/firefox-117-native-language-translations-last-firefox-102-update-and-security-fixes/
[6]: https://news.itsfoss.com/content/images/2023/08/Mozilla_Firefox_Translate_3.png
[7]: https://www.mozilla.org/en-US/firefox/117.0/releasenotes/
[8]: https://ftp.mozilla.org/pub/firefox/releases/117.0/
[9]: https://www.mozilla.org/firefox/download/thanks/
