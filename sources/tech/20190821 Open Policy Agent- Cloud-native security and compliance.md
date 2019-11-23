[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open Policy Agent: Cloud-native security and compliance)
[#]: via: (https://opensource.com/article/19/8/open-policy-agent)
[#]: author: (Tim Hinrichs https://opensource.com/users/thinrich)

Open Policy Agent: Cloud-native security and compliance
======
A look at three use cases where organizations used Open Policy Agent to
reliably automate cloud-based access policy control.
![clouds in the sky with blue pattern][1]

Every product or service has a unique way of handling policy and authorization: who-can-do-what and what-can-do-what. In the cloud-native world, authorization and policy are more complex than ever before. As the cloud-native ecosystem evolves, there’s a growing need for DevOps and DevSecOps teams to identify and address security and compliance issues earlier in development and deployment cycles. Businesses need to release software on the order of minutes (instead of months). For this to happen, those security and compliance policies—which in the past were written in PDFs or email—need to be checked and enforced by machines. That way, every few minutes when software goes out the door, it’s obeying all of the necessary policies.

This problem was at the top of our minds when Teemu Koponen, Torin Sandall, and I founded the [Open Policy Agent project (OPA)][2] as a practical solution for the critical security and policy challenges of the cloud-native ecosystem. As the list of OPA’s successful integrations grows—thanks to active involvement by the open source community—the time is right to re-introduce OPA and offer a look at how it addresses business and policy pain points in varied contexts.

### What is OPA?

OPA is a general-purpose policy engine that makes policy a first-class citizen within the cloud-native ecosystem, putting it on par with servers, networks, and storage. Its uses range from authorization and admission control to data filtering. The community uses OPA for Kubernetes admission control across all major cloud providers, as well as on on-premises deployments, along with HTTP API authorization, remote access policy, and data filtering. Since OPA’s RESTful APIs use JSON over HTTP, OPA can be integrated with any programming language, making it extremely flexible across services.

OPA gives policy its own lifecycle and toolsets, so policy can be managed separately from the underlying systems that the policy applies to. Launched in 2016, OPA provides local enforcement for the sake of higher availability, better performance, greater flexibility, and more expressiveness than hard-coded service logic or ad-hoc domain-specific languages. With dedicated tooling for new users and experienced practitioners, combined with many integrations to third-party systems, OPA empowers administrators with unified, flexible, and granular policy control across their entire software stack. OPA also provides policy guardrails around Kubernetes admission control, HTTP API authorization, entitlement management, remote access, and data filtering. In 2018, we donated OPA to the [Cloud Native Computing Foundation][3], a vendor-neutral home, and since then it has graduated from the sandbox to the incubating stage.

### What can OPA do in the real world?

In short, OPA provides unified, context-aware policy controls for cloud-native environments. OPA policy is context-aware, meaning that the administrator can make policy decisions based on what is happening in the real world, such as:

  * Is there currently an outage?
  * Is there a new vulnerability that’s been released?
  * Who are the people on call right now?



Its policies are flexible enough to accommodate arbitrary context and arbitrary. OPA has been proven in production in some of the largest cloud-native deployments in the world—from global financial firms with trillions under management to technology giants and household names—but is also in use at emerging startups and regional healthcare organizations.

Beyond our own direct experiences, and thanks to the open source community’s innovations, OPA continues to mature and solve varied and evolving customer authorization and policy problems, such as Kubernetes admission control, microservice authorization, and entitlements management for both end-user and employee-facing applications. We’re thrilled by both the depth and breadth of innovative use cases unfolding in front of our eyes. To better articulate some of the real-world problems OPA is solving, we looked across OPA’s business-critical deployments in the user community to provide the following examples.

#### Provide regulatory compliance that role-based access control (RBAC) can’t.

This lesson came to us through a global bank with trillions in assets. Their problem: A breach that occurred because a third-party broker had too much access. The bank’s relationship with the public was under significant stress, and it was also penalized with nearly $100 million in fines.

How did such a breach happen? In short, due to the complexity of trying to map decades of role-based access control (RBAC) onto every sprawling monolithic app. With literally millions of roles across thousands of internal and external applications, the bank’s situation was—not unlike most large, established corporations—impossible to manage or troubleshoot. What started out as a best practice (RBAC) could no longer scale. Static roles, based on business logic, cannot be tested. They can’t be deployed inline. They can’t be validated like today’s modern code can. Simply put, RBAC cannot alone manage access at cloud scale.

OPA facilitated a solution: Rearchitect and simplify application access with a local context-based authorization that’s automated, tested, audited, and scalable. There are both technology and business benefits to this approach. The main technology benefit is that the authorization policy (rules that establish what a given user can do) is built, tested, and deployed as part of continuous integration and continuous delivery (CI/CD). Every decision is tied directly to microservices and apps for auditing and validation, and all access is based not on role, but on the current context.

Instead of creating thousands of roles to cover every permutation of what’s allowed, a simple policy can determine whether or not the user should have access, and to a very fine degree. This simplified policy greatly, since context drives access decisions. Versioning and backtesting aren’t required, since every time a new policy is needed the entire policy set is re-created, eliminating nested issues and legacy role sprawl. The local-only policy also eliminates the presence of conflicting rules/roles across repositories.

The major business benefit is that compliance became easier through the separation of duties (with security teams—not developers—writing policy) and by providing clear, testable visibility into access policy across applications. This process accelerated development since AppDev teams were freed from having to code Authz or policy directly into applications, and central RBAC repositories no longer need to be updated, maintained, and made available.

#### Provide regulatory compliance and safety by default.

Another large bank, with nearly 20,000 employees, was in the untenable scenario of managing policy with spreadsheets. This situation may sound comical, but it‘s far more common than you might think. Access is often "managed" via best effort and tribal knowledge. Teams document access policy in PDFs, on Wikis, or in spreadsheets. They then rely on well-intentioned developers to read, understand, and remember access rules and guidelines. The bank had business reasons to move from monolithic apps to Kubernetes (K8s)—primarily improving differentiation and time to market—but it's legacy compliance solutions weren’t compatible with K8s.

The bank knew that while it was a financial institution, it was _really_ a software organization. Rather than relying on human memory and best effort, the staff started thinking of policy with a GitOps mindset (pull requests, comments, and peer review to get to consensus and commitment). OPA became the single source of truth behind what was (or wasn’t) allowed with policy, implementing a true policy-as-code solution where effort was removed from the equation entirely, thanks to automation.

The K8s platform that the bank created was compliant by default, as it executed company regulatory policies exactly, every time. With OPA, the bank could build, deploy, and version its regulatory policy through an agile process, ensuring that all users, teams, and services were always obeying policy. The infrastructure is now compliant because compliance is literally built into the infrastructure.

#### Streamline and strengthen institutional knowledge.

A major telecommunications company had an education problem that was sapping time and money. Its pain points: It had created and maintained its own admission control (AC) service; had a slow, costly, HR-heavy support model that couldn’t scale as its developer base grew; and it had a hammer-like enforcement model that wasn’t efficient, slowing time to market.

OPA was deployed to replace the custom AC, thereby saving resources. The guardrails OPA provided allowed management to discover and deploy key policies that they developed from world events (and problems) that they wanted to eliminate moving forward.

Management has now become accustomed to using policy-as-code and is able to hone in on the specific policies that developers trip over most. The primary benefit for this company was in the person-hours saved by not having to talk to the same developers about the same problems over and over again, and by being able to educate about and enforce policies automatically. The insights from these efforts allow the company to target education (not enforcement) to the teams that need it, proactively focusing on providing help to struggling teams.

### Learn More about OPA

To learn how to use OPA to help with your authorization and policy or to learn how to contribute, check out the [Open Policy Agent on Github][4] or check out the tutorials on different usecases at the [OPA homepage][2].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/open-policy-agent

作者：[Tim Hinrichs][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thinrich
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_cloud_cc.png?itok=XSV7yR9e (clouds in the sky with blue pattern)
[2]: https://www.openpolicyagent.org/
[3]: https://www.cncf.io/
[4]: https://github.com/open-policy-agent/opa
