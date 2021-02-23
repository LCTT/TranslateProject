[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Akraino: An Open Source Project for the Edge)
[#]: via: (https://www.linux.com/news/akraino-an-open-source-project-for-the-edge/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Akraino: An Open Source Project for the Edge
======

Akraino is an open-source project designed for the Edge community to easily integrate open source components into their stack. It’s a set of open infrastructures and application blueprints spanning a broad variety of use cases, including 5G, AI, Edge IaaS/PaaS, IoT, for both provider and enterprise Edge domains. We sat down with Tina Tsou, TSC Co-Chair of the Akraino project to learn more about it and its community.

Here is a lightly edited transcript of the interview:

Swapnil Bhartiya: Today, we have with us Tina Tsou, TSC Co-Chair of the Akraino project. Tell us a bit about the Akraino project.

Tina Tsou: Yeah, I think Akraino is an Edge Stack project under Linux Foundation Edge. Before Akraino, the developers had to go to the upstream community to download the upstream software components and integrate in-store to test. With the blueprint ideas and concept, the developers can directly do the use-case base to blueprint, do all the integration, and [have it] ready for the end-to-end deployment for Edge.

Swapnil Bhartiya: The blueprints are the critical piece of it. What are these blueprints and how do they integrate with the whole framework?

Tina Tsou: Based on the certain use case, we do the community CI/CD ( continuous integration and continuous deployment). We also have proven security requirements. We do the community lab and we also do the life cycle management. And then we do the production quality, which is deployment-ready.

Swapnil Bhartiya: Can you explain what the Edge computing framework looks like?

Tina Tsou: We have four segments: Cloud, Telco, IoT, and Enterprise. When we do the framework, it’s like we have a framework of the Edge compute in general, but for each segment, they are slightly different. You will see in the lower level, you have the network, you have the gateway, you have the switches. In the upper of it, you have all kinds of FPGA and then the data plan. Then, you have the controllers and orchestration, like the Kubernetes stuff and all kinds of applications running on bare metal, virtual machines or the containers. By the way, we also have the orchestration on the site.

Swapnil Bhartiya: And how many blueprints are there? Can you talk about it more specifically?
Tina Tsou: I think we have around 20-ish blueprints, but they are converged into blueprint families. We have a blueprint family for telco appliances, including Radio Edge Cloud, and SEBA that has enabled broadband access. We also have a blueprint for Network Cloud. We have a blueprint for Integrated Edge Cloud. We have a blueprint for Edge Lite IoT. So, in this case, the different blueprints in the same blueprint family can share the same software framework, which saves a lot of time. That means we can deploy it at a large scale.

Swapnil Bhartiya: The software components, which you already talked about in each blueprint, are they all in the Edge project or there are some components from external projects as well?

Tina Tsou: We have the philosophy of upstream first. If we can find it from the upstream community, we just directly take it from the upstream community and install and integrate it. If we find something that we need, we go to the upstream community to see whether it can be changed or updated there.

Swapnil Bhartiya: How challenging or easy it is to integrate these components together, to build the stack?

Tina Tsou: It depends on which group and family we are talking about. I think most of them at the middle level of middle are not too easy, not too complex. But the reference has to create the installation, like the YAML files configuration and for builds on ISO images, some parts may be more complex and some parts will be easy to download and integrate.

Swapnil Bhartiya: We have talked about the project. I want to talk about the community. So first of all, tell us what is the role of TSC?

Tina Tsou: We have a whole bunch of documentation on how TSA runs if you want to read. I think the role for TSC is more tactical steering. We have a chair and co-chair, and there are like 6-7 subcommittees for specific topics like security, technical community, CI and documentation process.

Swapnil Bhartiya: What kind of community is there around the Akraino project?

Tina Tsou: I think we have a pretty diverse community. We have the end-users like the telcos and the hyperscalers, the internet companies, and also enterprise companies. Then we have the OEM/ODM vendors, the chip makers or the SoC makers. Then have the IP companies and even some universities.

Swapnil Bhartiya: Tina, thank you so much for taking the time today to explain the Akraino project and also about the blueprints, the community, and the roadmap for the project. I look forward to seeing you again to get more updates about the project.

Tina Tsou: Thank you for your time. I appreciate it.
--------------------------------------------------------------------------------

via: https://www.linux.com/news/akraino-an-open-source-project-for-the-edge/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
