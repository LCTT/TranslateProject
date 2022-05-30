[#]: subject: "Travel off the grid and still send emails with putmail"
[#]: via: "https://opensource.com/article/22/5/send-email-putmail"
[#]: author: "Kevin Sonney https://opensource.com/users/ksonney"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Travel off the grid and still send emails with putmail
======
Configure your mail client to automatically send emails next time you have an internet connection.

![Chat via email][1]

*Automation is a hot topic right now. In my day job as an SRE part of my remit is to automate as many repeating tasks as possible. But how many of us do that in our daily, not-work, lives? This year, I am focused on automating away the toil so that we can focus on the things that are important.*

In "normal times" my wife and I travel a lot. And as anyone who similarly travels a lot knows, connectivity can be very expensive. We were recently on a cruise and the "Premium" ship-board internet cost upwards of $200 for the full 7 days, and even then it had all the drawbacks of satellite internet in terms of speed and congestion. So to make my life easier, I set up [offlineimap][2] to download my mail, [dovecot][3] to let me use an IMAP client to read my mail, and [msmtp][4] to send mail from my various accounts. I covered much of [this setup in 2020][5], and the rest is documented in many places online.

What is not often discussed is that you still need to be online to send mail. The most common recommended solution for sending mail is msmtp, and it always rejects mail if it can't connect to the desired host. But it does have a daemon option (`msmtpd` ) that can be used to accept local SMTP connections and forward them to another program. By default, this is `msmtp` itself. But again, I don't want to send things now, I want to send things when I have a connection, which is when I stumbled upon [putmail][6].

`Putmail` is a set of Python scripts that sends mail to pre-configured smtp servers based on the `From` address in a mail message. It is stable (unmodified since 2011), and just works. If you, like me, have multiple email addresses which have to be sent via multiple SMTP relays, this is just the thing you need. Each email address you send from has its own configuration file, and since `putmail` decides on which to use based on the message itself, there's no need to have to set up multiple sending setups in a single mail client.

As an example, to send with a `gmail` account, you would create the file `.putmail/yourname@gmail.com` and fill in the following information.

```
yourname@gmail.com putmail configuration
[config]
email = yourname@gmail.com
server = smtp.gmail.com
port = 587
username = yourname@gmail.com
password = XXXXXXXXXXXXXXXXX
tls = on
```

And that's it. Configure a mail client to send via `putmail.py` instead of `sendmail` or `msmtp` and send a message.

The next best things are the `putmail_enque.py` and `putmail_dequeue.py` scripts. The first takes an email and stores it to send later. The second loops through the queue and delivers the mail. By specifying `putmail_enqueue.py` as the program `msmtpd` runs, I can "send" an email now, and it just waits for me to run `putmail_dequeue.py` later. Here is my `msmtpd` startup command, specifying `putmail_enqueue.py` as the item to be used for mail delivery.

```
msmtpd --port=1025 --log=/tmp/msmtpd.log --command='putmail_enqueue.py -f %F' -
```

I use the following script as a `presynchook` in `offlineimap` to check to see if I am connected, and if so, send mail.

```
#!/bin/bash
echo Sending queued messages \(if any\)
QUEUEDMAIL=$(find $HOME/.putmail/queue -type f | wc -l)
if [ $QUEUEDMAIL -ne 0 ]; then
  ping -n -c 1 imap.gmail.com >/dev/null 2>/dev/null
  if [ $? -eq 0 ]; then
    putmail_dequeue.py
  fi
fi
```

After all that, I can use any mail client I wish and send mail with a standard SMTP call to `localhost:1025` and have it delivered next time I'm connected to the internet. And the best part is, I don't have to change my workflow for email if I'm home or traveling — it all just happens automatically in the background.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/send-email-putmail

作者：[Kevin Sonney][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/email_chat_communication_message.png
[2]: https://www.offlineimap.org/
[3]: https://www.dovecot.org/
[4]: https://marlam.de/msmtp/
[5]: https://opensource.com/article/20/1/sync-email-offlineimap
[6]: https://github.com/tgray/putmail
