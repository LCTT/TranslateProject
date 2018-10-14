公钥基础设施和密码学中的私钥的角色
======
> 了解如何验证某人所声称的身份。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_privacy_lock.png?itok=ZWjrpFzx)

在[上一篇文章][1]中，我们概述了密码学并讨论了密码学的核心概念：<ruby>保密性<rt>confidentiality</rt></ruby> （让数据保密）、<ruby>完整性<rt>integrity</rt></ruby> （防止数据被篡改）和<ruby>身份认证<rt>authentication</rt></ruby> （确认数据源的<ruby>身份<rt>identity</rt></ruby>）。由于要在存在各种身份混乱的现实世界中完成身份认证，人们逐渐建立起一个复杂的<ruby>技术生态体系<rt>technological ecosystem</rt></ruby>，用于证明某人就是其声称的那个人。在本文中，我们将大致介绍这些体系是如何工作的。

### 快速回顾公钥密码学及数字签名

互联网世界中的身份认证依赖于公钥密码学，其中密钥分为两部分：拥有者需要保密的私钥和可以对外公开的公钥。经过公钥加密过的数据，只能用对应的私钥解密。举个例子，对于希望与[记者][2]建立联系的举报人来说，这个特性非常有用。但就本文介绍的内容而言，私钥更重要的用途是与一个消息一起创建一个<ruby>数字签名<rt>digital signature</rt></ruby>，用于提供完整性和身份认证。

在实际应用中，我们签名的并不是真实消息，而是经过<ruby>密码学哈希函数<rt>cryptographic hash function</rt></ruby>处理过的消息<ruby>摘要<rt>digest</rt></ruby>。要发送一个包含源代码的压缩文件，发送者会对该压缩文件的 256 比特长度的 [SHA-256][3] 摘要进行签名，而不是文件本身进行签名，然后用明文发送该压缩包（和签名）。接收者会独立计算收到文件的 SHA-256 摘要，然后结合该摘要、收到的签名及发送者的公钥，使用签名验证算法进行验证。验证过程取决于加密算法，加密算法不同，验证过程也相应不同；而且，很微妙的是签名验证[漏洞][4]依然[层出不穷][5]。如果签名验证通过，说明文件在传输过程中没有被篡改而且来自于发送者，这是因为只有发送者拥有创建签名所需的私钥。

### 方案中缺失的环节

上述方案中缺失了一个重要的环节：我们从哪里获得发送者的公钥？发送者可以将公钥与消息一起发送，但除了发送者的自我宣称，我们无法核验其身份。假设你是一名银行柜员，一名顾客走过来向你说，“你好，我是 Jane Doe，我要取一笔钱”。当你要求其证明身份时，她指着衬衫上贴着的姓名标签说道，“看，Jane Doe！”。如果我是这个柜员，我会礼貌的拒绝她的请求。

如果你认识发送者，你们可以私下见面并彼此交换公钥。如果你并不认识发送者，你们可以私下见面，检查对方的证件，确认真实性后接受对方的公钥。为提高流程效率，你可以举办[聚会][6]并邀请一堆人，检查他们的证件，然后接受他们的公钥。此外，如果你认识并信任 Jane Doe（尽管她在银行的表现比较反常），Jane 可以参加聚会，收集大家的公钥然后交给你。事实上，Jane 可以使用她自己的私钥对这些公钥（及对应的身份信息）进行签名，进而你可以从一个[线上密钥库][7]获取公钥（及对应的身份信息）并信任已被 Jane 签名的那部分。如果一个人的公钥被很多你信任的人（即使你并不认识他们）签名，你也可能选择信任这个人。按照这种方式，你可以建立一个<ruby>[信任网络][8]<rt>Web of Trust</rt></ruby>。

但事情也变得更加复杂：我们需要建立一种标准的编码机制，可以将公钥和其对应的身份信息编码成一个<ruby>数字捆绑<rt>digital bundle</rt></ruby>，以便我们进一步进行签名。更准确的说，这类数字捆绑被称为<ruby>证书<rt>cerificate</rt></ruby>。我们还需要可以创建、使用和管理这些证书的工具链。满足诸如此类的各种需求的方案构成了<ruby>公钥基础设施<rt>public key infrastructure</rt></ruby>（PKI）。

### 比信任网络更进一步

你可以用人际关系网类比信任网络。如果人们之间广泛互信，可以很容易找到（两个人之间的）一条<ruby>短信任链<rt>short path of trust</rt></ruby>：就像一个社交圈。基于 [GPG][9] 加密的邮件依赖于信任网络，（[理论上][10]）只适用于与少量朋友、家庭或同事进行联系的情形。

