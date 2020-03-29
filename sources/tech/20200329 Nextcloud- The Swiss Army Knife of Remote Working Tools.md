[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Nextcloud: The Swiss Army Knife of Remote Working Tools)
[#]: via: (https://itsfoss.com/nextcloud/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Nextcloud: The Swiss Army Knife of Remote Working Tools
======

Remote working culture has been booming for past few years in coding, graphics and other IT related fields. But the recent [Coronavirus pandemic][1] has made it mandatory for the companies to work from home if it’s possible for them.

While there are tons of tools to help you and your organization in working from home, let me share one open source software that has the features of several such tools combined into one.

### Nextcloud Hub: A Suite of Essential Tools for Remote Collaboration

[Nextcloud][2] is an open source software that can be used to store files, photos and videos for personal usage like Dropbox. But it’s more than just a private [cloud service][3].

You can add more than one users in Nextcloud and turn it into a collaboration platform for editing files in real time, chat with users, manage calendars, assign and manage tasks and more.

This video gives a good overview of its main features:

[Subscribe to our YouTube channel for more Linux videos][4]

### Main Features of Nextcloud

Let me highlight the main features of Nextcloud:

#### Sync files and share

![Nextcloud Files][5]

You can create workspaces based on user groups and share files in those folders. Users can create private files and folders and share them with selected users internally or externally (if they are allowed to). You can lock files in read only mode as well.

It also has a very powerful search feature that lets you search files from their name or tags. You can comment on files to provide feedback.

Text files can be edited in real time thanks to its builtin markdown editor. You can use OnlyOffice or Collabora to allow editing of docs, spreadsheet and presentations in real time.

It also has version control for the files so that you can revert changes easily.

#### Text Chat, Audio Chat, Video Chat and Web Meetings

![Nextcloud Video Call][6]

With NextCloud Talk, you can interact with other users by text messaging, audio calls, video calls and group calls for web meetings. You can also take meeting minutes during the video calls and share your screen for presentations. There is also a mobile app to stay connected all the time.

You can also create Slack like channels (known as circles) to communicate between members concerned with a specific topic.

#### Calendar, Contacts &amp; Mail

![Calendar Nextcloud][7]

You can manage all of your organization’s contact, divide them into groups based on departments.

With the calendar, you can see when someone is free or what meetings are taking place, like you do on Outlook.

You can also use the Mail feature and import the emails from other providers to use them inside Nextcloud interface.

#### Kanban project management with Deck

![][8]

Like Trello and Jira, you can create boards for various projects. You can create cards for each tasks, assign them to users and they can move it between the list based on the status of the task. It’s really up to you how you create boards to manage your projects in Kanban style.

#### Plenty of add-ons to get more out of Nextcloud

![Password Manager][9]

Nextcloud also has several add-ons (called apps). Some are developed by Nextcloud teams while some are from third-party developers. You may use them to extend the capability of Nextcloud.

For example, you can add a [Feedly style feed reader][10] and read news from various sources. Similarly, the [Paswords addon][11] lets you use Netxcloud as a password manager. You can even share common passwords with other Nextcloud users.

You can explore [all the apps on its website][12]. You’ll also notice the ratings of apps that will help you decide if you should use an app or not.

#### Many more features

Let me summarize all the features here:

  * Open source software that lets you own your data on your own servers
  * Seamlessly edit office documents together with others
  * Communicate with other members of your organization and do audio and video calls and held web meetings
  * Calendar lets you book meetings, brings busy view for meetings and resource booking and more
  * Manage users locally or authenticate through LDAP / Active Directory, Kerberos and Shibboleth / SAML 2.0 and more
  * Secure data with powerful file access control, multi-layer encryption, machine-learning based authentication protection and advanced ransomware recovery capabilities
  * Access existing storage silos like FTP, Windows Network Drives, SharePoint, Object Storage and Samba shares seamlessly through Nextcloud.
  * Automation: Automatically turn documents in PDFs, send messages to chat rooms and more!
  * Built in ONLYOFFICE makes collaborative editing of Microsoft Office documents accessible to everyone
  * Users can install desktop and mobile apps or simply use it in web browser



### How to get Nextcloud

![][13]

NextCloud is free and open source software. You can download it and install it on your own server.

You can use cloud server providers like [Linode][14] or [DigitalOcean][15] that allow you to deploy a brand new Linux server within minutes. And then you can use Docker to install NextCloud. At It’s FOSS, we use [Linode][14] for our NextCloud instance.

If you don’t want to do that, you can [signup with one of the Nextcloud partners][16] that provide you with configured Nextcloud instance. Some providers also provide a few GB of free data to try it.

Nextcloud also has an [enterprise plan][17] where Nextcloud team itself handles everything for the users and provide premium support. You can check their pricing [here][18].

If you decide to use Nextcloud, you should refer to its documentation or community forum to explore all its features.

### Conclusion

At It’s FOSS, our entire team works remote. We have no centralized office anywhere and all of us work from our home. Initially we relied on non-open source tools like Slack, Google Drive etc but lately we are migrating to their open source alternatives.

Nextcloud is one of the first software we tried internally. It has features of Dropbox, Google Docs, [Slack][19], [Trello][20], Google Hangout all combined in one software.

NextCloud works for most part but we found it struggling with the video calls. I think that has to do with the fact that we have it installed on a server with 1 GB of RAM that also runs some other web services like [Ghost CMS][21]. We plan to move it to a server with better specs. We’ll see if that should address these issues.

Since the entire world is struggling with the Coronavirus pandemic, using a solution like Nextcloud could be helpful for you and your organization in working from home.

How are you coping during the Coronavirus lockdown? Like [Linus Torvalds’ advice on remote working][22], do you also have some suggestion to share with the rest of us? Please feel free to use the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/nextcloud/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/2019%E2%80%9320_coronavirus_pandemic
[2]: https://nextcloud.com/
[3]: https://itsfoss.com/cloud-services-linux/
[4]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/nextcloud_files.png?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/nextcloud_video_call.jpg?ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/calendar_nextcloud.jpeg?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/nextcloud_kanban_project_management_app.jpeg?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/passman.png?fit=800%2C389&ssl=1
[10]: https://apps.nextcloud.com/apps/news
[11]: https://apps.nextcloud.com/apps/passwords
[12]: https://apps.nextcloud.com/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/nextcloud-feature.jpg?ssl=1
[14]: https://www.linode.com/?r=19db9d1ce8c1c91023c7afef87a28ce8c8c067bd
[15]: https://m.do.co/c/d58840562553
[16]: https://nextcloud.com/signup/
[17]: https://nextcloud.com/enterprise/
[18]: https://nextcloud.com/pricing/
[19]: https://slack.com/
[20]: https://trello.com/
[21]: https://itsfoss.com/ghost-3-release/
[22]: https://itsfoss.com/torvalds-remote-work-advice/
