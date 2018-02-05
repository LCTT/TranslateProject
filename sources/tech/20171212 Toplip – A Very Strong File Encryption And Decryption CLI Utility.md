Translateing  by singledo

Toplip – A Very Strong File Encryption And Decryption CLI Utility
======
There are numerous file encryption tools available on the market to protect
your files. We have already reviewed some encryption tools such as
[**Cryptomater**][1], [**Cryptkeeper**][2], [**CryptGo**][3], [**Cryptr**][4],
[**Tomb**][5], and [**GnuPG**][6] etc. Today, we will be discussing yet
another file encryption and decryption command line utility named **"
Toplip"**. It is a free and open source encryption utility that uses a very
strong encryption method called **[AES256][7]** , along with an **XTS-AES**
design to safeguard your confidential data. Also, it uses [**Scrypt**][8], a
password-based key derivation function, to protect your passphrases against
brute-force attacks.

### Prominent features

Compared to other file encryption tools, toplip ships with the following
unique and prominent features.

  * Very strong XTS-AES256 based encryption method.
  * Plausible deniability.
  * Encrypt files inside images (PNG/JPG).
  * Multiple passphrase protection.
  * Simplified brute force recovery protection.
  * No identifiable output markers.
  * Open source/GPLv3.

### Installing Toplip

There is no installation required. Toplip is a standalone executable binary
file. All you have to do is download the latest toplip from the [**official
products page**][9] and make it as executable. To do so, just run:

```
chmod +x toplip
```

### Usage

If you run toplip without any arguments, you will see the help section.

```
./toplip
```

[![][10]][11]

Allow me to show you some examples.

For the purpose of this guide, I have created two files namely **file1** and
**file2**. Also, I have an image file which we need it to hide the files
inside it. And finally, I have **toplip** executable binary file. I have kept
them all in a directory called **test**.

[![][12]][13]

**Encrypt/decrypt a single file**

Now, let us encrypt **file1**. To do so, run:

```
./toplip file1 > file1.encrypted
```

This command will prompt you to enter a passphrase. Once you have given the
passphrase, it will encrypt the contents of **file1** and save them in a file
called **file1.encrypted** in your current working directory.

Sample output of the above command would be:

```
This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip file1 Passphrase #1: generating keys...Done 
Encrypting...Done
```

To verify if the file is really encrypted., try to open it and you will see
some random characters.

To decrypt the encrypted file, use **-d** flag like below:

```
./toplip -d file1.encrypted
```

This command will decrypt the given file and display the contents in the
Terminal window.

To restore the file instead of writing to stdout, do:

```
./toplip -d file1.encrypted > file1.decrypted
```

Enter the correct passphrase to decrypt the file. All contents of **file1.encrypted** will be restored in a file called **file1.decrypted**.

Please don't follow this naming method. I used it for the sake of easy understanding. Use any other name(s) which is very hard to predict.

**Encrypt/decrypt multiple files
**

Now we will encrypt two files with two separate passphrases for each one.

```
./toplip -alt file1 file2 > file3.encrypted
```

You will be asked to enter passphrase for each file. Use different
passphrases.

Sample output of the above command will be:

```
This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip 
**file2 Passphrase #1** : generating keys...Done 
**file1 Passphrase #1** : generating keys...Done 
Encrypting...Done
```

What the above command will do is encrypt the contents of two files and save
them in a single file called **file3.encrypted**. While restoring, just give
the respective password. For example, if you give the passphrase of the file1,
toplip will restore file1. If you enter the passphrase of file2, toplip will
restore file2.

Each **toplip** encrypted output may contain up to four wholly independent
files, and each created with their own separate and unique passphrase. Due to
the way the encrypted output is put together, there is no way to easily
determine whether or not multiple files actually exist in the first place. By
default, even if only one file is encrypted using toplip, random data is added
automatically. If more than one file is specified, each with their own
passphrase, then you can selectively extract each file independently and thus
deny the existence of the other files altogether. This effectively allows a
user to open an encrypted bundle with controlled exposure risk, and no
computationally inexpensive way for an adversary to conclusively identify that
additional confidential data exists. This is called **Plausible deniability**
, one of the notable feature of toplip.

To decrypt **file1** from **file3.encrypted** , just enter:

```
./toplip -d file3.encrypted > file1.encrypted
```

You will be prompted to enter the correct passphrase of file1.

To decrypt **file2** from **file3.encrypted** , enter:

```
./toplip -d file3.encrypted > file2.encrypted
```

Do not forget to enter the correct passphrase of file2.

**Use multiple passphrase protection**

This is another cool feature that I admire. We can provide multiple
passphrases for a single file when encrypting it. It will protect the
passphrases against brute force attempts.

```
./toplip -c 2 file1 > file1.encrypted
```

