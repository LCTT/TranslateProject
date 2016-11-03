OneNewLife translating

# How to Encrypt and Decrypt Files and Directories Using Tar and OpenSSL

When you have important sensitive data, then its crucial to have an extra layer of security to your files and directories, specially when you need to transmit the data with others over a network.

That’s the reason, I am looking for a utility to encrypt and decrypt certain files and directories in Linux, luckily I found a solution that tar with OpenSSL can do the trick, yes with the help of these two tools you can easily create and encrypt tar archive file without any hassle.

In this article, we will see how to create and encrypt a tar or gz (gzip) archive file with OpenSSL:

Remember that the conventional form of using OpenSSL is:

```
# openssl command command-options arguments

```

#### Encrypt Files in Linux

To encrypt the contents of the current working directory (depending on the size of the files, this may take a while):

```
# tar -czf - * | openssl enc -e -aes256 -out secured.tar.gz

```

Explanation of the above command:

1.  `enc` – openssl command to encode with ciphers
2.  `-e` – a enc command option to encrypt the input file, which in this case is the output of the tar command
3.  `-aes256` – the encryption cipher
4.  `-out` – enc option used to specify the name of the out filename, secured.tar.gz

#### Decrypt Files in Linux

To decrypt a tar archive contents, use the following command.

```
# openssl enc -d -aes256 -in secured.tar.gz | tar xz -C test

```

Explanation of the above command:

1.  `-d` – used to decrypt the files
2.  `-C` – extract in subdirectory named test

The following image shows the encryption process and what happens when you try to:

1.  extract the contents of the tarball the traditional way
2.  use the wrong password, and
3.  when you enter the right password

[![Encrypt or Decrypt Tar Archive File in Linux](http://www.tecmint.com/wp-content/uploads/2016/08/Encrypt-Decrypt-Tar-Archive-Files-in-Linux.png)][1]

Encrypt or Decrypt Tar Archive File in Linux

When you are working on a local network or the Internet, you can always secure your vital documents or files that you share with others by encrypting them, this can help reduce the risk of exposing them to malicious attackers.

We looked at a simple technique of encrypting tarballs using OpenSSL, a openssl command line tool. You can refer to its man page for more information and useful commands.

As usual, for any additional thoughts or simple tips that you wish to share with us, use the feedback form below and in the upcoming tip, we shall look at a way of translating rwx permissions into octal form.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/encrypt-decrypt-files-tar-openssl-linux/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Gabriel Cánepa][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/wp-content/uploads/2016/08/Encrypt-Decrypt-Tar-Archive-Files-in-Linux.png
