[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Verify ISO Images In Linux)
[#]: via: (https://www.ostechnix.com/how-to-verify-iso-images-in-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Verify ISO Images In Linux
======

![How To Verify ISO Images In Linux][1]

You just downloaded an ISO image of your favorite Linux distribution from the official site or a third party site, now what? [**Create bootable medium**][2] and start installing the OS? No, wait. Before start using it, It is highly recommended to verify that the downloaded ISO in your local system is the exact copy of the ISO present in the download mirrors. Because, [**Linux Mint’s website is hacked**][3] few years ago and the hackers made a modified Linux Mint ISO, with a backdoor in it. So, It is important to check the authenticity and integrity of your Linux ISO images. If you don’t know how to verify ISO images in Linux, this brief guide will help. Read on!

### Verify ISO Images In Linux

We can verify ISO images using the **Checksum** values. Checksum is a sequence of letters and numbers used to check data for errors and verify the authenticity and integrity of the downloaded files. There are different types of checksums, such as SHA-0, SHA-1, SHA-2 (224, 256, 384, 512) and MD5. MD5 sums have been the most popular, but nowadays SHA-256 sums are mostly used by modern Linux distros.

We are going to use two tools namely **“gpg”** and **“sha256”** to verify authenticity and integrity of the ISO images.

##### Download checksums and signatures

For the purpose of this guide, I am going to use Ubuntu 18.04 LTS server ISO image. However, the steps given below should work on other Linux distributions as well.

Near the top of the Ubuntu download page, you will see a few extra files (checksums and signatures) as shown in the following picture.

![][4]

Ubuntu 18.04 checksum and signature

Here, the **SHA256SUMS** file contains checksums for all the available images and the **SHA256SUMS.gpg** file is the GnuPG signature for that file. We use this signature file to **verify** the checksum file in subsequent steps.

Download the Ubuntu ISO images and these two files and put them all in a directory, for example **ISO**.

```
$ ls ISO/
SHA256SUMS SHA256SUMS.gpg ubuntu-18.04.2-live-server-amd64.iso
```

As you see in the above output, I have downloaded Ubuntu 18.04.2 LTS server image along with checksum and signature values.

##### Download valid signature key

Now, download the correct signature key using command:

```
$ gpg --keyid-format long --keyserver hkp://keyserver.ubuntu.com --recv-keys 0x46181433FBB75451 0xD94AA3F0EFE21092
```

Sample output:

```
gpg: key D94AA3F0EFE21092: 57 signatures not checked due to missing keys
gpg: key D94AA3F0EFE21092: public key "Ubuntu CD Image Automatic Signing Key (2012) <[email protected]>" imported
gpg: key 46181433FBB75451: 105 signatures not checked due to missing keys
gpg: key 46181433FBB75451: public key "Ubuntu CD Image Automatic Signing Key <[email protected]>" imported
gpg: no ultimately trusted keys found
gpg: Total number processed: 2
gpg: imported: 2
```

##### Verify SHA-256 checksum

Next verify the checksum file using the signature with command:

```
$ gpg --keyid-format long --verify SHA256SUMS.gpg SHA256SUMS
```

Sample output:

```
gpg: Signature made Friday 15 February 2019 04:23:33 AM IST
gpg: using DSA key 46181433FBB75451
gpg: Good signature from "Ubuntu CD Image Automatic Signing Key <[email protected]>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg: There is no indication that the signature belongs to the owner.
Primary key fingerprint: C598 6B4F 1257 FFA8 6632 CBA7 4618 1433 FBB7 5451
gpg: Signature made Friday 15 February 2019 04:23:33 AM IST
gpg: using RSA key D94AA3F0EFE21092
gpg: Good signature from "Ubuntu CD Image Automatic Signing Key (2012) <[email protected]>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg: There is no indication that the signature belongs to the owner.
Primary key fingerprint: 8439 38DF 228D 22F7 B374 2BC0 D94A A3F0 EFE2 1092
```

If you see “Good signature” in the output,the checksum file is created by Ubuntu developer and signed by the owner of the key file.

##### Check the downloaded ISO file

Next, let us go ahead and check the downloaded ISO file matches the checksum. To do so, simply run:

```
$ sha256sum -c SHA256SUMS 2>&1 | grep OK
ubuntu-18.04.2-live-server-amd64.iso: OK
```

If the checksum values are matched, you will see the **“OK”** message. Meaning – the downloaded file is legitimate and hasn’t altered or tampered.

If you don’t get any output or different than above output, the ISO file has been modified or incorrectly downloaded. You must re-download the file again from a good source.

Some Linux distributions have included the checksum value in the download page itself. For example, **Pop!_os** developers have provided the SHA-256 checksum values for all ISO images in the download page itself, so you can quickly verify the ISO images.

![][5]

Pop os SHA256 sum value in download page

After downloading the the ISO image, verify it using command:

```
$ sha256sum Soft_backup/ISOs/pop-os_18.04_amd64_intel_54.iso
```

Sample output:

```
680e1aa5a76c86843750e8120e2e50c2787973343430956b5cbe275d3ec228a6 Soft_backup/ISOs/pop-os_18.04_amd64_intel_54.iso
```

![][6]

Pop os SHA256 sum value

Here, the random string starting with **“680elaa…”** is the SHA-256 checksum value. Compare this value with the SHA-256 sum value provided on the downloads page. If both values are same, you’re good to go! The downloaded ISO file is legitimate and it hasn’t changed or modified from its original state.

This is how we can verify the authenticity and integrity of an ISO file in Linux. Whether you download ISOs from official or third-party sources, it is always recommended to do a quick verification before using them. Hope this was useful.

**Reference:**

  * [**https://tutorials.ubuntu.com/tutorial/tutorial-how-to-verify-ubuntu**][7]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-verify-iso-images-in-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Verify-ISO-Images-In-Linux-720x340.png
[2]: https://www.ostechnix.com/etcher-beauitiful-app-create-bootable-sd-cards-usb-drives/
[3]: https://blog.linuxmint.com/?p=2994
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/Ubuntu-18.04-checksum-and-signature.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/Pop-os-SHA256-sum.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/07/Pop-os-SHA256-sum-value.png
[7]: https://tutorials.ubuntu.com/tutorial/tutorial-how-to-verify-ubuntu
