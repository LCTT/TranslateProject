Great Open Source Collaborative Editing Tools
================================================================================
In a nutshell, collaborative writing is writing done by more than one person. There are benefits and risks of collaborative working. Some of the benefits include a more integrated / co-ordinated approach, better use of existing resources, and a stronger, united voice. For me, the greatest advantage is one of the most transparent. That's when I need to take colleagues' views. Sending files back and forth between colleagues is inefficient, causes unnecessary delays and leaves people (i.e. me) unhappy with the whole notion of collaboration. With good collaborative software, I can share notes, data and files, and use comments to share thoughts in real-time or asynchronously. Working together on documents, images, video, presentations, and tasks is made less of a chore.

There are many ways to collaborate online, and it has never been easier. This article highlights my favourite open source tools to collaborate on documents in real time.

Google Docs is an excellent productivity application with most of the features I need. It serves as a collaborative tool for editing documents in real time. Documents can be shared, opened, and edited by multiple users simultaneously and users can see character-by-character changes as other collaborators make edits. While Google Docs is free for individuals, it is not open source.

Here is my take on the finest open source collaborative editors which help you focus on writing without interruption, yet work mutually with others.

----------

### Hackpad ###

![Hackpad in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-Hackpad.png)

Hackpad is an open source web-based realtime wiki, based on the open source EtherPad collaborative document editor.

Hackpad allows users to share your docs realtime and it uses color coding to show which authors have contributed to which content. It also allows in line photos, checklists and can also be used for coding as it offers syntax highlighting.

While Dropbox acquired Hackpad in April 2014, it is only this month that the software has been released under an open source license. It has been worth the wait.

Features include:

- Very rich set of functions, similar to those offered by wikis
- Take collaborative notes, share data and files, and use comments to share your thoughts in real-time or asynchronously
- Granular privacy permissions enable you to invite a single friend, a dozen teammates, or thousands of Twitter followers
- Intelligent execution
- Directly embed videos from popular video sharing sites
- Tables
- Syntax highlighting for most common programming languages including C, C#, CSS, CoffeeScript, Java, and HTML

- Website: [hackpad.com][1]
- Source code: [github.com/dropbox/hackpad][2]
- Developer: [Contributors][3]
- License: Apache License, Version 2.0
- Version Number: -

----------

### Etherpad ###

![Etherpad in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-Etherpad.png)

Etherpad is an open source web-based collaborative real-time editor, allowing authors to simultaneously edit a text document leave comments, and interact with others using an integrated chat.

Etherpad is implemented in JavaScript, on top of the AppJet platform, with the real-time functionality achieved using Comet streaming.

Features include:

- Well designed spartan interface
- Simple text formatting features
- "Time slider" - explore the history of a pad
- Download documents in plain text, PDF, Microsoft Word, Open Document, and HTML
- Auto-saves the document at regular, short intervals
- Highly customizable
- Client side plugins extend the editor functionality
- Hundreds of plugins extend Etherpad including support for email notifications, pad management, authentication
- Accessibility enabled
- Interact with Pad contents in real time from within Node and from your CLI

- Website: [etherpad.org][4]
- Source code: [github.com/ether/etherpad-lite][5]
- Developer: David Greenspan, Aaron Iba, J.D. Zamfiresc, Daniel Clemens, David Cole
- License: Apache License Version 2.0
- Version Number: 1.5.7

----------

### Firepad ###

![Firepad in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-Firepad.png)

Firepad is an open source, collaborative text editor. It is designed to be embedded inside larger web applications with collaborative code editing added in only a few days.

Firepad is a full-featured text editor, with capabilities like conflict resolution, cursor synchronization, user attribution, and user presence detection. It uses Firebase as a backend, and doesn't need any server-side code. It can be added to any web app. Firepad can use either the CodeMirror editor or the Ace editor to render documents, and its operational transform code borrows from ot.js.

If you want to extend your web application capabilities by adding the simple document and code editor, Firepad is perfect.

Firepad is used by several editors, including the Atlassian Stash Realtime Editor, Nitrous.IO, LiveMinutes, and Koding.

Features include:

- True collaborative editing
- Intelligent OT-based merging and conflict resolution
- Support for both rich text and code editing
- Cursor position synchronization
- Undo / redo
- Text highlighting
- User attribution
- Presence detection
- Version checkpointing
- Images
- Extend Firepad through its API
- Supports all modern browsers: Chrome, Safari, Opera 11+, IE8+, Firefox 3.6+

- Website: [www.firepad.io][6]
- Source code: [github.com/firebase/firepad][7]
- Developer: Michael Lehenbauer and the team at Firebase
- License: MIT
- Version Number: 1.1.1

----------

### OwnCloud Documents ###

![ownCloud Documents in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-ownCloud.png)

