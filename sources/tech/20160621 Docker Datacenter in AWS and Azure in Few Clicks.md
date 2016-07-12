translated by pspkforever
DOCKER DATACENTER IN AWS AND AZURE IN A FEW CLICKS
===================================================

Introducing Docker Datacenter AWS Quickstart and Azure Marketplace Templates production-ready, high availability deployments in just a few clicks.

The Docker Datacenter AWS Quickstart uses a CloudFormation templates and pre-built templates on Azure Marketplace to make it easier than ever to deploy an enterprise CaaS Docker environment on public cloud infrastructures.

The Docker Datacenter Container as a Service (CaaS) platform for agile application development provides container and cluster orchestration and management that is simple, secure and scalable for enterprises of any size. With our new cloud templates pre-built for Docker Datacenter, developers and IT operations can frictionlessly move dockerized applications to an Amazon EC2 or Microsoft Azure environment without any code changes. Now businesses can quickly realize greater efficiency of computing and operations resources and Docker supported container management and orchestration in just a few steps.

### What is Docker Datacenter?

Docker Datacenter includes Docker Universal Control Plane, Docker Trusted Registry (DTR), CS Docker Engine with commercial support & subscription to align to your application SLAs:

- Docker Universal Control Plane (UCP), an enterprise-grade cluster management solution that helps you manage your whole cluster from a single pane of glass
- Docker Trusted Registry (DTR), an image storage solution that helps securely store and manage the Docker images.
- Commercially Supported (CS) Docker Engines

