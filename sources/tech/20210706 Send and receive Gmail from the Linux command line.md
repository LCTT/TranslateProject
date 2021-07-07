[#]: subject: (Send and receive Gmail from the Linux command line)
[#]: via: (https://opensource.com/article/21/7/gmail-linux-terminal)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Send and receive Gmail from the Linux command line
======
Use Mutt to send and receive email from your terminal, even if you're
using hosted service such as Gmail.
![woman on laptop sitting at the window][1]

I'm a [Mutt][2] user. I like viewing and composing emails in the convenience of my Linux terminal. With a lightweight and minimal client like Mutt, I know that I can have my email available regardless of system specifications or internet access. And because I have a Linux terminal open more often than not, my email client essentially has no footprint on my desktop real estate. It's hidden away in a [terminal tab or multiplexer pane][3], so I can ignore it when I don't need it but get to it quickly when I do need it.

A commonly perceived problem with Mutt is that most of us use hosted email accounts these days and interact with actual email protocols only superficially. Mutt (and ELM before it) was created back in simpler times, when checking email was a call to `uucp` and a glance at `/var/mail`. However, it's adapted nicely to developing technology and works well with all sorts of modern protocols like POP, IMAP, and even LDAP, so you can use Mutt even if you're using Gmail as your email host.

Because it's relatively rare to run your own email server today, and because Gmail is very common, this tutorial assumes you're using Mutt with Gmail. If you're concerned about email privacy, consider opening an account with [ProtonMail][4] or [Tutanota][5], both of which provide fully encrypted email. Tutanota has many [open source components][6], and ProtonMail provides an [IMAP bridge][7] for paid users so that you don't have to work around accessing your email outside a browser. However, many companies, schools, and organizations don't run their own email services and just use Gmail, so you may have a Gmail account whether you want one or not.

If you are [running your own email server][8], setting up Mutt is even easier than what I demonstrate in this article, so just dive right in.

### Install Mutt

On Linux, you can install Mutt from your distribution's software repository and then create a `.mutt` directory to hold its configuration files:


```
$ sudo dnf install mutt
$ mkdir ~/.mutt
```

On macOS, use [MacPorts][9] or [Homebrew][10]. On Windows, use [Chocolatey][11].

Mutt is a mail user agent (MUA), meaning its job is to read, compose, and send email to an outbound mail spool. It's the job of some other application or service to actually transfer a message to or from a mail server (although there's a lot of integration with Mutt so that it seems like it's doing all the work even when it's not.) Understanding this separation of tasks can help configuration make a little more sense.

It also explains why you must have helper applications (in addition to Mutt) depending on what service you need to communicate with. For this article, I use IMAP so that my local copy of email and my email provider's remote copy of mail remain synchronized. Should you decide to use POP instead, that configuration is even easier to configure and can be done without any external tools. IMAP integration, however, requires OfflineIMAP, a Python application available from [its GitHub repository][12].

Eventually, you'll be able to install it with the `python3 -m pip` command, but as of this writing, you must install OfflineIMAP manually because it's still being ported from Python 2 to Python 3.

OfflineIMAP requires `imaplib2`, which is also in heavy development, so I prefer doing a manual install of that, as well. The process is the same: clone the source code repository with Git, change into the directory, and install with `pip`.

First, install the `rfc6555` dependency:


```
`$ python3 -m pip install --user rfc6555`
```

Next, install `imaplib2` from source:


```
$ git clone [git@github.com][13]:jazzband/imaplib2.git
$ pushd imaplib2.git
$ python3 -m pip install --upgrade --user .
$ popd
```

Finally, install OfflineIMAP from source:


```
$ git clone [git@github.com][13]:OfflineIMAP/offlineimap3.git
$ pushd offlineimap3.git
$ python3 -m pip install --upgrade --user .
$ popd
```

If you're using Cygwin on Windows, then you must also install [Portalocker][14].

### Configure OfflineIMAP

OfflineIMAP reads the configuration file `~/.offlineimaprc` by default. A template for this file, named `offlineimap.conf`, is included in the Git repository you cloned to install OfflineIMAP. Move the example file to your home directory:


```
`$ mv offlineimap3.git/offlineimap.conf ~/.offlineimaprc`
```

Open the file in your favorite text editor and read through it. It's a well-commented file, and it's good to get familiar with the options available.

Here's my `.offlineimaprc` as an example, with comments removed for brevity. Some values may be slightly different for you, but this gives you a reasonable idea of what your end product ought to look like:


```
[general]
ui = ttyui
accounts = %your-gmail-username%
pythonfile = ~/.mutt/password_prompt.py
fsync = False

[Account %your-gmail-username%]
localrepository = %your-gmail-username%-Local
remoterepository = %your-gmail-username%-Remote
status_backend = sqlite
postsynchook = notmuch new

[Repository %your-gmail-username%-Local]
type = Maildir
localfolders = ~/.mail/%your-gmail-username%-gmail.com
nametrans = lambda folder: {'drafts':  '[Gmail]/Drafts',
                            'sent':    '[Gmail]/Sent Mail',
                            'flagged': '[Gmail]/Starred',
                            'trash':   '[Gmail]/Trash',
                            'archive': '[Gmail]/All Mail',
                            }.get(folder, folder)

[Repository %your-gmail-username%-Remote]
maxconnections = 1
type = Gmail
remoteuser = %your-gmail-username%@gmail.com
remotepasseval = '%your-gmail-API-password%'
## remotepasseval = get_api_pass()
sslcacertfile = /etc/ssl/certs/ca-bundle.crt
realdelete = no
nametrans = lambda folder: {'[Gmail]/Drafts':    'drafts',
                            '[Gmail]/Sent Mail': 'sent',
                            '[Gmail]/Starred':   'flagged',
                            '[Gmail]/Trash':     'trash',
                            '[Gmail]/All Mail':  'archive',
                            }.get(folder, folder)
folderfilter = lambda folder: folder not in ['[Gmail]/Trash',
                                             '[Gmail]/Important',
                                             '[Gmail]/Spam',
                                             ]
```

There are two replaceable values in this file: `%your-gmail-username%` and `%your-gmail-API-password%`. Replace the first with your Gmail user name. That's the part of your email address on the left of the `@gmail.com` part. You must acquire the second value from Google through a two-factor authentication (2FA) setup process (even though you don't need to use 2FA to check email).

