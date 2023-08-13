[#]: subject: "Use FIDO U2F security keys with Fedora Linux"
[#]: via: "https://fedoramagazine.org/use-fido-u2f-security-keys-with-fedora-linux/"
[#]: author: "Alexander Wellbrock https://fedoramagazine.org/author/w4tsn/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16091-1.html"

在 Fedora Linux 上使用 FIDO U2F 安全密钥
======

![][0]

FIDO U2F 安全密钥是一种小型的基于 USB/NFC 的设备。它是一种硬件安全令牌，具有多个安全相关的用途模块。FIDO U2F 标准兼容的密钥品牌有多种，包括 NitroKey、SoloKey v2 和 YubiKey。与类似 Yubico OTP 的专有协议相比，FIDO 协议是不依赖特定硬件令牌的，并且使用的工具也不依赖特定制造商。

本文介绍了 FIDO 协议，并展示了如何安装和启用 FIDO U2F 安全密钥作为替代身份验证因素，以用于登录终端、GDM 或进行 sudo 认证。

对于 YubiKey，特别是其不支持 FIDO2/U2F 的旧版设备，请参阅之前的文章：

> **[如何在 Fedora Linux 上使用 YubiKey][4]**

本文不涵盖存储 OpenPGP 密钥或 X.509 证书的操作，因为这些功能与硬件相关，不属于 FIDO U2F 标准的一部分。

### 保留备用安全密钥

一旦你开始使用安全令牌，就必须考虑到自己可能会被锁定在与这些令牌相关联的账户之外的情况。由于硬件安全令牌是独特的，并且被设计为非常难以复制，你不能像在使用 KeePass 或 AndOTP 等软件保险库时那样制作备份。因此，你使用主要密钥进行的所有注册都应立即使用第二个备份密钥重复进行，并将其存储在安全的位置，甚至可能是保险箱中。

在实践中，这意味着你需要将两个硬件令牌注册到你的 Linux 和 Web 账户中，并生成两份 OpenSSH 私钥，并将这两份 OpenSSH 公钥上传到你使用的服务器和服务（例如 GitHub）中。

如果你丢失了一个密钥，你将需要使用第二个密钥登录与密钥注册的每个服务，删除丢失的密钥，并注册一个新密钥。对于使用 FIDO2 协议的无密码登录尤其如此。

### FIDO2、U2F 和 FIDO 联盟

FIDO2 是由 [FIDO 联盟][5] 维护的一系列标准。FIDO 联盟希望最终完全摒弃密码，并提供通过多个因素安全验证用户身份的过程，而无需使用密码。

该标准包括万维网联盟（W3C）的 <ruby>网页认证<rt>Web Authentication</rt></ruby>（WebAuthn）和 FIDO 联盟的 <ruby>客户端到认证器协议<rt>Client-to-Authenticator Protocol</rt></ruby>（CTAP）。WebAuthn 是一种用于请求和处理公钥挑战进行认证的标准 API。通过这个标准，浏览器会向客户端发送一个 <ruby>挑战<rt>challenge</rt></ruby>，然后客户端使用私钥生成一个 <ruby>响应<rt>response</rt></ruby>，挑战者再使用之前交换的公钥进行验证。如何生成挑战答案对于服务来说是不可知的，而是由 CTAP 控制。用户可能会被要求使用多种验证方法，如生物识别、PIN 或存在性检查（或这些方法的组合）。这些验证方式在认证时与注册密钥时的方式相同。

为了保护与硬件令牌的任何交互，可以选择设置一个访问 PIN，并且默认情况下未设置。大多数密钥在连续八次输入访问 PIN 失败后将自动失效。恢复失效的密钥并设置新 PIN 的唯一方法是重置密钥。然而，当密钥重置时，所有其服务注册将丢失！

FIDO2 密钥还支持 FIDO U2F 协议（现已更名为 CTAP1）。该协议旨在提供第二或多因素（但非无密码）认证。Linux 的 PAM 认证系统也可以配置为使用 U2F 协议。虽然 FIDO U2F 不是为无密码认证设计的，但 U2F PAM 模块允许无密码认证。

### 安全影响

FIDO2 / U2F 通过将安全密钥与用户账户绑定来工作。大多数密钥默认启用/使用基本的存在性检查。它们通常通过点亮并提示你触摸密钥来进行存在性检查。FIDO2 PIN 是可选的，默认情况下未设置。当密钥用于登录 Linux 帐户或用于使用 sudo 时，只需确保设备和密钥物理上存在即可。FIDO2 PIN 是一个重要的附加验证步骤，用于确保只有你才能使用密钥进行身份验证。

> 等一下！现在我还要记住额外的 PIN 吗？这不就是一个更短的密码吗？
>
> —— 担心的读者

FIDO2 PIN 不是密码，它是一个简短、容易记住的短语。这并不是一个问题，因为：

  1. 你需要物理访问密钥 _且_ 需要知道 PIN。
  2. 输入 PIN 错误达到八次会使密钥失效，这使得暴力破解变得困难。

相反地，现在你可以使用存储在密码管理器中的安全密码，而无需记住它。

谷歌在 2016 年进行的一项案例研究，题为 《安全密钥：现代网络的实用密码学第二因素》，显示了安全密钥有效地保护用户免受密码重用、钓鱼和中间人攻击的影响。

### 使用 PAM 进行用户认证

本地系统认证使用 [可插拔认证模块（PAM）][7]。U2F 设备的 PAM 模块（因此进行认证）是 `pam_u2f`。你的密钥是否支持 FIDO2 或 FIDO U2F 取决于其固件版本和硬件型号。

设置如下：

  1. 安装 PAM 模块。
  2. 将密钥注册到你的用户账户上。
  3. 使用 `authselect` 在 PAM 中激活智能卡支持。

[authselect][8] 是一个用于配置带有可重现配置文件的 PAM 的工具。使用 `authselect` 的配置文件可以避免手动修改 `/etc/pam.d` 目录下的配置文件。

### 依赖项

所需的软件包可在官方仓库中获取。

```
[…]$ sudo dnf install pam-u2f pamu2fcfg fido2-tools
```

#### 在密钥上设置 FIDO2 PIN

FIDO2 标准定义了一种用于访问保护的可选 PIN。如果 PIN 丢失或失效，没有 PUK 或其他恢复方式，请确保你有一种备用的身份验证方法。如果通过连续输入无效的 PIN 使 PIN 失效，恢复的唯一方法是重置密钥。然而，重置密钥会删除其所有凭据，并将其与以前注册的所有服务断开连接。

`fido2-tools` 包含一个用于设置密钥的 FIDO2 PIN 的工具： `fido2-token`。使用 `fido2-token -L` 获取当前连接的 FIDO2 设备列表，并使用 `fido2-token -C </path/to/device>` 设置一个新的 PIN：

```
[…]$ fido2-token -L
/dev/hidraw1: vendor=0x1050, product=0x0407 (Yubico YubiKey OTP+FIDO+CCID)
[…]$ fido2-token -C /dev/hidraw1
Enter current PIN for /dev/hidraw1:
Enter new PIN for /dev/hidraw1:
```

#### 将安全密钥注册到本地账户

使用工具 `pamu2fcfg` 检索一个配置行，该行将放入 `~/.config/Yubico/u2f_keys` 中。`pam_u2f` 是由 Yubico 提供的通用 U2F 密钥模块，因此使用 Yubico 特定的默认配置路径。该文件中的每个配置行由用户名和密钥特定的凭据/配置部分以冒号分隔。确保每个用户仅使用一行。

```
fedora-user:owBYtPIH2yzjlSQaRrVcxB...Pg==,es256,+presence+pin[:该用户另外的密钥]
```

如果密钥受 PIN 保护，你将被要求输入 PIN 来进行此操作。对于第一个密钥的初始注册，请使用以下命令：

```
[…]$ mkdir -p ~/.config/Yubico
[…]$ pamu2fcfg --pin-verification > ~/.config/Yubico/u2f_keys
```

要将另一个密钥（例如备份密钥）添加到此单用户配置中，请使用以下命令：

```
[…]$ pamu2fcfg --nouser --pin-verification >> ~/.config/Yubico/u2f_keys
```

`pam_u2f` 还支持使用一个中心身份验证文件。在这种情况下，请确保每个用户使用一行，并将给定用户的所有密钥保持在同一行上。如果两行引用相同的用户名，那么只有最后一行将被使用！请参阅 [pam_u2f 手册页][9] 获取所有可用选项的详细信息。

### 使用 authselect 配置 PAM

[authselect][8] 是一个用于控制系统 PAM 配置的工具。它引入了配置文件作为额外的抽象层。一个 `authselect` 配置文件可以更改多个 PAM 配置文件。配置文件具有控制附加功能和行为的参数，例如启用 FIDO U2F 安全密钥。有关 `authselect` 的详细介绍计划在未来的文章中进行。

显示当前活动的 `authselect` 配置文件。如果选择了 SSSD（系统安全服务守护程序）配置文件并启用了 U2F 支持，则输出可能类似于以下内容：

```
[…]$ authselect current
Profile ID: sssd
Enabled features:
- with-pam-u2f
```

使用 `authselect` 和 `with-pam-u2f` 标志，在 PAM 中激活 FIDO U2F 支持：

```
[…]$ sudo authselect select sssd with-pam-u2f
```

如果你还想使用指纹读取器，必须同时启用这两个功能：

```
[…]$ sudo authselect select sssd with-pam-u2f with-fingerprint
```

这会在 PAM 中激活具有 `pam_u2f` 和指纹读取器支持的 SSSD 配置文件。例如，当使用上述 `authselect` 配置文件在终端上使用 sudo 时，首先会要求你提供指纹，如果指纹识别失败，则使用 U2F 密钥。然而，GDM 将首先使用 U2F 密钥。

### 解锁 GNOME 钥匙环守护程序

当使用生物识别、U2F 密钥或任何其他不需要密码短语登录 GNOME 的方法时，无法自动解锁“登录”钥匙环。这是因为，默认情况下，钥匙环的密码短语设置为与你的登录密码短语相同。通常，PAM 将你的登录密码短语传递给钥匙环守护程序。由于你在通过生物识别或 U2F 密钥进行身份验证时不需要输入密码短语，因此 PAM 没有密码短语可以传递给钥匙环守护程序。这个问题没有简单直接的解决方法。

如果你为家目录使用 LUKS 加密并且操作的是单用户系统，你可以从钥匙环中移除密码短语。这将使你的 GNOME 钥匙环在文件级别上保持未加密。但它仍然在块级别上由 LUKS 加密，因为 LUKS 加密与单用户系统上的默认基于文件的钥匙环加密等效。由于钥匙环的加密仅旨在保护其内容免受离线访问，钥匙环在登录后将被解密/解锁，任何运行时应用程序或恶意软件在解锁后都有可能访问钥匙环的内容。由于 LUKS 也是一种离线保护机制，因此可以认为它是钥匙环正常基于文件的加密的替代选择。

如果你的系统被多个用户使用，则 LUKS 加密和钥匙环的正常基于文件的加密不是等效的。在具有只由 LUKS 保护的钥匙环的多用户系统中，具有解密磁盘和引导系统授权的任何用户都能够访问同一系统上的任何其他用户的钥匙环。

移除 GNOME “登录”钥匙环密码短语非常简单。只需设置一个新的空密码，钥匙环将被解锁，并且其内容将以未加密的方式存储在文件级别上。可以使用图形实用程序 Seahorse（也称为“密码和密钥”）来在 GNOME “登录”钥匙环上设置一个空密码。

### 警惕和其他用例

即将发布的文章将探讨如何使用 U2F Dracut 插件使用 FIDO2/U2F 密钥解锁 LUKS 加密的磁盘。

OpenSSH 8.2+ 支持使用 `ed25519-sk` 安全密钥。这个主题已经在之前的文章《[如何在 Fedora Linux 上使用 YubiKey][4]》中涉及到。

需要注意的是，FIDO2/U2F 是一种认证标准。还有其他用于安全令牌的用例（主要由 Yubico 建立），例如 (T)OTP、PIV（用于 x509 密钥管理）或 OpenPGP，这些用例不是一般性的，而是具体硬件上的用例。

*（题图：MJ/4bd195dc-130b-4ef2-af6c-9a6ef5d54223）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-fido-u2f-security-keys-with-fedora-linux/

作者：[Alexander Wellbrock][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/w4tsn/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/05/FIDO_U2F_keys-1-816x345.jpg
[2]: https://unsplash.com/ko/@bhdebrito?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/security-key?orientation=landscape&utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/how-to-use-a-yubikey-with-fedora-linux/
[5]: https://fidoalliance.org
[6]: http://fc16.ifca.ai/preproceedings/25_Lang.pdf
[7]: https://www.redhat.com/sysadmin/pluggable-authentication-modules-pam
[8]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_authentication_and_authorization_in_rhel/configuring-user-authentication-using-authselect_configuring-authentication-and-authorization-in-rhel
[9]: https://manpages.org/pam_u2f/8
[0]: https://img.linux.net.cn/data/attachment/album/202308/13/233953yhs6626j866q2iqw.jpg