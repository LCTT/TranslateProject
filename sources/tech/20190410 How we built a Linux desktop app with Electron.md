[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How we built a Linux desktop app with Electron)
[#]: via: (https://opensource.com/article/19/4/linux-desktop-electron)
[#]: author: (Nils Ganther https://opensource.com/users/nils-ganther)

How we built a Linux desktop app with Electron
======
A story of building an open source email service that runs natively on
Linux desktops, thanks to the Electron framework.
![document sending][1]

[Tutanota][2] is a secure, open source email service that's been available as an app for the browser, iOS, and Android. The client code is published under GPLv3 and the Android app is available on [F-Droid][3] to enable everyone to use a completely Google-free version.

Because Tutanota focuses on open source and develops on Linux clients, we wanted to release a desktop app for Linux and other platforms. Being a small team, we quickly ruled out building native apps for Linux, Windows, and MacOS and decided to adapt our app using [Electron][4].

Electron is the go-to choice for anyone who wants to ship visually consistent, cross-platform applications, fast—especially if there's already a web app that needs to be freed from the shackles of the browser API. Tutanota is exactly such a case.

Tutanota is based on [SystemJS][5] and [Mithril][6] and aims to offer simple, secure email communications for everybody. As such, it has to provide a lot of the standard features users expect from any email client.

Some of these features, like basic push notifications, search for text and contacts, and support for two-factor authentication are easy to offer in the browser thanks to modern APIs and standards. Other features (such as automatic backups or IMAP support without involving our servers) need less-restricted access to system resources, which is exactly what the Electron framework provides.

While some criticize Electron as "just a basic wrapper," it has obvious benefits:

  * Electron enables you to adapt a web app quickly for Linux, Windows, and MacOS desktops. In fact, most Linux desktop apps are built with Electron.
  * Electron enables you to easily bring the desktop client to feature parity with the web app.
  * Once you've published the desktop app, you can use free development capacity to add desktop-specific features that enhance usability and security.
  * And last but certainly not least, it's a great way to make the app feel native and integrated into the user's system while maintaining its identity.



### Meeting users' needs

At Tutanota, we do not rely on big investor money, rather we are a community-driven project. We grow our team organically based on the increasing number of users upgrading to our freemium service's paid plans. Listening to what users want is not only important to us, it is essential to our success.

Offering a desktop client was users' [most-wanted feature][7] in Tutanota, and we are proud that we can now offer free beta desktop clients to all of our users. (We also implemented another highly requested feature—[search on encrypted data][8]—but that's a topic for another time.)

We liked the idea of providing users with signed versions of Tutanota and enabling functions that are impossible in the browser, such as push notifications via a background process. Now we plan to add more desktop-specific features, such as IMAP support without depending on our servers to act as a proxy, automatic backups, and offline availability.

We chose Electron because its combination of Chromium and Node.js promised to be the best fit for our small development team, as it required only minimal changes to our web app. It was particularly helpful to use the browser APIs for everything as we got started, slowly replacing those components with more native versions as we progressed. This approach was especially handy with attachment downloads and notifications.

### Tuning security

We were aware that some people cite security problems with Electron, but we found Electron's options for fine-tuning access in the web app quite satisfactory. You can use resources like the Electron's [security documentation][9] and Luca Carettoni's [Electron Security Checklist][10] to help prevent catastrophic mishaps with untrusted content in your web app.

### Achieving feature parity

The Tutanota web client was built from the start with a solid protocol for interprocess communication. We utilize web workers to keep user interface (UI) rendering responsive while encrypting and requesting data. This came in handy when we started implementing our mobile apps, which use the same protocol to communicate between the native part and the web view.

That's why when we started building the desktop clients, a lot of bindings for things like native push notifications, opening mailboxes, and working with the filesystem were already there, so only the native (node) side had to be implemented.

Another convenience was our build process using the [Babel transpiler][11], which allows us to write the entire codebase in modern ES6 JavaScript and mix-and-match utility modules between the different environments. This enabled us to speedily adapt the code for the Electron-based desktop apps. However, we encountered some challenges.

### Overcoming challenges

While Electron allows us to integrate with the different platforms' desktop environments pretty easily, you can't underestimate the time investment to get things just right! In the end, it was these little things that took up much more time than we expected but were also crucial to finish the desktop client project.

The places where platform-specific code was necessary caused most of the friction:

  * Window management and the tray, for example, are still handled in subtly different ways on the three platforms.
  * Registering Tutanota as the default mail program and setting up autostart required diving into the Windows Registry while making sure to prompt the user for admin access in a [UAC][12]-compatible way.
  * We needed to use Electron's API for shortcuts and menus to offer even standard features like copy, paste, undo, and redo.



This process was complicated a bit by users' expectations of certain, sometimes not directly compatible behavior of the apps on different platforms. Making the three versions feel native required some iteration and even some modest additions to the web app to offer a text search similar to the one in the browser.

### Wrapping up

Our experience with Electron was largely positive, and we completed the project in less than four months. Despite some rather time-consuming features, we were surprised about the ease with which we could ship a beta version of the [Tutanota desktop client for Linux][13]. If you're interested, you can dive into the source code on [GitHub][14].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/linux-desktop-electron

作者：[Nils Ganther][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nils-ganther
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ (document sending)
[2]: https://tutanota.com/
[3]: https://f-droid.org/en/packages/de.tutao.tutanota/
[4]: https://electronjs.org/
[5]: https://github.com/systemjs/systemjs
[6]: https://mithril.js.org/
[7]: https://tutanota.uservoice.com/forums/237921-general/filters/top?status_id=1177482
[8]: https://tutanota.com/blog/posts/first-search-encrypted-data/
[9]: https://electronjs.org/docs/tutorial/security
[10]: https://www.blackhat.com/docs/us-17/thursday/us-17-Carettoni-Electronegativity-A-Study-Of-Electron-Security-wp.pdf
[11]: https://babeljs.io/
[12]: https://en.wikipedia.org/wiki/User_Account_Control
[13]: https://tutanota.com/blog/posts/desktop-clients/
[14]: https://www.github.com/tutao/tutanota
