[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why We Need Interoperable Service Identity?)
[#]: via: (https://www.linux.com/articles/why-we-need-interoperable-identity/)
[#]: author: (TC CURRIE https://www.linux.com/author/tc_currie/)

Why We Need Interoperable Service Identity?
======

[![][1]][2]

[![][1]][2]

Interoperable service identity is necessary to secure communication between different cloud providers and different platforms. This presents a challenge with multi-cloud and hybrid deployments. How do you secure service to service communication across those boundaries?

Evan Gilman, Staff Engineer at  [Scytale.io][3] and co-author of _Zero Trust Networks_, illustrates this issue: when you’re in AWS, you’ll use an AWS IAM role in order to identify which instance a certain role should or should not have access to.  But in today’s multi-platform world, you can be communicating from AWS to GCP to your on-prem infrastructure. Those systems do not understand what IAM role is because it is AWS-specific.

This is what Scytale is trying to address.  *“*We are bringing a platform-agnostic identity, meaning, an identity that is not specific to a cloud provider or a platform, or any specific kind of technology,” he said.

**What’s SPIFFE?**

[Secure Production Identity Framework for Everyone (SPIFFE)][4] is a set of specifications that define interoperability across all tech platforms, such as how to format the name, the shape of the document, how you validate documents, etc.  “This SPIFFE level is like a secure dial tone,” Gilman explains. “You pick up the phone, it rings the other side, doesn’t really matter what platform it is or where it’s running or anything like that. The SPIFFE authentication occurs and you get a nice little layer of encryption and some authenticity insurances as well.”

But at the end of the day, SPIFFE is just a set of documents. SPIRE is the software implementation of the SPIFFE specifications.

“Think about the way the passports work,” he said.  “If you look at passports from different countries, they may be slightly different, but they have similar characteristics like SPIFFE specifications.  They’re all the same size. They all have a picture in the same spot. They have the same funny-looking barcode at the bottom, and so on. So, when you show your passport at a country border, they know how to read your passport, no matter what country that passport is from.  SPIRE is the passport agency in this analogy. Where does this passport come from? Who gives it to you? How do you get it and how do you do that in an automated fashion?”

SPIRE implements these SPIFFE specifications and enables workloads and services to get these passports as soon as they boot in a way that is very reliable, scalable, and very highly automated.

**Zero Trust**

Gilman is taking the philosophy of Zero Trust — don’t trust anybody whatsoever — and applying it to network infrastructure and service-to-service communication.  “We do this by removing all the security functions from the network and making no assumptions about what should or should not be allowed based on IP address,” he said.

“Instead, we build systems in such a way that they don’t rely on that network to deliver trustworthy information.   We use protocols for strong authentication and authorization to try to mitigate any kind of funny business that might happen on the wire.”

**Into the New Decade**

For Scytale, Gilman’s biggest push for 2020 is to provide documentation with detailed examples of how to solve different use cases, and how to configure the software to solve those use cases. “Very clear-cut guidance,” he states.  “We have a lot of flexibility and features built into the software, but we don’t have conceptual guidelines that can teach people how the internals are working and stuff like that. We button everything up and make the experience really easy to pick up for folks who might not necessarily want to get in the weeds with it. They just want it to work.”

--------------------------------------------------------------------------------

via: https://www.linux.com/articles/why-we-need-interoperable-identity/

作者：[TC CURRIE][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/tc_currie/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2019/12/computer-2930704_1280-696x413.jpg (computer-2930704_1280)
[2]: https://www.linux.com/wp-content/uploads/2019/12/computer-2930704_1280.jpg
[3]: http://scytale.io/
[4]: https://spiffe.io/
