[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building Zero Trust authentication for multi-cloud application services)
[#]: via: (https://www.linux.com/articles/building-zero-trust-authentication-for-multi-cloud-application-services/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Building Zero Trust authentication for multi-cloud application services
======

[![][1]][2]

[![][1]][2]

One of the fundamental challenges organizations have about multi-cloud and hybrid cloud environments, is how to easily establish secure communication across different clouds and environments. Cloud providers have their own identity and access management solutions, such as AWS IAM, to manage what access an instance should and should not have. But as soon as the applications or services  need to communicate from AWS to GCP or from AWS to their on-prem infrastructure, it becomes a challenge because it’s AWS-specific and not interoperable. Engineering and operations teams need something secure that could work across environments and at the same time should not add any friction to the deployment cycles

This is the problem [Scytale][3], a is trying to address with Secure Production Identity Framework for Everyone ([SPIFFE][4]) and SPIFFE Runtime Environment ([SPIRE][5]). Both of these open-source  projects originated at Scytale but now are part of  the Cloud Native Computing Foundation (CNCF). These projects have grown in popularity within the cloud native community and have seen contributions from organizations such as Amazon, Bloomberg, Google, Pinterest, Square , Uber and more.

“Scytale is the primary driver of these projects that offer ‘interoperable identity’ between different cloud providers and different platforms,” Evan Gilman, Senior Engineer at Scytale.io and co-author of _[Zero Trust Networks][6]_. “From the commercial angle, we have built solutions to help organizations adopt these projects faster and  extend their functionalities to address the needs of enterprise customers .”

**Vendor and technology neutral identity solution**
The passport analogy best explains interoperable identity. Passports from different countries all look different, but they all have the same size and meet the same specifications. They all have a picture of the passport holder at the same spot, they all have a barcode at the bottom. Regardless of what country issued the passport, it works across the globe.

A “country” can be a particular software stack, platform, or a cloud provider. Regardless of the environment, the identities that exist within and between those silos can communicate.

Interoperable identity becomes even more critical in the multi-cloud and hybrid cloud deployments, as they raise this fundamental challenge of how users secure communication across those boundaries.

“We are bringing in a platform-agnostic service identity that is not specific to a cloud provider, platform, and technology,” said Gilman. It levels the playing field and allows users to talk across boundaries. Users won’t talk in AWS or GCP specifics; they communicate on the SPIFFE level. “SPIFFE provides users with what is sometimes referred to as a secure dial tone: you pick up the phone, it rings the other side irrespective of where it’s running and what platform it’s running on,” added Gilman.

**SPIFFE based service** authentication **foundational for zero trust networks**
SPIFFE is a standard, a set of documents whereas SPIRE is the software implementation of that standard. SPIRE implements the SPIFFE specifications and enables workloads or services to get these “passports” as soon as they boot, in a way that is very reliable, scalable, and highly automated. This identity centric authentication is also critical for building a zero trust-based security model  , which removes reliance on networks to deliver trustworthy information.

“Networks have been historically fairly manipulable. So instead we build systems in such a way that it doesn’t rely on that network to deliver trustworthy information,” said Gilman, “We use protocols and strong authentication and authorization to try to mitigate any kind of business that might happen on the wire. It also mitigates what we call lateral movement. So if a neighbor is compromised, just because you’re attached to the same network, that should not mean that you should gain access that you would not have otherwise.”

Gilman explains, “Part of the SPIFFE specification set deals with what we call ‘federation’. There is usually a centralized authority that issues these identities. In reality, there are different companies that have their own authorities. Even different software stacks have their own authorities. There is a need to bridge these gaps.”

That’s where the SPIFFE Federation enters the picture. It swaps these cryptographic keys between different domains. It allows users with different identity providers to communicate effortlessly.

One key design principle of the SPIFFE Federation is that it is compatible with OIDC, which is a similar identity federation spec, but is more focused around users. It allows for server-to-server and service-to-service communication. Any existing OIDC can take advantage of it and pass one of its SPIFFE identity documents to a public cloud like AWS, which will be able to validate it using this OIDC SPIFFE Federation mechanism.

While SPIFFE as a specification doesn’t change, SPIRE has a monthly release cadence. It continues to add new features on a regular basis.

The latest release introduced integration with the AWS Private CA Manager, which means that SPIRE deployments living inside AWS can use it to protect the sign-in keys for identities. These identities are cryptographically backed so there is a key that is used to sign these identities. One of the biggest challenges is to secure these sign-in keys. Being able to bury that key inside the AWS service, which is backed by hardware protection, is an incredible feature.

The community is also working on a feature called Nested SPIRE, which allows users to have multiple SPIRE server clusters that form a tree and chain up to each other.

Together, these new features give a lot of flexibility in terms of architecting for failure modes and failure domains, and architecting around different security domains.

--------------------------------------------------------------------------------

via: https://www.linux.com/articles/building-zero-trust-authentication-for-multi-cloud-application-services/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2020/01/buffer-1143485_1920-1068x638.jpg (passport)
[2]: https://www.linux.com/wp-content/uploads/2020/01/buffer-1143485_1920.jpg
[3]: https://scytale.io/
[4]: https://spiffe.io/
[5]: https://spiffe.io/spire/
[6]: https://www.amazon.com/Zero-Trust-Networks-Building-Untrusted/dp/1491962194
