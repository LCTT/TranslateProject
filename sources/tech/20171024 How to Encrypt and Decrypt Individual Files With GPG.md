translating by lujun9972
How to Encrypt and Decrypt Individual Files With GPG
------
### Objective

Encrypt individual files with GPG.

### Distributions

This will work with any Linux distribution.

### Requirements

A working Linux install with GPG installed or root privileges to install it.

### Difficulty

Easy

### Conventions

*   # - requires given command to be executed with root privileges either directly as a root user or by use of sudo command

*   $ - given command to be executed as a regular non-privileged user

### Introduction

Encryption is important. It's absolutely vital to protecting sensitive information. Your personal files are worth encrypting, and GPG provides the perfect solution.

### Install GPG

GPG is a widely used piece of software. You can find it in nearly every distribution's repositories. If you don't have it already, install it on your computer.

### Debian/Ubuntu

```
$ sudo apt install gnupg
```

```
# dnf install gnupg2
```

```
# pacman -S gnupg
```

```
# emerge --ask app-crypt/gnupg
```

You need a key pair to be able to encrypt and decrypt files. If you already have a key pair that you generated for SSH, you can actually use those here. If not, GPG includes a utility to generate them.

```
$ gpg --full-generate-key
```

The first thing GPG will ask for is the type of key. Use the default, if there isn't anything specific that you need.

The next thing that you'll need to set is the key size.

`4096`

is probably best.

After that, you can set an expiration date. Set it to

`0`

if you want the key to be permanent.

Then, it will ask you for your name.

Finally, it asks for your email address.

You can add a comment if you need to too.

When it has everything, GPG will ask you to verify the information.

GPG will ask if you want a password for your key. This is optional, but adds a degree of protection. As it's doing that, GPG will collect entropy from your actions to increase the strength of your key. When it's done, GPG will print out the information pertaining to the key you just created.

### Basic Encryption

Now that you have your key, encrypting files is very easy. Create a blank text file in your

`/tmp`

directory to practice with.

```
$ touch /tmp/test.txt
```
`-e`

flag tells GPG that you'll be encrypting a file, and the

`-r`

flag specifies a recipient.

```
$ gpg -e -r "Your Name" /tmp/test.txt
```

### Basic Decryption

You have an encrypted file. Try decrypting it. You don't need to specify any keys. That information is encoded with the file. GPG will try the keys that it has to decrypt it.

```
$ gpg -d /tmp/test.txt.gpg
```

Say you

 _do_ 

need to send the file. You need to have the recipient's public key. How you get that from them is up to you. You can ask them to send it to you, or it may be publicly available on a keyserver.

Once you have it, import the key into GPG.

```
$ gpg --import yourfriends.key
```

```
gpg --export -a "Your Name" > your.key
```

```
$ gpg -e -u "Your Name" -r "Their Name" /tmp/test.txt
```

That's mostly it. There are some more advanced options available, but you won't need them ninety-nine percent of the time. GPG is that easy to use. You can also use the key pair that you created to send and receive encrypted email in much the same way as this, though most email clients automate the process once they have the keys.

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-encrypt-and-decrypt-individual-files-with-gpg

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
