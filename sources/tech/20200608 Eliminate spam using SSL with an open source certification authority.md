[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Eliminate spam using SSL with an open source certification authority)
[#]: via: (https://opensource.com/article/20/6/secure-open-source-antispam)
[#]: author: (Victor Lopes https://opensource.com/users/victorlclopes)

Eliminate spam using SSL with an open source certification authority
======
Use a Let’s Encrypt certificate with MailCleaner for STARTTLS and SSL.
Here's how.
![Chat via email][1]

[MailCleaner][2] is a feature-rich, open source antispam solution. Its virtual appliances (VMs) available for distribution come out-of-the-box with self-signed certificates for both the web interface and the MTA services.

This requires you to supply your own valid, publicly trusted certificate. Using a Let's Encrypt certificate is a great way to accomplish that because it's free, safe, and automated.

When requesting a Let's Encrypt certificate, the most important step is the hostname validation. If you don't know about it, consult the [documentation][3].

### Firewall requirements

First of all, you need to define which hostnames you will use, including your MX records, and they must point to the IP address you're using to publish your MailCleaner server.

If you choose to perform the validation using local port 80 on your MailCleaner box, you will have to include a few commands to temporarily stop the Apache service during the certificate request. That's why I recommend using an alternative port, which, in our examples, will be port TCP 8090.

You have a few options in this scenario:

**Option 1**: Create rules in your reverse proxy to forward Let's Encrypt validation requests to your MailCleaner server. You have to redirect every request sent to port TCP 80, whose destination hostname is your MailCleaner external FQDN, and the path starts with `/.well-known/acme-challenge/` to port TCP 8090 on your MailCleaner server.

**Option 2**: Using a NAT rule, for example, redirect the traffic sent to port TCP 80 to port TCP 8090 on your MailCleaner server.

**Option 3**: Redirect/allow traffic sent to port TCP 80 to the actual port TCP 80 on your MailCleaner server, which is less secure, less flexible, and not recommended.

Alternatively, you could have the certificate request and the name validation performed somewhere else (like in your firewall) and create a routine for copying the cert files to your MailCleaner box. If you have a [pfSense][4] firewall with the [ACME][5] package, for example, you can try to merge the concepts within this article with this [how-to][6].

### Installing Certbot

[Certbot][7] is an open source tool for requesting and managing Let's Encrypt certificates.

To install Certbot on your MailCleaner server, log in as `root` (in the console or through SSH) and run:


```
$ wget <https://dl.eff.org/certbot-auto>
$ mv certbot-auto /usr/local/bin/certbot-auto
$ chown root /usr/local/bin/certbot-auto
$ chmod 0755 /usr/local/bin/certbot-auto
```

### Testing certificate name validation

If you're using an alternate port, you need to open it in the local firewall on your MailCleaner server:


```
`iptables -A INPUT -p tcp -m tcp --dport 8090 -j ACCEPT`
```

Note: MailCleaner keeps local firewall rules in its database and sets the `iptables` config every time the server loads. It's imperative that you add port 8090 to the firewall table inside MailCleaner's MySQL database; otherwise, every renewal process will fail. To learn how to do this, take a look at the section titled "Accessing MailCleaner's MySQL database" in the article _[How to install MailCleaner 2020.01][8]._

Now, let's try to issue our certificate using Let's Encrypt's staging (testing) server. Please replace the appropriate values with your email address and your MailCleaner server hostname(s).

**Option 1**: If you are using the alternative port 8090, use this command line:


```
$ certbot-auto certonly --standalone --preferred-challenges http \
\--http-01-port 8090 --email [myemail@domain.com][9] \--no-eff-email \
\--agree-tos --staging -d myhostname.mydomain.com
```

If you have more than one name, just add them with "`-d`" at the end:


```
-d mx1.mydomain.com \
-d mx2.mydomain.com \
-d spam.mydomain.com
```

**Option 2**: If you are using local port 80, use this command line:


```
$ certbot-auto certonly --standalone --preferred-challenges http \
 --email [myemail@domain.com][9] \--no-eff-email --agree-tos --staging \
-d myhostname.mydomain.com \
\--pre-hook "/usr/mailcleaner/etc/init.d/apache stop" \
\--post-hook "/usr/mailcleaner/etc/init.d/apache start"
```

Note: After issuing this command, you will hit a bootstrapping routine identifying missing dependencies, mostly Python packages. Let it install the necessary software.

If everything went fine, you should see a result like this:


```
root#mailcleaner:~#
root@mailcleaner:~# certbot-auto certonly \
\--standalone --preferred-challenges http \
\--http-01-port 8090 --email [victor@domain.com][10] \
\--no-eff-email --agree-tos --staging \
-d mail.example.com

Saving debug log to /var/log/letsencrypt/
Plugins selected: Authenticator standalone
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for mail.example.com
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
Your certificate and chain have been saved at:
/etc/letsencrypt/live/mail.example.com/fullchain.pem
Your key file has been saved at:
/etc/letsencrypt/ live/mail.example.com/privkey.pem
[...]
root@mailcleaner:~#
```

If it didn't go well, keep in mind that most errors with this process are caused by Let's Encrypt servers not being able to reach your server. Check if your firewall configuration is really OK.

### Request your certificate

When the certificate issuing process is working correctly with the staging server, go ahead and request your certificate for production (removing the staging parameter):


```
`certbot-auto certonly --standalone --preferred-challenges http --http-01-port 8090 --email myemail@domain.com --no-eff-email --agree-tos --force-renewal -d myhostname.mydomain.com`
```

Note: Adapt the command line if you're not using the alternative port 8090. If that's the case, don't forget the pre-hook and post-hook.

The result screen is pretty similar. You will now have a valid certificate at the following path:


```
`/etc/letsencrypt/live/my__hostname_.yourdomain.com_/`[/code] [code]

root#mailcleaner:~# ls /etc/letsencrypt/live/mail.example.com
cert.pem chain.pem fullchain.pem privkey.pem README
root@mailcleaner:~#
```

### Automate certificate assignment and renewal

The last piece of this puzzle is the great script provided by "GRahamJB" in this [MailCleaner forum topic][11]. You can download the script from [here][12].

Let's save this script in our server. Create the following file:


```
`$ nano /usr/local/bin/set-certificates.pl`
```

Then paste the contents of the script and save it (`Ctrl + X`). And give the script permission to run:


```
`$ chmod +x /usr/local/bin/set-certificates.pl`
```

Now run the script to assign your certificate to the web interface and the MTA services:


```
root@mailcleaner:~# set-certificates.pl --set_web \
\--set_mta_in --set_mta_out \
\--key /etc/letsencrypt/live/mail.example.com/privkey.pem \
\--data /etc/letsencrypt/live/mail.example.com/cert.pem \
\--chain /etc/letsencrypt/live/mail.example.com/chain.pem

Stopping Apache: stopped.
Starting Apache: started.
Stopping Exim stage 1: stopped.
Starting Exim stage 1: started.
Stopping Exim stage 4: stopped.
Starting Exim stage 4: started.
root@mailcleaner:~#
```

Now that we know it works, schedule these commands to run weekly, using cron and Certbot's built-in renewal routine:


```
`$ nano /etc/letsencrypt/renewal/yourhostname.yourdomain.com.conf`
```

Check if the options look correct and add the following line at the end (the same set-certificates.pl you just ran, preceded by `renew_hook =`):


```
.
.
# Options used in the renewal process
[renewalparams]
authenticator = standalone
account = 9d670ed7c63c6238f90f042f852fc33e
pref_challs = http-01,
http01_port = 8090
server = <https://acme-v02.api.letsencrypt.org/directory>
# Set MailCleaner certs
renew_hook = set-certificates.pl --set_web --set_mta_in --set_mta_out --key /etc/letsencrypt/live/myhostname.mydomain.com/privkey.pem --data /etc/letsencrypt/live/myhostname.mydomain.com/cert.pem --chain /etc/letsencrypt/live/myhostname.mydomain.com/chain.pem
```

Note that the "`renew_hook = set-cert…`" command must be one single line. Save the file and run the following command to test it:


```
`$ certbot-auto renew --force-renewal`
```

If the renewal succeeds, you'll see a result similar to the one below. Note how our `renew_hook` command was called. The certificate has been updated in MailCleaner and the necessary services restarted.


```
root@mailcleaner:~# certbot-auto renew --force-reneval
Saving debug log to /var/log/letsencrypt/letsencrypt.log

Processing /etc/ letsencrypt/renewal/mail.example.com.conf
Plugins selected: Authenticator standalone, Installer None
Renewing an existing certificate
Running deploy-hook command: set-certificates.pl \
\--set_web --set_mta_in --set_mta_out \
\--key /etc/letsencrypt/live/mail.example.com/privkey.pem \
\--data /etc/letsencrypt/live/mail.example.com/cert.pem \
\--chain /etc/letsencrypt/live/mail.example.com/chain.pem
Output from deploy-hook conmtwand set-certificates.pl:

Stopping Apache: stopped.
Starting Apache: started.
Stopping Exim stage 1: stopped.
Starting Exim stage 1: started.
Stopping Exim stage 4: stopped.
Starting Exim stage 4: started.

new certificate deployed without reload, fullchain is
/etc/letsencrypt/live/mail.example.com/fullchain.pem

Congratulations, all renewals succeeded.
The following certs have been renewed:
/etc/letsencrypt/live/mail.example.com/fullchain.pem (success)
root@mailcleaner:~#
```

Now, let's add that renew command to cron:


```
`$ crontab -e`
```

Add the following line and save the file. This will make Certbot run every Sunday at 2:00am:


```
`0 2 * * 7 /usr/local/bin/certbot-auto renew`
```

If crontab doesn't open the way you expect, run `select-editor` to choose the editor you like (nano, for example). If you want to check the result, run `crontab -l`.

By default, Certbot will only renew the certificate if it has less than 30 days left before its expiry date. If the cert is not due to expire, Certbot will not renew it (nor call hooks, of course).

### Testing results

If you access MailCleaner's web interface, you'll see that the SSL certificate is valid. And if you run the following command in your server, you can see that the certificate being presented on STARTTLS is the new Let's Encrypt cert you just set:


```
`$ openssl s_client -connect localhost:25 -starttls smtp`
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/secure-open-source-antispam

作者：[Victor Lopes][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/victorlclopes
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://www.mailcleaner.org/
[3]: https://letsencrypt.org/docs/challenge-types
[4]: https://www.pfsense.org/
[5]: https://docs.netgate.com/pfsense/en/latest/certificates/acme-package.html
[6]: https://medium.com/@victorlclopes/copy-pfsense-acme-certificate-to-another-server-e42c611c47ec
[7]: https://certbot.eff.org/
[8]: https://medium.com/@victorlclopes/how-to-install-mailcleaner-2020-01-8319c83e11ee
[9]: mailto:myemail@domain.com
[10]: mailto:victor@domain.com
[11]: https://forum.mailcleaner.org/viewtopic.php?f=5&t=3035#p12532
[12]: https://gist.github.com/victorlclopes/f5aa081f1a9c76466aaf3f3dc5bd60b7
