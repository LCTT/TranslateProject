[#]: subject: "Collision: An Open-Source App to Check if Your Files Were Tampered With"
[#]: via: "https://itsfoss.com/collision/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Collision: An Open-Source App to Check if Your Files Were Tampered With
======

_**B**__**rief:** A GUI program to let you check hash for your files to ensure that it is not malicious and true to its source._

Someone sends you a file, how do you verify that it’s the original one meant for you? How can you be certain that it hasn’t been tampered with?

Moreover, how can you verify that the file comes from an original source?

That’s where cryptographic hash functions come in. A hash function (such as SHA-1) is a checksum if it is used to verify a file. This helps you confirm whether the file has been modified or not.

If you are curious, you can refer to our [guide on verifying checksum in Linux][1].

For every information/file, there will be a unique hash value (or checksum). So, even if a tiny bit of the file changes, the hash value changes entirely.

It’s primarily used in encryption, where every file/information is stored securely as hash values. Suppose an attacker gets hold of the database with hash values (instead of the real information), they cannot make sense of it. And, this is how encryption makes things secure.

While discussing hashing is beyond the scope of this article, it is important to know that it comes in handy when verifying the integrity of a file.

### Collision: Easily Verify a File and Spot Malicious Files

![][2]

Without a GUI, you will have to use the terminal to generate hash values to compare/verify.

Collision makes it incredibly easy, without needing to launch a terminal or knowing to generate checksum values of a file. If you are not aware of it, our [tutorial on verifying checksum in Linux][1] should help.

When using Collision, you just add the file that you need to generate a hash value or verify it. It only takes a few clicks to protect yourself against malicious or tampered files.

While I show a text file in the screenshot, you can verify any type of file or generate a hash for your files before sending it to someone else. You can share the hash values generated with the recipient to let them validate your file.

![][3]

It is a straightforward open-source app that just lets you do two things:

  * Generate Hash values (SHA-1, MD5, SHA-256, SHA-516)
  * Verify an item against a checksum or by directly using the file



### Here’s How Collision App Works

To give you an example, I modified the original text file by adding a character to it and then tried verifying it.

Here’s what it looks like:

First, you need to open the original file that you want to compare it with or have the checksum value with you.

Open the original file first to generate the hash, and then head to the verify section to access a modified file.

![][4]

You will notice that it detects that it isn’t the same:

![][5]

In case you are checking against the checksum, first, open the file that you want to verify (here, we have the modified file).

![][6]

And, then input the original checksum of the file. As we already know that we are testing a modified file, the result is what we expect, i.e., **failed to verify integrity**.

![][7]

### Install Collision in Linux

Collision is primarily a GNOME-tailored app, but it works on any other distribution.

You can install it using the [Flatpak package available][8], or build it from the source while exploring its GitHub page. You can refer to our [Flatpak guide][9] for help if you’re new to Linux.

If you prefer using the terminal, type in the following to install it:

```

    flatpak install flathub dev.geopjr.Collision

```

To get started, you can also visit its official website.

[Collision][10]

--------------------------------------------------------------------------------

via: https://itsfoss.com/collision/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/checksum-tools-guide-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collission-verify-true.png?resize=800%2C617&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collision-hash-values.png?resize=800%2C617&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collision-file-open.png?resize=800%2C328&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collision-file-check.png?resize=800%2C620&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collision-file-verify.png?resize=800%2C373&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collision-input-checksum.png?resize=800%2C626&ssl=1
[8]: https://flathub.org/apps/details/dev.geopjr.Collision
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://collision.geopjr.dev/
