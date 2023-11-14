[#]: subject: "FIDO2 for centrally managed users"
[#]: via: "https://fedoramagazine.org/fido2-for-centrally-managed-users/"
[#]: author: "Iker Pedrosa https://fedoramagazine.org/author/ipedrosa/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

FIDO2 for centrally managed users
======

![][1]

Photo by [Michael Dziedzic][2] on [Unsplash][3]

Fedora 39 enables FIDO2 authentication for centrally managed users with SSSD and FreeIPA. This post introduces the steps to follow to configure and start using it.

### FIDO2

[FIDO2][4] is an open authentication standard based on [public-key cryptography][5]. It is more secure than passwords and OTPs (one time passwords), and simpler to use. It is usually provided as a hardware security token like a small USB and NFC based device. There are several brands of FIDO compliant keys: YubiKey, NitroKey, SoloKey v2, etc.

Some of the benefits of this protocol are:

  * Passwordless authentication by eliminating passwords and using public-key cryptography.
  * [Multi-factor authentication][6] (MFA), thus enabling strong authentication.
  * No password or public key reuse among applications, reducing the risk of a data breach.
  * The private key resides in the security token and it never leaves it, which reduces phishing threats.



#### Previous articles

There are several articles in Fedora Magazine that show the usage of FIDO2: [how to authenticate a local user using FIDO2][7] and [how to unlock the hard-drive][8]. This article shows how to use FIDO2 to authenticate a remote user. Note that the devices mentioned above, mainly those from Yubico, implement other protocols. It is not the purpose of this guide to discuss such protocols.

### Centrally managed users

[SSSD][9] and [FreeIPA][10] recently implemented a new feature, called [passkey][11], to use FIDO2 authentication for centrally managed users. The exact versions that support this feature are [SSSD 2.9.0][12] and [FreeIPA 4.11.0][13]. These versions, and the following ones, are the only ones that support this new implementation.

Fedora 39 already includes those versions, and thus, it’s the first distribution to enable FIDO2 authentication for centrally managed users. In addition, a Kerberos ticket is also granted alongside the authentication, this way the user is able to identify themselves to other services.

Note, from now on I will use the terms FIDO2 and passkey interchangeably.

### FIDO2 authentication

#### FIDO2 configuration

As an additional security measure MFA should be enabled in the device. This way, if you lose the key a malicious actor won’t be able to use it to authenticate.

List the connected passkey devices:

```

    $ fido2-token -L

```

Set the PIN for your passkey device (replace the capital letter as required):

```

    $ fido2-token -C /dev/hidrawX

```

If you have a compatible device you can also enable other factors, e.g. fingerprints.

#### Central user configuration

First of all let’s create a user and enable passkey as the authentication method (replace the capital letters as required):

```

    $ ipa user-add USERNAME --first NAME --last SURNAME --user-auth-type=passkey

```

Or if you already have a user and you only need to select passkey as the authentication method:

```

    $ ipa user-mod USERNAME --user-auth-type=passkey

```

#### FIDO2 registration for centrally managed users

Second, let’s register the passkey for this user. This step prompts you to enter the PIN, and then touch the device:

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

Everything is ready for user authentication.

Note, if you are using this user in a production environment I’d recommend you register at least two different devices. This way, if you lose one of the devices, you can authenticate with the other.

#### FIDO2 authentication for centrally managed users

In a first round you can only authenticate in a system where the token is physically connected. This means that you can use “su” or the Graphical Interface, but not ssh (at least not remotely).

Let’s use “su”, remembering to replace the capital letters. This prompts you to enter the PIN, and when the device blinks, to touch the it:

```

    $ su - USERNAME@DOMAIN

    Insert your passkey device, then press ENTER.

    Enter PIN:

```

If everything went well, the Kerberos ticket has also been granted, and you are then able to authenticate remotely to other services:

```

    $ klist

    Ticket cache: KCM:879400005:34862

    Default principal: USERNAME@DOMAIN

    Valid starting Expires        Service principal

    10/20/23 09:46:04  10/21/23 09:32:37  krbtgt/DOMAIN@DOMAIN

```

### Conclusion

The objective of this authentication mechanism is to increase security. This is achieved by using a well-known and open standard that enables passwordlessness and MFA, reducing the risk of a data breach and phishing threats. The user only needs the hardware token, and another factor authentication like a PIN and/or a finger to remove the need for passwords, while providing an easy way to use several factors for authentication. Furthermore, each application or service uses a unique key, so that any data breach in one of them does not affect others. Finally, the user isn’t aware of the specific details of their credentials, beyond the fact that they use a physical token, thus greatly reducing any social engineering attack.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fido2-for-centrally-managed-users/

作者：[Iker Pedrosa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
