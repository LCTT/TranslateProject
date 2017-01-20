translating---geekpi

OpenSSL For Apache and Dovecot : part 1
============================================================

 ![OpenSSL](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/openssl.jpg?itok=RWoqdCAI "OpenSSL") 
In this two-part series, Carla Schroder shows how to create your own OpenSSL certificates and how to configure Apache and Dovecot to use them.[Creative Commons Zero][1]Pixabay


At long last, my wonderful readers, here is your promised OpenSSL how-to for Apache, and next week you get SSL for Dovecot. In this two-part series, we'll learn how to create our own OpenSSL certificates and how to configure Apache and Dovecot to use them.

The examples here build on these tutorials:

*   [Apache on Ubuntu Linux For Beginners][3]
*   [Apache on Ubuntu Linux For Beginners: Part 2][4]
*   [Apache on CentOS Linux For Beginners][5]

### Creating Your Own Certificate

Debian/Ubuntu/Mint store private keys and symlinks to certificates in `/etc/ssl`. The certificates bundled with your system are kept in `/usr/share/ca-certificates`. Certificates that you install or create go in `/usr/local/share/ca-certificates/`.

This example for Debian/etc. creates a private key and public certificate, converts the certificate to the correct format, and symlinks it to the correct directory:

```

$ sudo openssl req -x509 -days 365 -nodes -newkey rsa:2048 \
   -keyout /etc/ssl/private/test-com.key -out \
   /usr/local/share/ca-certificates/test-com.crt
Generating a 2048 bit RSA private key
.......+++
......................................+++
writing new private key to '/etc/ssl/private/test-com.key'
-----
You are about to be asked to enter information that will 
be incorporated into your certificate request.
What you are about to enter is what is called a Distinguished 
Name or a DN. There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:WA
Locality Name (eg, city) []:Seattle
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Alrac Writing Sweatshop
Organizational Unit Name (eg, section) []:home dungeon
Common Name (e.g. server FQDN or YOUR name) []:www.test.com
Email Address []:admin@test.com

$ sudo update-ca-certificates
Updating certificates in /etc/ssl/certs...
1 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...

Adding debian:test-com.pem
done.
done.
```

CentOS/Fedora use a different file structure and don't use `update-ca-certificates`, so use this command:

```

$ sudo openssl req -x509 -days 365 -nodes -newkey rsa:2048 \
   -keyout /etc/httpd/ssl/test-com.key -out \
   /etc/httpd/ssl/test-com.crt
```

The most important item is the Common Name, which must exactly match your fully qualified domain name. Everything else is arbitrary. `-nodes`creates a password-less certificate, which is necessary for Apache. `- days`defines an expiration date. It's a hassle to renew expired certificates, but it supposedly provides some extra security. See [Pros and cons of 90-day certificate lifetimes][10] for a good discussion.

### Configure Apache

Now configure Apache to use your new certificate. If you followed [Apache on Ubuntu Linux For Beginners: Part 2][11], all you do is modify the `SSLCertificateFile` and `SSLCertificateKeyFile` lines in your virtual host configuration to point to your new private key and public certificate. The `test.com` example from the tutorial now looks like this:

```

SSLCertificateFile /etc/ssl/certs/test-com.pem
SSLCertificateKeyFile /etc/ssl/private/test-com.key
```

CentOS users, see [Setting up an SSL secured Webserver with CentOS][12] in the CentOS wiki. The process is similar, and the wiki tells how to deal with SELinux.

### Testing Apache SSL

The easy way is to point your web browser to [https://yoursite.com][13] and see if it works. The first time you do this you will get the scary warning from your over-protective web browser how the site is unsafe because it uses a self-signed certificate. Ignore your hysterical browser and click through the nag screens to create a permanent exception. If you followed the example virtual host configuration in [Apache on Ubuntu Linux For Beginners: Part 2][14]all traffic to your site will be forced over HTTPS, even if your site visitors try plain HTTP.

The cool nerdy way to test is by using OpenSSL. Yes, it has a nifty command for testing these things. Try this:

```

$ openssl s_client -connect www.test.com:443
CONNECTED(00000003)
depth=0 C = US, ST = WA, L = Seattle, O = Alrac Writing Sweatshop, 
OU = home dungeon, CN = www.test.com, emailAddress = admin@test.com
verify return:1
---
Certificate chain
 0 s:/C=US/ST=WA/L=Seattle/O=Alrac Writing Sweatshop/OU=home 
     dungeon/CN=www.test.com/emailAddress=admin@test.com
   i:/C=US/ST=WA/L=Seattle/O=Alrac Writing Sweatshop/OU=home 
     dungeon/CN=www.test.com/emailAddress=admin@test.com
---
Server certificate
-----BEGIN CERTIFICATE-----
[...]
```

This spits out a giant torrent of information. There is a lot of nerdy fun to be had with `openssl s_client`; for now it is enough that we know if our web server is using the correct SSL certificate.

### Creating a Certificate Signing Request

Should you decide to use a third-party certificate authority (CA), you will have to create a certificate signing request (CSR). You will send this to your new CA, and they will sign it and send it back to you. They may have their own requirements for creating your CSR; this a typical example of how to create a new private key and CSR:

```

$ openssl req -newkey rsa:2048 -nodes \
   -keyout yourdomain.key -out yourdomain.csr
```

You can also create a CSR from an existing key:

```

$ openssl req  -key yourdomain.key \
   -new -out domain.csr
```

That is all for today. Come back next week to [learn how to properly set up Dovecot to use OpenSSL][15].

### Additional Tutorials

[Quieting Scary Web Browser SSL Alerts][16]
[How to Set Up Secure Remote Networking with OpenVPN on Linux, Part 1][17]
[How to Set Up Secure Remote Networking with OpenVPN on Linux, Part 2][18]

_Advance your career in system administration! Check out the[ ][6][Essentials of System Administration][7][ ][8]course from The Linux Foundation._

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/sysadmin/openssl-apache-and-dovecot

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/openssljpg
[3]:https://www.linux.com/learn/apache-ubuntu-linux-beginners
[4]:https://www.linux.com/learn/apache-ubuntu-linux-beginners-part-2
[5]:https://www.linux.com/learn/apache-centos-linux-beginners
[6]:https://training.linuxfoundation.org/linux-courses/system-administration-training/essentials-of-system-administration
[7]:https://training.linuxfoundation.org/linux-courses/system-administration-training/essentials-of-system-administration
[8]:https://training.linuxfoundation.org/linux-courses/system-administration-training/essentials-of-system-administration
[9]:https://www.addtoany.com/share#url=https%3A%2F%2Fwww.linux.com%2Flearn%2Fsysadmin%2Fopenssl-apache-and-dovecot&title=OpenSSL%20For%20Apache%20and%20Dovecot%20
[10]:https://community.letsencrypt.org/t/pros-and-cons-of-90-day-certificate-lifetimes/4621
[11]:https://www.linux.com/learn/apache-ubuntu-linux-beginners-part-2
[12]:https://wiki.centos.org/HowTos/Https
[13]:https://yoursite.com/
[14]:https://www.linux.com/learn/apache-ubuntu-linux-beginners-part-2
[15]:https://www.linux.com/learn/intro-to-linux/openssl-apache-and-dovecot-part-2
[16]:https://www.linux.com/learn/quieting-scary-web-browser-ssl-alerts
[17]:https://www.linux.com/learn/how-set-secure-remote-networking-openvpn-linux-part-1
[18]:https://www.linux.com/learn/how-set-secure-remote-networking-openvpn-linux-part-2
