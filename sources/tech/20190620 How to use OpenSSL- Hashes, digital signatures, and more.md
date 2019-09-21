[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use OpenSSL: Hashes, digital signatures, and more)
[#]: via: (https://opensource.com/article/19/6/cryptography-basics-openssl-part-2)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

How to use OpenSSL: Hashes, digital signatures, and more
======
Dig deeper into the details of cryptography with OpenSSL: Hashes,
digital signatures, digital certificates, and more
![A person working.][1]

The [first article in this series][2] introduced hashes, encryption/decryption, digital signatures, and digital certificates through the OpenSSL libraries and command-line utilities. This second article drills down into the details. Let’s begin with hashes, which are ubiquitous in computing, and consider what makes a hash function _cryptographic_.

### Cryptographic hashes

The download page for the OpenSSL source code (<https://www.openssl.org/source/>) contains a table with recent versions. Each version comes with two hash values: 160-bit SHA1 and 256-bit SHA256. These values can be used to verify that the downloaded file matches the original in the repository: The downloader recomputes the hash values locally on the downloaded file and then compares the results against the originals. Modern systems have utilities for computing such hashes. Linux, for instance, has **md5sum** and **sha256sum**. OpenSSL itself provides similar command-line utilities.

Hashes are used in many areas of computing. For example, the Bitcoin blockchain uses SHA256 hash values as block identifiers. To mine a Bitcoin is to generate a SHA256 hash value that falls below a specified threshold, which means a hash value with at least N leading zeroes. (The value of N can go up or down depending on how productive the mining is at a particular time.) As a point of interest, today’s miners are hardware clusters designed for generating SHA256 hashes in parallel. During a peak time in 2018, Bitcoin miners worldwide generated about 75 million terahashes per second—yet another incomprehensible number.

Network protocols use hash values as well—often under the name **checksum**—to support message integrity; that is, to assure that a received message is the same as the one sent. The message sender computes the message’s checksum and sends the results along with the message. The receiver recomputes the checksum when the message arrives. If the sent and the recomputed checksum do not match, then something happened to the message in transit, or to the sent checksum, or to both. In this case, the message and its checksum should be sent again, or at least an error condition should be raised. (Low-level network protocols such as UDP do not bother with checksums.)

Other examples of hashes are familiar. Consider a website that requires users to authenticate with a password, which the user enters in their browser. Their password is then sent, encrypted, from the browser to the server via an HTTPS connection to the server. Once the password arrives at the server, it's decrypted for a database table lookup.

What should be stored in this lookup table? Storing the passwords themselves is risky. It’s far less risky is to store a hash generated from a password, perhaps with some _salt_ (extra bits) added to taste before the hash value is computed. Your password may be sent to the web server, but the site can assure you that the password is not stored there.

Hash values also occur in various areas of security. For example, hash-based message authentication code ([HMAC][3]) uses a hash value and a secret cryptographic key to authenticate a message sent over a network. HMAC codes, which are lightweight and easy to use in programs, are popular in web services. An X509 digital certificate includes a hash value known as the _fingerprint_, which can facilitate certificate verification. An in-memory truststore could be implemented as a lookup table keyed on such fingerprints—as a _hash map_, which supports constant-time lookups. The fingerprint from an incoming certificate can be compared against the truststore keys for a match.

What special property should a _cryptographic hash function_ have? It should be _one-way_, which means very difficult to invert. A cryptographic hash function should be relatively straightforward to compute, but computing its inverse—the function that maps the hash value back to the input bitstring—should be computationally intractable. Here is a depiction, with **chf** as a cryptographic hash function and my password **foobar** as the sample input:


```
        +---+
foobar—&gt;|chf|—&gt;hash value ## straightforward
        +--–+
```

By contrast, the inverse operation is infeasible:


```
            +-----------+
hash value—&gt;|chf inverse|—&gt;foobar ## intractable
            +-----------+
```

Recall, for example, the SHA256 hash function. For an input bitstring of any length N &gt; 0, this function generates a fixed-length hash value of 256 bits; hence, this hash value does not reveal even the input bitstring’s length N, let alone the value of each bit in the string. By the way, SHA256 is not susceptible to a [_length extension attack_][4]. The only effective way to reverse engineer a computed SHA256 hash value back to the input bitstring is through a brute-force search, which means trying every possible input bitstring until a match with the target hash value is found. Such a search is infeasible on a sound cryptographic hash function such as SHA256.

Now, a final review point is in order. Cryptographic hash values are statistically rather than unconditionally unique, which means that it is unlikely but not impossible for two different input bitstrings to yield the same hash value—a _collision_. The [_birthday problem_][5] offers a nicely counter-intuitive example of collisions. There is extensive research on various hash algorithms’ _collision resistance_. For example, MD5 (128-bit hash values) has a breakdown in collision resistance after roughly 221 hashes. For SHA1 (160-bit hash values), the breakdown starts at about 261 hashes.

A good estimate of the breakdown in collision resistance for SHA256 is not yet in hand. This fact is not surprising. SHA256 has a range of 2256 distinct hash values, a number whose decimal representation has a whopping 78 digits! So, can collisions occur with SHA256 hashing? Of course, but they are extremely unlikely.

In the command-line examples that follow, two input files are used as bitstring sources: **hashIn1.txt** and **hashIn2.txt**. The first file contains **abc** and the second contains **1a2b3c**.

These files contain text for readability, but binary files could be used instead.

Using the Linux **sha256sum** utility on these two files at the command line—with the percent sign (**%**) as the prompt—produces the following hash values (in hex):


```
% sha256sum hashIn1.txt
9e83e05bbf9b5db17ac0deec3b7ce6cba983f6dc50531c7a919f28d5fb3696c3 hashIn1.txt

% sha256sum hashIn2.txt
3eaac518777682bf4e8840dd012c0b104c2e16009083877675f00e995906ed13 hashIn2.txt
```

The OpenSSL hashing counterparts yield the same results, as expected:


```
% openssl dgst -sha256 hashIn1.txt
SHA256(hashIn1.txt)= 9e83e05bbf9b5db17ac0deec3b7ce6cba983f6dc50531c7a919f28d5fb3696c3

% openssl dgst -sha256 hashIn2.txt
SHA256(hashIn2.txt)= 3eaac518777682bf4e8840dd012c0b104c2e16009083877675f00e995906ed13
```

This examination of cryptographic hash functions sets up a closer look at digital signatures and their relationship to key pairs.

### Digital signatures

As the name suggests, a digital signature can be attached to a document or some other electronic artifact (e.g., a program) to vouch for its authenticity. Such a signature is thus analogous to a hand-written signature on a paper document. To verify the digital signature is to confirm two things. First, that the vouched-for artifact has not changed since the signature was attached because it is based, in part, on a cryptographic _hash_ of the document. Second, that the signature belongs to the person (e.g., Alice) who alone has access to the private key in a pair. By the way, digitally signing code (source or compiled) has become a common practice among programmers.

Let’s walk through how a digital signature is created. As mentioned before, there is no digital signature without a public and private key pair. When using OpenSSL to create these keys, there are two separate commands: one to create a private key, and another to extract the matching public key from the private one. These key pairs are encoded in base64, and their sizes can be specified during this process.

The private key consists of numeric values, two of which (a _modulus_ and an _exponent_) make up the public key. Although the private key file contains the public key, the extracted public key does _not_ reveal the value of the corresponding private key.

The resulting file with the private key thus contains the full key pair. Extracting the public key into its own file is practical because the two keys have distinct uses, but this extraction also minimizes the danger that the private key might be publicized by accident.

Next, the pair’s private key is used to process a hash value for the target artifact (e.g., an email), thereby creating the signature. On the other end, the receiver’s system uses the pair’s public key to verify the signature attached to the artifact.

Now for an example. To begin, generate a 2048-bit RSA key pair with OpenSSL:

**openssl genpkey -out privkey.pem -algorithm rsa 2048**

We can drop the **-algorithm rsa** flag in this example because **genpkey** defaults to the type RSA. The file’s name (**privkey.pem**) is arbitrary, but the Privacy Enhanced Mail (PEM) extension **pem** is customary for the default PEM format. (OpenSSL has commands to convert among formats if needed.) If a larger key size (e.g., 4096) is in order, then the last argument of **2048** could be changed to **4096**. These sizes are always powers of two.

Here’s a slice of the resulting **privkey.pem** file, which is in base64:


```
\-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANnlAh4jSKgcNj/Z
JF4J4WdhkljP2R+TXVGuKVRtPkGAiLWE4BDbgsyKVLfs2EdjKL1U+/qtfhYsqhkK
…
\-----END PRIVATE KEY-----
```

The next command then extracts the pair’s public key from the private one:

**openssl rsa -in privkey.pem -outform PEM -pubout -out pubkey.pem**

The resulting **pubkey.pem** file is small enough to show here in full:


```
\-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDZ5QIeI0ioHDY/2SReCeFnYZJY
z9kfk11RrilUbT5BgIi1hOAQ24LMilS37NhHYyi9VPv6rX4WLKoZCmkeYaWk/TR5
4nbH1E/AkniwRoXpeh5VncwWMuMsL5qPWGY8fuuTE27GhwqBiKQGBOmU+MYlZonO
O0xnAKpAvysMy7G7qQIDAQAB
\-----END PUBLIC KEY-----
```

Now, with the key pair at hand, the digital signing is easy—in this case with the source file **client.c** as the artifact to be signed:

**openssl dgst -sha256 -sign privkey.pem -out sign.sha256 client.c**

The digest for the **client.c** source file is SHA256, and the private key resides in the **privkey.pem** file created earlier. The resulting binary signature file is **sign.sha256**, an arbitrary name. To get a readable (if base64) version of this file, the follow-up command is:

**openssl enc -base64 -in sign.sha256 -out sign.sha256.base64**

The file **sign.sha256.base64** now contains:


```
h+e+3UPx++KKSlWKIk34fQ1g91XKHOGFRmjc0ZHPEyyjP6/lJ05SfjpAJxAPm075
VNfFwysvqRGmL0jkp/TTdwnDTwt756Ej4X3OwAVeYM7i5DCcjVsQf5+h7JycHKlM
o/Jd3kUIWUkZ8+Lk0ZwzNzhKJu6LM5KWtL+MhJ2DpVc=
```

Or, the executable file **client** could be signed instead, and the resulting base64-encoded signature would differ as expected:


```
VMVImPgVLKHxVBapJ8DgLNJUKb98GbXgehRPD8o0ImADhLqlEKVy0HKRm/51m9IX
xRAN7DoL4Q3uuVmWWi749Vampong/uT5qjgVNTnRt9jON112fzchgEoMb8CHNsCT
XIMdyaPtnJZdLALw6rwMM55MoLamSc6M/MV1OrJnk/g=
```

The final step in this process is to verify the digital signature with the public key. The hash used to sign the artifact (in this case, the executable **client** program) should be recomputed as an essential step in the verification since the verification process should indicate whether the artifact has changed since being signed.

There are two OpenSSL commands used for this purpose. The first decodes the base64 signature:

**openssl enc -base64 -d -in sign.sha256.base64 -out sign.sha256**

The second verifies the signature:

**openssl dgst -sha256 -verify pubkey.pem -signature sign.sha256 client**

The output from this second command is, as it should be:


```
`Verified OK`
```

To understand what happens when verification fails, a short but useful exercise is to replace the executable **client** file in the last OpenSSL command with the source file **client.c** and then try to verify. Another exercise is to change the **client** program, however slightly, and try again.

### Digital certificates

A digital certificate brings together the pieces analyzed so far: hash values, key pairs, digital signatures, and encryption/decryption. The first step toward a production-grade certificate is to create a certificate signing request (CSR), which is then sent to a certificate authority (CA). To do this for the example with OpenSSL, run:

**openssl req -out myserver.csr -new -newkey rsa:4096 -nodes -keyout myserverkey.pem**

This example generates a CSR document and stores the document in the file **myserver.csr** (base64 text). The purpose here is this: the CSR document requests that the CA vouch for the identity associated with the specified domain name—the common name (CN) in CA-speak.

A new key pair also is generated by this command, although an existing pair could be used. Note that the use of **server** in names such as **myserver.csr** and **myserverkey.pem** hints at the typical use of digital certificates: as vouchers for the identity of a web server associated with a domain such as [www.google.com][6].

The same command, however, creates a CSR regardless of how the digital certificate might be used. It also starts an interactive question/answer session that prompts for relevant information about the domain name to link with the requester’s digital certificate. This interactive session can be short-circuited by providing the essentials as part of the command, with backslashes as continuations across line breaks. The **-subj** flag introduces the required information:


```
% openssl req -new
-newkey rsa:2048 -nodes -keyout privkeyDC.pem
-out myserver.csr
-subj "/C=US/ST=Illinois/L=Chicago/O=Faulty Consulting/OU=IT/CN=myserver.com"
```

The resulting CSR document can be inspected and verified before being sent to a CA. This process creates the digital certificate with the desired format (e.g., X509), signature, validity dates, and so on:

**openssl req -text -in myserver.csr -noout -verify**

Here’s a slice of the output:


```
verify OK
Certificate Request:
Data:
Version: 0 (0x0)
Subject: C=US, ST=Illinois, L=Chicago, O=Faulty Consulting, OU=IT, CN=myserver.com
Subject Public Key Info:
Public Key Algorithm: rsaEncryption
Public-Key: (2048 bit)
Modulus:
00:ba:36:fb:57:17:65:bc:40:30:96:1b:6e🇩🇪73:
…
Exponent: 65537 (0x10001)
Attributes:
a0:00
Signature Algorithm: sha256WithRSAEncryption
…
```

### A self-signed certificate

During the development of an HTTPS web site, it is convenient to have a digital certificate on hand without going through the CA process. A self-signed certificate fills the bill during the HTTPS handshake’s authentication phase, although any modern browser warns that such a certificate is worthless. Continuing the example, the OpenSSL command for a self-signed certificate—valid for a year and with an RSA public key—is:

**openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout myserver.pem -out myserver.crt**

The OpenSSL command below presents a readable version of the generated certificate:

**openssl x509 -in myserver.crt -text -noout**

Here’s part of the output for the self-signed certificate:


```
Certificate:
Data:
Version: 3 (0x2)
Serial Number: 13951598013130016090 (0xc19e087965a9055a)
Signature Algorithm: sha256WithRSAEncryption
Issuer: C=US, ST=Illinois, L=Chicago, O=Faulty Consulting, OU=IT, CN=myserver.com
Validity
Not Before: Apr 11 17:22:18 2019 GMT
Not After : Apr 10 17:22:18 2020 GMT
Subject: C=US, ST=Illinois, L=Chicago, O=Faulty Consulting, OU=IT, CN=myserver.com
Subject Public Key Info:
Public Key Algorithm: rsaEncryption
Public-Key: (4096 bit)
Modulus:
00:ba:36:fb:57:17:65:bc:40:30:96:1b:6e🇩🇪73:
…
Exponent: 65537 (0x10001)
X509v3 extensions:
X509v3 Subject Key Identifier:
3A:32:EF:3D:EB:DF:65:E5:A8:96:D7:D7:16:2C:1B:29:AF:46:C4:91
X509v3 Authority Key Identifier:
keyid:3A:32:EF:3D:EB:DF:65:E5:A8:96:D7:D7:16:2C:1B:29:AF:46:C4:91

        X509v3 Basic Constraints:
            CA:TRUE
Signature Algorithm: sha256WithRSAEncryption
     3a:eb:8d:09:53:3b:5c:2e:48:ed:14:ce:f9:20:01:4e:90:c9:
     ...
```

As mentioned earlier, an RSA private key contains values from which the public key is generated. However, a given public key does _not_ give away the matching private key. For an introduction to the underlying mathematics, see <https://simple.wikipedia.org/wiki/RSA_algorithm>.

There is an important correspondence between a digital certificate and the key pair used to generate the certificate, even if the certificate is only self-signed:

  * The digital certificate contains the _exponent_ and _modulus_ values that make up the public key. These values are part of the key pair in the originally-generated PEM file, in this case, the file **myserver.pem**.
  * The exponent is almost always 65,537 (as in this case) and so can be ignored.
  * The modulus from the key pair should match the modulus from the digital certificate.



The modulus is a large value and, for readability, can be hashed. Here are two OpenSSL commands that check for the same modulus, thereby confirming that the digital certificate is based upon the key pair in the PEM file:


```
% openssl x509 -noout -modulus -in myserver.crt | openssl sha1 ## modulus from CRT
(stdin)= 364d21d5e53a59d482395b1885aa2c3a5d2e3769

% openssl rsa -noout -modulus -in myserver.pem | openssl sha1 ## modulus from PEM
(stdin)= 364d21d5e53a59d482395b1885aa2c3a5d2e3769
```

The resulting hash values match, thereby confirming that the digital certificate is based upon the specified key pair.

### Back to the key distribution problem

Let’s return to an issue raised at the end of Part 1: the TLS handshake between the **client** program and the Google web server. There are various handshake protocols, and even the Diffie-Hellman version at work in the **client** example offers wiggle room. Nonetheless, the **client** example follows a common pattern.

To start, during the TLS handshake, the **client** program and the web server agree on a cipher suite, which consists of the algorithms to use. In this case, the suite is **ECDHE-RSA-AES128-GCM-SHA256**.

The two elements of interest now are the RSA key-pair algorithm and the AES128 block cipher used for encrypting and decrypting messages if the handshake succeeds. Regarding encryption/decryption, this process comes in two flavors: symmetric and asymmetric. In the symmetric flavor, the _same_ key is used to encrypt and decrypt, which raises the _key distribution problem_ in the first place: How is the key to be distributed securely to both parties? In the asymmetric flavor, one key is used to encrypt (in this case, the RSA public key) but a different key is used to decrypt (in this case, the RSA private key from the same pair).

The **client** program has the Google web server’s public key from an authenticating certificate, and the web server has the private key from the same pair. Accordingly, the **client** program can send an encrypted message to the web server, which alone can readily decrypt this message.

In the TLS situation, the symmetric approach has two significant advantages:

  * In the interaction between the **client** program and the Google web server, the authentication is one-way. The Google web server sends three certificates to the **client** program, but the **client** program does not send a certificate to the web server; hence, the web server has no public key from the client and can’t encrypt messages to the client.
  * Symmetric encryption/decryption with AES128 is nearly a _thousand times faster_ than the asymmetric alternative using RSA keys.



The TLS handshake combines the two flavors of encryption/decryption in a clever way. During the handshake, the **client** program generates random bits known as the pre-master secret (PMS). Then the **client** program encrypts the PMS with the server’s public key and sends the encrypted PMS to the server, which in turn decrypts the PMS message with its private key from the RSA pair:


```
              +-------------------+ encrypted PMS  +--------------------+
client PMS---&gt;|server’s public key|---------------&gt;|server’s private key|---&gt;server PMS
              +-------------------+                +--------------------+
```

At the end of this process, the **client** program and the Google web server now have the same PMS bits. Each side uses these bits to generate a _master secret_ and, in short order, a symmetric encryption/decryption key known as the _session key_. There are now two distinct but identical session keys, one on each side of the connection. In the **client** example, the session key is of the AES128 variety. Once generated on both the **client** program’s and Google web server’s sides, the session key on each side keeps the conversation between the two sides confidential. A handshake protocol such as Diffie-Hellman allows the entire PMS process to be repeated if either side (e.g., the **client** program) or the other (in this case, the Google web server) calls for a restart of the handshake.

### Wrapping up

The OpenSSL operations illustrated at the command line are available, too, through the API for the underlying libraries. These two articles have emphasized the utilities to keep the examples short and to focus on the cryptographic topics. If you have an interest in security issues, OpenSSL is a fine place to start—and to stay.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/cryptography-basics-openssl-part-2

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003784_02_os.comcareers_os_rh2x.png?itok=jbRfXinl (A person working.)
[2]: https://opensource.com/article/19/6/cryptography-basics-openssl-part-1
[3]: https://en.wikipedia.org/wiki/HMAC
[4]: https://en.wikipedia.org/wiki/Length_extension_attack
[5]: https://en.wikipedia.org/wiki/Birthday_problem
[6]: http://www.google.com
