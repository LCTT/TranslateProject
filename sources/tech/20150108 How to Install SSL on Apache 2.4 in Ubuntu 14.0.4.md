How to Install SSL on Apache 2.4 in Ubuntu 14.0.4
================================================================================
Today I will show you how to install a **SSL certificate** on your personal website or blog, to help secure the communications between your visitors and your website.

Secure Sockets Layer or SSL, is the standard security technology for creating an encrypted connection between a web server and a web browser. This ensures that all data passed between the web server and the web browser remain private and secure. It is used by millions of websites in the protection of their online communications with their customers. In order to be able to generate an SSL link, a web server requires a SSL Certificate.

You can create your own SSL Certificate, but it will not be trusted by default in web browsers, to fix this you will have to buy a digital certificate from a trusted Certification Authority (CA), we will show you below how to get the certificate and install it in apache. 

### Generating a Certificate Signing Request ###

The Certification Authority (CA) will ask you for a Certificate Signing Request (CSR) generated on your web server. This is a simple step and only takes a minute, you will have to run the following command and input the requested information:

    # openssl req -new -newkey rsa:2048 -nodes -keyout yourdomainname.key -out yourdomainname.csr

The output should look something like this:

![generate csr](http://blog.linoxide.com/wp-content/uploads/2015/01/generate-csr.jpg)

This begins the process of generating two files: the Private-Key file for the decryption of your SSL Certificate, and a certificate signing request (CSR) file (used to apply for your SSL Certificate) with apache openssl.

Depending on the authority you apply to, you will either have to upload your csr file or paste it's content in a web form.

### Installing the actual certificate in Apache ###

After the generation process is finished you will receive your new digital certificate, for this article we have used [Comodo SSL][1] and received the certificate in a zip file. To use it in apache you will first have to create a bundle of the certificates you received in the zip file with the following command:

    # cat COMODORSADomainValidationSecureServerCA.crt COMODORSAAddTrustCA.crt AddTrustExternalCARoot.crt > bundle.crt

![bundle](http://blog.linoxide.com/wp-content/uploads/2015/01/bundle.jpg)

Now make sure that the ssl module is loaded in apache by running the following command:

    # a2enmod ssl

If you get the message "Module ssl already enabled" you are ok, if you get the message "Enabling module ssl." you will also have to run the following command to restart apache:

    # service apache2 restart

Finally modify your virtual host file (generally found in /etc/apache2/sites-enabled) to look something like this:

    DocumentRoot /var/www/html/
    ServerName linoxide.com
    SSLEngine on
    SSLCertificateFile /usr/local/ssl/crt/yourdomainname.crt
    SSLCertificateKeyFile /usr/local/ssl/yourdomainname.key
    SSLCACertificateFile /usr/local/ssl/bundle.crt

You should now access your website using https://YOURDOMAIN/ (be careful to use 'https' not http) and see the SSL in progress (generally indicated by a lock in your web browser).

**NOTE:** All the links must now point to https, if some of the content on the website (like images or css files) still point to http links you will get a warning in the browser, to fix this you have to make sure that every link points to https.

### Redirect HTTP requests to HTTPS version of your website ###

If you wish to redirect the normal HTTP requests to HTTPS version of your website, add the following text to either the virtual host you wish to apply it to or to the apache.conf if you wish to apply it for all websites hosted on the server:

    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-ssl-apache-2-4-in-ubuntu/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:https://ssl.comodo.com/