Here, **-c 2** represents two different passphrases. Sample output of above
command would be:

```
This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip 
**file1 Passphrase #1:** generating keys...Done
**file1 Passphrase #2:** generating keys...Done 
Encrypting...Done
```

As you see in the above example, toplip prompted me to enter two passphrases.
Please note that you must **provide two different passphrases** , not a single
passphrase twice.

To decrypt this file, do:

```
$ ./toplip -c 2 -d file1.encrypted > file1.decrypted 
This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip 
**file1.encrypted Passphrase #1:** generating keys...Done
**file1.encrypted Passphrase #2:** generating keys...Done
Decrypting...Done
```

**Hide files inside image**

The practice of concealing a file, message, image, or video within another
file is called **steganography**. Fortunately, this feature exists in toplip
by default.

To hide a file(s) inside images, use **-m** flag as shown below.

```
$ ./toplip -m image.png file1 > image1.png
This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip 
file1 Passphrase #1: generating keys...Done 
Encrypting...Done
```

This command conceals the contents of file1 inside an image named image1.png.
To decrypt it, run:

```
$ ./toplip -d image1.png > file1.decrypted This is toplip v1.20 (C) 2015, 2016 2 Ton Digital. Author: Jeff Marrison A showcase piece for the HeavyThing library. Commercial support available Proudly made in Cooroy, Australia. More info: https://2ton.com.au/toplip 
image1.png Passphrase #1: generating keys...Done 
Decrypting...Done
```

**Increase password complexity**

To make things even harder to break, we can increase the password complexity
like below.

```
./toplip -c 5 -i 0x8000 -alt file1 -c 10 -i 10 file2 > file3.encrypted
```

The above command will prompt to you enter 10 passphrases for the file1, 5
passphrases for the file2 and encrypt both of them in a single file called
"file3.encrypted". As you may noticed, we have used one more additional flag
**-i** in this example. This is used to specify key derivation iterations.
This option overrides the default iteration count of 1 for scrypt's initial
and final PBKDF2 stages. Hexadecimal or decimal values permitted, e.g.
**0x8000** , **10** , etc. Please note that this can dramatically increase the
calculation times.

To decrypt file1, use:

```
./toplip -c 5 -i 0x8000 -d file3.encrypted > file1.decrypted
```

To decrypt file2, use:

```
./toplip -c 10 -i 10 -d file3.encrypted > file2.decrypted
```

To know more about the underlying technical information and crypto methods
used in toplip, refer its official website given at the end.

My personal recommendation to all those who wants to protect their data. Don't
rely on single method. Always use more than one tools/methods to encrypt
files. Do not write passphrases/passwords in a paper and/or do not save them
in your local or cloud storage. Just memorize them and destroy the notes. If
you're poor at remembering passwords, consider to use any trustworthy password
managers.

And, that's all. More good stuffs to come. Stay tuned!

Cheers!




--------------------------------------------------------------------------------

via: https://www.ostechnix.com/toplip-strong-file-encryption-decryption-cli-utility/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/cryptomator-open-source-client-side-encryption-tool-cloud/
[2]:https://www.ostechnix.com/how-to-encrypt-your-personal-foldersdirectories-in-linux-mint-ubuntu-distros/
[3]:https://www.ostechnix.com/cryptogo-easy-way-encrypt-password-protect-files/
[4]:https://www.ostechnix.com/cryptr-simple-cli-utility-encrypt-decrypt-files/
[5]:https://www.ostechnix.com/tomb-file-encryption-tool-protect-secret-files-linux/
[6]:https://www.ostechnix.com/an-easy-way-to-encrypt-and-decrypt-files-from-commandline-in-linux/
[7]:http://en.wikipedia.org/wiki/Advanced_Encryption_Standard
[8]:http://en.wikipedia.org/wiki/Scrypt
[9]:https://2ton.com.au/Products/
[10]:https://www.ostechnix.com/wp-content/uploads/2017/12/toplip-2.png%201366w,%20https://www.ostechnix.com/wp-content/uploads/2017/12/toplip-2-300x157.png%20300w,%20https://www.ostechnix.com/wp-content/uploads/2017/12/toplip-2-768x403.png%20768w,%20https://www.ostechnix.com/wp-content/uploads/2017/12/toplip-2-1024x537.png%201024w
[11]:http://www.ostechnix.com/wp-content/uploads/2017/12/toplip-2.png
[12]:https://www.ostechnix.com/wp-content/uploads/2017/12/toplip-1.png%20779w,%20https://www.ostechnix.com/wp-content/uploads/2017/12/toplip-1-300x101.png%20300w,%20https://www.ostechnix.com/wp-content/uploads/2017/12/toplip-1-768x257.png%20768w
[13]:http://www.ostechnix.com/wp-content/uploads/2017/12/toplip-1.png

