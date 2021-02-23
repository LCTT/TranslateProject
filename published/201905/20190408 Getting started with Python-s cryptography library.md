[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10833-1.html)
[#]: subject: (Getting started with Python's cryptography library)
[#]: via: (https://opensource.com/article/19/4/cryptography-python)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Python 的加密库入门
======

> 加密你的数据并使其免受攻击者的攻击。

![lock on world map][1]

密码学俱乐部的第一条规则是：永远不要自己*发明*密码系统。密码学俱乐部的第二条规则是：永远不要自己*实现*密码系统：在现实世界中，在*实现*以及设计密码系统阶段都找到过许多漏洞。

Python 中的一个有用的基本加密库就叫做 [cryptography][2]。它既是一个“安全”方面的基础库，也是一个“危险”层。“危险”层需要更加小心和相关的知识，并且使用它很容易出现安全漏洞。在这篇介绍性文章中，我们不会涵盖“危险”层中的任何内容！

cryptography 库中最有用的高级安全功能是一种 Fernet 实现。Fernet 是一种遵循最佳实践的加密缓冲区的标准。它不适用于非常大的文件，如千兆字节以上的文件，因为它要求你一次加载要加密或解密的内容到内存缓冲区中。

Fernet 支持<ruby>对称<rt>symmetric</rt></ruby>（即<ruby>密钥<rt>secret key</rt></ruby>）加密方式*：加密和解密使用相同的密钥，因此必须保持安全。

生成密钥很简单：

```
>>> k = fernet.Fernet.generate_key()
>>> type(k)
<class 'bytes'>
```

这些字节可以写入有适当权限的文件，最好是在安全的机器上。

有了密钥后，加密也很容易：

```
>>> frn = fernet.Fernet(k)
>>> encrypted = frn.encrypt(b"x marks the spot")
>>> encrypted[:10]
b'gAAAAABb1'
```

如果在你的机器上加密，你会看到略微不同的值。不仅因为（我希望）你生成了和我不同的密钥，而且因为 Fernet 将要加密的值与一些随机生成的缓冲区连接起来。这是我之前提到的“最佳实践”之一：它将阻止对手分辨哪些加密值是相同的，这有时是攻击的重要部分。

解密同样简单：

```
>>> frn = fernet.Fernet(k)
>>> frn.decrypt(encrypted)
b'x marks the spot'
```

请注意，这仅加密和解密*字节串*。为了加密和解密*文本串*，通常需要对它们使用 [UTF-8][3] 进行编码和解码。

20 世纪中期密码学最有趣的进展之一是<ruby>公钥<rt>public key</rt></ruby>加密。它可以在发布加密密钥的同时而让*解密密钥*保持保密。例如，它可用于保存服务器使用的 API 密钥：服务器是唯一可以访问解密密钥的一方，但是任何人都可以保存公共加密密钥。

虽然 cryptography 没有任何支持公钥加密的*安全*功能，但 [PyNaCl][4] 库有。PyNaCl 封装并提供了一些很好的方法来使用 Daniel J. Bernstein 发明的 [NaCl][5] 加密系统。

NaCl 始终同时<ruby>加密<rt>encrypt</rt></ruby>和<ruby>签名<rt>sign</rt></ruby>或者同时<ruby>解密<rt>decrypt</rt></ruby>和<ruby>验证签名<rt>verify signature</rt></ruby>。这是一种防止<ruby>基于可伸缩性<rt>malleability-based</rt></ruby>的攻击的方法，其中攻击者会修改加密值。

加密是使用公钥完成的，而签名是使用密钥完成的：

```
>>> from nacl.public import PrivateKey, PublicKey, Box
>>> source = PrivateKey.generate()
>>> with open("target.pubkey", "rb") as fpin:
... target_public_key = PublicKey(fpin.read())
>>> enc_box = Box(source, target_public_key)
>>> result = enc_box.encrypt(b"x marks the spot")
>>> result[:4]
b'\xe2\x1c0\xa4'
```

解密颠倒了角色：它需要私钥进行解密，需要公钥验证签名：

```
>>> from nacl.public import PrivateKey, PublicKey, Box
>>> with open("source.pubkey", "rb") as fpin:
... source_public_key = PublicKey(fpin.read())
>>> with open("target.private_key", "rb") as fpin:
... target = PrivateKey(fpin.read())
>>> dec_box = Box(target, source_public_key)
>>> dec_box.decrypt(result)
b'x marks the spot'
```

最后，[PocketProtector][6] 库构建在 PyNaCl 之上，包含完整的密钥管理方案。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/cryptography-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-cloud-safe.png?itok=yj2TFPzq (lock on world map)
[2]: https://cryptography.io/en/latest/
[3]: https://en.wikipedia.org/wiki/UTF-8
[4]: https://pynacl.readthedocs.io/en/stable/
[5]: https://nacl.cr.yp.to/
[6]: https://github.com/SimpleLegal/pocket_protector/blob/master/USER_GUIDE.md
