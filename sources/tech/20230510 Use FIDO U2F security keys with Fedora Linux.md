[#]: subject: "Use FIDO U2F security keys with Fedora Linux"
[#]: via: "https://fedoramagazine.org/use-fido-u2f-security-keys-with-fedora-linux/"
[#]: author: "Alexander Wellbrock https://fedoramagazine.org/author/w4tsn/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use FIDO U2F security keys with Fedora Linux
======

![][1]

Photo by [Bruno Brito][2] on [Unsplash][3]

A FIDO U2F security key is a small USB and/or NFC based device. It is a hardware security token with modules for many security related use-cases. There are several brands of FIDO compliant keys, including NitroKey, SoloKey v2, and YubiKey. FIDO, in contrast to proprietary protocols like Yubico OTP, is hardware token agnostic and the tools used are manufacturer independent.

This post introduces the FIDO protocol(s) and shows how to install and enable a FIDO U2F security key as an alternative authentication factor for logging into a terminal, GDM, or authenticating for sudo.

For YubiKeys, especially older ones _without_ FIDO2/U2F support, see the previous post titled “[How to use a YubiKey with Fedora Linux][4]“.

> [How to use a YubiKey with Fedora Linux][4]

This post will not cover storing OpenPGP keys or X.509 certificates because those features are hardware dependent and not part of the FIDO U2F standard.

### Keep a backup security key

As soon as you start working with security tokens you have to account for the potential to lock yourself out of accounts tied to these tokens. As hardware security tokens are unique and designed to be extremely hard to copy you cannot just make a backup of it like you can with software vaults like KeePass or AndOTP. Consequently, all registrations you make with your primary key you should immediately repeat with a second backup key that you will store in a secure location, maybe even a safe.

In practice this means you will need to register both hardware tokens with your Linux and web accounts, generate OpenSSH private keys twice, and upload both OpenSSH public keys to the servers and services you use (for example, GitHub).

Should you lose a key, you’ll want to use your second key to sign in on every service the keys are registered with, remove the lost key, and register a new one. This is especially true for password-less logins using a FIDO2 protocol.

### FIDO2, U2F and the FIDO Alliance

FIDO2 is a collection of standards maintained by the [FIDO Alliance][5]. The FIDO Alliance hopes to eventually get rid of passwords altogether and instead provide procedures to authenticate users securely through multiple factors but without the need for passwords.

The standard consists of the World Wide Web Consortium’s (W3C) Web Authentication (WebAuthn) and the FIDO Alliance’s Client-to-Authenticator Protocol (CTAP). WebAuthn is a standard API to request and process public key challenges for authentication. With this, browsers send a challenge to a client which then produces a response with a private key that the challenger then verifies using a previously exchanged public key. How the challenge answer is produced is unknown to the service and it is controlled by the CTAP. The user might be prompted for several verification methods like biometrics, PIN, or presence check (or some combination of these methods). These checks are the same for authentication as they are when registering the key with the service.

A access PIN to protect any interaction with the hardware token is optional and it is unset by default. Most keys will self-invalidate after eight sequential failed attempts at entering the access PIN. The only way to recover an invalidated key and set a new PIN is to reset the key. However, when a key is reset, all its service registrations will be lost!

A FIDO2 key also supports the FIDO U2F protocol (now renamed CTAP1). This protocol is designed for second- or multi-factor (but not password-less) authentication. Linux’s PAM authentication system can also be configured to use the U2F protocol. Although FIDO U2F is not designed for password-less authentication, the U2F PAM module does allow password-less authentication.

### Security implications

FIDO2 / U2F works by tying the security key to your user account. Most keys have a basic presence-check which is enabled / used by default. They typically perform a presence-check by lighting up and prompting you to touch the key. A FIDO2 PIN is optional and it will be unset by default. When the key is registered for signing in to your Linux account or for using sudo, it is sufficient to have the device and key physically present. A FIDO2 PIN is an important additional verification step to ensure that only you can use the key for authentication.

> Wait! Now I have to keep track of an additional PIN? Isn’t this just a shorter password?
>
> The concerned reader

A FIDO2 PIN is not a password. It is a short, easy-to-remember phrase. This is not a problem because:

  1. You need physical access to the key _and_ you need to know the PIN.
  2. Failing to enter the PIN eight times will invalidate the key which makes it hard to brute-force.



On the contrary, you can now use a secure password stored in a password manager that you don’t need to remember.

A 2016 case study by Google, titled “ _[Security Keys: Practical Cryptographic Second Factors for the Modern Web][6]_ “, shows security keys effectively protect users from password reuse, phishing and man-in-the-middle attacks.

### User authentication using PAM

Local system authentication uses [Pluggable Authentication Modules (PAM)][7]. The PAM module for U2F devices (and hence authentication) is _pam_u2f_. Whether your key supports FIDO2 or FIDO U2F will depend on its firmware version and hardware model.

The setup is as follows:

  1. Install the PAM module.
  2. Register a key with your user account.
  3. Use _authselect_ to activate smart card support in PAM.



[Authselect][8] is a tool for configuring PAM with reproducible profiles. By using authselect’s profiles, manually altering configuration files under the /etc/pam.d directory can be avoided.

### Dependencies

The required packages are available in the official repositories.

```

    […]$ sudo dnf install pam-u2f pamu2fcfg fido2-tools

```

#### Set a FIDO2 PIN on your key

The FIDO2 standard defines an optional PIN for access protection. There is no PUK or other way to restore a lost or invalidated PIN so make sure you have a backup approach for authentication. If the PIN is invalidated through sequential entry of invalid PINs, the only way to recover is to reset the key. However, resetting your key removes all its credentials and disconnects it from all previously registered services.

The _fido2-tools_ package contains a tool to set the FIDO2 PIN of your key: _fido2-token_. Get a list of currently connected FIDO2 devices with fido2-token -L and set a new pin with fido2-token -C </path/to/device>:

```

    […]$ fido2-token -L
    /dev/hidraw1: vendor=0x1050, product=0x0407 (Yubico YubiKey OTP+FIDO+CCID)
    […]$ fido2-token -C /dev/hidraw1
    Enter current PIN for /dev/hidraw1:
    Enter new PIN for /dev/hidraw1:

```

#### **Register the security key with your local account(s)**

Use the tool _pamu2fcfg_ to retrieve a configuration line that goes into ~/.config/Yubico/u2f_keys. _pam_u2f_ is a Yubico-provided, generic module for U2F keys, hence the Yubico specific default configuration path. Each configuration line in this file consists of a username and a key-specific credential / config part separated by colons. Be sure to only use one line per user.

```

    fedora-user:owBYtPIH2yzjlSQaRrVcxB...Pg==,es256,+presence+pin[:another key for this user]

```

If the key is PIN protected you’ll be asked to enter the PIN for this operation. Use the following for the initial registration of your first key:

```

    […]$ mkdir -p ~/.config/Yubico
    […]$ pamu2fcfg --pin-verification > ~/.config/Yubico/u2f_keys

```

To add another key (for example, your backup key) to this single-user configuration, use the following command:

```

    […]$ pamu2fcfg --nouser --pin-verification >> ~/.config/Yubico/u2f_keys

```

_pam_u2f_ also supports the use of a central authentication file. In that case, be sure to use one line per user and to keep all the keys of a given user on the same line. If two lines reference the same username only the last one will be used! Have a look at the [pam_u2f man page][9] for all available options.

### Configure PAM with authselect

**[authselect][8]** is a tool for controling your system’s PAM configuration. It introduces profiles as an additional layer of abstraction. One authselect profile can change several PAM configuration files. Profiles have parameters that control additional features and behaviors like enabling FIDO U2F security keys. A detailed tour of _authselect_ is planned for a future article.

Display the currently active _authselect_ profile. With the SSSD (System Security Service Daemon) profile selected and U2F support enabled, the output might resemble the following:

```

    […]$ authselect current
    Profile ID: sssd
    Enabled features:
    - with-pam-u2f

```

Activate FIDO U2F support in PAM using _authselect_ with the _with-pam-u2f_ flag:

```

    […]$ sudo authselect select sssd with-pam-u2f

```

If you also want to use your fingerprint reader you have to enable both features:

```

    […]$ sudo authselect select sssd with-pam-u2f with-fingerprint

```

This activates the _sssd_ profile with _pam_u2f_ and fingerprint reader support. For example, when using sudo on a terminal with the above authselect profile configuration, you’ll first be asked for a fingerprint and if that fails for the U2F key. GDM, however, will use the U2F key first.

### Unlocking the GNOME keyring daemon

When using biometrics, a U2F key, or any other method that does not require a passphrase to sign in to GNOME, the _Login_ keyring cannot be unlocked automatically. This is because, by default, the keyring passphrase is set to the same value as your login passphrase. Normally, PAM passes your login passphrase to the keyring daemon. Since you are not entering a passphrase when authenticating via methods such as biometrics or U2F keys, there is no passphrase for PAM to pass to the keyring daemon. There is no straight forward solution to this problem.

If you use LUKS encryption for your home partition and operate a single-user system, you could remove the passphrase from your keyring. This will leave your gnome keyring unencrypted at the file level. But it will still be encrypted at the block level by LUKS. LUKS encryption is equivalent to the default file-based keyring encryption on a single-user system since the keyring’s encryption is only designed to protect its contents from offline access. The keyring will be decrypted / unlocked after login either way and any runtime application or malware can potentially access the keyring’s contents after it is unlocked. Since LUKS is also an offline protection mechanism, it can be considered an equivalent alternative to the keyring’s normal file-based encryption.

LUKS encryption and the keyring’s normal file-based encryption are not equivalent if your system is used by multiple users. In the case of a multi-user system with the keyrings protected only by LUKS, any user with authorization to decrypt the disk and boot the system will be able to access any other user’s keyring on that same system.

Removing the GNOME _Login_ keyring passphrase is straight forward. Just set a new empty password and the keyring will be unlocked and it will be stored unencrypted at the file level. The graphical utility _seahorse_ (also called _Passwords and Keys_ ) can be used to set a blank password on your GNOME _Login_ keyring.

### Lookout and other use-cases

Upcoming articles will explore how to use FIDO2/U2F keys for unlocking LUKS-encrypted disks using the U2F Dracut plugin.

OpenSSH 8.2+ supports the use of _ed25519-sk_ security keys. This topic has already been touched upon in the previous article titled “[How to use a YubiKey with Fedora Linux][4]“.

Note that FIDO2/U2F is an authentication standard. There are other use-cases for security tokens (primarily established by Yubico) like (T)OTP, PIV (for x509 key management) or OpenPGP which are not covered in general but on a hardware by hardware basis.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-fido-u2f-security-keys-with-fedora-linux/

作者：[Alexander Wellbrock][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
