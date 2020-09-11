[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10921-1.html)
[#]: subject: (Be your own certificate authority)
[#]: via: (https://opensource.com/article/19/4/certificate-authority)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez/users/elenajon123)


自己成为一个证书颁发机构（CA）
======

> 为你的微服务架构或者集成测试创建一个简单的内部 CA。

![](https://img.linux.net.cn/data/attachment/album/201905/31/091023sg9s0ss11rsoseqg.jpg)

传输层安全（[TLS][2]）模型（有时也称它的旧名称 SSL）基于<ruby>[证书颁发机构][3]<rt>certificate authoritie</rt></ruby>（CA）的概念。这些机构受到浏览器和操作系统的信任，从而*签名*服务器的的证书以用于验证其所有权。

但是，对于内部网络，微服务架构或集成测试，有时候*本地 CA*更有用：一个只在内部受信任的 CA，然后签名本地服务器的证书。

这对集成测试特别有意义。获取证书可能会带来负担，因为这会占用服务器几分钟。但是在代码中使用“忽略证书”可能会被引入到生产环境，从而导致安全灾难。

CA 证书与常规服务器证书没有太大区别。重要的是它被本地代码信任。例如，在 Python `requests` 库中，可以通过将 `REQUESTS_CA_BUNDLE` 变量设置为包含此证书的目录来完成。

在为集成测试创建证书的例子中，不需要*长期的*证书：如果你的集成测试需要超过一天，那么你应该已经测试失败了。

因此，计算**昨天**和**明天**作为有效期间隔：

```
>>> import datetime
>>> one_day = datetime.timedelta(days=1)
>>> today = datetime.date.today()
>>> yesterday = today - one_day
>>> tomorrow = today - one_day
```

现在你已准备好创建一个简单的 CA 证书。你需要生成私钥，创建公钥，设置 CA 的“参数”，然后自签名证书：CA 证书*总是*自签名的。最后，导出证书文件以及私钥文件。

```
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import hashes, serialization
from cryptography import x509
from cryptography.x509.oid import NameOID


private_key = rsa.generate_private_key(
    public_exponent=65537,
    key_size=2048,
    backend=default_backend()
)
public_key = private_key.public_key()
builder = x509.CertificateBuilder()
builder = builder.subject_name(x509.Name([
    x509.NameAttribute(NameOID.COMMON_NAME, 'Simple Test CA'),
]))
builder = builder.issuer_name(x509.Name([
    x509.NameAttribute(NameOID.COMMON_NAME, 'Simple Test CA'),
]))
builder = builder.not_valid_before(yesterday)
builder = builder.not_valid_after(tomorrow)
builder = builder.serial_number(x509.random_serial_number())
builder = builder.public_key(public_key)
builder = builder.add_extension(
    x509.BasicConstraints(ca=True, path_length=None),
    critical=True)
certificate = builder.sign(
    private_key=private_key, algorithm=hashes.SHA256(),
    backend=default_backend()
)
private_bytes = private_key.private_bytes(
    encoding=serialization.Encoding.PEM,
    format=serialization.PrivateFormat.TraditionalOpenSSL,
    encryption_algorithm=serialization.NoEncrption())
public_bytes = certificate.public_bytes(
    encoding=serialization.Encoding.PEM)
with open("ca.pem", "wb") as fout:
    fout.write(private_bytes + public_bytes)
with open("ca.crt", "wb") as fout:
    fout.write(public_bytes)
```

通常，真正的 CA 会需要[证书签名请求][4]（CSR）来签名证书。但是，当你是自己的 CA 时，你可以制定自己的规则！可以径直签名你想要的内容。

继续集成测试的例子，你可以创建私钥并立即签名相应的公钥。注意 `COMMON_NAME` 需要是 `https` URL 中的“服务器名称”。如果你已配置名称查询，你需要服务器能响应对 `service.test.local` 的请求。

```
service_private_key = rsa.generate_private_key(
    public_exponent=65537,
    key_size=2048,
    backend=default_backend()
)
service_public_key = service_private_key.public_key()
builder = x509.CertificateBuilder()
builder = builder.subject_name(x509.Name([
   x509.NameAttribute(NameOID.COMMON_NAME, 'service.test.local')
]))
builder = builder.not_valid_before(yesterday)
builder = builder.not_valid_after(tomorrow)
builder = builder.public_key(public_key)
certificate = builder.sign(
    private_key=private_key, algorithm=hashes.SHA256(),
    backend=default_backend()
)
private_bytes = service_private_key.private_bytes(
    encoding=serialization.Encoding.PEM,
    format=serialization.PrivateFormat.TraditionalOpenSSL,
    encryption_algorithm=serialization.NoEncrption())
public_bytes = certificate.public_bytes(
    encoding=serialization.Encoding.PEM)
with open("service.pem", "wb") as fout:
    fout.write(private_bytes + public_bytes)
```

现在 `service.pem` 文件有一个私钥和一个“有效”的证书：它已由本地的 CA 签名。该文件的格式可以给 Nginx、HAProxy 或大多数其他 HTTPS 服务器使用。

通过将此逻辑用在测试脚本中，只要客户端配置信任该 CA，那么就可以轻松创建看起来真实的 HTTPS 服务器。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/certificate-authority

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez/users/elenajon123
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_commun_4604_02_mech_connections_rhcz0.5x.png?itok=YPPU4dMj
[2]: https://en.wikipedia.org/wiki/Transport_Layer_Security
[3]: https://en.wikipedia.org/wiki/Certificate_authority
[4]: https://en.wikipedia.org/wiki/Certificate_signing_request
