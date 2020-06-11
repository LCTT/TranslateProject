[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Nextcloud Vs ownCloud: What’s the Difference? Which one Should You Use?)
[#]: via: (https://itsfoss.com/nextcloud-vs-owncloud/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Nextcloud Vs ownCloud: What’s the Difference? Which one Should You Use?
======

[Nextcloud][1] and [ownCloud][2] are two of the most popular names that you will come across when we talk about self-hosted open-source cloud storage services.

Now, Nextcloud and ownCloud are similar in so many ways that it often confuses people.

And this is why we at It’s FOSS thought of creating this comparison of Nextcloud and ownCloud. I’ll discuss the difference between ownCloud and Nextcloud. I’ll also share how both services are similar.

### The history of ownCloud and Nextcloud

In 2010, [Frank Karlitschek][3] started the ownCloud project by announcing it during a [Camp KDE keynote session][4].

![ownCloud interface][5]

It started off as a personal cloud storage solution to give users the ability to have control of their own data without relying on other cloud storage providers which then translated to the start of ownCloud Inc.

Unfortunately, Frank Karlitschek, along with several original developers left ownCloud Inc. They didn’t officially state any reason for that – but they hinted about the problem of having a business model that did not compliment an open-source solution.

Now, ownCloud focuses primarily on Enterprise offerings and offers a separate sever edition (to self-host) for users.

Frank Karlitschek started Nextcloud as a fork of ownCloud right after leaving ownCloud Inc.

![Nextcloud interface][6]

Considering that it’s a fork, you will find many similarities, however, the product has evolved a lot over the years arguably making it more popular than ownCloud. It is striving to become a collaboration platform like Microsoft Office 365 and Google Docs.

Similar to ownCloud, you will find a self-hosted option and an enterprise-tailored solution.

### Nextcloud vs ownCloud: Similarities

![Nextcloud Vs Owncloud][7]

Let’s talk about the similarities between Nextcloud and ownCloud.

#### User Interface

It’s safe to consider that the user interface offered by Nextcloud and ownCloud is very similar to each other.

Yes, you might find some under-the-hood changes and maybe several subtle differences. But, overall, it looks/feels very much the same.

#### Collaboration Features

Unless you consider all the nitty gritty features that they both offer, fundamentally, it’s more or less the same.

You can manage tasks, upload files, have a calendar, and do a lot of basic collaboration activities in both Nextcloud and ownCloud.

#### Self-hosting Option

It’s quite obvious — but just for your information, you can easily deploy either of them (Nextcloud and ownCloud) on your own server without opting for enterprise services.

Use a cloud service like Linode or [DigitalOcean][8]. They even have one-click installer option to deploy a full-fledged Nextcloud or ownCloud server in minutes.

#### Cross-platform support

Both ownCloud and Nextcloud offers support for desktop clients and mobile apps (iOS &amp; Android) to enhance the convenience of collaboration activities.

So, you should be good to go with either of them if you’re looking for cross-platform support for yourself.

### Nextcloud vs ownCloud: Key Differences

Now that you are aware of the similarities, let’s see how Nextcloud and ownCloud are different.

#### License Differences

For most of the users, being a truly open-source solution matters a lot. And, that is why it is important to know the license a service comes under.

ownCloud offers the standard edition (or the community edition) under the [AGPLv3 license][9] but the enterprise edition comes under [ownCloud’s commercial license][10].

While Nextcloud’s both enterprise and community editions come under the **APGPLv3 license.**

So, depending on what you’re looking for, you need to make a choice here.

#### Exclusive Features

Sometimes it’s a deal breaker or a selling point to have a set of enterprise-exclusive features on a service.

So, when I looked around, I found out that ownCloud does offer a set of [exclusive features][11] only for the premium subscribers.

On the other hand, Nextcloud offers the complete set of features for both community and enterprise editions and the premium subscription only includes support or technical help for enterprise deployments.

#### Documentation

![Owncloud Documentation][12]

Documentation is a very important part of a product/service like ownCloud and Nextcloud where a lot of users manage the instances themselves.

Of course, depending on your technical expertise and preferences, you might find any of the documentations to be better than the other.

![Nextcloud Documentation][13]

However, in our case, [Avimanyu Bandyopadhyay][14] (Research Engineer at It’s FOSS) felt that [ownCloud’s documentation][15] is more useful and easier to follow when compared to [Nextcloud’s documentation][16].

_ownCloud has provided a ready-to-deploy configuration file for enterprise use at the bottom of its docker documentation page. But, Nextcloud has kept it separately on GitHub – which might be a little inconvenient_ _to find_.

So, Nexcloud’s clarity on the documentation part could definitely improve.

#### Pricing Plans (for enterprise edition)

No matter how a good a service is — the pricing plans always influences the final decision for enterprises to choose a solution that suits their requirements within a budget.

If we compare the pricing plans of [Nextcloud][17] and [ownCloud][18], you will notice that ownCloud starts offering enterprise services at **$3,600 for a team of 50 users**.

In contrast, Nextcloud’s enterprise services **start at €1900 (which is roughly $2050)** for a team of 50 users.

Of course, it all comes down to your preferences on what exactly are you looking for.

#### App Marketplace

![Nextcloud Marketplace][19]

The availability of apps to extend the functionality of Nextcloud or ownCloud plays an important role to help you choose the best for your use-case.T

Theoretically, you should find a bunch of useful [apps on Nextcloud][20] and [ownCloud’s marketplace][21].

However, you might find a few things missing on ownCloud’s app marketplace like Kanban styled board [Deck][22] and [W2G2][23] (File/Folder locking app).

![Owncloud Marketplace][24]

At least, depending on what I look for on a collaboration platform — I couldn’t find anything similar on ownCloud.

Similarly, I might have missed something that’s available on ownCloud but not on Nextcloud. So, this should be one of your primary factors to consider before deploying ownCloud or Nextcloud for yourself or for your enterprise.

#### Potential Issues or Bugs

It’s obvious that both Nextcloud and ownCloud can have their own share of issues. So, if you’re going to self-host either of them, you should check out their GitHub pages to scroll through the active issues.

  * [Nextcloud GitHub][25]
  * [ownCloud GitHub][26]



For instance, while writing this article, Nextcloud has an active issue where the [files in a sub-folder of an encrypted folder are not encrypted][27]. Similarly, ownCloud also has a bug with [syncing the files when the user hits the reload button][28].

Of course, these are just examples that I took from their list of issues. But, you should keep an eye on some active issues before deploying it yourself that could ultimately help you decide what to choose.

### So, which one do you choose? Nextcloud or ownCloud?

Now that you’ve known about what’s different and what’s similar between Nextcloud and ownCloud — it should be slightly easier to choose one.

However, given the potential of both the services and the number of add-ons they offer, I could have missed a few points here. So, I’d recommend you to go through the documentations for each of them for enterprise-use. For personal usage, you can choose either Nextcloud or ownCloud as per your preferences.

At It’s FOSS, we [use Nextcloud][29] for storing files, task management and recently for collaborating on documentation.

What do you think? Nextcloud or ownCloud? Do share your thoughts in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/nextcloud-vs-owncloud/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://nextcloud.com/
[2]: https://owncloud.com/
[3]: https://en.wikipedia.org/wiki/Frank_Karlitschek
[4]: https://dot.kde.org/2010/01/21/camp-kde-2010-continues-more-talks
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/ownCloud-screenshot.jpg?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/nextcloud-screenshot.jpg?ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Nextcloud-vs-OwnCloud-itsfoss.jpg?ssl=1
[8]: https://itsfoss.com/recommends/digital-ocean/
[9]: https://www.gnu.org/licenses/agpl-3.0.en.html
[10]: https://owncloud.com/licenses/owncloud-commercial/
[11]: https://owncloud.com/enterprise-edition/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/owncloud-documentation.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/nextcloud-documentation.jpg?ssl=1
[14]: https://itsfoss.com/author/avimanyu/
[15]: https://doc.owncloud.org/server/10.4/
[16]: https://docs.nextcloud.com/
[17]: https://nextcloud.com/pricing/
[18]: https://owncloud.com/pricing/
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/nextcloud-marketplace.jpg?ssl=1
[20]: https://apps.nextcloud.com/
[21]: https://marketplace.owncloud.com
[22]: https://apps.nextcloud.com/apps/deck
[23]: https://apps.nextcloud.com/apps/w2g2
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/owncloud-marketplace.jpg?ssl=1
[25]: https://github.com/nextcloud
[26]: https://github.com/owncloud
[27]: https://github.com/nextcloud/desktop/issues/774
[28]: https://github.com/owncloud/core/issues/37170
[29]: https://itsfoss.com/nextcloud/
