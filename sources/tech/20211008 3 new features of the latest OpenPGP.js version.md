[#]: subject: "3 new features of the latest OpenPGP.js version"
[#]: via: "https://opensource.com/article/21/10/openpgpjs"
[#]: author: "Daniel Huigens https://opensource.com/users/twiss"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 new features of the latest OpenPGP.js version
======
OpenPGP.js is a cryptography library that implements the OpenPGP
standard, most commonly used for email encryption.
![email or newsletters via inbox and browser][1]

[OpenPGP.js][2] is a cryptography library that implements the [OpenPGP standard][3], most commonly used for email encryption. ProtonMail, Mailvelope, and FlowCrypt all use OpenPGP.js, to name a few. That means the OpenPGP.js library encrypts millions of users' messages.

The OpenPGP standard, first published in the 1990s, like almost anything, requires maintenance and updating for both security and usability. A "crypto refresh" of the standard [is in the works][4], which adds modern encryption algorithms and deprecates outdated ones. To improve usability, various email applications now allow users to seamlessly encrypt their communication—without managing their keys or those of their contacts.

First released in 2014, OpenPGP.js began based on an early prototype called GPG4Browsers, which is based on several scripts by Herbert Hanewinkel (among other contributors). The second version of OpenPGP.js, released in 2016, was completely reworked to use Uint8Arrays instead of strings (which significantly increased its performance) and modern ES6 modules rather than CommonJS modules internally. Versions 3 and 4, both released in 2018, added support for Elliptic-curve cryptography (ECC) and streaming, respectively.

My team and I continue working on OpenPGP.js to ensure its evolution as an easy-to-use library for strong encryption.

### 1\. Elliptic-curve cryptography by default

In OpenPGP.js version 4, RSA was used when generating new keys by default. Although ECC is faster and more secure, Curve25519 had not been standardized in the OpenPGP specification yet. The crypto refresh draft does include Curve25519, and it is expected to be included "as is" in the next version of the OpenPGP specification, so OpenPGP.js version 5 now generates keys using ECC by default.

### 2\. Import only the modules you need

Similarly, while OpenPGP.js used ES6 modules internally for years, version 4 still didn't publish a proper ES6 module. Instead, it published only a Univeral Module Definition (UMD) module that could run both in the browser and on Node.js. In version 5, this changes by publishing separate modules for the browser and Node.js (both ES6 and non-ES6), making it easier for library users to import OpenPGP.js on all platforms and (when using the ES6 module) only import the parts they need. This is enabled in large part by switching the build system to [rollup][5].

### 3\. Reject weak cryptography

There are also many other security improvements. For example, 1024-bit RSA keys, ElGamal, and DSA keys are considered insecure and are rejected by default. Additionally, where version 4 already defaulted to AES-encryption, version 5 now refuses to encrypt using weaker algorithms entirely by default, even if the public key claims to only support a weaker algorithm. It instead assumes that all OpenPGP implementations support AES (which has been the case for a very long time).

### What's next for OpenPGP.js

Looking ahead, there are some security improvements to make. Key fingerprints, used to identify public keys, still use SHA-1, though a fix for this is planned in the crypto refresh. In the meantime, it is recommended to use different means to ascertain the authenticity of any public key used for encryption, such as by fetching the entire key directly from the recipient's domain using the proposed [Web Key Directory (WKD)][6] standard—already implemented by various [email providers][7]. WKD support was built into OpenPGP.js version 4 but is a separate module in version 5 to keep the main library lean.

Similarly, when encrypting messages or files with a password rather than a public key (uncommon when using OpenPGP for email encryption, but more so when used for encrypted backups, for example), the password is converted to a symmetric key using a relatively weak key derivation function (KDF). It is thus advisable for applications to pass the user's password through a strong KDF, such as [Argon2][8] or [scrypt][9], before passing it to OpenPGP.js. Hopefully, the crypto refresh will include one of these algorithms to implement in a future version of OpenPGP.js.

### How to use OpenPGP.js version 5

For now, though, OpenPGP.js version 5 has been [published][10] to the npm package registry. If you like, feel free to try it out! Feedback is welcome in the [discussions tab][11] on GitHub. Please note, however, that while OpenPGP.js is a general-purpose encryption library, its primary use case is in situations where compatibility with the OpenPGP specification is required (for example, when sending or receiving PGP-encrypted email). For other use cases, a different library may be a more appropriate or performant choice. In general, of course, be careful when rolling any crypto.

Thanks for reading, and here's to securing the future of email!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/openpgpjs

作者：[Daniel Huigens][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
