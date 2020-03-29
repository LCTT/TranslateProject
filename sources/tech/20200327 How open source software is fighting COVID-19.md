[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How open source software is fighting COVID-19)
[#]: via: (https://opensource.com/article/20/3/open-source-software-covid19)
[#]: author: (Jeff Stern https://opensource.com/users/jeffstern)

How open source software is fighting COVID-19
======
Learn about four of the thousands of open source projects combating the
spread of coronavirus.
![symbols showing healthcare][1]

Work is hard right now. COVID-19 makes it a challenge to stay focused and motivated. But it was cathartic for me to do some research into how the open source community is responding to the global pandemic.

Since the end of January, the community has contributed to [thousands of open source repositories][2] that mention coronavirus or COVID-19. These repositories consist of datasets, models, visualizations, web and mobile applications, and more, and the majority are written in JavaScript and Python.

Previously, we shared information about several [open hardware makers helping][3] to stop the spread and suffering caused by the coronavirus. Here, we're sharing four (of many) examples of how the open source software community is responding to coronavirus and COVID-19, with the goal of celebrating the creators and the overall impact the open source community is making on the world right now.

### 1\. CHIME by PennSignals

![CHIME by PennSignals][4]

COVID-19 Hospital Impact Model for Epidemics ([CHIME][5]) is an open source application built by data scientists at Penn Medicine at the University of Pennsylvania. The online tool allows hospitals to better understand the impact the virus will have on hospital demand.

Hospital leaders can use CHIME to "get more informed estimates of how many patients will need hospitalization, ICU beds, and mechanical ventilation over the coming days and weeks." A user can input how many patients are currently hospitalized and see, based on other variables, how demand might increase over the coming days.

CHIME is primarily built with Python and uses the [pandas][6] open source dependency for much of the underlying data-transformation number-crunching to generate the estimates. Pandas has a relatively robust team and is one of the most commonly used Python libraries for data analysis and, like all open source projects, is highly dependent on [users' support][7] for income.

### 2\. Real-time COVID-19 visualization by Locale.ai

![Locale.ai COVID-19 visualization][8]

Maps that track the number of cases help us visualize the relative scale and spread of COVID-19. [Locale.ai created an open source, interactive visualization][9] of all known cases of COVID-19. The map provides live updates with new data as it becomes available.

I find this project especially interesting because the data is retrieved via [an open source API][9] created by GitHub user ExpDev07 that queries [an open source dataset][10] from John Hopkins University. The John Hopkins dataset (an aggregate of more than a dozen other sources) is currently the most popular COVID19-related project on GitHub. This is the branching nature of open source at its finest!

Locale.ai built the visualization website using [Vue.js][11], a popular framework that allows web developers to create modern web apps. Vue.js was created and continues to be maintained by [Evan You][12], one of the few people who have made a full-time career as an open source maintainer.

### 3\. DXY-COVID-19-Crawler by BlankerL

![BlankerL DXY-COVID-19-Crawler][13]

[DXY-COVID-19-Crawler][14] was created in January and is one of the earliest responses from the open source community to COVID-19. When the virus was spreading primarily in China, the Chinese medical community was using a site called [DXY.cn][15] to report and track cases. To make the information more readily available and usable by others, GitHub user BlankerL wrote a web crawler to systematically collect data from the DXY.cn site and make it available via an API and data warehouse. That data has been used by academic researchers and others to examine trends and visualize the spread of the virus. So far, DXY-COVID-19-Crawler has been starred more than 1,300 times and forked nearly 300 times.

BlankerL wrote the web crawler using Python and a package called [Beautiful Soup][16]. Beautiful Soup is an application that allows Python developers to easily scrape information from websites. Beautiful Soup is maintained by Leonard Richardson, who also works full-time as a software architect.

### 4\. City of Tokyo's COVID-19 task force website

![City of Tokyo's COVID-19 Task Force site][17]

Many cities around the world have updated their websites with information for their residents about COVID-19. The Tokyo Metropolitan Government created a [comprehensive website][18] that "aims to allow Tokyo residents, companies with offices in Tokyo, and visitors to Tokyo to grasp the current situation and take measures and precautions accordingly."

Unlike many other cities, Tokyo decided to [open source its site][19]. The project boasts contributions by more than 180 different users, and [at least three other cities][20] in Japan (Nagano, Chiba, and Fukuoka City) remixed the site. The project is an example of how cities can better serve their citizens by building openly.

There's an incredible amount of open source technology powering Tokyo's open source website. Using the [Tidelift][21] application, I identified 1,365 dependencies used in the project. All of this complexity happens because 38 direct dependencies (i.e., dependencies the developers explicitly decided to use) have dependencies of their own. That said, maintainers of more than a thousand different open source dependencies (including [Nuxt.js][22], [Prettier][23], [Babel][24], [Ajv][25], and more) are in a small way responsible for helping Tokyo share information with their citizens.

![Dependencies in Tokyo's COVID-19 Task Force site][26]

### Other projects

There are [many other important projects][27] being built in the open in response to COVID-19. I am inspired by how the open source community is responding to this pandemic and leveraging other open source technologies to work quickly. The weeks ahead will be difficult, but I know we can continue to find motivation in the open source community.

If you are working on an open source project related to COVID-19, please share it in the comments so we can help spread the word.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/open-source-software-covid19

作者：[Jeff Stern][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffstern
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/Medical%20costs.jpg?itok=ke57j6cs (symbols showing healthcare)
[2]: https://github.com/search?q=coronavirus+OR+covid19
[3]: https://opensource.com/article/20/3/open-hardware-covid19
[4]: https://opensource.com/sites/default/files/uploads/chime_pennsignals.png (CHIME by PennSignals)
[5]: http://penn-chime.phl.io/
[6]: https://tidelift.com/subscription/pkg/pypi-pandas
[7]: https://pandas.pydata.org/about/sponsors.html
[8]: https://opensource.com/sites/default/files/uploads/locale-ai-visualization.png (Locale.ai COVID-19 visualization)
[9]: https://github.com/localeai/covid19-live-visualization
[10]: https://github.com/CSSEGISandData/COVID-19
[11]: https://tidelift.com/subscription/pkg/npm-vue
[12]: https://blog.tidelift.com/vuejs-evan-you-javascript-framework
[13]: https://opensource.com/sites/default/files/uploads/dxy-covid-19-crawler.png (BlankerL DXY-COVID-19-Crawler)
[14]: https://github.com/BlankerL/DXY-COVID-19-Crawler
[15]: https://dxy.cn
[16]: https://blog.tidelift.com/beautiful-soup-is-now-part-of-the-tidelift-subscription
[17]: https://opensource.com/sites/default/files/uploads/tokyo-covid19-task-force.png (City of Tokyo's COVID-19 Task Force site)
[18]: https://stopcovid19.metro.tokyo.lg.jp/en/
[19]: https://github.com/tokyo-metropolitan-gov/covid19
[20]: https://github.com/tokyo-metropolitan-gov/covid19/issues/1802
[21]: https://tidelift.com/
[22]: https://tidelift.com/subscription/pkg/npm-nuxt
[23]: https://blog.tidelift.com/prettier-is-now-part-of-the-tidelift-subscriptions
[24]: https://tidelift.com/subscription/pkg/npm-babel
[25]: https://blog.tidelift.com/ajv-is-now-part-of-the-tidelift-subscription
[26]: https://opensource.com/sites/default/files/uploads/tokyo-dependencies.png (Dependencies in Tokyo's COVID-19 Task Force site)
[27]: https://github.com/soroushchehresa/awesome-coronavirus
