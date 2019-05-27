[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting set up with Fedora Project services)
[#]: via: (https://fedoramagazine.org/getting-set-up-with-fedora-project-services/)
[#]: author: (Stephen Gallagher https://fedoramagazine.org/author/sgallagh/)

Getting set up with Fedora Project services
======

![][1]

In addition to providing an operating system, the Fedora Project provides numerous [services][2] for users and developers. Services such as [Ask Fedora][3], the [Fedora Project Wiki][4] and the [Fedora Project Mailing Lists][5] provide users with valuable resources for [learning][6] how to best take advantage of Fedora. For developers of Fedora, there are many other services such as [dist-git][7], [Pagure][8], [Bodhi][9], [COPR][10] and [Bugzilla][11] that are involved with the packaging and release process.

These services are available for use with a free account from the [Fedora Accounts System][12] (FAS). This account is the passport to all things Fedora! This article covers how to get set up with an account and configure [Fedora Workstation][13] for browser single sign-on.

### Signing up for a Fedora account

To create a FAS account, browse to the [account creation page][14]. Here, you will fill out your basic identity data:

![Account creation page][15]

Once you enter your data, an email will be sent to the email address provided, with a temporary password. Pick a strong password and use it.

![Password reset page][16]

Next, the account details page appears. If you intend to become a contributor to the Fedora Project, you should complete the [Contributor Agreement][17] now. Otherwise, you are done and your account can now be used to log into the various Fedora services.

![Account details page][18]

### Configuring Fedora Workstation for single sign-On

Now that you have your account, you can sign into any of the Fedora Project services. Most of these services support single sign-on (SSO), allowing you to sign in without re-entering your username and password.

Fedora Workstation provides an easy workflow to add SSO credentials. The GNOME Online Accounts tool helps you quickly set up your system to access many popular services. To access it, go to the _Settings_ menu.

![GNOME Online Accounts ][19]

Click on the ⋮ button and select _Enterprise Login (Kerberos)_ , which provides a single text prompt for a principal. Enter _[fasname@FEDORAPROJECT.ORG][20]_ (being sure to capitalize _FEDORAPROJECT.ORG_ ) and click _Connect_.

![Kerberos principal dialog ][21]

GNOME prompts you to enter your password for FAS and given the option to save it. If you choose to save it, it is stored in [GNOME Keyring][22] and unlocked automatically at login. If you choose not to save it, you will need to open GNOME Online Accounts and enter your password each time you want to enable single sign-on.

### Single sign-on with a web browser

Today, Fedora Workstation supports two web browsers “out of the box” with support for single sign-on with the Fedora Project services. These are [Mozilla Firefox][23] and [Google Chrome][24]. Due to a [bug][25] in Chromium, single sign-on does not currently work properly in many cases. As a result, this has not been enabled for Chromium in Fedora.

To sign on to a service, browse to it and select the “login” option for that service. For most Fedora services, this is the only thing you need to do and the browser handles the rest. Some services such as the [Fedora Mailing Lists][26] and [Bugzilla][11] support multiple login types. For them, you need to select the “Fedora” or “Fedora Account System” login type.

That’s it! You can now log into any of the Fedora Project services without re-entering your password.

##### Special consideration for Google Chrome

In order to enable single sign-on out of the box for Google Chrome, Fedora needed to take advantage of certain features in Chrome that are intended for use in “managed” environments. A managed environment is traditionally a corporate or other organization that sets certain security and/or monitoring requirements on the browser.

Recently, Google Chrome changed its behavior and it now reports _“Managed by your organization”_ under the ⋮ menu in Google Chrome. That [link][27] leads to a page that states “If your Chrome browser is managed, your administrator can set up or restrict certain features, install extensions, monitor activity, and control how you use Chrome.” **[Fedora will never monitor your browser activity or restrict your actions][28].**

Enter _chrome://policy_ in the address bar to see exactly what settings Fedora has enabled in the browser. The _AuthNegotiateDelegateWhitelist_ and _AuthServerWhitelist_ options will be set to _*.fedoraproject.or_ g. These are the only changes Fedora makes.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-set-up-with-fedora-project-services/

作者：[Stephen Gallagher][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sgallagh/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/05/sso-fedora-web-services-816x345.jpg
[2]: https://apps.fedoraproject.org/
[3]: https://ask.fedoraproject.org/
[4]: https://fedoraproject.org/wiki/Fedora_Project_Wiki
[5]: https://lists.fedoraproject.org/archives/
[6]: https://fedoramagazine.org/check-out-the-new-askfedora/
[7]: http://src.fedoraproject.org/
[8]: https://pagure.io
[9]: https://bodhi.fedoraproject.org
[10]: https://copr.fedorainfracloud.org/
[11]: https://bugzilla.redhat.com
[12]: https://admin.fedoraproject.org/accounts
[13]: https://getfedora.org/
[14]: https://admin.fedoraproject.org/accounts/user/new
[15]: https://fedoramagazine.org/wp-content/uploads/2019/05/FAS-new.png
[16]: https://fedoramagazine.org/wp-content/uploads/2019/05/changepass-1024x318.png
[17]: https://admin.fedoraproject.org/accounts/fpca/
[18]: https://fedoramagazine.org/wp-content/uploads/2019/05/account-blurred.png
[19]: https://fedoramagazine.org/wp-content/uploads/2019/05/goa-1024x796.png
[20]: mailto:fasname@FEDORAPROJECT.ORG
[21]: https://fedoramagazine.org/wp-content/uploads/2019/05/krb5-principal.png
[22]: https://wiki.gnome.org/Projects/GnomeKeyring
[23]: https://www.mozilla.org/en-US/firefox
[24]: https://www.google.com/chrome/
[25]: https://bugzilla.redhat.com/show_bug.cgi?id=1640158
[26]: https://lists.fedoraproject.org
[27]: https://support.google.com/chrome/answer/9281740
[28]: https://fedoraproject.org/wiki/Legal:PrivacyPolicy
