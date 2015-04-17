在 Apache、NGINX 和 Lighttpd 上启用 HTTP 公钥固定扩展（HPKP）
================================================================================

公钥固定（Public Key Pinning）是指一个证书链中必须包含一个白名单中的公钥，也就是说只有被列入白名单的证书签发机构（CA）才能为某个域名`*.example.com`签发证书，而不是你的浏览器中所存储的任何 CA 都可以为之签发。本文讲述了这种机制的背景知识，并提供了 Apache、 Lighttpd 和 NGINX 上的配置范例。

### HTTP 公钥固定扩展 ###

用你使用的银行做个例子，它一直使用 CA 公司 A 为其签发证书。但是在当前的证书体系下，CA 公司 B、CA 公司 C 和 NSA 的 CA 都能给你的银行创建证书，而你的浏览器会毫无疑虑的接受它们，因为这些公司都是你所信任的根 CA。

如果你的银行实现了 HPKP 并固定了它们的第一个中级证书（来自 CA 公司 A），那么浏览器将不会接受来自CA 公司 B 和 CA 公司 C 的证书，即便它们也有一个有效的信任链。HPKP 也允许你的浏览器将这种违例行为报告给该银行，以便银行知道被伪造证书攻击了。

HTTP 公钥固定扩展是一个从2011年开始开发的针对 HTTP 用户代理（即浏览器）的公钥固定标准。它由 Google 发起，甚至在 Chrome 中实现的固定机制可以使用一个人工维护的网站公钥固定列表，这个列表包含了固定的几个网站的公钥签名。（LCTT 译注：Chrome 和 FireFox 32 及以后版本都支持公钥固定机制，并使用内置的人工维护的公钥固定列表数据，这些数据随着浏览器软件的更新而更新，主要包括几个大型站点。目前还只有 Chrome 38+ 支持通过 HTTP 响应头传递公钥固定信息。）

以下是 HPKP 的几个功能简述：

- HPKP 是在 HTTP 层面设置的，使用 `Public-Key-Pins` （PKP）响应头。
- 该规则的保留周期通过 max-age 参数设置，单位是秒。
- PKP 响应头只能用于正确的安全加密通讯里面。
- 如果出现了多个这样的响应头，则只处理第一个。
- 固定机制可以使用`includeSubDomains`参数扩展到子域。
- 当接收到一个新的 PKP 响应头时，它会覆盖之前存储的公钥固定和元数据。
- 公钥固定是用哈希算法生成的，其实是一个“主题公钥信息（SKPI）”指纹。

本文首先会介绍一些 HPKP 工作的原理，接下来我们会展示给你如何得到需要的指纹并配置到 web 服务器中。

### SPKI 指纹 - 理论 ###

以下摘自 Adam Langley 的[帖子][1]，我们哈希的是一个公钥，而不是证书：

> 通常来说，对证书进行哈希是一个显而易见的解决方案，但是其实这是错的。不能这样做的原因是 CA 证书可以不断重新签发：同一个公钥、主题名可以对应多个证书，而这些证书有不同的延展或失效时间。浏览器从下至上地在证书池中构建证书链时，另外一个版本的证书可能就替代匹配了你原本所期望的证书。
> 
> 举个例子，StartSSL 有两个根证书：一个是以 SHA1 签名的，另外是一个是 SHA256。如果你希望固定住 StartSSL 作为你的 CA，那么你该使用哪个证书呢？你也许可以使用这两个，但是如果我不告诉你，你怎么会知道还有一个根证书呢？
> 
> 相反地，对公钥进行哈希则不会有这个问题：
>
> 浏览器假定子证书是固定不动的：它总是证书链的起点。子证书所携带的签名一定是一个有效的签名，它来自其父证书给这个证书专门签发的。这就是说，父证书的公钥相对于子证书来说是固定的。所以可推论公钥链是固定的。
>
> 唯一的问题是你不能固定到一个交叉认证的根证书上。举个例子，GoDaddy 的根证书是 Valicert 签名的，这是为了让那些不能识别 GoDaddy 根证书的老客户可以信任其证书。然而，你不能固定到 Valicert 上，因为新的客户在证书链上发现了 GoDaddy 证书就会停止上溯（LCTT 译注：所以就找不到固定信息了）。
>
> 此外，我们是对 SubjectPublicKeyInfo（SPKI）进行哈希而不是对公钥位串。SPKI 包括了公钥类型、公钥自身及其相关参数。这很重要，因为如果对公钥进行哈希就有可能导致发生曲解攻击。对于一个 Diffie-Hellman 公钥而言：如果仅对公钥进行哈希，而不是对完整的 SPKI，那么攻击者可以使用同样的公钥而让客户端将其解释为其它组。同样地，这样也有可能强制将一个 RSA 密钥当成 DSA 密钥解释等等。

