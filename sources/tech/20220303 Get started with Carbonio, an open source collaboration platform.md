[#]: subject: "Get started with Carbonio, an open source collaboration platform"
[#]: via: "https://opensource.com/article/22/3/open-source-collaboration-carbonio"
[#]: author: "Arman Khosravi https://opensource.com/users/arman-khosravi"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Get started with Carbonio, an open source collaboration platform
======
Carbonio empowers teams to work efficiently and closely together,
regardless of distance, timezone, or work preferences.
![Working on a team, busy worklife][1]

In recent years, interest in using open source collaboration platforms to enhance business productivity increased. Proprietary software has managed to overwhelm customers with a maze of licensing requirements and pay-to-play features that many companies don't want to manage. On the other hand, open source offers alternatives that give companies the liberty of choice and allow new businesses to enter existing markets easier with more control over upfront costs.

There are many choices in open source when selecting collaborative suites. My favorite is the AGPL-licensed Community Edition of Carbonio by Zextras (you may know Zextras from their complementary components for Zimbra Open Source).

### Carbonio Community Edition

In January 2022, Zexras introduced an open source email server and collaboration platform called Carbonio Community Edition (Carbonio CE). It comes with a powerful web client to organize emails, calendars, attachments, and personal files. It also has collaboration features like collaborative editing, group chats, and video meetings, all integrated into the web client.

![Carbonio CE][2]

(Zextras, [CC BY-SA 4.0][3])

In this article, I describe Carbonio CE's components and what I think distinguishes each one from similar products.

### Carbonio CE server

Carbonio CE, at its core, is an email server with dedicated anti-spam and antivirus. System administrators can use different tools to deploy on-premises servers, customize a white label login page, and manage storage, quotas, and mailboxes.

#### Admin console

Carbonio CE has an admin console to facilitate various administrative tasks divided into four categories:

  * **Monitor:** Get information about server status, running services, and statistics.
  * **Account:** Manage accounts, aliases, and mailing lists.
  * **Settings:** Manage global settings, domains, class of service, and certificates.
  * **Search:** Perform an advanced search on the entire email server.



### Carbonio CE web client

Carbonio CE comes with a modern web client with a minimal look and feel, but it's full of features. Carbonio CE's web client integrates all the necessary tools users need during a typical workday in a unified platform. The goal is to have a product to improve productivity by minimizing common distractions such as frequent context switching.

#### Email, calendar, contacts, and search

Like many email clients, Carbonio CE provides users with different tools to manage emails, including tags, folders, filters, and more. One of the most valuable (but lesser-seen) features is shared inboxes, folders, and item sharing between users. This is particularly useful for office employees who send many emails to project collaborators or any group of users daily.

Another valuable feature of Carbonio CE is having multiple tabs for composing and previewing emails. It helps users access different resources without changing tabs while writing an email.

![Carbonio email][4]

(Zextras, [CC BY-SA 4.0][3])

Calendars and event management tools are often the starting points of daily workplace procedures. In Carbonio CE, all components (emails, attachments, meeting rooms, personal files, and contacts) work together in a way that users can easily: 

  * Create events
  * Schedule meetings
  * Find attendees' free hours
  * Add descriptions
  * Attach files directly from an integrated file manager
  * Send invitations to all attendees automatically by email 



Moreover, the interface supports drag-and-drop functionalities to facilitate event management.

![Carbonio calendar][5]

(Zextras, [CC BY-SA 4.0][3])

When it comes to contact management, a handy feature in Carbonio CE is that users can manage multiple address books while sharing each between specific users. Shared address books help create different lists of users for various projects, teams, or sectors. Users can quickly select the corresponding address books for sending emails to specific groups instead of inserting users one by one. The same goes for sending files, scheduling meetings, and creating calendar events.

Search system and indexing in Carbonio CE include all the components. Therefore, a search query covers email, contacts, events, attachments, and documents. Search within email bodies is also a neat feature, especially for office employees. You also find other functions—advanced filters and complex queries using logical operators.

#### Chats and video meetings

Carbonio CE provides users with a full-featured communication system integrated into the webmail. It includes individual chats, group conversations, video meetings, screen sharing, and file-sharing capabilities.

![Carbonio chat][6]

(Zextras, [CC BY-SA 4.0][3])

#### File management with collaborative editing

Another feature is professional collaborative editing for modifying documents with several teammates in real time. It comes with file management to easily organize, modify, and share files with other users. It works perfectly with webmail, so users can easily save attachments into their files or attach personal documents directly into an email or a chat message.

![Carbonio files][7]

(Zextras, [CC BY-SA 4.0][3])

### Carbonio CE mobile clients

Carbonio CE has three free mobile apps that support Android and iOS devices:

  * **Mail:** A mobile client for email, calendars, and contacts.
  * **Chats:** An instant messaging app for individual or group conversations, including video meetings.
  * **Files:** A file manager to access personal files on a Carbonio CE platform.



![Carbonio CE UI][8]

(Zextras, [CC BY-SA 4.0][3])

### Try Carbonio

Carbonio has all the features you need and expect from collaborative software and tries its best to empower teams to work efficiently and closely together, regardless of distance, timezone, or work preferences. It's open source, easy to set up, and intuitive to use.

Zextras has been working on open source email servers and collaboration platforms for 20 years and believes in the unmatched potential of open source principles to achieve high-quality software that gives users more flexibility. This is why all [contributions to Carbonio Community Edition][9] are valued, whether you're helping with documentation, localization, or software development to add new features to the platform.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/3/open-source-collaboration-carbonio

作者：[Arman Khosravi][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/arman-khosravi
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://opensource.com/sites/default/files/pictures/carbonio_ce.png (Carbonio CE)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/ui_1.png (Carbonio email)
[5]: https://opensource.com/sites/default/files/uploads/ui_2.png (Carbonio calendar)
[6]: https://opensource.com/sites/default/files/uploads/ui_3.png (Carbonio chat)
[7]: https://opensource.com/sites/default/files/uploads/ui_4.png (Carbonio files)
[8]: https://opensource.com/sites/default/files/pictures/ui_5.png (Carbonio CE UI)
[9]: https://www.zextras.com/carbonio-ce-contribute/
