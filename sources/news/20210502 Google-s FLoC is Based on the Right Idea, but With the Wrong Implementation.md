[#]: subject: (Google’s FLoC is Based on the Right Idea, but With the Wrong Implementation)
[#]: via: (https://news.itsfoss.com/google-floc/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Google’s FLoC is Based on the Right Idea, but With the Wrong Implementation
======

Cookies, the well-known web technology, have been a key tool in web developers’ toolkits for years. They have given us the ability to store passwords, logins, and other essential data that allows us to use the modern web.

However, the technology has been used lately for more invasive purposes: serving creepily targeted ads.

Recently, Google claimed to have the solution to this privacy crisis with their new FLoC initiative.

### What is FLoC?

![][1]

FLoC (Federated Learning of Cohorts) is a new technology that aims to solve the privacy concerns associated with cookies. Unlike the old way of using 3rd party cookies to build an advertising ID, FLoC uses data from your searches to place you into a predefined group (called a cohort) of people interested in similar topics as you.

Advertisers can then serve the same ads to the group of people that are most likely to purchase their product. Because FLoC is built into Chrome, it can collect much more data than third-party cookies. For the average consumer, this should be a huge concern.

In simple terms, if cookies were bad, then FLoC is down-right evil.

### What’s Wrong With Floc?

Simply put, FLoC collects much more data than traditional cookies. This allows advertisers to serve more targeted ads, driving up sales.

Alongside the data concerns, there also some more specific issues associated with it. These include:

  * More predictability
  * Much easier browser fingerprinting
  * The ability to link a user with their browsing habits



All of these issues join together to create the privacy disaster that FLoC is, with heaps of negative impacts on the user.

#### More Predictability

With the rise of machine learning and AI, companies such as Google and Facebook have gained the ability to make shockingly accurate predictions. With the extra data they will have because of FLoC, these predictions could be taken to a whole new level.

The result of this would be a new wave of highly-targeted ads and tracking. Because all your data is in your cohort id, it will be much better for companies to predict your interests and skills.

#### Browser Fingerprinting

Browser fingerprinting is the act of taking small and seemingly insignificant pieces of data to create an ID for a web browser. While no browser has managed to fully stop fingerprinting, some browsers (such as Tor) have managed to limit their fingerprinting abilities at the expense of some features.

Floc enables large corporations to take this shady practice to a whole new level through the extra data it presents.

#### Browsing Habit Linking

Your cohort id is supposed to be anonymous, but when combined with a login, it can be tracked right back to you. This effectively eliminates the privacy benefits FLoC has (standardized tracking) and further worsens the privacy crisis caused by this technology.

This combination of your login and cohort ID is effectively a goldmine for advertisers.

### Cookies are Bad, but so is FLoC

Cookies have been living on their last legs for the past decade. They have received widespread criticism for privacy issues, particularly from open-source advocates such as Mozilla and the FSF.

Instead of replacing them with an even more invasive technology, why not create an open and privacy respecting alternative? We can be sure that none of the large advertisers (Google and Facebook) would do such a thing as this is a crucial part of their profit-making ability.

Google’s FLoC **not a sustainable replacement for cookies**, and it must go.

### Wrapping Up

With the amount of criticism Google has received in the past for their privacy policies, you would think they would improve. Unfortunately, this seems not to be the case, with their data collection becoming more widespread by the day.

FLoC seems to be the last nail in the coffin of privacy. If we want internet privacy, FLoC needs to go.

If you want to check if you have been FLoCed, you can check using a web tool by EFF – [Am I FLoCed?][2], if you are using Google Chrome version 89 or newer.

What do you think about FLoC? Let me know in the comments below!

_The views and opinions expressed are those of the authors and do not necessarily reflect the official policy or position of It’s FOSS._

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/google-floc/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzMyNCcgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[2]: https://amifloced.org/