### 固定在哪里 ###

你应该固定在什么地方？固定你自己的公钥并不是一个最好的办法。你的密钥也许会改变或撤销。你也许会使用多个证书，经常轮换证书的话密钥就改变了。也许由于服务器被入侵而撤销证书。

最容易但是不是太安全的方法是固定第一个中级 CA 证书。该证书是签名在你的网站证书之上的，所以签发该证书的 CA 的公钥肯定是在证书链上的。

采用这种方法你可以从同一个 CA 更新你的证书而不用担心固定信息不对。如果该 CA 发行了一个不同的根证书，也许你会遇到一些问题，对此并没有太好的解决方案。不过你可以通过如下做法来减轻这种问题的影响：

- 从一个不同的 CA 申请一个备用的证书，并固定该备份。

RFC 里面说你至少需要做两个固定。一个是当前连接所使用的证书链上的，另外一个是备份的。

另外的固定是对备份公钥的，它可以是来自另外一个给你签发证书的不同 CA 的 SKPI 指纹。

在这个问题上还有一种**更安全**的方法，就是事先创建好至少三个独立的公钥（使用 OpenSSL，参见[此页][2] 了解 Javascript OpenSSL 命令生成器），并将其中两个备份到一个安全的地方，离线存储、不要放到网上。

为这三个证书创建 SPKI 指纹并固定它们，然后仅使用第一个作为当前的证书。当需要时，你可以使用备份密钥之一。不过你需要让 CA 给你做签名来生成证书对，这可能需要几天，依你的 CA 的工作情况而定。

对于 HPKP 来说这没有问题，因为我们使用的是公钥的 SPKI 哈希，而不是证书。失效或不同的 CA 签名链并不影响。

如果你按照上述方法生成并安全存储了至少三个独立的密钥，并固定它们，也可以防止你的 CA 撤销你的网站证书并签发一个假证书时出现问题。

### SPKI 指纹 ###

可以使用如下的 OpenSSL 命令来生成 SPKI 指纹，它出现在 [RFC 草案][3] 中：

    openssl x509 -noout -in certificate.pem -pubkey | \
    openssl asn1parse -noout -inform pem -out public.key;
    openssl dgst -sha256 -binary public.key | openssl enc -base64

结果：

    klO23nT2ehFDXCfx3eHTDRESMz3asj1muO+4aIdjiuY=

上面输入的 `certificate.pem` 文件是本站（https://raymii.org）的证书链中第一个证书。（在写本文时， `COMODO RSA Domain Validation Secure Server CA, 序列号 2B:2E:6E:EA:D9:75:36:6C:14:8A:6E:DB:A3:7C:8C:07 。`）。

你也需要同样对你的另外两个备份公钥生成指纹。

### 故障 ###

