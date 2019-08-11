[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Postfix to get email from your Fedora system)
[#]: via: (https://fedoramagazine.org/use-postfix-to-get-email-from-your-fedora-system/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

Use Postfix to get email from your Fedora system
======

![][1]

Communication is key. Your computer might be trying to tell you something important. But if your mail transport agent ([MTA][2]) isn’t properly configured, you might not be getting the notifications. Postfix is a MTA [that’s easy to configure and known for a strong security record][3]. Follow these steps to ensure that email notifications sent from local services will get routed to your internet email account through the Postfix MTA.

### Install packages

Use _dnf_ to install the required packages ([you configured][4] _[sudo][4]_[, right?][4]):

```
$ sudo -i
# dnf install postfix mailx
```

If you previously had a different MTA configured, you may need to set Postfix to be the system default. Use the _alternatives_ command to set your system default MTA:

```
$ sudo alternatives --config mta
There are 2 programs which provide 'mta'.
  Selection    Command
*+ 1           /usr/sbin/sendmail.sendmail
   2           /usr/sbin/sendmail.postfix
Enter to keep the current selection[+], or type selection number: 2
```

### Create a _password_maps_ file

You will need to create a Postfix lookup table entry containing the email address and password of the account that you want to use to for sending email:

```
# MY_EMAIL_ADDRESS=glb@gmail.com
# MY_EMAIL_PASSWORD=abcdefghijklmnop
# MY_SMTP_SERVER=smtp.gmail.com
# MY_SMTP_SERVER_PORT=587
# echo "[$MY_SMTP_SERVER]:$MY_SMTP_SERVER_PORT $MY_EMAIL_ADDRESS:$MY_EMAIL_PASSWORD" >> /etc/postfix/password_maps
# chmod 600 /etc/postfix/password_maps
# unset MY_EMAIL_PASSWORD
# history -c
```

If you are using a Gmail account, you’ll need to configure an “app password” for Postfix, rather than using your gmail password. See “[Sign in using App Passwords][5]” for instructions on configuring an app password.

Next, you must run the _postmap_ command against the Postfix lookup table to create or update the hashed version of the file that Postfix actually uses:

```
# postmap /etc/postfix/password_maps
```

The hashed version will have the same file name but it will be suffixed with _.db_.

### Update the _main.cf_ file

Update Postfix’s _main.cf_ configuration file to reference the Postfix lookup table you just created. Edit the file and add these lines.

```
relayhost = smtp.gmail.com:587
smtp_tls_security_level = verify
smtp_tls_mandatory_ciphers = high
smtp_tls_verify_cert_match = hostname
smtp_sasl_auth_enable = yes
smtp_sasl_security_options = noanonymous
smtp_sasl_password_maps = hash:/etc/postfix/password_maps
```

The example assumes you’re using Gmail for the _relayhost_ setting, but you can substitute the correct hostname and port for the mail host to which your system should hand off mail for sending.

For the most up-to-date details about the above configuration options, see the man page:

```
$ man postconf.5
```

### Enable, start, and test Postfix

After you have updated the main.cf file, enable and start the Postfix service:

```
# systemctl enable --now postfix.service
```

You can then exit your _sudo_ session as root using the _exit_ command or **Ctrl+D**. You should now be able to test your configuration with the _mail_ command:

```
$ echo 'It worked!' | mail -s "Test: $(date)" glb@gmail.com
```

### Update services

If you have services like [logwatch][6], [mdadm][7], [fail2ban][8], [apcupsd][9] or [certwatch][10] installed, you can now update their configurations so that their email notifications will go to your internet email address.

Optionally, you may want to configure all email that is sent to your local system’s root account to go to your internet email address. Add this line to the _/etc/aliases_ file on your system (you’ll need to use _sudo_ to edit this file, or switch to the _root_ account first):

```
root: glb+root@gmail.com
```

Now run this command to re-read the aliases:

```
# newaliases
```

  * TIP: If you are using Gmail, you can [add an alpha-numeric mark][11] between your username and the **@** symbol as demonstrated above to make it easier to identify and filter the email that you will receive from your computer(s).



### Troubleshooting

**View the mail queue:**

```
$ mailq
```

**Clear all email from the queues:**

```
# postsuper -d ALL
```

**Filter the configuration settings for interesting values:**

```
$ postconf | grep "^relayhost\|^smtp_"
```

**View the _postfix/smtp_ logs:**

```
$ journalctl --no-pager -t postfix/smtp
```

**Reload _postfix_ after making configuration changes:**

```
$ systemctl reload postfix
```

* * *

_Photo by _[_Sharon McCutcheon_][12]_ on [Unsplash][13]_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-postfix-to-get-email-from-your-fedora-system/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/postfix-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Message_transfer_agent
[3]: https://en.wikipedia.org/wiki/Postfix_(software)
[4]: https://fedoramagazine.org/howto-use-sudo/
[5]: https://support.google.com/accounts/answer/185833
[6]: https://src.fedoraproject.org/rpms/logwatch
[7]: https://fedoramagazine.org/mirror-your-system-drive-using-software-raid/
[8]: https://fedoraproject.org/wiki/Fail2ban_with_FirewallD
[9]: https://src.fedoraproject.org/rpms/apcupsd
[10]: https://www.linux.com/learn/automated-certificate-expiration-checks-centos
[11]: https://gmail.googleblog.com/2008/03/2-hidden-ways-to-get-more-from-your.html
[12]: https://unsplash.com/@sharonmccutcheon?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[13]: https://unsplash.com/search/photos/envelopes?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
