[#]: subject: "An open source alternative to Microsoft Exchange"
[#]: via: "https://opensource.com/article/21/9/open-source-groupware-grommunio"
[#]: author: "Markus Feilner https://opensource.com/users/mfeilner"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

An open source alternative to Microsoft Exchange
======
Open source users now have a robust and fully functional choice for
groupware.
![Working on a team, busy worklife][1]

Microsoft Exchange has for many years been nearly unavoidable as a platform for groupware environments. Late in 2020, however, an Austrian open source software developer introduced [grommunio][2], a groupware server and client with a look and feel familiar to Exchange and Outlook users.

The grommunio project functions well as a drop-in replacement for Exchange. The developers connect components to the platform the same way Microsoft does, and they support RPC (Remote Procedure Call) with the HTTP protocol. According to the developers, grommunio also includes numerous interfaces of common groupware such as IMAP, POP3, SMTP, EAS (Exchange ActiveSync), EWS (Exchange Web Services), CalDAV, and CardDAV. With such broad support, grommunio integrates smoothly into existing infrastructures.

Users will notice little difference among Outlook, Android, and iOS clients. Of course, as open source software, it supports other clients, too. Outlook and smartphones communicate with grommunio just as they do with a Microsoft Exchange server, thanks to their integrated, native Exchange protocols. An everyday enterprise user can continue to use their existing clients with the grommunio server quietly running in the background.

### More than just mail

In addition to mail functions, a calendaring system is available in the grommunio interface. Appointments can be created by clicking directly in the calendar display or in a new tab. It's intuitive and just what you'd expect from a modern tool. Users can create, manage, and share calendars as well as address books. Private contacts or common contacts are possible, and you can share everything with colleagues.

Task management shows a list of tasks on the left in a drop-down menu, and they can have both one owner and multiple collaborators. You can assign deadlines, categories, attachments, and other attributes to each task. In the same way, notes can be managed and shared with other team members.

### Chat, video conferences, and file sync

In addition to all the standard features of modern groupware, grommunio also offers chat, video conferencing, and file synchronization. It does this with full integration on a large scale for the enterprise, with extraordinarily high performance. It's an easy choice for promoters of open source and a powerful option for sysadmins. Because grommunio aims to integrate rather than reinvent, all components are standard open source tools.

![Screenshot of grommunio meeting space][3]

Jitsi integration for advanced video conferences (Markus Feilner, [CC BY-SA 4.0][4])

Behind the meeting function in grommunio is [Jitsi][5], smoothly integrated into the grommunio UI with a familiar user interface. The chat feature, fully integrated and centrally managed, is based on [Mattermost][6].

![Screenshot of grommunio's town square for chat][7]

Mattermost for chat (Markus Feilner, [CC BY-SA 4.0][4])

[ownCloud][8], which promises enterprise-level file sharing and synchronization, starts after a click on the Files button.

![Screenshot of grommunio file sharing space][9]

ownCloud for file synchronization and exchange (Markus Feilner, [CC BY-SA 4.0][4])

The grommunio project has a powerful administrative interface, including roles, domain and organization management, predictive monitoring, and a self-service portal. Shell-based wizards guide admins through installation and migration of data from Microsoft Exchange. The development team is constantly working for better integration and more centralization for management, and with that comes a better workflow for admins.

![Screenshot of grommunio dashboards][10]

grommunio's admin interface (Markus Feilner, [CC BY-SA 4.0][4])

### Explore grommunio

The grommunio project has lofty goals, but its developers have put in the work, and it shows. A German hosting service specializing in tax consultants—a sector where German data protection laws are especially tough—recently announced that grommunio is available to their customers. The grommunio project gets a lot right: a clean combination of existing, successful concepts working together to enable open, secure, and privacy-compliant communication.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/open-source-groupware-grommunio

作者：[Markus Feilner][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mfeilner
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://grommunio.com/en/
[3]: https://opensource.com/sites/default/files/uploads/jitsi_0.png (grommunio meeting space)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/article/20/5/open-source-video-conferencing
[6]: https://opensource.com/education/16/3/mattermost-open-source-chat
[7]: https://opensource.com/sites/default/files/uploads/mattermost.png (grommunio's town square for chat)
[8]: https://owncloud.com/
[9]: https://opensource.com/sites/default/files/uploads/owncloud_0.png (Owncloud for file synchronization and exchange)
[10]: https://opensource.com/sites/default/files/uploads/grommunio_interface_0.png (Screenshot of grommunio dashboards)