![](http://img.scoop.it/lVraAJgJbjAKqfWCLtLuZLnTzqrqzN7Y9aBZTaXoQ8Q=)

### Deploy on AWS in a single click with the Docker Datacenter AWS Quick Start

With AWS Quick Start reference deployments you can rapidly deploy Docker containers on the AWS cloud, adhering to Docker and AWS best practices. The Docker Datacenter Quick Start uses CloudFormation templates that are modular and customizable so you can layer additional functionality on top or modify them for your own Docker deployments.

[Docker Datacenter for AWS Quickstart](https://youtu.be/aUx7ZdFSkXU)

#### Architecture

![](http://img.scoop.it/sZ3_TxLba42QB-r_6vuApLnTzqrqzN7Y9aBZTaXoQ8Q=)

The AWS Cloudformation starts the installation process by creating all the required AWS resources such as the VPC, security groups, public and private subnets, internet gateways, NAT gateways, and S3 bucket.

It then launches the first UCP controller instances and goes through the installation process of Docker engine and UCP containers. It backs the Root CAs created by the first UCP controllers to S3. Once the first UCP controller is up and running, the process of creating the other UCP controllers, the UCP cluster nodes, and the first DTR replica is triggered. Similar to the first UCP controller node, all other nodes are started by installing Docker Commercially Supported engine, followed by running the UCP and DTR containers to join the cluster. Two ELBs, one for UCP and one for DTR, are launched and automatically configured to provide resilient load balancing across the two AZs.

Additionally, UCP controllers and nodes are launched in an ASG to provide scaling functionality if needed. This architecture ensures that both UCP and DTR instances are spread across both AZs to ensure resiliency and high-availability. Route53 is used to dynamically register and configure UCP and DTR in your private or public HostedZone.

![](http://img.scoop.it/HM7Ag6RFvMXvZ_iBxRgKo7nTzqrqzN7Y9aBZTaXoQ8Q=)

### Key functionality of this Quickstart templates includes the following:

- Creates a New VPC, Private and Public Subnets in different AZs, ELBs, NAT Gateways, Internet Gateways, AutoScaling Groups- all based on AWS best practices
- Creates an S3 bucket for DDC to be used for cert backup and DTR image storage ( requires additional configuration in DTR )
- Deploys 3 UCP Controllers across multiple AZs  within your VPC
- Creates a UCP ELB with preconfigured health checks
- Creates a DNS record and attaches it to UCP ELB
- Deploys a scalable cluster of UCP nodes
- Backs up UCP Root CAs to S3
- Create a 3 DTR Replicas across multiple AZs within your VPC
- Creates a DTR with preconfigured health checks
- Creates a DNS record and attaches it to DTR ELB

[Download the AWS Quick Start Guide to Learn More](https://s3.amazonaws.com/quickstart-reference/docker/latest/doc/docker-datacenter-on-the-aws-cloud.pdf)

### Getting Started with Docker Datacenter for AWS

1. Go to [Docker Store][1] to get your [30 day free trial][2] or [contact sales][4].
2. At confirmation, you’ll be prompted to “Launch Stack” and you’ll be directed to the AWS Cloudformation portal.
3. Confirm your AWS Region that you’d like to launch this stack in
4. Provide the required parameters
5. Confirm and Launch.
6. Once complete, click on outputs tab to see the URLs of UCP/DTR, default username, and password, and S3 bucket name.

[Request up to $2000 AWS credit for Docker Datacenter](https://aws.amazon.com/mp/contactdocker/)

### Deploy on Azure with pre-built templates on Azure Marketplace

Docker Datacenter is available as pre-built template on Azure Marketplace for you to run instantly on Azure across various datacenters globally. Customers can choose to deploy Docker Datacenter from various VM choices offered on Azure as it fits their needs.

#### Architecture

![](http://img.scoop.it/V9SpuBCoAnUnkRL3J-FRFLnTzqrqzN7Y9aBZTaXoQ8Q=)

The Azure deployment process begins by entering some basic information about the user including, the admin username for ssh-ing into all the nodes (OS level admin user) and the name of the resource group. You can think of the resource group as a collection of resources that has a lifecycle and deployment boundary. You can read more about resource groups here: <azure.microsoft.com/en-us/documentation/articles/resource-group-overview/>

Next you will enter the details of the cluster, including: VM size for UCP controllers, Number of Controllers (default is 3), VM size for UCP nodes, Number of UCP nodes (default is 1, max of 10), VM size for DTR nodes, Number of DTR nodes (default is 3), Virtual Network Name and Address (ex. 10.0.0.1/19). Regarding networking, you will have 2 subnets: the first subnet is for the UCP controller nodes and the second subnet is for the DTR and UCP nodes.

Lastly you will click OK to complete deployment. Provisioning should take about 15-19 minutes for small clusters with a few additional minutes for larger ones.  

![](http://img.scoop.it/DXPM5-GXP0j2kEhno0kdRLnTzqrqzN7Y9aBZTaXoQ8Q=)

![](http://img.scoop.it/321ElkCf6rqb7u_-nlGPtrnTzqrqzN7Y9aBZTaXoQ8Q=)

#### How to Deploy in Azure

1. Register for [a  30 day free trial][5] license of Docker Datacenter or [contact sales][6].
2. [Go to Docker Datacenter on the Microsoft Azure Marketplace][7]
3. [Review Deployment Documents][8]

Get Started by registering for a Docker Datacenter license and you’ll be prompted with the ability to launch either the AWS or Azure templates.

- [Get a 30 day trial license][9]
- [Understand Docker Datacenter architecture with this video][10]
- [Watch demo videos][11]
- [Get $75 AWS credit torwards your deployment][12]

### Learn More about Docker

- New to Docker? Try our 10 min [online tutorial][20]
- Share images, automate builds, and more with [a free Docker Hub account][21]
- Read the Docker [1.12 Release Notes][22]
- Subscribe to [Docker Weekly][23]
- Sign up for upcoming [Docker Online Meetups][24]
- Attend upcoming [Docker Meetups][25]
- Watch [DockerCon EU 2015 videos][26]
- Start [contributing to Docker][27]



--------------------------------------------------------------------------------

via: https://blog.docker.com/2016/06/docker-datacenter-aws-azure-cloud/

作者：[Trisha McCanna][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.docker.com/author/trisha/
[1]: https://store.docker.com/login?next=%2Fbundles%2Fdocker-datacenter%2Fpurchase?plan=free-trial
[2]: https://store.docker.com/login?next=%2Fbundles%2Fdocker-datacenter%2Fpurchase?plan=free-trial
[4]: https://goto.docker.com/contact-us.html
[5]: https://store.docker.com/login?next=%2Fbundles%2Fdocker-datacenter%2Fpurchase?plan=free-trial
[6]: https://goto.docker.com/contact-us.html
[7]: https://azure.microsoft.com/en-us/marketplace/partners/docker/dockerdatacenterdocker-datacenter/
[8]: https://success.docker.com/Datacenter/Apply/Docker_Datacenter_on_Azure
[9]: http://www.docker.com/trial
[10]: https://www.youtube.com/playlist?list=PLkA60AVN3hh8tFH7xzI5Y-vP48wUiuXfH
[11]: https://www.youtube.com/playlist?list=PLkA60AVN3hh8a8JaIOA5Q757KiqEjPKWr
[12]: https://aws.amazon.com/quickstart/promo/
[20]: https://docs.docker.com/engine/understanding-docker/ 
[21]: https://hub.docker.com/
[22]: https://docs.docker.com/release-notes/
[23]: https://www.docker.com/subscribe_newsletter/
[24]: http://www.meetup.com/Docker-Online-Meetup/
[25]: https://www.docker.com/community/meetup-groups
[26]: https://www.youtube.com/playlist?list=PLkA60AVN3hh87OoVra6MHf2L4UR9xwJkv
[27]: https://docs.docker.com/contributing/contributing/

