Protecting Code Integrity with PGP — Part 1: Basic Concepts and Tools
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/pgp-security.jpg?itok=lulwyzYc)

In this article series, we take an in-depth look at using PGP to ensure the integrity of software. These articles will provide practical guidelines aimed at developers working on free software projects and will cover the following topics:

  1. PGP basics and best practices

  2. How to use PGP with Git

  3. How to protect your developer accounts




We use the term "Free" as in "Freedom," but the guidelines set out in this series can also be used for any other kind of software that relies on contributions from a distributed team of developers. If you write code that goes into public source repositories, you can benefit from getting acquainted with and following this guide.

### Structure

Each section is split into two areas:

  * The checklist that can be adapted to your project's needs

  * Free-form list of considerations that explain what dictated these decisions, together with configuration instructions




#### Checklist priority levels

The items in each checklist include the priority level, which we hope will help guide your decision:

  * (ESSENTIAL) items should definitely be high on the consideration list. If not implemented, they will introduce high risks to the code that gets committed to the open-source project.

  * (NICE) to have items will improve the overall security, but will affect how you interact with your work environment, and probably require learning new habits or unlearning old ones.




Remember, these are only guidelines. If you feel these priority levels do not reflect your project's commitment to security, you should adjust them as you see fit.

## Basic PGP concepts and tools

### Checklist

  1. Understand the role of PGP in Free Software Development (ESSENTIAL)

  2. Understand the basics of Public Key Cryptography (ESSENTIAL)

  3. Understand PGP Encryption vs. Signatures (ESSENTIAL)

  4. Understand PGP key identities (ESSENTIAL)

  5. Understand PGP key validity (ESSENTIAL)

  6. Install GnuPG utilities (version 2.x) (ESSENTIAL)




### Considerations

The Free Software community has long relied on PGP for assuring the authenticity and integrity of software products it produced. You may not be aware of it, but whether you are a Linux, Mac or Windows user, you have previously relied on PGP to ensure the integrity of your computing environment:

  * Linux distributions rely on PGP to ensure that binary or source packages have not been altered between when they have been produced and when they are installed by the end-user.

  * Free Software projects usually provide detached PGP signatures to accompany released software archives, so that downstream projects can verify the integrity of downloaded releases before integrating them into their own distributed downloads.

  * Free Software projects routinely rely on PGP signatures within the code itself in order to track provenance and verify integrity of code committed by project developers.




This is very similar to developer certificates/code signing mechanisms used by programmers working on proprietary platforms. In fact, the core concepts behind these two technologies are very much the same -- they differ mostly in the technical aspects of the implementation and the way they delegate trust. PGP does not rely on centralized Certification Authorities, but instead lets each user assign their own trust to each certificate.

Our goal is to get your project on board using PGP for code provenance and integrity tracking, following best practices and observing basic security precautions.

### Extremely Basic Overview of PGP operations

You do not need to know the exact details of how PGP works -- understanding the core concepts is enough to be able to use it successfully for our purposes. PGP relies on Public Key Cryptography to convert plain text into encrypted text. This process requires two distinct keys:

  * A public key that is known to everyone

  * A private key that is only known to the owner




#### Encryption

For encryption, PGP uses the public key of the owner to create a message that is only decryptable using the owner's private key:

  1. The sender generates a random encryption key ("session key")

  2. The sender encrypts the contents using that session key (using a symmetric cipher)

  3. The sender encrypts the session key using the recipient's public PGP key

  4. The sender sends both the encrypted contents and the encrypted session key to the recipient




To decrypt:

  1. The recipient decrypts the session key using their private PGP key

  2. The recipient uses the session key to decrypt the contents of the message




#### Signatures

For creating signatures, the private/public PGP keys are used the opposite way:

  1. The signer generates the checksum hash of the contents

  2. The signer uses their own private PGP key to encrypt that checksum

  3. The signer provides the encrypted checksum alongside the contents




To verify the signature:

  1. The verifier generates their own checksum hash of the contents

  2. The verifier uses the signer's public PGP key to decrypt the provided checksum

  3. If the checksums match, the integrity of the contents is verified




#### Combined usage

Frequently, encrypted messages are also signed with the sender's own PGP key. This should be the default whenever using encrypted messaging, as encryption without authentication is not very meaningful (unless you are a whistleblower or a secret agent and need plausible deniability).

### Understanding Key Identities

Each PGP key must have one or multiple Identities associated with it. Usually, an "Identity" is the person's full name and email address in the following format:
```
Alice Engineer <alice.engineer@example.com>

```

Sometimes it will also contain a comment in brackets, to tell the end-user more about that particular key:
```
Bob Designer (obsolete 1024-bit key) <bob.designer@example.com>

```

