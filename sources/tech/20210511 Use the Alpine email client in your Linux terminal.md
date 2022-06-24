[#]: subject: "Use the Alpine email client in your Linux terminal"
[#]: via: "https://opensource.com/article/21/5/alpine-linux-email"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use the Alpine email client in your Linux terminal
======
Configure Alpine to handle your email the way you like it.

![Chat via email][1]

Email is an important communications medium and will remain so for the foreseeable future. I have used many different email clients over the last 30 years, and [Thunderbird][2] is what I have used the most in recent years. It is an excellent and functional desktop application that provides all the features that most people need—including me.

One of the things that makes a good system administrator is curiosity—and I have more than my share. Over the last few months, I have become dissatisfied with Thunderbird—not because of anything particularly wrong with it. Rather, after many years, I grew tired of it. I was curious about whether I could find an email client to provide a better (or at least different) experience than Thunderbird and be at least as efficient.

I decided it was time for a change—and not just to a different graphical user interface (GUI) mail client. None of the other GUI-based email clients available on Linux have ever really appealed to me. I finally realized that what I wanted was to go back to [Alpine][3], the descendant of Pine, the text user interface (TUI) email client I used for a time about 20 years ago.

This desire to go retro with my email client started back in 2017 when I wrote an [article about Alpine][4] for Opensource.com. I described how I used Alpine to circumvent problems sending emails from ISP networks when I was traveling away from my home email system.

I recently decided to exclusively use Alpine for email. The main attraction is the ease of use offered by keeping my hands on the keyboard (and reducing the number of times I need to reach for the mouse). It is also about scratching my sysadmin itch to do something different and use an excellent text mode interface in the process.

### Getting started

I already had Alpine set up from my previous use, so it was just a matter of starting to use it again.

Well, not really.

I previously set up Alpine on my mail server—I used secure shell (SSH) to log into the email server using my email account and then launched Alpine to access my email. I explained this in my previous article, but the bottom line is that I wanted to circumvent ISPs that block outbound port 25 for mail transfer in the name of spam reduction. A bit of bother, really.

But now I want to run Alpine on my workstation or laptop. It's relatively simple to configure Alpine on the same host as the email server. Using it on a remote computer requires a good bit more.

### Install Alpine

Installing Alpine on Fedora is simple because it is available from the Fedora repository. Just use DNF as root:

```
# dnf -y install alpine
```

This command installs Alpine and any prerequisite packages that are not already installed. Alpine's primary dependencies are Sendmail, Hunspell, OpenLDAP, OpenSSL, krb5-libs, ncurses, and a couple of others. In my case, Alpine was the only package installed.

### Launch Alpine

To launch Alpine, open a terminal session, type **alpine** on the command line, and press **Enter**.

The first time you start Alpine, it displays a message that it is creating the user directory structure on the localhost. It then displays a Welcome message, and if you press **Enter**, you are treated to a copy of Apache's license. That is good, and you should probably read the license at some point so that you know its terms. But the most important thing right now is to configure Alpine to get your email.

For now, just press lowercase **e** to exit from the greeting message. You should now see Alpine's Main menu (I deleted several blank lines of the output to save space):

```
+----------------------------------------------------+
| ALPINE 2.24 MAIN MENU Folder: INBOX No Messages    |
|                                                    |
| HELP - Get help using Alpine                       |
|                                                    |
| C COMPOSE MESSAGE - Compose and send a message     |
|                                                    |
| I MESSAGE INDEX - View messages in current folder  |
|                                                    |
| L FOLDER LIST - Select a folder to view            |
|                                                    |
| A ADDRESS BOOK - Update address book               |
|                                                    |
| S SETUP - Configure Alpine Options                 |
|                                                    |
| Q QUIT - Leave the Alpine program                  |
|                                                    |
|                                                    |
|                                                    |
|                                                    |
|                                                    |
| For Copyright information press "?"                |
|                                                    |
| ? Help P PrevCmd R RelNotes                        |
| O OTHER CMDS > [ListFldrs] N NextCmd K KBLock      |
+----------------------------------------------------+
```

*Figure 1: Alpine's Main menu*

Alpine creates the `~mail` directory localhost during initial use. When you configure the IMAP server, Alpine creates the default `~/mail`, `~/mail/sent-mail`, and `saved-messages` folders in your home directory on the IMAP server. You can change the defaults, but I recommend against it. When using IMAP, emails are not stored locally unless you copy them to local folders. All emails are stored in the Inbox on the SMTP server until they are saved to a folder on the IMAP server. The SMTP and IMAP servers might use the same or different hosts.

Alpine also assumes that the Inbox is located at `/var/spool/mail/user_name` on the email SMTP server. This article explains how to configure both IMAP and SMTP servers. The email administrator for your organization—that might be you—will add your account to the IMAP server and provide you with the initial password.

### The Alpine interface

The Alpine user interface (UI) is a text-mode, menu-driven UI, also known as a TUI. This type of interface is also sometimes called captive user interface (CUI), which does not provide a command-line interface that can be used in scripts, for example. You must exit from the program to perform other tasks.

By contrast, the [mailx][5] program is an email program that can be used with either a TUI, from the command line, or in scripts. For example, you can use the following command to send the results of the free command directly to the sysadmin's email account:

```
$ free | mailx -s "Free memory" sysadmin@example.com
```

But enough of that little side trip; there is work to do. Let's start with an explanation.

Notice in Figure 1 that all of the possible options in the Main menu in the center of the interface and the menu items along the bottom of the Alpine UI are shown as uppercase letters. But you can use either uppercase or lowercase when issuing commands; Alpine recognizes and responds to both. Uppercase is easier to see and recognize in the interface, but it's easier to use lowercase to enter commands and make menu selections. I will use uppercase letters in bold throughout this article to indicate menu selections (to mimic the Alpine UI).

On the Main menu, you can use the **Up** and **Down** arrow keys to highlight a different option and then press **Enter** to select it. The only way to access the menu items along the bottom of the Alpine screen (which I call the secondary menu, for lack of a better term) is by using the letter designated for each. There are two sets of secondary menu items. You can press **O** (the letter, not the number) to switch to the next set of commands, and press **O** again to toggle back to the original set. This keystroke only changes the secondary menu items.

Use the **Page Down** and **Page Up** keys to scroll through the commands if you can't see them all. The secondary menu at the bottom of the page usually lists all the commands available on the current menu; you will also see a message similar to this:

```
[START of Information About Setup Command]
```

Should you find yourself at a place you don't want to be, such as creating a new email, responding to one, or making changes to settings, and decide you don't want to do that, **Ctrl+C** allows you to cancel the current task. In most cases, you will be asked to confirm that you want to cancel by pressing the **C** key. Note that **^C** in the secondary menu represents **Ctrl+C**. Many commands use the **Ctrl** key, so you will see **^** quite frequently on some menus.

Finally, to quit Alpine, you can press **Q**; when it asks, "Really quit Alpine?" respond with **Y** to exit. Like many commands, **Q** is not available from all menus.

### Help

Help is available from all of the menus I have tried. You can access detailed help for each menu item by highlighting the item you need information for and pressing the **?** key to obtain context-sensitive help.

### Configuration

When I started using Alpine regularly, I made the minimum changes to the configuration needed to send and receive emails. As I gained more experience with Alpine, I changed other configuration items to make things work easier or more to my liking.

First, I will explain the basic configurations required to make Alpine work, then move on to ones that make it work better.

If you have been exploring a bit on your own—which is a good thing—return to the Main menu. To get to Alpine's Configuration menu from the Main menu, type **S** for Setup. You will see a menu like this:

```
ALPINE 2.24 SETUP Folder: INBOX No Messages 

This is the Setup screen for Alpine. Choose from the following commands: 

(E) Exit Setup: 
This puts you back at the Main Menu. 

(P) Printer: 
Allows you to set a default printer and to define custom 
print commands. 

(N) Newpassword: 
Change your password. 

(C) Config: 
Allows you to set or unset many features of Alpine. 
You may also set the values of many options with this command. 

(S) Signature: 
Enter or edit a custom signature which will 
be included with each new message you send. 
 
(A) AddressBooks: 
Define a non-default address book. 
 
(L) collectionLists: 
You may define groups of folders to help you better organize your mail. 
 
(R) Rules: 
This has up to six sub-categories: Roles, Index Colors, Filters, 
 [START of Information About Setup Command ] 
? Help E Exit Setup N Newpassword S Signature L collectionList D Directory  
O OTHER CMDS P Printer C Config A AddressBooks R Rules K Kolor
```

*Figure 2: Alpine Setup menu*

The Setup menu groups the very large number of setup items into related categories to, hopefully, make the ones you want easier to locate. Use **Page Down** and **Page Up** to scroll through the commands if you can't see them all.

I'll start with the settings necessary to get email—Alpine's entire purpose—up and running.

### Config

The Config section contains 15 pages (on my large screen) of option- and feature-configuration items. These settings can be used to set up your SMTP and IMAP connections to the email server and define the way many aspects of Alpine work. In these examples, I'll use the `example.com` domain name (which is the virtual network I use for testing and experimenting). Alpine's configuration is stored in the `~/.pinerc` file, created the first time you start Alpine.

The first page of the Setup Configuration menu contains most of the settings required to configure Alpine to send and receive email:

```
ALPINE 2.24 SETUP CONFIGURATION Folder: INBOX No Messages

Personal Name = <No Value Set: using "Test User"> 
User Domain = <No Value Set> 
SMTP Server (for sending) = <No Value Set> 
NNTP Server (for news) = <No Value Set> 
Inbox Path = <No Value Set: using "inbox"> 
Incoming Archive Folders = <No Value Set> 
Pruned Folders = <No Value Set> 
Default Fcc (File carbon copy) = <No Value Set: using "sent-mail"> 
Default Saved Message Folder = <No Value Set: using "saved-messages"> 
Postponed Folder = <No Value Set: using "postponed-msgs"> 
Read Message Folder = <No Value Set> 
Form Letter Folder = <No Value Set> 
Trash Folder = <No Value Set: using "Trash"> 
Literal Signature = <No Value Set> 
Signature File = <No Value Set: using ".signature"> 
Feature List =
Set Feature Name
--- ----------------------
[ Composer Preferences ]
[X] Allow Changing From (default)
[ ] Alternate Compose Menu 
[ ] Alternate Role (#) Menu 
[ ] Compose Cancel Confirm Uses Yes 
[ ] Compose Rejects Unqualified Addresses 
[ ] Compose Send Offers First Filter 
[ ] Ctrl-K Cuts From Cursor 
[ ] Delete Key Maps to Ctrl-D 
[ ] Do Not Save to Deadletter on Cancel 
[Already at start of screen]
? Help E Exit Setup P Prev - PrevPage A Add Value % Print 
O OTHER CMDS C [Change Val] N Next Spc NextPage D Delete Val W WhereIs
```

*Figure 3: First page of Alpine's Setup Configuration menu*

This is where you define the parameters required to communicate with the email server. To change a setting, use the **Arrow** keys to move the selection bar to the desired configuration item and press **Enter**. You can see in Figure 3 that none of the basic configuration items have any values set.

The **Personal Name** item uses the [Gecos field][6] of the Unix `/etc/passwd` entry for the logged-in user to obtain the default name. This is just a name Alpine uses for display and has no role in receiving or sending email. I usually call this the "pretty name." In this case, the default name is fine, so I will leave it as it is.

There are some configuration items that you must set. Start with the **User Domain**, which is the current computer's domain name. Mine is a virtual machine I use for testing and examples in my books. Use the command line to get the fully qualified domain name (FQDN) and the hostname. In Figure 4, you can see that the domain name is `example.com` :

```
$ hostnamectl
Static hostname: testvm1.example.com
Icon name: computer-vm
Chassis: vm
Machine ID: 616ed83d97594a53814c35bc6c078d43
Boot ID: fd721c46a9c44c9ab8ea392cef77b661
Virtualization: oracle
Operating System: Fedora 33 (Xfce)
CPE OS Name: cpe:/o:fedoraproject:fedora:33
Kernel: Linux 5.10.23-200.fc33.x86_64
Architecture: x86-64
```

*Figure 4: Obtaining the hostname and domain name*

Once you have the FQDN, select the **User Domain** entry and press **Enter** to see the entry field at the bottom of the Alpine screen (as shown in Figure 5). Type your domain name and press **Enter** (using *your* network's domain and server names):

```
ALPINE 2.24 SETUP CONFIGURATION Folder: INBOX No Messages

Personal Name = <No Value Set: using "Test User"> 
User Domain = <No Value Set> 
SMTP Server (for sending) = <No Value Set> 
NNTP Server (for news) = <No Value Set> 
Inbox Path = <No Value Set: using "inbox"> 
Incoming Archive Folders = <No Value Set> 
Pruned Folders = <No Value Set> 
Default Fcc (File carbon copy) = <No Value Set: using "sent-mail"> 
Default Saved Message Folder = <No Value Set: using "saved-messages"> 
Postponed Folder = <No Value Set: using "postponed-msgs"> 
Read Message Folder = <No Value Set> 
Form Letter Folder = <No Value Set> 
Trash Folder = <No Value Set: using "Trash"> 
Literal Signature = <No Value Set> 
Signature File = <No Value Set: using ".signature"> 
Feature List =
Set Feature Name
--- ----------------------
[ Composer Preferences ]
[X] Allow Changing From (default)
[ ] Alternate Compose Menu 
[ ] Alternate Role (#) Menu 
[ ] Compose Cancel Confirm Uses Yes 
[ ] Compose Rejects Unqualified Addresses 
[ ] Compose Send Offers First Filter 
[ ] Ctrl-K Cuts From Cursor 
[ ] Delete Key Maps to Ctrl-D 
[ ] Do Not Save to Deadletter on Cancel 
Enter the text to be added : example.com 
^G Help 
^C Cancel Ret Accept
```

*Figure 5: Type the domain name into the text entry field.*

#### Required config

These are the basic configuration items you need to send and receive email:

* Personal Name
  * Your name
  * This is the pretty name Alpine uses for the From and Return fields in emails.
* User Domain
  * example.com:25/user=SMTP_Authentication_UserName
  * This is the email domain for your email client. This might be different from the User Domain name. This line also contains the SMTP port number and the user name for SMTP authentication.
*   * SMTP server
SMTP
  * This is the name of the outbound SMTP email server. It combines with the User Domain name to create the FQDN for the email server.
* Inbox Path
  * {IMAP_server)}Inbox
  * This is the name of the IMAP server enclosed in curly braces ({}) and the name of the Inbox. Note that this directory location is different from the inbound IMAP email. The usual location for the inbox on the server is `/var/spool/mail/user_name`.
* Default Fcc (file carbon copy)
  * {IMAP_server)}mail/sent
  * This is the mailbox (folder) where sent mail is stored. The default mail directory on the server is usually `~/mail`, but `mail/` must be specified in this and the next two entries, or the folders will be placed in the home directory instead.
* Default Saved Message Folder
  * {IMAP_server)}mail/saved-messages
  * This is the default folder when saving a message to a folder if you don't use `^t` to specify a different one.
