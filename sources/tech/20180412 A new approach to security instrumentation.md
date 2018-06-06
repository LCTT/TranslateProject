A new approach to security instrumentation
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_privacy_lock.png?itok=ZWjrpFzx)

How many of us have ever uttered the following phrase: “I hope this works!”?

Without a doubt, most of us have, likely more than once. It’s not a phrase that inspires confidence, as it reveals doubts about our abilities or the functionality of whatever we are testing. Unfortunately, this very phrase defines our traditional security model all too well. We operate based on the assumption and the hope that the controls we put in place—from vulnerability scanning on web applications to anti-virus on endpoints—prevent malicious actors and software from entering our systems and damaging or stealing our information.

Penetration testing took a step to combat relying on assumptions by actively trying to break into the network, inject malicious code into a web application, or spread “malware” by sending out phishing emails. Composed of finding and poking holes in our different security layers, pen testing fails to account for situations in which holes are actively opened. In security experimentation, we intentionally create chaos in the form of controlled, simulated incident behavior to objectively instrument our ability to detect and deter these types of activities.

> “Security experimentation provides a methodology for the experimentation of the security of distributed systems to build confidence in the ability to withstand malicious conditions.”

When it comes to security and complex distributed systems, a common adage in the chaos engineering community reiterates that “hope is not an effective strategy.” How often do we proactively instrument what we have designed or built to determine if the controls are failing? Most organizations do not discover that their security controls are failing until a security incident results from that failure. We believe that “Security incidents are not detective measures” and “Hope is not an effective strategy” should be the mantras of IT professionals operating effective security practices.

The industry has traditionally emphasized preventative security measures and defense-in-depth, whereas our mission is to drive new knowledge and insights into the security toolchain through detective experimentation. With so much focus on the preventative mechanisms, we rarely attempt beyond one-time or annual pen testing requirements to validate whether or not those controls are performing as designed.

With all of these constantly changing, stateless variables in modern distributed systems, it becomes next to impossible for humans to adequately understand how their systems behave, as this can change from moment to moment. One way to approach this problem is through robust systematic instrumentation and monitoring. For instrumentation in security, you can break down the domain into two primary buckets: **testing** , and what we call **experimentation**. Testing is the validation or assessment of a previously known outcome. In plain terms, we know what we are looking for before we go looking for it. On the other hand, experimentation seeks to derive new insights and information that was previously unknown. While testing is an important practice for mature security teams, the following example should help further illuminate the differences between the two, as well as provide a more tangible depiction of the added value of experimentation.

### Example scenario: Craft beer delivery

Consider a simple web service or web application that takes orders for craft beer deliveries.

This is a critical service for this craft beer delivery company, whose orders come in from its customers' mobile devices, the web, and via its API from restaurants that serve its craft beer. This critical service runs in the company's AWS EC2 environment and is considered by the company to be secure. The company passed its PCI compliance with flying colors last year and annually performs third-party penetration tests, so it assumes that its systems are secure.

This company also prides itself on its DevOps and continuous delivery practices by deploying sometimes twice in the same day.

After learning about chaos engineering and security experimentation, the company's development teams want to determine, on a continuous basis, how resilient and effective its security systems are to real-world events, and furthermore, to ensure that they are not introducing new problems into the system that the security controls are not able to detect.

The team wants to start small by evaluating port security and firewall configurations for their ability to detect, block, and alert on misconfigured changes to the port configurations on their EC2 security groups.

  * The team begins by performing a summary of their assumptions about the normal state.
  * Develops a hypothesis for port security in their EC2 instances
  * Selects and configures the YAML file for the Unauthorized Port Change experiment.
  * This configuration would designate the objects to randomly select from for targeting, as well as the port ranges and number of ports that should be changed.
  * The team also configures when to run the experiment and shrinks the scope of its blast radius to ensure minimal business impact.
  * For this first test, the team has chosen to run the experiment in their stage environments and run a single run of the test.
  * In true Game Day style, the team has elected a Master of Disaster to run the experiment during a predefined two-hour window. During that window of time, the Master of Disaster will execute the experiment on one of the EC2 Instance Security Groups.
  * Once the Game Day has finished, the team begins to conduct a thorough, blameless post-mortem exercise where the focus is on the results of the experiment against the steady state and the original hypothesis. The questions would be something similar to the following:



### Post-mortem questions

  * Did the firewall detect the unauthorized port change?
  * If the change was detected, was it blocked?
  * Did the firewall report log useful information to the log aggregation tool?
  * Did the SIEM throw an alert on the unauthorized change?
  * If the firewall did not detect the change, did the configuration management tool discover the change?
  * Did the configuration management tool report good information to the log aggregation tool?
  * Did the SIEM finally correlate an alert?
  * If the SIEM threw an alert, did the Security Operations Center get the alert?
  * Was the SOC analyst who got the alert able to take action on the alert, or was necessary information missing?
  * If the SOC alert determined the alert to be credible, was Security Incident Response able to conduct triage activities easily from the data?



The acknowledgment and anticipation of failure in our systems have already begun unraveling our assumptions about how our systems work. Our mission is to take what we have learned and apply it more broadly to begin to truly address security weaknesses proactively, going beyond the reactive processes that currently dominate traditional security models.

As we continue to explore this new domain, we will be sure to post our findings. For those interested in learning more about the research or getting involved, please feel free to contact [Aaron Rinehart][1] or [Grayson Brewer][2].

Special thanks to Samuel Roden for the insights and thoughts provided in this article.

**[See our related story,[Is the term DevSecOps necessary?][3]]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/new-approach-security-instrumentation

作者：[Aaron Rinehart][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/aaronrinehart
[1]:https://twitter.com/aaronrinehart
[2]:https://twitter.com/BrewerSecurity
[3]:https://opensource.com/article/18/4/devsecops
