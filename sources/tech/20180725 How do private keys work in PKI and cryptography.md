pinewall translating

How do private keys work in PKI and cryptography?
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_privacy_lock.png?itok=ZWjrpFzx)

In [a previous article][1], I gave an overview of cryptography and discussed the core concepts of confidentiality (keeping data secret), integrity (protecting data from tampering), and authentication (knowing the identity of the data's source). Since authentication relates so closely to all the messiness of identity in the real world, a complex technological ecosystem has evolved around establishing that someone is who they claim to be. In this article, I'll describe in broad strokes how these systems work.

### A quick review of public key cryptography and digital signatures

Authentication in the online world relies on public key cryptography where a key has two parts: a private key kept secret by the owner and a public key shared with the world. After the public key encrypts data, only the private key can decrypt it. This feature is useful if a whistleblower wanted to establish contact with a [journalist][2], for example. More importantly for this article, a private key can be combined with a message to create a digital signature that provides integrity and authentication.

In practice, what is signed is not the actual message, but a digest of a message attained by sending the message through a cryptographic hash function. Instead of signing an entire zip file of source code, the sender signs the 256-bit [SHA-256][3] digest of that zip file and sends the zip file in the clear. Recipients independently calculate the SHA-256 digest of the file they received. They input their digest, the signature they received, and the sender's public key into a signature verification algorithm. The verification process varies depending on the encryption algorithm, and there are enough subtleties that signature verification [vulnerabilities][4] still [pop up][5] . If the verification succeeds, the file has not been modified in transit and must have originated from the sender since only the sender has the private key that created the signature.

### The missing piece of the puzzle

There's one major detail missing from this scenario. Where do we get the sender's public key? The sender could send the public key along with a message, but then we have no proof of their identity beyond their own assertion. Imagine being a bank teller and a customer walks up and says, "Hello, I'm Jane Doe, and I'd like to make a withdrawal." When you ask for identification, she points to a name tag sticker on her shirt that says "Jane Doe." Personally, I would politely turn "Jane" away.

If you already know the sender, you could meet in person and exchange public keys. If you don't, you could meet in person, examine their passport, and once you are satisfied it is authentic, accept their public key. To make the process more efficient, you could throw a [party][6], invite a bunch of people, examine all their passports, and accept all their public keys. Building off that, if you know Jane Doe and trust her (despite her unusual banking practices), Jane could go to the party, get the public keys, and give them to you. In fact, Jane could just sign the other public keys using her own private key, and then you could use [an online repository][7] of public keys, trusting the ones signed by Jane. If a person's public key is signed by multiple people you trust, then you might decide to trust that person as well (even though you don't know them). In this fashion, you can build a [web of trust][8].

But now things have gotten complicated: We need to decide on a standard way to encode a key and the identity associated with that key into a digital bundle we can sign. More properly, these digital bundles are called certificates. We'll also need tooling that can create, use, and manage these certificates. The way we solve these and other requirements is what constitutes a public key infrastructure (PKI).

### Beyond the web of trust

You can think of the web of trust as a network of people. A network with many interconnections between the people makes it easy to find a short path of trust: a social circle, for example. [GPG][9]-encrypted email relies on a web of trust, and it functions ([in theory][10]) since most of us communicate primarily with a relatively small group of friends, family, and co-workers.

In practice, the web of trust has some [significant problems][11], many of them around scaling. When the network starts to get larger and there are few connections between people, the web of trust starts to break down. If the path of trust is attenuated across a long chain of people, you face a higher chance of encountering someone who carelessly or maliciously signed a key. And if there is no path at all, you have to create one by contacting the other party and verifying their key to your satisfaction. Imagine going to an online store that you and your friends have never used. Before you establish a secure communications channel to place an order, you'd need to verify the site's public key belongs to the company and not an impostor. That vetting would entail going to a physical store, making telephone calls, or some other laborious process. Online shopping would be a lot less convenient (or a lot less secure since many people would cut corners and accept the key without verifying it).

What if the world had some exceptionally trustworthy people constantly verifying and signing keys for websites? You could just trust them, and browsing the internet would be much smoother. At a high level, that's how things work today. These "exceptionally trustworthy people" are companies called certificate authorities (CAs). When a website wants to get its public key signed, it submits a certificate signing request (CSR) to the CA.

CSRs are like stub certificates that contain a public key and an identity (in this case, the hostname of the server), but are not signed by a CA. Before signing, the CA performs some verification steps. In some cases, the CA merely verifies that the requester controls the domain for the hostname listed in the CSR (via a challenge-and-response email exchange with the address in the WHOIS entry, for example). [In other cases][12], the CA inspects legal documents, like business licenses. Once the CA is satisfied (and usually after the requester has paid a fee), it takes the data from the CSR and signs it with its own private key to create a certificate. The CA then sends the certificate to the requester. The requester installs the certificate on their site's web server, and the certificate is delivered to users when they connect over HTTPS (or any other protocol secured with [TLS][13]).

When users connect to the site, their browser looks at the certificate, checks that the hostname in the certificate is the same as the hostname it is connected to (more on this in a moment), and verifies the CA's signature. If any of these steps fail, the browser will show a warning and break off the connection. Otherwise, the browser uses the public key in the certificate to verify some signed information sent from the server to ensure that the server possesses the certificate's private key. These messages also serve as steps in one of several algorithms used to establish a shared secret key that will encrypt subsequent messages. Key exchange algorithms are beyond the scope of this article, but there's a good discussion of one of them in [this video][14].

### Creating trust

You're probably wondering, "If the CA's private key signs a certificate, that means to verify a certificate we need the CA's public key. Where does it come from and who signs it?" The answer is the CA signs for itself! A certificate can be signed using the private key associated with the same certificate's public key. These certificates are said to be self-signed; they are the PKI equivalent of saying, "Trust me." (People often say, as a form of shorthand, that a certificate has signed something even though it's the private key—which isn't in the certificate at all—doing the actual signing.)

By adhering to policies established by [web browser][15] and [operating system][16] vendors, CAs demonstrate they are trustworthy enough to be placed into a group of self-signed certificates built into the browser or operating system. These certificates are called trust anchors or root CA certificates, and they are placed in a root certificate store where they are trusted implicitly.

A CA can also issue a certificate endowed with the ability to act as a CA itself. In this way, they can create a chain of certificates. To verify the chain, a program starts at the trust anchor and verifies (among other things) the signature on the next certificate using the public key of the current certificate. It continues down the chain, verifying each link until it reaches the end. If there are no problems along the way, a chain of trust is established. When a website pays a CA to sign a certificate for it, they are paying for the privilege of being placed at the end of that chain. CAs mark certificates sold to websites as not being allowed to sign subsequent certificates; this is so they can terminate the chain of trust at the appropriate place.

Why would a chain ever be more than two links long? After all, a site just needs its certificate signed by a CA's root certificate. In practice, CAs create intermediate CA certificates for convenience (among other reasons). The private keys for a CA's root certificates are so valuable that they reside in a specialized device, a [hardware security module][17] (HSM), that requires multiple people to unlock it, is completely offline, and is kept inside a [vault][18] wired with alarms and cameras.

CAB Forum, the association that governs CAs, [requires][19] any interaction with a CA's root certificate to be performed directly by a human. Issuing certificates for dozens of websites a day would be tedious if every certificate request required an employee to place the request on secure media, enter a vault, unlock the HSM with a coworker, sign the certificate, exit the vault, and then copy the signed certificate off the media. Instead, CAs create internal, intermediate CAs used to sign certificates automatically.

You can see this chain in Firefox by clicking the lock icon in the URL bar, opening up the page information, and clicking the "View Certificate" button on the "Security" tab. As of this writing, [opensource.com][20] had the following chain:
```
DigiCert High Assurance EV Root CA

    DigiCert SHA2 High Assurance Server CA

        opensource.com

```

### The man in the middle

I mentioned earlier that a browser needs to check that the hostname in the certificate is the same as the hostname it connected to. Why? The answer has to do with what's called a [man-in-the-middle (MITM) attack][21]. These are [network attacks][22] that allow an attacker to insert itself between a client and a server, masquerading as the server to the client and vice versa. If the traffic is over HTTPS, it's encrypted and eavesdropping is fruitless. Instead, the attacker can create a proxy that will accept HTTPS connections from the victim, decrypt the information, and then form an HTTPS connection with the original destination. To create the phony HTTPS connection, the proxy must return a certificate that our attacker has the private key for. Our attacker could generate self-signed certificates, but the victim's browser won't trust anything not signed by a CA's root certificate in the browser's root certificate store. What if instead, the attacker uses a certificate signed by a trusted CA for a domain it owns?

Imagine we're back to our job in the bank. A man walks in and asks to withdraw money from Jane Doe's account. When asked for identification, the man hands us a valid driver's license for Joe Smith. We would be rightfully fired if we allowed the transaction to continue. If a browser detects a mismatch between the certificate hostname and the connection hostname, it will show a warning that says something like "Your connection is not secure" and an option to show additional details. In Firefox, this error is called SSL_ERROR_BAD_CERT_DOMAIN.

If there's one lesson I want you to remember from this article, it's: If you see these warnings, **do not disregard them**! They signal that the site is either configured so erroneously that you shouldn't use it or that you're the potential victim of a MITM attack.

### Final thoughts

I've only scratched the surface of the PKI world in this article, but I hope that I've given you a map that you can use to guide your further explorations. Cryptography and PKI are fractal-like in their beauty and complexity. The further you dive in, the more there is to discover.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/private-keys

作者：[Alex Wood][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/awood
[1]:https://opensource.com/article/18/5/cryptography-pki
[2]:https://theintercept.com/2014/10/28/smuggling-snowden-secrets/
[3]:https://en.wikipedia.org/wiki/SHA-2
[4]:https://www.ietf.org/mail-archive/web/openpgp/current/msg00999.html
[5]:https://www.imperialviolet.org/2014/09/26/pkcs1.html
[6]:https://en.wikipedia.org/wiki/Key_signing_party
[7]:https://en.wikipedia.org/wiki/Key_server_(cryptographic)
[8]:https://en.wikipedia.org/wiki/Web_of_trust
[9]:https://www.gnupg.org/gph/en/manual/x547.html
[10]:https://blog.cryptographyengineering.com/2014/08/13/whats-matter-with-pgp/
[11]:https://lists.torproject.org/pipermail/tor-talk/2013-September/030235.html
[12]:https://en.wikipedia.org/wiki/Extended_Validation_Certificate
[13]:https://en.wikipedia.org/wiki/Transport_Layer_Security
[14]:https://www.youtube.com/watch?v=YEBfamv-_do
[15]:https://www.mozilla.org/en-US/about/governance/policies/security-group/certs/policy/
[16]:https://technet.microsoft.com/en-us/library/cc751157.aspx
[17]:https://en.wikipedia.org/wiki/Hardware_security_module
[18]:https://arstechnica.com/information-technology/2012/11/inside-symantecs-ssl-certificate-vault/
[19]:https://cabforum.org/baseline-requirements-documents/
[20]:http://opensource.com
[21]:https://en.wikipedia.org/wiki/Man-in-the-middle_attack
[22]:http://www.shortestpathfirst.net/2010/11/18/man-in-the-middle-mitm-attacks-explained-arp-poisoining/
