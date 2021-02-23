[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (humanID Project: Restoring Civil Discussion Through Better Online Identity)
[#]: via: (https://www.linux.com/audience/developers/humanid-project-restoring-civil-discussion-through-better-online-identity/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

humanID Project: Restoring Civil Discussion Through Better Online Identity
======

[![][1]][2]

[![][1]][2]

Every day, billions of people use social sign-ons, such as “Login with Facebook”, to access applications over the Internet. A major drawback of this system is the inability to distinguish a real human user from a bot.

Nonprofit organization [humanID][3], a recipient of [Harvard University’s Social Impact Fund][4], came up with an innovative idea: develop a one-click anonymous sign-on that serves as an alternative to social sign-on.

“With humanID, everyone can use services without giving up privacy or having their data sold. Bot networks are automatically excluded, while applications can easily block abusive users and trolls, creating more civil digital communities,” says [Bastian Purrer, Co-Founder of humanID][5].

humanID was born during Purrer’s stint in Indonesia. He was helping out a political party’s campaign and was aghast to discover how much of the political conversation during the election was controlled by bots and trolls.

When he realized that political parties routinely deploy bots to promote propaganda and false facts, it became clear that the key to restoring civil discussion, and the vision of an internet for everyone, was better online identity.

**The mission
** Besides Purrer, humanID’s other co-founders are [Sidiq Permana][6] and [Shuyao Kong][7]. Together, they lead a 20-person organization, with the tech team based in Indonesia while the business team is in Boston.

“Fixing the Internet is the core mission that unites all three co-founders. Having witnessed how public opinions and sentiments are swayed by fake accounts, we believe that restoring online identity is the first step to restoring authenticity and accountability on the Internet,” says Kong. “We target consumer use cases that are currently serviced by email-and- password, or social sign-ons. This includes the majority of apps on our phones.”

Purrer says the goal of the project is to have one humanID per person.  “We want people to have control over their own identity from a privacy perspective. We want humanID to be so intuitive and prevalent that it becomes the default identity layer for applications.”

An identity is a permanent representation within a certain context. On the Internet, just like in real life, our identity differs from community to community. humanID enables this, by giving users a different, unique identity in every community.

“It is, if the user chooses so, also a different identity than their offline identity. This is where anonymity comes in. Anonymity means that your offline identity, your physical self, cannot be revealed based on your digital identity,” says Kong, who has worked previously in the blockchain and privacy space.

Permana, who’s leading humanID’s technical development, says, “We achieve this by hashing users’ phone numbers, with a unique, different hash for each user and each application — making cross-referencing between communities impossible. The irreversibility of the hashes ensures secure anonymity. The fact that we do not permanently save any unhashed information makes it impossible, not just for our partner applications but even for ourselves, to reveal a user’s offline identity in the form of his phone number.”

The humanID team believes a persistent, safe identity will be better than any of the existing online identities that are not safe from surveillance and cannot be held accountable for their online behavior.

**The underlying tech
** humanID reached out to the Linux Foundation because it saw “tremendous value to be part of the force that’s driving the industry standard.”

“The Internet is built on layers of open-source, free-to-use protocols. humanID is created in this tradition. The solution hashes users’ phone numbers and email addresses, securing them safely away from hackers and media giants. Each user will have a unique hash for each application he or she signs on so there’s no cross-referencing,” explains Purrer.

“Our database stores users’ country codes, but relinquishes access to the rest of the information we hash. We are using OAuth at the moment, but actively exploring tech that enhances the security of humanID. Developers can implement the social login within a few hours of work,” he says.

**The use cases
** One use case they are deploying for their first client [GreenZone][8] is tracking COVID without sacrificing users’ privacy. Permana explains, “GreenZone is a tracking application that doesn’t track users’ location. Instead, it shows ‘green zones’ of low-risk areas where no symptoms are reported, therefore, alleviating anxiety by showing users whether they are in a safe zone or not. All data is entirely peer-to-peer and there is no government, police or regulators involved.”

According to him, humanID’s first set of customers will be those that are privacy-conscious because their customers demand native privacy when using their product. These businesses include COVID-tracking, health and self-tracking apps, self-help forums, and VPNs.

“We also target social networks, petition sites, and any site with a forum or comment section. All of these businesses suffer heavily from spam abuse and automated accounts. With humanID, everyone can use services without giving away privacy or having their data sold. Bot networks are automatically excluded, while applications can easily block abusive users and trolls,” he says.

Purrer clarifies that humanID does not intend to replace government-issued IDs or business-internal identity management.

“We don’t intend to compete with these existing businesses or standards, but to add a new and fresh idea in the struggle to bring back privacy, safety and accountability on the web,” he says.

The project has been driven by open source and volunteer work for 1.5 years. “We’re actively seeking support and grants to accelerate our work to bring humanID to market and sign up clients. Beyond this, we aim to cover our cost from our client base and not be dependent on charitable donations beyond 2022,” Purrer adds.

Check out the demo below, if you have any questions feel free to contact the team on [github][9].

--------------------------------------------------------------------------------

via: https://www.linux.com/audience/developers/humanid-project-restoring-civil-discussion-through-better-online-identity/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2020/06/icon-1080750_1920-1068x1068.png (icon-1080750_1920)
[2]: https://www.linux.com/wp-content/uploads/2020/06/icon-1080750_1920.png
[3]: https://www.human-id.org/
[4]: https://innovationlabs.harvard.edu/social-impact-fellowship-fund/#:~:text=What%20is%20the%20social%20impact,five%20years%2C%20beginning%20in%202019.
[5]: https://www.linkedin.com/in/bastianpurrer/
[6]: https://www.linkedin.com/in/sidiqpermana/
[7]: https://www.linkedin.com/in/shuyao-kong/
[8]: https://greenzone.live/beta/
[9]: https://github.com/bluenumberfoundation