* Trash Folder
  * {IMAP_server)}mail/Trash
* Literal Signature
  * A signature string
  * I don't use this, but it's an easy place to specify a simple signature.
* Signature File
  * ~/MySignature.sig
  * This points to the file that contains your signature file.

#### Optional config

Here are the features I changed to make Alpine work more to my liking. They are not about getting Alpine to send and receive email, but about making Alpine work the way you want it to. Unless otherwise noted, I turned all of these features on. Features that are turned on by default have the string `(default)` next to them in the Alpine display. Because they are already turned on, I will not describe them.

* Alternate Role (#) Menu: This allows multiple identities using different email addresses on the same client and server. The server must be configured to allow multiple addresses to be delivered to your primary email account.
* Compose Rejects Unqualified Addresses: Alpine will not accept an address that is not fully qualified. That is, it must be in the form `<username@example.com>`.
* Enable Sigdashes: This enables Alpine to automatically add dashes (--) in the row just above the signature. This is a common way of delineating the start of the signature.
* Prevent User Lookup in Password File: This prevents the lookup of the full user name from the Gecos field of the passwd file.
* Spell Check Before Sending: Although you can invoke the spell checker at any time while composing an email, this forces a spell check when you use the `^X` keystroke to send an email.
* Include Header in Reply: This includes a message's headers when you reply.
* Include Text in Reply: This includes the text of the original message in your reply.
* Signature at Bottom: Many people prefer to have their signature at the very bottom of the email. This setting changes the default, which puts the signature at the end of the reply and before the message being replied to.
* Preserve Original Fields: This preserves the original addresses in the To: and CC: fields when you reply to a message. If this feature is disabled when you reply to a message, the original sender is added to the To: field, all other recipients are added to the CC: field, and your address is added to the From: field.
* Enable Background Sending: This speeds the Alpine user interface response when sending an email.
* Enable Verbose SMTP Posting: This produces more verbose information during SMTP conversations with the server. It is a problem-determination aid for the sysadmin.
* Warn if Blank Subject: This prevents sending emails with no subject.
* Combined Folder Display: This combines all folder collections into a single main display. Otherwise, collections will be in separate views.
* Combined Subdirectory Display: This combines all subdirectories' collections into a single main display. Otherwise, subdirectories will be in separate views. This is useful when searching for a subdirectory to attach or save files.
* Enable Incoming Folders Collection: This lists all incoming folders in the same collection as the Inbox. Incoming folders can be used with a tool like procmail to presort email into folders other than the Inbox and makes it easier to see the folders where new emails are sorted.
* Enable Incoming Folders Checking: This enables Alpine to check for new emails in the incoming folders collection.
* Incoming Checking Includes Total: This displays the number of old and new emails in the incoming folders.
* Expanded View of Folders: This displays all folders in each collection when you view the Folder List screen. Otherwise, only the collections are shown, and the folders are not shown until selected.
* Separate Folder and Directory Entries: If your mail directory has email folders and regular directories that use the same name, this causes Alpine to list them separately.
* Use Vertical Folder List: This sorts mail folders vertically first and then horizontally. The default is horizontal, then vertical.
* Convert Dates To Localtime: By default, all dates and times are displayed in their originating time zones. This converts the dates to display in local time.
* Show Sort in Titlebar: Alpine can sort emails in a mail folder using multiple criteria. This causes the sort criteria to be displayed in the title bar.
* Enable Message View Address Links: This highlights email addresses in the body of the email.
* Enable Message View Attachment Links: This highlights URL links in the body of the email.
* Prefer Plain Text: Many emails contain two versions, plain text and HTML. When this feature is turned on, Alpine always displays the plain text version. You can use the A key to toggle to the "preferred" version, usually the HTML one. I usually find the plain text easier to visualize the structure of and read the email. This can depend upon the sending client, so I use the A key when needed.
* Enable Print Via Y Command: This prints a message using the previous default, Y. Because Y is also used to confirm many commands, the keystroke can inadvertently cause you to print a message. The new default is % to prevent accidental printing. I like the ease of using Y, but it has caused some extra print jobs, so I am thinking about turning this feature off.
* Print Formfeed Between Messages: This prints each message on a new sheet of paper.
* Customized Headers: Customized headers enables overriding the default From: and Reply-To: headers. I set mine to:
-   From: "David Both" <[david@example.com](mailto:david@both.org)>
-   Reply-To: "David Both"
    <[david@example.com](mailto:david@both.org)>
* Sort key: By default, Alpine sorts messages in a folder by arrival time. I found this to be a bit confusing, so I changed it to Date, which can be significantly different from arrival time. Many spammers use dates and times in the past or future, so this setting can sort the future ones to the top of the list (or bottom, depending on your preferences for forward or reverse sorts).
* Image Viewer: This feature allows you to specify the image viewer to use when displaying graphics attached to or embedded in an email. This only works when using Alpine in a terminal window on the graphical desktop. It will not work in a text-only virtual console. I always set this to `=okular` because [Okular][7] is my preferred viewer.
* URL-Viewer: This tells Alpine what web browser you want to use. I set this for `= /bin/firefox` but you could use Chrome or another browser. Be sure to verify the location of the Firefox executable.

#### Printing

It is easy to set up Alpine for printing. Select the **Printer** menu from the **Setup** page. This allows you to set a default printer and define custom print commands. The default is probably `attached-to-ansi`. Move the cursor down to the **Standard UNIX print command** section and highlight the printer list.

```
Standard UNIX print command

Using this option may require setting your "PRINTER" or "LPDEST"

environment variable using the standard UNIX utilities.

Printer List: "" lpr
```

Then press the **Enter** key to set the standard Unix **lpr** command as the default.

### Final thoughts

This is not a step-by-step guide to Alpine configuration and use. Rather, I tried to cover the basics to get it up and running to send and receive email. I also shared some configuration changes that have made my Alpine experience much more usable. These are the configuration items that I've found most important to my experience; you may find that others are more important to you.

I have been using Alpine for several months now and am very happy with the experience. The text interface helps me concentrate on the message and not the distracting graphics and animations. I can view those if I choose, but 99% of the time, I choose not to.

Alpine is easy to use and has a huge number of features that can be configured to give the best email client experience possible.

Use the **Help** feature to get more information about the fields I explored above and those that I did not cover. You will undoubtedly find ways to configure Alpine that work better for you than the defaults or what I changed. I hope this will at least give you a start to set up Alpine the way you want.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/alpine-linux-email

作者：[David Both][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/email_chat_communication_message.png
[2]: https://www.thunderbird.net/en-US/
[3]: https://alpine.x10host.com/
[4]: https://opensource.com/article/17/10/alpine-email-client
[5]: https://linux.die.net/man/1/mailx
[6]: https://en.wikipedia.org/wiki/Gecos_field
[7]: https://okular.kde.org/
