[#]: subject: "Security buzzwords to avoid and what to say instead"
[#]: via: "https://opensource.com/article/22/9/security-buzzword-alternatives"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Security buzzwords to avoid and what to say instead
======
Consider these thoughtful approaches to define what security really means in your open source project.

![Lock][1]

Image by: JanBaby, via Pixabay CC0.

Technology is a little famous for coming up with "buzzwords." Other industries do it, too, of course. "Story-driven" and "rules light" tabletop games are a big thing right now, "deconstructed" burgers and burritos are a big deal in fine dining. The problem with buzzwords in tech, though, is that they potentially actually affect your life. When somebody calls an application "secure," to influence you to use their product, there's an implicit promise being made. "Secure" must mean that something's secure. It's safe for you to use and trust. The problem is, the word "secure" can actually refer to any number of things, and the tech industry often uses it as such a general term that it becomes meaningless.

Because "secure" can mean both so much and so little, it's important to use the word "secure" carefully. In fact, it's often best not to use the word at all, and instead, just say what you actually mean.

### When "secure" means encrypted

Sometimes "secure" is imprecise shorthand for *encrypted*. In this context, "secure" refers to some degree of difficulty for outside observers to eavesdrop on your data.

**Don't say this:** "This website is resilient and secure."

That sounds pretty good! You're probably imagining a website that has several options for 2-factor authentication, zero-knowledge data storage, and steadfast anonymity policies.

**Say this instead:** "This website has a 99% uptime guarantee, and its traffic is encrypted and verifiable with SSL."

Not only is the intent of the promise clear now, it also explains how "secure" is achieved (it uses SSL) and what the scope of "secure" is.

Note that there's explicitly no promise here about privacy or anonymity.

### When "secure" means restricted access

Sometimes the term "secure" refers to application or device access. Without clarification, "secure" could mean anything from the useless *security by obscurity* model, to a simple htaccess password, to biometric scanners.

**Don't say this:** "We've secured the system for your protection."

**Say this instead:** "Our system uses 2-factor authentication."

### When "secure" means data storage

The term "secure" can also refer to the way your data is stored on a server or a device.

**Don't say this:** "This device stores your data with security in mind."

**Say this instead:** "This device uses full disk encryption to protect your data."

When remote storage is involved, "secure" may instead refer to who has access to stored data.

**Don't say this:** "Your data is secure."

**Say this instead:** "Your data is encrypted using PGP, and only you have the private key."

### When "secure" means privacy

These days, the term "privacy" is almost as broad and imprecise as "security." On one hand, you might think that "secure" must mean "private," but that's true only when "secure" has been defined. Is something private because it has a password barrier to entry? Or is something private because it's been encrypted and only you have the keys? Or is it private because the vendor storing your data knows nothing about you (aside from an IP address?) It's not enough to declare "privacy" any more than it is to declare "security" without qualification.

**Don't say this:** "Your data is secure with us."

**Say this instead:** "Your data is encrypted with PGP, and only you have the private key. We require no personal data from you, and can only identify you by your IP address."

Some sites make claims about how long IP addresses are retained in logs, and promises about never surrendering data to authorities without warrants, and so on. Those are beyond the scope of technological "security," and have everything to do with trust, so don't confuse them for technical specifications.

### Say what you mean

Technology is a complex topic with a lot of potential for confusion. Communication is important, and while shorthand and jargon can be useful in some settings, generally it's better to be precise. When you're proud of the "security" of your project, don't generalize it with a broad term. Make it clear to others what you're doing to protect your users, and make it equally clear what you consider out of scope, and communicate these things often. "Security" is a great feature, but it's a broad one, so don't be afraid to brag about the specifics.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/security-buzzword-alternatives

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/security-lock-password.jpg
