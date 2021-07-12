[#]: subject: (Encrypt and decrypt files with a passphrase on Linux)
[#]: via: (https://opensource.com/article/21/7/linux-age)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Encrypt and decrypt files with a passphrase on Linux
======
Age is a simple, easy-to-use tool that allows you to encrypt and decrypt
files with a single passphrase.
![Scissors cutting open access to files][1]

Encryption and security for protecting files and sensitive documents have long been a concern for users. Even as more and more of our data is housed on websites and cloud services, protected by user accounts with ever-more secure and challenging passwords, there's still great value in being able to store sensitive data on our own filesystems, especially when we can encrypt that data quickly and easily.

[Age][2] allows you to do this. It is a small, easy-to-use tool that allows you to encrypt a file with a single passphrase and decrypt it as required.

### Install age

Age is available to [install][3] from most Linux repositories.

To install it on Fedora:


```
`$ sudo dnf install age -y`
```

On macOS, use [MacPorts][4] or [Homebrew][5]. On Windows, use [Chocolatey][6].

### Encrypting and decrypting files with age

Age can encrypt and decrypt files with either a public key or a passphrase set by the user.

#### Using age with a public key

First, generate a public key and write the output to a `key.txt` file:


```
$ age-keygen -o key.txt
Public key: age16frc22wz6z206hslrjzuv2tnsuw32rk80pnrku07fh7hrmxhudawase896m9
```

### Encrypt with a public key

To encrypt a file with your public key:


```
`$ touch mypasswds.txt | age -r ageage16frc22wz6z206hslrjzuv2tnsuw32rk80pnrku07fh7hrmxhudawase896m9 > mypass.tar.gz.age`
```

In this example, the file `mypasswds.txt` is encrypted with the public key I generated and put inside an encrypted file called `mypass.tar.gz.age`.

### Decrypt with a public key

To decrypt the information you've protected, use the `age` command and the `--decrypt` option:


```
`$ age --decrypt -i key.txt -o mypass.tar.gz mypass.tar.gz.age`
```

In this example, age uses the key stored in `key.text` and decrypts the file I created in the previous step.

### Encrypt with a passphrase

Encrypting a file without a public key is known as symmetrical encryption. It allows a user to set the passphrase to encrypt and decrypt a file. To do so:


```
$ age --passphrase --output mypasswd-encrypted.txt mypasswd.txt
Enter passphrase (leave empty to autogenerate a secure one):  
Confirm passphrase:
```

In this example, age prompts you for a passphrase, which it uses to encrypt the input file `mypasswd.txt` and render the file `mypasswd-encrypted.txt` in return.

### Decrypt with a passphrase

To decrypt a file encrypted with a passphrase, use the `age` command with the `--decrypt` option:


```
`$ age --decrypt --output passwd-decrypt.txt mypasswd-encrypted.txt`
```

In this example, age prompts you for the passphrase, then decrypts the contents of the `mypasswd-encrypted.txt` file into `passwd-decrypt.txt`, as long as you provide the passphrase that matches the one set during encryption.

### Don't lose your keys

Whether you're using passphrase encryption or public-key encryption, you _must not_ lose the credentials for your encrypted data. By design, a file encrypted with age cannot be decrypted without the key used to encrypt it. So back up your public key, and remember those passphrases!

### Easy encryption at last

Age is a really robust tool. I like to encrypt my sensitive files, especially tax records and other archival data, into a `.tz` file for later access. Age is user-friendly and makes it very easy to get started with encryption on the go.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/linux-age

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2 (Scissors cutting open access to files)
[2]: https://github.com/FiloSottile/age
[3]: https://github.com/FiloSottile/age#installation
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
[6]: https://opensource.com/article/20/3/chocolatey
