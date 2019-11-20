[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How internet security works: TLS, SSL, and CA)
[#]: via: (https://opensource.com/article/19/11/internet-security-tls-ssl-certificate-authority)
[#]: author: (Bryant Son https://opensource.com/users/brson)

How internet security works: TLS, SSL, and CA
======
What's behind that lock icon in your web browser?
![Lock][1]

Multiple times every day, you visit websites that ask you to log in with your username or email address and password. Banking websites, social networking sites, email services, e-commerce sites, and news sites are just a handful of the types of sites that use this mechanism.

Every time you sign into one of these sites, you are, in essence, saying, "yes, I trust this website, so I am willing to share my personal information with it." This data may include your name, gender, physical address, email address, and sometimes even credit card information.

But how do you know you can trust a particular website? To put this a different way, what is the website doing to secure your transaction so that you can trust it?

This article aims to demystify the mechanisms that make a website secure. I will start by discussing the web protocols HTTP and HTTPS and the concept of Transport Layer Security (TLS), which is one of the cryptographic protocols in the internet protocol's (IP) layers. Then, I will explain certificate authorities (CAs) and self-signed certificates and how they can help secure a website. Finally, I will introduce some open source tools you can use to create and manage certificates.

## Securing routes through HTTPS

The easiest way to understand a secured website is to see it in action. Fortunately, it is far easier to find a secured website than an unsecured website on the internet today. But, since you are already on Opensource.com, I'll use it as an example. No matter what browser you're using, you should see an icon that looks like a lock next to the address bar. Click on the lock icon, and you should see something similar to this.

![Certificate information][2]

By default, a website is not secure if it uses the HTTP protocol. Adding a certificate configured through the website host to the route can transform the website from an unsecured HTTP site to a secured HTTPS site. The lock icon usually indicates that the site is secured through HTTPS.

Click on Certificate to see the site's CA. Depending on your browser, you may need to download the certificate to see it.

![Certificate information][3]

Here, you can learn something about Opensource.com's certificate. For example, you can see that the CA is DigiCert, and it is given to Red Hat under the name Opensource.com.

This certificate information enables the end user to check that the website is safe to visit.

> WARNING: If you do not see a certificate sign on a website—or if you see a sign that indicates that the website is not secure—please do not log in or do any activity that requires your private data. Doing so is quite dangerous!

If you see a warning sign, which is rare for most publicly facing websites, it usually means that the certificate is expired or uses a self-signed certificate instead of one issued through a trusted CA. Before we get into those topics, I want to explain the TLS and SSL.

## Internet protocols with TLS and SSL

TLS is the current generation of the old Secure Socket Layer (SSL) protocol. The best way to understand this is by examining the different layers of the IP.

![IP layers][4]

There are six layers that make up the internet as we know it today: physical, data, network, transport, security, and application. The physical layer is the base foundation, and it is closest to the actual hardware. The application layer is the most abstract layer and the one closest to the end user. The security layer can be considered a part of the application layer, and TLS and SSL, which are the cryptographic protocols designed to provide communications security over a computer network, are in the security layer.

This process ensures that communication is secure and encrypted when an end user consumes the service.

## Certificate authorities and self-signed certificates

A CA is a trusted organization that can issue a digital certificate.

TLS and SSL can make a connection secure, but the encryption mechanism needs a way to validate it; this is the SSL/TLS certificate. TLS uses a mechanism called asymmetric encryption, which i
