[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Start developing in the cloud with Eclipse Che IDE)
[#]: via: (https://opensource.com/article/19/10/cloud-ide-che)
[#]: author: (Bryant Son https://opensource.com/users/brson)

Start developing in the cloud with Eclipse Che IDE
======
Eclipse Che offers Java developers an Eclipse IDE in a container-based
cloud environment.
![Tools in a cloud][1]

In the many, many technical interviews I've gone through in my professional career, I've noticed that I'm rarely asked questions that have definitive answers. Most of the time, I'm asked open-ended questions that do not have an absolutely correct answer but evaluate my prior experiences and how well I can explain things.

One interesting open-ended question that I've been asked several times is:

> "As you start your first day on a project, what five tools do you install first and why?"

There is no single definitely correct answer to this question. But as a programmer who codes, I know the must-have tools that I cannot live without. And as a Java developer, I always include an interactive development environment (IDE)—and my two favorites are Eclipse IDE and IntelliJ IDEA.

### My Java story

When I was a student at the University of Texas at Austin, most of my computer science courses were taught in Java. And as an enterprise developer working for different companies, I have mostly worked with Java to build various enterprise-level applications. So, I know Java, and most of the time I've developed with Eclipse. I have also used the Spring Tools Suite (STS), which is a variation of the Eclipse IDE that is installed with Spring Framework plugins, and IntelliJ, which is not exactly open source, since I prefer its paid edition, but some Java developers favor it due to its faster performance and other fancy features.

Regardless of which IDE you use, installing your own developer IDE presents one common, big problem: _"It works on my computer, and I don't know why it doesn't work on your computer."_

[![xkcd comic][2]][3]

Because a developer tool like Eclipse can be highly dependent on the runtime environment, library configuration, and operating system, the task of creating a unified sharing environment for everyone can be quite a challenge.

But there is a perfect solution to this. We are living in the age of cloud computing, and Eclipse Che provides an open source solution to running an Eclipse-based IDE in a container-based cloud environment.

### From local development to a cloud environment

I want the benefits of a cloud-based development environment with the familiarity of my local system. That's a difficult balance to find.

When I first heard about Eclipse Che, it looked like the cloud-based development environment I'd been looking for, but I got busy with technology I needed to learn and didn't follow up with it. Then a new project came up that required a remote environment, and I had the perfect excuse to use Che. Although I couldn't fully switch to the cloud-based IDE for my daily work, I saw it as a chance to get more familiar with it.

![Eclipse Che interface][4]

Eclipse Che IDE has a lot of excellent [features][5], but what I like most is that it is an open source framework that offers exactly what I want to achieve:

  1. Scalable workspaces leveraging the power of cloud
  2. Extensible and customizable plugins for different runtimes
  3. A seamless onboarding experience to enable smooth collaboration between members



### Getting started with Eclipse Che

Eclipse Che can be installed on any container-based environment. I run both [Code Ready Workspace 1.2][6] and [Eclipse Che 7][7] on [OpenShift][8], but I've also tried it on top of [Minikube][9] and [Minishift][10].

![Eclipse Che on OpenShift][11]

Read the requirement guides to ensure your runtime is compatible with Che:

  * [Che on Kubernetes][12]
  * [Che on OpenShift-compatible OSS environments like OKD][13]



For instance, you can quickly install Eclipse Che if you launch OKD locally through Minishift, but make sure to have at least 5GB RAM to have a smooth experience.

There are various ways to install Eclipse Che; I recommend leveraging the Che command-line interface, [chectl][14]. Although it is still in an incubator stage, it is my preferred way because it gives multiple configuration and management options. You can also run the installation as [an Operator][15], which you can [read more about][16]. I decided to go with chectl since I did not want to take on both concepts at the same time. Che's quick-start provides [installation steps for many scenarios][17].

### Why cloud works best for me

Although the local installation of Eclipse Che works, I found the most painless way is to install it on one of the common public cloud vendors.

I like to collaborate with others in my IDE; working collaboratively is essential if you want your application to be something more than a hobby project. And when you are working at a company, there will be enterprise considerations around the application lifecycle of develop, test, and deploy for your application.

Eclipse Che's multi-user capability means each person owns an isolated workspace that does not interfere with others' workspaces, yet team members can still collaborate on application development by working in the same cluster. And if you are considering moving to Eclipse Che for something more than a hobby or testing, the cloud environment's multi-user features will enable a faster development cycle. This includes [resource management][18] to ensure resources are allocated to each environment, as well as security considerations like [authentication and authorization][19] (or specific needs like [OpenID][20]) that are important to maintaining the environment.

Therefore, moving Eclipse Che to the cloud early will be a good choice if your development experience is like mine. By moving to the cloud, you can take advantage of cloud-based scalability and resource flexibility while on the road.

### Use Che and give back

I really enjoy this new development configuration that enables me to regularly code in the cloud. Open source enables me to do so in an easy way, so it's important for me to consider how to give back. All of Che's components are open source under the Eclipse Public License 2.0 and available on GitHub at the following links:

  * [Eclipse Che GitHub][21]
  * [Eclipse Che Operator][15]
  * [chectl (Eclipse Che CLI)][14]



Consider using Che and giving back—either as a user by filing bug reports or as a developer to help enhance the project.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/cloud-ide-che

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT (Tools in a cloud)
[2]: https://opensource.com/sites/default/files/uploads/1_xkcd.jpg (xkcd comic)
[3]: https://xkcd.com/1316
[4]: https://opensource.com/sites/default/files/uploads/0_banner.jpg (Eclipse Che interface)
[5]: https://www.eclipse.org/che/features
[6]: https://developers.redhat.com/products/codeready-workspaces/overview
[7]: https://che.eclipse.org/eclipse-che-7-is-now-available-40ae07120b38
[8]: https://www.openshift.com/
[9]: https://kubernetes.io/docs/tutorials/hello-minikube/
[10]: https://www.okd.io/minishift/
[11]: https://opensource.com/sites/default/files/uploads/2_openshiftresources.jpg (Eclipse Che on OpenShift)
[12]: https://www.eclipse.org/che/docs/che-6/kubernetes-single-user.html
[13]: https://www.eclipse.org/che/docs/che-6/openshift-single-user.html
[14]: https://github.com/che-incubator/chectl
[15]: https://github.com/eclipse/che-operator
[16]: https://opensource.com/article/19/6/kubernetes-potential-run-anything
[17]: https://www.eclipse.org/che/docs/che-7/che-quick-starts.html#running-che-locally_che-quick-starts
[18]: https://www.eclipse.org/che/docs/che-6/resource-management.html
[19]: https://www.eclipse.org/che/docs/che-6/user-management.html
[20]: https://www.eclipse.org/che/docs/che-6/authentication.html
[21]: https://github.com/eclipse/che