（LCTT 译注：作者提到的“短信任链”应该是暗示“六度空间理论”，即任意两个陌生人之间所间隔的人一般不会超过 6 个。对 GPG 的唱衰，一方面是因为密钥管理的复杂性没有改善，另一方面 Yahoo 和 Google 都提出了更便利的端到端加密方案。）

在实际应用中，信任网络有一些“<ruby>[硬伤][11]<rt>significant problems</rt></ruby>”，主要是在可扩展性方面。当网络规模逐渐增大或者人们之间的连接较少时，信任网络就会慢慢失效。如果信任链逐渐变长，信任链中某人有意或无意误签证书的几率也会逐渐增大。如果信任链不存在，你不得不自己创建一条信任链，与其它组织建立联系，验证它们的密钥以符合你的要求。考虑下面的场景，你和你的朋友要访问一个从未使用过的在线商店。你首先需要核验网站所用的公钥属于其对应的公司而不是伪造者，进而建立安全通信信道，最后完成下订单操作。核验公钥的方法包括去实体店、打电话等，都比较麻烦。这样会导致在线购物变得不那么便利（或者说不那么安全，毕竟很多人会图省事，不去核验密钥）。

如果世界上有那么几个格外值得信任的人，他们专门负责核验和签发网站证书，情况会怎样呢？你可以只信任他们，那么浏览互联网也会变得更加容易。整体来看，这就是当今互联网的工作方式。那些“格外值得信任的人”就是被称为<ruby>证书颁发机构<rt>cerificate authoritie</rt></ruby>（CA）的公司。当网站希望获得公钥签名时，只需向 CA 提交<ruby>证书签名请求<rt>certificate signing request</rt></ruby>（CSR）。

CSR 类似于包括公钥和身份信息（在本例中，即服务器的主机名）的<ruby>存根<rt>stub</rt></ruby>证书，但 CA 并不会直接对 CSR 本身进行签名。CA 在签名之前会进行一些验证。对于一些证书类型（LCTT 译注：<ruby>域名证实<rt>Domain Validated</rt></ruby>（DV） 类型），CA 只验证申请者的确是 CSR 中列出主机名对应域名的控制者（例如通过邮件验证，让申请者完成指定的域名解析）。[对于另一些证书类型][12] （LCTT 译注：链接中提到<ruby>扩展证实<rt>Extended Validated</rt></ruby>（EV）类型，其实还有 <ruby>OV<rt>Organization Validated</rt></ruby> 类型），CA 还会检查相关法律文书，例如公司营业执照等。一旦验证完成，CA（一般在申请者付费后）会从 CSR 中取出数据（即公钥和身份信息），使用 CA 自己的私钥进行签名，创建一个（签名）证书并发送给申请者。申请者将该证书部署在网站服务器上，当用户使用 HTTPS （或其它基于 [TLS][13] 加密的协议）与服务器通信时，该证书被分发给用户。

当用户访问该网站时，浏览器获取该证书，接着检查证书中的主机名是否与当前正在连接的网站一致（下文会详细说明），核验 CA 签名有效性。如果其中一步验证不通过，浏览器会给出安全警告并切断与网站的连接。反之，如果验证通过，浏览器会使用证书中的公钥来核验该服务器发送的签名信息，确认该服务器持有该证书的私钥。有几种算法用于协商后续通信用到的<ruby>共享密钥<rt>shared secret key</rt></ruby>，其中一种也用到了服务器发送的签名信息。<ruby>密钥交换<rt>key exchange</rt></ruby>算法不在本文的讨论范围，可以参考这个[视频][14]，其中仔细说明了一种密钥交换算法。

### 建立信任

你可能会问，“如果 CA 使用其私钥对证书进行签名，也就意味着我们需要使用 CA 的公钥验证证书。那么 CA 的公钥从何而来，谁对其进行签名呢？” 答案是 CA 对自己签名！可以使用证书公钥对应的私钥，对证书本身进行签名！这类签名证书被称为是<ruby>自签名的<rt>self-signed</rt></ruby>；在 PKI 体系下，这意味着对你说“相信我”。（为了表达方便，人们通常说用证书进行了签名，虽然真正用于签名的私钥并不在证书中。）

通过遵守[浏览器][15]和[操作系统][16]供应商建立的规则，CA 表明自己足够可靠并寻求加入到浏览器或操作系统预装的一组自签名证书中。这些证书被称为“<ruby>信任锚<rt>trust anchor</rt></ruby>”或 <ruby>CA 根证书<rt>root CA certificate</rt></ruby>，被存储在根证书区，我们<ruby>约定<rt>implicitly</rt></ruby>信任该区域内的证书。

