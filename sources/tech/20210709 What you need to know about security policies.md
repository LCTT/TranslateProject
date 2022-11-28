[#]: subject: (What you need to know about security policies)
[#]: via: (https://opensource.com/article/21/7/what-security-policy)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
What you need to know about security policies
======
Learn about protecting your personal computer, server, and cloud systems
with SELinux, Kubernetes pod security, and firewalls.
![Lock][1]

A **security policy** is a set of permissions that govern access to a system, whether the system is an organization, a computer, a network, an application, a file, or any other resource. Security policies often start from the top down: Assume nobody can do anything, and then allow exceptions.

On a desktop PC, the default policy is that no user may interact with the computer until after logging in. Once you've successfully logged in, you inherit a set of digital permissions (in the form of metadata associated with your login account) to perform some set of actions. The same is true for your phone, a server or network on the internet, or any node in the cloud.

There are security policies designed for filesystems, firewalls, services, daemons, and individual files. Securing your digital infrastructure is a job that's never truly finished, and that can seem frustrating and intimidating. However, security policies exist so that you don't have to think about who or what can access your data. Being comfortably familiar with potential security issues is important, and reading through known security issues (such as NIST's great [RSS feed][2] for [CVE entries][3]) over your [power breakfast][4] can be more eye-opening than a good cup of coffee, but equally important is being familiar with the tools at your disposal to give you sensible defaults. These vary depending on what you're securing, so this article focuses on three areas: your personal computer, the server, and the cloud.

### SELinux

[SELinux][5] is a **labeling system** for your personal computer, servers, and the Linux nodes of the cloud. On a modern Linux system running SELinux, every process has a label, as does every file and directory. In fact, any system object gets a label. Luckily, you're not the one who has to do the labeling. These labels are created for you automatically by SELinux.

Policy rules govern what access is granted between labeled **processes** and labeled **objects**. The kernel enforces these rules. In other words, SELinux can ensure that an action is safe whether a user appears to deserve the right to perform that action or not. It does this by understanding what processes are permitted. This protects a system from a bad actor who gains escalated permissions—whether it's through a security exploit or by wandering over to your desk after you've gotten up for a coffee refill—by understanding the expected interactions of all of your computer's components.

For more information about SELinux, read our [illustrated guide to SELinux][6] by Dan Walsh. To learn more about using SELinux, read [A sysadmin's guide to SELinux][7] by Alex Callejas, and download our free [SELinux cheat sheet][8].

### Kubernetes pod security

In the world of the Kubernetes cloud, there are **Security Policies** and **Security Contexts**.

Pod [Security Policies][9] are an implementation of Kubernetes pod security resources. They are built-in resources that describe specific conditions that pods must conform to in order to be accepted and scheduled. For example, Pod Security Policies can leverage restrictions on which types of volumes a pod may be allowed to mount or what user or group IDs the pod is not allowed to use. Unlike Security Contexts, these are restrictions controlled by the cluster's Control Plane that decide if a given pod is allowed within the Kubernetes system, even before it is created. If the pod spec does not meet the requirements of the Pod Security Policy, it is rejected.

[Security Contexts][10] are similar to Pod Security Policies, in that they describe what a pod or container can and cannot do but in the context of the container runtime. Recall that the Pod Security Policies are enforced in the Control Plane. Security Contexts are provided in the spec of the pod and describe to the container runtime (e.g., Docker, CRI-O, etc.) specifically how the pod should run. There's a lot of overlap in the kinds of restrictions found in Pod Security Policies and Security Contexts. The former can be thought of as "these are the things a pod in this policy may do," while the latter is "this pod must be run with these specific rules."

#### The state of Pod Security Policies

Pod Security Policies are deprecated and will be removed in Kubernetes 1.25. In April 2021, Tabitha Sable of Kubernetes SIG Security wrote about the [deprecation and replacement of Pod Security Policies][11]. There's an open pull request that describes proposed [Kubernetes enhancements][12] with a new admission controller to enforce pod security standards, which is suggested as the replacement for the deprecated Pod Security Policies. The architecture acknowledges, however, that there's a large ecosystem of add-ons and complementary services that can be mixed and matched to provide coverage that meets an organization's needs.

For now, Kubernetes has published [Pod Security Standards][13] describing the overall concept of layered policy types, from totally unrestricted **Privileged** pods to minimally restricted **Baseline** and then heavily **Restricted** policies, and publishing these example policies as Pod Security Policies. The documentation describes what restrictions make up these different profiles and provide an excellent starting point to get familiar with different types of restrictions that might be applied to a pod to increase security.

#### Future of security policies

The future of pod security in Kubernetes will likely include an admission controller like the one proposed in the enhancement PR and a mix of add-ons for tweaking and adjusting how pods run in the cluster, such as [Open Policy Agent][14] (OPA). Kubernetes is extremely flexible given just how complicated its job is, and this change follows the same pattern that has allowed Kubernetes to be so successful: managing container orchestration well and allowing an entire ecosystem of add-ons and tools to enhance and extend the core so that it is not a one-size-fits-all solution.

### Firewalls

Protecting your network is just as important as protecting the computers inside it. For that, there are firewalls. Some firewalls come embedded in routers, but computers have firewalls too, and in large organizations, they run the firewall for the entire network.

Typical firewall policies are constructed by denying all traffic, followed by judicious exceptions for necessary incoming and outgoing communication. Individual users can learn more about the `firewall-cmd` in Seth Kenlon's [Getting started with Linux firewalls][15]. Sysadmins can learn more about firewalls in Seth's [Secure your network with firewall-cmd][16]. And both users and admins can benefit from our free [firewall-cmd cheat sheet][17].

### Security policies

Security policies are important for protecting people and their data no matter what the system. Buildings and tech conferences need security policies to keep people physically safe, and computers need security policies to keep data safe from abuse.

Spend some time thinking about the security of the systems in your life, getting familiar with the default policies, and choosing your level of comfort for the different risks you identify. Then establish a security policy, and stick to it. As with [backup plans][18], security won't get addressed unless it's _easy_, so make it second nature to maintain good security practices.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/what-security-policy

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss-analyzed.xml
[3]: https://nvd.nist.gov/vuln/data-feeds#APIS
[4]: https://opensource.com/article/21/6/breakfast
[5]: https://en.wikipedia.org/wiki/Security-Enhanced_Linux
[6]: https://opensource.com/business/13/11/selinux-policy-guide
[7]: https://opensource.com/article/18/7/sysadmin-guide-selinux
[8]: https://opensource.com/downloads/cheat-sheet-selinux
[9]: https://kubernetes.io/docs/concepts/policy/pod-security-policy/
[10]: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/
[11]: https://kubernetes.io/blog/2021/04/06/podsecuritypolicy-deprecation-past-present-and-future/
[12]: https://github.com/kubernetes/enhancements/issues/2579
[13]: https://kubernetes.io/docs/concepts/security/pod-security-standards/
[14]: https://www.openpolicyagent.org/
[15]: https://opensource.com/article/20/2/firewall-cheat-sheet
[16]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[17]: https://opensource.com/downloads/firewall-cheat-sheet
[18]: https://opensource.com/article/19/3/backup-solutions
