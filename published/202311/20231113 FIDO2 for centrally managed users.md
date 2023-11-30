[#]: subject: "FIDO2 for centrally managed users"
[#]: via: "https://fedoramagazine.org/fido2-for-centrally-managed-users/"
[#]: author: "Iker Pedrosa https://fedoramagazine.org/author/ipedrosa/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16406-1.html"

为集中管理的用户提供 FIDO2 认证
=====

![][0]

Fedora 39 通过 SSSD 和 FreeIPA 为集中管理的用户开启了 FIDO2 认证功能。此篇文章将指导你如何进行配置和启用该功能。

### FIDO2

[FIDO2][4] 是以 [公钥加密][5] 为基础的开放式认证标准，比起密码和一次性密码（OTP），它的安全性更高且易用性更强。它通常以类似小型 USB 和基于 NFC 的硬件安全令牌的方式提供。有几种符合 FIDO 认可的密钥品牌，例如：YubiKey、NitroKey、SoloKey v2 等等。

此协议的优势包括：

  * 通过使用公钥加密来消除密码，从而实现无密码认证。
  * 采用 [多因素认证][6]（MFA）以实现强力认证。
  * 减少了应用程序之间密码或公钥的重复使用，降低数据泄露的风险。
  * 私钥位于安全令牌中并且永不离开，这大大减少了被网络钓鱼的威胁。

#### 前面的文章

在 Fedora 杂志中，有多篇文章阐述了如 FIDO2 的应用场景：《[如何使用 FIDO2 验证本地用户][7]》 和 《[如何解锁硬盘][8]》。而此篇文章介绍了如何使用 FIDO2 验证远程用户。请注意，上述所说的设备，主要是指那些来自 Yubico 采用了其他协议的设备，而此篇指南的目的并非讨论这些协议。

### 集中管理的用户

[SSSD][9] 和 [FreeIPA][10] 最近新增了一个名为 <ruby>[通行密钥][11]<rt>passkey</rt></ruby> 的特性，以便对集中管理的用户执行 FIDO2 认证。此功能目前只在 [SSSD 2.9.0][12] 和 [FreeIPA 4.11.0][13] 等版本中支持。

Fedora 39 已经包含了这些版本，因此，它是第一个为集中管理的用户启用 FIDO2 认证的发行版。此外，用户在认证成功后，也会一并获取一个 Kerberos 票据，实现对其他服务的身份证明。

请注意，从这里开始，我将交替使用 FIDO2 和通行密钥这两个术语。

### FIDO2 认证

#### FIDO2 配置

作为额外的安全措施，应在设备中启用 MFA 以防你丢失了密钥，恶意行为者无法使用它进行认证。

列出连接的通行密钥设备：

```
$ fido2-token -L
```

为你的通行密钥设备设置 PIN（将大写字母替换为所需的）：

```
$ fido2-token -C /dev/hidrawX
```

如果你有一个兼容的设备，你还可以启用其他认证因素，例如指纹。

#### 集中用户配置

首先，我们来创建一个用户，并将通行密钥（`passkey`）设置为其认证方式（请根据需要将大写字母替换为相应的）：

```
$ ipa user-add USERNAME --first NAME --last SURNAME --user-auth-type=passkey
```

或者，如果你已有一个用户，并只需要将 `passkey` 设置为其认证方式：

```
$ ipa user-mod USERNAME --user-auth-type=passkey
```

#### 集中管理用户的 FIDO2 注册

接下来，我们为该用户注册这个通行密钥。这个步骤会提示你输入 PIN 码，随后触摸设备：

```
$ ipa user-add-passkey USERNAME --register
Enter PIN:
Please touch the device.
------------------------------------
Added passkey mappings to user "USERNAME"
------------------------------------
    User login: USERNAME
    Passkey mapping: passkey:XR/MXigmgiBz1z7/RlWoWZkXKIEf1x9Ux5uPNxtzzSTdTiF407u2nRYMPkK8pWjwUR8Aa2urCcC9cnpLbkKgFg==,MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEZqgERsFFv4Yev1dyo2Ap4PvLirg3P3Uhig5mNA4qf061C9q5rg0nMDz9AOYxZmBrwvQEXHCasMNO9VAIVnBIVg==
```

此刻，用户的认证已准备就绪。

注意，如果你想在生产环境中使用此用户，我建议你至少注册两个不同的设备。这样，即使你丢失了其中一个设备，你也可以用另一个进行认证。

#### 集中管理的用户的 FIDO2 认证

在初次尝试中，只有在物理连接令牌的系统中才能进行认证。这意味着你可以使用 `su` 或图形界面，但不能远程使用 ssh。

我们来试试使用 `su`，记得将大写字母替换为所需的。当要求你输入 PIN，然后触摸设备时，当设备灯闪烁时触摸它：

```
$ su - USERNAME@DOMAIN
Insert your passkey device, then press ENTER.
Enter PIN:
```

如果一切进行顺利，Kerberos 票据也应已被授予，然后你就可以向其他服务进行远程认证：

```
$ klist
Ticket cache: KCM:879400005:34862
Default principal: USERNAME@DOMAIN
Valid starting Expires        Service principal
10/20/23 09:46:04  10/21/23 09:32:37  krbtgt/DOMAIN@DOMAIN
```

### 结论

此认证机制的目标是提升安全性。通过使用一种众所周知、开放式的标准实现无密码和多因素认证，从而降低数据泄露和网络钓鱼威胁的风险。用户只需要一个硬件令牌及另外一个如 PIN 或者指纹的认证方式，从而消除对密码的需求，同时提供了方便的多因素认证方法。更进一步，每个应用或服务都使用一个唯一的密钥，这样任何一个应用或服务的数据泄露都不会影响其他的。最后，用户并不需要知道他们的凭据的具体细节，只需了解他们使用了一个实体令牌，这极大地降低了社交工程攻击的可能性。

*（题图：MJ/838d5392-79b4-4c22-ab0f-c2ada4bf2833）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fido2-for-centrally-managed-users/

作者：[Iker Pedrosa][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ipedrosa/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/10/featured_image-816x345.png
[2]: https://unsplash.com/@lazycreekimages?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/skeleton-key-surround-with-dry-leaves-1bjsASjhfkE?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://fidoalliance.org/fido2/
[5]: https://en.wikipedia.org/wiki/Public-key_cryptography
[6]: https://en.wikipedia.org/wiki/Multi-factor_authentication
[7]: https://fedoramagazine.org/use-fido-u2f-security-keys-with-fedora-linux/
[8]: https://fedoramagazine.org/use-systemd-cryptenroll-with-fido-u2f-or-tpm2-to-decrypt-your-disk/
[9]: https://sssd.io/
[10]: https://freeipa.readthedocs.io/en/latest/
[11]: https://fedoraproject.org/wiki/Changes/Passkey_authentication_centrally_managed_users
[12]: https://sssd.io/release-notes/sssd-2.9.0.html
[13]: https://www.freeipa.org/release-notes/4-11-0.html
[0]: https://img.linux.net.cn/data/attachment/album/202311/23/095049o1kdwqugdgw5d1mk.png