[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (FinalCrypt – An Open Source File Encryption Application)
[#]: via: (https://itsfoss.com/finalcrypt/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

FinalCrypt – An Open Source File Encryption Application
======

I usually don’t encrypt files – but if I am planning to organize my important documents or credentials, an encryption program would come in handy.

You may be already using a program like [GnuPG][1] that helps you encrypt/decrypt your files on your Linux machine. There is [EncryptPad][2] as well that encrypts your notes.

However, I have come across a new free and open source encryption tool called FinalCrypt. You can check out their recent releases and the source on its [GitHub page][3].

In this article, I will be sharing my experience of using this tool. Do note that I won’t be comparing this with any other program available out there – so if you want a detailed comparison between multiple solutions, let us know in the comments.

![FinalCrypt][4]

### Using FinalCrypt to encrypt files

FinalCrypt uses the [One-Time pad][5] key generation cipher to encrypt files. In other words, it generates an OTP key which you will use for encrypting or decrypting your files.

The key will be completely random as per the size of the key – which you can specify. So, it is impossible to decrypt the file without the key file.

While the OTP key method for encryption/decryption is simple and effective, but managing or securing the key file could be an inconvenience for some.

If you want to use FinalCrypt, you can install the DEB/RPM files from its website. FinalCrypt is also available for Windows and macOS.

Once downloaded, simply double click to [install it from deb][6] or rpm files. You can also build it from the source code if you want.

### FileCrypt in Action

This video shows how to use FinalCrypt:

<https://youtu.be/6Ir8VcZ26E4>

If you like Linux related videos, please [subscribe to our YouTube channel][7].

Once you have installed FinalCrypt, you’ll find it in your list of installed applications. Launch it from there.

Upon launch, you will observe two sections (split) for the items to encrypt/decrypt and the other to select the OTP file.

![Using FinalCrypt for encrypting files in Linux][8]

First, you will have to generate an OTP key. Here’s how to do that:

![finalcrypt otp][9]

Do note that your file name can be anything – but you need to make sure that the key file size is greater or equal to the file you want to encrypt. I find it absurd but that’s how it is.

![][10]

After you generate the file, select the key on the right-side of the window and then select the files that you want to encrypt on the left-side of the window.

You will find the checksum value, key file size, and valid status highlighted after generating the OTP:

![][11]

After making the selection, you just need to click on “ **Encrypt** ” to encrypt those files and if already encrypted, then “ **Decrypt** ” to decrypt those.

![][12]

You can also use FinalCrypt in command line to automate your encryption job.

#### How do you secure your OTP key?

It is easy to encrypt/decrypt the files you want to protect. But, where should you keep your OTP key?

It is literally useless if you fail to keep your OTP key in a safe storage location.

Well, one of the best ways would be to use a USB stick specifically for the keys you want to store. Just plug it in when you want to decrypt files and its all good.

In addition to that, you may save your key on a [cloud service][13], if you consider it secure enough.

More information about FinalCrypt can be found on its website.

[FinalCrypt](https://sites.google.com/site/ronuitholland/home/finalcrypt)

**Wrapping Up**

It might seem a little overwhelming at the beginning but it is actually a simple and user-friendly encryption program available for Linux. There are other programs to [password protect folders][14] as well if you are interested in some additional reading.

What do you think about FinalCrypt? Do you happen to know about something similar which is potentially better? Let us know in the comments and we shall take a look at them!


--------------------------------------------------------------------------------

via: https://itsfoss.com/finalcrypt/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.gnupg.org/
[2]: https://itsfoss.com/encryptpad-encrypted-text-editor-linux/
[3]: https://github.com/ron-from-nl/FinalCrypt
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt.png?resize=800%2C450&ssl=1
[5]: https://en.wikipedia.org/wiki/One-time_pad
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt.jpg?fit=800%2C439&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt-otp-key.jpg?resize=800%2C443&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt-otp-generate.jpg?ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt-key.jpg?fit=800%2C420&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt-encrypt.jpg?ssl=1
[13]: https://itsfoss.com/cloud-services-linux/
[14]: https://itsfoss.com/password-protect-folder-linux/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/finalcrypt.png?fit=800%2C450&ssl=1
