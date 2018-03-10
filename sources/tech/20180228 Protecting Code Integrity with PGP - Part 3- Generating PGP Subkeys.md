translating---geekpi

Protecting Code Integrity with PGP — Part 3: Generating PGP Subkeys
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/binary.jpg?itok=h62HujOC)

In this tutorial series, we're providing practical guidelines for using PGP. Previously, we provided an introduction to [basic tools and concepts][1], and we showed how to [generate and protect your master PGP key][2]. In this third article, we'll explain how to generate PGP subkeys, which are used in daily work.

### Checklist

  1. Generate a 2048-bit Encryption subkey (ESSENTIAL)

  2. Generate a 2048-bit Signing subkey (ESSENTIAL)

  3. Generate a 2048-bit Authentication subkey (NICE)

  4. Upload your public keys to a PGP keyserver (ESSENTIAL)

  5. Set up a refresh cronjob (ESSENTIAL)




#### Considerations

Now that we've created the master key, let's create the keys you'll actually be using for day-to-day work. We create 2048-bit keys because a lot of specialized hardware (we'll discuss this more later) does not handle larger keys, but also for pragmatic reasons. If we ever find ourselves in a world where 2048-bit RSA keys are not considered good enough, it will be because of fundamental breakthroughs in computing or mathematics and therefore longer 4096-bit keys will not make much difference.

##### Create the subkeys

To create the subkeys, run:
```
$ gpg --quick-add-key [fpr] rsa2048 encr
$ gpg --quick-add-key [fpr] rsa2048 sign

```

You can also create the Authentication key, which will allow you to use your PGP key for ssh purposes:
```
$ gpg --quick-add-key [fpr] rsa2048 auth

```

You can review your key information using gpg --list-key [fpr]:
```
pub rsa4096 2017-12-06 [C] [expires: 2019-12-06]
 111122223333444455556666AAAABBBBCCCCDDDD
uid [ultimate] Alice Engineer <alice@example.org>
uid [ultimate] Alice Engineer <allie@example.net>
sub rsa2048 2017-12-06 [E]
sub rsa2048 2017-12-06 [S]

```

##### Upload your public keys to the keyserver

Your key creation is complete, so now you need to make it easier for others to find it by uploading it to one of the public keyservers. (Skip the step if you're not planning to actually use the key you've created, as this just litters keyservers with useless data.)
```
$ gpg --send-key [fpr]

```

If this command does not succeed, you can try specifying the keyserver on a port that is most likely to work:
```
$ gpg --keyserver hkp://pgp.mit.edu:80 --send-key [fpr]

```

Most keyservers communicate with each other, so your key information will eventually synchronize to all the others.

**Note on privacy:** Keyservers are completely public and therefore, by design, leak potentially sensitive information about you, such as your full name, nicknames, and personal or work email addresses. If you sign other people's keys or someone signs yours, keyservers will additionally become leakers of your social connections. Once such personal information makes it to the keyservers, it becomes impossible to edit or delete. Even if you revoke a signature or identity, that does not delete them from your key record, just marks them as revoked -- making them stand out even more.

That said, if you participate in software development on a public project, all of the above information is already public record, so making it additionally available via keyservers does not result in a net loss in privacy.

###### Upload your public key to GitHub

If you use GitHub in your development (and who doesn't?), you should upload your key following the instructions they have provided:

To generate the public key output suitable to paste in, just run:
```
$ gpg --export --armor [fpr]

```

##### Set up a refresh cronjob

You will need to regularly refresh your keyring to get the latest changes on other people's public keys. You can set up a cronjob to do that:
```
$ crontab -e

```

Add the following on a new line:
```
@daily /usr/bin/gpg2 --refresh >/dev/null 2>&1

```

**Note:** Check the full path to your gpg or gpg2 command and use gpg2 if regular gpg for you is the legacy GnuPG v.1.


--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-3-generating-pgp-subkeys

作者：[Konstantin Ryabitsev][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/blog/learn/2018/2/protecting-code-integrity-pgp-part-1-basic-pgp-concepts-and-tools
[2]:https://www.linux.com/blog/learn/pgp/2018/2/protecting-code-integrity-pgp-part-2-generating-and-protecting-your-master-pgp-key
