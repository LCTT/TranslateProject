翻译中 by小眼儿

On Security Backdoors
=====================

I [wrote][1] Monday about revelations that the NSA might have been inserting backdoors into security standards. Today I want to talk through two cases where the NSA has been accused of backdooring standards, and use these cases to differentiate between two types of backdoors.

The first case concerns a NIST standard, [SP 800-90A][2], which specifies a type of PseudoRandom Generator (PRG). A PRG is a computation that takes a small number of random/unpredictable bits and “stretches” them to get a larger number of unpredictable bits. PRGs are essential to cryptography, serving as the source for most of the secret keys that are used. If you can “break” somebody’s PRG, you can predict which secret keys they will use, thereby allowing you to defeat their crypto.

The standard gave a choice of several core algorithms to choose from. One of them uses a mathematical construct called an Elliptic Curve (EC) which I won’t try to explain in this space. This algorithm uses two “public parameters” called P and Q, which are points on the EC. P and Q are public, with specific values written into the standard.

Cryptographers believed that if you picked P and Q randomly, the PRG would be secure. But in 2006 two private-sector cryptographers figured out that there is a way to pick P and Q so they have a special relationship to each other. An “outsider” wouldn’t be able to tell that the special relationship existed, but if you knew the “secret key” that described the relationship between P and Q, then you could easily defeat the security of the PRG.

At this point, several facts become suddenly interesting. First, NSA people seemed very intent on including this specific algorithm in the standard despite its slow performance. Second, NSA was suggesting specific values of P and Q. Third, NSA was not explaining how those particular P and Q values had been chosen. Interesting, no?

All of this could have been addressed by having some kind of public procedure by which new, random P and Q values would be chosen. But that didn’t happen.

Yesterday NIST [re-opened][3] SP 800-90A for public comment.

The second example was explained by John Gilmore. John described his observations from the IPSEC standards process. IPSEC was meant as a foundational security technology, providing crypto for confidentiality and integrity of individual IP packets on the Internet. A successful and widely deployed IPSEC would have been a game-changer for Internet security, putting lots of traffic under cryptographic protection.

John says that NSA people and their allies worked consistently to make the standard less secure, more complicated, less efficient, and harder to implement securely. He didn’t see a smoking-gun attempt to introduce a backdoor, but what he describes is a consistent effort to undermine the effectiveness of the standard. And indeed, IPSEC has not had anything like the impact one might have expected.

These examples shows us two different kinds of backdoors. In the first PRG case, the NSA was accused of trying to create a backdoor that only it could use, because only it knew the secret key relating P to Q. In the second IPSEC case, the accusation was that the NSA was weakening users’ security against all attackers—the NSA would have easier access to your data, but so would all sorts of other people.

To be sure, even a private backdoor might not stay private. If there is a magic secret key that lets the NSA spy on everyone, that key might be misused or it might leak. So the line between an NSA-only backdoor and an open backdoor is always a bit blurry.

Still, it seems to me that the two types of backdoors call for different policy debates. It’s one thing to secretly give the NSA easier access to everyone’s data. It’s another thing to give everyone easier access. The latter is worse.
We need to look as well at how a backdoor might be created. In the PRG example, the backdoor would have required the NSA to slip a subtle cryptographic weakness past the crypto experts working on a standard. In the IPSEC example, creating the weakness would seem to require coordinated public activity in the standards body over time, and the individual steps would surely be noticed even if nobody spotted a pattern.

But one has to wonder whether these examples really were NSA attempts to undermine security, or whether they’re just false alarms. We can’t be sure. As long as the NSA has a license to undermine security standards, we’ll have to be suspicious of any standard in which they participate.

---

via: https://freedom-to-tinker.com/blog/felten/on-security-backdoors/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)


[1]:https://freedom-to-tinker.com/blog/felten/nsa-apparently-undermining-standards-security-confidence/
[2]:http://csrc.nist.gov/publications/drafts/800-90/draft_sp800_90a_rev1.pdf
[3]:http://www.nist.gov/director/cybersecuritystatement-091013.cfm
