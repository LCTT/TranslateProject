Translating by MjSeven


4 Firefox extensions to install now
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/redpanda_firefox_pet_animal.jpg?itok=aSpKsyna)
As I mentioned in my [original article][1] on Firefox extensions, the web browser has become a critical component of the computing experience for many users. Modern browsers have evolved into powerful and extensible platforms, and extensions can add or modify their functionality. Extensions for Firefox are built using the WebExtensions API, a cross-browser development system.

In the first article, I asked readers: "Which extensions should you install?" To reiterate, that decision largely comes down to how you use your browser, your views on privacy, how much you trust extension developers, and other personal preferences. Since that article was published, one extension I recommended (Xmarks) has been discontinued. Additionally, that article received a ton of feedback that has been taken into account for this update.

Once again, I'd like to point out that browser extensions often require the ability to read and/or change everything on the web pages you visit. You should consider the ramifications of this very carefully. If an extension has modify access to all the web pages you visit, it could act as a keylogger, intercept credit card information, track you online, insert advertisements, and perform a variety of other nefarious activities. That doesn't mean every extension will surreptitiously do these things, but you should carefully consider the installation source, the permissions involved, your risk profile, and other factors before you install any extension. Keep in mind you can use profiles to manage how an extension impacts your attack surface—for example, using a dedicated profile with no extensions to perform tasks such as online banking.

With that in mind, here are four open source Firefox extensions you may want to consider.

### uBlock Origin

![ublock origin ad blocker screenshot][2]

My first recommendation remains unchanged. [uBlock Origin][3] is a fast, low memory, wide-spectrum blocker that allows you to not only block ads but also enforce your own content filtering. The default behavior of uBlock Origin is to block ads, trackers, and malware sites using multiple, predefined filter lists. From there it allows you to arbitrarily add lists and rules, or even lock down to a default-deny mode. Despite being powerful, the extension has proven to be efficient and performant. It continues to be updated regularly and is one of the best options available for this functionality.

### Privacy Badger

![privacy badger ad blocker][4]

My second recommendation also remains unchanged. If anything, privacy has been brought even more to the forefront since my previous article, making this extension an easy recommendation. As the name indicates, [Privacy Badger][5] is a privacy-focused extension that blocks ads and other third-party trackers. It's a project of the Electronic Freedom Foundation, which says:

> "Privacy Badger was born out of our desire to be able to recommend a single extension that would automatically analyze and block any tracker or ad that violated the principle of user consent; which could function well without any settings, knowledge, or configuration by the user; which is produced by an organization that is unambiguously working for its users rather than for advertisers; and which uses algorithmic methods to decide what is and isn't tracking."

Why is Privacy Badger on this list when the previous item may seem similar? A couple reasons. The first is that it fundamentally works differently than uBlock Origin. The second is that a practice of defense in depth is a sound policy to follow. Speaking of defense in depth, the EFF also maintains [HTTPS Everywhere][6] to automatically ensure https is used for many major websites. When you're installing Privacy Badger, you may want to consider HTTPS Everywhere as well.

In case you were starting to think this article was simply going to be a rehash of the last one, here's where my recommendations diverge.

### Bitwarden

![Bitwarden][7]

When recommending LastPass in the previous article, I mentioned it was likely going to be a controversial selection. That certainly proved true. Whether you should use a password manager at all—and if you do, whether you should choose one that has a browser plugin—is a hotly debated topic, and the answer very much depends on your personal risk profile. I asserted that most casual computer users should use one because it's much better than the most common alternative: using the same weak password everywhere. I still believe that.

[Bitwarden][8] has really matured since the last time I checked it out. Like LastPass, it is user-friendly, supports two-factor authentication, and is reasonably secure. Unlike LastPass, it is [open source][9]. It can be used with or without the browser plugin and supports importing from other solutions including LastPass. The core functionality is completely free, and there is a premium version that is $10/year.

### Vimium-FF

![Vimium][10]

[Vimium][11] is another open source extension that provides Firefox keyboard shortcuts for navigation and control in the spirit of Vim. They call it "The Hacker's Browser." Modifier keys are specified as **< c-x>**, **< m-x>**, and **< a-x>** for Ctrl+x, Meta+x, and Alt+x, respectively, and the defaults can be easily customized. Once you have Vimium installed, you can see this list of key bindings at any time by typing **?**. Note that if you prefer Emacs, there are also a couple of extensions for those keybindings as well. Either way, I think keyboard shortcuts are an underutilized productivity booster.

### Bonus: Grammarly

Not everyone is lucky enough to write a column on Opensource.com—although you should seriously consider writing for the site; if you have questions, are interested, or would like a mentor, reach out and let's chat. But even without a column to write, proper grammar is beneficial in a large variety of situations. Enter [Grammarly][12]. This extension is not open source, unfortunately, but it does make sure everything you type is clear, effective, and mistake-free. It does this by scanning your text for common and complex grammatical mistakes, spanning everything from subject-verb agreement to article use to modifier placement. Basic functionality is free, with a premium version with additional checks available for a monthly charge. I used it for this article and it caught multiple errors that my proofreading didn't.

Again, Grammarly is the only extension included on this list that is not open source, so if you know of a similar high-quality open source replacement, let us know in the comments.

These extensions are ones I've found useful and recommend to others. Let me know in the comments what you think of the updated recommendations.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/firefox-extensions

作者：[Jeremy Garcia][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jeremy-garcia
[1]:https://opensource.com/article/18/1/top-5-firefox-extensions
[2]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/ublock.png?itok=_QFEbDmq (ublock origin ad blocker screenshot)
[3]:https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
[4]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/privacy_badger_1.0.1.png?itok=qZXQeKtc (privacy badger ad blocker screenshot)
[5]:https://www.eff.org/privacybadger
[6]:https://www.eff.org/https-everywhere
[7]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/bitwarden.png?itok=gZPrCYoi (Bitwarden)
[8]:https://bitwarden.com/
[9]:https://github.com/bitwarden
[10]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/vimium.png?itok=QRESXjWG (Vimium)
[11]:https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
[12]:https://www.grammarly.com/
