[#]: subject: "Why choose Rocket.Chat for your open source chat tool"
[#]: via: "https://opensource.com/article/22/1/rocketchat-data-privacy"
[#]: author: "Manuela Massochin https://opensource.com/users/manuela-massochin"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why choose Rocket.Chat for your open source chat tool
======
Rocket.Chat is an open source communications platform for organizations
that put data privacy first.
![Chat via email][1]

Created in 2015, [Rocket.Chat][2] is a fully open source and customizable communications platform designed for communities and organizations with high standards for data protection. Rocket.Chat enables communication through federation, and over 12 million people are using it for team chat, customer service, secure file sharing, and much more. Rocket.Chat is in many ways the world's most comprehensive open source communications platform.

### Install Rocket.Chat

Rocket.Chat is open source, so you can install and host it yourself if you want. You can deploy it using all industry-standard deployment methods, including Podman, Docker, or Kubernetes, all of which are supported officially by Rocket.Chat. It's also available as a one-click app on many server and cloud providers.

To run Rocket.Chat using Docker, downloading the `docker-compose.yml` file:


```


$ wget -O docker-compose.yml \
<https://raw.githubusercontent.com/RocketChat/Rocket.Chat/develop/docker-compose.yml>

```

Now deploy Rocket.Chat:


```
`$ docker-compose up -d`
```

[Firewall configuration][3] may be necessary, depending on your setup.

Once you have the server running, you can download the Rocket.Chat client app on your desktop and mobile device.

Alternatively, you can purchase a hosting from Rocket.Chat itself. There's a free trial, so you can evaluate it before committing, but Rocket.Chat is used in over 130 countries, and is the go-to messaging app for organizations including The World Bank, the US Navy, and [Audi][4].

### Rocket.Chat's main features

Due to its scalability and adaptability, organizations can leverage Rocket.Chat in multiple ways, from internal communication to virtual events. Rocket.Chat's openness even allows companies to create new products on top of its code.

![Rocket.Chat UI][5]

Manuela Massochin (CC BY-SA 4.0)

#### Talk to people outside of Rocket.Chat

Communicating with other teams shouldn't be a hassle just because they use different communication platforms. Using federation, Rocket.Chat allows you to chat with partners, vendors, or any external organization, regardless of which collaboration platform they use. You can talk to people across Slack, MS Teams, Skype for Business, and other communications platforms.

### 5 reasons organizations choose Rocket.Chat

Your data is important, whether it's personal or work-related. It's a common misunderstanding that no criminal is interested enough in what you do online to bother stealing it, but ransomware is a largely automated process that doesn't require anyone to care about you. All it needs is data that's important to you to be exposed, stolen, and then ransomed back to you. To combat this, you need sufficient privacy in your online communication.

That's one reason to choose Rocket.Chat, but not the only one. Here are five good reasons to choose Rocket.Chat over a non-open application:

#### Open source

First things first: Rocket.Chat has been open source since day one. With over 1000 contributors worldwide, it has standards for security, data privacy, and transparency that only open source software can offer.

Rocket.Chat is full of out-of-the-box features and you can make it even more useful, efficient, and fun with integrations and add-on apps. This is just one of the [advantages of being open source.][6] Based on webhooks, its integrations connect the tools you already use with your workspace, providing a simplified workflow and increased productivity.

In Rocket.Chat's [Marketplace][7] you'll find apps to integrate with other services, such as WhatsApp, Twitter, Jira, Dialogflow, Facebook Messenger, and many more. They're just one click away from being added to your workplace.

#### Streamlined communication for teams and customers

You don't have to take a scientific survey to know that employees want communication to be streamlined through a single application. Rocket.Chat accommodates all sorts of workplace communication and allows you to divide conversations into channels, threads, and discussions to work with your remote colleagues.

It also has a comprehensive set of team collaboration features that ensure productivity, such as unlimited access to chat history, broadcast channels, and integrations.

Not only does Rocket.Chat allow you to chat with colleagues, but it also lets you get in touch with customers and centralize your messages in a single inbox. Due to its comprehensive set of integrations, you can provide customer support entirely from Rocket.Chat, regardless of the channel your customers reach out to you from.

Rocket.Chat integrates with common social media channels (including Facebook Messenger, email, WhatsApp, Telegram, and SMS) and also provides integrations with CRMs, chatbots, and machine learning apps.

#### SaaS or self-managed hosting

Rocket.Chat can be deployed in multiple ways, depending on business needs. You can choose between deploying it on Rocket.Chat's cloud (built on Docker and Kubernetes), cloud servers under your control, or your own premises.

Rocket.Chat offers one-click deployments for more than thirty deployment methods across many on-premise and cloud solutions. For companies worried about data security, its on-premise hosting option puts you in complete control of your data, meaning nothing leaves your infrastructure. It can be hosted entirely behind your firewall or even on an air-gapped network.

#### Complete data privacy, security, and ownership

Rocket.Chat is ISO27001-certified and supports compliance with GDPR, HIPAA, FINRA, FedRAMP, and more.

Its SaaS version is hosted in secure and audited data centers, ensuring the best performance and meeting strict data localization requirements. For the on-premise version, you'll be able to leverage the self-managed installation in your data center with layered security options (e.g., SSL, VPN, and DMZ).

The self-managed option is a common choice for many companies with high standards for data security, like the American cybersecurity firm [OnShore][8] and the [Government of British Columbia][9].

#### High availability infrastructure and microservices architecture

A common pain point for fast-growing companies and startups is finding software solutions that grow with them. Rocket.Chat's microservices architecture allows companies to scale easily and save on infrastructure costs.

A microservices architecture means that the application is developed as a suite of small services. When it needs to be scaled, only parts of the system will need to be adjusted instead of the whole system—saving companies time and money.

If you're pitching Rocket.Chat to your boss, it's significant that you can start using Rocket.Chat for free, or opt for one of its paid SaaS and self-hosted plans starting at $2 USD/user month. Paid plans offer a high availability infrastructure, microservices, administrative features (including LDAP and Active Directory, social media log in, an Atlassian bundle, and more), and unlimited push notifications.

### Try Rocket.Chat

Whether you host your own Rocket.Chat server or you opt for managed hosting, it's easy to [get started][10] with this great chat tool. Consolidate your communication into one open source application, increase online privacy, and support open source.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/rocketchat-data-privacy

作者：[Manuela Massochin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/manuela-massochin
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: http://rocket.chat/
[3]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[4]: https://rocket.chat/customer-stories/audi
[5]: https://opensource.com/sites/default/files/rocket-chat-ui.png (Rocket.Chat UI)
[6]: https://rocket.chat/blog/open-source-software-advantages
[7]: https://rocket.chat/marketplace
[8]: https://pt-br.rocket.chat/customer-stories/onshore
[9]: https://pt-br.rocket.chat/customer-stories/government-of-british-columbia
[10]: https://rocket.chat/install
