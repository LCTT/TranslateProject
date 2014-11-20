How to configure and secure your Postfix email server
================================================================================
![](http://techarena51.com/wp-content/uploads/2014/08/postfix.png)

Once you have your application server up and running, you are going to need a good email server to deliver your emails. I have been using postfix for all my servers and below is the configuration I generally use.

### Installation of Postfix on CentOS 6 ###

    yum install postfix

Sendmail is installed by default, so it is better to stop and remove it

    service sendmail stop
    yum remove sendmail

Postfix contains **two configuration files main.cf and master.cf**, you will need to modify main.cf for basic configuration. Also, postfix parameters can be defined like shell variables and can be used with a dollar sign preceding them. They do not need to be defined before they are used. Postfix will only look for a parameter when it is needed at rumtime.

### Configuring postfix ###

    vim /etc/postfix/main.cf

Uncomment the lines below

    #Add the hostname of your machine
    myhostname = yourhostname.com
    
    #From Domain to be used when mail is sent from this linux machine
    myorigin = $myhostname
    
    #The network interface to receive mail on, I prefer localhost as I only want emails from this system to be delivered
    inet_interfaces = localhost
    
    # The protocol to use when postfix will make or accept a connection. You can use “all” if you want to enable IPv6 support
    inet_protocols = ipv4
    
    
    #Domains to receive email for
    mydestination = $myhostname, localhost.$mydomain, localhost
    
    #Only forward emails for the local machine and not machines on the network.
    mynetworks_style = host

Start postfix

    service postfix start

This basic postfix configuration should enable your machine to send emails. You can verify the same by sending an email and checking “maillog” log file.

    echo test mail | mail -s "test"  leo@techarena51.com && sudo tail -f /var/log/maillog
    
    #Logs should output the following
    Aug 25 14:16:21 vps postfix/smtp[32622]: E6A372DC065D: to=, relay=smtp.mailserver.org[50.56.21.176], delay=0.8, delays=0.1/0/0.43/0.27, dsn=2.0.0, status=sent (250 Great success)
    Aug 25 14:16:21 vps postfix/qmgr[5355]: E6A372DC065D: removed

But this configuration is not enough, as your emails will mostly end up in spam. You will need to add an SPF, PTR and DKIM record. You may still get emails delivered in spam due to your IP address being blacklisted, mostly due to a previous abuse of your vps.

An alternative or a better way would be to use a third party provider like Gmail or even Mailgun.
I use Mailgun as they give you 10,000 emails free every month as compared to Gmails 100 or so per day.

In “/etc/postfix/main.cf” you will need to add “smtp.mailgun.com” as your “relayhost”, enable “SASL” authentication so postfix can connect and authenticate to the remote Mailgun server.

Add or uncomment the following lines.

    relayhost = [smtp.mailgun.org]
    smtp_sasl_auth_enable = yes
    smtp_sasl_password_maps=static:your_username:your_password
    smtp_sasl_security_options=noanonymous

Postfix does not implement “SASL” authentication by itself, hence you will need to install “cyrus-sasl-plain”.

    sudo yum install cyrus-sasl-plain

If you do not install this package on Centos 6 then you will get an error “SASL authentication failed; cannot authenticate to server smtp.mailgun.org[50.56.21.176]: no mechanism available)”

Restart postfix

    sudo service postfix restart

### Securing Postfix with TLS ###

Postfix supports TLS a successor to SSL which allows you to encrypt data using key based authentication. I recommend reading http://www.postfix.org/TLS_README.html on how tls works with postfix.

In order to use TLS you will need to generate a private key and a certificate which is signed by a Certificate Authority. In this example, I will be using a Self Signed Certificate.

    sudo yum install mod_ssl openssl
    # Generate private key 
    openssl genrsa -out smtp.key 2048 
    
    # Generate CSR 
    openssl req -new -key smtp.key -out smtp.csr
    
    # Generate Self Signed Key
    openssl x509 -req -days 365 -in smtp.csr -signkey smtp.key -out smtp.crt
    
    # Copy the files to the correct locations
    cp smtp.crt /etc/pki/tls/certs
    cp smtp.key /etc/pki/tls/private/smtp.key
    cp smtp.csr /etc/pki/tls/private/smtp.csr

Open the postfix configuration files and add the following parameteres

    sudo vim /etc/postfix/main.cf
    
    smtp_tls_security_level = may
    smtpd_tls_security_level = may
    smtp_tls_note_starttls_offer = yes
    
    smtpd_tls_key_file = /etc/pki/tls/private/smtp.key
    smtpd_tls_cert_file = /etc/pki/tls/certs
    smtp_tls_CAfile = /etc/ssl/certs/ca.crt
    smtp_tls_loglevel = 1

Security level “may” means announce STARTTLS support to remote SMTP clients, but clients do no need to use encryption., I have used it here as per [mailgun docs][1], but you can use “encrypt” if you want to force TLS encryption.

    service postfix restart
    #Send  a test email
    echo test mail | mail -s "test"  test@yourdomain.com && sudo tail -f /var/log/maillog

You should see the below message 

    Aug 21 00:00:06 vps postfix/smtp[4997]: setting up TLS connection to smtp.mailgun.org[50.56.21.176]:587
    Aug 21 00:00:06 vps postfix/smtp[4997]: Trusted TLS connection established to smtp.mailgun.org[50.56.21.176]:587: TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits)

You can comment out the below parameter once everything is successful.
“smtp_tls_loglevel = 1”

For Troubleshooting I recommend you read [Postfix tips and Troubleshooting Commands][2](注：此文在同一个原文更新中)

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/configure-secure-postfix-email-server/

作者：[Leo G][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:http://documentation.mailgun.com/user_manual.html#smtp-relay
[2]:http://techarena51.com/index.php/postfix-configuration-and-explanation-of-parameters/