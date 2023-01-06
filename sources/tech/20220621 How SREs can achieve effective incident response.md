[#]: subject: "How SREs can achieve effective incident response"
[#]: via: "https://opensource.com/article/22/6/effective-incident-response-site-reliability-engineers"
[#]: author: "Robert Kimani https://opensource.com/users/robert-charles"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How SREs can achieve effective incident response
======
Get back to business and continue services in a timely manner by implementing a thorough incident response strategy.

![Person using a laptop][1]

Incident response includes monitoring, detecting, and reacting to unplanned events such as security breaches or other service interruptions. The goal is to get back to business, satisfy service level agreements (SLAs), and provide services to employees and customers. Incident response is the planned reaction to a breach or interruption. One goal is to avoid unmanaged incidents.

### Establish an on-call system

One way of responding is to establish an on-call system. These are the steps to consider when you're setting up an on-call system:

1. Design an [effective on-call system][2]
2. Understand managed vs. unmanaged incidents
3. Build and implement an effective postmortem process
4. Learn the tools and templates for postmortems

### Understand managed and unmanaged incidents

An *unmanaged incident* is an issue that an on-call engineer handles, often with whatever team member happens to be available to help. More often than not, unmanaged incidents become serious issues because they are not handled correctly. Issues include:

* No clear roles.
* No incident command.
* Random team members involved (freelancing), the primary killer of the management process.
* Poor (or lack of) communication.
* No central body running troubleshooting.

A *managed incident* is one handled with clearly defined procedures and roles. Even when an incident isn't anticipated, it's still met with a team that's prepared. A managed incident is ideal. It includes:

* Clearly defined roles.
* Designated incident command that leads the effort.
* Only the ops-team defined by the incident command updates systems.
* A dedicated communications role exists until a communication person is identified. The Incident Command can fill in this role.
* A recognized command post such as a "war room." Some organizations have a defined "war room bridge number" where all the incidents are handled.

Incident management takes place in a war room. The Incident Command is the role that leads the war room. This role is also responsible for organizing people around the operations team, planning, and communication.

The Operations Team is the only team that can touch the production systems. Hint: Next time you join an incident management team, the first question to ask is, Who is running the Incident Command?

### Deep dive into incident management roles

Incident management roles clearly define who is responsible for what activities. These roles should be established ahead of time and well-understood by all participants.

**Incident Command**: Runs the war room and assigns responsibilities to others.

**Operations Team**: Only role allowed to make changes to the production system.

**Communication Team**: Provides periodic updates to stakeholders such as the business partners or senior executives.

**Planning Team**: Supports operations by handling long-term items such as providing bug fixes, postmortems, and anything that requires a planning perspective.

As an SRE, you'll probably find yourself in the Operations Team role, but you may also have to fill other roles.

### Build and implement an effective postmortem process

Postmortem is a critical part of incident management that occurs once the incident is resolved.

#### Why postmortem?

* Fully understand/document the incident using postmortems. You can ask questions such as "What could have been done differently?"
* Conduct a deep dive "root cause" analysis, producing valuable insights.
* Learn from the incident. This is the primary benefit of doing postmortems.
* Identify opportunities for prevention as part of postmortem analysis, e.g., identify a monitoring enhancement to catch an issue sooner in the future.
* Plan and follow through with assigned activities as part of the postmortem.

#### Blameless postmortem: a fundamental tenet of SRE

No finger-pointing. People are quite honestly scared about postmortems because one person or team may be held responsible for the outage. Avoid finger-pointing at all costs; instead, focus solely on systems and processes and *not* on individuals. Isolating individuals/teams can create an unhealthy culture. For instance, the next time someone commits a mistake, they will not come forward and accept it. They may hide the activity due to the fear of being blamed.

Though there is no room for finger-pointing, the postmortem must call out improvement opportunities. This approach helps avoid further similar incidents.

#### When is a postmortem needed?

Is a postmortem necessary for all incidents or only for certain situations? Here are some suggestions for when a postmortem is useful:

* End-user experience impact beyond a threshold (SLO). If the SLO in place is impacted due to:
  * Unavailable services
  * Unacceptable performance
  * Erratic functionality
* Data loss.
* Organization/group-specific requirements with different policies and protocols to follow.

#### Six minimum items required in a postmortem

The postmortem should include the following six components:

1. Summary: Provide a succinct incident summary.
2. Impact (must include any financial impact): Executives will look for impact and financial information.
3. Root cause(s): Identify the root cause, if possible.
4. Resolution: What the team actually did to fix the issue.
5. Monitoring (issue detection): Specify how the incident was identified. Hopefully, this was a monitoring system rather than an end-user complaint.
6. Action items with due dates and owners: This is important. Do not simply conduct a postmortem and forget the incident. Establish action items, assign owners, and follow through on these. Some organizations may also include a detailed timeline of occurrences in the postmortem, which can be useful to walk through the sequence of events.

Before the postmortem is published, a supervisor or senior team member(s) must review the document to avoid any errors or misrepresentation of facts.

#### Find postmortem tools and templates

If you haven't done postmortems before, you may be wondering how to get started. You've learned a lot about postmortems thus far, but how do you actually implement one?

That's where tools and templates come into play. There are many tools available. Consider the following:

1. Existing ITSM tools in your organization. Popular examples include ServiceNow, Remedy, Atlassian ITSM, etc. Existing tools likely provide postmortem tracking capabilities.
2. Open source tools are also available, the most popular being [Morgue][3], released by Etsy. Another popular choice is [PagerDuty][4].
3. Develop your own. Remember, SREs are also software engineers! It doesn't have to be fancy, but it must have an easy-to-use interface and a way to store the data reliably.
4. Templates. These are documents that you can readily use to track your postmortems. There are many templates available, but the most popular ones are:

* Google: [Postmortem Culture: Learning from Failure][5] and [Example Postmortem][6]
* Pagerduty: [The Postmortem][7]
* Atlassian: Root Cause Analysis – The 5 whys?
[Incident Postmortem Template][8]
[Incident Postmortems][9]
* [Splunk On-Call, formerly VictorOps][12]
* Other [GitHub Template resources][13]
* A custom in-house template: This may be the most effective option as it suits your organization's needs.

### Wrap up

Here are the key points for the above incident response discussion:

* Effective on-call system is necessary to ensure service availability and health.
* Balance workload for on-call engineers.
  * Allocate resources.
  * Use multi-region support.
  * Promote a safe and positive environment.
* Incident management must facilitate a clear separation of duties.
  * Incident command, operations, planning, and communication.
* Blameless postmortems help prevent repeated incidents.

Incident management is only one side of the equation. For an SRE organization to be effective, it must also have a change management system in place. After all, changes cause many incidents.

The next article looks at ways to apply effective change management.

#### Further reading

* [Blameless Postmortems and a Just Culture][16]
* [Postmortem Checklist][17]

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/effective-incident-response-site-reliability-engineers

作者：[Robert Kimani][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/robert-charles
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/laptop_screen_desk_work_chat_text.png
[2]: https://opensource.com/article/22/6/introduction-site-reliability-engineering
[3]: https://github.com/etsy/morgue
[4]: https://github.com/PagerDuty/postmortem-docs
[5]: https://sre.google/sre-book/postmortem-culture/
[6]: https://sre.google/sre-book/example-postmortem/
[7]: https://postmortems.pagerduty.com/
[8]: https://www.atlassian.com/incident-management/postmortem/templates
[9]: https://www.atlassian.com/incident-management/handbook/postmortems
[10]: https://www.atlassian.com/incident-management/postmortem/templates
[11]: https://www.atlassian.com/incident-management/handbook/postmortems
[12]: https://help.victorops.com/
[13]: https://github.com/dastergon/postmortem-templates
[14]: https://www.atlassian.com/incident-management/postmortem/templates
[15]: https://www.atlassian.com/incident-management/handbook/postmortems
[16]: https://www.etsy.com/codeascraft/blameless-postmortems/
[17]: https://docs.google.com/document/d/1iaEgF0ICSmKKLG3_BT5VnK80gfOenhhmxVnnUcNSQBE/edit
