[#]: subject: "Keep IT Services Up and Running with AI Based Digital Assistants"
[#]: via: "https://www.opensourceforu.com/2022/08/keep-it-services-up-and-running-with-ai-based-digital-assistants/"
[#]: author: "K. Narasimha Sekhar https://www.opensourceforu.com/author/k-narasimha-sekhar/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Keep IT Services Up and Running with AI Based Digital Assistants
======
*There are many ways AI based digital assistants help in IT operations. Traditionally, they have been deployed to improve helpdesk services. Today you can use them to reduce the mean time to repair (MTTR) of an IT service.*

enterprises deploy many IT services such as microservices, line of business services, virtual desktop services, and database services for their customers, business groups and employees. In case critical IT services break down, there is a huge negative impact in terms of enterprise revenue, and loss of productivity and reputation. Many of these services are hosted in the enterprise data centre, and can go down due to infrastructure, process, or human failures. Even in the case of public cloud hosting, enterprise integration is a weak link in the chain.

### Need of the hour

When a critical IT service is down, IT teams are under enormous pressure to restore it as quickly as possible. Faster root cause analysis is the need of the hour. Teams from various verticals — infrastructure, security, network, storage, and other relevant teams — get into the war room to find the root cause. Tons of logs, event sources, and traces are collected. It is a humongous task for the team to analyse huge data in a short time under panic conditions. Teams need reliable, intelligent, and faster tools to analyse data and provide dependable conclusions. Artificial intelligence based assistants can help in this situation.

Table 1 lists the typical questions teams need to answer during root cause analysis of IT operations after a critical service becomes unavailable.

### AI powered digital assistants

A digital assistant, also called virtual assistant, is an application program that understands natural language voice or chat commands and completes tasks for the user. In the context of root cause analysis or IT operations, the tasks are complex. To execute these tasks, virtual assistants adopt artificial intelligence.

Administrators, instead of logging in to individual layer consoles, pulling data manually and analysing it, can take the help of digital assistants. These assistants can do all the heavy lifting for IT staff. They assist in accelerating the process, thereby reducing mean time to repair (MTTR).

Typically, virtual assistants can do the following:

* On-demand interaction
* Context-driven recommendation
* Automated task execution
* Real-time reporting
* Pull the requested data quickly from multiple sources
* Remove noise and highlight contextual information
* Apply AI algorithms to find required results
* Search for anomaly patterns in huge data
* Correlate events from multiple sources to find relations and cumulative issues
* Enable automation at scale
* Run audit scripts and eliminate false negatives
* Analyse time series data for variations
* Analyse segment failures

AI based digital assistants can improve regular IT operations as well. They can:

* Estimate future capacity requirements based on current trends
* Enable automated rolling updates and roll-backs
* Automate mundane admin tasks
* Find anomalies

| IT phase | Inquiries/Functions/Operations | 
| :- | :- |
| Root cause analysis | What is the scope and impact of the issue?
Is the issue specific to one client, group of clients, entire site, or many locations?
Is there any common pattern with respect to the failed devices?
Are there any X, Y, Z events recorded in server logs?
How is the storage performance while users face performance degradation?
Are there any suspicious patterns in CPU, RAM, resource utilisation time series data, etc?
Were there any patches applied on any component in the past 24 hours?
Did new firewall configurations block critical ports?
How many connection failures were there in west region sites?
When X event occurred in component N, what was the database response time? | 
| Regular IT operations | Create an upgrade schedule for all regions.
Where should I host the new desktop/app among the available 20 host servers?
How many extra servers are needed in the next quarter?
I am starting patching, informing active users, and sending reminders till they log off.
Detect anomalies.
With API driven interfaces, trigger external tasks like creating a helpdesk ticket, without manual intervention.
Create a management report. |

* What is the scope and impact of the issue?
* Is the issue specific to one client, group of clients, entire site, or many locations?
* Is there any common pattern with respect to the failed devices?
* Are there any X, Y, Z events recorded in server logs?
* How is the storage performance while users face performance degradation?
* Are there any suspicious patterns in CPU, RAM, resource utilisation time series data, etc?
* Were there any patches applied on any component in the past 24 hours?
* Did new firewall configurations block critical ports?
* How many connection failures were there in west region sites?
* When X event occurred in component N, what was the database response time?

* Create an upgrade schedule for all regions.
* Where should I host the new desktop/app among the available 20 host servers?
* How many extra servers are needed in the next quarter?
* I am starting patching, informing active users, and sending reminders till they log off.
* Detect anomalies.
* With API driven interfaces, trigger external tasks like creating a helpdesk ticket, without manual intervention.
* Create a management report.

Table 1

### Architecture layers

Figure 1 shows the blueprint of a typical digital assistant.

Teams can give commands or query the virtual assistant by voice. The non-linguistic platforms available today are mature enough to understand user utterances and translate them into meaningful intents. A conversational engine can be built with advanced cognitive computing technology that allows virtual assistants to understand and carry out multi-step requests.

The AI layer is the core part. It understands the intent and structures, and triggers the workflow to capture the required data. It applies suitable AI algorithms to analyse the data, the results of which are communicated back to the user.

![Figure 1: Digital assistant layers][1]

IT services are complex and composed of many heterogeneous components. To integrate with these components, virtual assistants must implement different types of interfaces. The widely used interfaces are PowerShell, REST, OData, SQL, SNMP, etc.

| Inquiry | AI algorithms in scope | 
| :- | :- |
| Translate utterances to intents (Conversational engine) | NLP | 
| When X event occurred in server N, how was the dependant storage service performance? | Log, event analysis | 
| Data stream analysis | Statistical analysis | 
| Identify causes of issues by calculating highest probability of the issue occurring | Bayesian algorithm | 
| Prioritise root cause options | Bayesian algorithm | 
| Find anomaly patterns in resource utilisation | Time series analysis (e.g.,ARIMA) | 
| Classify issues | Text analysis | 
| Find out optimal resource groups | Segmentation (e.g.,K-Means) | 
| IT operations accelerators | Automation |

Table 2

Table 2 summarises the AI algorithms that are suitable for responding to typical inquiries that get triggered during a typical IT service root cause analysis and IT operations. The AI algorithms mentioned are indicative. There are a lot of algorithms available in each segment. We need to choose the right algorithm based on context. A detailed explanation of AI algorithms is beyond the scope of this article. Tons of reference literature is available publicly about AI algorithms.

![Figure 2: Digital assistant for virtual desktop service][2]

Figure 2 gives an illustration of how to build a digital assistant for a virtual desktop service. This service consists of many layers, and each one has different types of interfaces. Digital assistants should implement interfaces to interact with all these layers.

### Advanced auto-heal AI assistant

Digital assistants can be extended to detect, analyse and auto-heal issues arising during regular operations. In this case no human interaction is needed. Figure 3 shows logical layers of the auto-heal assistant. We need to use many AI algorithms to analyse the issues and trigger correct resolutions. We can make use of neural networks to learn and adapt to dynamic changes.

![Figure 3: Logical design of an auto-heal assistant][3]

*State/Condition:* This part defines the rule. The rule is evaluated and if the condition is true, then the state is generated. State can be evaluated when a condition occurs, and is checked on a periodic basis. For example, when an application or system event occurs, then it will be evaluated. If the condition is evaluated as true, the state is processed. In another case, the performance metrics are checked on a periodic basis (for example, once in a minute), the condition is evaluated and state is generated based on the result.

*Action:* This part defines what action is to be taken in case the trigger occurs. Typically, these are remedial actions (such as restarting a service, increasing resource allocation, etc) to rectify an issue and heal it automatically without human intervention. In case self-healing is not available or it fails, then the administrator can be notified and the service tickets raised automatically.

| Function | Open source modules | Cloud native deployments | 
| :- | :- | :- |
| Chatbot, NLP engine | ChatSDK,
ChatterBot, NTLK | Azure BOT Service, Amazon Lex, Alexa | 
| Automation | Ansible, Python,
PowerShell scripts | Serverless functions | 
| Visualisation | D3.js, Grafana | Power BI | 
| Tracing, Dependency analysis | Jaeger | Azure Monitor, AWS CloudWatch | 
| Telemetry | Prometheus, Istio | Azure Monitor, AWS CloudWatch | 
| Security | Python libraries | AWS Security Hub, Azure Sentinel, Security Center | 
| Infrastructure automation | Ansible, Terraform, Jenkins, Chef, Selenium | ARM, Cloud Foundation | 
| AIOPs | Seldon, Logilizer, Aiopstools, Whylogs | Vendor SaaS services |

Table 3

### Challenges

There are multiple challenges teams can face in implementing and deploying AI based virtual assistants.

Cost could be a major factor. There are many commercial tools available in the market, but they are expensive. Additionally, we need to buy plugins to interface with enterprise systems. One commercial tool may not be sufficient. For small- and medium-sized companies this cost can be a challenge. Open source modules, and customised orchestration engines suitable for specific enterprise needs, can help reduce these costs. Table 3 lists the recommended open source modules for on-premises deployments. In case of public cloud deployments, we can consider utilising native SaaS services from the cloud provider.

Integrating virtual assistants into your existing systems and applications can be a challenge as some level of in-house development effort is required. Home-grown scripts need to be maintained and updated as and when systems change. The return on investment of these efforts is high and justifiable.

Overcoming resistance can be another challenge. Team members may think AI can pose a risk to their jobs. But AI is all about relieving employees of repetitive work and freeing them up to be more creative and perform to their real potential.

The reasons for each IT service failure can be unique and root cause analysis might yield unexpected results. AI assistants help to analyse data systematically, learn from earlier failures and provide a quick resolution. They help in accelerating root cause analysis and restoring IT services that fail. In addition, these assistants help to fast-track IT admin operations with less manual intervention. Small companies can use open source platforms to build AI digital assistants.

*Disclaimer:* *The views expressed in this article are that of the author and Wipro does not subscribe to the substance, veracity or truthfulness of the said opinion.*

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/keep-it-services-up-and-running-with-ai-based-digital-assistants/

作者：[K. Narasimha Sekhar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/k-narasimha-sekhar/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Figure-1-Digital-assistant.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Figure-2-Digital-assistant-for-virtual-desktop-service.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Figure-3-Logical-design-of-an-auto-heal-assistant.jpg
