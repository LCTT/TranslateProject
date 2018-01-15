My personal Email setup - Notmuch, mbsync, postfix and dovecot
======
I've been using personal email setup for quite long and have not documented it anywhere. Recently when I changed my laptop (a post is pending about it) I got lost trying to recreate my local mail setup. So this post is a self documentation so that I don't have to struggle again to get it right.

### Server Side

I run my own mail server and I use postfix as SMTP server and Dovecot for the IMAP purpose. I'm not going into detail of setting those up as my setup was mostly done by using scripts created by Jonas for Redpill infrastructure. What redpill is?. (In jonas's own words)

> <jonas> Redpill is a concept - a way to setup Debian hosts to collaborate across organisations <jonas> I develop the concept, and use it for the first ever Redpill network-of-networks redpill.dk, involving my own network (jones.dk), my main client's network (homebase.dk), a network in Germany including Skolelinux Germany (free-owl.de), and Vasudev's network (copyninja.info)

Along with that I have a dovecot sieve filtering to classify on high level mails into various folders depending on from where they originate. All the rules live in the ~/dovecot.sieve file under every account which has a mail address.

Again I'm not going into detail of how to set these things up, as its not goal of my this post.

### On my Laptop

On my laptop I've following 4 parts setup

  1. Mail syncing : Done using mbsync command
  2. Classification: Done using notmuch
  3. Reading: Done using notmuch-emacs
  4. Mail sending: Done using postfix running as relay server and SMTP client.



### Mail Syncing

Mail syncing is done using mbsync tool, I was previously user of offlineimap and recently switched to mbsync as I felt it more lighter and simpler to configure than offlineimap. mbsync command is provided by package isync.

Configuration file is ~/.mbsyncrc. Below is my sample content with some private things redacted.

```
IMAPAccount  copyninja
Host imap.copyninja.info
User vasudev
PassCmd      "gpg -q --for-your-eyes-only --no-tty --exit-on-status-write-error --batch --passphrase-file ~/path/to/passphrase.txt -d ~/path/to/mailpass.gpg"
SSLType IMAPS
SSLVersion TLSv1.2
CertificateFile /etc/ssl/certs/ca-certificates.crt


IMAPAccount gmail-kamathvasudev
Host imap.gmail.com
User kamathvasudev@gmail.com
PassCmd "gpg -q --for-your-eyes-only --no-tty --exit-on-status-write-error --batch --passphrase-file ~/path/to/passphrase.txt -d ~/path/to/mailpass.gpg"
SSLType IMAPS
SSLVersion TLSv1.2
CertificateFile /etc/ssl/certs/ca-certificates.crt

IMAPStore copyninja-remote
Account copyninja

IMAPStore gmail-kamathvasudev-remote
Account gmail-kamathvasudev

MaildirStore copyninja-local
Path ~/Mail/vasudev-copyninja.info/
Inbox ~/Mail/vasudev-copyninja.info/INBOX

MaildirStore gmail-kamathvasudev-local
Path ~/Mail/Gmail-1/
Inbox ~/Mail/Gmail-1/INBOX

Channel copyninja
Master :copyninja-remote:
Slave :copyninja-local:
Patterns *
Create Both
SyncState *
Sync All

Channel gmail-kamathvasudev
Master :gmail-kamathvasudev-remote:
Slave :gmail-kamathvasudev-local:
# Exclude everything under the internal [Gmail] folder, except the interesting folders
Patterns * ![Gmail]*
Create Both
SyncState *
Sync All
```

Explanation for some interesting part in above configuration. One is the PassCmd which allows you to provide shell command to obtain the password for the account. This avoids filling in the password in configuration file. I'm using symmetric encryption with gpg and storing password some where on my disk. Which is of course just safe guarded by Unix ACL.

I actually wanted to use my public key to encrypt the file but unlocking the file when script is run in background or via systemd looks difficult (or looked nearly impossible). If you have better suggestion I'm all ears :-).

Next instruction part is Patterns. This allows you to selectively sync mail from your mail server. This was really helpful for me to exclude all crappy [Gmail]/ folders.

### Mail Classification

Once mail is locally on your device, we need a way to read the mails easily in a mail reader. My original setup was serving synced Maildir using local dovecot instance and read it in Gnus. This setup was bit of a over kill with all server software setups but inability of Gnus to not cope well with Maildir format this was best way to do it. This setup also has a disadvantage, that is searching a mail quickly when you have huge pile of mail to go through. This is where notmuch comes into picture.

notmuch allows me to easily index through Gigabytes of my mail archives and get what I need very easily. I've created a small script which combines executing of mbsync and notmuch execution. I tag mails based on the Maildirs which are actually created on server side using dovecot sieve. Below is my full shell script which is doing task of syncing classification and deleting of spams.

