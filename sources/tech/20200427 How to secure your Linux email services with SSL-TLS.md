[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to secure your Linux email services with SSL/TLS)
[#]: via: (https://opensource.com/article/20/4/securing-linux-email)
[#]: author: (Marc Skinner https://opensource.com/users/marc-skinner)

How to secure your Linux email services with SSL/TLS
======
Protect your Linux email services by understanding security
certificates.
![email or newsletters via inbox and browser][1]

Traditionally, email services send data in an unprotected way—whether you are sending emails via SMTP or receiving them via IMAP or POP, the defaults are in cleartext. With more online applications enforcing encryption and the general consensus to protect your data, it's best to secure your email services with a Secure Sockets Layer/Transport Layer Security (SSL/TLS) security certificate.

First, a quick review of email services and protocols. Email is sent via a service called Simple Mail Transport Protocol (SMTP) using TCP port 25. This protocol sends emails from server to server based on DNS mail exchanger (MX) record lookups. Once an email is on the email server, it is retrieved using one of two services: Internet Message Access Protocol (IMAP) using port TCP 143, or Post Office Protocol (POP3) using port TCP 110. All of these services, by default, send your email and authentication to/from these services in plain text—thus, it's very unprotected!

To protect the email data and authentication, these services have added a security feature in which they can utilize an SSL/TLS certificate to wrap the data flow and communication with encryption. How SSL/TLS encryption secures information is beyond the scope of this article, but [Bryant Son's internet security article][2] covers it in great detail. At a high level, SSL/TLS encryption is a public/private encryption algorithm.

By adding these security features into the services, they can listen on new TCP ports:

Service | Default TCP Port | SSL/TLS Port
---|---|---
SMTP | 25 | 587
IMAP | 143 | 993
POP3 | 110 | 995

### Generate SSL/TLS certificates

SSL/TLS certificates can be generated for free using tools like [OpenSSL][3], or they can be purchased for a range of prices from public certificate authorities (CAs). In the past, generating your own certificate was easy and worked in most cases, but with the increasing demand for better security, most email clients don't trust self-generated SSL/TLS certificates without a manual exception.

If your use case is private or for testing, then saving money with a self-generated certificate makes sense. But if you're rolling this out to a large group or have paying customers, then you're better served by purchasing a certificate from a public, trusted company that sells them.

In either case, the process to start requesting a new certificate is to use the OpenSSL tooling on your Linux system to create a certificate signing request (CSR):


```
`$ openssl req -new -newkey rsa:2048 -nodes -keyout mail.mydomain.key -out mail.mydomain.csr`
```

This command will create a new CSR and private key at the same time for the service you are trying to secure. The process will ask you a number of questions associated with the certificate: location details, server fully qualified domain name (FQDN), email contact information, etc. Once you have filled out the information, the key and CSR will be generated.

#### If you generate your own certificate

If you want to generate your own certificate, you must create your own [root CA][4] before issuing the CSR command above. You can create your own root CA with:


```
`$ openssl genrsa -des3 -out myCA.key 2048`
```

It will prompt you to add a passphrase. Please give it a secure passphrase and don't lose it—this is your private root CA key, and as the name states, it's the root of all trust in your certificates.

Next, generate the root CA certificate:


```
`$ openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem`
```

After answering a few more questions, you will generate a root CA certificate with a five-year lifespan.

Using the CSR file from the steps above, you can request a new certificate to be generated and signed by the root CA you just created:


```
`$ openssl x509 -req -in mail.mydomain.csr -CA myCA.pem -CAkey myCA.key -CAcreateserial -out mail.mydomain.pem -days 1825 -sha256`
```

Enter your private root CA key passphrase to create and sign the certificate.

Now you have the two files needed to configure your email services for enhanced security: the private key file, **mail.mydomain.key**, and the public certificate file, **mail.mydomain.pem**.

#### If you purchase a certificate

If you purchase a certificate from a vendor, it will ask you to upload that CSR to its system, as it is used as the input to generate the SSL/TLS certificate. The certificate will be accessible as a file (such as **mail.mydomain.pem**). Many SSL vendors also require you to download an intermediate certificate. If this is the case, you must combine the two certificate files into one, so the email service can process them both in combination. You can combine your certificate with a third-party intermediate certificate with:


```
`$ cat mail.mydomain.pem gd_bundle-g2-g1.crt > mail.mydomain.pem`
```

Notice that the output's file extension is **.pem**, which stands for Privacy-Enhanced Mail.

Now you have the two files you need to configure your email services for enhanced security: the private key file, **mail.mydomain.key**, and the public combined certificate file, **mail.mydomain.pem**.

### Create a safe directory for your files

Whether you created your own key or bought one from a vendor, create a safe, root-owned directory for the two files you created above. An example workflow to create a safe play would be:


```
$ mkdir /etc/pki/tls
$ chown root:root /etc/pki/tls
$ chmod 700 /etc/pki/tls
```

Make sure to set the permissions on your files after you copy them into **/etc/pki/tls** with:


```
`$ chmod 600 /etc/pki/tls/*`
```

### Configure your SMTP and IMAP services

Next, configure both the SMTP and the IMAP services to use the new security certificates. The programs used in this example for SMTP and IMAP are **postfix** and **dovecot**.

Edit ***/_****etc****_/*****postfix/main.cf** in your preferred text editor. Add the following lines:


```
smtpd_use_tls = yes
smtpd_tls_cert_file = /etc/pki/tls/mail.mydomain.pem
smtpd_tls_key_file = /etc/pki/tls/mail.mydomain.key
```

### Customize your config

The following options allow you to disable/enable different ciphers, protocols, etc.:


```
smtpd_tls_eecdh_grade = strong
smtpd_tls_protocols= !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtpd_tls_mandatory_protocols= !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtpd_tls_mandatory_ciphers = high
smtpd_tls_security_level=may
smtpd_tls_ciphers = high
tls_preempt_cipherlist = yes
smtpd_tls_mandatory_exclude_ciphers = aNULL, MD5 , DES, ADH, RC4, PSD, SRP, 3DES, eNULL
smtpd_tls_exclude_ciphers = aNULL, MD5 , DES, ADH, RC4, PSD, SRP, 3DES, eNULL
smtp_tls_mandatory_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtp_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
```

Edit **/etc/dovecot/dovecot.conf** by adding these three lines:


```
ssl = required
ssl_cert = &lt;/etc/pki/tls/mail.mydomain.pem
ssl_key = &lt;/etc/pki/tls/mail.mydomain.key
```

Add the following options to disable/enable different ciphers, protocols, and more (I'll leave understanding and considering these up to you):


```
ssl_cipher_list = EECDH+ECDSA+AESGCM:EECDH+aRSA+AESGCM:EECDH+ECDSA+SHA384:EECDH+ECDSA+SHA256:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH+aRSA+RC4:EECDH:EDH+aRSA:ALL:!aNULL:!eNULL:!LOW:!3DES:!MD5:!EXP:!PSK:!SRP:!DSS:!RC4:!SSLv2
ssl_prefer_server_ciphers = yes
ssl_protocols = !SSLv2 !SSLv3 !TLSv1 !TLSv1.1
ssl_min_protocol = TLSv1.2
```

### Set context for SELinux

If your Linux distribution has SELinux enabled, set the correct SELinux context for your new certificate files.

For Postfix SELinux:


```
`$ chcon -u system_u -t cert_t mail.mydomain.*`
```

For Dovecot SELinux:


```
`$ chcon -u system_u -t dovecot_cert_t mail.mydomain.*`
```

Restart both services and connect with your updated email client configurations. Some email clients will auto-detect the new port numbers; others will require you to update them.

### Test your setup

Quickly test from the command line with **openssl** and the **s_client** plugin:


```
$ openssl s_client -connect mail.mydomain.com:993
$ openssl s_client -starttls imap -connect mail.mydomain.com:143
$ openssl s_client -starttls smtp -connect mail.mydomain.com:587
```

These test commands will show a plethora of data about the connection, certificate, cipher, session, and protocol you're using. This is not only a good way to validate that the new configuration is working but also to confirm you're using the appropriate certificate and security settings you defined in the **postfix** or **dovecot** configuration files.

Stay secure!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/securing-linux-email

作者：[Marc Skinner][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/marc-skinner
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/newsletter_email_mail_web_browser.jpg?itok=Lo91H9UH (email or newsletters via inbox and browser)
[2]: https://opensource.com/article/19/11/internet-security-tls-ssl-certificate-authority
[3]: https://www.openssl.org/
[4]: https://en.wikipedia.org/wiki/Root_certificate
