[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with OpenSSL: Cryptography basics)
[#]: via: (https://opensource.com/article/19/6/cryptography-basics-openssl-part-1)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu/users/akritiko/users/clhermansen)

Getting started with OpenSSL: Cryptography basics
======
Need a primer on cryptography basics, especially regarding OpenSSL? Read
on.
![A lock on the side of a building][1]

This article is the first of two on cryptography basics using [OpenSSL][2], a production-grade library and toolkit popular on Linux and other systems. (To install the most recent version of OpenSSL, see [here][3].) OpenSSL utilities are available at the command line, and programs can call functions from the OpenSSL libraries. The sample program for this article is in C, the source language for the OpenSSL libraries.

The two articles in this series cover—collectively—cryptographic hashes, digital signatures, encryption and decryption, and digital certificates. You can find the code and command-line examples in a ZIP file from [my website][4].

Let’s start with a review of the SSL in the OpenSSL name.

### A quick history

[Secure Socket Layer (SSL)][5] is a cryptographic protocol that [Netscape][6] released in 1995. This protocol layer can sit atop HTTP, thereby providing the _S_ for _secure_ in HTTPS. The SSL protocol provides various security services, including two that are central in HTTPS:

  * Peer authentication (aka mutual challenge): Each side of a connection authenticates the identity of the other side. If Alice and Bob are to exchange messages over SSL, then each first authenticates the identity of the other.
  * Confidentiality: A sender encrypts messages before sending these over a channel. The receiver then decrypts each received message. This process safeguards network conversations. Even if eavesdropper Eve intercepts an encrypted message from Alice to Bob (a _man-in-the-middle_ attack), Eve finds it computationally infeasible to decrypt this message.



These two key SSL services, in turn, are tied to others that get less attention. For example, SSL supports message integrity, which assures that a received message is the same as the one sent. This feature is implemented with hash functions, which likewise come with the OpenSSL toolkit.

SSL is versioned (e.g., SSLv2 and SSLv3), and in 1999 Transport Layer Security (TLS) emerged as a similar protocol based upon SSLv3. TLSv1 and SSLv3 are alike, but not enough so to work together. Nonetheless, it is common to refer to SSL/TLS as if they are one and the same protocol. For example, OpenSSL functions often have SSL in the name even when TLS rather than SSL is in play. Furthermore, calling OpenSSL command-line utilities begins with the term **openssl**.

The documentation for OpenSSL is spotty beyond the **man** pages, which become unwieldy given how big the OpenSSL toolkit is. Command-line and code examples are one way to bring the main topics into focus together. Let’s start with a familiar example—accessing a web site with HTTPS—and use this example to pick apart the cryptographic pieces of interest.

### An HTTPS client

The **client** program shown here connects over HTTPS to Google:


```
/* compilation: gcc -o client client.c -lssl -lcrypto */

#include &lt;stdio.h&gt;

#include &lt;stdlib.h&gt;

#include &lt;openssl/bio.h&gt; /* BasicInput/Output streams */

#include &lt;openssl/err.h&gt; /* errors */

#include &lt;openssl/ssl.h&gt; /* core library */

#define BuffSize 1024

void report_and_exit(const char* msg) {
  [perror][7](msg);
  ERR_print_errors_fp(stderr);
  [exit][8](-1);
}

void init_ssl() {
  SSL_load_error_strings();
  SSL_library_init();
}

void cleanup(SSL_CTX* ctx, BIO* bio) {
  SSL_CTX_free(ctx);
  BIO_free_all(bio);
}

void secure_connect(const char* hostname) {
  char name[BuffSize];
  char request[BuffSize];
  char response[BuffSize];

  const SSL_METHOD* method = TLSv1_2_client_method();
  if (NULL == method) report_and_exit("TLSv1_2_client_method...");

  SSL_CTX* ctx = SSL_CTX_new(method);
  if (NULL == ctx) report_and_exit("SSL_CTX_new...");

  BIO* bio = BIO_new_ssl_connect(ctx);
  if (NULL == bio) report_and_exit("BIO_new_ssl_connect...");

  SSL* ssl = NULL;

  /* link bio channel, SSL session, and server endpoint */

  [sprintf][9](name, "%s:%s", hostname, "https");
  BIO_get_ssl(bio, &amp;ssl); /* session */
  SSL_set_mode(ssl, SSL_MODE_AUTO_RETRY); /* robustness */
  BIO_set_conn_hostname(bio, name); /* prepare to connect */

  /* try to connect */
  if (BIO_do_connect(bio) &lt;= 0) {
    cleanup(ctx, bio);
    report_and_exit("BIO_do_connect...");
  }

  /* verify truststore, check cert */
  if (!SSL_CTX_load_verify_locations(ctx,
                                      "/etc/ssl/certs/ca-certificates.crt", /* truststore */
                                      "/etc/ssl/certs/")) /* more truststore */
    report_and_exit("SSL_CTX_load_verify_locations...");

  long verify_flag = SSL_get_verify_result(ssl);
  if (verify_flag != X509_V_OK)
    [fprintf][10](stderr,
            "##### Certificate verification error (%i) but continuing...\n",
            (int) verify_flag);

  /* now fetch the homepage as sample data */
  [sprintf][9](request,
          "GET / HTTP/1.1\x0D\x0AHost: %s\x0D\x0A\x43onnection: Close\x0D\x0A\x0D\x0A",
          hostname);
  BIO_puts(bio, request);

  /* read HTTP response from server and print to stdout */
  while (1) {
    [memset][11](response, '\0', sizeof(response));
    int n = BIO_read(bio, response, BuffSize);
    if (n &lt;= 0) break; /* 0 is end-of-stream, &lt; 0 is an error */
  [puts][12](response);
  }

  cleanup(ctx, bio);
}

int main() {
  init_ssl();

  const char* hostname = "www.google.com:443";
  [fprintf][10](stderr, "Trying an HTTPS connection to %s...\n", hostname);
  secure_connect(hostname);

return 0;
}
```

This program can be compiled and executed from the command line (note the lowercase L in **-lssl** and **-lcrypto**):

**gcc** **-o** **client client.c -lssl** **-lcrypto**

This program tries to open a secure connection to the web site [www.google.com][13]. As part of the TLS handshake with the Google web server, the **client** program receives one or more digital certificates, which the program tries (but, on my system, fails) to verify. Nonetheless, the **client** program goes on to fetch the Google homepage through the secure channel. This program depends on the security artifacts mentioned earlier, although only a digital certificate stands out in the code. The other artifacts remain behind the scenes and are clarified later in detail.

Generally, a client program in C or C++ that opened an HTTP (non-secure) channel would use constructs such as a _file descriptor_ for a _network socket_, which is an endpoint in a connection between two processes (e.g., the client program and the Google web server). A file descriptor, in turn, is a non-negative integer value that identifies, within a program, any file-like construct that the program opens. Such a program also would use a structure to specify details about the web server’s address.

None of these relatively low-level constructs occurs in the client program, as the OpenSSL library wraps the socket infrastructure and address specification in high-level security constructs. The result is a straightforward API. Here’s a first look at the security details in the example **client** program.

  * The program begins by loading the relevant OpenSSL libraries, with my function **init_ssl** making two calls into OpenSSL:

**SSL_library_init(); SSL_load_error_strings();**

  * The next initialization step tries to get a security _context_, a framework of information required to establish and maintain a secure channel to the web server. **TLS 1.2** is used in the example, as shown in this call to an OpenSSL library function:

**const SSL_METHOD* method = TLSv1_2_client_method(); /* TLS 1.2 */**

If the call succeeds, then the **method** pointer is passed to the library function that creates the context of type **SSL_CTX**:

**SSL_CTX*** **ctx** **= SSL_CTX_new(method);**

The **client** program checks for errors on each of these critical library calls, and then the program terminates if either call fails.

  * Two other OpenSSL artifacts now come into play: a security session of type **SSL**, which manages the secure connection from start to finish; and a secured stream of type **BIO** (Basic Input/Output), which is used to communicate with the web server. The **BIO** stream is generated with this call:

**BIO* bio = BIO_new_ssl_connect(ctx);**

Note that the all-important context is the argument. The **BIO** type is the OpenSSL wrapper for the **FILE** type in C. This wrapper secures the input and output streams between the **client** program and Google's web server.

  * With the **SSL_CTX** and **BIO** in hand, the program then links these together in an **SSL** session. Three library calls do the work:

**BIO_get_ssl(bio, &amp;ssl); /* get a TLS session */**

**SSL_set_mode(ssl, SSL_MODE_AUTO_RETRY); /* for robustness */**

**BIO_set_conn_hostname(bio, name); /* prepare to connect to Google */**

The secure connection itself is established through this call:

**BIO_do_connect(bio);**

If this last call does not succeed, the **client** program terminates; otherwise, the connection is ready to support a confidential conversation between the **client** program and the Google web server.




During the handshake with the web server, the **client** program receives one or more digital certificates that authenticate the server’s identity. However, the **client** program does not send a certificate of its own, which means that the authentication is one-way. (Web servers typically are configured _not_ to expect a client certificate.) Despite the failed verification of the web server’s certificate, the **client** program continues by fetching the Google homepage through the secure channel to the web server.

Why does the attempt to verify a Google certificate fail? A typical OpenSSL installation has the directory **/etc/ssl/certs**, which includes the **ca-certificates.crt** file. The directory and the file together contain digital certificates that OpenSSL trusts out of the box and accordingly constitute a _truststore_. The truststore can be updated as needed, in particular, to include newly trusted certificates and to remove ones no longer trusted.

The client program receives three certificates from the Google web server, but the OpenSSL truststore on my machine does not contain exact matches. As presently written, the **client** program does not pursue the matter by, for example, verifying the digital signature on a Google certificate (a signature that vouches for the certificate). If that signature were trusted, then the certificate containing it should be trusted as well. Nonetheless, the client program goes on to fetch and then to print Google’s homepage. The next section gets into more detail.

### The hidden security pieces in the client program

Let’s start with the visible security artifact in the client example—the digital certificate—and consider how other security artifacts relate to it. The dominant layout standard for a digital certificate is X509, and a production-grade certificate is issued by a certificate authority (CA) such as [Verisign][14].

A digital certificate contains various pieces of information (e.g., activation and expiration dates, and a domain name for the owner), including the issuer’s identity and _digital signature_, which is an encrypted _cryptographic hash_ value. A certificate also has an unencrypted hash value that serves as its identifying _fingerprint_.

A hash value results from mapping an arbitrary number of bits to a fixed-length digest. What the bits represent (an accounting report, a novel, or maybe a digital movie) is irrelevant. For example, the Message Digest version 5 (MD5) hash algorithm maps input bits of whatever length to a 128-bit hash value, whereas the SHA1 (Secure Hash Algorithm version 1) algorithm maps input bits to a 160-bit value. Different input bits result in different—indeed, statistically unique—hash values. The next article goes into further detail and focuses on what makes a hash function _cryptographic_.

Digital certificates differ in type (e.g., _root_, _intermediate_, and _end-entity_ certificates) and form a hierarchy that reflects these types. As the name suggests, a _root_ certificate sits atop the hierarchy, and the certificates under it inherit whatever trust the root certificate has. The OpenSSL libraries and most modern programming languages have an X509 type together with functions that deal with such certificates. The certificate from Google has an X509 format, and the **client** program checks whether this certificate is **X509_V_OK**.

X509 certificates are based upon public-key infrastructure (PKI), which includes algorithms—RSA is the dominant one—for generating _key pairs_: a public key and its paired private key. A public key is an identity: [Amazon’s][15] public key identifies it, and my public key identifies me. A private key is meant to be kept secret by its owner.

The keys in a pair have standard uses. A public key can be used to encrypt a message, and the private key from the same pair can then be used to decrypt the message. A private key also can be used to sign a document or other electronic artifact (e.g., a program or an email), and the public key from the pair can then be used to verify the signature. The following two examples fill in some details.

In the first example, Alice distributes her public key to the world, including Bob. Bob then encrypts a message with Alice’s public key, sending the encrypted message to Alice. The message encrypted with Alice’s public key is decrypted with her private key, which (by assumption) she alone has, like so:


```
             +------------------+ encrypted msg  +-------------------+
Bob's msg---&gt;|Alice's public key|---------------&gt;|Alice's private key|---&gt; Bob's msg
             +------------------+                +-------------------+
```

Decrypting the message without Alice’s private key is possible in principle, but infeasible in practice given a sound cryptographic key-pair system such as RSA.

Now, for the second example, consider signing a document to certify its authenticity. The signature algorithm uses a private key from a pair to process a cryptographic hash of the document to be signed:


```
                    +-------------------+
Hash of document---&gt;|Alice's private key|---&gt;Alice's digital signature of the document
                    +-------------------+
```

Assume that Alice digitally signs a contract sent to Bob. Bob then can use Alice’s public key from the key pair to verify the signature:


```
                                             +------------------+
Alice's digital signature of the document---&gt;|Alice's public key|---&gt;verified or not
                                             +------------------+
```

It is infeasible to forge Alice’s signature without Alice’s private key: hence, it is in Alice’s interest to keep her private key secret.

None of these security pieces, except for digital certificates, is explicit in the **client** program. The next article fills in the details with examples that use the OpenSSL utilities and library functions.

### OpenSSL from the command line

In the meantime, let’s take a look at OpenSSL command-line utilities: in particular, a utility to inspect the certificates from a web server during the TLS handshake. Invoking the OpenSSL utilities begins with the **openssl** command and then adds a combination of arguments and flags to specify the desired operation.

Consider this command:

**openssl list-cipher-algorithms**

The output is a list of associated algorithms that make up a _cipher suite_. Here’s the start of the list, with comments to clarify the acronyms:


```
AES-128-CBC ## Advanced Encryption Standard, Cipher Block Chaining
AES-128-CBC-HMAC-SHA1 ## Hash-based Message Authentication Code with SHA1 hashes
AES-128-CBC-HMAC-SHA256 ## ditto, but SHA256 rather than SHA1
...
```

The next command, using the argument **s_client**, opens a secure connection to **[www.google.com][13]** and prints screens full of information about this connection:

**openssl s_client -connect [www.google.com:443][16] -showcerts**

The port number 443 is the standard one used by web servers for receiving HTTPS rather than HTTP connections. (For HTTP, the standard port is 80.) The network address **[www.google.com:443][16]** also occurs in the **client** program's code. If the attempted connection succeeds, the three digital certificates from Google are displayed together with information about the secure session, the cipher suite in play, and related items. For example, here is a slice of output from near the start, which announces that a _certificate chain_ is forthcoming. The encoding for the certificates is base64:


```
Certificate chain
 0 s:/C=US/ST=California/L=Mountain View/O=Google LLC/CN=www.google.com
 i:/C=US/O=Google Trust Services/CN=Google Internet Authority G3
\-----BEGIN CERTIFICATE-----
MIIEijCCA3KgAwIBAgIQdCea9tmy/T6rK/dDD1isujANBgkqhkiG9w0BAQsFADBU
MQswCQYDVQQGEwJVUzEeMBwGA1UEChMVR29vZ2xlIFRydXN0IFNlcnZpY2VzMSUw
...
```

A major web site such as Google usually sends multiple certificates for authentication.

The output ends with summary information about the TLS session, including specifics on the cipher suite:


```
SSL-Session:
    Protocol : TLSv1.2
    Cipher : ECDHE-RSA-AES128-GCM-SHA256
    Session-ID: A2BBF0E4991E6BBBC318774EEE37CFCB23095CC7640FFC752448D07C7F438573
...
```

The protocol **TLS 1.2** is used in the **client** program, and the **Session-ID** uniquely identifies the connection between the **openssl** utility and the Google web server. The **Cipher** entry can be parsed as follows:

  * **ECDHE** (Elliptic Curve Diffie Hellman Ephemeral) is an effective and efficient algorithm for managing the TLS handshake. In particular, ECDHE solves the _key-distribution problem_ by ensuring that both parties in a connection (e.g., the client program and the Google web server) use the same encryption/decryption key, which is known as the _session key_. The follow-up article digs into the details.

  * **RSA** (Rivest Shamir Adleman) is the dominant public-key cryptosystem and named after the three academics who first described the system in the late 1970s. The key-pairs in play are generated with the RSA algorithm.

  * **AES128** (Advanced Encryption Standard) is a _block cipher_ that encrypts and decrypts blocks of bits. (The alternative is a _stream cipher_, which encrypts and decrypts bits one at a time.) The cipher is _symmetric_ in that the same key is used to encrypt and to decrypt, which raises the key-distribution problem in the first place. AES supports key sizes of 128 (used here), 192, and 256 bits: the larger the key, the better the protection.

Key sizes for symmetric cryptosystems such as AES are, in general, smaller than those for asymmetric (key-pair based) systems such as RSA. For example, a 1024-bit RSA key is relatively small, whereas a 256-bit key is currently the largest for AES.

  * **GCM** (Galois Counter Mode) handles the repeated application of a cipher (in this case, AES128) during a secured conversation. AES128 blocks are only 128-bits in size, and a secure conversation is likely to consist of multiple AES128 blocks from one side to the other. GCM is efficient and commonly paired with AES128.

  * **SHA256** (Secure Hash Algorithm 256 bits) is the cryptographic hash algorithm in play. The hash values produced are 256 bits in size, although even larger values are possible with SHA.




Cipher suites are in continual development. Not so long ago, for example, Google used the RC4 stream cipher (Ron’s Cipher version 4 after Ron Rivest from RSA). RC4 now has known vulnerabilities, which presumably accounts, at least in part, for Google’s switch to AES128.

### Wrapping up

This first look at OpenSSL, through a secure C web client and various command-line examples, has brought to the fore a handful of topics in need of more clarification. [The next article gets into the details][17], starting with cryptographic hashes and ending with a fuller discussion of how digital certificates address the key distribution challenge.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/cryptography-basics-openssl-part-1

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu/users/akritiko/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://www.openssl.org/
[3]: https://www.howtoforge.com/tutorial/how-to-install-openssl-from-source-on-linux/
[4]: http://condor.depaul.edu/mkalin
[5]: https://en.wikipedia.org/wiki/Transport_Layer_Security
[6]: https://en.wikipedia.org/wiki/Netscape
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/perror.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/sprintf.html
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[11]: http://www.opengroup.org/onlinepubs/009695399/functions/memset.html
[12]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
[13]: http://www.google.com
[14]: https://www.verisign.com
[15]: https://www.amazon.com
[16]: http://www.google.com:443
[17]: https://opensource.com/article/19/6/cryptography-basics-openssl-part-2
