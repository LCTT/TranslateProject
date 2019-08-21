[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage business documents with OpenAS2 on Fedora)
[#]: via: (https://fedoramagazine.org/manage-business-documents-with-openas2-on-fedora/)
[#]: author: (Stuart D Gathman https://fedoramagazine.org/author/sdgathman/)

Manage business documents with OpenAS2 on Fedora
======

![][1]

Business documents often require special handling. Enter Electronic Document Interchange, or **EDI**. EDI is more than simply transferring files using email or http (or ftp), because these are documents like orders and invoices. When you send an invoice, you want to be sure that:

1\. It goes to the right destination, and is not intercepted by competitors.
2\. Your invoice cannot be forged by a 3rd party.
3\. Your customer can’t claim in court that they never got the invoice.

The first two goals can be accomplished by HTTPS or email with S/MIME, and in some situations, a simple HTTPS POST to a web API is sufficient. What EDI adds is the last part.

This article does not cover the messy topic of formats for the files exchanged. Even when using a standardized format like ANSI or EDIFACT, it is ultimately up to the business partners. It is not uncommon for business partners to use an ad-hoc CSV file format. This article shows you how to configure Fedora to send and receive in an EDI setup.

### Centralized EDI

The traditional solution is to use a Value Added Network, or **VAN**. The VAN is a central hub that transfers documents between their customers. Most importantly, it keeps a secure record of the documents exchanged that can be used as evidence in disputes. The VAN can use different transfer protocols for each of its customers

### AS Protocols and MDN

The AS protocols are a specification for adding a digital signature with optional encryption to an electronic document. What it adds over HTTPS or S/MIME is the Message Disposition Notification, or **MDN**. The MDN is a signed and dated response that says, in essence, “We got your invoice.” It uses a secure hash to identify the specific document received. This addresses point #3 without involving a third party.

The [AS2 protocol][2] uses HTTP or HTTPS for transport. Other AS protocols target [FTP][3] and [SMTP][4]. AS2 is used by companies big and small to avoid depending on (and paying) a VAN.

### OpenAS2

OpenAS2 is an open source Java implemention of the AS2 protocol. It is available in Fedora since 28, and installed with:

```
$ sudo dnf install openas2
$ cd /etc/openas2
```

Configuration is done with a text editor, and the config files are in XML. The first order of business before starting OpenAS2 is to change the factory passwords.

Edit _/etc/openas2/config.xml_ and search for _ChangeMe_. Change those passwords. The default password on the certificate store is _testas2_ , but that doesn’t matter much as anyone who can read the certificate store can read _config.xml_ and get the password.

### What to share with AS2 partners

There are 3 things you will exchange with an AS2 peer.

#### AS2 ID

Don’t bother looking up the official AS2 standard for legal AS2 IDs. While OpenAS2 implements the standard, your partners will likely be using a proprietary product which doesn’t. While AS2 allows much longer IDs, many implementations break with more than 16 characters. Using otherwise legal AS2 ID chars like ‘:’ that can appear as path separators on a proprietary OS is also a problem. Restrict your AS2 ID to upper and lower case alpha, digits, and ‘_’ with no more than 16 characters.

#### SSL certificate

For real use, you will want to generate a certificate with SHA256 and RSA. OpenAS2 ships with two factory certs to play with. Don’t use these for anything real, obviously. The certificate file is in PKCS12 format. Java ships with _keytool_ which can maintain your PKCS12 “keystore,” as Java calls it. This article skips using _openssl_ to generate keys and certificates. Simply note that _sudo keytool -list -keystore as2_certs.p12_ will list the two factory practice certs.

#### AS2 URL

This is an HTTP URL that will access your OpenAS2 instance. HTTPS is also supported, but is redundant. To use it you have to uncomment the https module configuration in _config.xml_ , and supply a certificate signed by a public CA. This requires another article and is entirely unnecessary here.

By default, OpenAS2 listens on 10080 for HTTP and 10443 for HTTPS. OpenAS2 can talk to itself, so it ships with two partnerships using _<http://localhost:10080>_ as the AS2 URL. If you don’t find this a convincing demo, and can install a second instance (on a VM, for instance), you can use private IPs for the AS2 URLs. Or install [Cjdns][5] to get IPv6 mesh addresses that can be used anywhere, resulting in AS2 URLs like _http://[fcbf:fc54:e597:7354:8250:2b2e:95e6:d6ba]:10080_.

Most businesses will also want a list of IPs to add to their firewall. This is actually [bad practice][6]. An AS2 server has the same security risk as a web server, meaning you should isolate it in a VM or container. Also, the difficulty of keeping mutual lists of IPs up to date grows with the list of partners. The AS2 server rejects requests not signed by a configured partner.

### OpenAS2 Partners

With that in mind, open _partnerships.xml_ in your editor. At the top is a list of “partners.” Each partner has a name (referenced by the partnerships below as “sender” or “receiver”), AS2 ID, certificate, and email. You need a partner definition for yourself and those you exchange documents with. You can define multiple partners for yourself. OpenAS2 ships with two partners, OpenAS2A and OpenAS2B, which you’ll use to send a test document.

### OpenAS2 Partnerships

Next is a list of “partnerships,” one for each direction. Each partnership configuration includes the sender, receiver, and the AS2 URL used to send the documents. By default, partnerships use synchronous MDN. The MDN is returned on the same HTTP transaction. You could uncomment the _as2_receipt_option_ for asynchronous MDN, which is sent some time later. Use synchronous MDN whenever possible, as tracking pending MDNs adds complexity to your application.

The other partnership options select encryption, signature hash, and other protocol options. A fully implemented AS2 receiver can handle any combination of options, but AS2 partners may have incomplete implementations or policy requirements. For example, DES3 is a comparatively weak encryption algorithm, and may not be acceptable. It is the default because it is almost universally implemented.

If you went to the trouble to set up a second physical or virtual machine for this test, designate one as OpenAS2A and the other as OpenAS2B. Modify the _as2_url_ on the OpenAS2A-to-OpenAS2B partnership to use the IP (or hostname) of OpenAS2B, and vice versa for the OpenAS2B-to-OpenAS2A partnership. Unless they are using the FedoraWorkstation firewall profile, on both machines you’ll need:

```
# sudo firewall-cmd --zone=public --add-port=10080/tcp
```

Now start the _openas2_ service (on both machines if needed):

```
# sudo systemctl start openas2
```

### Resetting the MDN password

This initializes the MDN log database with the factory password, not the one you changed it to. This is a packaging bug to be fixed in the next release. To avoid frustration, here’s how to change the h2 database password:

```
$ sudo systemctl stop openas2
$ cat >h2passwd <<'DONE'
#!/bin/bash
AS2DIR="/var/lib/openas2"
java -cp "$AS2DIR"/lib/h2* org.h2.tools.Shell \
     -url jdbc:h2:"$AS2DIR"/db/openas2     \
     -user sa -password "$1" <<EOF
alter user sa set password '$2';
exit
EOF
DONE
$ sudo sh h2passwd ChangeMe yournewpasswordsetabove
$ sudo systemctl start openas2
```

### Testing the setup

With that out of the way, let’s send a document. Assuming you are on OpenAS2A machine:

```
$ cat >testdoc <<'DONE'
This is not a real EDI format, but is nevertheless a document.
DONE
$ sudo chown openas2 testdoc
$ sudo mv testdoc /var/spool/openas2/toOpenAS2B
$ sudo journalctl -f -u openas2
... log output of sending file, Control-C to stop following log
^C
```

OpenAS2 does not send a document until it is writable by the _openas2_ user or group. As a consequence, your actual business application will copy, or generate in place, the document. Then it changes the group or permissions to send it on its way, to avoid sending a partial document.

Now, on the OpenAS2B machine, _/var/spool/openas2/OpenAS2A_OID-OpenAS2B_OID/inbox_ shows the message received. That should get you started!

* * *

_Photo by _[ _Beatriz Pérez Moya_][7]_ on _[_Unsplash_][8]_._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/manage-business-documents-with-openas2-on-fedora/

作者：[Stuart D Gathman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sdgathman/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/05/openas2-816x345.jpg
[2]: https://en.wikipedia.org/wiki/AS2
[3]: https://en.wikipedia.org/wiki/AS3_(networking)
[4]: https://en.wikipedia.org/wiki/AS1_(networking)
[5]: https://fedoramagazine.org/decentralize-common-fedora-apps-cjdns/
[6]: https://www.ld.com/as2-part-2-best-practices/
[7]: https://unsplash.com/photos/XN4T2PVUUgk?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/documents?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
