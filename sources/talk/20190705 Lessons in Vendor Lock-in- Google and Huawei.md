[#]: collector: "lujun9972"
[#]: translator: "acyanbird "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Lessons in Vendor Lock-in: Google and Huawei"
[#]: via: "https://www.linuxjournal.com/content/lessons-vendor-lock-google-and-huawei"
[#]: author: "Kyle Rankin https://www.linuxjournal.com/users/kyle-rankin"

Lessons in Vendor Lock-in: Google and Huawei
======
![](https://www.linuxjournal.com/sites/default/files/styles/850x500/public/nodeimage/story/bigstock-Us--China-Trade-War-Boxing-F-252887971_1.jpg?itok=oZBwXDrP)

What happens when you're locked in to a vendor that's too big to fail, but is on the opposite end of a trade war?

The story of Google no longer giving Huawei access to Android updates is still developing, so by the time you read this, the situation may have changed. At the moment, Google has granted Huawei a 90-day window whereby it will have access to Android OS updates, the Google Play store and other Google-owned Android assets. After that point, due to trade negotiations between the US and China, Huawei no longer will have that access.

Whether or not this new policy between Google and Huawei is still in place when this article is published, this article isn't about trade policy or politics. Instead, I'm going to examine this as a new lesson in vendor lock-in that I don't think many have considered before: what happens when the vendor you rely on is forced by its government to stop you from being a customer?

### Too Big to Fail

Vendor lock-in isn't new, but until the last decade or so, it generally was thought of by engineers as a bad thing. Companies would take advantage the fact that you used one of their products that was legitimately good to use the rest of their products that may or may not be as good as those from their competitors. People felt the pain of being stuck with inferior products and rebelled.

These days, a lot of engineers have entered the industry in a world where the new giants of lock-in are still growing and have only flexed their lock-in powers a bit. Many engineers shrug off worries about choosing a solution that requires you to use only products from one vendor, in particular if that vendor is a large enough company. There is an assumption that those companies are too big ever to fail, so why would it matter that you rely on them (as many companies in the cloud do) for every aspect of their technology stack?

Many people who justify lock-in with companies who are too big to fail point to all of the even more important companies who use that vendor who would have even bigger problems should that vendor have a major bug, outage or go out of business. It would take so much effort to use cross-platform technologies, the thinking goes, when the risk of going all-in with a single vendor seems so small.

Huawei also probably figured (rightly) that Google and Android were too big to fail. Why worry about the risks of being beholden to a single vendor for your OS when that vendor was used by other large companies and would have even bigger problems if the vendor went away?

### The Power of Updates

Google held a particularly interesting and subtle bit of lock-in power over Huawei (and any phone manufacturer who uses Android)—the power of software updates. This form of lock-in isn't new. Microsoft famously used the fact that software updates in Microsoft Office cost money (naturally, as it was selling that software) along with the fact that new versions of Office had this tendency to break backward compatibility with older document formats to encourage everyone to upgrade. The common scenario was that the upper-level folks in the office would get brand-new, cutting-edge computers with the latest version of Office on them. They would start saving new documents and sharing them, and everyone else wouldn't be able to open them. It ended up being easier to upgrade everyone's version of Office than to have the bosses remember to save new documents in old formats every time.

The main difference with Android is that updates are critical not because of compatibility, but for security. Without OS updates, your phone ultimately will become vulnerable to exploits that attackers continue to find in your software. The Android OS that ships on phones is proprietary and therefore requires permission from Google to get those updates.

Many people still don't think of the Android OS as proprietary software. Although people talk about the FOSS underpinnings in Android, only people who go to the extra effort of getting a pure-FOSS version of Android, like LineageOS, on their phones actually experience it. The version of Android most people tend to use has a bit of FOSS in the center, surrounded by proprietary Google Apps code.

It's this Google Apps code that gives Google the kind of powerful leverage over a company like Huawei. With traditional Android releases, Google controls access to OS updates including security updates. All of this software is signed with Google's signing keys. This system is built with security in mind—attackers can't easily build their own OS update to install on your phone—but it also has a convenient side effect of giving Google control over the updates.

What's more, the Google Apps suite isn't just a convenient way to load Gmail or Google Docs, it also includes the tight integration with your Google account and the Google Play store. Without those hooks, you don't have access to the giant library of applications that everyone expects to use on their phones. As anyone with a LineageOS phone that uses F-Droid can attest, while a large number of applications are available in the F-Droid market, you can't expect to see those same apps as on Google Play. Although you can side-load some Google Play apps, many applications, such as Google Maps, behave differently without a Google account. Note that this control isn't unique to Google. Apple uses similar code-signing features with similar restrictions on its own phones and app updates.

### Conclusion

Without access to these OS updates, Huawei now will have to decide whether to create its own LineageOS-style Android fork or a whole new phone OS of its own. In either case, it will have to abandon the Google Play Store ecosystem and use F-Droid-style app repositories, or if it goes 100% alone, it will need to create a completely new app ecosystem. If its engineers planned for this situation, then they likely are working on this plan right now; otherwise, they are all presumably scrambling to address an event that "should never happen". Here's hoping that if you find yourself in a similar case of vendor lock-in with an overseas company that's too big to fail, you never get caught in the middle of a trade war.

--------------------------------------------------------------------------------

via: https://www.linuxjournal.com/content/lessons-vendor-lock-google-and-huawei

作者：[Kyle Rankin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxjournal.com/users/kyle-rankin
[b]: https://github.com/lujun9972
