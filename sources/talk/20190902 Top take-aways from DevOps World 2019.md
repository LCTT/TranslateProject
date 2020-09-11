[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Top take-aways from DevOps World 2019)
[#]: via: (https://opensource.com/article/19/9/devops-world-2019)
[#]: author: (Patrick Housley https://opensource.com/users/patrickhousley)

Top take-aways from DevOps World 2019
======
Some of the biggest announcements from August's major DevOps event.
![Globe up in the clouds][1]

In August, I had the opportunity to join more than 2,000 people gathered in San Francisco for DevOps World 2019. Following are some of the most newsworthy announcements from the 150 breakout sessions and 16 workshops held over the four-day event.

### Standardizing CI/CD

The greatest advantage and sometimes the most difficult challenge for our industry is the number of options we have for solving problems. Both are true for continuous integration and continuous development (CI/CD); it seems as though there's a new product or tool every week. This means we have amazing flexibility and control in how we implement CI/CD for our products and organizations. It also means we have a flood of opinions about how CI/CD _should_ be implemented. While there are some agreed-upon concepts (like shift-left), there is not much in the way of standards or best practices. That's not surprising. Continuously integrating features and bug fixes and continuously delivering those to a production environment for customer consumption are still fairly new.

Our struggles have not gone unnoticed, and in March, the Linux Foundation announced the formation of the [Continuous Delivery Foundation][2]. The CD Foundation's goals are to provide a vendor-neutral home for many of the tools we rely on and to provide support to DevOps practitioners around learning and developing industry best practices. To do this, the CD Foundation is bringing together some of the most-used and fastest-growing open source projects with the companies and users using their solutions. The first projects to join the foundation include Jenkins, Jenkins X, Spinnaker, and Tekton, and its members include CapitalOne, CircleCI, CloudBees, Google, Huawei, Netflix, and many more.

### Creating a BOK for CI/CD

One of the most significant contributors to the success of agile and the [theory of constraints][3] is having a body of knowledge (BOK). A BOK is a collection of industry learnings that embody the principles of a professional domain. For example, the CD Foundation's focus will not be on standardizing the tools we use for CI/CD but on standardizing the collective knowledge about how to implement those tools and CI/CD in general.

To that end, I want to give a special shout-out to the [DevOps Institute][4], a new member of the CD Foundation. Technology tools and practices can be complex, difficult to learn, and even harder to stay up-to-date on. The DevOps Institute is trying to tackle this by providing training and learning resources to help us stay skilled-up. Even better, it is launching an [Ambassador Program][5] to help spread its reach around the world. I encourage everyone to take a look and consider signing up.

### Integrating DevOps metrics and reporting

It's doubtful we will see any slowdown around the release of new CI/CD tools, and the CD Foundation's and DevOps Institute's valuable initiatives won't affect that. I am also sure we will continue to find innovative ways to move code from our developers' laptops to our production systems (hopefully with some quality checks in between). So, how can we follow the flow of that code from laptop to production? Can we follow new code from a twinkle in a customer's eye to when we release their idea (and see their jumps for joy when we do)?

In today's DevOps, we use multiple tools to track our work. It usually starts with some type of issue tracker, like Jira or Trello. We work in a feature branch in our code repository and eventually merge to the trunk branch with a pull request. Along the way, our CI tools (like Jenkins) build, test, and scan our code to make sure we didn't fat-finger something, and eventually, our CD tooling deploys our code into pre-production and production environments.

Even if all these tools are operating perfectly and our CI/CD implementation is the best in the world, we still have one piece missing: How can leadership, product owners, and developers take all the data these tools are generating and construct some knowledge from it? How can these individuals get a bird's-eye view of what features and bug fixes went out in the last 24 hours? How can they monitor the lead time for those changes?

We can use something along the lines of an [ELK Stack][6] to centralize our data collection and create pretty dashboards. We could also use custom shell scripts to drive our CI/CD instead of Jenkins, but I wouldn't advocate for that. Not that there is anything wrong with ELK, but I'm not a big data engineer, and trying to find what ties the logs of two completely different tools together does not sound fun to me.

There is a clear gap in tools that can do this off the shelf, and I hope we will see some new offerings in this area soon.

### Learning with new book releases

If like me, you like to learn through reading, following are some new books I picked up at DevOps World that you may want to acquire to further your DevOps knowledge.

  * [_Epic Failures in DevSecOps: Volume 1_][7] edited by Mark Miller
  * [_Effective Feature Management_][8] by John Kodumal
  * [_The Continuous Application Security Handbook_][9] by Contrast Security
  * [_Engineering DevOps_][10] by Marc Hornbeek
  * [_The Unicorn Project_][11] by Gene Kim



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/devops-world-2019

作者：[Patrick Housley][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/patrickhousley
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-globe.png?itok=_drXt4Tn (Globe up in the clouds)
[2]: https://cd.foundation/
[3]: https://en.wikipedia.org/wiki/Theory_of_constraints
[4]: https://devopsinstitute.com/
[5]: https://devopsinstitute.com/become-a-community-member/devops-institute-ambassador/
[6]: https://www.elastic.co/what-is/elk-stack
[7]: https://www.amazon.com/Epic-Failures-DevSecOps-Mark-Miller/dp/1728806992
[8]: https://launchdarkly.com/effective-feature-management-ebook/
[9]: https://www.contrastsecurity.com/continuous-app-sec-cas
[10]: https://engineeringdevops.com/
[11]: https://www.amazon.com/gp/product/1942788762
