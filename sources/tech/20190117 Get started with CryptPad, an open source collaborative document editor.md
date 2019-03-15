[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with CryptPad, an open source collaborative document editor)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-cryptpad)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

Get started with CryptPad, an open source collaborative document editor
======
Securely share your notes, documents, kanban boards, and more with CryptPad, the fifth in our series on open source tools that will make you more productive in 2019.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the fifth of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### CryptPad

We already talked about [Joplin][1], which is good for keeping your own notes but—as you may have noticed—doesn't have any sharing or collaboration features.

[CryptPad][2] is a secure, shareable note-taking app and document editor that allows for secure, collaborative editing. Unlike Joplin, it is a NodeJS app, which means you can run it on your desktop or a server elsewhere and access it with any modern web browser. Out of the box, it supports rich text, Markdown, polls, whiteboards, kanban, and presentations.

![](https://opensource.com/sites/default/files/uploads/cryptpad-1.png)

The different document types are robust and fully featured. The rich text editor covers all the bases you'd expect from a good editor and allows you to export files to HTML. The Markdown editor is on par with Joplin, and the kanban board, though not as full-featured as [Wekan][3], is really well done. The rest of the supported document types and editors are also very polished and have the features you'd expect from similar apps, although polls feel a little clunky.

![](https://opensource.com/sites/default/files/uploads/cryptpad-2.png)

CryptPad's real power, though, comes in its sharing and collaboration features. Sharing a document is as simple as getting the sharable URL from the "share" option, and CryptPad supports embedding documents in iFrame tags on other websites. Documents can be shared in Edit or View mode with a password and with links that expire. The built-in chat allows editors to talk to each other (note that people with View access can also see the chat but can't comment).

![](https://opensource.com/sites/default/files/pictures/cryptpad-3.png)

All files are stored encrypted with the user's password. Server administrators can't read the documents, which also means if you forget or lose your password, the files are unrecoverable. So make sure you keep the password in a secure place, like a [password vault][4].

![](https://opensource.com/sites/default/files/uploads/cryptpad-4.png)

When it's run locally, CryptPad is a robust app for creating and editing documents. When run on a server, it becomes an excellent collaboration platform for multi-user document creation and editing. Installation took less than five minutes on my laptop, and it just worked out of the box. The developers also include instructions for running CryptPad in Docker, and there is a community-maintained Ansible role for ease of deployment. CryptPad does not support any third-party authentication methods, so users must create their own accounts. CryptPad also has a community-supported hosted version if you don't want to run your own server.


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-cryptpad

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/19/1/productivity-tool-joplin
[2]: https://cryptpad.fr/index.html
[3]: https://opensource.com/article/19/1/productivity-tool-wekan
[4]: https://opensource.com/article/18/4/3-password-managers-linux-command-line
