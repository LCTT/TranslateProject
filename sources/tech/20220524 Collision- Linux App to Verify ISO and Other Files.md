[#]: subject: "Collision: Linux App to Verify ISO and Other Files"
[#]: via: "https://www.debugpoint.com/2022/05/collision/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Collision: Linux App to Verify ISO and Other Files
======
The tutorial outlines the features and usage guide of Collision. It is a GUI-based, easy-to-use utility that lets you verify files using cryptographic hash functions.

### Why do you need to verify files?

Everyone downloads files every day over the internet. But many users never bother to verify their integrity or authenticity. That means whether the file is legitimate and not tampered with by any malicious codes.

Take an example of any [Linux Distributions][1]‘ ISO files which come as standard installer images. All popular distribution makers also provide a hash file alongside the ISO file. Using that file, you can easily compare the hash value of your downloaded file. And you can rest assured that your file is correct and not corrupted by any means.

Moreover, if you download a large file over an unstable internet connection, the file may get corrupted. IN those scenarios also, it helps to verify.

### Collision – Features and How to Use

The app – [Collision][2] uses Cryptographic Hash Functions to help you verify files. The cryptographic hash functions are popular algorithms that generate the file data into a fixed-length data stream via several encryption algorithms. The most popular ones are MD5, SHA-1, SHA-256 and SHA-512. All of these are supported by the Collision app.

In addition to that, Collision also presents a neat user interface which is simple and easy to use for every Linux user. Here’s how it looks.

![Collision – First Screen][3]

Firstly, it has two primary features. a) upload a file to get the checksum or hash values and b) compare the checksum with the uploaded file.

For example, if you have a simple file, you can upload it via the “Open a File” button or “Open” for re-uploading another file.

As you can see in the below image, the text file has the below checksum for various hash functions. Now you can share the file over the internet/with anyone, along with the checksum values for verification.

![Hash values of a test file][4]

Moreover, if someone tampers with the file (even with a single byte) or the file gets corrupted during distribution, then the hash value changes entirely.

Secondly, if you want to verify the integrity of a file you have downloaded, go to the Verify tab. Then upload the file and enter the hash value of the uploaded file you received.

If it matches, you should see a green tick showing its authenticity.

![Collision verifies a sample file with SHA-256][5]

In addition, here is another example where I have modified the test file and kept the values as same. This use case clearly states that it’s not valid for this file.

![Collision showing that a file is not valid][6]

#### An important note

It is worth mentioning here that the hash methods don’t verify the file meta attributes such as modify time, modify date, etc. If someone tampers any file and reverts it to its original content, the hash methods would term it a valid file.

Now, let’s see a typical example of validating an ISO file.

### Example of Using Collision to verify a sample ISO file of Ubuntu Linux

I am sure you download many ISO files while using Linux in general. So to illustrate, I have downloaded the popular Ubuntu ISO server image from the official Ubuntu download page.

![Ubuntu server ISO file and checksums][7]

The SHA256SUMS file has the below checksum value for the installer, as shown above.

![SHA-256 value of Ubuntu server ISO image][8]

After you download, open the Collision application and upload the ISO file via the Verify tab. Then copy the SHA-256 value and paste it to the checksum box on the left.

You should see that the file is authentic if you have correctly downloaded and followed the steps.

![Ubuntu server ISO image verified][9]

### How to Install Collision

The Collision app installation is effortless using Flatpak. You need to [set up Flatpak][10] for your Linux Distributions and click on the below link to install Collision.

[Install Collision via Flathub][11]

After installation, you should find it via the application menu of your distro.

### Is there another way to verify files without any app?

Yes, there are some built-in utilities available in all Linux distributions, which you can also use to verify the files and their integrity using the terminal.

The following terminal utilities can be used to determine the hash of any file. They are installed by default in all distros, and you can even use them for your shell script to automate.

```
md5sum <file name>
```

```
sha1sum <file name>
```

```
sha256sum <file name>
```

Using the above utilities, you can find out the hash value. But you need to compare them to verify manually.

![Verify files via command-line utilities][12]

### Closing Notes

I hope this guide helps you verify your files using the Collision GTK app. It is straightforward to use. Moreover, you can use the command line methods to verify any files you want when you are in the terminal. Also, it’s a best practice to always check for file integrity wherever possible.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/collision/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/category/distributions
[2]: https://collision.geopjr.dev/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/05/Collision-First-Screen.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/05/Hash-values-of-a-test-file.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/05/Collision-verifies-a-sample-file-with-SHA-256.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/05/Collision-showing-that-a-file-is-not-valid.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/05/Ubuntu-server-ISO-file-and-checksums.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/05/SHA-256-valud-of-Ubuntu-server-ISO-image.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/05/Ubuntu-server-ISO-image-verified.jpg
[10]: https://flatpak.org/setup/
[11]: https://dl.flathub.org/repo/appstream/dev.geopjr.Collision.flatpakref
[12]: https://www.debugpoint.com/wp-content/uploads/2022/05/Verify-files-via-command-line-utilities.jpg
