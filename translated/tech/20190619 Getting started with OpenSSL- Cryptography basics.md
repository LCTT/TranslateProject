[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with OpenSSL: Cryptography basics)
[#]: via: (https://opensource.com/article/19/6/cryptography-basics-openssl-part-1)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu/users/akritiko/users/clhermansen)

OpenSSL 入门：密码学基础知识
======

> 需要有关基础的密码学入门知识，尤其是有关 OpenSSL 的入门知识吗？继续阅读。

![A lock on the side of a building][1]

本文是两篇使用 [OpenSSL][2] 的密码学基础知识的第一篇，OpenSSL 是在 Linux 和其他系统上流行的生产级库和工具包。（要安装 OpenSSL 的最新版本，请参阅[这里][3]。）OpenSSL 实用程序可在命令行使用，而程序可以从 OpenSSL 库中调用函数。本文的示例程序使用 C 语言，即 OpenSSL 库的源语言。

本系列的两篇文章共同介绍了加密哈希、数字签名、加密和解密以及数字证书。你可以从[我的网站][4]的 ZIP 文件中找到代码和命令行示例。

让我们首先回顾一下 OpenSSL 名称中的 SSL。

### OpenSSL 简史

[安全套接字层][5]（SSL）是 Netscape 在 1995 年发布的一种加密协议。该协议层可以位于 HTTP 之上，从而为 HTTPS 提供了 S：安全。SSL 协议提供了各种安全服务，其中包括两项在 HTTPS 中至关重要的服务：

* <ruby>对等身份验证<rt>Peer authentication</rt></ruby>（也称为相互挑战）：连接的每一边都对另一边的身份进行身份验证。如果 Alice 和 Bob 要通过 SSL 交换消息，则每个人首先验证彼此的身份。
* <ruby>机密性<rt>Confidentiality</rt></ruby>：发送者在通过通道发送消息之前先对其进行加密。接收者然后解密每个接收到的消息。此过程可保护网络对话。即使窃听者 Eve 截获了从 Alice 到 Bob 的加密消息（*中间人*攻击），Eve 仍发现他在计算上无法解密此消息。
   
反过来，这两个关键 SSL 服务与其他获得较少关注的服务捆绑在一起。例如，SSL 支持消息完整性，从而确保接收到的消息与发送的消息相同。此功能是通过散列函数实现的，散列函数也随 OpenSSL 工具箱一起提供。

SSL 已版本化（例如 SSLv2 和 SSLv3），并且在 1999 年，<ruby>传输层安全性<rt>Transport Layer Security</rt></ruby>（TLS）成为基于 SSLv3 的类似协议。TLSv1 和 SSLv3 相似，但不足以相互配合。 但是，通常将 SSL/TLS 称为同一协议。例如，即使正在使用的是  TLS（而非 SSL），OpenSSL 函数也经常在名称中包含 SSL。此外，调用 OpenSSL 命令行实用程序以术语 `openssl` 开始。

OpenSSL 在其 man 页面之外的文档是零散的，鉴于 OpenSSL 工具包有多大，这些页面变得难以查找使用。命令行和代码示例是将主要主题集中起来的一种方法。让我们从一个熟悉的示例开始（使用 HTTPS 访问网站），然后使用该示例来挑选我们感兴趣的加密部分。



### 一个 HTTPS 客户端

此处显示的 `client` 程序通过 HTTPS 连接到 Google：

```
/* compilation: gcc -o client client.c -lssl -lcrypto */
#include <stdio.h>
#include <stdlib.h>
#include <openssl/bio.h> /* BasicInput/Output streams */
#include <openssl/err.h> /* errors */
#include <openssl/ssl.h> /* core library */
#define BuffSize 1024

void report_and_exit(const char* msg) {
  perror(msg);
  ERR_print_errors_fp(stderr);
  exit(-1);
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

  sprintf(name, "%s:%s", hostname, "https");
  BIO_get_ssl(bio, &ssl); /* session */
  SSL_set_mode(ssl, SSL_MODE_AUTO_RETRY); /* robustness */
  BIO_set_conn_hostname(bio, name); /* prepare to connect */

  /* try to connect */
  if (BIO_do_connect(bio) <= 0) {
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
    fprintf(stderr,
            "##### Certificate verification error (%i) but continuing...\n",
            (int) verify_flag);

  /* now fetch the homepage as sample data */
  sprintf(request,
          "GET / HTTP/1.1\x0D\x0AHost: %s\x0D\x0A\x43onnection: Close\x0D\x0A\x0D\x0A",
          hostname);
  BIO_puts(bio, request);

  /* read HTTP response from server and print to stdout */
  while (1) {
    memset(response, '\0', sizeof(response));
    int n = BIO_read(bio, response, BuffSize);
    if (n <= 0) break; /* 0 is end-of-stream, < 0 is an error */
  puts(response);
  }

  cleanup(ctx, bio);
}

int main() {
  init_ssl();

  const char* hostname = "www.google.com:443";
  fprintf(stderr, "Trying an HTTPS connection to %s...\n", hostname);
  secure_connect(hostname);

return 0;
}
```

可以从命令行编译和执行该程序（请注意 `-lssl` 和 `-lcrypto` 中的小写字母 `L`）：


```
gcc -o client client.c -lssl -lcrypto
```

该程序尝试打开与网站 [www.google.com][13] 的安全连接。作为与 Google Web 服务器的 TLS 握手的一部分，`client` 程序会接收一个或多个数字证书，该程序会尝试对其进行验证（但在我的系统上失败了）。尽管如此，`client` 程序仍继续通过安全通道获取 Google 主页。该程序取决于前面提到的安全工件，尽管在代码中只突出了数字证书。其他工件仍在幕后，稍后将对其进行详细说明。

通常，打开 HTTP（非安全）通道的 C 或 C++ 客户端程序将使用诸如*文件描述符*或*网络套接字*之类的结构，这些是两个进程（例如，客户端程序和 Google Web 服务器）之间连接的端点。另一方面，文件描述符是一个非负整数值，它在程序中标识该程序打开的任何文件类的结构。这样的程序还将使用一种结构来指定有关 Web 服务器地址的详细信息。

这些相对较低级别的结构都不会出现在客户端程序中，因为 OpenSSL 库会将套接字基础设施和地址规范等封装在高级的安全结构中。其结果是一个简单的 API。下面首先看一下 `client` 程序示例中的安全性详细信息。

* 该程序首先加载相关的 OpenSSL 库，而我的函数 `init_ssl` 则对 OpenSSL 进行了两次调用：

    ```
SSL_library_init(); SSL_load_error_strings();
```
* 下一个初始化步骤尝试获取安全*上下文*，这是建立和维护通往 Web 服务器的安全通道所需的信息框架。 在示例中使用了 TLS 1.2，如对 OpenSSL 库函数的调用所示：

    ```
const SSL_METHOD* method = TLSv1_2_client_method(); /* TLS 1.2 */
```

    如果调用成功，则将 `method ` 指针被传递给库函数，该函数创建类型为 `SSL_CTX` 的上下文：

    ```
SSL_CTX* ctx = SSL_CTX_new(method);
```

    `client` 程序检查每个关键库调用中的错误，然后如果其中一个调用失败，则程序终止。
* 现在还有另外两个 OpenSSL 工件在起作用：SSL 类型的安全会话，从头到尾管理安全连接；以及类型为BIO（基本输入/输出）的安全流，用于与 Web 服务器进行通信。BIO 流是通过以下调用生成的：

    ```
BIO* bio = BIO_new_ssl_connect(ctx);
```
    请注意，最重要的上下文是参数。`BIO` 类型是 C 语言中 `FILE` 类型的 OpenSSL 封装器。此封装器可保护 `client` 程序与 Google 的网络服务器之间的输入和输出流。
* 有了 `SSL_CTX` 和 `BIO`，然后程序在 SSL 会话中将它们组合在一起。三个库调用可以完成工作：

    ```
BIO_get_ssl(bio, &ssl); /* get a TLS session */
SSL_set_mode(ssl, SSL_MODE_AUTO_RETRY); /* for robustness */
BIO_set_conn_hostname(bio, name); /* prepare to connect to Google */
```
    安全连接本身是通过以下调用建立的：

    ```
BIO_do_connect(bio);
```
    如果最后一次调用不成功，则 `client` 程序终止；否则，该连接已准备就绪，可以支持 `client` 程序与Google Web 服务器之间的机密对话。


During the handshake with the web server, the `client` program receives one or more digital certificates that authenticate the server’s identity. However, the `client` program does not send a certificate of its own, which means that the authentication is one-way. (Web servers typically are configured _not_ to expect a client certificate.) Despite the failed verification of the web server’s certificate, the `client` program continues by fetching the Google homepage through the secure channel to the web server.

Why does the attempt to verify a Google certificate fail? A typical OpenSSL installation has the directory `/etc/ssl/certs`, which includes the `ca-certificates.crt` file. The directory and the file together contain digital certificates that OpenSSL trusts out of the box and accordingly constitute a _truststore_. The truststore can be updated as needed, in particular, to include newly trusted certificates and to remove ones no longer trusted.

The client program receives three certificates from the Google web server, but the OpenSSL truststore on my machine does not contain exact matches. As presently written, the `client` program does not pursue the matter by, for example, verifying the digital signature on a Google certificate (a signature that vouches for the certificate). If that signature were trusted, then the certificate containing it should be trusted as well. Nonetheless, the client program goes on to fetch and then to print Google’s homepage. The next section gets into more detail.

### The hidden security pieces in the client program

Let’s start with the visible security artifact in the client example—the digital certificate—and consider how other security artifacts relate to it. The dominant layout standard for a digital certificate is X509, and a production-grade certificate is issued by a certificate authority (CA) such as [Verisign][14].

A digital certificate contains various pieces of information (e.g., activation and expiration dates, and a domain name for the owner), including the issuer’s identity and _digital signature_, which is an encrypted _cryptographic hash_ value. A certificate also has an unencrypted hash value that serves as its identifying _fingerprint_.

A hash value results from mapping an arbitrary number of bits to a fixed-length digest. What the bits represent (an accounting report, a novel, or maybe a digital movie) is irrelevant. For example, the Message Digest version 5 (MD5) hash algorithm maps input bits of whatever length to a 128-bit hash value, whereas the SHA1 (Secure Hash Algorithm version 1) algorithm maps input bits to a 160-bit value. Different input bits result in different—indeed, statistically unique—hash values. The next article goes into further detail and focuses on what makes a hash function _cryptographic_.

Digital certificates differ in type (e.g., _root_, _intermediate_, and _end-entity_ certificates) and form a hierarchy that reflects these types. As the name suggests, a _root_ certificate sits atop the hierarchy, and the certificates under it inherit whatever trust the root certificate has. The OpenSSL libraries and most modern programming languages have an X509 type together with functions that deal with such certificates. The certificate from Google has an X509 format, and the `client` program checks whether this certificate is `X509_V_OK`.

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

None of these security pieces, except for digital certificates, is explicit in the `client` program. The next article fills in the details with examples that use the OpenSSL utilities and library functions.

### OpenSSL from the command line

In the meantime, let’s take a look at OpenSSL command-line utilities: in particular, a utility to inspect the certificates from a web server during the TLS handshake. Invoking the OpenSSL utilities begins with the `openssl` command and then adds a combination of arguments and flags to specify the desired operation.

Consider this command:

`openssl list-cipher-algorithms`

The output is a list of associated algorithms that make up a _cipher suite_. Here’s the start of the list, with comments to clarify the acronyms:


```
AES-128-CBC ## Advanced Encryption Standard, Cipher Block Chaining
AES-128-CBC-HMAC-SHA1 ## Hash-based Message Authentication Code with SHA1 hashes
AES-128-CBC-HMAC-SHA256 ## ditto, but SHA256 rather than SHA1
...
```

The next command, using the argument `s_client`, opens a secure connection to `[www.google.com][13]` and prints screens full of information about this connection:

`openssl s_client -connect [www.google.com:443][16] -showcerts`

The port number 443 is the standard one used by web servers for receiving HTTPS rather than HTTP connections. (For HTTP, the standard port is 80.) The network address `[www.google.com:443][16]` also occurs in the `client` program's code. If the attempted connection succeeds, the three digital certificates from Google are displayed together with information about the secure session, the cipher suite in play, and related items. For example, here is a slice of output from near the start, which announces that a _certificate chain_ is forthcoming. The encoding for the certificates is base64:


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

The protocol `TLS 1.2` is used in the `client` program, and the `Session-ID` uniquely identifies the connection between the `openssl` utility and the Google web server. The `Cipher` entry can be parsed as follows:

  * `ECDHE` (Elliptic Curve Diffie Hellman Ephemeral) is an effective and efficient algorithm for managing the TLS handshake. In particular, ECDHE solves the _key-distribution problem_ by ensuring that both parties in a connection (e.g., the client program and the Google web server) use the same encryption/decryption key, which is known as the _session key_. The follow-up article digs into the details.

  * `RSA` (Rivest Shamir Adleman) is the dominant public-key cryptosystem and named after the three academics who first described the system in the late 1970s. The key-pairs in play are generated with the RSA algorithm.

  * `AES128` (Advanced Encryption Standard) is a _block cipher_ that encrypts and decrypts blocks of bits. (The alternative is a _stream cipher_, which encrypts and decrypts bits one at a time.) The cipher is _symmetric_ in that the same key is used to encrypt and to decrypt, which raises the key-distribution problem in the first place. AES supports key sizes of 128 (used here), 192, and 256 bits: the larger the key, the better the protection.

Key sizes for symmetric cryptosystems such as AES are, in general, smaller than those for asymmetric (key-pair based) systems such as RSA. For example, a 1024-bit RSA key is relatively small, whereas a 256-bit key is currently the largest for AES.

  * `GCM` (Galois Counter Mode) handles the repeated application of a cipher (in this case, AES128) during a secured conversation. AES128 blocks are only 128-bits in size, and a secure conversation is likely to consist of multiple AES128 blocks from one side to the other. GCM is efficient and commonly paired with AES128.

  * `SHA256` (Secure Hash Algorithm 256 bits) is the cryptographic hash algorithm in play. The hash values produced are 256 bits in size, although even larger values are possible with SHA.




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
