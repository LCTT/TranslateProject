Security Chaos Engineering: A new paradigm for cybersecurity
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_bank_vault_secure_safe.png?itok=YoW93h7C)

Security is always changing and failure always exists.

This toxic scenario requires a fresh perspective on how we think about operational security. We must understand that we are often the primary cause of our own security flaws. The industry typically looks at cybersecurity and failure in isolation or as separate matters. We believe that our lack of insight and operational intelligence into our own security control failures is one of the most common causes of security incidents and, subsequently, data breaches.

> Fall seven times, stand up eight." --Japanese proverb

The simple fact is that "to err is human," and humans derive their success as a direct result of the failures they encounter. Their rate of failure, how they fail, and their ability to understand that they failed in the first place are important building blocks to success. Our ability to learn through failure is inherent in the systems we build, the way we operate them, and the security we use to protect them. Yet there has been a lack of focus when it comes to how we approach preventative security measures, and the spotlight has trended toward the evolving attack landscape and the need to buy or build new solutions.

### Security spending is continually rising and so are security incidents

We spend billions on new information security technologies, however, we rarely take a proactive look at whether those security investments perform as expected. This has resulted in a continual increase in security spending on new solutions to keep up with the evolving attacks.

Despite spending more on security, data breaches are continuously getting bigger and more frequent across all industries. We have marched so fast down this path of the "get-ahead-of-the-attacker" strategy that we haven't considered that we may be a primary cause of our own demise. How is it that we are building more and more security measures, but the problem seems to be getting worse? Furthermore, many of the notable data breaches over the past year were not the result of an advanced nation-state or spy-vs.-spy malicious advanced persistent threats (APTs); rather the principal causes of those events were incomplete implementation, misconfiguration, design flaws, and lack of oversight.

The 2017 Ponemon Cost of a Data Breach Study breaks down the [root causes of data breaches][1] into three areas: malicious or criminal attacks, human factors or errors, and system glitches, including both IT and business-process failure. Of the three categories, malicious or criminal attacks comprises the largest distribution (47%), followed by human error (28%), and system glitches (25%). Cybersecurity vendors have historically focused on malicious root causes of data breaches, as it is the largest sole cause, but together human error and system glitches total 53%, a larger share of the overall problem.

What is not often understood, whether due to lack of insight, reporting, or analysis, is that malicious or criminal attacks are often successful due to human error and system glitches. Both human error and system glitches are, at their root, primary markers of the existence of failure. Whether it's IT system failures, failures in process, or failures resulting from humans, it begs the question: "Should we be focusing on finding a method to identify, understand, and address our failures?" After all, it can be an arduous task to predict the next malicious attack, which often requires investment of time to sift threat intelligence, dig through forensic data, or churn threat feeds full of unknown factors and undetermined motives. Failure instrumentation, identification, and remediation are mostly comprised of things that we know, have the ability to test, and can measure.

Failures we can analyze consist not only of IT, business, and general human factors but also the way we design, build, implement, configure, operate, observe, and manage security controls. People are the ones designing, building, monitoring, and managing the security controls we put in place to defend against malicious attackers. How often do we proactively instrument what we designed, built, and are operationally managing to determine if the controls are failing? Most organizations do not discover that their security controls were failing until a security incident results from that failure. The worst time to find out your security investment failed is during a security incident at 3 a.m.

> Security incidents are not detective measures and hope is not a strategy when it comes to operating effective security controls.

We hypothesize that a large portion of data breaches are caused not by sophisticated nation-state actors or hacktivists, but rather simple things rooted in human error and system glitches. Failure in security controls can arise from poor control placement, technical misconfiguration, gaps in coverage, inadequate testing practices, human error, and numerous other things.

### The journey into Security Chaos Testing

Our venture into this new territory of Security Chaos Testing has shifted our thinking about the root cause of many of our notable security incidents and data breaches.