ownCloud Documents is an ownCloud app to work with office documents alone and/or collaboratively. It allows up to 5 individuals to collaborate editing .odt and .doc files in a web browser.

ownCloud is a self-hosted file sync and share server. It provides access to your data through a web interface, sync clients or WebDAV while providing a platform to view, sync and share across devices easily.

Features include:

- Cooperative edit, with multiple users editing files simultaneously
- Document creation within ownCloud
- Document upload
- Share and edit files in the browser, and then share them inside ownCloud or through a public link
- ownCloud features like versioning, local syncing, encryption, undelete
- Seamless support for Microsoft Word documents by way of transparent conversion of file formats

- Website: [owncloud.org][8]
- Source code: [github.com/owncloud/documents][9]
- Developer: OwnCloud Inc.
- License: AGPLv3
- Version Number: 8.1.1

----------

### Gobby ###

![Gobby in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-Gobby.png)

Gobby is a collaborative editor supporting multiple documents in one session and a multi-user chat. All users could work on the file simultaneously without the need to lock it. The parts the various users write are highlighted in different colours and it supports syntax highlighting of various programming and markup languages.

Gobby allows multiple users to edit the same document together over the internet in real-time. It integrates well with the GNOME environment. It features a client-server architecture which supports multiple documents in one session, document synchronisation on request, password protection and an IRC-like chat for communication out of band. Users can choose a colour to highlight the text they have written in a document.

A dedicated server called infinoted is also provided.

Features include:

- Full-fledged text editing capabilities including syntax highlighting using GtkSourceView
- Real-time, lock-free collaborative text editing through encrypted connections (including PFS)
- Integrated group chat
- Local group undo: Undo does not affect changes of remote users
- Shows cursors and selections of remote users
- Highlights text written by different users with different colors
- Syntax highlighting for most programming languages, auto indentation, configurable tab width
- Zeroconf support
- Encrypted data transfer including perfect forward secrecy (PFS)
- Sessions can be password-protected
- Sophisticated access control with Access Control Lists (ACLs)
- Highly configurable dedicated server
- Automatic saving of documents
- Advanced search and replace options
- Internationalisation
- Full Unicode support

- Website: [gobby.github.io][10]
- Source code: [github.com/gobby][11]
- Developer: Armin Burgmeier, Philipp Kern and contributors
- License: GNU GPLv2+ and ISC
- Version Number: 0.5.0

----------

### OnlyOffice ###

![OnlyOffice in action](http://www.linuxlinks.com/portal/content/reviews/Editors/Screenshot-OnlyOffice.png)

ONLYOFFICE (formerly known as Teamlab Office) is a multifunctional cloud online office suite integrated with CRM system, document and project management toolset, Gantt chart and email aggregator.

It allows you to organize business tasks and milestones, store and share your corporate or personal documents, use social networking tools such as blogs and forums, as well as communicate with your team members via corporate IM.

Manage documents, projects, team and customer relations in one place. OnlyOffice combines text, spreadsheet and presentation editors that include features similar to Microsoft desktop editors (Word, Excel and PowerPoint), but then allow to co-edit, comment and chat in real time.

OnlyOffice is written in ASP.NET, based on HTML5 Canvas element, and translated to 21 languages.

Features include:

- As powerful as a desktop editor when working with large documents, paging and zooming
- Document sharing in view / edit modes
- Document embedding
- Spreadsheet and presentation editors
- Co-editing
- Commenting
- Integrated chat
- Mobile applications
- Gantt charts
- Time management
- Access right management
- Invoicing system
- Calendar
- Integration with file storage systems: Google Drive, Box, OneDrive, Dropbox, OwnCloud
- Integration with CRM, email aggregator and project management module
- Mail server
- Mail aggregator
- Edit documents, spreadsheets and presentations of the most popular formats: DOC, DOCX, ODT, RTF, TXT, XLS, XLSX, ODS, CSV, PPTX, PPT, ODP

- Website: [www.onlyoffice.com][12]
- Source code: [github.com/ONLYOFFICE/DocumentServer][13]
- Developer: Ascensio System SIA
- License: GNU GPL v3
- Version Number: 7.7

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20150823085112605/CollaborativeEditing.html

作者：Frazer Kline
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://hackpad.com/
[2]:https://github.com/dropbox/hackpad
[3]:https://github.com/dropbox/hackpad/blob/master/CONTRIBUTORS
[4]:http://etherpad.org/
[5]:https://github.com/ether/etherpad-lite
[6]:http://www.firepad.io/
[7]:https://github.com/firebase/firepad
[8]:https://owncloud.org/
[9]:http://github.com/owncloud/documents/
[10]:https://gobby.github.io/
[11]:https://github.com/gobby
[12]:https://www.onlyoffice.com/free-edition.aspx
[13]:https://github.com/ONLYOFFICE/DocumentServer
