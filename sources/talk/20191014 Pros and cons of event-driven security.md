[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Pros and cons of event-driven security)
[#]: via: (https://opensource.com/article/19/10/event-driven-security)
[#]: author: (Yuriy Andamasov https://opensource.com/users/yuriy-andamasov)

Pros and cons of event-driven security
======
Event-driven security is not an impenetrable wall, but it may be cheaper
and better than what you've been doing to prevent data breaches.
![Three closed doors][1]

Great news, everyone! Forrester Research says that [95% of all recorded breaches][2] in 2016 came from only three industries: government, technology, and retail. Everyone else is safe... ish, right?

Hold on for a moment. Tech? Retail? What kind of industry diversification is this? We are, after all, living in 2019, where every business is a tech business. And all of us are continuously selling something, whether it’s an innovative product or an amazing service.

So what the report should have said is that 95% of all recorded breaches came from attacks on 95% of all businesses both online and offline. And some of the attackers went for the .gov.

More on the matter, [43% of attackers target small businesses][3]—and that’s a lot considering that, on average, a hack attempt takes place every 39 seconds.

To top things off, the average cost of a data breach in 2020 is expected to exceed [$150 million][4]. These stats sound a bit more terrifying out of context, but the threat is still very much real. Ouch.

What are our options then?

Well, either the developers, stakeholders, decision-makers, and business owners willingly risk the integrity and security of their solutions by doing nothing, or they can consider fortifying their digital infrastructure.

Sure, the dilemma doesn’t seem like it offers too many options, and that’s only because it doesn’t. That said, establishing efficient network security is easier said than done.

### The cost of safety

Clearly, security is an expensive endeavor, a luxury even.

  * Cybersecurity costs increased by 22.7% in only a year from 2016 to 2017.
  * According to Gartner, organizations spent a total of $81.6 billion on cybersecurity, a $17.7 billion increase!
  * And the worst part yet—the problem doesn’t seem like it’s going away regardless of how much money we throw at it.



Perhaps we are doing something wrong? Maybe it’s the way that we perceive network security that’s flawed? Maybe, just maybe, there’s a cheaper AND better solution?

### Scalability: Bad?

Software, network, and architecture development have evolved dramatically over the last decade. We’ve moved from the age-old monolithic approach to leaner, more dynamic methodologies that allow faster reactions to the ever-shifting demands of the modern market.

That said, flexibility comes at a cost. A monolith is a solid, stable element of infrastructure where a small change can crash the whole thing like a house of cards. But said change—regardless of its potential danger—is easily traceable.

Today, the architecture is mostly service-based, where every single piece of functionality is like a self-contained Lego block. An error in one of the blocks won’t discard the entire system. It may not even affect the blocks standing near it.

This approach, while adding scalability, has a downside—it’s really hard to trace a single malicious change, especially in an environment where every element is literally bombarded with new data coming anywhere from an HR or security update to, well, a malicious code attack.

Does this mean it’s best if we sacrifice scalability in favor of security?

Not at all. We’ve moved away from the monolith for a reason. Going back now will probably cost you your entire project. The tricky part is in effectively identifying what is and what isn’t a threat, as this is where the flaw of microservices lies.

We need preventive measures.

### Events, alerts, and incidents

Everything that happens within your network can be described in one of three words: event, alert, or incident.

An **event** is any observed change taking place in a network, environment, or workflow. So, for example, when a new firewall policy is pushed, you may consider that the event has happened. When the routers are updated, another event has happened, and so on and so forth.

An **alert** is an event that requires action. In simpler words, if you or your team need to do something due to the event taking place, it is considered an alert.

According to the CERT NISTT 800-61 definition, an **incident** is an event that violates your security policies. Or, in simpler words, it is an event that negatively impacts the business like a worm spreading through the network, a phishing attempt, or the loss of sensitive data.

By this logic, your infrastructure developers, security officers, and net admins are tasked with a very simple mission: establishing efficient preventive measures against any and all incidents.

Again, easier said than done.

There are simply too many different events taking place at one time. Every change, shift, or update differs, one from another, resulting in dozens of false-positive incidents. Add the fact that the mischievous events are very keen on disguising themselves, and you’ll get why your net admins look like they’ve lived on coffee and Red Bull for (at least) the past few weeks.

Is there anything we, as a responsible community of developers, managers, stakeholders, product, and business owners, can do?

### Event-driven security in a nutshell

What’s the one thing everything you ignore, act upon, or react to shares in common?

An event.

Something needs to happen for you to respond to it in any shape or form. Additionally, many events are similar to one another and can be categorized as a stream.

Here’s an example.

Let’s say you have an e-commerce store. One of your clients adds an item to his cart (event) and then removes it (event) or proceeds with the purchase (event).

Need I say that, other than simply categorizing them, we can analyze these events to identify behavioral patterns, and this makes it easier to identify threats in real time (or even empower HR/dev/marketing teams with additional data)?

#### Event vs. command

So event-driven security is essentially based on following up events. Were we ever _not_ following up on them? Didn’t we have commands for that?

Yes, yes, we have, and that’s partially the problem. Here’s an example of an event versus a command:

_&gt; Event: I sit on the couch, and the TV turns on._
_&gt; Command: I sit on the couch and turn on the TV._

See the difference? I had to perform an action in the second scenario; in the first, the TV reacted to the event (me sitting on the couch generated the TV turning on) on its own.

The first approach ensures the integrity of your network through efficient use of automation, essentially allowing the software to operate on its own and decide whether to launch the next season of _Black Mirror_ on Netflix or to quarantine an upcoming threat.

#### Isolation

Any event is essentially a trigger that launches the next application in the architecture. A user inputs his login, and the system validates its correctness, requests confirmation from the database, and tests the input for the presence of code.

So far, so good. Not much has changed, right?

Here’s the thing—every process and every app run autonomously like separate events, each triggering their own chains. None of the apps know if other apps have been triggered and whether they are running any processes or not.

Think of them as separate, autonomous clusters. If one is compromised, it will not affect the entirety of the system, as it simply doesn’t know if anything else exists. That said, a malfunction in one of the clusters will trigger an alert, thus preventing the incident.

#### An added bonus

Isolated apps are not dependent on one another, meaning you’ll be able to plug in as many of them as you need without any of them risking or affecting the rest of the system.

Call it scalability out of the box, if you will.

### Pros of the event-driven approach

We’ve already discussed most of the pros of the event-driven approach. Let’s summarize them here in the form of short bullet points.

  * **Encapsulation:** Every process has a set of clear, easily executed boundaries.
  * **Decoupling:** The processes are independent and unaware of one another.
  * **Scalability:** It’s easy to add new functionality, apps, and processes.
  * **Data generation:** Event strings generate predictable data patterns you can easily analyze.



### Cons of the event-driven approach

Sadly, despite an impressive array of benefits to the business, event-driven architecture and security are not silver bullets. The approach has its flaws.

For starters, developing any architecture with an insane level of scalability is hard, expensive, and time-consuming.

Event-driven security is far from being a truly impenetrable wall. Hackers evolve and adapt rather quickly. They’ll likely find a breach in any system if they put their mind to it, whether through coding or through phishing.

Luckily, you don’t have to build a Fort Knox. All you need is a solid system that’s hard enough to crack for the hacker to give up and move to an easier target. The event-driven approach to network security does just that.

Moreover, it minimizes your losses if an incident actually happens, so you have that going for you, which is nice.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/event-driven-security

作者：[Yuriy Andamasov][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/yuriy-andamasov
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_UnspokenBlockers_1110_A.png?itok=x8A9mqVA (Three closed doors)
[2]: https://www.techrepublic.com/article/forrester-what-can-we-learn-from-a-disastrous-year-of-hacks-and-breaches/
[3]: https://www.cybintsolutions.com/industries-likely-to-get-hacked/
[4]: https://www.cybintsolutions.com/cyber-security-facts-stats/
