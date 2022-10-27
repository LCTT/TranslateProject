[#]: subject: (Try Chatwoot, an open source customer relationship platform)
[#]: via: (https://opensource.com/article/21/6/chatwoot)
[#]: author: (Nitish Tiwari https://opensource.com/users/tiwarinitish86)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Try Chatwoot, an open source customer relationship platform
======
Chatwoot is an open source alternative to Intercom, Zendesk, Salesforce
Service Cloud, and other proprietary communications platforms.
![Digital images of a computer desktop][1]

Chatwoot is an open source customer relationship platform built with Ruby and Vue.js. It was written from scratch to allow customer-relations teams to build end-to-end platforms for ticket management and support.

This article looks at Chatwoot's architecture, installation, and key features.

### Chatwoot's architecture

Chatwoot requires the following components to function properly:

  * Chatwoot web servers
  * Chatwoot workers
  * PostgreSQL database
  * Redis
  * Email service (e.g., SMTP, SendGrid, Mailgun)
  * Object storage (e.g., AWS S3, Azure, Google Cloud Storage, MinIO)



The Chatwoot server and workers are the core components that integrate with everything else. PostgreSQL and Redis are specific, required components.

![Chatwoot architecture][2]

(Nitish Tiwari, [CC BY-SA 4.0][3])

The other components, like the email server and object storage, are loosely coupled, so you can use any compatible system. Therefore, you could choose any SMTP server, self-hosted or SaaS, as your email service. Similarly, for object storage, you can use public cloud platforms like AWS S3, Azure Blob Store, GCS, or private cloud platforms like MinIO.

### Install Chatwoot

Chatwoot is available on common platforms, including Linux virtual machines, Docker, and as a single-click install application on [Heroku][4] and [CapRover][5]. This how-to looks at the Docker installation process; for other platforms, refer to Chatwoot's [documentation][6].

To begin, ensure Docker Compose is installed on your machine. Then, download the `env` and `docker-compose` files from [Chatwoot's GitHub repo][7]:


```
# Download the env file template
wget -O .env <https://raw.githubusercontent.com/chatwoot/chatwoot/develop/.env.example>
# Download the Docker compose template
wget -O docker-compose.yml <https://raw.githubusercontent.com/chatwoot/chatwoot/develop/docker-compose.production.yaml>
```

Open the `env` file and fill in the env variables `REDIS_PASSWORD` and `POSTGRES_PASSWORD`; these will be the passwords for Redis and PostgreSQL, respectively. Then update the same PostgreSQL password in the `docker-compose.yaml` file. 

Now, prepare PostgreSQL:


```
`docker-compose run --rm rails bundle exec rails db:chatwoot_prepare`
```

Deploy Chatwoot:


```
`docker-compose up -d`
```

You should now be able to access Chatwoot at `http://localhost:3000`.

![Chatwoot welcome screen][8]

(Nitish Tiwari, [CC BY-SA 4.0][3])

### Chatwoot features

Fill in the details on the welcome page to create the admin user. After that, you should land on the Conversations page.

![Chatwoot conversations screen][9]

(Nitish Tiwari, [CC BY-SA 4.0][3])

The following are Chatwoot's key features:

#### Channels

Chatwoot supports a wide range of platforms as messaging Channels (including website widgets, Facebook, Twitter, WhatsApp, email, and others). To create an integration, click on the **Inboxes** button on the left-hand sidebar. Then select the platform you want to integrate with.

![Chatwoot channels screen][10]

(Nitish Tiwari, [CC BY-SA 4.0][3])

Each platform has its own set of human agents, teams, labels, and canned responses. This way, Chatwoot allows a unified interface for talking to customers, but each channel is as customizable as it can be in the background.

#### Reporting

Organizations take customer response service-level agreements (SLAs) very seriously—and rightly so. Chatwoot has an integrated dashboard that gives a birds-eye view of the most important metrics, like total messages, response times, resolution times, etc. Administrators can also download reports for specific agents.

![Chatwoot reports screen][11]

(Nitish Tiwari, [CC BY-SA 4.0][3])

#### Contacts

Chatwoot also captures contact details from each incoming message and neatly arranges this information on a separate page called Contacts. This ensures all contact details are available for further follow-up or even syncing with an external, full-fledged customer relationship management (CRM) platform.

![Chatwoot Contacts][12]

(Nitish Tiwari, [CC BY-SA 4.0][3])

#### Integrations

Channels enable integrations with external messaging systems so that Chatwoot can communicate using these systems. However, what if you want a team to be notified on Slack if there is a new chat message on Chatwoot?

This is where Integration Webhooks come into the picture. This feature allows you to integrate Chatwoot into external systems so that it can send out relevant information.

![Chatwoot Integrations][13]

(Nitish Tiwari, [CC BY-SA 4.0][3])

### Learn more

Chatwoot provides many of the key communications features customer relations teams want. To learn more about Chatwoot, take a look at its [GitHub repository][14] and [documentation][15].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/chatwoot

作者：[Nitish Tiwari][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tiwarinitish86
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://opensource.com/sites/default/files/uploads/chatwoot_servicecalls.png (Chatwoot architecture)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://www.heroku.com/
[5]: https://caprover.com/docs/get-started.html
[6]: https://www.chatwoot.com/docs/self-hosted/deployment/architecture#available-deployment-options
[7]: https://github.com/chatwoot/chatwoot
[8]: https://opensource.com/sites/default/files/uploads/chatwoot_welcome.png (Chatwoot welcome screen)
[9]: https://opensource.com/sites/default/files/uploads/chatwoot_conversations.png (Chatwoot conversations screen)
[10]: https://opensource.com/sites/default/files/uploads/chatwoot_channels.png (Chatwoot channels screen)
[11]: https://opensource.com/sites/default/files/uploads/chatwoot_reports.png (Chatwoot reports screen)
[12]: https://opensource.com/sites/default/files/uploads/chatwoot_contacts.png (Chatwoot Contacts)
[13]: https://opensource.com/sites/default/files/uploads/chatwoot_integrations.png (Chatwoot Integrations)
[14]: http://github.com/chatwoot/chatwoot
[15]: https://www.chatwoot.com/help-center
