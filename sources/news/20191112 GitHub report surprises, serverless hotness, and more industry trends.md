[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (GitHub report surprises, serverless hotness, and more industry trends)
[#]: via: (https://opensource.com/article/19/11/github-report-serverless-hotness-more-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

GitHub report surprises, serverless hotness, and more industry trends
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a senior product marketing manager at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are five of my and their favorite articles from that update.

## [GitHub tops 40 million developers as Python, data science, machine learning popularity surges][2]

> In its annual Octoverse report, GitHub, owned by Microsoft, said it had more than 10 million new users, 44 million repositories created and 87 million pull requests in the last 12 months. The report is a good view of open source software and where the community is headed.

**The impact:** The finding that hit home hardest for me is that "nearly 80% of GitHub users are outside of the US." While an important part of open source history comes from the east and west coasts of America, there is a good chance that the future of the movement will happen elsewhere.

## [Serverless: Is it the Kubernetes killer?][3]

> Serverless isn't here to destroy Kubernetes. The cloud infrastructure space race isn't a zero-sum game. Kubernetes is an obvious evolution following OpenStack and can be run successfully inside of it. There will be OpenStack users for a long time to come, and there are also reasons many companies have moved on from there. Serverless is another tool in the belt of forward-thinking development teams. And increasingly, it can be [run on top of Kubernetes][4] (see Knative), enabling you to get the benefits of the simplicity of serverless and the complexity of Kubernetes where it makes sense for both in your stack.

**The impact:** The moral of the story is that legacy doesn't really go away, it just gets built in and around.

## [When Quarkus meets Knative serverless workloads][5]

> Now, let's discuss how developers can use Quarkus to bring Java into serverless, a place where previously, it was unable to go. Quarkus introduces a comprehensive and seamless approach to generating an operating system specific (aka native) executable from your Java code, as you do with languages like Go and C/C++. Environments such as event-driven and serverless, where you need to start a service to react to an event, require a low time-to-first-response, and traditional Java stacks simply cannot provide this. Knative enables developers to run cloud-native applications as serverless containers in seconds and the containers will go down to zero on demand.
>
> In addition to compiling Java to Knative, Quarkus aims to improve developer productivity. Quarkus works out of the box with popular Java standards, frameworks and libraries like Eclipse MicroProfile, Apache Kafka, RESTEasy, Hibernate, Spring, and many more. Developers familiar with these will feel at home with Quarkus, which should streamline code for the majority of common use cases while providing the flexibility to cover others that come up.

**The impact:** It's good to start getting specific with how and where the new hotness can be used. The answer, in this case, is "with the other new hotness."

## [Why you should join the CNCF Meetup Program][6]

> With the recent changes to Meetup’s [policies][7], we wanted to share a reminder of the benefits of joining the [CNCF Meetup Program][8] and encourage Meetups in the CNCF ecosystem to apply. 
>
> As part of our Meetup Pro membership, CNCF is able to organize a network with an unlimited number of groups on a single account.

**The impact:** The long term response to this unfortunate fallout from the WeWork debacle is to build a distributed open source Meetup alternative. Thankfully in the meantime, the CNCF has a more pragmatic response.

## [Introducing your friends to automation (and overcoming their fear)][9]

> My team and I were in a meeting a little while back with a third party vendor when they asked us what our stance was on automation. My reply was, "We want to automate everything." On top of my reply, my teammates added, "Well, we don’t want to automate ourselves out of a job."

**The impact:** I've always thought it was a bit cavalier when someone would say, "I think it's my job to automate myself out of a job." There is plenty of circumstances where that is the last measure of success someone would want to be measured by. I'm happy to see this addressed head-on.

_I hope you enjoyed this list of what stood out to me from last week and come back next Monday for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/github-report-serverless-hotness-more-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.zdnet.com/article/github-tops-40-million-developers-as-python-data-science-machine-learning-popularity-surges/#ftag=RSSbaffb68
[3]: https://www.forbes.com/sites/forbestechcouncil/2019/11/04/serverless-is-it-the-kubernetes-killer/#7e6740711f77
[4]: https://github.com/knative
[5]: https://vmblog.com/archive/2019/10/29/when-quarkus-meets-knative-serverless-workloads.aspx#.XbiN1JNKiuN
[6]: https://www.cncf.io/blog/2019/11/01/why-you-should-join-the-cncf-meetup-program/
[7]: https://www.meetup.com/lp/paymentchanges?mpId=9038
[8]: https://www.meetup.com/pro/cncf
[9]: https://www.redhat.com/sysadmin/introducing-automation
