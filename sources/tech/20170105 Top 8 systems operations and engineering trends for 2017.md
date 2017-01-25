翻译中--by zky001
Top 8 systems operations and engineering trends for 2017
=================

Forecasting trends is tricky, especially in the fast-moving world of systems operations and engineering. This year, at our Velocity Conference, we have talked about distributed systems, SRE, containerization, serverless architectures, burnout, and many other topics related to the human and technological challenges of delivering software. Here are some of the trends we see for the next year:

### 1\. Distributed Systems

We think this is important enough that we [re-focused the entire Velocity conference on it][1].



### 2\. Site Reliability Engineering

[Site Reliability Engineering][3]—is it just ops? [Or is it DevOps by another name][4]? Google's profile for an ops professional calls for heavy doses of systems and software engineering. Spread further into the industry by Xooglers at companies like Dropbox, [hiring for SRE positions][5] continues to increase, particularly for web-facing companies with large data centers. In some contexts, the role of SREs becomes more about helping developers operate their own services.

### 3\. Containerization

Companies will continue to containerize their software delivery. Docker Inc. itself has positioned Docker as a tool for "[incremental revolution][6]," and containerizing legacy applications has become a common use case in the enterprise. What's the future of Docker? As engineers continue to adopt orchestration tools like Kubernetes and Mesos, the higher level of abstraction may make more room for other flavors of containers (like rkt, Garden, etc.).

### 4\. Unikernels

Are unikernels the next step after containerization? Are they unfit for production? Some tout the security and performance benefits of unikernels. Keep an eye out for how unikernels evolve in 2017, [particularly with an eye to what Docker Inc. does][7] in this area (having acquired Unikernel Systems this year).

### 5\. Serverless

Serverless architectures treat functions as the basic unit of computation. Some find the term misleading (and reminiscent of "noops"), and prefer to refer to this trend as Functions-as-a-Service. Developers and architects are experimenting with the technology more and more, and expect to see more applications being written in this paradigm. For more on what serverless/FaaS means for operations, check out the free ebook on [Serverless Ops][8] by Michael Hausenblas.

### 6\. Cloud-Native application development

Like DevOps, this term has been used and abused by marketers for a long while, but the Cloud Native Computing Foundation makes a strong case for these new sets of tools (often Google-inspired) that take advantage not just of the cloud, but in particular the strengths and opportunities provided by distributed systems—in short, microservices, containerization, and dynamic orchestration.

### 7\. Monitoring

As the industry has evolved from Nagios-style monitoring, to streaming metrics and visualizations, we've become great at producing loads of systems data. Interpretation is the next challenge. As such, we are seeing vendors offering machine learning-powered monitoring services, and, more generally, IT operations learning techniques for machine learning systems data. Similarly, as our infrastructure becomes more dynamic and distributed, monitoring becomes less and less about checking the health of individual resources and more about tracing flows between services. As such, distributed tracing has emerged.

### 8\. DevOps Security

With DevOpsSec increasing in popularity, [security is quickly becoming a team-wide concern][9]. The classic challenge of DevOps of achieving both velocity and reliability is especially pronounced when companies with security and compliance concerns are feeling the pinch to compete on speed.

### Tell us about your work

As an IT operations professional—whether you use the term sysadmin, DevOps, SRE, DBA, etc.—[you’re invited to share your insights][10] to help us learn about the demographics, work environments, tools, and compensation of practitioners in our growing field. All responses are reported in aggregate to assure your anonymity. The survey will require approximately 5–10 minutes to complete. Once we've closed the survey and analyzed the results, we'll share our findings with you. [Take the survey][11].

--------------------------------------------------------------------------------

作者简介：

![](https://d3tdunqjn7n0wj.cloudfront.net/1440x1440/courtney-nash-crop-a9cb0b44a4262f20524d171195d6d485.jpg)

Courtney Nash chairs multiple conferences for O'Reilly Media and is the strategic content director focused on areas of modern web operations, high performance applications, and security. An erstwhile academic neuroscientist, she is still fascinated by the brain and how it informs our interactions with and expectations of technology. She's spent 17 years working in the technology industry in a wide variety of roles, ever since moving to Seattle to work at a burgeoning online bookstore. Outside work, Courtney can be found biking, hiking, skiing, ...

![](https://d3tdunqjn7n0wj.cloudfront.net/1440x1440/brian_anderson-ae207faed42e8b7a2e73b7f82573c8ea.jpg)

Brian Anderson, Infrastructure and Operations Editor at O’Reilly Media, covers topics essential to the delivery of software — from traditional system administration, to cloud computing, web performance, Docker, and DevOps. He has been working in online education and serving the needs of working learners for more than ten years.

--------------------------------------------------------------------------------

via: https://www.oreilly.com/ideas/top-8-systems-operations-and-engineering-trends-for-2017

作者：[Courtney Nash][a]，[Brian Anderson][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.oreilly.com/people/3f5d7-courtneyw-nash
[b]:https://www.oreilly.com/people/brian_anderson
[1]:https://www.oreilly.com/ideas/velocity-a-new-direction
[2]:https://www.oreilly.com/ideas/top-8-systems-operations-and-engineering-trends-for-2017?imm_mid=0ec113&cmp=em-webops-na-na-newsltr_20170106
[3]:https://www.oreilly.com/ideas/what-is-sre-site-reliability-engineering
[4]:http://conferences.oreilly.com/velocity/devops-web-performance-ny/public/content/devops-sre-ama-video
[5]:https://www.glassdoor.com/Salaries/site-reliability-engineer-salary-SRCH_KO0,25.htm
[6]:http://blog.scottlowe.org/2016/06/21/dockercon-2016-day-2-keynote/
[7]:http://www.infoworld.com/article/3024410/application-virtualization/docker-kicks-off-unikernel-revolution.html
[8]:http://www.oreilly.com/webops-perf/free/serverless-ops.csp?intcmp=il-webops-free-lp-na_new_site_top_8_systems_operations_and_engineering_trends_for_2017_body_text_cta
[9]:https://www.oreilly.com/learning/devopssec-securing-software-through-continuous-delivery
[10]:http://www.oreilly.com/webops-perf/2016-ops-survey.html
[11]:http://www.oreilly.com/webops-perf/2016-ops-survey.html
