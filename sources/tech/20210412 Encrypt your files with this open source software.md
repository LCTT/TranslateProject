[#]: subject: (Encrypt your files with this open source software)
[#]: via: (https://opensource.com/article/21/4/open-source-encryption)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Encrypt your files with this open source software
======
VeraCrypt offers open source file-encryption with cross-platform
capabilities.
![Lock][1]

Many years ago, there was encryption software called [TrueCrypt][2]. Its source code was available, although there were no major claims that anyone had ever audited or contributed to it. Its author was (and remains to this day) anonymous. Still, it was cross-platform, easy to use, and really, really useful.

TrueCrypt allowed you to create an encrypted file "vault," where you could store sensitive information of any kind (text, audio, video, images, PDFs, and so on). Provided you had the correct passphrase, TrueCrypt could decrypt the vault and provide read and write access on any computer running TrueCrypt. It was a useful technique that essentially provided a virtual, portable, fully encrypted drive (except it was a file) where you could safely store your data.

TrueCrypt eventually closed down, but a replacement project called VeraCrypt quickly sprang up to fill the void. [VeraCrypt][3] is based on TrueCrypt 7.1a and features many improvements over the original (including significant algorithm changes for standard encrypted volumes and boot volumes). With VeraCrypt 1.12 and later versions, you can use custom iterations for increased encryption security. Better yet, VeraCrypt can load old TrueCrypt volumes, so if you were a TrueCrypt user, it's easy to transfer them over to VeraCrypt.

### Install VeraCrypt

You can install VeraCrypt on all major platforms by downloading the appropriate installer file from the [VeraCrypt download page][4].

Alternately, you can build it yourself from source code. On Linux, it requires wxGTK3, makeself, and the usual development stack (Binutils, GCC, and so on).

Once you have it installed, launch VeraCrypt from your application menu.

### Create a VeraCrypt volume

If you're new to VeraCrypt, you must create a VeraCrypt volume first (otherwise, you have nothing to decrypt). In the VeraCrypt window, click the **Create Volume** button on the left.

![Creating a volume with VeraCrypt][5]

(Seth Kenlon, [CC BY-SA 4.0][6])

In VeraCrypt's **Volume Creator Wizard** window that appears, choose whether you want to create an encrypted file container or to encrypt an entire drive. The wizard steps you through creating a vault for your data, so follow along as prompted.

For this article, I created a file container. A VeraCrypt container is a lot like any other file: it exists on a hard drive, external drive, in cloud storage, or anywhere else you can think to store data. Like other files, it can be moved, copied, and deleted. Unlike most other files, it can _contain_ more files, which is why I think of it as a "vault," and VeraCrypt developers refer to it as a "container." Its developers call a VeraCrypt file a "container" because it can contain other data objects; it has nothing to do with the container technology made popular by LXC, Kubernetes, and other modern IT mechanisms.

#### Choose a filesystem

During the volume-creation process, you're asked to select a filesystem to decide how the files you place inside your vault are stored. The Microsoft FAT format is archaic, non-journaled, and limits both volume and file sizes, but it's the one format all platforms can read from and write to. If you intend your VeraCrypt vault to cross platforms, FAT is your best bet.

Aside from that, NTFS works for Windows and Linux. The open source EXT series works for Linux.

### Mount a VeraCrypt volume

Once you've created a VeraCrypt volume, you can mount it from within the VeraCrypt window. To mount an encrypted vault, click the **Select File** button on the right. Select your encrypted file, choose one of the numbered slots in the upper half of the VeraCrypt window, and then click the **Mount** button located in the lower-left corner of the VeraCrypt window.

Your mounted volume is available in the list of available volumes in the VeraCrypt window, and you can access that volume through your file manager as if it were an external drive. For instance, on KDE, I open [Dolphin][7], navigate to `/media/veracrypt1`, and then I can copy files into my vault.

As long as you have VeraCrypt on a device, you can always access your vault. It's encrypted until you manually mount it in VeraCrypt, where it remains decrypted until you close the volume again.

### Close a VeraCrypt volume

To keep your data safe, it's important to close a VeraCrypt volume when you don't need it open. That keeps it safe from prying eyes and crimes of opportunity.

![Mounting a VeraCrypt volume][8]

(Seth Kenlon, [CC BY-SA 4.0][6])

Closing up the VeraCrypt container is about as easy as it is to open one: Select the listed volume in the VeraCrypt window, and click **Dismount**. You no longer have access to the files inside your vault, and neither does anyone else.

### VeraCrypt for easy cross-platform encryption

There are many ways to keep your data secure, and VeraCrypt tries to make it easy for you, regardless of what platform you need to use that data on. If you want to experience easy, open source file encryption, try VeraCrypt.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/open-source-encryption

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://en.wikipedia.org/wiki/TrueCrypt
[3]: https://www.veracrypt.fr/en/Home.html
[4]: https://www.veracrypt.fr/en/Downloads.html
[5]: https://opensource.com/sites/default/files/uploads/veracrypt-create.jpg (Creating a volume with VeraCrypt)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://en.wikipedia.org/wiki/Dolphin_%28file_manager%29
[8]: https://opensource.com/sites/default/files/uploads/veracrypt-volume.jpg (Mounting a VeraCrypt volume)
