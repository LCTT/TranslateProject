[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The De-Googled Android Fork is Making Good Progress)
[#]: via: (https://itsfoss.com/gael-duval-interview/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

The De-Googled Android Fork is Making Good Progress
======

A couple years ago, we covered the [Eelo project][1]. If you remember, the Eelo project was started by [Gael Duval][2] who once created Mandrake Linux. The goal of the Eelo project was to remove all Google services from Android to give you an [alternate mobile operating system][3] that doesn’t track you and invade your privacy.

A lot has happened to Eelo since then. It’s not called Eelo anymore, now it’s called /e/. So, what’s happening with this project? We talked to Gael Duval himself. Here’s what he shared with us.

![][4]

_**Why did you create this Eelo or /e/ project in the first place?**_

**Gael:** In 2017, I realized that using Android and iPhone, Google and many mobile apps was not compatible with my personal privacy.

A later study by a US University confirmed this: using an iPhone or and Android phone sends between 6 to 12 MB of personal data to Google servers, daily! And this doesn’t count mobile apps.

So I looked for reasonable alternatives to iPhone and Android phones but didn’t find any. Either I found options for hobbyists, like Ubuntu Touch, that were not compatible with existing apps and not fully unGoogled either. Or there were alternative ROMs with all the Google fat inside, and no associated basic online services that could be used without tweaking the system.

Therefore, an idea came to mind: why not fork Android, remove all the Google features, even low level, such as connectivity check, DNS…, replace default apps with more virtuous apps, add basic online services, and integrate all this into a consistent form that could be used by Mum and Dad and any people without tech or expert knowledge?

_**How is it any different from other custom Android ROMs?**_

**Gael:** It doesn’t send a bit of data to Google, and is and will be more and more privacy-focused.

Low-level: we remove any Android feature that sends data to Google servers. Even the connectivity check when you start the smartphone! To my knowledge, there is not any other Android ROM that does this at the moment. We change default DNS settings and offer users an option to set the DNS of their choice. We change NTP (automatic time configuration) settings to the default NTP servers because there is no reason to use Google NTP servers actually. Then we remove Google services, and we replace with a software layout called microG that can still receive push notifications and have geolocation data for apps (using Mozilla geolocation service).

Then we change the default apps by non-Google apps, including the maps applications, mail etc., most are open source applications and I can say that there is 99% probability that all will be open source before the end of this year.

Then we add our own Android application installer, with close to 80 000 available applications at the moment.

We provide a different web browser, which is a fork of Chromium, were all features that data to Google are removed, and were the default search engine is not Google…

And we operate online services:

  * search, using a meta-search system that we have improve for a better user experience
  * online drive with encrypted data, calendar etc. using a modified version of NextCloud
  * mail…



And for we provide a unique identifier that can be used to access all those services, either on the web or from the /e/ OS system, by login once. Then you can sync all your data, calendar, email etc. between your smartphone and your personal /e/ cloud (it can also be self-hosted).
The purpose of the project is to provide a normal, ready to use, and attractive “digital life” to users, without sending all your personal data to Google.

_**If it is completely ‘ungoogled’, how do users install new apps? Do you have your own app store? If yes, how can we trust that these apps don’t spy on user data?**_

**Gael:** Yes – we have our own application installer, with about 80 000 applications. And we analyse each application to unveil the number of trackers, and we display this information to our users, for each application. We are also adding Progressive Web Apps soon to this application installer.

/e/ OS is about freedom of choice. We want the core system to be better, and then offer as many possible options to users, by informing them as much as possible. In short: they can still any application they need. Next step will be to offer a feature to actually block trackers used in applications.

_**What is the target user base for /e/? Can an average Joey use it without much trouble?**_

![][5]

**Gael:** We started with tech-savvy users, and we’re expanding the user base to people with less knowledge. At the moment, our typical user base is a mix of tech-savvy users, who can flash a smartphone with /e/ OS and people who are very concerned with Google and their data privacy but have very limited technical knowledge. For those people we have some smartphones pre-installed with /e/ OS for sale, on high-grade refurbished hardware.

We are also announcing this week an “/e/ easy installer” that will make the flashing process much more easier, by pluging the smartphone to a PC and launching a dedicated application that will make most of the job.

Then, the next step will be to expand our target users to a more global market, once we find the good partners. But clearly, there is a demand for something different than the Apple-Google worldwide market duopoly on the mobile.

_**Initially the project was named eelo and it is called /e/ or [e foundation][6]. Personally, I find the name /e/ weird and it is not easily recognizable. Why did you change the project name?**_

**Gael:** We have been “attacked” by a company called “eelloo”. They considered that “eelo” would interfere with their business. They are in the HR business solutions, but registered their trademark in all the classes related to mobile OS, smartphones etc. This is silly and a shame, but we had no money to defend us strongly at the time.

However the/e/ name will be abandonned for something else quite soon.

_**It’s been a couple of years since the initial launch. How do you see the adoption of /e/?**_

**Gael:** We launched the first beta 18 months ago, and we have started to sell smartphones with /e/ a little more than 6 months ago. The adoption is growing a lot at the moment, we have to add terabytes of online storage regularly!

Also with the /e/ installer arriving, and some official partnerships with some hardware mobile manufacturers in the pipe, this is going to accelerate a lot this year.

However, this is not surprising, privacy concerns are rising both for individuals and corporations, and I think the rejection of Google is also trending.

_**What are your future plans to grow /e/?**_

**Gael:** The growth is very natural. There is a strong community of users who realize how unique our approach is. These guys are contributing, supporting us and talking a lot about the project.

With the easy installer coming along and strategic partnerships with hardware makers, this is going to accelerate a lot.

Also, and this is more personal, I think that there is a natural connection between /e/ OS, and the Linux world. OK, /e/ OS is based on Android, but it’s still a Linux kernel and it’s the same spirit, it’s Open Source… So I’d really like to have more natural integration between my /e/ smartphone and my Linux desktop. There should be some nice features added in this spirit in the next versions of /e/ OS.

_**What can /e/ users and our readers do to help e foundation?**_

**Gael:** Join us, talk about what we are doing, send your feedback, organize some meetups… Help improve the /e/ Wikipedia page which is very poor and doesn’t represent at all what we are actually doing.

We also have a [permanent crowdfunding campaign where users can support the project financially][7], pay for the servers etc. And, in addition to giving back in term of open source product, we send cool stuff in return :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/gael-duval-interview/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/eelo-mobile-os/
[2]: https://en.wikipedia.org/wiki/Ga%C3%ABl_Duval
[3]: https://itsfoss.com/open-source-alternatives-android/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/e-os-interview.jpg?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/e-foundation-smartphones.jpg?resize=800%2C590&ssl=1
[6]: https://e.foundation/
[7]: https://e.foundation/donate/
