[#]: subject: "Manual Renewal of SSL Certificates: A Simple Guide"
[#]: via: "https://www.opensourceforu.com/2022/07/manual-renewal-of-ssl-certificates-a-simple-guide/"
[#]: author: "Jitendra Bhojwani https://www.opensourceforu.com/author/jitendra-bhojwani/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manual Renewal of SSL Certificates: A Simple Guide
======

![SSL-Certificates-Featured-image][1]

*In the April 2022 issue of this magazine, we read about the different types of SSL certificates and their applications. This article explains how to manually renew an existing SSL certificate, so that it stays updated with the latest security requirements.*

When visitors interact with your website and share critical details like credit card numbers, they trust that their information has been secured against misuse. So it becomes your responsibility to respect that trust and offer complete protection to all the visitors on your site. Failing to do so can not only cost you the loyalty of customers but may also put you in a legal soup. There have been many instances where websites that couldn’t protect their customers’ data against leakage, theft or misuse were forced to pay hefty penalties, and also lost their reputation.

#### How does an SSL certificate secure customers’ data?

One of the best ways to protect sensitive customer information is to secure your site with an SSL (secure sockets layer) certificate. Without going into the technical nitty-gritties, an SSL certificate encrypts the communication between a Web server and the visitor’s browser, and thus makes it technically impossible for hackers or threat actors to steal data in transit. SSL establishes a secure handshake process to decrypt the encrypted information — a process that is too complex to be cracked by humans or even software.

#### Why do you need to update your SSL certificate?

While an SSL certificate does offer security against data theft or misuse, you need to update it periodically to ensure the most effective security against the latest threats. This article will list the step-by-step instructions for renewing your SSL certificate in the right way.

There are quite a few benefits of updating an SSL certificate:

* Timely renewal authenticates your website’s identity.
* You get updated security.
* A one-year validity promotes the healthy practice of periodically renewing/upgrading the scope of protection, thus eliminating the risks associated with outdated versions.

> Note: The best practice is to select an auto renewal option that relieves you from the stress of remembering the renewal date or manually following the related steps. |

#### A bit off topic …a pure open source way to build your own SSL certificate

Yes, it is absolutely true! With some simplified and compact steps you can actually build your own SSL certificate from scratch! While the entire process is out of the scope of this article, here are a few key open source components and tools that you can use to create your SSL certificate.

* OpenSSL: This is a highly credible tool to implement TLS and crypto libraries.
* EasyRSA: This command-line tool enables you to build PKI CA and manage it efficiently.
* CFSSL: Cloudflare has finally built a multi-purpose, multi-capability tool for PKI and TLS.
* Lemur: A fair enough TLS producer developed by Netflix.

### How to renew your SSL certificate

While the broad process of [SSL][2] renewal remains the same, there could be some minor tweaks and variations depending upon your specific SSL provider.

The renewal process follows three main steps — CSR (certificate signing request) generation, certificate activation and, finally, the certificate installation.

**Generating CSR:** For cPanel hosting panels, you can click on the Security tab and search for the *SSL/TLS* option. It will display a screen that shows a link just under the CSR option. This section facilitates new CSR generation for your desired domain name.

You will be asked detailed contact information for confirming that you are the genuine domain owner. After filling the form, you will get a CSR code that is needed for certificate reactivation.

*Activating an SSL certificate:* In your dashboard, you can see a quick overview of the SSL certificate, domains and other digital infrastructure products that you own. Click this button to start the SSL renewal process. Enter the CSR generated a while ago and confirm the accuracy of the information. You can now validate the SSL renewal process.

*Validating the SSL certificate:* You will once again be prompted to confirm domain ownership. Enter your domain-associated email. Upload a file on the Web server where the certificate needs to be installed. Validate the SSL certificate with the help of CNAME records. While there are multiple options, it is best and easiest to validate it with an email. Once you enter the domain associated email, you will get an email containing a specific link followed by another mail that comprises the new certificate file with a .*crt* extension.

*Installing the SSL certificate:* Your Web hosting provider will either give you an option for communicating with the support team for installing renewed files or provide you with the detailed instructions on how you can do it manually through your cPanel. Keep in mind that different hosts offer different options for renewal. That said, if you are a non-technical person then contacting the support team will be the best option for you.

For manual updating, visit the *SSL/TLS* section of your cPanel and find the *Manage SSL* sites option. It contains the entire domain list that you own. Corresponding to each domain name you can see the Certificate Renewal option.

In the screen next to it, enter the details in *Private Key* using the *Autofill* by *Domain* option. Under the *Certificate* option, fill the details of your .*crt file*. You are almost done. Just click the button that reads *Install Certificate*.

Along with saving the critical data and sensitive information of your users, the SSL certificate also builds trust by reaffirming that data shared on your site is secure. It can also affect your SEO profile positively as Google considers SSL certification a healthy practice. However, to continue enjoying the best security with this certificate, you need to update it periodically. This ensures that your site is fully secured against the data in transit attacks as per the latest security requirements.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/07/manual-renewal-of-ssl-certificates-a-simple-guide/

作者：[Jitendra Bhojwani][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/jitendra-bhojwani/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/SSL-Certificates-Featured-image.jpg
[2]: https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwitou7xjv_3AhWLRmwGHVZ2BWwQFnoECB0QAQ&url=https%3A%2F%2Fgithub.com%2Fopenssl%2Fopenssl&usg=AOvVaw0niwMRCpb4nN_PtJFMQwWP
