FSSlc translating

How to Generate/Encrypt/Decrypt Random Passwords in Linux
================================================================================
We have taken initiative to produce Linux tips and tricks series. If you’ve missed the last article of this series, you may like to visit the link below.

注：此篇文章做过原文
- [5 Interesting Command Line Tips and Tricks in Linux][1]

In this article, we will share some interesting Linux tips and tricks to generate random passwords and also how to encrypt and decrypt passwords with or without slat method.

Security is one of the major concern of digital age. We put on password to computers, email, cloud, phone, documents and what not. We all know the basic to choose the password that is easy to remember and hard to guess. What about some sort of machine based password generation automatically? Believe me Linux is very good at this.

**1. Generate a random unique password of length equal to 10 characters using command ‘pwgen‘. If you have not installed pwgen yet, use Apt or YUM to get.**

    $ pwgen 10 1

![Generate Random Unique Password](http://www.tecmint.com/wp-content/uploads/2015/03/Generate-Random-Unique-Password-in-Linux.gif)
Generate Random Unique Password

Generate several random unique passwords of character length 50 in one go!

    $ pwgen 50

![Generate Multiple Random Passwords](http://www.tecmint.com/wp-content/uploads/2015/03/Generate-Multiple-Random-Passwords.gif)
Generate Multiple Random Passwords

**2. You may use ‘makepasswd‘ to generate random, unique password of given length as per choice. Before you can fire makepasswd command, make sure you have installed it. If not! Try installing the package ‘makepasswd’ using Apt or YUM.**

Generate a random password of character length 10. Default Value is 10.

    $ makepasswd 

![makepasswd Generate Unique Password](http://www.tecmint.com/wp-content/uploads/2015/03/mkpasswd-generate-unique-password.gif)
makepasswd Generate Unique Password

Generate a random password of character length 50.

    $ makepasswd  --char 50

![Generate Length 50 Password](http://www.tecmint.com/wp-content/uploads/2015/03/Random-Password-Generate.gif)
Generate Length 50 Password

Generate 7 random password of 20 characters.

    $ makepasswd --char 20 --count 7

![](http://www.tecmint.com/wp-content/uploads/2015/03/Generate-20-Character-Password.gif)

**3. Encrypt a password using crypt along with salt. Provide salt manually as well as automatically.**

For those who may not be aware of salt,

Salt is a random data which servers as an additional input to one way function in order to protect password against dictionary attack.

Make sure you have installed mkpasswd installed before proceeding.

The below command will encrypt the password with salt. The salt value is taken randomly and automatically. Hence every time you run the below command it will generate different output because it is accepting random value for salt every-time.

    $ mkpasswd tecmint

![Encrypt Password Using Crypt](http://www.tecmint.com/wp-content/uploads/2015/03/Encrypt-Password-in-Linux.gif)
Encrypt Password Using Crypt

Now lets define the salt. It will output the same result every-time. Note you can input anything of your choice as salt.

    $ mkpasswd tecmint -s tt

![Encrypt Password Using Salt](http://www.tecmint.com/wp-content/uploads/2015/03/Encrypt-Password-Using-Salt.gif)
Encrypt Password Using Salt

Moreover, mkpasswd is interactive and if you don’t provide password along with the command, it will ask password interactively.

**4. Encrypt a string say “Tecmint-is-a-Linux-Community” using aes-256-cbc encryption using password say “tecmint” and salt.**

    # echo Tecmint-is-a-Linux-Community | openssl enc -aes-256-cbc -a -salt -pass pass:tecmint

![Encrypt A String in Linux](http://www.tecmint.com/wp-content/uploads/2015/03/Encrypt-A-String-in-Linux.gif)
Encrypt A String in Linux

Here in the above example the output of 注：此篇原文也做过[echo command][2] is pipelined with openssl command that pass the input to be encrypted using Encoding with Cipher (enc) that uses aes-256-cbc encryption algorithm and finally with salt it is encrypted using password (tecmint).

**5. Decrypt the above string using openssl command using the -aes-256-cbc decryption.**

    # echo U2FsdGVkX18Zgoc+dfAdpIK58JbcEYFdJBPMINU91DKPeVVrU2k9oXWsgpvpdO/Z | openssl enc -aes-256-cbc -a -d -salt -pass pass:tecmint

![Decrypt String in Linux](http://www.tecmint.com/wp-content/uploads/2015/03/Decrypt-String-in-Linux.gif)
Decrypt String in Linux

That’s all for now. If you know any such tips and tricks you may send us your tips at admin@tecmint.com, your tip will be published under your name and also we will include it in our future article.

Keep connected. Keep Connecting. Stay Tuned. Don’t forget to provide us with your valuable feedback in the comments below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/generate-encrypt-decrypt-random-passwords-in-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/5-linux-command-line-tricks/
[2]:http://www.tecmint.com/echo-command-in-linux/
