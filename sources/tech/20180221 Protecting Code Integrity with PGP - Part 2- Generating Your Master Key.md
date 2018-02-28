Protecting Code Integrity with PGP — Part 2: Generating Your Master Key
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/binary-1538717_1920.png?itok=kv_sxSnf)

In this article series, we're taking an in-depth look at using PGP and provide practical guidelines for developers working on free software projects. In the previous article, we provided an introduction to [basic tools and concepts][1]. In this installment, we show how to generate and protect your master PGP key.

### Checklist

  1. Generate a 4096-bit RSA master key (ESSENTIAL)

  2. Back up the master key using paperkey (ESSENTIAL)

  3. Add all relevant identities (ESSENTIAL)




### Considerations

#### Understanding the "Master" (Certify) key

In this and next section we'll talk about the "master key" and "subkeys." It is important to understand the following:

  1. There are no technical differences between the "master key" and "subkeys."

  2. At creation time, we assign functional limitations to each key by giving it specific capabilities.

  3. A PGP key can have four capabilities.

    * [S] key can be used for signing

    * [E] key can be used for encryption

    * [A] key can be used for authentication

    * [C] key can be used for certifying other keys

  4. A single key may have multiple capabilities.




The key carrying the [C] (certify) capability is considered the "master" key because it is the only key that can be used to indicate relationship with other keys. Only the [C] key can be used to:

  * Add or revoke other keys (subkeys) with S/E/A capabilities

  * Add, change or revoke identities (uids) associated with the key

  * Add or change the expiration date on itself or any subkey

  * Sign other people's keys for the web of trust purposes




In the Free Software world, the [C] key is your digital identity. Once you create that key, you should take extra care to protect it and prevent it from falling into malicious hands.

#### Before you create the master key

Before you create your master key you need to pick your primary identity and your master passphrase.

##### Primary identity

Identities are strings using the same format as the "From" field in emails:
```
Alice Engineer <alice.engineer@example.org>

```

You can create new identities, revoke old ones, and change which identity is your "primary" one at any time. Since the primary identity is shown in all GnuPG operations, you should pick a name and address that are both professional and the most likely ones to be used for PGP-protected communication, such as your work address or the address you use for signing off on project commits.

##### Passphrase

The passphrase is used exclusively for encrypting the private key with a symmetric algorithm while it is stored on disk. If the contents of your .gnupg directory ever get leaked, a good passphrase is the last line of defense between the thief and them being able to impersonate you online, which is why it is important to set up a good passphrase.

A good guideline for a strong passphrase is 3-4 words from a rich or mixed dictionary that are not quotes from popular sources (songs, books, slogans). You'll be using this passphrase fairly frequently, so it should be both easy to type and easy to remember.

##### Algorithm and key strength

Even though GnuPG has had support for Elliptic Curve crypto for a while now, we'll be sticking to RSA keys, at least for a little while longer. While it is possible to start using ED25519 keys right now, it is likely that you will come across tools and hardware devices that will not be able to handle them correctly.

You may also wonder why the master key is 4096-bit, if later in the guide we state that 2048-bit keys should be good enough for the lifetime of RSA public key cryptography. The reasons are mostly social and not technical: master keys happen to be the most visible ones on the keychain, and some of the developers you interact with will inevitably judge you negatively if your master key has fewer bits than theirs.

#### Generate the master key

To generate your new master key, issue the following command, putting in the right values instead of "Alice Engineer:"
```
$ gpg --quick-generate-key 'Alice Engineer <alice@example.org>' rsa4096 cert

```

A dialog will pop up asking to enter the passphrase. Then, you may need to move your mouse around or type on some keys to generate enough entropy until the command completes.

Review the output of the command, it will be something like this:
```
pub rsa4096 2017-12-06 [C] [expires: 2019-12-06]
 111122223333444455556666AAAABBBBCCCCDDDD
uid Alice Engineer <alice@example.org>

```

Note the long string on the second line -- that is the full fingerprint of your newly generated key. Key IDs can be represented in three different forms:

  * Fingerprint, a full 40-character key identifier

  * Long, last 16-characters of the fingerprint (AAAABBBBCCCCDDDD)

  * Short, last 8 characters of the fingerprint (CCCCDDDD)




You should avoid using 8-character "short key IDs" as they are not sufficiently unique.

At this point, I suggest you open a text editor, copy the fingerprint of your new key and paste it there. You'll need to use it for the next few steps, so having it close by will be handy.

#### Back up your master key

For disaster recovery purposes -- and especially if you intend to use the Web of Trust and collect key signatures from other project developers -- you should create a hardcopy backup of your private key. This is supposed to be the "last resort" measure in case all other backup mechanisms have failed.

The best way to create a printable hardcopy of your private key is using the paperkey software written for this very purpose. Paperkey is available on all Linux distros, as well as installable via brew install paperkey on Macs.

Run the following command, replacing [fpr] with the full fingerprint of your key:
```
$ gpg --export-secret-key [fpr] | paperkey -o /tmp/key-backup.txt

```

The output will be in a format that is easy to OCR or input by hand, should you ever need to recover it. Print out that file, then take a pen and write the key passphrase on the margin of the paper. This is a required step because the key printout is still encrypted with the passphrase, and if you ever change the passphrase on your key, you will not remember what it used to be when you had first created it -- guaranteed.

Put the resulting printout and the hand-written passphrase into an envelope and store in a secure and well-protected place, preferably away from your home, such as your bank vault.

**Note on printers:** Long gone are days when printers were dumb devices connected to your computer's parallel port. These days they have full operating systems, hard drives, and cloud integration. Since the key content we send to the printer will be encrypted with the passphrase, this is a fairly safe operation, but use your best paranoid judgement.

#### Add relevant identities

If you have multiple relevant email addresses (personal, work, open-source project, etc), you should add them to your master key. You don't need to do this for any addresses that you don't expect to use with PGP (e.g., probably not your school alumni address).

The command is (put the full key fingerprint instead of [fpr]):
```
$ gpg --quick-add-uid [fpr] 'Alice Engineer <allie@example.net>'

```

You can review the UIDs you've already added using:
```
$ gpg --list-key [fpr] | grep ^uid

```

##### Pick the primary UID

GnuPG will make the latest UID you add as your primary UID, so if that is different from what you want, you should fix it back:
```
$ gpg --quick-set-primary-uid [fpr] 'Alice Engineer <alice@example.org>'

```

Next time, we'll look at generating PGP subkeys, which are the keys you'll actually be using for day-to-day work.

Learn more about Linux through the free ["Introduction to Linux" ][2]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/PGP/2018/2/protecting-code-integrity-pgp-part-2-generating-and-protecting-your-master-pgp-key

作者：[KONSTANTIN RYABITSEV][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/blog/learn/2018/2/protecting-code-integrity-pgp-part-1-basic-pgp-concepts-and-tools
[2]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
