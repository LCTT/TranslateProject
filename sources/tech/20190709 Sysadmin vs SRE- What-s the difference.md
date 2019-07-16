[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Sysadmin vs SRE: What's the difference?)
[#]: via: (https://opensource.com/article/19/7/sysadmins-vs-sres)
[#]: author: (Vince Power https://opensource.com/users/vincepower/users/craig5/users/dawnparzych/users/penglish)

Sysadmin vs SRE: What's the difference?
======
Both sysadmins and site reliability engineers are valuable parts of any
organization. Here's a look at each role differs.
![People work on a computer server with devices][1]

In the IT world, there has always been a pull between generalist and specialist. The stereotypical sysadmin falls in the generalist category 99 times out of 100. The [site reliability engineer (SRE)][2] role is specialized, however, and grew out of the needs of one of the first companies to know real scale: Google. Ultimately, these two roles have the same goal for the applications whose infrastructure they operate: providing a good experience for the applications’ consumers. Yet, these roles have drastically different starting points.

### Sysadmins: Neutral good incarnate

Sysadmins typically grow into their position by starting as entry-level desktop and network support, and then over time acquiring the broad set of skills most sysadmins have in common. By that point, these sysadmins know all of the systems and applications they are responsible for. They know the app on server one needs to be restarted every other Tuesday, or the service on server nine will crash on Wednesday with no errors. They have fine-tuned their monitoring so it ignores what doesn’t matter, even that error that happens on the third Sunday of the month, despite the fact that it’s marked as fatal.

In short, sysadmins know how to feed and care for the servers that run the core of your business. These sysadmins have grown to use automation to handle routine tasks across all the servers they manage. They love templates, golden images, and standards, but are flexible enough to make a parameter change on just the one server that has an error, and then make a note regarding why that server is now uniquely configured.

Sysadmins are great, but they have a couple of quirks. The first being that you just do not get root access without divine intervention, and that any changes they make which were not their idea have to be documented as required by the application they are working with’s vendor, and then will still be double-checked.

The servers are their domain, and no one messes with their stuff.

### SREs: Thanos would be proud

As opposed to the path to becoming a sysadmin, SREs are as likely to come from a development background as a sysadmin background. The SRE position is closer to the lifecycle you find in an application development environment.

As an organization grows and introduces [DevOps][3] concepts like [continuous integration][4] and [continuous delivery][5] (CI/CD), there will often be a skills gap on how to run those immutable applications across multiple environments while having them scale to meet the business’s needs. This is the world of an SRE. Yes, a sysadmin can learn the additional tools, but at scale, this easily becomes a full-time position to keep up. A specialist makes sense.

SREs use concepts like [infrastructure-as-code][6] to produce templates, which are called to deploy the environment an application will run in, with the goal of every application and its environment being completely reproducible with the push of a button. So, app one on server one in system testing will have the exact same binaries that will be used on server fifteen in production, with the exception of environment-specific variables like passwords and database connection strings.

An SRE will also completely destroy an environment and rebuild it based on a configuration change. There is no emotional attachment to any system. Each system is just a number and is tagged and lifecycled accordingly, even to the point that routine server patching is done by redeploying the entire application stack.

### Conclusion

In certain situations, especially when operating in large DevOps-based environments, the specialized skills an SRE provides regarding how to handle any level of scale definitely offer an advantage. And every time they get stuck, they will seek out the help of their friendly neighborhood sysadmin—or [(BOFH)][7] on a bad day—for those well-honed troubleshooting skills, and the breadth of experiences which sysadmins rely on to provide value to any organization they are a part of.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/sysadmins-vs-sres

作者：[Vince Power][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vincepower/users/craig5/users/dawnparzych/users/penglish
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server with devices)
[2]: https://en.wikipedia.org/wiki/Site_Reliability_Engineering
[3]: https://opensource.com/resources/devops
[4]: https://en.wikipedia.org/wiki/Continuous_integration
[5]: https://en.wikipedia.org/wiki/Continuous_delivery
[6]: https://en.wikipedia.org/wiki/Infrastructure_as_code
[7]: http://www.bofharchive.com/BOFH.html