We were brought together by [Bruce Wong][2], who now works at Stitch Fix with Charles, one of the authors of this article. Prior to Stitch Fix, Bruce was a founder of the Chaos Engineering and System Reliability Engineering (SRE) practices at Netflix, the company commonly credited with establishing the field. Bruce learned about this article's other author, Aaron, through the open source [ChaoSlingr][3] Security Chaos Testing tool project, on which Aaron was a contributor. Aaron was interested in Bruce's perspective on the idea of applying Chaos Engineering to cybersecurity, which led Bruce to connect us to share what we had been working on. As security practitioners, we were both intrigued by the idea of Chaos Engineering and had each begun thinking about how this new method of instrumentation might have a role in cybersecurity.

Within a short timeframe, we began finishing each other's thoughts around testing and validating security capabilities, which we collectively call "Security Chaos Engineering." We directly challenged many of the concepts we had come to depend on in our careers, such as compensating security controls, defense-in-depth, and how to design preventative security. Quickly we realized that we needed to challenge the status quo "set-it-and-forget-it" model and instead execute on continuous instrumentation and validation of security capabilities.

Businesses often don't fully understand whether their security capabilities and controls are operating as expected until they are not. We had both struggled throughout our careers to provide measurements on security controls that go beyond simple uptime metrics. Our journey has shown us there is a need for a more pragmatic approach that emphasizes proactive instrumentation and experimentation over blind faith.

### Defining new terms

In the security industry, we have a habit of not explaining terms and assuming we are speaking the same language. To correct that, here are a few key terms in this new approach:

  * **(Security) Chaos Experiments** are foundationally rooted in the scientific method, in that they seek not to validate what is already known to be true or already known to be false, rather they are focused on deriving new insights about the current state.
  * **Security Chaos Engineering** is the discipline of instrumentation, identification, and remediation of failure within security controls through proactive experimentation to build confidence in the system's ability to defend against malicious conditions in production.



### Security and distributed systems

Consider the evolving nature of modern application design where systems are becoming more and more distributed, ephemeral, and immutable in how they operate. In this shifting paradigm, it is becoming difficult to comprehend the operational state and health of our systems' security. Moreover, how are we ensuring that it remains effective and vigilant as the surrounding environment is changing its parameters, components, and methodologies?

What does it mean to be effective in terms of security controls? After all, a single security capability could easily be implemented in a wide variety of diverse scenarios in which failure may arise from many possible sources. For example, a standard firewall technology may be implemented, placed, managed, and configured differently depending on complexities in the business, web, and data logic.

It is imperative that we not operate our business products and services on the assumption that something works. We must constantly, consistently, and proactively instrument our security controls to ensure they cut the mustard when it matters. This is why Security Chaos Testing is so important. What Security Chaos Engineering does is it provides a methodology for the experimentation of the security of distributed systems in order to build confidence in the ability to withstand malicious conditions.

In Security Chaos Engineering:

  * Security capabilities must be end-to-end instrumented.
  * Security must be continuously instrumented to build confidence in the system's ability to withstand malicious conditions.
  * Readiness of a system's security defenses must be proactively assessed to ensure they are battle-ready and operating as intended.
  * The security capability toolchain must be instrumented from end to end to drive new insights into not only the effectiveness of the functionality within the toolchain but also to discover where added value and improvement can be injected.
  * Practiced instrumentation seeks to identify, detect, and remediate failures in security controls.
  * The focus is on vulnerability and failure identification, not failure management.
  * The operational effectiveness of incident management is sharpened.



As Henry Ford said, "Failure is only the opportunity to begin again, this time more intelligently." Security Chaos Engineering and Security Chaos Testing give us that opportunity.

Would you like to learn more? Join the discussion by following [@aaronrinehart][4] and [@charles_nwatu][5] on Twitter.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/new-paradigm-cybersecurity

作者：[Aaron Rinehart][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/aaronrinehart
[1]:https://www.ibm.com/security/data-breach
[2]:https://twitter.com/bruce_m_wong?lang=en
[3]:https://github.com/Optum/ChaoSlingr
[4]:https://twitter.com/aaronrinehart
[5]:https://twitter.com/charles_nwatu
