translating by lujun9972
Continuous infrastructure: The other CI
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_darwincloud_520x292_0311LL.png?itok=74DLgd8Q)

Continuous delivery (CD) and continuous integration (CI) are two well-known aspects of DevOps. But the CI in vogue today is missing a critical "I:" infrastructure.

There was a time when "infrastructure" meant headless black boxes, enormous server rooms, and towering racks--not to mention procurement processes that stretched for months and load estimates that erred on the side of surplus. Then came the virtual machine revolution, which made the infrastructure, well, virtual--and the world has never been the same. We no longer need to manage brick-and-mortar boxes. We can create and destroy, start and stop, upgrade and downgrade machines with just a few clicks.

There's a popular story about a bank that went digital and introduced online forms, which customers needed to fill out manually, print, and snail-mail to the bank. That's where we are today with infrastructure: using new technology to do things the same old way.

In this article, we'll look at progressive infrastructure management, treating infrastructure as a versioned artifact and exploring the concept of immutable servers. In a subsequent post, we'll look at how open source tools can be used to achieve continuous infrastructure.


![continuous infrastructure pipeline][2]


The in-practice continuous infrastructure pipeline

This is the familiar CI, release-early, release-often cycle pipeline. This pipeline is missing a key component: infrastructure.

Pop quiz:

  * How do you create and upgrade your infrastructure?
  * How do you control and track changes to your infrastructure?
  * How does your infrastructure scale with your business?
  * How do you ensure tests on the right infrastructure configuration?



To answer these questions, introduce continuous infrastructure. Split the CI build pipeline into continuous integration code (CIc) and continuous integration infrastructure (CIi) to develop and build code and infrastructure in parallel, converging the two for unified test and release. Make infrastructure a first-class citizen of the CI pipeline.


![pipeline with infrastructure][4]


CI pipeline with continuous infrastructure

The defining aspects of CIi include:

**1\. Code**

Create infrastructure by code, not by installation. Infrastructure as code (IaC) is the contemporary method used to develop infrastructure from configuration scripts. These scripts follow the typical development life cycle of coding and unit tests (see the Terraform script below for an example).

**2\. Version**

The IaC artifacts are versioned in the source repository. This brings all the advantages of version control to the infrastructure: consistency, traceability, branching, and tagging.

**3\. Manage**

With coded and versioned infrastructure, you can apply the familiar test and release processes to manage infrastructure development.

CIi offers the following advantages:

**1\. Consistency**

Versioned and tagged infrastructure means you unambiguously know the components and configuration of the system you are using. This establishes an excellent DevOps practice to identify and manage infrastructure consistently.

**2\. Reproducibility**

With infrastructure tagged and baselined, recreating infrastructure is easy. Think of how often you've heard this: "But it works on my machine!" Now you can reproduce a production-like environment quickly in a local test bench to remove environment as a variable of your debug cycle.

**3\. Traceability**

How many times have you gone through history to find out who changed the permissions of a folder, or who upgraded the **ssh** package? Coded, versioned, released infrastructure eliminates ad hoc changes, bringing easy traceability and predictability to infrastructure management.

**4\. Automation**

With scriptable infrastructure, automation is the next logical step. Automation lets you create infrastructure on demand and destroy it when you're done, so you can focus your valuable time and energy on more productive tasks.

**5\. Immutability**

CIi brings innovations such as immutable infrastructure. Instead of upgrading, you can simply create new infrastructure components (see the note on immutable infrastructure below).

Continuous infrastructure is about evolving run-environments with run-artifacts. Treat infrastructure like code, and take it through proven DevOps processes. The traditional CI is redefined to include that missing "i," leading to a coherent CD.

**(CIc + CIi) = CI -> CD**

## Infrastructure as code (IaC)

A key enabler for CIi pipeline is infrastructure as code (IaC). IaC is the mechanism for creating and upgrading infrastructure with configuration files. These configuration files are developed like code and versioned in version control system. The files follow the usual code development life cycle: unit test, commit, build, and release. IaC process brings all advantages of version control for infrastructure development, such as tagging, versioning consistency, and change traceability.

Here's a sample Terraform script to create a two-tier infrastructure on AWS, consisting of a virtual private cloud (VPC), an elastic load balancer (ELB), security groups, and an NGINX server. [Terraform][5] is an open source tool to create and change infrastructure through scripts.


![terraform script][7]


Sample Terraform script to create two-tier infrastructure on AWS

The complete script is available on [GitHub][8].

## Immutable infrastructure

You have several VMs running and need to apply a security patch. A common approach is to update all systems individually using a remote push script.

Instead of updating the old systems, how about throwing them away and deploying new systems with a security patch installed? This is immutable infrastructure. Since the previous version of infrastructure is versioned and tagged, installing the patch is simply a matter of updating the script and pushing it through the release pipeline.

Now do you see why infrastructure should be a first-class citizen of the CI pipeline?

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/continuous-infrastructure-other-ci

作者：[About The Author;Girish Managoli;With About Years;Experience In The Software It Industry;Girish Presently Holds Chief Architect Capacity At Mindtree;A Global It Services Organization;Based In India. Specialising In Paas;Saas Platforms;Girish Is Architect Of;I Got][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com
[1]:/file/376916
[2]:https://opensource.com/sites/default/files/images/life-uploads/figure1.jpg (continuous infrastructure pipeline in use)
[3]:/file/376921
[4]:https://opensource.com/sites/default/files/images/life-uploads/figure2.jpg (CI pipeline with infrastructure)
[5]:https://github.com/hashicorp/terraform
[6]:/file/376926
[7]:https://opensource.com/sites/default/files/images/life-uploads/figure3_0.png (sample terraform script)
[8]:https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/two-tier
