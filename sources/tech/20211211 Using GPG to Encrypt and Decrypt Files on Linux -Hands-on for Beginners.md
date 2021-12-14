[#]: subject: "Using GPG to Encrypt and Decrypt Files on Linux [Hands-on for Beginners]"
[#]: via: "https://itsfoss.com/gpg-encrypt-files-basic/"
[#]: author: "Hunter Wittenborn https://itsfoss.com/author/hunter/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using GPG to Encrypt and Decrypt Files on Linux [Hands-on for Beginners]
======

[GnuPG][1], popularly known as GPG, is an extremely versatile tool, being widely used as the industry standard for encryption of things like emails, messages, files, or just anything you need to send to someone securely.

It’s easy to get started with GPG, and you can be on your way with using it in a matter of minutes.

In this tutorial, I’ll show you how to encrypt and decrypt files with GPG. _**This is a simple tutorial and you may try all of it to practice on your Linux system as well. This will help you practice the GPG commands and understand it when you are absolutely new to it.**_

Read the entire tutorial first and then start doing it on your own.

### How does GPG work for encryption?

![GPG encryption][2]

To start using GPG, you’ll first need to have a GPG key.

A GPG key is what you’ll use to encrypt (or decrypt) files later in the tutorial. It’s also what is used to identity you, with things like your name and email being tied to the key as well.

GPG keys work by using two files, a private key and a public key. These two keys are tied to each other, and are both needed to use all of GPG’s functionality, notably encrypting and decrypting files.

When you encrypt a file with GPG, it uses the private key. The new, encrypted file can then **only** be _decrypted_ with the paired public key.

The private key is meant to be stored in a fashion stated directly in its name – privately, and not given out to anyone.

The public key on the other hand is meant to be given to others, or anyone you want to be able to decrypt your files.

This is where GPG’s main approach for encryption comes into play. It allows you to encrypt files locally and then allow others to be ensured that the files they received were actually sent from you. As the only way they’ll be able to _decrypt_ the file is with _your_ public key, which would only work if the file was _encrypted_ using _your_ private key in the first place.

_**This also works in the opposite direction!**_ Other people can encrypt files using your public key, and the only way it’ll be able to be decrypted is with your private key. Thus allowing others to publicly post files without worry of people besides you being able to read them.

_**In other words, if a file was encrypted with a private key, it can only be decrypted with the corresponding public key. And if a file was encrypted with a public key, it can only be decrypted with the corresponding private key.**_

#### You are already using GPG without realizing

One of the most common example of using GPG is in Linux package manager, specially the [external repositories][3]. You add the public key of the developer into your system’s trusted keys. The developer signs the packages (generates a signature) with his/her private key. Since your Linux system has the public file, it understands that the package is actually coming from the trusted developer.

A number of encrypted services use some sort of GPG implementation underneath without you realizing it. But it’s better to not go in to those details right now.

Now that you are a bit familiar with the concept, let’s see how you can use GPG for encrypting a file and then use it to decrypt.

### Encrypting and decrypting files with GPG

![][4]

This is a very simplistic scenario. I presume that you have just one system and you want to see how GPG works. You are not sending the files to other system. You encrypt the file and then decrypt it on the same system.

Of course, this is not a practical use case but that’s also not the purpose of this tutorial. My aim is to get you acquainted with GPG commands and functioning. After that, you can use this knowledge in a real-world situation (if need be). And for that, I’ll show you how you can share your public key with others.

#### Step 1: Installing GPG

GPG can be found in most distribution’s repositories out of the box.

On Debian and Ubuntu-based systems, install the gpg package:

```

    sudo apt install gpg

```

If you use [Arch based distributions][5], install the gnupg package with the [pacman command][6]:

```

    sudo pacman -S gnupg

```

#### Step 2: Generating a GPG key

Generating a GPG key on your system is a simple one-command procedure.

Just run the following command, and your key will be generated (you can use the defaults for most questions as shown in the underlined sections below):

```

    gpg --full-generate-key

```

![Generating GPG keys][7]

**Checking the GPG Key**

You can then see that the private key and public key are both tied to each other by that ID shown under **pub** by using the **–list-secret-keys** and **–list-public-keys** commands respectively:

![Listing GPG keys][8]

#### Step 3: Encrypting a file with GPG

Now that you’ve set up our GPG keys, you can start encrypting our files!

Use the following command to encrypt files:

```

    gpg --encrypt --output file.gpg --recipient [email protected] file

```

Let’s go over what that command does real quick:

First you specified the **–encrypt** option. This simply tells GPG that we’ll be encrypting a file.

Next, you specified **–output file.gpg**. This can be anything, though it’s typically the name of the file you’re encrypting plus a **.gpg** extension (so **message.txt** would become **message.txt.gpg**).

Next, you type **–recipient [[email protected]][9]**. This specifies the email for a corresponding GPG key that actually doesn’t exist quite yet on this system.

Still confused?

The way this works is that the email you specify here must be tied to a public key on your local system.

Typically, this is going to be from the public GPG key of a different person, which is what you’re going to encrypt your file with. After such, the file will only be able to be decrypted with that user’s private key.

I’ll be using my previous GPG key with the **[[email protected]][9]** in this example. Thus, the logic would be that I am encrypting the file with the _public_ key of h**[[email protected]][9]**, which is then only going to be able to be decrypted with the _private_ key of **[[email protected]][9]**.

You’d only have the public key if you were encrypting a file for someone else, but since you’re encrypting the file for yourself, you have both keys on your system.

Lastly, you simply specify the file you’re going to encrypt. For this example, let’s use a file named **message.txt** with the following content:

```

    We're encrypting with GPG!

```

![Sample text file][10]

Likewise, if the email was **[[email protected]][9]**, the new GPG command would be as follows:

```

    gpg --encrypt --output message.txt.gpg --recipient [email protected] message.txt

```

![Encrypting file with GPG][11]

If you then try to read the file, you’ll see that it looks like gibberish. That is expected because the file is encrypted now:

![Reading the encrypted file generates gibberish text][12]

Let’s now delete the unencrypted message.txt file so that you can see that the message.txt.gpg file actually decrypts just fine without the original file:

![][13]

#### Step 4: Decrypting the encrypted file with GPG

Lastly, let’s actually decrypt the encrypted message. You can do such using the following command:

```

    gpg --decrypt --output file file.gpg

```

Going through the argument here, we first specify **–decrypt**, which tells GPG that you’re going to be decrypting a file.

Next, you enter **–output** file, which simply tells GPG what file you’ll be saving the encrypted form of our file to after you decrypt it.

Lastly, you enter **file.gpg**, which is just the path to your encrypted file.

Following the example, the command I’d use would be as follows:

```

    gpg --decrypt --output message.txt message.txt.gpg

```

![Decrypting file with GPG][14]

And voila, you’re done! That’s all there is to it when you want to encrypt and decrypt files with GPG.

The only other thing you may want to know is how to share your public keys with others so they can encrypt files before sending them to you.

### Sending and receiving GPG Keys

To send someone a GPG key, you’ll first need to export it from your **keychain**, which is what contains all of your public and private keys.

To export a key, simply find the key ID in your keychain, and then run the following command, replacing `id` with the key’s ID and **key.gpg** with the name of the file you want to save to:

```

    gpg --output key.gpg --export id

```

![Export GPG public key][15]

To import a key, simply give the output file (from the previous command) to the other user and then have them run the following command:

```

    gpg --import key.gpg

```

![][16]

To use the key normally though, you’ll need to verify the key so GPG properly trusts it.

This can be done by running the **–edit-key** command on the other user’s system, following by signing the key:

First run `gpg --edit-key id`:

![GPG edit key][17]

Next, run the **fpr** command, which will show the fingerprint for the key. The output of this command should be validated against the output on your own machine, which can be found by running the same **–edit-key** command on your system:

![Fingerprint of GPG key][18]

If everything matches up, just run the **sign** command and everything will be ready to go:

![Sign GPG key][19]

That’s it! The other user can now start encrypting files with your public key just as you did earlier, ensuring they’ll only be readable by you when you decrypt them with your private key.

And that’s all the basics to GPG!

### Wrapping Up

You’ve now gone over everything you need to start using GPG, including encrypting files for yourself and for others. As I mentioned earlier, this is just for understanding how GPG encryption and decryption process works. The basic GPG knowledge you just acquired can be taken to the next level when applied in real-world scenarios.

Need some help figuring out something still, or something just not working right? Feel free to leave any of it in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gpg-encrypt-files-basic/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://gnupg.org/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/GPG-encryption-explained.png?resize=800%2C300&ssl=1
[3]: https://itsfoss.com/adding-external-repositories-ubuntu/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/GPG-encryption-basic.png?resize=800%2C450&ssl=1
[5]: https://itsfoss.com/arch-based-linux-distros/
[6]: https://itsfoss.com/pacman-command/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-key-generation.png?resize=676%2C663&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-list-keys-1.png?resize=703%2C379&ssl=1
[9]: https://itsfoss.com/cdn-cgi/l/email-protection
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-example-message.png?resize=665%2C277&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-example-message-encrypted-800x252.png?resize=800%2C252&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-example-message-encrypted-gibberish.png?resize=800%2C252&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-message-original-deleted.png?resize=800%2C252&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-message-decrypt.png?resize=800%2C252&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-key-export-800x218.png?resize=800%2C218&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-key-import.png?resize=800%2C221&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-edit-key-prompt.png?resize=800%2C351&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-edit-key-fingerprint-1.png?resize=800%2C317&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/gpg-edit-key-sign.png?resize=800%2C531&ssl=1
