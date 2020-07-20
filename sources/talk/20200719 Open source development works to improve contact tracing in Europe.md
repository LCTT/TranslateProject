[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open source development works to improve contact tracing in Europe)
[#]: via: (https://opensource.com/article/20/7/open-source-contact-tracing)
[#]: author: (J. Manrique Lopez de la Fuente https://opensource.com/users/jsmanrique)

Open source development works to improve contact tracing in Europe
======
Analyzing data on Corona-Warn-App's development shows how quickly open
source can scale up to help stop disease outbreaks.
![Hands holding a mobile phone with open on the screen][1]

The [Corona-Warn-App][2] is an awesome example of how governments and public administrations can use open source software development to help citizens while simultaneously advancing the technology ecosystem. The app helps trace infection chains of [SARS-CoV-2][3] (the virus that causes [COVID-19][4]) in Germany. The app uses [a decentralized approach][5] to notify users if they have been exposed to SARS-CoV-2.

![Corona-Warn-App branding][6]

(Manrique Lopez, [CC BY-SA 4.0][7])

Transparency is essential to protecting the app's end users and encouraging its adoption, and [open source][8] is a key element of achieving transparency. Open source allows anyone to use, study, share, and [improve][9] Covid-Warn-App. This is similar to the tracing apps developed by Italy ([Immuni][10]), Switzerland ([SwissCovid][11]), and partially by France ([StopCovid][12]). In contrast, [Radar Covid][13] is a new non-open source COVID-tracking app being piloted in Spain's Canary Islands; between the non-open nature of the app and the fact that the [website][14] still fails to load in mid-July 2020, it's debatable whether citizens will trust it.

![radarcovid.covid19.gob.es offline on July, 8th, 2020][15]

Radar Covid [site][14] offilne on July 8, 2020. (Manrique Lopez, [CC BY-SA 4.0][7])

### Why open source transparency matters

Transparency benefits software development projects in two ways:

  * Internally in the project's community, there's a sense of fair play among all the contributors because everything is in public, so everyone is accountable.
  * Externally among third parties, there's a sense of trust in the project because it can be analyzed from multiple perspectives (e.g., legal, technical, project activity, development processes, etc.).



Transparency should be an essential requirement in software developed by governments. Initiatives like [Public Money, Public Code][16] and the [Foundation for Public Code][17] are doing an amazing job of helping public administrators understand why their code (_our_ code as taxpayers) should be open source.

![Corona-Warn-App's open source approach][18]

(Manrique Lopez, [CC BY-SA 4.0][7])

### About Corona-Warn-App

In early May 2020, the German government asked software developer SAP and Deutsche Telekom subsidiary T-Systems to deliver the Corona-Warn-App based on open source and decentralized technology. Many other German companies and research centers are supporting the app's development.

![Corona-Warn-App development partners][19]

(Manrique Lopez, [CC BY-SA 4.0][7])

In addition, the global open source community has been remarkable in helping to build the app, which has already been [downloaded by more than 15 million users][20].

### Corona-Warn-App's development

Inspired by [Andreas Schreiber's][21] tweet, [Jesus M. Gonzalez-Barahona][22] did an [analysis][23] of Corona-Warn-App's development using [Cauldron.io][24], an open source software-as-a-service application built on top of [GrimoireLab][25], and [summarized his findings][26] on Twitter.

Corona-Warn-App saw robust [software development activity][23] through mid-June:

  * More than 100 people contributed.
  * More than 5,300 commits were made, with 1,600+ pull requests and 600+ issues.



![Corona-Warn-App development data][27]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

#### Quick code reviews

Code review for pull requests is quick, usually within one day (mean: 0.36 days).

![Corona-Warn-App pull requests][28]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

Time to close issues is also quick at about two days.

![Corona-Warn-App issues][29]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

This means that most pull requests are already closed, and the gap between open and closed issues is not very large.

#### Commitment to fighting coronavirus spread

Contributions are coming from both corporate email accounts and private addresses (such as gmail.com, gmx.de, icloud.com, and outlook.de).

![Corona-Warn-App contributors' email domains][30]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

Also, there is no noticeable decline in commits over the weekend, which is unusual for software produced by employees on paid time.

![Corona-Warn-App commits by date][31]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

These facts may be signs of contributors' sense of urgency or commitment to fighting the spread of COVID-19, even on their own time.

There is, however, a different pattern in issue and pull request submissions: they are more common during the week than on weekends, even though commits happen regularly over the week. One possible explanation for this is that developers work uniformly throughout the week but upload and interact with issues mostly during workdays.

![Corona-Warn-App patches by day][32]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

![Corona-Warn-App issues by day][33]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

#### Outstanding developer engagement

Onboarding of developers has been really quick—currently about 50 people by daily contributions and more than 100 people by weekly contributions.

These numbers are common for corporate projects, but Corona-Warn-App has assembled a team of more than 100 developers from at least six companies in just 45 days. Is this another lesson corporate software development can learn and apply from open source development?

![Corona-Warn-App engagement][34]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

![Corona-Warn-App engagement][35]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

Engagement differs in different repositories; for example, the iOS app had about eight times the commits as the Android app. Lines per commit and files per commit suggest that this is likely real development, not snapshots masquerading as development.

![Corona-Warn-App repos][36]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

#### Time efficiency

One worrisome piece of data is in the time to close pull requests. The mean is short, but the median is too short. That could either mean a very well-streamlined code review in a tightly coupled team or very little code review.

![Corona-Warn-App time to merge][37]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

![Corona-Warn-App open PR time][38]

Data source: [Corona-Warn-App dashboard][23] (Manrique Lopez, [CC BY-SA 4.0][7])

### Closing thoughts

Corona-Warn-App is a successful example of how governments and public administrations can use open collaboration to scale up to fight a global crisis. Data saves lives, and now more than ever, we need to break silos, be transparent, and work towards a common goal.

Transparency is not only about making code publicly available. Transparency is about fairness and trust, and software development analysis is a good example of how to take advantage of transparency to better understand the software that matters to you.

If you liked this analysis, note that you can do your own with Cauldron.io, as it's [free, open source software][39].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/open-source-contact-tracing

作者：[J. Manrique Lopez de la Fuente][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jsmanrique
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolserieshe_rh_041x_0.png?itok=tfg6_I78 (Hands holding a mobile phone with open on the screen)
[2]: https://www.coronawarn.app
[3]: https://en.wikipedia.org/wiki/Severe_acute_respiratory_syndrome_coronavirus_2
[4]: https://en.wikipedia.org/wiki/Coronavirus_disease_2019
[5]: https://en.wikipedia.org/wiki/Exposure_Notification
[6]: https://opensource.com/sites/default/files/uploads/corona-warn.png (Corona-Warn-App branding)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.org/osd
[9]: https://github.com/corona-warn-app/cwa-documentation/blob/master/CONTRIBUTING.md
[10]: https://it.wikipedia.org/wiki/Immuni
[11]: https://fr.wikipedia.org/wiki/SwissCovid
[12]: https://fr.wikipedia.org/wiki/StopCovid
[13]: https://english.elpais.com/society/2020-06-29/spain-launches-first-phase-of-coronavirus-tracking-app.html
[14]: https://radarcovid.covid19.gob.es/
[15]: https://opensource.com/sites/default/files/uploads/radarcovid.jpg (radarcovid.covid19.gob.es offline on July, 8th, 2020)
[16]: https://publiccode.eu/
[17]: https://publiccode.net/
[18]: https://opensource.com/sites/default/files/uploads/corona-warn-open-source.jpg (Corona-Warn-App's open source approach)
[19]: https://opensource.com/sites/default/files/uploads/corona-warn-partner.jpg (Corona-Warn-App development partners)
[20]: https://de.statista.com/statistik/daten/studie/1125951/umfrage/downloads-der-corona-warn-app/
[21]: https://twitter.com/onyame/status/1272505372360785920
[22]: https://opensource.com/users/jgbarah
[23]: https://cauldron.io/dashboard/1545
[24]: https://cauldron.io/
[25]: https://chaoss.github.io/grimoirelab/
[26]: https://twitter.com/jgbarah/status/1272777800102141957
[27]: https://opensource.com/sites/default/files/uploads/corona-warn_development.png (Corona-Warn-App development data)
[28]: https://opensource.com/sites/default/files/uploads/corona-warn_prs.png (Corona-Warn-App pull requests)
[29]: https://opensource.com/sites/default/files/uploads/corona-warn_issues.png (Corona-Warn-App issues)
[30]: https://opensource.com/sites/default/files/uploads/corona-warn_users.png (Corona-Warn-App contributors' email domains)
[31]: https://opensource.com/sites/default/files/uploads/corona-warn_commits.png (Corona-Warn-App commits by date)
[32]: https://opensource.com/sites/default/files/uploads/corona-warn_submission1.png (Corona-Warn-App patches by day)
[33]: https://opensource.com/sites/default/files/uploads/corona-warn_submission2.png (Corona-Warn-App issues by day)
[34]: https://opensource.com/sites/default/files/uploads/corona-warn_engagement1.png (Corona-Warn-App engagement)
[35]: https://opensource.com/sites/default/files/uploads/corona-warn_engagement2.png (Corona-Warn-App engagement)
[36]: https://opensource.com/sites/default/files/uploads/corona-warn_repo.png (Corona-Warn-App repos)
[37]: https://opensource.com/sites/default/files/uploads/corona-warn_timetomerge.png (Corona-Warn-App time to merge)
[38]: https://opensource.com/sites/default/files/uploads/corona-warn_opentime.png (Corona-Warn-App open PR time)
[39]: https://gitlab.com/cauldronio/cauldron
