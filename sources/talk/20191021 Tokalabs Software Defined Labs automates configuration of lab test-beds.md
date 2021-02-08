[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tokalabs Software Defined Labs automates configuration of lab test-beds)
[#]: via: (https://www.networkworld.com/article/3446816/tokalabs-software-defined-labs-automates-configuration-of-lab-test-beds.html)
[#]: author: (Linda Musthaler https://www.networkworld.com/author/Linda-Musthaler/)

Tokalabs Software Defined Labs automates configuration of lab test-beds
======
The primary challenge of running a test lab is the amount of time it takes to provision the test beds within the lab. This software defined lab platform automates the setup and configuration process so that tests can be accelerated.
7Postman / Getty Images

Network environments have become so complex that companies such as systems integrators, equipment manufacturers and enterprise organizations feel compelled to test their configurations and equipment in lab environments before deployment. Performance test labs are used extensively for quality, proof of concept, customer support, and technical sales initiatives. Labs are the perfect place to see how well something performs before it’s put into a production environment.

The primary challenge of running a test lab is the amount of time it takes to provision the test environments. A network lab infrastructure might include switches, routers, servers, [virtual machines][1] running on various server clusters, security services, cloud resources, software and so on. It takes considerable time to wire the configurations, physically build the desired test beds, login to each individual device and load the proper software configurations. Quite often, lab staffers spend more time on setup than they do on conducting actual tests.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][2]

This is a problem that the networking company Allied Telesis was having in building test beds for its own development engineers. The company developed an application for internal use that would ease the setup and reconfiguration problem. The equipment could be physically cabled once and then configured and controlled centrally through software. The application worked so well that Allied Telesis spun it off for others to use, and this is the origin of [Tokalabs Software Defined Labs][3] (SDL) technology.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Tokalabs provides a platform that enables engineers to manage a lab-network infrastructure and create sandboxes or topologies that can be used for R&amp;D, product development and quality testing, customer support, sales demos, competitive benchmarking, driving proof of concept efforts, etc. There’s an automation sequencer built into the platform that allows users to automate test cases, sales demos, troubleshooting methods, image upgrades and the like. 

The Tokalabs SDL controller is a virtual appliance that can be imported into any virtualization environment. Once installed, the customer can access the controller’s UI using a web browser. The controller has an auto-discovery mechanism that inventories everything within a specified range of IP addresses, including cloud resources.

Tokalabs probes the addresses to figure out what ports are open on them, what management types are supported, and the vendor information of the devices. This results in an inventory of hundreds of devices that are discovered by the SDL controller.

On the hardware side, lab engineers only need to cable and configure their lab devices once, which eliminates the cumbersome setup and tear down processes. These devices are abstracted and managed centrally through the SDL controller, which maintains a centralized networking fabric. Lab engineers have full visibility of every physical and virtual device and every public and [private cloud][5] instance within their domain.

Engineers can use the Tokalabs SDL controller to dynamically create and reserve test-bed resources and then save them as a template for future use. Engineers also can automate and schedule test executions and the controller will release the resources once the tests are done. The controller’s codeless automation feature means users don’t need to know how to write scripts to orchestrate and automate a pretty comprehensive configuration and test scenario. They can use the controller to automate sequences without writing code or instruct the controller to execute external scripts developed by an engineer.

The automation is helpful to set up a specific configuration quickly. For example, a customer-support engineer might need to replicate a scenario that one of its customers has in order to troubleshoot an issue. Using the controller’s automation feature, devices can be configured and loaded with specific firmware quickly to ease the setup process.

Tokalabs logs everything that transpires through its controller, so a lab administrator has oversight into how the equipment is being used or what types of tests are being created and executed. This helps with resource capacity planning, to ensure that there is enough equipment without having devices sit idle for too long.

One leader in cybersecurity became an early adopter of Tokalabs. This vendor has a test lab to conduct comparative benchmark numbers with competitors’ products in order to close large deals and to confirm their product strengths and performance numbers for marketing materials.

Prior to using the Tokalabs SDL controller, engineering teams would physically cable the topologies, configure the devices and execute various benchmark tests. Then they would tear down that configuration and start all over again for every set of devices and firmware revisions.

Given that this is a multi-billion-dollar equipment manufacturer, there are a lot of new product releases and updates to existing products. That means there’s a heck of a lot of work for the engineers in the lab to test each product and compare it to competitors’ offerings. They can’t really afford the time spent configuring rather than testing, so they turned to Tokalabs’ technology to manage the lab infrastructure and to automate the configurations and scheduling of test executions. They chose this solution largely for the ease of setup and use.

Now, each engineer can create hundreds of reusable templates, thus eliminating the repetitive work of creating test beds, and also automate test scripts using the Tokalabs’ automation sequencer. Additionally, all their existing test scripts are available to use through the SDL controller. This has helped the team reduce its backlog and keep up with the product release cycles.

Beyond this use case for comparative benchmark tests, some of the other uses for Tokalabs SDL include:

  * Creating a portal for others to use lab resources; for example, for training purposes or for customers to test network environments prior to purchasing them
  * Doing sales demonstrations and customer PoCs in order to showcase a feature, an application, or even an entire configuration
  * Automating bringing up virtualized environments



Tokalabs claims to work closely with its customers to tailor the Software Defined Labs platform to specific use cases and customer needs.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3446816/tokalabs-software-defined-labs-automates-configuration-of-lab-test-beds.html

作者：[Linda Musthaler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Linda-Musthaler/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3234795/what-is-virtualization-definition-virtual-machine-hypervisor.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://tokalabs.com/
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.networkworld.com/article/2159885/cloud-computing-gartner-5-things-a-private-cloud-is-not.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
