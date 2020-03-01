[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11810-1.html)
[#]: subject: (Getting started with OpenSSL: Cryptography basics)
[#]: via: (https://opensource.com/article/19/6/cryptography-basics-openssl-part-1)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu/users/akritiko/users/clhermansen)

OpenSSL 入门：密码学基础知识
======

> 想要入门密码学的基础知识，尤其是有关 OpenSSL 的入门知识吗？继续阅读。

![](https://img.linux.net.cn/data/attachment/album/202001/23/142249fpnhyqz9y2cz1exe.jpg)

本文是使用 [OpenSSL][2] 的密码学基础知识的两篇文章中的第一篇，OpenSSL 是在 Linux 和其他系统上流行的生产级库和工具包。（要安装 OpenSSL 的最新版本，请参阅[这里][3]。）OpenSSL 实用程序可在命令行使用，程序也可以调用 OpenSSL 库中的函数。本文的示例程序使用的是 C 语言，即 OpenSSL 库的源语言。

本系列的两篇文章涵盖了加密哈希、数字签名、加密和解密以及数字证书。你可以从[我的网站][4]的 ZIP 文件中找到这些代码和命令行示例。

让我们首先回顾一下 OpenSSL 名称中的 SSL。

### OpenSSL 简史

<ruby>[安全套接字层][5]<rt>Secure Socket Layer</rt></ruby>（SSL）是 Netscape 在 1995 年发布的一种加密协议。该协议层可以位于 HTTP 之上，从而为 HTTPS 提供了 S：<ruby>安全<rt>secure</rt></ruby>。SSL 协议提供了各种安全服务，其中包括两项在 HTTPS 中至关重要的服务：

* <ruby>对等身份验证<rt>Peer authentication</rt></ruby>（也称为相互质询）：连接的每一边都对另一边的身份进行身份验证。如果 Alice 和 Bob 要通过 SSL 交换消息，则每个人首先验证彼此的身份。
* <ruby>机密性<rt>Confidentiality</rt></ruby>：发送者在通过通道发送消息之前先对其进行加密。然后，接收者解密每个接收到的消息。此过程可保护网络对话。即使窃听者 Eve 截获了从 Alice 到 Bob 的加密消息（即*中间人*攻击），Eve 会发现他无法在计算上解密此消息。

反过来，这两个关键 SSL 服务与其他不太受关注的服务相关联。例如，SSL 支持消息完整性，从而确保接收到的消息与发送的消息相同。此功能是通过哈希函数实现的，哈希函数也随 OpenSSL 工具箱一起提供。

SSL 有多个版本（例如 SSLv2 和 SSLv3），并且在 1999 年出现了一个基于 SSLv3 的类似协议<ruby>传输层安全性<rt>Transport Layer Security</rt></ruby>（TLS）。TLSv1 和 SSLv3 相似，但不足以相互配合工作。不过，通常将 SSL/TLS 称为同一协议。例如，即使正在使用的是 TLS（而非 SSL），OpenSSL 函数也经常在名称中包含 SSL。此外，调用 OpenSSL 命令行实用程序以 `openssl` 开始。

除了 man 页面之外，OpenSSL 的文档是零零散散的，鉴于 OpenSSL 工具包很大，这些页面很难以查找使用。命令行和代码示例可以将主要主题集中起来。让我们从一个熟悉的示例开始（使用 HTTPS 访问网站），然后使用该示例来选出我们感兴趣的加密部分进行讲述。

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

  /* 链路 bio 通道，SSL 会话和服务器端点 */

  sprintf(name, "%s:%s", hostname, "https");
  BIO_get_ssl(bio, &ssl); /* 会话 */
  SSL_set_mode(ssl, SSL_MODE_AUTO_RETRY); /* 鲁棒性 */
  BIO_set_conn_hostname(bio, name); /* 准备连接 */

  /* 尝试连接 */
  if (BIO_do_connect(bio) <= 0) {
    cleanup(ctx, bio);
    report_and_exit("BIO_do_connect...");
  }

  /* 验证信任库，检查证书 */
  if (!SSL_CTX_load_verify_locations(ctx,
                                      "/etc/ssl/certs/ca-certificates.crt", /* 信任库 */
                                      "/etc/ssl/certs/")) /* 其它信任库 */
    report_and_exit("SSL_CTX_load_verify_locations...");

  long verify_flag = SSL_get_verify_result(ssl);
  if (verify_flag != X509_V_OK)
    fprintf(stderr,
            "##### Certificate verification error (%i) but continuing...\n",
            (int) verify_flag);

  /* 获取主页作为示例数据 */
  sprintf(request,
          "GET / HTTP/1.1\x0D\x0AHost: %s\x0D\x0A\x43onnection: Close\x0D\x0A\x0D\x0A",
          hostname);
  BIO_puts(bio, request);

  /* 从服务器读取 HTTP 响应并打印到输出 */
  while (1) {
    memset(response, '\0', sizeof(response));
    int n = BIO_read(bio, response, BuffSize);
    if (n <= 0) break; /* 0 代表流结束，< 0 代表有错误 */
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

该程序尝试打开与网站 [www.google.com][13] 的安全连接。在与 Google Web 服务器的 TLS 握手过程中，`client` 程序会收到一个或多个数字证书，该程序会尝试对其进行验证（但在我的系统上失败了）。尽管如此，`client` 程序仍继续通过安全通道获取 Google 主页。该程序取决于前面提到的安全工件，尽管在上述代码中只着重突出了数字证书。但其它工件仍在幕后发挥作用，稍后将对它们进行详细说明。

通常，打开 HTTP（非安全）通道的 C 或 C++ 的客户端程序将使用诸如*文件描述符*或*网络套接字*之类的结构，它们是两个进程（例如，这个 `client` 程序和 Google Web 服务器）之间连接的端点。另一方面，文件描述符是一个非负整数值，用于在程序中标识该程序打开的任何文件类的结构。这样的程序还将使用一种结构来指定有关 Web 服务器地址的详细信息。

这些相对较低级别的结构不会出现在客户端程序中，因为 OpenSSL 库会将套接字基础设施和地址规范等封装在更高层面的安全结构中。其结果是一个简单的 API。下面首先看一下 `client` 程序示例中的安全性详细信息。

* 该程序首先加载相关的 OpenSSL 库，我的函数 `init_ssl` 中对 OpenSSL 进行了两次调用：

    ```
SSL_load_error_strings();
SSL_library_init(); 
```
* 下一个初始化步骤尝试获取安全*上下文*，这是建立和维护通往 Web 服务器的安全通道所需的信息框架。如对 OpenSSL 库函数的调用所示，在示例中使用了 TLS 1.2：

    ```
const SSL_METHOD* method = TLSv1_2_client_method(); /* TLS 1.2 */
```

    如果调用成功，则将 `method` 指针被传递给库函数，该函数创建类型为 `SSL_CTX` 的上下文：

    ```
SSL_CTX* ctx = SSL_CTX_new(method);
```

    `client` 程序会检查每个关键的库调用的错误，如果其中一个调用失败，则程序终止。
* 现在还有另外两个 OpenSSL 工件也在发挥作用：SSL 类型的安全会话，从头到尾管理安全连接；以及类型为 BIO（<ruby>基本输入/输出<rt>Basic Input/Output</rt></ruby>）的安全流，用于与 Web 服务器进行通信。BIO 流是通过以下调用生成的：

    ```
BIO* bio = BIO_new_ssl_connect(ctx);
```

    请注意，这个最重要的上下文是其参数。`BIO` 类型是 C 语言中 `FILE` 类型的 OpenSSL 封装器。此封装器可保护 `client` 程序与 Google 的网络服务器之间的输入和输出流的安全。
* 有了 `SSL_CTX` 和 `BIO`，然后程序在 SSL 会话中将它们组合在一起。三个库调用可以完成工作：

    ```
BIO_get_ssl(bio, &ssl); /* 会话 */
SSL_set_mode(ssl, SSL_MODE_AUTO_RETRY); /* 鲁棒性 */
BIO_set_conn_hostname(bio, name); /* 准备连接 */
```

    安全连接本身是通过以下调用建立的：

    ```
BIO_do_connect(bio);
```

    如果最后一个调用不成功，则 `client` 程序终止；否则，该连接已准备就绪，可以支持 `client` 程序与 Google Web 服务器之间的机密对话。

在与 Web 服务器握手期间，`client` 程序会接收一个或多个数字证书，以认证服务器的身份。但是，`client` 程序不会发送自己的证书，这意味着这个身份验证是单向的。（Web 服务器通常配置为**不**需要客户端证书）尽管对 Web 服务器证书的验证失败，但 `client` 程序仍通过了连接到 Web 服务器的安全通道继续获取 Google 主页。

为什么验证 Google 证书的尝试会失败？典型的 OpenSSL 安装目录为 `/etc/ssl/certs`，其中包含 `ca-certificates.crt` 文件。该目录和文件包含着 OpenSSL 自带的数字证书，以此构成<ruby>信任库<rt>truststore</rt></ruby>。可以根据需要更新信任库，尤其是可以包括新信任的证书，并删除不再受信任的证书。

`client` 程序从 Google Web 服务器收到了三个证书，但是我的计算机上的 OpenSSL 信任库并不包含完全匹配的证书。如目前所写，`client` 程序不会通过例如验证 Google 证书上的数字签名（一个用来证明该证书的签名）来解决此问题。如果该签名是受信任的，则包含该签名的证书也应受信任。尽管如此，`client` 程序仍继续获取页面，然后打印出 Google 的主页。下一节将更详细地介绍这些。

### 客户端程序中隐藏的安全性

让我们从客户端示例中可见的安全工件（数字证书）开始，然后考虑其他安全工件如何与之相关。数字证书的主要格式标准是 X509，生产级的证书由诸如 [Verisign][14] 的<ruby>证书颁发机构<rt>Certificate Authority</rt></ruby>（CA）颁发。

数字证书中包含各种信息（例如，激活日期和失效日期以及所有者的域名），也包括发行者的身份和*数字签名*（这是加密过的*加密哈希*值）。证书还具有未加密的哈希值，用作其标识*指纹*。

哈希值来自将任意数量的二进制位映射到固定长度的摘要。这些位代表什么（会计报告、小说或数字电影）无关紧要。例如，<ruby>消息摘要版本 5<rt>Message Digest version 5</rt></ruby>（MD5）哈希算法将任意长度的输入位映射到 128 位哈希值，而 SHA1（<ruby>安全哈希算法版本 1<rt>Secure Hash Algorithm version 1</rt></ruby>）算法将输入位映射到 160 位哈希值。不同的输入位会导致不同的（实际上在统计学上是唯一的）哈希值。下一篇文章将会进行更详细的介绍，并着重介绍什么使哈希函数具有加密功能。

数字证书的类型有所不同（例如根证书、中间证书和最终实体证书），并形成了反映这些证书类型的层次结构。顾名思义，*根*证书位于层次结构的顶部，其下的证书继承了根证书所具有的信任。OpenSSL 库和大多数现代编程语言都具有 X509 数据类型以及处理此类证书的函数。来自 Google 的证书具有 X509 格式，`client` 程序会检查该证书是否为 `X509_V_OK`。

X509 证书基于<ruby>公共密钥基础结构<rt>public-key infrastructure</rt></ruby>（PKI），其中包括的算法（RSA 是占主导地位的算法）用于生成*密钥对*：公共密钥及其配对的私有密钥。公钥是一种身份：[Amazon][15] 的公钥对其进行标识，而我的公钥对我进行标识。私钥应由其所有者负责保密。

成对出现的密钥具有标准用途。可以使用公钥对消息进行加密，然后可以使用同一个密钥对中的私钥对消息进行解密。私钥也可以用于对文档或其他电子工件（例如程序或电子邮件）进行签名，然后可以使用该对密钥中的公钥来验证签名。以下两个示例补充了一些细节。

在第一个示例中，Alice 将她的公钥分发给全世界，包括 Bob。然后，Bob 用 Alice 的公钥加密邮件，然后将加密的邮件发送给 Alice。用 Alice 的公钥加密的邮件将可以用她的私钥解密（假设是她自己的私钥），如下所示：

```
             +------------------+ encrypted msg  +-------------------+
Bob's msg--->|Alice's public key|--------------->|Alice's private key|---> Bob's msg
             +------------------+                +-------------------+
```

理论上可以在没有 Alice 的私钥的情况下解密消息，但在实际情况中，如果使用像 RSA 这样的加密密钥对系统，则在计算上做不到。

现在，第二个示例，请对文档签名以证明其真实性。签名算法使用密钥对中的私钥来处理要签名的文档的加密哈希：

```
                    +-------------------+
Hash of document--->|Alice's private key|--->Alice's digital signature of the document
                    +-------------------+
```

假设 Alice 以数字方式签署了发送给 Bob 的合同。然后，Bob 可以使用 Alice 密钥对中的公钥来验证签名：

```
                                             +------------------+
Alice's digital signature of the document--->|Alice's public key|--->verified or not
                                             +------------------+
```

假若没有 Alice 的私钥，就无法轻松伪造 Alice 的签名：因此，Alice 有必要保密她的私钥。

在 `client` 程序中，除了数字证书以外，这些安全性都没有明确展示。下一篇文章使用使用 OpenSSL 实用程序和库函数的示例填充更多详细的信息。

### 命令行的 OpenSSL

同时，让我们看一下 OpenSSL 命令行实用程序：特别是在 TLS 握手期间检查来自 Web 服务器的证书的实用程序。调用 OpenSSL 实用程序可以使用 `openssl` 命令，然后添加参数和标志的组合以指定所需的操作。

看看以下命令：

```
openssl list-cipher-algorithms
```

该输出是组成<ruby>加密算法套件<rt>cipher suite<rt></ruby>的相关算法的列表。下面是列表的开头，加了澄清首字母缩写词的注释：

```
AES-128-CBC ## Advanced Encryption Standard, Cipher Block Chaining
AES-128-CBC-HMAC-SHA1 ## Hash-based Message Authentication Code with SHA1 hashes
AES-128-CBC-HMAC-SHA256 ## ditto, but SHA256 rather than SHA1
...
```

下一条命令使用参数 `s_client` 将打开到 [www.google.com][13] 的安全连接，并在屏幕上显示有关此连接的所有信息：

```
openssl s_client -connect www.google.com:443 -showcerts
```

端口号 443 是 Web 服务器用于接收 HTTPS（而不是 HTTP 连接）的标准端口号。（对于 HTTP，标准端口为 80）Web 地址 www.google.com:443 也出现在 `client` 程序的代码中。如果尝试连接成功，则将显示来自 Google 的三个数字证书以及有关安全会话、正在使用的加密算法套件以及相关项目的信息。例如，这是开头的部分输出，它声明*证书链*即将到来。证书的编码为 base64：


```
Certificate chain
 0 s:/C=US/ST=California/L=Mountain View/O=Google LLC/CN=www.google.com
 i:/C=US/O=Google Trust Services/CN=Google Internet Authority G3
-----BEGIN CERTIFICATE-----
MIIEijCCA3KgAwIBAgIQdCea9tmy/T6rK/dDD1isujANBgkqhkiG9w0BAQsFADBU
MQswCQYDVQQGEwJVUzEeMBwGA1UEChMVR29vZ2xlIFRydXN0IFNlcnZpY2VzMSUw
...
```

诸如 Google 之类的主要网站通常会发送多个证书进行身份验证。

输出以有关 TLS 会话的摘要信息结尾，包括加密算法套件的详细信息：

```
SSL-Session:
    Protocol : TLSv1.2
    Cipher : ECDHE-RSA-AES128-GCM-SHA256
    Session-ID: A2BBF0E4991E6BBBC318774EEE37CFCB23095CC7640FFC752448D07C7F438573
...
```

`client` 程序中使用了协议 TLS 1.2，`Session-ID` 唯一地标识了 `openssl` 实用程序和 Google Web 服务器之间的连接。`Cipher` 条目可以按以下方式进行解析：

* `ECDHE`（<ruby>椭圆曲线 Diffie-Hellman（临时）<rt>Elliptic Curve Diffie Hellman Ephemeral</rt></ruby>）是一种用于管理 TLS 握手的高效的有效算法。尤其是，ECDHE 通过确保连接双方（例如，`client` 程序和 Google Web 服务器）使用相同的加密/解密密钥（称为*会话密钥*）来解决“密钥分发问题”。后续文章会深入探讨该细节。
* `RSA`（Rivest Shamir Adleman）是主要的公共密钥密码系统，并以 1970 年代末首次描述了该系统的三位学者的名字命名。这个正在使用的密钥对是使用 RSA 算法生成的。
* `AES128`（<ruby>高级加密标准<rt>Advanced Encryption Standard</rt></ruby>）是一种<ruby>块式加密算法<rt>block cipher</rt></ruby>，用于加密和解密<ruby>位块<rt>blocks of bits</rt></ruby>。（另一种算法是<ruby>流式加密算法<rt>stream cipher</rt></ruby>，它一次加密和解密一个位。）这个加密算法是对称加密算法，因为使用同一个密钥进行加密和解密，这首先引起了密钥分发问题。AES 支持 128（此处使用）、192 和 256 位的密钥大小：密钥越大，安全性越好。

    通常，像 AES 这样的对称加密系统的密钥大小要小于像 RSA 这样的非对称（基于密钥对）系统的密钥大小。例如，1024 位 RSA 密钥相对较小，而 256 位密钥则当前是 AES 最大的密钥。
* `GCM`（<ruby>伽罗瓦计数器模式<rt>Galois Counter Mode</rt></ruby>）处理在安全对话期间重复应用的加密算法（在这种情况下为 AES128）。AES128 块的大小仅为 128 位，安全对话很可能包含从一侧到另一侧的多个 AES128 块。GCM 非常有效，通常与 AES128 搭配使用。
* `SHA256`（<ruby>256 位安全哈希算法<rt>Secure Hash Algorithm 256 bits</rt></ruby>）是我们正在使用的加密哈希算法。生成的哈希值的大小为 256 位，尽管使用 SHA 甚至可以更大。

加密算法套件正在不断发展中。例如，不久前，Google 使用 RC4 流加密算法（RSA 的 Ron Rivest 后来开发的 Ron's Cipher 版本 4）。 RC4 现在有已知的漏洞，这大概部分导致了 Google 转换为 AES128。

### 总结

我们通过安全的 C Web 客户端和各种命令行示例对 OpenSSL 做了首次了解，使一些需要进一步阐明的主题脱颖而出。[下一篇文章会详细介绍][17]，从加密散列开始，到对数字证书如何应对密钥分发挑战为结束的更全面讨论。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/cryptography-basics-openssl-part-1

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

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
