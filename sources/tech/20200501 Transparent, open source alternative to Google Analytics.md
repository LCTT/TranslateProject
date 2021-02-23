[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Transparent, open source alternative to Google Analytics)
[#]: via: (https://opensource.com/article/20/5/plausible-analytics)
[#]: author: (Marko Saric https://opensource.com/users/markosaric)

Transparent, open source alternative to Google Analytics
======
Plausible Analytics is a leaner, more transparent option, with the
essential data you need but without all the privacy baggage.
![Digital creative of a browser on the internet][1]

Google Analytics is the most popular website analytics tool. Millions of developers and creators turn to it to collect and analyze their website statistics.

More than 53% of all sites on the web track their visitors using Google Analytics. [84%][2] of sites that do use a known analytics script use Google Analytics.

Google Analytics has, for years, been one of the first tools I installed on a newly launched site. It is a powerful and useful analytics tool. Installing Google Analytics was a habit I didn't think much about until the introduction of the [GDPR][3] (General Data Protection Regulation) and other privacy regulations.

Using Google Analytics these days comes with several pitfalls, including the need for a privacy policy, the need for cookie banners, and the need for a GDPR consent prompt. All these may negatively impact the site loading time and visitor experience.

This has made me try to [de-Google-ify websites][4] that I work on, and it's made me start working on independent solutions that are open source and more privacy-friendly. This is where Plausible Analytics enters the story.

[Plausible Analytics][5] is an open source and lightweight alternative to Google Analytics. It doesn't use cookies and it doesn't collect any personal data, so you don't need to show any cookie banners or get GDPR or CCPA consent. Let's take a closer look.

### Main differences between Google Analytics and Plausible

Plausible Analytics is not designed to be a clone of Google Analytics. It is meant as a simple-to-use replacement and a privacy-friendly alternative. Here are the main differences between the two web analytics tools:

#### Open source vs. closed source

Google Analytics may be powerful and useful, but it is closed source. It is a proprietary tool run by one of the largest companies in the world, a company that is a key player in the ad-tech industry. There's simply no way of knowing what's going on behind the scenes. You have to put your trust in Google.

Plausible is a fully open source tool. You can read our code [on GitHub][6]. We're "open" in other ways, too, such as our [public roadmap][7], which is based around the feedback and features submitted by the members of our community.

#### Privacy of your website visitors

Google Analytics places [several cookies][8] on the devices of your visitors, and it tracks and collects a lot of data. This means that there are several requirements if you want to use Google Analytics and be compliant with the different regulations:

  * You need to have a privacy policy about analytics
  * You need to show a cookie banner
  * You need to obtain a GDPR/CCPA consent



Plausible is made to be fully compliant with the privacy regulations. No cookies are used, and no personal data is collected. This means that you don't need to display the cookie banner, you don't need a privacy policy, and you don't need to ask for the GDPR/CCPA consent when using Plausible.

#### Page weight and loading time

The recommended way of installing Google Analytics is to use the Google Tag Manager. Google Tag Manager script weights 28 KB, and it downloads another JavaScript file called the Google Analytics tag, which adds an additional 17.7 KB to your page size. That's 45.7 KB of page weight combined.

Plausible script weights only 1.4 KB. That's 33 times smaller than the Google Analytics Global Site Tag. Every KB matters when you want to keep your site fast to load.

#### Accuracy of visitor stats

Google Analytics is being blocked by an increasing number of web users. It's blocked by those who use open source browsers such as [Firefox][9] and [Brave][10]. It's also blocked by those who use open source browser add-ons such as the [uBlock Origin][11]. It's not uncommon to see 40% or more of the audience on a tech site blocking Google Analytics.

Plausible is a new player on this market and it's privacy-friendly by default, so it doesn't see the same level of blockage.

#### Simple vs. complex web analytics

[Google Analytics is overkill][12] for many website owners. It's a complex tool that takes time to understand and requires training. Google Analytics presents hundreds of different reports and metrics for you to get insights from. Many users end up creating custom dashboards while ignoring all the rest.

Plausible cuts through all the noise that Google Analytics creates. It presents everything you need to know on one single page—all the most valuable metrics at a glance. You can get an overview of the most actionable insights about your website in one minute.

### A guided tour of Plausible Analytics

Plausible Analytics is not a full-blown replacement and a feature-by-feature reproduction of Google Analytics. It's not designed for all the different use-cases of Google Analytics.

It's built with simplicity and speed in mind. There is no navigational menu. There are no additional sub-menus. There is no need to create custom reports. You get one simple and useful web analytics dashboard out of the box.

Rather than tracking every metric imaginable, many of them that you will never find a use for, Plausible focuses on the essential website stats only. It is easy to use and understand with no training or prior experience:

![Plausible analytics in action][13]

  * Choose the time range that you want to analyze. The visitor numbers are automatically presented on an hourly, daily, or monthly graph. The default time frame is set at the last 30 days.
  * See the number of unique visitors, total page views, and the bounce rate. These metrics include a percentage comparison to the previous time period, so you understand if the trends are going up or down.
  * See all the referral sources of traffic and all the most visited pages on your site. Bounce rates of the individual referrals and pages are included too.
  * See the list of countries your traffic is coming from. You can also see the device, browser, and operating system your visitors are using.
  * Track events and goals to identify the number of converted visitors, the conversion rate, and the referral sites that send the best quality traffic.



Take a look at the [live demo][14] where you can follow the traffic to the Plausible website.

### Give Plausible Analytics a chance

With Plausible Analytics, you get all the important web analytics at a glance so you can focus on creating a better site without needing to annoy your visitors with all the different banners and prompts.

You can try Plausible Analytics on your site alongside Google Analytics. [Register today][15] to try it out, and see what you like and what you don't. Share your feedback with the community. This helps us learn and improve. We'd love to hear from you.

Take a look at five great open source alternatives to Google Docs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/plausible-analytics

作者：[Marko Saric][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/markosaric
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://w3techs.com/technologies/details/ta-googleanalytics
[3]: https://gdpr-info.eu/
[4]: https://markosaric.com/degoogleify/
[5]: https://plausible.io/
[6]: https://github.com/plausible-insights/plausible
[7]: https://feedback.plausible.io/roadmap
[8]: https://developers.google.com/analytics/devguides/collection/analyticsjs/cookie-usage
[9]: https://www.mozilla.org/en-US/firefox/new/
[10]: https://brave.com/
[11]: https://github.com/gorhill/uBlock
[12]: https://plausible.io/vs-google-analytics
[13]: https://opensource.com/sites/default/files/plausible-analytics.png (Plausible analytics in action)
[14]: https://plausible.io/plausible.io
[15]: https://plausible.io/register
