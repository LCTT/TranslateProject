Security Debt is an Engineer’s Problem
============================================================

![](https://cdn.thenewstack.io/media/2017/05/d6fe35b0-11416417-1257170530979237-7594665410266720452-o_2_orig-1024x641.jpg)

![](https://cdn.thenewstack.io/media/2017/05/ea8298a9-keziah-slide1-300x165.png)
>Keziah Plattner of AirBnBSecurity.

Just like organizations can build up technical debt, so too can they also build up something called “security debt,” if they don’t plan accordingly, attendees learned at the [WomenWhoCode Connect ][5]event at Twitter headquarters in San Francisco last month.

Security has got to be integral to every step of the software development process, stressed [Mary Ann Davidson][6], Oracle’s Chief Security Officer, in a keynote talk with about security for developers with [Zassmin Montes de Oca][7] of [WomenWhoCode][8].

In the past, security used to be ignored by pretty much everyone, except banks. But security is more critical than it has ever been because there are so many access points. We’ve entered the era of [Internet of Things][9], where thieves can just hack your fridge to see that you’re not home.

Davidson is in charge of assurance at Oracle, “making sure we build security into everything we build, whether it’s an on-premise product, whether it’s a cloud service, even devices we have that support group builds at customer sites and reports data back to us, helping us do diagnostics — every single one of those things has to have security engineered into it.”

![](https://cdn.thenewstack.io/media/2017/05/8d5dc451-keziah-talking-225x300.jpg)

Plattner talking to a capacity crowd at #WWCConnect

AirBnB’s [Keziah Plattner][10] echoed that sentiment in her breakout session. “Most developers don’t see security as their job,” she said, “but this has to change.”

She shared four basic security principles for engineers. First, security debt is expensive. There’s a lot of talk about [technical debt ][11]and she thinks security debt should be included in those conversations.

“This historical attitude is ‘We’ll think about security later,’” Plattner said. As companies grab the low-hanging fruit of software efficiency and growth, they ignore security, but an initial insecure design can cause problems for years to come.

It’s very hard to add security to an existing vulnerable system, she said. Even when you know where the security holes are and have budgeted the time and resources to make the changes, it’s time-consuming and difficult to re-engineer a secure system.

So it’s key, she said, to build security into your design from the start. Think of security as part of the technical debt to avoid. And cover all possibilities.

Most importantly, according to Plattner, is the difficulty in getting to people to change their behavior. No one will change voluntarily, she said, even when you point out that the new behavior is more secure. We all nodded.

Davidson said engineers need to start thinking about how their code could be attacked, and design from that perspective. She said she only has two rules. The first is never trust any unvalidated data and rule two is see rule one.

“People do this all the time. They say ‘My client sent me the data so it will be fine.’ Nooooooooo,” she said, to laughs.

The second key to security, Plattner said, is “never trust users.”

Davidson put it another way: “My job is to be a professional paranoid.” She worries all the time about how someone might breach her systems even inadvertently. This is not academic, there has been recent denial of service attacks through IoT devices.

### Little Bobby Tables

If part of your security plan is trusting users to do the right thing, your system is inherently insecure regardless of whatever other security measures you have in place, said Plattner.

It’s important to properly sanitize all user input, she explained, showing the [XKCD cartoon][12] where a mom wiped out an entire school database because her son’s middle name was “DropTable Students.”

So sanitize all user input. Check.

She showed an example of JavaScript developers using Eval on open source. “A good ground rule is ‘Never use eval(),’” she cautioned. The [eval() ][13]function evaluates JavaScript code. “You’re opening your system to random users if you do.”

Davidson cautioned that her paranoia extends to including security testing your example code in documentation. “Because we all know no one ever copies sample code,” she said to laughter. She underscored the point that any code should be subject to security checks.

![](https://cdn.thenewstack.io/media/2017/05/87efe589-keziah-path-300x122.png)

Make it easy

Plattner’s suggestion three: Make security easy. Take the path of least resistance, she suggested.

Externally, make users opt out of security instead of opting in, or, better yet, make it mandatory. Changing people’s behavior is the hardest problem in tech, she said. Once users get used to using your product in a non-secure way, getting them to change in the future is extremely difficult.

Internal to your company, she suggested make tools that standardize security so it’s not something individual developers need to think about. For example, encrypting data as a service so engineers can just call the service to encrypt or decrypt data.

Make sure that your company is focused on good security hygiene, she said. Switch to good security habits across the company.

You’re only secure as your weakest link, so it’s important that each individual also has good personal security hygiene as well as having good corporate security hygiene.

At Oracle, they’ve got this covered. Davidson said she got tired of explaining security to engineers who graduated college with absolutely no security training, so she wrote the first coding standards at Oracle. There are now hundreds of pages with lots of contributors, and there are classes that are mandatory. They have metrics for compliance to security requirements and measure it. The classes are not just for engineers, but for doc writers as well. “It’s a cultural thing,” she said.

And what discussion about security would be secure without a mention of passwords? While everyone should be using a good password manager, Plattner said, but they should be mandatory for work, along with two-factor authentication.

Basic password principles should be a part of every engineer’s waking life, she said. What matters most in passwords is their length and entropy — making the collection of keystrokes as random as possible. A robust password entropy checker is invaluable for this. She recommends [zxcvbn][14], the Dropbox open-source entropy checker.

Another trick is to use something intentionally slow like [bcrypt][15] when authenticating user input, said Plattner. The slowness doesn’t bother most legit users but irritates hackers who try to force password attempts.

All of this adds up to job security for anyone wanting to get into the security side of technology, said Davidson. We’re putting more code more places, she said, and that creates systemic risk. “I don’t think anybody is not going to have a job in security as long as we keep doing interesting things in technology.”

--------------------------------------------------------------------------------

via: https://thenewstack.io/security-engineers-problem/

作者：[TC Currie][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://thenewstack.io/author/tc/
[1]:http://twitter.com/share?url=https://thenewstack.io/security-engineers-problem/&text=Security+Debt+is+an+Engineer%E2%80%99s+Problem+
[2]:http://www.facebook.com/sharer.php?u=https://thenewstack.io/security-engineers-problem/
[3]:http://www.linkedin.com/shareArticle?mini=true&url=https://thenewstack.io/security-engineers-problem/
[4]:https://thenewstack.io/security-engineers-problem/#disqus_thread
[5]:http://connect2017.womenwhocode.com/
[6]:https://www.linkedin.com/in/mary-ann-davidson-235ba/
[7]:https://www.linkedin.com/in/zassmin/
[8]:https://www.womenwhocode.com/
[9]:https://www.thenewstack.io/tag/Internet-of-Things
[10]:https://twitter.com/ittskeziah
[11]:https://martinfowler.com/bliki/TechnicalDebt.html
[12]:https://xkcd.com/327/
[13]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval
[14]:https://blogs.dropbox.com/tech/2012/04/zxcvbn-realistic-password-strength-estimation/
[15]:https://en.wikipedia.org/wiki/Bcrypt
[16]:https://thenewstack.io/author/tc/
