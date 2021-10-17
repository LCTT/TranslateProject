[#]: subject: "3 new features of the latest OpenPGP.js version"
[#]: via: "https://opensource.com/article/21/10/openpgpjs"
[#]: author: "Daniel Huigens https://opensource.com/users/twiss"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13888-1.html"

最新 OpenPGP.js 版本的 3 个新功能
======

> OpenPGP.js 是一个实现了 OpenPGP 标准的密码学库，最常用于电子邮件加密。

![](https://img.linux.net.cn/data/attachment/album/202110/16/115721k1vi1ekzip1kpqkg.jpg)

[OpenPGP.js][2] 是一个实现了 [OpenPGP 标准][3] 的密码学库，最常用于电子邮件加密。ProtonMail、Mailvelope 和 FlowCrypt 都使用 OpenPGP.js，这还仅仅是其中一些。也就是说 OpenPGP.js 库对数百万用户的信息进行了加密。

OpenPGP 标准首次发布于 20 世纪 90 年代，像几乎任何东西一样，需要维护和更新，以保证安全和可用性。该标准的“加密刷新” [正在进行中][4]，它增加了现代的加密算法并废除了过时的算法。为了提高可用性，各种电子邮件应用程序现在允许用户无缝加密他们的通信，用户无需管理他们的密钥或他们的联系人的密钥。

OpenPGP.js 于 2014 年首次发布，开始基于一个名为 GPG4Browsers 的早期原型，该原型基于 Herbert Hanewinkel（以及其他贡献者）的几个脚本。OpenPGP.js 的第二个版本于 2016 年发布，完全重新设计，使用 Uint8Arrays 而不是字符串（这大大增加了其性能），并在内部使用现代 ES6 模块而不是 CommonJS 模块。第 3 和第 4 版都是在 2018 年发布的，分别增加了对椭圆曲线加密法（ECC）和流的支持。

我和我的团队继续在 OpenPGP.js 上工作，以确保其发展为一个易于使用的强加密库。

### 1、默认的椭圆曲线加密

在 OpenPGP.js 第 4 版中，生成新密钥时默认使用 RSA。虽然 ECC 更快、更安全，但 Curve25519 还没有在 OpenPGP 规范中得到标准化。加密刷新草案包括了 Curve25519，并且预计它将“按原样”包含在下一版本的 OpenPGP 规范中，因此 OpenPGP.js 第 5 版现在默认使用 ECC 生成密钥。

### 2、只导入你需要的模块

同样，虽然 OpenPGP.js 内部使用 ES6 模块多年，但第 4 版仍然没有发布一个合适的 ES6 模块。相反，它只发布了一个<ruby>通用模块定义<rt>Univeral Module Definition</rt></ruby>（UMD）模块，可以在浏览器和 Node.js 上运行。在第 5 版中，这种情况有所改变，为浏览器和 Node.js 发布了单独的模块（包括 ES6 和非 ES6），使库用户更容易在所有平台上导入 OpenPGP.js ，且（当使用 ES6 模块时）只导入他们需要的部分。这在很大程度上是通过将构建系统切换到 [rollup][5] 来实现的。

### 3、拒绝弱加密技术

还有许多其他的安全改进。例如，1024 位 RSA 密钥、ElGamal 和 DSA 密钥被认为是不安全的，并被默认拒绝。此外，第 4 版已经默认使用 AES 加密，第 5 版现在完全默认拒绝使用较弱的算法进行加密，即使公钥声称只支持较弱的算法。相反，它假定所有的 OpenPGP 实现都支持 AES（这种情况已经存在很长时间了）。

### OpenPGP.js 的下一步是什么？

展望未来，有一些安全方面的改进要做。用于识别公钥的密钥指纹仍然使用 SHA-1，尽管在加密技术更新中计划对此进行修复。同时，建议使用不同的方法来确定用于加密的任何公钥的真实性，例如使用提议的 <ruby>[网络密钥目录][6]<rt>Web Key Directory</rt></ruby>（WKD）标准直接从收件人的域中获取整个密钥，这已经由各种 [电子邮件提供商][7] 实现。WKD 支持内置于 OpenPGP.js 第 4 版，但在第 5 版中是一个单独的模块，以保持主库的精简。

同样，当用密码而不是公钥加密信息或文件时（例如：在使用 OpenPGP 进行电子邮件加密时不常见，但在用于加密备份时更常见），密码会使用相对较弱的<ruby>密钥衍生函数<rt>Key Derivation Function</rt></ruby>（KDF）转换为对称密钥。因此，建议应用在将用户的密码传递给 OpenPGP.js 之前，先通过一个强大的 KDF，如 [Argon2][8] 或 [scrypt][9]。希望加密刷新草案会包括这些算法中的一种，以便在未来的 OpenPGP.js 版本中实现。

### 如何使用 OpenPGP.js 第 5 版

不过现在，OpenPGP.js 第 5 版已经 [发布][10] 到 npm 仓库。如果你喜欢，可以随时试用！欢迎在 GitHub 的 [讨论版][11] 中进行反馈。然而，请注意，虽然 OpenPGP.js 是一个通用的加密库，但它的主要使用情况是在需要与 OpenPGP 规范兼容的情况下（例如，在发送或接收 PGP 加密的电子邮件时）。对于其他的使用情况，不同的库可能是一个更合适或性能更好的选择。当然，总的来说，在尝试使用任何加密技术时都要小心。

感谢阅读，这里是保护电子邮件的未来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/openpgpjs

作者：[Daniel Huigens][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/twiss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/newsletter_email_mail_web_browser.jpg?itok=Lo91H9UH (email or newsletters via inbox and browser)
[2]: https://github.com/openpgpjs/openpgpjs
[3]: https://tools.ietf.org/html/rfc4880
[4]: https://datatracker.ietf.org/doc/charter-ietf-openpgp/
[5]: https://rollupjs.org/
[6]: https://datatracker.ietf.org/doc/html/draft-koch-openpgp-webkey-service
[7]: https://wiki.gnupg.org/WKD#Mail_Service_Providers_offering_WKD
[8]: https://en.wikipedia.org/wiki/Argon2
[9]: https://en.wikipedia.org/wiki/Scrypt
[10]: https://www.npmjs.com/package/openpgp
[11]: https://github.com/openpgpjs/openpgpjs/discussions
