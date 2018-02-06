Security Is Not an Absolute
======

If there’s one thing I wish people from outside the security industry knew when dealing with information security, it’s that **Security is not an absolute**. Most of the time, it’s not even quantifiable. Even in the case of particular threat models, it’s often impossible to make statements about the security of a system with certainty.

At work, I deal with a lot of very smart people who are not “security people”, but are well-meaning and trying to do the right thing. Online, I sometimes find myself in conversations on [/r/netsec][1], [/r/netsecstudents][2], [/r/asknetsec][3], or [security.stackexchange][4] where someone wants to know something about information security. Either way, it’s quite common that someone asks the fateful question: “Is this secure?”. There are actually only two answers to this question, and neither one is “Yes.”

The first answer is, fairly obviously, “No.” There are some ideas that are not secure under any reasonable definition of security. Imagine an employer that makes the PIN for your payroll system the day and month on which you started your new job. Clearly, all it takes is someone posting “started my new job today!” to social media, and their PIN has been outed. Consider transporting an encrypted hard drive with the password on a sticky note attached to the outside of the drive. Both of these systems have employed some form of “security control” (even if I use the term loosely), and both are clearly insecure to even the most rudimentary of attacker. Consequently, answering “Is this secure?” with a firm “No” seems appropriate.

The second answer is more nuanced: “It depends.” What it depends on, and whether those conditions exist in the system in use, are what many security professionals get paid to evaluate. For example, consider the employer in the previous paragraph. Instead of using a fixed scheme for PINs, they now generate a random 4-digit PIN and mail it to each new employee. Is this secure? That all depends on the threat model being applied to the scenario. If we allow an attacker unlimited attempts to log in as that user, then no 4 digit PIN (random or deterministic) is reasonably secure. On average, an attacker will need no more than 5000 requests to find the valid PIN. That can be done by a very basic script in 10s of minutes. If, on the other hand, we lock the account after 10 failed attempts, then we’ve reduced the attacker to a 0.1% chance of success for a given account. Is this secure? For a single account, this is probably reasonably secure (although most users might be uncomfortable at even a 1 in 1000 chance of an attacker succeeding against their personal account) but what if the attacker has a list of 1000 usernames? The attacker now has a **64%** chance of successfully accessing at least 1 account. I think most businesses would find those odds very much against their favor.

So why can’t we ever come up with an answer of “Yes, this is a secure system”? Well, there’s several factors at play here. The first is that very little in life in general is an absolute:

  * Your doctor cannot tell you with certainty that you will be alive tomorrow.
  * A seismologist can’t say that there absolutely won’t be a 9.0 earthquake that levels a big chunk of the West Coast.
  * Your car manufacturer cannot guarantee that the 4 wheels on your car do not fall of on your way to work tomorrow.



However, all of these possibilities are very remote events. Most people are comfortable with these probabilities, largely because they do not think much about them, but even if they did, they would believe that it would not happen to them. (And almost always, they would be correct in that assumption.)

Unfortunately, in information security, we have three things working against us:

  * The risks are much less understood by those seeking to understand them.
  * The reality is that there are enough security threats that are **much** more common than the events above.
  * The threats against which security must guard are **adaptive**.



Because most people have a hard time reasoning about the likelihood of attacks and threats against them, they seek absolute reassurance. They don’t want to be told “it depends”, they just want to hear “yes, you’re fine.” Many of these individuals are the hypochondriacs of the information security world – they think every possible attack will get them, and they want absolute reassurance they’re safe from those attacks. Alternatively, they don’t understand that there are degrees of security and threat models, and just want to be reassured that they are perfectly secure. Either way, the effect is the same – they don’t understand, but are afraid, and so want the reassurance of complete security.

We’re in an era where security breaches are unfortunately common, and developers and users alike are hearing about these vulnerabilities and breaches all the time. This causes them to pay far more attention to security then they otherwise would. By itself, this isn’t bad – all of us in the industry have been trying to get everyone’s attention about security issues for decades. Getting it now is better late than never. But because we’re so far behind the curve, the breaches being common, everytone is rushing to find out their risk and get reassurance now. Rather than consider the nuances of the situation, they just want a simple answer to “Am I secure?”

The last of these issues, however, is also the most unique to information security. For decades, we’ve looked for the formula to make a system perfectly secure. However, each countermeasure or security system is quickly defeated by attackers. We’re in a cat-and-mouse game, rather than an engineering discipline.

This isn’t to say that security is not an engineering practice – it certainly is in many ways (and my official title claims that I am an engineer), but just that it differs from other engineering areas. The forces faced by a building do not change in face of design changes by the structural engineer. Gravity remains a constant, wind forces are predictible for a given design, the seismic nature of an area is approximately known. Making the building have stronger doors does not suddenly increase the wind forces on the windows. In security, however, when we “strengthen the doors”, the attackers do turn to the “windows” of our system. Our threats are **adaptive** – for each control we implement, they adapt to attempt to circumvent that control. For this reason, a system that was believed secure against the known threats one year is completely broken the next.

Another form of the security absolutism is those that realize there are degrees of security, but want to take it to an almost ridiculous level of paranoia. Nearly always, these seem to be interested in forms of cryptography – perhaps because cryptography offers numbers that can be tweaked, giving an impression of differing levels of security.

  * Generating RSA encryption keys of over 4k bits in length, even though all cryptographers agree this is pointless.
  * Asking why AES-512 doesn’t exist, even though SHA-512 does. (Because the length of a hash and the length of a key do not equal in effective strength against attacks.)
  * Setting up bizarre browser settings and then complaining about websites being broken. (Disabling all JavaScript, all cookies, all ciphers that are less than 256 bits and not perfect forward secrecy, etc.)



So the next time you want to know “Is this secure?”, consider the threat model: what are you trying to defend against? Recognize that there are no security absolutes and guarantees, and that good security engineering practice often involves compromise. Sometimes the compromise is one of usability or utility, sometimes the compromise involves working in a less-than-perfect world.

--------------------------------------------------------------------------------

via: https://systemoverlord.com/2018/02/05/security-is-not-an-absolute.html

作者：[David][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://systemoverlord.com/about
[1]:https://reddit.com/r/netsec
[2]:https://reddit.com/r/netsecstudents
[3]:https://reddit.com/r/asknetsec
[4]:https://security.stackexchange.com
