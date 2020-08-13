[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12511-1.html)
[#]: subject: (How to use OpenSSL: Hashes, digital signatures, and more)
[#]: via: (https://opensource.com/article/19/6/cryptography-basics-openssl-part-2)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

如何使用 OpenSSL：哈希值、数字签名等
======

> 通过 OpenSSL 深入了解密码学的细节：哈希值、数字签名、数字证书等。

![](https://img.linux.net.cn/data/attachment/album/202008/13/150012t7zwwk6x7wr69wih.jpg)

[本系列的第一篇文章][2]通过 OpenSSL 库和命令行实用程序介绍了哈希、加密/解密、数字签名和数字证书。这第二篇文章将对细节进行深入探讨。让我们从计算中无处不在的哈希开始，并考虑是什么使哈希函数*具备密码学意义*。

### 密码学哈希

OpenSSL 源代码的[下载页面](https://www.openssl.org/source/)包含了一个带有最新版本的表格。每个版本都有两个<ruby>哈希值<rt>hash</rt></ruby>：160 位 SHA1 和 256 位 SHA256。这些值可以用来验证下载的文件是否与存储库中的原始文件相匹配：下载者在本地重新计算下载文件的哈希值，然后将结果与原始文件进行比较。现代系统有计算这种哈希值的实用程序。例如，Linux 有 `md5sum` 和 `sha256sum`。OpenSSL 本身也提供了类似的命令行实用程序。

哈希值被用于计算的许多领域。例如，比特币区块链使用 SHA256 哈希值作为区块标识符。挖比特币就是生成一个低于指定阈值的 SHA256 哈希值，也就是至少有 N 个前导零的哈希值。（N 的值可以上升或下降，这取决于特定时间的挖矿生产力）。作为一个兴趣点，如今的矿机是为并行生成 SHA256 哈希值而设计的硬件集群。在 2018 年的一个高峰期，全球的比特币矿工每秒产生约 7500 万个<ruby>太哈希值<rt>terahash</rt></ruby> —— 这真是一个不可思议的数字。

网络协议也使用哈希值（在这里通常叫做“<ruby>校验和<rt>checksum</rt></ruby>”）来支持消息的完整性；也就是说，保证收到的消息与发送的消息是一样的。消息发送者计算消息的校验和，并将结果与消息一起发送。当消息到达时，接收方重新计算校验和。如果发送的校验和与重新计算的校验和不一致，那么消息在传输过程中可能出现了一些问题，或者发送的校验和出现了问题，或者两者都出现了问题。在这种情况下，应该重新发送消息和它的校验和，或者至少应该触发一个错误情况。（如 UDP 这样的低级网络协议不会理会校验和。）

哈希的其他例子大家都很熟悉。比如一个网站，要求用户用密码进行验证，用户在浏览器中输入密码，然后，他们通过 HTTPS 连接到服务器，密码从浏览器加密发送到服务器。一旦密码到达服务器，就会被解密，然后进行数据库表的查询。

在这个查询表中应该存储什么？存储密码本身是有风险的。风险要小得多的方式是存储一个由密码生成的哈希值，也许在计算哈希值之前“加一些<ruby>盐<rt>salt</rt></ruby>（额外的位）改善口味”。你的密码可能会被发送到 Web 服务器上，但网站可以向你保证，密码不会存储在那里。

哈希值还出现在安全的各个领域。例如，<ruby>基于哈希值的消息认证码<rt>hash-based message authentication code</rt></ruby>（[HMAC][3]）使用一个哈希值和一个秘密的<ruby>加密密钥<rt>cryptographic key</rt></ruby>来认证通过网络发送的消息。HMAC 码轻量级且易于在程序中使用，在 Web 服务中很受欢迎。一个 X509 数字证书包括一个称为<ruby>指纹<rt>fingerprint</rt></ruby>的哈希值，它可以方便证书验证。一个存放于内存中的<ruby>可信存储<rt>truststore</rt></ruby>可以实现为一个以这种指纹为键的查找表 —— 作为一个支持恒定查找时间的<ruby>哈希映射<rt>hash map</rt></ruby>。来自传入的证书的指纹可以与可信存储中的密钥进行比较，以确定是否匹配。

<ruby>密码学哈希函数<rt>cryptographic hash function</rt></ruby>应该具有什么特殊属性？它应该是<ruby>单向<rt>one-way</rt></ruby>的，这意味着很难被逆转。一个加密哈希函数应该是比较容易计算的，但是计算它的反函数（将哈希值映射回输入位串的函数）在计算上应该是困难的。下面是一个描述，用 `chf` 作为加密哈希函数，我的密码 `foobar` 作为样本输入。

```
        +---+
foobar—>|chf|—>hash value ## 简单直接
        +--–+
```

相比之下，逆向操作是不可行的：

```
            +-----------+
hash value—>|chf inverse|—>foobar ## 棘手困难
            +-----------+
```

例如，回忆一下 SHA256 哈希函数。对于一个任意长度为 N > 0 的输入位串，这个函数会生成一个 256 位的固定长度的哈希值；因此，这个哈希值甚至不会反映出输入位串的长度 N，更不用说字符串中每个位的值了。顺便说一下，SHA256 不容易受到<ruby>[长度扩展攻击][4]<rt>length extension attack</rt></ruby>。唯一有效的逆向工程方法是通过蛮力搜索将计算出的 SHA256 哈希值逆向返回到输入位串，这意味着需要尝试所有可能的输入位串，直到找到与目标哈希值匹配的位串。这样的搜索在 SHA256 这样一个完善的加密哈希函数上是不可行的。

现在，最后一个回顾的知识点是<ruby>有序<rt>in order</rt></ruby>。加密哈希值是统计学上的唯一，而不是无条件的唯一，这意味着两个不同的输入位串产生相同的哈希值是不太可能的，但也不是不可能的 —— 这称之为<ruby>碰撞<rt>collision</rt></ruby>。[生日问题][5]提供了一个很好的反直觉的碰撞例子。对各种哈希算法的<ruby>抗碰撞性<rt>collision resistance</rt></ruby>有着广泛的研究。例如，MD5（128 位哈希值）在大约 2^21 次哈希之后，抗碰撞能力就会崩溃。对于 SHA1（160 位哈希值），大约在 2^61 次哈希后开始崩溃。

对于 SHA256 的抗碰撞能力的剖析，目前还没有一个很好的估计。这个事实并不奇怪。SHA256 有 2^256 个不同的哈希值范围，这个数字的十进制表示法有 78 位之多! 那么，SHA256 哈希会不会发生碰撞呢？当然可能，但可能性极小。

在下面的命令行示例中，有两个输入文件被用作位串源：`hashIn1.txt` 和 `hashIn2.txt`。第一个文件包含 `abc`，第二个文件包含 `1a2b3c`。

为了便于阅读，这些文件包含的是文本，但也可以使用二进制文件代替。

在命令行（百分号 `%` 是提示符）使用 Linux `sha256sum` 实用程序对这两个文件进行处理产生以下哈希值（十六进制）:

```
% sha256sum hashIn1.txt
9e83e05bbf9b5db17ac0deec3b7ce6cba983f6dc50531c7a919f28d5fb3696c3 hashIn1.txt

% sha256sum hashIn2.txt
3eaac518777682bf4e8840dd012c0b104c2e16009083877675f00e995906ed13 hashIn2.txt
```

OpenSSL 哈希对应的结果与预期相同：

```
% openssl dgst -sha256 hashIn1.txt
SHA256(hashIn1.txt)= 9e83e05bbf9b5db17ac0deec3b7ce6cba983f6dc50531c7a919f28d5fb3696c3

% openssl dgst -sha256 hashIn2.txt
SHA256(hashIn2.txt)= 3eaac518777682bf4e8840dd012c0b104c2e16009083877675f00e995906ed13
```

这种对密码学哈希函数的研究，为我们仔细研究数字签名及其与密钥对的关系奠定了基础。

### 数字签名

顾名思义，<ruby>数字签字<rt>digital signature</rt></ruby>可以附在文件或其他一些电子<ruby>工件<rt>artifact</rt></ruby>（如程序）上，以证明其真实性。因此，这种签名类似于纸质文件上的手写签名。验证数字签名就是要确认两件事：第一，被担保的工件在签名被附上后没有改变，因为它部分是基于文件的加密学哈希值。第二，签名属于一个人（例如 Alice），只有她才能获得一对密钥中的私钥。顺便说一下，对代码（源码或编译后的代码）进行数字签名已经成为程序员的普遍做法。

让我们来了解一下数字签名是如何创建的。如前所述，没有公钥和私钥对就没有数字签名。当使用 OpenSSL 创建这些密钥时，有两个独立的命令：一个是创建私钥，另一个是从私钥中提取匹配的公钥。这些密钥对用 base64 编码，在这个过程中可以指定它们的大小。

<ruby>私钥<rt>private key</rt></ruby>由数值组成，其中两个数值（一个<ruby>模数<rt>modulus</rt></ruby>和一个<ruby>指数<rt>exponent</rt></ruby>）组成了公钥。虽然私钥文件包含了<ruby>公钥<rt>public key</rt></ruby>，但提取出来的公钥并**不会**透露相应私钥的值。

因此，生成的带有私钥的文件包含了完整的密钥对。将公钥提取到自己的文件中是很实用的，因为这两把钥匙有不同的用途，而这种提取方式也将私钥可能被意外公开的危险降到最低。

接下来，这对密钥的私钥被用来生成目标工件（如电子邮件）的哈希值，从而创建签名。在另一端，接收者的系统使用这对密钥的公钥来验证附在工件上的签名。

现在举个例子。首先，用 OpenSSL 生成一个 2048 位的 RSA 密钥对：

```
openssl genpkey -out privkey.pem -algorithm rsa 2048
```

在这个例子中，我们可以舍去 `-algorithm rsa` 标志，因为 `genpkey` 默认为 RSA 类型。文件的名称（`privkey.pem`）是任意的，但是<ruby>隐私增强邮件<rt>Privacy Enhanced Mail</rt></ruby>（PEM）扩展名 `.pem` 是默认 PEM 格式的惯用扩展名。（如果需要的话，OpenSSL 有命令可以在各种格式之间进行转换。）如果需要更大的密钥大小（例如 4096），那么最后一个参数 `2048` 可以改成 `4096`。这些大小总是二的幂。

下面是产生的 `privkey.pem` 文件的一个片断，它是 base64 编码的：

```
-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANnlAh4jSKgcNj/Z
JF4J4WdhkljP2R+TXVGuKVRtPkGAiLWE4BDbgsyKVLfs2EdjKL1U+/qtfhYsqhkK
...
-----END PRIVATE KEY-----
```

接下来的命令就会从私钥中提取出这对密钥的公钥：

```
openssl rsa -in privkey.pem -outform PEM -pubout -out pubkey.pem
```

由此产生的 `pubkey.pem` 文件很小，可以在这里完整地显示出来：

```
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDZ5QIeI0ioHDY/2SReCeFnYZJY
z9kfk11RrilUbT5BgIi1hOAQ24LMilS37NhHYyi9VPv6rX4WLKoZCmkeYaWk/TR5
4nbH1E/AkniwRoXpeh5VncwWMuMsL5qPWGY8fuuTE27GhwqBiKQGBOmU+MYlZonO
O0xnAKpAvysMy7G7qQIDAQAB
-----END PUBLIC KEY-----
```

现在，有了密钥对，数字签名就很容易了 —— 在本例中，源文件 `client.c` 是要签名的工件：

```
openssl dgst -sha256 -sign privkey.pem -out sign.sha256 client.c
```

`client.c` 源文件的摘要是 SHA256，私钥在前面创建的 `privkey.pem` 文件中。由此产生的二进制签名文件是 `sign.sha256`，这是一个任意的名字。要得到这个文件的可读版本（比如 base64），后续命令是：

```
openssl enc -base64 -in sign.sha256 -out sign.sha256.base64
```

文件 `sign.sha256.base64` 现在包含如下内容：

```
h+e+3UPx++KKSlWKIk34fQ1g91XKHOGFRmjc0ZHPEyyjP6/lJ05SfjpAJxAPm075
VNfFwysvqRGmL0jkp/TTdwnDTwt756Ej4X3OwAVeYM7i5DCcjVsQf5+h7JycHKlM
o/Jd3kUIWUkZ8+Lk0ZwzNzhKJu6LM5KWtL+MhJ2DpVc=
```

或者，可执行文件 `client` 也可以被签名，由此产生的 base64 编码签名将如预期的不同：

```
VMVImPgVLKHxVBapJ8DgLNJUKb98GbXgehRPD8o0ImADhLqlEKVy0HKRm/51m9IX
xRAN7DoL4Q3uuVmWWi749Vampong/uT5qjgVNTnRt9jON112fzchgEoMb8CHNsCT
XIMdyaPtnJZdLALw6rwMM55MoLamSc6M/MV1OrJnk/g=
```

这一过程的最后一步是用公钥验证数字签名。作为验证的一个重要步骤，应重新计算用于签署工件（在本例中，是可执行的 `client` 程序）的哈希值，因为验证过程应表明工件在签署后是否发生了变化。

有两个 OpenSSL 命令用于这个目的。第一条命令是对 base64 签名进行解码。

```
openssl enc -base64 -d -in sign.sha256.base64 -out sign.sha256
```

第二条是核实签名：

```
openssl dgst -sha256 -verify pubkey.pem -signature sign.sha256 client
```

第二条命令的输出，应该是这样的：

```
Verified OK
```

为了了解验证失败时的情况，一个简短但有用的练习是将最后一个 OpenSSL 命令中的可执行的 `client` 文件替换为源文件 `client.c`，然后尝试验证。另一个练习是改变 `client` 程序，无论多么轻微，然后再试一次。

### 数字证书

<ruby>数字证书<rt>digital certificate</rt></ruby>汇集了到目前为止所分析的各个部分：哈希值、密钥对、数字签名和加密/解密。生产级证书的第一步是创建一个<ruby>证书签名请求<rt>certificate signing request</rt></ruby>（CSR），然后将其发送给<ruby>证书颁发机构<rt>certificate authority</rt></ruby>（CA）。在 OpenSSL 的例子中，要做到这一点，请运行：

```
openssl req -out myserver.csr -new -newkey rsa:4096 -nodes -keyout myserverkey.pem
```

这个例子生成了一个 CSR 文档，并将该文档存储在文件 `myserver.csr`（base64 文本）中。这里的目的是：CSR 文档要求 CA 保证与指定域名相关联的身份，域名也就是 CA 所说的<ruby>通用名<rt>common name</rt></ruby>（CN）。

尽管可以使用现有的密钥对，但这个命令也会生成一个新的密钥对。请注意，在诸如 `myserver.csr` 和 `myserverkey.pem` 等名称中使用 `server` 暗示了数字证书的典型用途：作为与 www.google.com 等域名相关的 Web 服务器的身份担保。

然而，无论数字证书如何使用，同样使用这个命令都会创建一个 CSR。它还会启动一个问题/回答的交互式会话，提示有关域名的相关信息，以便与请求者的数字证书相连接。这个交互式会话可以通过在命令中提供基本的信息，用反斜杠来续行一步完成。`-subj` 标志提供了所需的信息。

```
% openssl req -new \
-newkey rsa:2048 -nodes -keyout privkeyDC.pem \
-out myserver.csr \
-subj "/C=US/ST=Illinois/L=Chicago/O=Faulty Consulting/OU=IT/CN=myserver.com"
```

产生的 CSR 文件在发送给 CA 之前可以进行检查和验证。这个过程可以创建具有所需格式（如 X509）、签名、有效期等的数字证书。

```
openssl req -text -in myserver.csr -noout -verify
```

这是输出的一个片断：

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
00:ba:36:fb:57:17:65:bc:40:30:96:1b:6e:de:73:
…
Exponent: 65537 (0x10001)
Attributes:
a0:00
Signature Algorithm: sha256WithRSAEncryption
…
```

### 自签证书

在开发 HTTPS 网站的过程中，手头有一个不用经过 CA 流程的数字证书是很方便的。在 HTTPS 握手的认证阶段，<ruby>自签证书<rt>self-signed certificate</rt></ruby>就能满足要求，尽管任何现代浏览器都会警告说这样的证书毫无价值。继续这个例子，自签证书的 OpenSSL 命令（有效期为一年，使用 RSA 公钥）如下：

```
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout myserver.pem -out myserver.crt
```

下面的 OpenSSL 命令呈现了生成的证书的可读版本：

```
openssl x509 -in myserver.crt -text -noout
```

这是自签证书的部分输出：

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
00:ba:36:fb:57:17:65:bc:40:30:96:1b:6e:de:73:
...
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

如前所述，RSA 私钥包含的值是用来生成公钥的。但是，给定的公钥**不会**泄露匹配的私钥。关于底层数学理论的介绍，见 <https://simple.wikipedia.org/wiki/RSA_algorithm>。

数字证书与用于生成该证书的密钥对之间存在着重要的对应关系，即使证书只是自签的：

* 数字证书包含构成公钥的指数和模数值。这些值是最初生成的 PEM 文件中密钥对的一部分，在本例中，是文件 `myserver.pem`。
* <ruby>指数<rt>exponent</rt></ruby>几乎总是 65,537（如本例中），所以可以忽略。
* 密钥对的<ruby>模数<rt>modulus</rt></ruby>应该与数字证书的模数相匹配。

模数是一个很大的值，为了便于阅读，可以进行哈希处理。下面是两个 OpenSSL 命令，它们检查相同的模数，从而确认数字证书是基于 PEM 文件中的密钥对。

```
% openssl x509 -noout -modulus -in myserver.crt | openssl sha1 ## 证书中的模数
(stdin)= 364d21d5e53a59d482395b1885aa2c3a5d2e3769

% openssl rsa -noout -modulus -in myserver.pem | openssl sha1 ## 密钥中的模数
(stdin)= 364d21d5e53a59d482395b1885aa2c3a5d2e3769
```

所产生的哈希值匹配，从而确认数字证书是基于指定的密钥对。

### 回到密钥分发问题上

让我们回到第一部分末尾提出的一个问题：`client` 程序和 Google Web 服务器之间的 TLS 握手。握手协议有很多种，即使是用在 `client` 例子中的 Diffie-Hellman 版本也有不同的方式。尽管如此，`client` 例子遵循了一个共同的模式。

首先，在 TLS 握手过程中，`client` 程序和 Web 服务器就<ruby>加密套件<rt>cipher suite</rt></ruby>达成一致，其中包括要使用的算法。在本例中，该套件是 `ECDHE-RSA-AES128-GCM-SHA256`。

现在值得关注的两个要素是 RSA 密钥对算法和 AES128 块密码，用于在握手成功的情况下对消息进行加密和解密。关于加密/解密，这个过程有两种流派：<ruby>对称<rt>symmetric</rt></ruby>和<ruby>非对称<rt>asymmetric</rt></ruby>。在对称流派中，加密和解密使用的是*相同的*密钥，这首先就引出了<ruby>密钥分发问题<rt>key distribution problem</rt></ruby>。如何将密钥安全地分发给双方？在非对称流派中，一个密钥用于加密（在这种情况下，是 RSA 公钥），但另一个密钥用于解密（在这种情况下，是来自同一对密钥的 RSA 私钥）。

`client` 程序拥有来认证证书的 Google Web 服务器的公钥，而 Web 服务器拥有来自同一对密钥的私钥。因此，`client` 程序可以向 Web 服务器发送加密信息，而 Web 服务器可以单独对该通信进行解密。

在 TLS 的情况下，对称方式有两个显著的优势：

* 在 `client` 程序与 Google Web 服务器之间的互动中，认证是单向的。Google Web 服务器向 `client` 程序发送三张证书，但 `client` 程序并没有向 Web 服务器发送证书，因此，Web 服务器没有来自客户端的公钥，无法加密发给客户端的消息。
* 使用 AES128 的对称加密/解密比使用 RSA 密钥的非对称加密/解密快了**近千倍**。

TLS 握手将两种加密/解密方式巧妙地结合在一起。在握手过程中，`client` 程序会生成随机位，即所谓的<ruby>预主密<rt>pre-master secret</rt></ruby>（PMS）。然后，`client` 程序用服务器的公钥对 PMS 进行加密，并将加密后的 PMS 发送给服务器，服务器再用 RSA 密钥对的私钥对 PMS 信息进行解密：

```
              +-------------------+ encrypted PMS  +--------------------+
client PMS--->|server’s public key|--------------->|server’s private key|--->server PMS
              +-------------------+                +--------------------+
```

在这个过程结束时，`client` 程序和 Google Web 服务器现在拥有相同的 PMS 位。每一方都使用这些位生成一个<ruby>主密码<rt>master secret</rt></ruby>，并立即生成一个称为<ruby>会话密钥<rt>session key</rt></ruby>的对称加密/解密密钥。现在有两个不同但等价的会话密钥，连接的每一方都有一个。在 `client` 的例子中，会话密钥是 AES128 类的。一旦在 `client` 程序和 Google Web 服务器两边生成了会话密钥，每一边的会话密钥就会对双方的对话进行保密。如果任何一方（例如，`client` 程序）或另一方（在这种情况下，Google Web 服务器）要求重新开始握手，握手协议（如 Diffie-Hellman）允许整个 PMS 过程重复进行。

### 总结

在命令行上说明的 OpenSSL 操作也可以通过底层库的 API 完成。这两篇文章重点使用了这个实用程序，以保持例子的简短，并专注于加密主题。如果你对安全问题感兴趣，OpenSSL 是一个很好的开始地方，并值得深入研究。


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/cryptography-basics-openssl-part-2

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003784_02_os.comcareers_os_rh2x.png?itok=jbRfXinl (A person working.)
[2]: https://linux.cn/article-11810-1.html
[3]: https://en.wikipedia.org/wiki/HMAC
[4]: https://en.wikipedia.org/wiki/Length_extension_attack
[5]: https://en.wikipedia.org/wiki/Birthday_problem
[6]: http://www.google.com
