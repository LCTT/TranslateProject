5 tips for choosing the right open source database
======
When selecting a mission-critical application, you can't afford to make mistakes. 

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/server_data_system_admin.png?itok=q6HCfNQ8)

So, your company has a directive to adopt more open source database technologies, and they've recruited you to select the right direction. Whether you are an open source technology veteran or a newcomer, this is a daunting and overwhelming task.

Over the past several years, open source technology adoption has steadily increased in the enterprise space. With its popularity comes a crowded marketplace with open source software companies promising that their solution will solve every problem and fit every workload. Be wary of these promises. Choosing the right open source technology—especially a database—is an important and difficult decision you can't make lightly.

In my experience as an IT professional at [Percona][1] and other companies, I've been fortunate to work hands-on in adopting open source technologies and guiding others in making the right decisions. There are many important factors to consider; hopefully, this article will shine a light on a few.

### 1. Have a goal.

This may seem simple, but based on my many conversations with people exploring MySQL, MongoDB, or PostgreSQL, it is top of the list in importance.

To avoid getting overwhelmed by the unlimited combinations of open source database software in the market, have a specific goal in mind. Maybe your goal is to provide your internal developers with a standardized, open source database backend that is managed by your internal database team. Perhaps your goal is to rip and replace the entire functionality of a legacy application and database backend with new open source technology.

Once you have defined a goal, you can focus your efforts. This will lead to better conversations internally as well as externally with open source database software vendors and advocates.

### 2. Understand your workload.

Despite the increasing ability of database technologies to wear many hats, each specializes in certain areas, e.g., MongoDB is now transactional, MySQL now has JSON storage. A growing trend in open source databases involves providing check boxes claiming certain features are available. One of the biggest mistakes is not using the right tool for the right job. Something leads a company down the wrong path—perhaps an overzealous developer or a manager with tunnel vision. The unfortunate thing is that the wrong tool can work fine for smaller volumes of transactions and data, but later there will be bottlenecks that can be solved only by using a different tool.

If you want a data analytics warehouse, an open source relational database is probably not the right choice. If you want a transaction-processing app with rigid data integrity and consistency, NoSQL options may not be the right option.

### 3. Don't reinvent the wheel.

Open source database technologies have rapidly grown, expanded, and hardened over the past several decades. We've seen a transformation from new, questionably production-ready databases to proven, enterprise-grade database backends. It's no longer necessary to be a bleeding edge, early adopter to choose open source database technologies. Organizations have grown around these communities to provide production support and tooling in the open source database space for a growing number of startups, midsized businesses, and Fortune 500 companies.

Battery Ventures, a tech-focused investment firm, recently introduced its [BOSS Index][2] for tracking the most popular open source projects. It's not perfect, but it provides great insight into some of the most widely adopted and active open source projects. Not surprisingly, database technologies dominate the list, comprising five of the top 10 technologies. This is a great starting point for someone new to the open source database space. A lot of times, vendors have already produced suitable architectures for solving specific problems.

My point is that someone has probably already done what you are trying to do. Learn from their successes and failures. Even if it is not a perfect fit, a solution can likely be modified to suit your needs. For example, Amazon provides a [CloudFormation script][3] for deploying MongoDB in its EC2 environment.

If you are a bleeding-edge early adopter, that doesn't mean you can't explore. If you have a unique challenge or workload that seems to fit a new open source database technology, go for it. Keep in mind that there are inherent risks (and rewards!) to being an early adopter.

### 4\. Start simple


How many [nines][4] does your database truly need? "Achieving high availability" is often a nebulous goal for many companies. Of course, the most common answer is "it's mission-critical, and we cannot afford any downtime."

The more complicated your database environment, the more difficult and costly it is to manage. You can theoretically achieve higher uptime, but the tradeoffs will be the feasibility of management and performance. When in doubt, start simple. There are always options to scale out when the need arises.

For example, Booking.com is a widely known travel reservation site. It might be less widely known that it uses MySQL as a database backend. Nicolai Plum, a Booking.com senior systems architect, gave [a talk][5] outlining the evolution of the company's MySQL database. One of the takeaways was that the database started simple. It had to evolve over time, but in the beginning, simple master–replica architecture sufficed. As the workload and dataset increased, it introduced load balancers, multiple read replicas, archiving to Hadoop for analytics, etc. However, the early architecture was extremely simple.

![](https://opensource.com/sites/default/files/uploads/internet_app_barrett_chambers.png)

### 5. When in doubt, ask an expert.

If you're unsure whether a database would be a good fit, reach out on forums, websites, or to vendors and strike up a conversation. This can be exciting as you research which database technologies meet your requirements and which do not. Often there are suitable alternatives that you haven't considered. The open source community is all about sharing knowledge.

There is one important thing to be aware of when reaching out to open source software and services vendors. Many have open-core business models that incentivize adopting their database software. Take their advice or guidance with a grain of salt and use your own ability to research, create proofs of concept, and explore alternatives.

### Conclusion

Choosing the right open source database is an important decision. Start by asking the right questions. All too often, people put the cart before the horse, making decisions before really understanding their needs.

Barrett Chambers will present [Choosing the Right Open Source Database][6] at [All Things Open][7], October 21-23 in Raleigh, N.C.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/tips-choosing-right-open-source-database

作者：[Barrett Chambers][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/barrettc
[b]: https://github.com/lujun9972
[1]: https://www.percona.com/
[2]: https://techcrunch.com/2017/04/07/tracking-the-explosive-growth-of-open-source-software/
[3]: https://docs.aws.amazon.com/quickstart/latest/mongodb/welcome.html
[4]: https://en.wikipedia.org/wiki/Five_nines
[5]: https://www.percona.com/live/mysql-conference-2015/sessions/bookingcom-evolution-mysql-system-design
[6]: https://allthingsopen.org/talk/choosing-the-right-open-source-database/
[7]: https://allthingsopen.org/
