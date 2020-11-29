[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why failure should be normalized and how to do it)
[#]: via: (https://opensource.com/article/20/11/normalize-failure)
[#]: author: (Lisa Seelye https://opensource.com/users/lisa)

Why failure should be normalized and how to do it
======
"Everybody is perfect, except you." This toxic thought can creep in and
ruin your confidence. Here's how to normalize failure during the
learning process and remember that everyone makes mistakes.
![failure sign at a party, celebrating failure][1]

All of your heroes have failures under their belts—from minor mistakes to major disasters. Nobody knows how to do everything automatically, and the process of learning is usually a messy one. So why is the perception that everyone but you knows what they’re doing so common? Why do we externalize our successes but internalize our failures?

How does it make you feel when you struggle to learn something new, then see another person take their Jira card away and return at the end of the sprint with something fully fleshed out and working, gushing about it at the demo? Sure, you closed your card too, but it was really hard! There was a new algorithm, a new programming language, a new system all to be learned. How did she make it look so effortless?

The truth is, she might have struggled with the same issues you did and wondered how you made it look so effortless!

### Failure is normal, healthy, and invisible

Whether we call them mistakes, bad assumptions, or some other euphemism, it's hard not to judge ourselves or expect better of ourselves, especially compared to other people.

My background is largely in Linux systems administration, and in this line of work, it is often a matter of "when" and not "if" we will have a production service disruption. Those service disruptions can happen for various reasons—sometimes it's because a person made a mistake. Setting aside the discussion around controls to mitigate human error, we can see plain as day that I, Lisa Seelye, made a mistake that directly caused a production problem.

Whenever a group of sysadmins gets together, we usually end up talking about our work, and inevitably, we get around to stories of production service disruptions that we’ve been a part of (or caused). It’s cathartic to hear how badly other people have messed up and then look around and see that we are all human and making mistakes is part of that.

I feel that this kind of sharing is vital to the success of people in the information technology sector.

### Why should we share?

In addition to sharing our mistakes in order to normalize them, I also believe that it is equally important to share our learning processes—this is both to drive home the idea that we all start somewhere and that learning is often filled with failures and misconceptions.

As an individual, I need to remind myself that it may only appear that my peers return from a week working on a card with a fully fleshed-out solution. Reality may, in fact, be that they don’t understand the requirements, the codebase, the language, the algorithms needed, etc. Either way, it’s a logical fallacy to believe they do not face these challenges because of the appearance of the final product.

### But why should we share?

We should share our learning experiences because we all benefit from hearing about the challenges other people face and how they overcome them. If the Jira card wasn’t clear, then we can do better. If the algorithm wasn’t clear, then maybe education can be done around it.

Most importantly, we need to normalize that it’s okay not to know everything, that it’s okay to still be learning, and to ask for help. Setting an example for new or more junior engineers is important. In our industry, we deal with extremely complex systems that can interact with one another in strange or unexpected ways. In many cases, it is simply not possible for one person to know everything. Being open about our learning processes and our mistakes can lead to tighter bonding.

Do new engineers on your team have the set expectation that it’s okay to interrupt and ask questions? Saying it on day one is easy, but practicing the value is another thing. How are approachability and openness demonstrated in your team?

### My learning opportunities

It could be very easy to title this section "my mistakes" and then rattle off all the times I’ve made mistakes, but that doesn’t quite illustrate the point. I recognize these mistakes, but they’re also events that expanded the understanding of my craft. While I didn’t set out to intentionally do any of these things, I certainly learned from them.

I have accidentally dropped (deleted) a customer’s database. It was lucky for everyone that it was a beta-phase database and no further harm was done. I learned a valuable lesson that day: be very watchful of what code is doing, and be careful about what environment you are working in.

One day, while performing routine maintenance with an odd DNS setup, I accidentally broke the ability for customers to provide credit card information to the secure site. We had two "payments" DNS records that served to override a wildcard DNS record, and I assumed that the second "payments" record was still present. It wasn’t. And then the wildcard record took over, and the DNS started behaving like "payments" wasn’t special at all anymore. Of course, I had no idea this was happening at all—it wasn’t until my maintenance was over that I learned of the folly.

Customers weren’t able to provide payment information for almost two hours! I learned my lesson, though: when there is something special about a particular configuration, be sure to make sure it stays special throughout its lifetime. When DNS gets involved, all kinds of things can break.

Before I started speaking at conferences, I was an attendee, and I watched talks online. Pivoting to speaking myself, I was worried that I’d say too many "umms" and "uhs" and that my jokes would fall flat. The speakers I enjoyed over the years seemed to not have those problems at all, while I was unpolished.

But once I got up on stage, I found that my perception had changed. I had practiced my talk with an audience and listened to their feedback—turns out I had a little polish. In front of the audience, I did misspeak and not say something exactly how I wanted, but it didn’t matter. What I didn’t realize from my vantage point in the audience is that the audience wants the speaker to succeed, and the speaker can shift directions in their talk without the audience knowing.

I certainly have made and continue to make those sounds, and I have even had to correct major factual information the night before a talk, but the audience never knows. The audience sees what I show them and, because they want me to succeed, they forgive my "umms" and "uhs."

I admit that I am not perfect. I ship bugs, and I try to learn from them.

### How to share

Sharing the difficulties we’ve encountered along the learning process or in our day to day career is important, though just as important is how they are shared. I share the things I’ve learned (the hard way) with frankness and no self-judgment. It is in this spirit that I think we should all share. I’m not a bad person because I’ve made mistakes, and neither are you.

How, then, should we share? Who is the audience?

In the midst of a production service disruption, like with the DNS payment situation above, there’s no room for coyness or hiding anything. The most important thing is to make key stakeholders aware and then rally to fix the situation. The audience is first internal—your team, business leaders, the support team. Next, the audience is outward-facing—the customers. It is wise to involve communications experts when crafting that outward message.

When sharing with a junior engineer, we need to normalize the learning process. People aren’t born knowing how pointers in C work, so we all need to learn what the pitfalls of pointers are. It’s okay to need to learn new skills at any skill level, and it’s also okay to need to reinforce those skills. The message we send should be free of judgment.

So write a blog post, make a Twitter thread, share frustrations in Slack channels, ask for help. Together we can dismiss the myth that everybody's perfect, except you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/normalize-failure

作者：[Lisa Seelye][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lisa
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_failure_celebrate.png?itok=LbvDAEZF (failure sign at a party, celebrating failure)
