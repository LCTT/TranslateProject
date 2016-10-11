

Keeping Linux containers safe and secure
====

![Interview with Andy Cathrow of Anchore](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/bus-containers2.png?itok=rG1pTnZ4)

>Image credits : [Lucarelli](http://commons.wikimedia.org/wiki/User:Lucarelli) via [Wikimedia Commons](http://commons.wikimedia.org/wiki/File:Containers_Livorno.jpg). CC-BY-SA 3.0

Linux containers are helping to change the way that IT operates. In place of large, monolithic virtual machines, organizations are finding effective ways to deploy their applications inside Linux containers, providing for faster speeds, greater density, and increased agility in their operations.

While containers can bring a number of advantages from a security perspective, they come with their own set of security challenges as well. Just as with traditional infrastructure, it is critical to ensure that the system libraries and components running within a container are regularly updated in order to avoid vulnerabilities. But how do you know what is running inside of your containers? To help manage the full set of security challenges facing container technologies, a startup named[Anchore](https://anchore.com/) is developing an [open source](https://github.com/anchore/anchore)[ project](https://github.com/anchore/anchore) of the same name to bring visibility inside of Linux containers. 

To learn more about Anchore, I caught up with Andrew Cathrow, Anchore's vice president of products and marketing, to learn more about the open source project and the company behind it.

![](https://opensource.com/sites/default/files/images/life/Interview%20banner%20Q%26A.png)

### In a nutshell, what is Anchore? How does the toolset work?

Anchore's goal is to provide a toolset that allows developers, operations, and security teams to maintain full visibility of the 'chain of custody' as containers move through the development lifecycle, while providing the visibility, predictability, and control needed for production deployment. The Anchore engine is comprised of pluggable modules that can perform analysis (extraction of data and metadata from an image), queries (allowing reporting against the container), and policy evaluation (where policies can be specified that govern the deployment of images).

While there are a number of scanning tools on the market, most are not open source. We believe that security and compliance products should be open source, otherwise, how could you trust them?

Anchore, in addition to being open source, has two other major differentiators that set it apart from the commercial offerings in the market.

First, we look beyond the operating system image. Scanning tools today concentrate on operating system packages, e.g. "Do you have any CVEs (security vulnerabilities) in your RPMs or DEB packages?" While that is certainly important, you don't want vulnerable packages in your image, the operating system packages are just the foundation on which the rest of the image is built. All layers need to be validated, including configuration files, language modules, middleware, etc. You can have all the latest packages, but with even one configuration file wrong, insecurity sets in. A second differentiator is the ability to extend the engine by adding users' own data, queries or policies.

### What is driving the need for an inspection and analytics tool for containers? What problems are operators facing that this helps to solve?

A primary concern for enterprises adopting Docker today is security, in particular, the governance and compliance of the containers they are deploying. It's almost too easy to pull an application image from a public registry, run it, and within seconds deploy an application in production without even knowing what's under the covers. End users must have confidence that when they deploy applications they will be secure, performant and easily maintained.

Containers are opaque in that they are deployable ‘black boxes' that contain applications. While it's easy to treat these images as "just packaged applications," they include operating system images with up to hundreds of packages and thousands of files. As with all operating systems on physical servers, virtual machines, or in the cloud, images need to be maintained. The images may contain unpatched security vulnerabilities, outdated software that contains bugs, or may be misconfigured.

To have confidence in your container deployments you need to know what's under the covers to analyze and make decisions based on the contents of your container images.

### The innovation around containers today is almost entirely happening in open source. Why do you think that is? What's driving the desire for openness?

Over the past 20 years organizations have experienced the advantages open source brings to cost savings, reduced lock-in, improved security and faster innovation. Containers, and Docker specifically, are great examples. The team at Docker Inc. would not have been able to create this innovative new software deployment paradigm on top of a proprietary system. They would not have been able to make the required modifications to the code in a proprietary system, nor be able to work cooperatively with industry leaders such as Google, IBM, Intel, and Red Hat—all working toward a common goal. Open source and Linux have always enabled innovation and positive industry disruption. In the past, delivering a big idea required a big team and lots of resources. In the open source world, a small company with big ideas can work in the wider community and benefit from shared intellectual horsepower to collaboratively deliver real enterprise IT innovation.

To illustrate the deep adoption of open source, the Anchore team recently returned from LinuxCon in Toronto, where it was incredible to see Microsoft as a diamond level sponsor presenting a growing portfolio of their products that work with or on Linux! Linus Torvalds once said, "If Microsoft ever does applications for Linux it means I've won." I'd amend that statement to read "Open has won."

### The days of common standards in the container space are still very young, and there are still many competing visions for nearly every part of the stack. What challenges does that create for a startup in this space?

It is important to remember that without open standards and open source we wouldn't have seen the innovation that is driving rapid container adoption and changing the industry landscape. The Open Container Initiative (OCI), comprised of industry leaders from the Linux and Container industries, is doing great work setting standards for both the runtime and image formats that will allow us to see even more innovation. Anchore is proud to be a new member of the OCI and we look forward to helping form the standards.

### How are you working to build an open source community around the Anchore project?

The Anchore team has a rich history of building and working within open source communities, with leaders from Ansible, Eucalyptus Systems, and Red Hat. From the start, Anchore began building a strong open source community and we are applying lessons learned in the open source world. The first lesson, of course, is to release early and often. We open sourced our inspection and analysis engine back in June, far in advance of our commercial offering, to ensure that the open source project can stand on its own with features that make it useful to many end-users without having to purchase Anchore's commercial offering. There will always be opportunities to add more value with support, services, and enhanced data feeds with a commercial offering, but if the open source engine is not useful in itself then we will not see an active community.

We built Anchore to be modular to allow analysis, reporting and policy plugins to be added without requiring changes to the core engine. We want to ensure that anyone can create plugins, so we chose Python as the base language for the project because it is widely used by developers and sysadmins alike. But even if you are not well versed in Python you can still create plugins using whatever language or scripting environment you prefer. If you can create a bash script then you can create an Anchore plugin. Our goal is to enable the broadest possible community to attract participation. While we encourage our users to pass these contributions back to the community we've architected and licensed the project to ensure that private plugins/modules can be created and maintained independently.

### The promise of containers is not just greater application density on servers or greater speed on the technical side, but a combination of different tools that together provide a different way of approaching the way developers and operators work together. As a company working in this space, how are you providing a message that resonates with both developers and operators?

The container ecosystem is evolving rapidly with a growing number of runtime, orchestration, monitoring and integration products. So the first consideration we had to factor into our architecture was to not be prescriptive about Anchore deployment and usage, we need to ensure that we can fit into any CI/CD pipeline whether it's on-premise or deployed in the cloud. A common question we are asked is if Anchore will provide a container registry that includes image scanning and analysis. While this would simplify our work considerably, it would force customers into specific deployment architectures and limit customers' ability to deploy their own best-of-breed stack. We've made sure that Anchore works with all leading registries, runtime platforms, CI/CD platforms and orchestration tools.

Some developers are adding operations skills and moving to DevOps roles, and we see sysadmin/operations teams that are learning more about development as they take DevOps roles. We also see teams with mixed skills. We designed Anchore to be used by development operations and security teams so they can work together to define rules and policies that can be evaluated at any point in the development cycle. Another example is the architecture of the plugins/module interface that enables anyone to easily create a module in their favorite environment—whether it is Python, Go, Perl, C or even a bash script.

--------------------------------------------------------------------------------

via: https://opensource.com/business/16/10/interview-andy-cathrow-anchore

作者：[Jason Baker][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