在写本文时（2015/1），唯一支持 HPKP 的浏览器（chrome）有一个严重的问题：Chrome 并不能够区分 HSTS 和 HPKP 响应头中的 max-age 和 includeSubdomains 参数。也就是说，如果你的 HSTS 和 HPKP 设置了不同的 max-age 和 includeSubdomains 参数，它们会互相搞乱。关于这个故障的更多信息参见：[https://code.google.com/p/chromium/issues/detail?id=444511][4]。感谢 Scott Helme（[https://scotthelme.co.uk][5]）发现并告诉我这个 Chromium 项目的问题。

### Web 服务器配置 ###

下面你可以看到三个主流 Web 服务器的配置方法。这只是一个 HTTP 响应头，绝大多数 Web 服务器都可以设置它。它只需要设置到 HTTPS 网站上。

下面的例子固定到 `COMODO RSA Domain Validation Secure Server CA` 及备份的 `Comodo PositiveSSL` CA 上，30天失效期，包括所有的子域。


#### Apache ####

编辑你的 Apache 配置文件（如 `/etc/apache2/sites-enabled/website.conf 或 /etc/apache2/httpd.conf`），并添加下列行到你的 VirtualHost 中：

    # 如需要，载入 headers 模块。
    LoadModule headers_module modules/mod_headers.so
    
    Header set Public-Key-Pins "pin-sha256=\"klO23nT2ehFDXCfx3eHTDRESMz3asj1muO+4aIdjiuY=\"; pin-sha256=\"633lt352PKRXbOwf4xSEa1M517scpD3l5f79xMD9r9Q=\"; max-age=2592000; includeSubDomains"

#### Lighttpd ####

Lighttpd 更简单一些，将下列行添加到你的 Lighttpd 配置文件（如 `/etc/lighttpd/lighttpd.conf`）：

    server.modules += ( "mod_setenv" )
    $HTTP["scheme"] == "https" {
        setenv.add-response-header  = ( "Public-Key-Pins" => "pin-sha256=\"klO23nT2ehFDXCfx3eHTDRESMz3asj1muO+4aIdjiuY=\"; pin-sha256=\"633lt352PKRXbOwf4xSEa1M517scpD3l5f79xMD9r9Q=\"; max-age=2592000; includeSubDomains")
    }

#### NGINX ####

NGINX 的配置更简短。添加以下行到你的 HTTPS 配置的 server 块中：

    add_header Public-Key-Pins 'pin-sha256="klO23nT2ehFDXCfx3eHTDRESMz3asj1muO+4aIdjiuY="; pin-sha256="633lt352PKRXbOwf4xSEa1M517scpD3l5f79xMD9r9Q="; max-age=2592000; includeSubDomains';

### 报告功能 ###

HPKP 报告功能允许浏览器报告任何违例给你。

如果你在响应头中添加了附加的 `report-uri="http://example.org/hpkp-report"` 参数，并用该 URI 处理接收到的数据的话，客户端会在发现违例时发送报告给你。这个报告是以 POST 方式发送到你指定的 report-uri 上，并以类似下面的 JSON 格式：

    {
        "date-time": "2014-12-26T11:52:10Z",
        "hostname": "www.example.org",
        "port": 443,
        "effective-expiration-date": "2014-12-31T12:59:59",
        "include-subdomains": true,
        "served-certificate-chain": [
            "-----BEGINCERTIFICATE-----\nMIIAuyg[...]tqU0CkVDNx\n-----ENDCERTIFICATE-----"
        ],
        "validated-certificate-chain": [
            "-----BEGINCERTIFICATE-----\nEBDCCygAwIBA[...]PX4WecNx\n-----ENDCERTIFICATE-----"
        ],
        "known-pins": [
            "pin-sha256=\"dUezRu9zOECb901Md727xWltNsj0e6qzGk\"",
            "pin-sha256=\"E9CqVKB9+xZ9INDbd+2eRQozqbQ2yXLYc\""
        ]
    }

### 非强制，只报告 ###

HPKP 也可以设置为非强制的，可以使用 `Public-Key-Pins-Report-Only` 来只发送违例报告给你。

这样可以让你在网站不可访问或 HPKP 配置不正确时不固定，之后你可以将这个响应头改为 `Public-Key-Pins` 来强制固定。


--------------------------------------------------------------------------------

via: https://raymii.org/s/articles/HTTP_Public_Key_Pinning_Extension_HPKP.html

作者：[Remy van Elst][a]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://raymii.org/
[1]:http://www.imperialviolet.org/2011/05/04/pinning.html
[2]:https://raymii.org/s/software/OpenSSL_Command_Generator.html
[3]:https://tools.ietf.org/html/draft-ietf-websec-key-pinning-21#appendix-A
[4]:https://code.google.com/p/chromium/issues/detail?id=444511
[5]:https://scotthelme.co.uk/