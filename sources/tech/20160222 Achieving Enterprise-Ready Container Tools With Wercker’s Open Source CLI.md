Achieving Enterprise-Ready Container Tools With Wercker’s Open Source CLI
===========================================
#CoderBOBO translating

For enterprises, containers offer more efficient build environments, cloud-native applications and migration from legacy systems to the cloud. But enterprise adoption of the technology -- Docker specifically -- has been hampered by, among other issues, [a lack of mature developer tools][1].

Amsterdam-based [Wercker][2] is one of many early-stage companies looking to meet the need for better tools with its cloud platform for automating microservices and application development, based on Docker.

The company [announced a $4.5 million Series A][3] funding round this month, which will help it  ramp up development on an upcoming on-premise enterprise product. Key to its success, however, will be building a community around its newly [open-sourced CLI][4] tool. Wercker must quickly integrate with myriad other container technologies -- open source Kubernetes and Mesos among them -- to remain competitive in the evolving container space.

“By open sourcing our CLI technology, we hope to get to dev-prod parity faster and turn “build once, ship anywhere” into an automated reality,” said Wercker CEO and founder Micha Hernández van Leuffen.

I reached out to van Leuffen to learn more about the company, its CLI tool, and how it’s planning to help grow the pool of enterprise customers actually using containers in production. Below is an edited version of the interview.

### Linux.com: Can you briefly tell us about Wercker?

van Leuffen: Wercker is a container-centric platform for automating the development of microservices and applications.

With Wercker’s Docker-based infrastructure, teams can increase developer velocity with custom automation pipelines using steps that produce containers as artifacts. Once the build passes, users can continue to deploy the steps as specified in the wercker.yml. Continuously repeating these steps allows teams to work in small increments, making it easy to debug and ship faster.

![](https://www.linux.com/images/stories/66866/wercker-cli.png)

### Linux.com: How does it help developers?

van Leuffen: The Wercker CLI helps developers attain greater dev-prod parity. They’re able to release faster and more often because they are developing, building and testing in an environment very similar to that in production. We’ve open sourced the exact same program that we execute in the Wercker cloud platform to run your pipelines.

### Linux.com: Can you point out some of the features and advantages of your tool as compared to competitors?

van Leuffen: Unlike some of our competitors, we’re not just offering Docker support. With Wercker, the Docker container is the unit of work. All jobs run inside containers, and each build artifact can be a Docker container.

Wercker’s Docker container pipeline is completely customizable. A ‘pipeline’ refers to any automated workflow, for instance, a build or deploy pipeline. In those workflows, you want to execute tasks: install dependencies, test your code, push your container, or create a slack notification when something fails, for example. We call these tasks ‘steps,’ and there is no limit to the types of steps created. In fact, we have a marketplace of steps built by the Wercker community. So if you’ve built a step that fits my workflow, I can use that in my pipeline.

Our Docker container pipelines adapt to any developer workflow. Users can use any Docker container out there — not just those made by or for Wercker. Whether the container is on Docker Hub or a private registry such as CoreOS’s Quay, it works with Wercker.

Our competitors range from the classic CI/CD tools to larger-scale DevOps solutions like CloudBees.

### Linux.com: How does it integrate with other cloud technologies?

van Leuffen: Wercker is vendor-agnostic and can automate development with any cloud platform or service. We work closely with ecosystem partners like Mesosphere, Kubernetes and CoreOS to make integrations as seamless as possible. We also recently partnered with Atlassian to integrate the Wercker platform with Bitbucket. More than 3 million Bitbucket users can install the Wercker Pipeline Viewer and view build status directly from their dashboard.

### Linux.com: Why did you open source the Wercker CLI tool?

van Leuffen: Open sourcing the Wercker CLI will help us stay ahead of the curve and strengthen the developer community. The market landscape is changing fast; developers are expected to release more frequently, using infrastructure of increasing complexity. While Docker has solved a lot of infrastructure problems, developer teams are still looking for the perfect tools to test, build and deploy rapidly.

The Wercker community is already experimenting with these new tools: Kubernetes, Mesosphere, CoreOS. It makes sense to tap that community to create integrations that work with our technology – and make that process as frictionless as possible. By open sourcing our CLI technology, we hope to get to dev-prod parity faster and turn “build once, ship anywhere” into an automated reality.

### Linux.com: You recently raised over $4.5 million, so how is this fund being used for product development?

van Leuffen: We’re focused on building out our commercial team and bringing an enterprise product to market. We’ve had a lot of inbound interest from the enterprise looking for VPC and on-premise solutions. While the enterprise is still largely in the discovery stage, we can see the market shifting toward containers. Enterprise software devs need to release often, just like the small, agile teams with whom they are increasingly competing. We need to prove containers can scale, and that Wercker has the organizational permissions and the automation suite to make that process as efficient as possible.

In addition to continuing to invest in our product, we’ll be focusing our resources on market education and developer evangelism. Developer teams are still looking for the right mix of tools to test, build and deploy rapidly (including Kubernetes, Mesosphere, CoreOS, etc.). As an ecosystem, we need to do more to educate and provide the tutorials and resources to help developers succeed in this changing landscape.

### Linux.com: What products do you offer and who is your target audience?

van Leuffen: We currently offer one service level of our product Wercker; however, we’re developing an enterprise offering. Current organizations using Wercker range from startups, such as Open Listings, to larger companies and big agencies, like Pivotal Labs.


### Linux.com: What does this recently open-sourced CLI do?

van Leuffen: Using the Wercker Command Line Interface (CLI), developers can spin up Docker containers on their desktop, automate their build and deploy processes and then deploy them to various cloud providers, like AWS, and scheduler and orchestration platforms, such as Mesosphere and Kubernetes.

The Wercker Command Line Interface is available as an open source project on GitHub and runs on both OSX and Linux machines.


--------------------------------------------------------------------------------

via: https://www.linux.com/news/enterprise/systems-management/887177-achieving-enterprise-ready-container-tools-with-werckers-open-source-cli

作者：[Swapnil Bhartiya][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/community/forums/person/61003
[1]:http://thenewstack.io/adopting-containers-enterprise/
[2]:http://wercker.com/
[3]:http://venturebeat.com/2016/01/28/wercker-raises-4-5-million-open-sources-its-command-line-tool/
[4]:https://github.com/wercker/wercker


