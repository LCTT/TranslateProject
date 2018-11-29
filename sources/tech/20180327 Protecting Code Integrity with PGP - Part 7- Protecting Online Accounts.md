Protecting Code Integrity with PGP — Part 7: Protecting Online Accounts
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/online-pgp.jpg?itok=BWc_Bk6q)
So far in this tutorial series, we've provided practical guidelines for using PGP, including basic concepts and steps for generating and protecting your keys. If you missed the previous articles, you can catch up below. In this final article, we offer additional guidance for protecting your online accounts, which is of paramount importance today.

[Part 1: Basic Concepts and Tools][1]

[Part 2: Generating Your Master Key][2]

[Part 3: Generating PGP Subkeys][3]

[Part 4: Moving Your Master Key to Offline Storage][4]

[Part 5: Moving Subkeys to a Hardware Device][5]

[Part 6: Using PGP with Git][6]

### Checklist

  * Get a U2F-capable device (ESSENTIAL)

  * Enable 2-factor authentication for your online accounts (ESSENTIAL)

    * GitHub/GitLab

    * Google

    * Social media

  * Use U2F as primary mechanism, with TOTP as fallback (ESSENTIAL)




#### Considerations

You may have noticed how a lot of your online developer identity is tied to your email address. If someone can gain access to your mailbox, they would be able to do a lot of damage to you personally, and to your reputation as a free software developer. Protecting your email accounts is just as important as protecting your PGP keys.

##### Two-factor authentication with Fido U2F

[Two-factor authentication][7] is a mechanism to improve account security by requiring a physical token in addition to a username and password. The goal is to make sure that even if someone steals your password (via keylogging, shoulder surfing, or other means), they still wouldn't be able to gain access to your account without having in their possession a specific physical device ("something you have" factor).

The most widely known mechanisms for 2-factor authentication are:

  * SMS-based verification

  * Time-based One-Time Passwords (TOTP) via a smartphone app, such as the "Google Authenticator" or similar solutions

  * Hardware tokens supporting Fido U2F




SMS-based verification is easiest to configure, but has the following important downsides: it is useless in areas without signal (e.g. most building basements), and can be defeated if the attacker is able to intercept or divert SMS messages, for example by cloning your SIM card.

TOTP-based multi-factor authentication offers more protection than SMS, but has important scaling downsides (there are only so many tokens you can add to your smartphone app before finding the correct one becomes unwieldy). Plus, there's no avoiding the fact that your secret key ends up stored on the smartphone itself -- which is a complex, globally connected device that may or may not have been receiving timely security patches from the manufacturer.

Most importantly, neither TOTP nor SMS methods protect you from phishing attacks -- if the phisher is able to steal both your account password and the 2-factor token, they can replay them on the legitimate site and gain access to your account.

[Fido U2F][8] is a standard developed specifically to provide a mechanism for 2-factor authentication and to combat credential phishing. The U2F protocol will store each site's unique key on the USB token and will prevent you from accidentally giving the attacker both your password and your one-time token if you try to use it on anything other than the legitimate website.

Both Chrome and Firefox support U2F 2-factor authentication, and hopefully other browsers will soon follow.

##### Get a token capable of Fido U2F

There are [many options available][9] for hardware tokens with Fido U2F support, but if you're already ordering a smartcard-capable physical device, then your best option is a Yubikey 4, which supports both.

##### Enable 2-factor authentication on your online accounts

You definitely want to enable this option on the email provider you are using (especially if it is Google, which has excellent support for U2F). Other sites where this functionality should be enabled are:

  * GitHub: it probably occurred to you when you uploaded your PGP public key that if anyone else is able to gain access to your account, they can replace your key with their own. If you publish code on GitHub, you should take care of your account security by protecting it with U2F-backed authentication.

  * GitLab: for the same reasons as above.

  * Google: if you have a google account, you will be surprised how many sites allow logging in with Google authentication instead of site-specific credentials.

  * Facebook: same as above, a lot of online sites offer the option to authenticate using a Facebook account. You should 2-factor protect your Facebook account even if you do not use it.

  * Other sites, as you deem necessary. See [dongleauth.info][10] for inspiration.




##### Configure TOTP failover, if possible

Many sites will allow you to configure multiple 2-factor mechanisms, and the recommended setup is:

  * U2F token as the primary mechanism

  * TOTP phone app as the secondary mechanism




This way, even if you lose your U2F token, you should be able to re-gain access to your account. Alternatively, you can enroll multiple U2F tokens (e.g. you can get another cheap token that only does U2F and use it for backup reasons).

### Further reading

By this point you have accomplished the following important tasks:

  1. Created your developer identity and protected it using PGP cryptography.

  2. Configured your environment so your identity is not easily stolen by moving your master key offline and your subkeys to an external hardware device.

  3. Configured your git environment to ensure that anyone using your project is able to verify the integrity of the repository and its entire history.

  4. Secured your online accounts using 2-factor authentication.




You are already in a good place, but you should also read up on the following topics:

  * How to secure your team communication (see the document in this repository). Decisions regarding your project development and governance require just as much careful protection as any committed code, if not so. Make sure that your team communication is trusted and the integrity of all decisions is verified.

  * How to secure your workstation (see the document in this repository). Your goal is to minimize risky behaviour that would cause your project code to be contaminated, or your developer identity to be stolen.

  * How to write secure code (see various documentation related to the programming languages and libraries used by your project). Bad, insecure code is still bad, insecure code even if there is a PGP signature on the commit that introduced it.




--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-7-protecting-online-accounts

作者：[Konstantin Ryabitsev][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/blog/learn/2018/2/protecting-code-integrity-pgp-part-1-basic-pgp-concepts-and-tools
[2]:https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-2-generating-and-protecting-your-master-pgp-key
[3]:https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-3-generating-pgp-subkeys
[4]:https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-4-moving-your-master-key-offline-storage
[5]:https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-5-moving-subkeys-hardware-device
[6]:https://www.linux.com/blog/learn/pgp/2018/3/protecting-code-integrity-pgp-part-6-using-pgp-git
[7]:https://en.wikipedia.org/wiki/Multi-factor_authentication
[8]:https://en.wikipedia.org/wiki/Universal_2nd_Factor
[9]:http://www.dongleauth.info/dongles/
[10]:http://www.dongleauth.info/
