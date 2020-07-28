[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started as an open source builder and more industry trends)
[#]: via: (https://opensource.com/article/20/7/open-source-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

Getting started as an open source builder and more industry trends
======
A weekly look at open source community and industry trends.
![Person standing in front of a giant computer screen with numbers, data][1]

As part of my role as a principal communication strategist at an enterprise software company with an open source development model, I publish a regular update about open source community, market, and industry trends for product marketers, managers, and other influencers. Here are three of my and their favorite articles from that update.

## [Open source builders: Getting started][2]

> “Eventually I found myself wanting to make code changes myself,” Liz says. One of her first contributions was an authorization extension for the Django framework. “I remember being worried that the maintainers might not want a change from a complete stranger, so it was exciting and something of a relief that it was accepted,” she adds. “It’s always a great feeling to get approval and even thanks for your contribution.”

**The impact**: This series of interviews with open source maintainers (quote from [Liz Rice][3]) is an intersection of motivations and experiences jumping into open source. It's also a nod to the myth of the genius lone wolf developer; you can get a long ways by yourself, but you'll get further and build better things if you know how to work well with other people. Farther still if you figure out how to persuade and inspire them.

## [Fluent Bit v1.5: Lightweight and high-performance log processor][4]

> One of the biggest highlights of this major release is the joint work of different companies contributing with Fluent Bit core maintainers to bring improved and new connectors for observability cloud services provided by Google, Amazon, LogDNA, New Relic and Sumo Logic within others.

**The impact**: To "collect data/logs from different sources, unify and send them to multiple destinations" is as tedious of a task as you can come across, yet it's one shared both by the hyperscalers and their customers. Exhibit A: a prime example of open source working exactly as intended. Congrats to the Fluent Bit team on this release!

## [How Kubernetes empowered Nubank engineers to deploy 700 times a week][5]

> As a result, deployment has gone from 90 minutes to 15 minutes for production environments. And that, says Nobre, was “the main benefit because it helps the developer experience.” Today, Nubank engineers are deploying 700 times a week. “For a bank you would say that’s insane,” Capaverde says with a laugh. “But it’s not insane because with Kubernetes and canary deployments, it’s easier to roll back a change because it’s also faster to deploy. People are shipping more often and with more confidence.”

**The impact:** This feels like a win and a loss to me. Sure they lowered the cost of making a change in a way that gave people more confidence to try things out. But their developers can no longer run 10k while waiting for their deployment to finish and can now only fit in a single TED talk.

_I hope you enjoyed this list and come back next week for more open source community, market, and industry trends._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/open-source-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://idk.dev/open-source-builders-getting-started/
[3]: https://twitter.com/lizrice
[4]: https://www.cncf.io/blog/2020/07/14/fluent-bit-v1-5-lightweight-and-high-performance-log-processor/
[5]: https://www.cncf.io/blog/2020/07/10/how-kubernetes-empowered-nubank-engineers-to-deploy-200-times-a-week/
