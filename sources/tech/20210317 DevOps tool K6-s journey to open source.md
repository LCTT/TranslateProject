[#]: subject: (DevOps tool K6’s journey to open source)
[#]: via: (https://opensource.com/article/21/3/journey-to-open-source)
[#]: author: (Ben Rometsch https://opensource.com/users/flagsmith)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

DevOps tool K6’s journey to open source
======
K6's CEO says the company's decision to make the load-testing service's
core technology open source is a big part of its success.
![pipe in a building][1]

Robin Gustafsson, CEO of [K6][2], an open source load-impact service, joined [Ben Rometsch][3], CEO of [Flagsmith][4], an open source feature-flagging product, on episode 8 of [The Craft of Open Source][5] podcast. Their conversation offers interesting insights into what K6 does, how the software developed, and the decisions the project made along the way.

K6 provides a load-testing service, which means it helps identify reliability and scalability problems in software systems such as websites, web apps, APIs, and microservices. In other words, K6 can be programmed to test whatever needs to be tested to identify potential issues from increased traffic and overloading.

K6 is split into two entities—an open source load-testing project and a commercial software-as-a-service (SaaS) product that provides custom load-testing services for paying clients.

### The birth of K6

The company behind K6 started in 2000 as a game development studio specializing in massively multiplayer online games but (much like Slack) pivoted to network-related products.

In 2008, the company moved into network monitoring, providing consulting services to many different companies and organizations, including large government agencies in Sweden, where the company is based. The founders quickly realized there was a demand for a SaaS-based load-testing product, and several years ago, they began to develop K6.

K6 was born around the same time AWS launched, and it became an early adopter, taking advantage of the elasticity of Amazon's computing and data centers.

### Moving from proprietary to almost-open

Initially, the software was 100% proprietary, as it was a gated SaaS product; open source wasn't even on the radar.

But over time, businesses began to take a different approach to quality assurance and testing. K6 looked at how to fit the product into an automation pipeline with continuous integration (CI) workflows. The team decided that opening up parts of the technology would make it easier for companies to integrate load testing, grow K6's user base, and convert some open source users to paying customers.

### Onward to open source

Feedback from customers suggested they preferred open source solutions to help them avoid being locked into a technology. Therefore, in 2016, the K6 team decided to pivot the load-testing tool to an open source model and create a commercial service offering infrastructure management through the cloud, including load testing, storage, and presentation of the results. It has proved to be a useful and successful service, especially for high-traffic customers with a huge number of data points in each load test.

Before K6, the team worked on a proprietary testing product written in C and scripted in Lua. Eventually, the team decided to migrate to a language that they felt would attract the greatest number of contributors, and they felt that the right choice was either Go or Rust. After investigating the DevOps tool chest, they decided that many popular tools, such as those by HashiCorp, were written in Go. Therefore, K6 was scripted in Go.

Initially, the team tried to reuse some of the C program's coding and structure, but they soon found that Go is a different animal altogether. Also, there were issues tying in the original Lua scripting with JavaScript. Therefore, the team abandoned the first iteration and started from scratch.

By February 2017, a basic open source version of K6 was ready to go, and the developers pushed it to GitHub. It was an early version, but it was functional and could execute a load-testing task. Early adopters provided valuable feedback, which helped K6 focus on what they felt the primary value was: eliminating the burden of managing infrastructure, not in traffic generation. K6 allows customers to enter a command in their terminal, and the K6 development team spins up the infrastructure, gathers gigabytes of metrics, and presents it as easy-to-digest graphs and charts. This is much easier, faster, and more convenient than the business trying to manage hundreds of cloud servers by themselves.

### Measuring success

Data privacy and tracking is a thorny issue that affects many software service providers. K6 decided to track the aggregate number of test runs rather than individual installations and how they are used. Robin says they decided to collect as little data as possible, as more data adds to company liability. The downside is that they can't answer investors' questions about how many installations or users the open source project has because they don't know. Instead, they provide the test run telemetry, which is valuable information without being overly intrusive.

Another way to monitor the project's success is by keeping an eye on its GitHub repository. Many people come to the K6 repo, take a look at the code, run a trial with the open source build, and after several weeks or months, they try the SaaS product. GitHub stars, in fact, appear to contribute to people becoming paying customers later. Rather than relying on traditional marketing, K6 focuses on building relationships with developers, who then take K6 to the organizations they work for.

Significantly, the K6 cloud service uses the exact same open source binary, not a custom binary. In other words, if you want to run your own service using your own infrastructure, you can do it using the same executable as the K6 SaaS uses. That's a power that only open source offers: you can pay for the K6 team to make it easy for you, or you can compile your own executable and build your own infrastructure for specialized and customized requirements.

To get the full picture of K6's journey in the competitive DevOps tools space, check out the [full podcast][6] episode.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/journey-to-open-source

作者：[Ben Rometsch][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/flagsmith
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_pipe_red_hat_tower_building.png?itok=8ho3yi7L (pipe in a building)
[2]: https://github.com/loadimpact/k6
[3]: https://www.linkedin.com/in/benrometsch/
[4]: https://github.com/Flagsmith
[5]: https://www.flagsmith.com/podcast
[6]: https://www.flagsmith.com/podcast/08-robin-gustafsson-ceo-k6