Since people can be associated with multiple professional and personal entities, they can have multiple identities on the same key:
```
Alice Engineer <alice.engineer@example.com>
Alice Engineer <aengineer@personalmail.example.org>
Alice Engineer <webmaster@girlswhocode.example.net>

```

When multiple identities are used, one of them would be marked as the "primary identity" to make searching easier.

### Understanding Key Validity

To be able to use someone else's public key for encryption or verification, you need to be sure that it actually belongs to the right person (Alice) and not to an impostor (Eve). In PGP, this certainty is called "key validity:"

  * Validity: full -- means we are pretty sure this key belongs to Alice

  * Validity: marginal -- means we are somewhat sure this key belongs to Alice

  * Validity: unknown -- means there is no assurance at all that this key belongs to Alice




#### Web of Trust (WOT) vs. Trust on First Use (TOFU)

PGP incorporates a trust delegation mechanism known as the "Web of Trust." At its core, this is an attempt to replace the need for centralized Certification Authorities of the HTTPS/TLS world. Instead of various software makers dictating who should be your trusted certifying entity, PGP leaves this responsibility to each user.

Unfortunately, very few people understand how the Web of Trust works, and even fewer bother to keep it going. It remains an important aspect of the OpenPGP specification, but recent versions of GnuPG (2.2 and above) have implemented an alternative mechanism called "Trust on First Use" (TOFU).

You can think of TOFU as "the SSH-like approach to trust." With SSH, the first time you connect to a remote system, its key fingerprint is recorded and remembered. If the key changes in the future, the SSH client will alert you and refuse to connect, forcing you to make a decision on whether you choose to trust the changed key or not.

Similarly, the first time you import someone's PGP key, it is assumed to be trusted. If at any point in the future GnuPG comes across another key with the same identity, both the previously imported key and the new key will be marked as invalid and you will need to manually figure out which one to keep.

In this guide, we will be using the TOFU trust model.

### Installing OpenPGP software

First, it is important to understand the distinction between PGP, OpenPGP, GnuPG and gpg:

  * PGP ("Pretty Good Privacy") is the name of the original commercial software

  * OpenPGP is the IETF standard compatible with the original PGP tool

  * GnuPG ("Gnu Privacy Guard") is free software that implements the OpenPGP standard

  * The command-line tool for GnuPG is called "gpg"




Today, the term "PGP" is almost universally used to mean "the OpenPGP standard," not the original commercial software, and therefore "PGP" and "OpenPGP" are interchangeable. The terms "GnuPG" and "gpg" should only be used when referring to the tools, not to the output they produce or OpenPGP features they implement. For example:

  * PGP (not GnuPG or GPG) key

  * PGP (not GnuPG or GPG) signature

  * PGP (not GnuPG or GPG) keyserver




Understanding this should protect you from an inevitable pedantic "actually" from other PGP users you come across.

#### Installing GnuPG

If you are using Linux, you should already have GnuPG installed. On a Mac, you should install [GPG-Suite][1] or you can use brew install gnupg2. On a Windows PC, you should install [GPG4Win][2], and you will probably need to adjust some of the commands in the guide to work for you, unless you have a unix-like environment set up. For all other platforms, you'll need to do your own research to find the correct places to download and install GnuPG.

#### GnuPG 1 vs. 2

Both GnuPG v.1 and GnuPG v.2 implement the same standard, but they provide incompatible libraries and command-line tools, so many distributions ship both the legacy version 1 and the latest version 2. You need to make sure you are always using GnuPG v.2.

First, run:
```
$ gpg --version | head -n1

```

If you see gpg (GnuPG) 1.4.x, then you are using GnuPG v.1. Try the gpg2 command:
```
$ gpg2 --version | head -n1

```

If you see gpg (GnuPG) 2.x.x, then you are good to go. This guide will assume you have the version 2.2 of GnuPG (or later). If you are using version 2.0 of GnuPG, some of the commands in this guide will not work, and you should consider installing the latest 2.2 version of GnuPG.

#### Making sure you always use GnuPG v.2

If you have both gpg and gpg2 commands, you should make sure you are always using GnuPG v2, not the legacy version. You can make sure of this by setting the alias:
```
$ alias gpg=gpg2

```

You can put that in your .bashrc to make sure it's always loaded whenever you use the gpg commands.

In part 2 of this series, we will explain the basic steps for generating and protecting your master PGP key.

Learn more about Linux through the free ["Introduction to Linux" ][3]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/2/protecting-code-integrity-pgp-part-1-basic-pgp-concepts-and-tools

作者：[Konstantin Ryabitsev][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://gpgtools.org/
[2]:https://www.gpg4win.org/
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
