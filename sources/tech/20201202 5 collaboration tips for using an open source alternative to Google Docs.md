[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 collaboration tips for using an open source alternative to Google Docs)
[#]: via: (https://opensource.com/article/20/12/onlyoffice-docs)
[#]: author: (Nadya Knyazeva https://opensource.com/users/hellonadya)

5 collaboration tips for using an open source alternative to Google Docs
======
Collaborative writing and editing is a breeze when you put these
ONLYOFFICE features to work.
![Filing cabinet for organization][1]

ONLYOFFICE Docs is a self-hosted open source alternative to Microsoft Office and Google Docs for collaborating on documents, spreadsheets, and presentations in real time.

The following are the five most important ways [ONLYOFFICE Docs][2] helps organize my collaborative work.

### 1\. Integrate with document storage

ONLYOFFICE Docs is highly flexible in how you can store documents. By default, you can use ONLYOFFICE Docs within an ONLYOFFICE Workspace. This provides a productivity solution for managing documents and projects. It's the clear way to use ONLYOFFICE Docs because it's included; when you install one, you get the other.

However, the full ONLYOFFICE suite can be integrated with ownCloud, Nextcloud, and other popular sync and share platforms. Helpful [connectors][3] are available in your sharing platform's official app store or on GitHub.

Finally, since ONLYOFFICE is open source, web app developers are free to integrate ONLYOFFICE Docs into their applications using the [ONLYOFFICE API][4].

### 2\. Manage document permissions

In ONLYOFFFICE Docs, you can differentiate what your teammates can do when they open shared documents. You can grant them permission to view, edit, or share files or perform specific actions—leave comments, suggest changes in review mode, fill in determined fields, etc. Differentiating document permissions can help structure and secure your collaboration.

![ONLYOFFICE sharing options][5]

(Nadya Knyazeva, [CC BY-SA 4.0][6])

The permissions you have available depend on your document management system. In ONLYOFFICE Workspace and ownCloud, you can share files with all the permissions listed above, plus you'll get an additional permission for spreadsheets (Custom Filter in ONLYOFFICE or Modify Filter in ownCloud). The filtering permission allows you to decide whether filters applied by one user should affect only that person or everyone. If you're integrating with Nextcloud or, for example, Seafile, you get fewer permission options.

If you are integrating the suite and want to add more permissions, your app must allow registering new sharing attributes (such as the ability to restrict downloading, printing, or copying document content to the clipboard), as described in [the API documentation][7].

### 3\. True collaboration

The collaborative work toolset is basically the same for all environments. You have comments to add notes, suggestions, or questions for people working on a document together. ONLYOFFICE has this, of course, but it strives to provide a few extra features whenever possible. For instance, in ONLYOFFICE Workspace, you can quickly add mentions by typing + or @ followed by a user's name to draw a specific person's attention to your comment.

![ONLYOFFICE comments][8]

(Nadya Knyazeva, [CC BY-SA 4.0][6])

There's also a chat feature to quickly discuss something with teammates without switching to a messaging app (be aware that the chat history clears when you close a document).

Track changes enables reviewing documents by suggesting changes. All the changes made in this mode are highlighted, and the owner and users with full editing access can accept or reject them or preview the document with all the changes accepted or rejected.

What's important about collaborative work in ONLYOFFICE Docs is that users working simultaneously on the same docs can set individual preferences (e.g., enable track changes or spell checking, display non-printing characters, zoom the doc in and out, and so on) without disturbing each other.

### 4\. Version control

Versioning is so important that entire industries have developed around the process. For developers, writing without Git-style revision control can be unsettling. For content creators, emailing revisions back and forth to one another gets messy and confusing.

ONLYOFFICE Docs allows viewing a document's version history in the editor. Changes and the author who made them are highlighted in different colors. This feature's availability is determined by the doc management system you use; version history is available for ONLYOFFICE Workspace, Nextcloud, and ownCloud integration.

![ONLYOFFICE version history in Nextcloud][9]

(Nadya Knyazeva, [CC BY-SA 4.0][6])

### 5\. Change real-time co-editing mode

There are two ways to co-edit a document in real-time in ONLYOFFICE Docs. They are called Fast and Strict modes, and they're available regardless of how you integrate ONLYOFFICE into your toolchain.

Fast mode allows you to see your co-authors' changes as they are typing. Your changes are also shown to others immediately.

In Strict mode, you lock the document you are working on, and no one can see what you are typing until you click Save. You can see what parts of the document are locked by co-authors, but you can not see what they are doing until they save.

When collaborating on a document in one of these modes, the Ctrl+Z (undo) command affects only your work, so your co-authors' actions are unaffected.

### Bonus: Security options

Depending on your environment, you'll find different options to protect collaboration on documents.

ONLYOFFICE Workspace offers the standard security toolset, with HTTPS, backups, two-factor authentication, secure sign-on, and an option to encrypt data at rest. One feature that, according to ONLYOFFICE, has no counterpart is called _Private Rooms_.

A Private Room is a folder that can be accessed only through the desktop app. Each office file created and stored there is encrypted using the AES-265 algorithm. Everything you type—every letter, every number, every symbol—is encrypted immediately, even if you're collaborating in real time.

![ONLYOFFICE Private Rooms][10]

(Nadya Knyazeva, [CC BY-SA 4.0][6])

ONLYOFFICE Docs also uses JSON Web Tokens (JWT) for security. The editors request an encrypted signature to check who can access the document and what they can do with it. Currently, JWT is implemented for ONLYOFFICE Workspace and for Nextcloud, ownCloud, Alfresco, Confluence, HumHub, and Nuxeo integrations, in addition to their built-in security tools.

In a Nextcloud integration, you can also insert watermarks to protect sensitive docs. Watermarks are enabled by an admin and cannot be removed from a document.

![ONLYOFFICE Watermark in Nextcloud][11]

(Nadya Knyazeva, [CC BY-SA 4.0][6])

### So many features

There are many more features in ONLYOFFICE that will fit into one article. If you're looking for an open source alternative to Microsoft or Google collaboration tools, ONLYOFFICE is the most powerful option I know of. Give it a try and let me know in the comments what you think of ONLYOFFICE Docs as a collaboration tool.

Take a look at five great open source alternatives to Google Docs.

Sandstorm's Jade Wang shares some of her favorite open source web apps that are self-hosted...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/onlyoffice-docs

作者：[Nadya Knyazeva][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hellonadya
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_organize_letter.png?itok=GTtiiabr (Filing cabinet for organization)
[2]: https://www.onlyoffice.com/office-suite.aspx
[3]: https://www.onlyoffice.com/all-connectors.aspx
[4]: https://api.onlyoffice.com/editors/basic
[5]: https://opensource.com/sites/default/files/uploads/1._sharing_window.png (ONLYOFFICE sharing options)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://api.onlyoffice.com/editors/config/document/permissions
[8]: https://opensource.com/sites/default/files/uploads/2._comments.png (ONLYOFFICE comments)
[9]: https://opensource.com/sites/default/files/uploads/3._version_history_in_nextcloud.png (ONLYOFFICE version history in Nextcloud)
[10]: https://opensource.com/sites/default/files/uploads/4_privateroom.png (ONLYOFFICE Private Rooms)
[11]: https://opensource.com/sites/default/files/uploads/5._watermark.png (ONLYOFFICE Watermark in Nextcloud)