```
#!/bin/sh

MBSYNC=$(pgrep mbsync)
NOTMUCH=$(pgrep notmuch)

if [ -n "$MBSYNC" -o -n "$NOTMUCH" ]; then
   echo "Already running one instance of mail-sync. Exiting..."
         exit 0
fi

echo "Deleting messages tagged as *deleted*"
notmuch search --format=text0 --output=files tag:deleted |xargs -0 --no-run-if-empty rm -v

echo "Moving spam to Spam folder"
notmuch search --format=text0 --output=files tag:Spam and \
  to:vasudev@copyninja.info | \
    xargs -0 -I {} --no-run-if-empty mv -v {} ~/Mail/vasudev-copyninja.info/Spam/cur
notmuch search --format=text0 --output=files tag:Spam and
  to:vasudev-debian@copyninja.info | \
     xargs -0 -I {} --no-run-if-empty mv -v {} ~/Mail/vasudev-copyninja.info/Spam/cur


MDIR="vasudev-copyninja.info vasudev-debian Gmail-1"
mbsync -Va
notmuch new

for mdir in $MDIR; do
    echo "Processing $mdir"
    for fdir in $(ls -d /home/vasudev/Mail/$mdir/*); do
      if [ $(basename $fdir) != "INBOX" ]; then
          echo "Tagging for $(basename $fdir)"
          notmuch tag +$(basename $fdir) -inbox -- folder:$mdir/$(basename $fdir)
      fi
    done
done
```

So before running mbsync I search for all mails tagged as deleted and delete them from system. Next I look for mails tagged as Spam on both my accounts and move it to Spam folder. Yeah you got it right these are mails escaping the spam filter and landing in my inbox and personally marked as Spam.

After running mbsync I tag mails based on their folder (searching string folder:). This allows me easily get contents of lets say a mailing list without remembering the list address.

### Reading Mails

Now that we have synced and classified mail its time to setup the reading part. I use notmuch-emacs interface to read the mails. I use Spacemacs flavor of emacs so I took some time to write down the a private layer which brings together all my keybindings and classification in one place and does not clutter my entire .spacemacs file. You can find the code for my private layer in [notmuch-emacs-layer repository][1]

### Sending Mails

Well its not sufficient that if we can read mails, we need to be able to reply to mail. And this was the slightly tricky part where I recently got lost and had to write this post so that I don't forget it again. (And of course don't have to refer some outdated posts on web).

My setup to send mails is using postfix as SMTP client with my own SMTP server as relayhost for it. The problem of relaying is it's not for the hosts with dynamic IP. There are couple of ways to allow hosts with dynamic IP to use relay servers, one is put the IP address from where mail will originate into my_network or second use SASL authentication.

My preferred way is use of SASL authentication. For this I first had to create a separate account one for each machine which is going to relay the mails to my main server. Idea is to not use my primary account for SASL authentication. (Originally I was using primary account, but Jonas gave this idea of account per road runner).
```
adduser <hostname>_relay

```

Here replace <hostname> with name of your laptop/desktop or whatever you are using. Now we need to adjust postfix to act as relaying server. So add following lines to postfix configuration
```
# SASL authentication
smtp_sasl_auth_enable = yes
smtp_tls_security_level = encrypt
smtp_sasl_tls_security_options = noanonymous
relayhost = [smtp.copyninja.info]:submission
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
```

So here relayhost is the server name which your postfix instance will be using to relay mails forward into internet. :submission part tells postfix to forward mail on to port 587 (secure). smtp_sasl_tls_security_options is set to disallow anonymous connection. This is must so that relay server trusts your mobile host and agrees to forward the mail for you.

/etc/postfix/sasl_passwd is the file where you need to store password for account to be used for SASL authentication with server. Put following content into it.
```
[smtp.example.com]:submission user:password

```

Replace smtp.example.com with your SMTP server name which you have put in relayhost configuration. Replace user with <hostname>_relay user you created and its password.

To secure the sasl_passwd file and create a hash of it for postfix use following command.
```
chown root:root /etc/postfix/sasl_passwd
chmod 0600 /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd
```

The last command will create /etc/postfix/sasl_passwd.db file which is hash of your file /etc/postfix/sasl_passwd with same owner and permission. Now reload the postfix and check if mail makes out of your system using mail command.

### Bonus Part

Well since I've a script created above bringing together mail syncing and classification. I went ahead and created a systemd timer to periodically sync mails in the background. In my case every 10 minutes. Below is mailsync.timer file.
```
[Unit]
Description=Check Mail Every 10 minutes
RefuseManualStart=no
RefuseManualStop=no

[Timer]
Persistent=false
OnBootSec=5min
OnUnitActiveSec=10min
Unit=mailsync.service

[Install]
WantedBy=default.target
```

Below is mailsync.service which is needed by mailsync.timer to execute our scripts.

```
[Unit]
Description=Check Mail
RefuseManualStart=no
RefuseManualStop=yes

[Service]
Type=oneshot
ExecStart=/usr/local/bin/mail-sync
StandardOutput=syslog
StandardError=syslog
```

Put these files under /etc/systemd/user and run below command to enable them.
```
systemctl enable --user mailsync.timer
systemctl enable --user mailsync.service
systemctl start --user mailsync.timer
```

So that's how I've sync and send mail from my system. I came to know about afew from Jonas Smedegaard who also proof read this post. So next step I will try to improve my notmuch configuration using afew and of course a post will follow after that :-).

--------------------------------------------------------------------------------

via: https://copyninja.info/blog/email_setup.html

作者：[copyninja][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://copyninja.info
[1]:https://source.copyninja.info/notmuch-emacs-layer.git/