### Set up 2FA for Gmail

Google expects its users to use the Gmail website for email, so when you attempt to access your email outside of Gmail's interface, you're essentially doing so as a developer (even if you don't consider yourself a developer). In other words, you're creating what Google considers an "app." To obtain a developer-level _app password_, you must set up 2FA; through that process, you get an app password, which Mutt can use to log in outside the usual browser interface.

For safety, you can also add a recovery email address. To do that, go to Google's [Account Security page][15] and scroll down to **Recovery email**.

To set up 2FA, go back to the Account Security page, and click on **2-step Verification** to activate and configure it. This requires a mobile phone for setup.

After activating 2FA, you get a new Google Account Security option: **App passwords**. Click on it to create a new app password for Mutt. Google generates the password for you, so copy it and paste it into your `.offlineimaprc` file in the place of the `%your-gmail-API-password%` value.

Placing your API password in your `.offlineimaprc` file stores it in plain text, which can be dangerous. For a long while, I did this and felt fine about it because my home directory is encrypted. However, in the interest of better security, I now encrypt my API password with GnuPG. That's somewhat beyond the scope of this article, but I've written an article demonstrating how to [set up GPG password integration][16].

### Enable IMAP in Gmail

There's one last thing before you can say goodbye to the Gmail web interface forever: You must enable IMAP access to your Gmail account.

To do this, go to the Gmail web interface, click the "cog" icon in the upper-right corner, and select **See all settings**. In Gmail **Settings**, click the **POP/IMAP** tab, and enable the radio button next to **Enable IMAP**. Save your settings.

Now Gmail is configured to give you access to your email outside a web browser.

### Configure Mutt

Now that you're all set up for Mutt, you'll be happy to learn that configuring Mutt is the easy part. As with [.bashrc][17], [.zshrc][18], and .emacs files, there are many examples of very good .muttrc files available on the internet. For my configuration file, I borrowed options and ideas from [Kyle Rankin][19], [Paul Frields][20], and many others, so I've abbreviated my .muttrc file to just the essentials in the interest of simplicity:


```
set ssl_starttls=yes
set ssl_force_tls=yes

set from='[tux@example.com][21]'
set realname='Tux Example'

set folder = imaps://imap.gmail.com/
set spoolfile = imaps://imap.gmail.com/INBOX
set postponed="imaps://imap.gmail.com/[Gmail]/Drafts"
set smtp_url="smtp://smtp.gmail.com:25"
set move = no
set imap_keepalive = 900
set record="imaps://imap.gmail.com/[Gmail]/Sent Mail"

# Paths
set folder           = ~/.mail
set alias_file       = ~/.mutt/alias
set header_cache     = "~/.mutt/cache/headers"
set message_cachedir = "~/.mutt/cache/bodies"
set certificate_file = ~/.mutt/certificates
set mailcap_path     = ~/.mutt/mailcap
set tmpdir           = ~/.mutt/temp
set signature        = ~/.mutt/sig
set sig_on_top       = yes

# Basic Options
set wait_key = no
set mbox_type = Maildir
unset move               # gmail does that

# Sidebar Patch
set sidebar_visible = yes
set sidebar_width   = 16
color sidebar_new color221 color233

## Account Settings
# Default inbox
set spoolfile = "+example.com/INBOX"

# Mailboxes to show in the sidebar.
mailboxes +INBOX \
          +sent \
          +drafts

# Other special folder
set postponed = "+example.com/drafts"

# navigation
macro index gi "&lt;change-folder&gt;=example.com/INBOX&lt;enter&gt;" "Go to inbox"
macro index gt "&lt;change-folder&gt;=example.com/sent" "View sent"
```

Nothing in this file requires changing, but consider replacing the fake name `Tux Example` and the fake address `example.com` with something that applies to you. Copy and paste this text into a file and save it as `~/.mutt/muttrc`.

### Launch Mutt

Before launching Mutt, run `offlineimap` from a terminal to sync your computer with the remote server. The first run of this takes _a long time_, so leave it running overnight.

Once your account has synchronized, you can launch Mutt:


```
`$ mutt`
```

Mutt prompts you for permission to create the directories it needs to organize your email activity and then displays a view of your inbox.

![Mutt email client][22]

### Learn Mutt

Learning Mutt is a mixture of exploring the application and finding your favorite hacks for your .muttrc config. For example, my config file integrates Emacs for composing messages, LDAP so that I can search through contacts, GnuPG so that I can encrypt and decrypt messages, link harvesting, HTML views, and much more. You can make Mutt anything you want it to be (as long as you want it to be an email client), and the more you experiment, the more you discover.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/gmail-linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: http://www.mutt.org/
[3]: https://opensource.com/article/21/5/linux-terminal-multiplexer
[4]: https://protonmail.com
[5]: https://tutanota.com
[6]: https://github.com/tutao/tutanota
[7]: https://protonmail.com/bridge/
[8]: https://www.redhat.com/sysadmin/configuring-email-server
[9]: https://opensource.com/article/20/11/macports
[10]: https://opensource.com/article/20/6/homebrew-mac
[11]: https://opensource.com/article/20/3/chocolatey
[12]: https://github.com/OfflineIMAP/offlineimap3
[13]: mailto:git@github.com
[14]: https://pypi.org/project/portalocker
[15]: https://myaccount.google.com/security
[16]: https://opensource.com/article/21/6/enter-invisible-passwords-using-python-module
[17]: https://opensource.com/article/18/9/handy-bash-aliases
[18]: https://opensource.com/article/19/9/adding-plugins-zsh
[19]: https://twitter.com/kylerankin
[20]: https://twitter.com/stickster
[21]: mailto:tux@example.com
[22]: https://opensource.com/sites/default/files/mutt.png (Mutt email client)