CA 也可以签发一种特殊的证书，该证书自身可以作为 CA。在这种情况下，它们可以生成一个证书链。要核验证书链，需要从“信任锚”（也就是 CA 根证书）开始，使用当前证书的公钥核验下一层证书的签名（或其它一些信息）。按照这个方式依次核验下一层证书，直到证书链底部。如果整个核验过程没有问题，信任链也建立完成。当向 CA 付费为网站签发证书时，实际购买的是将证书放置在证书链下的权利。CA 将卖出的证书标记为“不可签发子证书”，这样它们可以在适当的长度终止信任链（防止其继续向下扩展）。

为何要使用长度超过 2 的信任链呢？毕竟网站的证书可以直接被 CA 根证书签名。在实际应用中，很多因素促使 CA 创建<ruby>中间 CA 证书<rt>intermediate CA certificate</rt></ruby>，最主要是为了方便。由于价值连城，CA 根证书对应的私钥通常被存放在特定的设备中，一种需要多人解锁的<ruby>硬件安全模块<rt>hardware security module</rt></ruby>（HSM），该模块完全离线并被保管在配备监控和报警设备的[地下室][18]中。

<ruby>CA/浏览器论坛<rt>CAB Forum, CA/Browser Forum</rt></ruby>负责管理 CA，[要求][19]任何与 CA 根证书（LCTT 译注：就像前文提到的那样，这里是指对应的私钥）相关的操作必须由人工完成。设想一下，如果每个证书请求都需要员工将请求内容拷贝到保密介质中、进入地下室、与同事一起解锁 HSM、（使用 CA 根证书对应的私钥）签名证书，最后将签名证书从保密介质中拷贝出来；那么每天为大量网站签发证书是相当繁重乏味的工作。因此，CA 创建内部使用的中间 CA，用于证书签发自动化。

如果想查看证书链，可以在 Firefox 中点击地址栏的锁型图标，接着打开页面信息，然后点击“安全”面板中的“查看证书”按钮。在本文写作时，[opensource.com][20] 使用的证书链如下：

```
DigiCert High Assurance EV Root CA
    DigiCert SHA2 High Assurance Server CA
        opensource.com
```

### 中间人

我之前提到，浏览器需要核验证书中的主机名与已经建立连接的主机名一致。为什么需要这一步呢？要回答这个问题，需要了解所谓的[<ruby>中间人攻击<rt>man-in-the-middle, MIMT</rt></ruby>][22]。有一类[网络攻击][22]可以让攻击者将自己置身于客户端和服务端中间，冒充客户端与服务端连接，同时冒充服务端与客户端连接。如果网络流量是通过 HTTPS 传输的，加密的流量无法被窃听。此时，攻击者会创建一个代理，接收来自受害者的 HTTPS 连接，解密信息后构建一个新的 HTTPS 连接到原始目的地（即服务端）。为了建立假冒的 HTTPS 连接，代理必须返回一个攻击者具有对应私钥的证书。攻击者可以生成自签名证书，但受害者的浏览器并不会信任该证书，因为它并不是根证书库中的 CA 根证书签发的。换一个方法，攻击者使用一个受信任 CA 签发但主机名对应其自有域名的证书，结果会怎样呢？

再回到银行的那个例子，我们是银行柜员，一位男性顾客进入银行要求从 Jane Doe 的账户上取钱。当被要求提供身份证明时，他给出了 Joe Smith 的有效驾驶执照。如果这个交易可以完成，我们无疑会被银行开除。类似的，如果检测到证书中的主机名与连接对应的主机名不一致，浏览器会给出类似“连接不安全”的警告和查看更多内容的选项。在 Firefox 中，这类错误被标记为 `SSL_ERROR_BAD_CERT_DOMAIN`。

我希望你阅读完本文起码记住这一点：如果看到这类警告，**不要无视它们**！它们出现意味着，或者该网站配置存在严重问题（不推荐访问），或者你已经是中间人攻击的潜在受害者。

### 总结

虽然本文只触及了 PKI 世界的一些皮毛，我希望我已经为你展示了便于后续探索的大致蓝图。密码学和 PKI 是美与复杂性的结合体。越深入研究，越能发现更多的美和复杂性，就像分形那样。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/private-keys

作者：[Alex Wood][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/awood
[1]:https://linux.cn/article-9792-1.html
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
