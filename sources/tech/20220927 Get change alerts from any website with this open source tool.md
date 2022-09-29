[#]: subject: "Get change alerts from any website with this open source tool"
[#]: via: "https://opensource.com/article/22/9/changedetection-io-open-source-website-changes"
[#]: author: "Leigh Morresi https://opensource.com/users/dgtlmoon"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Get change alerts from any website with this open source tool
======
Use changedetection.io to get alerts when a website makes changes or updates.

![Browser of things][1]

The year was 2020, and news about COVID-19 came flooding in so quickly that everyone felt completely overwhelmed with similar news articles providing updates with varying degrees of accuracy.

But all I needed to know was when my official government guidelines changed. In the end, that's all that mattered to me.

Whether the concern is a pandemic or just the latest tech news, keeping ahead of changes in website content can be critical.

The [changedetection.io][2] project provides a simple yet highly capable, open source solution for website change detection and notification. It's easy to set up, and it can notify over 70 (and counting) different notification systems, such as Matrix, Mattermost, [Nextcloud][3], [Signal][4], [Zulip][5], [Home Assistant][6], email, and more. It also notifies proprietary applications like Discord, Office365, Reddit, Telegram, and many others.

But [changedetection.io][7] isn't just limited to watching web page content. You can also monitor XML and JSON feeds, and it will build an RSS feed of the websites that changed.

Thanks to its built-in JSON simple storage system, there's no need to set up complicated databases to receive and store information. You can [run it as a Docker image][8] or install it with `pip`. The project has an [extensive wiki help section][9], and most common questions are covered there.

For sites using complex JavaScript, you can connect your changedetection.io installation to a Chromium or Chrome browser with the built-in [Playwright content fetcher][10].

Once running, access the application in your browser (`http://localhost:5000`, by default). You can set a password in the **Settings** section if your computer can be reached from an outside network.

![change detection watch list][11]

Submit the URL of a page you want to monitor. There are several settings related to how the page is filtered. For example, you more than likely do not want to know when a company's stock price listed in their site footer has changed, but you may want to know when they post a news article to their blog.

### Monitor a site

Imagine you want to add your favorite website, Opensource.com, to be monitored. You only want to know when the main call-out article contains the word "python" and you want to be notified over Matrix.

To do this, begin with the **visual-selector** tool. (This requires the **playwright** browser interface to be connected.)

![Find an element to monitor][12]

The **visual-selector** tool automatically calculates the best Xpath or CSS filter to target the content. Otherwise, you would get a lot of noise from the daily page updates.

Next, visit the **Filters & Triggers** tab.

![Filters and triggers][13]

In **CSS/JSON/XPATH Filter** field (the blue circle), you can see the automatically generated CSS filter from the previous step.

There are several useful filters available, such as **Remove elements** (good for removing noisy elements), **Ignore text, Trigger/wait for text,** and **Block change-detection if text matches** (used for waiting for some text to disappear, like "sold out").

In **Trigger/wait for text** (the red circle), type in the keyword you want to monitor for. (That's "python" in this example.)

The final step is in the **Notifications** tab, where you configure where you want to receive your notification. Below I added a Matrix room as the notification target, using the Matrix API.

![Notifications tab][14]

The notification URL is in the format of `matrixs://username:password@matrix.org/#/room/#room-name:matrix.org`

However, [t2Bot][15] format is also supported. Here are more [Matrix notification options][16].

And that's it! Now you'll receive a message over Matrix whenever the content changes.

### There's more

There's so much more to changedetection.io. If you prefer calling a custom JSON API, you don't have to use an API for notifications (use `jsons://` ). You can also create a custom HTTP request (POST and GET), execute JavaScript before checking (perhaps to pre-fill a username and password login field), and many more interesting features, with more to come.

Stop browsing the web and start watching the web instead!

Image by: (Leigh Morresi, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/changedetection-io-open-source-website-changes

作者：[Leigh Morresi][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dgtlmoon
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/browser_desktop_website_checklist_metrics.png
[2]: https://github.com/dgtlmoon/changedetection.io
[3]: https://opensource.com/tags/nextcloud
[4]: https://opensource.com/article/19/10/secure-private-messaging
[5]: https://opensource.com/article/22/3/open-source-chat-zulip
[6]: https://opensource.com/article/20/11/home-assistant
[7]: https://github.com/dgtlmoon/changedetection.io
[8]: https://github.com/dgtlmoon/changedetection.io#docker
[9]: https://github.com/dgtlmoon/changedetection.io/wiki
[10]: https://github.com/dgtlmoon/changedetection.io/wiki/Playwright-content-fetcher
[11]: https://opensource.com/sites/default/files/2022-09/screenshot.png
[12]: https://opensource.com/sites/default/files/2022-09/changedetect-osdc.png
[13]: https://opensource.com/sites/default/files/2022-09/changedetect-filters-triggers.webp
[14]: https://opensource.com/sites/default/files/2022-09/step3-notification-matrix.png
[15]: https://t2bot.io/
[16]: https://github.com/caronc/apprise/wiki/Notify_matrix
