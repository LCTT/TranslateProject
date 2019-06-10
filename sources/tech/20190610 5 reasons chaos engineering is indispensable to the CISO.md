[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 reasons chaos engineering is indispensable to the CISO)
[#]: via: (https://opensource.com/article/19/5/reasons-chaos-engineering-ciso)
[#]: author: (Aaron RinehartAaron RinehartAndrew Weidenhamer https://opensource.com/users/aaronrinehart/users/danwalsh/users/cnwatu/users/aaronrinehart/users/aaronrinehart/users/aw264701/users/aaronrinehart)

5 reasons chaos engineering is indispensable to the CISO
======
Chaos engineering is a better approach than traditional business
continuity planning and disaster recovery to test the resilience of
today's complex enterprise security programs.
![Lock][1]

The growing number of companies adopting [chaos engineering][2] has not only equipped teams with a new series of powerful instrumentation techniques and tools but is starting to shift mindsets among security organizations.

> "Chaos engineering is the discipline of experimenting on a system in order to build confidence in the system's capability to withstand turbulent conditions in production."
>  —[Principles of Chaos Engineering][3]

Security leaders, including the chief information security officer (CISO), are challenged to continuously demonstrate their role within the company's value stream as part of improving security. In doing so, a growing number of security organizations are shifting toward a more "applied security mode," leading many to rethink our traditional practices and question their effectiveness in today's high-velocity, software-driven world.

Following are five reasons why chaos engineering is becoming indispensable to today's security leaders.

### 1\. Chaos engineering makes business continuity planning and disaster recovery real.

The concepts of business continuity planning (BCP) and disaster recovery (DR) have been around for decades to ensure a business can continue to operate during unforeseen events or failures, such as natural disasters or emergencies.

BCP and DR consider four factors that can disrupt business operations:

  1. Loss of facility or region
  2. Loss of technology
  3. Loss of resources
  4. Loss of critical third-party vendors



As the world continues the march to the cloud, BCP and DR present a different set of opportunities and challenges. Many companies set up their tests in such a way to back into a certain or predictable result. They essentially control the test to ensure the reasonable or desired outcome. In reality, when outages, incidents, and disasters occur, they are never that considerate and, in fact, almost always fall outside the boundaries of the prescribed exercise.

Chaos engineering, because of its provocative name, often comes with sticker shock to people still learning about it. Its goal is not to create chaos or introduce failure within the system but rather to identify, understand, and fix the failures proactively before they impact business operations. It's important to remember that during an outage or incident, DR is seldom in our control. The notion that we can know the outcomes of disasters or outages—before we have correctly and objectively tested them—will never serve the needs of the business. We adopt a mindset about how we are supposed to do the exercises instead of using them to build a learning culture around how our systems and security function.

In today's rapidly evolving world, almost every product, service, and company revolve around technology. We are critically dependent on these services to be available when we need them. How we build, operate, and secure these technologies is complex. Product engineering teams can deliver thousands of new features, functionality, and fixes because of better delivery models such as agile, DevOps, and cloud computing. How have our BCP/DR practices evolved to meet the demands of these new delivery models?

In a world where software drives everything, semi-annual or annual compliance checklists or tabletop exercises are inadequate. The way we build critical products and services has become very challenging, as we have never built systems this large in scale, loosely decoupled, rapidly changing, value-delivering, or fast to market. These complex, adaptive systems contain value, but we must begin to think differently about outmoded approaches like BCP/DR to get a handle on the problem.

One of chaos engineering's best attributes is that it provides a more empirical means to business continuity and DR, which is relevant for the challenges we face. Site reliability engineering (SRE) practices and chaos engineering are more practical about the real-world events that affect continuity of business operations (rather than extreme and highly unlikely disaster scenarios) and focus on the types of micro-events that impact business continuity and recovery every day, such as corrupted data in critical microservices, inelastic infrastructure, and brittle network connectivity. Chaos engineering helps organizations move gracefully into a learning culture around system behavior with its experimentation-based approach.

### 2\. Chaos engineering can improve understanding of risks.

Risk is an integral component of business operations, and properly navigating it creates successful outcomes. Security activities, such as audit investigations, vulnerability scanning, threat modeling, and incident response, determine if risks are persistent, unmanaged, or substantive by providing feedback loops. Identified risks are evaluated against established criteria to provide a measurement of severity. This measurement, along with a comprehensive review of the risk, enables a company to catalog the risk into its "risk register" and take steps to remediate or manage it moving forward.

What do these activities have in common? They are all reactive and generally manifest well after a failure has occurred. Furthermore, the majority of them are abstracted by layers of people, technology, and process that are further and further away from understanding the context of what went wrong. The people who probably know the most about a system are those responsible for building and operating it on a daily basis. The activities described above are typically performed by someone in security and often require "expert systems" or "proprietary domain knowledge." Regardless of whatever systems, tools, and review processes are used, the fact remains that, in this model, security is almost always operating from an abstracted sense of context.

Because chaos engineering is an experimentation approach, rather than a testing-centered approach, it provides the benefit of proactively instrumenting the system and its security measures within the same experiment. In the end, all of a system's components, including its security and the humans responsible for it, collectively need to function optimally to be resilient. No system is inherently secure; humans make them that way. The goal of chaos engineering is not purely to validate something we already know to be true or false, but rather to derive new information and insights.

Let's consider how an active outage or security incident starts, our state of mind when it happens, and the security measures we utilize. During an active incident or outage, it's extremely rare for anyone to do a comprehensive and deep analysis to determine the effectiveness of the security measures that preceded the event. Instead, the primary focus is on restoring the operating integrity and health of the service to reestablish continuity of business operations.

  * **Preventative measures:** You will not know how effective your preventative security measures are until they aren't effective and, by that point, it's too late.
  * **Detective measures:** Detective measures (or other system observability capabilities such as monitoring, alerting, logging, and tracing) are the cornerstone of good incident management when they are continuously evaluated and improved. One of many issues with detective measures is that during an active war room, there isn't the time nor ability to comb through error logs and alert data and evaluate each entry for its quality and effectiveness. Most of the time, especially in software, we are lucky to detect anything at all. Furthermore, we almost never consider that the detection point (which is what led us to spin up the war room) might have followed a cascading downstream failure in an area where we lack visibility and awareness into other system problems. Lastly, it's next to impossible to determine how effective our tools, teams, skills, resourcing, etc. are when it's difficult to compare even slightly similar subjective security events against each other.
  * **Corrective changes:** One of the most surprising behaviors during active-incident war rooms is that you will often observe material or critical changes in systems that occur within hours or minutes of identifying what everyone "thinks" the problem is. The irony (from our experience) is that these changes are the ones that would have prevented the problem to begin with. Should the incident response teams and on-call engineers be making material changes in last-minute fire-drill conditions when they are not aware of the context needed to make the change? The point is that we often do the right thing under the wrong conditions when there are outages. Chaos engineering can be a proactive measurement tool to help teams further understand the implications of not making these kinds of changes when they should have been made without impacting customers.



CISOs can use chaos engineering, and especially [gameday exercises][4], as an invitation to a cross-disciplined discussion about data-driven security-risk management with their engineering teams. These techniques also help build empathy, remove barriers, and drive transparency about how the team's work contributes to the security and safety of the business.

### 3\. Chaos engineering drives security engineering and automation back into the value stream.

As part of the journey towards chaos engineering, it can be immensely valuable for security teams to take an active role in participating in chaos engineering experiments and gamedays. Part of chaos engineering as a discipline is to mentally align how we believe the system works vs. how it functions in reality. These activities are great opportunities to break down barriers and drive a common understanding of how systems fail. As engineers, we tend to simplify and abstract people the same way we do with software. That is, we often create false representations of each other's motives, biases, intentions, and empathy towards each other.

Moreover, creating and executing chaos experiments can help security teams identify other flaws and issues that can give engineering teams better context and well-defined problems to solve. Different members and roles within the security organization should take part in these exercises, as gaining perceptions and perspectives from different roles can add exponential value by improving context, learning from failure, and creating transparent working relationships.

Lastly, the security team will be exposed to opportunities to understand better the things they secure and identify areas to contribute tangibly back to the value stream. Chaos engineering isn't just another process methodology or toolset; it is a mindset shift.

### 4\. Chaos engineering improves incident response.

Despite best intentions and past successes, the nature of security incidents is subjective. No matter what you spend or what preventative measures you put in place, incidents will still happen. We will never know in advance exactly how it will happen, who will do it, when they will do it, or why they are doing it. This information is only discovered in hindsight.

What if it were possible—when there is not an active incident and you're not in a 24x7 war room—to establish how prepared you are for these types of situations? How do you know whether you are truly getting better at responding to security incidents when it's difficult to isolate and compare disparate incidents? It's hard to ascertain how effective team skills, procedures, and tools are when it's difficult to compare similar events.

We believe the only way to understand this subjective world is to confront it objectively by introducing controlled signals. If you were to introduce an objective, controlled signal by injecting incidents into the program, you could measure things like how good the team is at different types of incidents, how effective the technology is, how aligned runbooks are, how good the security incident processes are, etc. You could understand when an incident began, and measure, track, and compare outcomes across different periods of times and even different teams to better understand attack preparedness.

As far as we know, chaos engineering is the only proactive mechanism for detecting availability and security incidents before they happen. Security chaos engineering allows teams to proactively, safely discover system weaknesses before they disrupt business outcomes. Testing and experimentation are not the same: testing is the verification or validation of something you already know (such as CVE, attack pattern, or signature), whereas experimentation seeks to derive information that was previously unknown.

The reality is people operate differently during an outage or incident. Additionally, teams are more likely to keep an open mind about what causes things to fail when they are not fighting fires. There is a fundamental shift in mental focus and operational momentum that drives teams to put a fire out versus doing a thorough examination of what caused the incident to begin with.

### 5\. Chaos engineering improves application security logging and monitoring.

Many organizations are experimenting with security chaos experimentation on security logging and monitoring platforms. Their focus has been predominantly on improving the value of information that security logging and monitoring tools collect, utilize, and alert on. Just because you are collecting data doesn't mean the data is valuable. The true judge of the value is having the right level of visibility and awareness when an incident or an attack occurs. Using security chaos experimentation, as in the following example, you can proactively discover gaps in visibility, improve log quality, and increase attack surface context.

#### A security chaos experiment

  * **Hypothesis:** "If one microservice within our critical business application stopped logging, then we would immediately detect the event and instantiate log streams within a 30-minute window."
  * **Pause and reflect:** In this experiment, ask yourself honestly if you would be able to detect immediately when a single microservice stops logging. In our experience, the majority of organizations would detect the event through log-volume deficiencies, but would a single microservice cause a noticeable threshold of log volume deficiency?
  * **Why is this so important?** When log events stop reporting, in many cases, it could be an early warning sign of an attack. Additionally, even if the service stopped logging because of a system malfunction or misconfiguration, the fact remains that we are now blind to that service's operational health. It is difficult for anyone to defend something they cannot see.



### Conclusion

CISOs leading security organizations are trying to protect an increasingly complex and distributed value stream, yet traditional approaches are increasingly insufficient. Chaos engineering offers a strategic, tactical, and practical approach to test the resilience of enterprise security programs. From BCP and DR, to re-thinking your risk management program, driving automation, improving incident response, and improving application logging and monitoring, chaos engineering principles assist CISOs in adjusting to the changing environment. By deliberately injecting failure into their security program, the chaos engineering paradox hardens organizations against failure; for that, chaos engineering is becoming an indispensable commodity in today's complex landscape.

* * *

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/reasons-chaos-engineering-ciso

作者：[Aaron RinehartAaron RinehartAndrew Weidenhamer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/aaronrinehart/users/danwalsh/users/cnwatu/users/aaronrinehart/users/aaronrinehart/users/aw264701/users/aaronrinehart
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://en.wikipedia.org/wiki/Chaos_engineering
[3]: https://principlesofchaos.org/
[4]: https://opensource.com/article/18/6/security-experimentation
