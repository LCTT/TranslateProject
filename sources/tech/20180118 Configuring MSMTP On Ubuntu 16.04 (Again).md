translating---geekpi

Configuring MSMTP On Ubuntu 16.04 (Again)
======
This post exists as a copy of what I had on my previous blog about configuring MSMTP on Ubuntu 16.04; I'm posting it as-is for posterity, and have no idea if it'll work on later versions. As I'm not hosting my own Ubuntu/MSMTP server anymore I can't see any updates being made to this, but if I ever do have to set this up again I'll create an updated post! Anyway, here's what I had…

I previously wrote an article around configuring msmtp on Ubuntu 12.04, but as I hinted at in a previous post that sort of got lost when the upgrade of my host to Ubuntu 16.04 went somewhat awry. What follows is essentially the same post, with some slight updates for 16.04. As before, this assumes that you're using Apache as the web server, but I'm sure it shouldn't be too different if your web server of choice is something else.

I use [msmtp][1] for sending emails from this blog to notify me of comments and upgrades etc. Here I'm going to document how I configured it to send emails via a Google Apps account, although this should also work with a standard Gmail account too.

To begin, we need to install 3 packages:
`sudo apt-get install msmtp msmtp-mta ca-certificates`
Once these are installed, a default config is required. By default msmtp will look at `/etc/msmtprc`, so I created that using vim, though any text editor will do the trick. This file looked something like this:
```
# Set defaults.
defaults
# Enable or disable TLS/SSL encryption.
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
# Setup WP account's settings.
account
host smtp.gmail.com
port 587
auth login
user
password
from
logfile /var/log/msmtp/msmtp.log

account default :

```

Any of the uppercase items (i.e. ``) are things that need replacing specific to your configuration. The exception to that is the log file, which can of course be placed wherever you wish to log any msmtp activity/warnings/errors to.

Once that file is saved, we'll update the permissions on the above configuration file -- msmtp won't run if the permissions on that file are too open -- and create the directory for the log file.
```
sudo mkdir /var/log/msmtp
sudo chown -R www-data:adm /var/log/msmtp
sudo chmod 0600 /etc/msmtprc

```

Next I chose to configure logrotate for the msmtp logs, to make sure that the log files don't get too large as well as keeping the log directory a little tidier. To do this, we create `/etc/logrotate.d/msmtp` and configure it with the following file. Note that this is optional, you may choose to not do this, or you may choose to configure the logs differently.
```
/var/log/msmtp/*.log {
rotate 12
monthly
compress
missingok
notifempty
}

```

Now that the logging is configured, we need to tell PHP to use msmtp by editing `/etc/php/7.0/apache2/php.ini` and updating the sendmail path from
`sendmail_path =`
to
`sendmail_path = "/usr/bin/msmtp -C /etc/msmtprc -a -t"`
Here I did run into an issue where even though I specified the account name it wasn't sending emails correctly when I tested it. This is why the line `account default : ` was placed at the end of the msmtp configuration file. To test the configuration, ensure that the PHP file has been saved and run `sudo service apache2 restart`, then run `php -a` and execute the following
```
mail ('personal@email.com', 'Test Subject', 'Test body text');
exit();

```

Any errors that occur at this point will be displayed in the output so should make diagnosing any errors after the test relatively easy. If all is successful, you should now be able to use PHPs sendmail (which at the very least WordPress uses) to send emails from your Ubuntu server using Gmail (or Google Apps).

I make no claims that this is the most secure configuration, so if you come across this and realise it's grossly insecure or something is drastically wrong please let me know and I'll update it accordingly.


--------------------------------------------------------------------------------

via: https://codingproductivity.wordpress.com/2018/01/18/configuring-msmtp-on-ubuntu-16-04-again/

作者：[JOE][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://codingproductivity.wordpress.com/author/joeb454/
[1]:http://msmtp.sourceforge.net/
