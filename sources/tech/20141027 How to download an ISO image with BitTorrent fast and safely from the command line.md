How to download an ISO image with BitTorrent fast and safely from the command line
================================================================================
If you are one of those guys who have urge to try out every new (or even beta) release of Linux distribution to satisfy your curiosity and stay up-to-date, you will need to deal with the hassle of downloading big ISO images every now and then. ISO providers typically put up .torrent file of their ISO images to ease up on the bandwidth consumption of their servers. The benefit of peer-to-peer download is obvious for users as well (in terms of speed), especially when a new release of a popular Linux distribution is up for grab, and everyone is downloading and seeding the release at the same time.

Ubuntu 14.10 (Utopic Unicorn) was just released this week. So there should be plenty of seeds to download the release from in the BitTorrent network at the moment. While there are many GUI-based BitTorrent clients out there, I am going to show you **how to download ISO images via a simple command-line interface (CLI) BitTorrent client**, which can be handy if you are on a remote headless server. Later in this tutorial, I will also demonstrate **how to verify the integrity of a downloaded ISO image**.

The CLI BitTorrent client I am going to use today is transmission-cli. As you may know, [Transmission][1] is one of the most popular GUI-based BitTorrent client. transmission-cli is its stripped-down CLI version.

### Install Transmission-cli on Linux ###

To install **transmission-cli**, you don't need to install a full-blown GUI-based Transmission, which is nice.

On Debian, Ubuntu or their derivatives:

    $ sudo apt-get install transmission-cli 

On Fedora:

    $ sudo yum install transmission-cli

On CentOS or RHEL (after enabling [EPEL repository][2]):

    $ sudo yum install transmission-cli 

### Download an ISO Image Fast with transmission-cli ###

**transmission-cli** is really simple to use. If you are too lazy to study its command line options, all you have to do is to download .torrent file, and launch the command with the torrent file. It will automatically look for available peers, and download an ISO file from them.

    $ wget http://releases.ubuntu.com/14.10/ubuntu-14.10-desktop-amd64.iso.torrent
    $ transmission-cli ubuntu-14.10-desktop-amd64.iso.torrent 

![](https://farm4.staticflickr.com/3933/14999528344_9af3ea5d2e_z.jpg)

Once an ISO image is fully downloaded, it will be stored in ~/Downloads directory by default. It took me only 5 minutes to download 1GB Ubuntu ISO image.

![](https://farm6.staticflickr.com/5605/15433651319_745df6633a_z.jpg)

Once it finishes downloading an ISO image, you will see the message "State changed from Incomplete to Complete" in the console. Note that transmission-cli will continue to run afterwards, becoming a seed for other downloaders. Press Ctrl+C to quit.

### Customize Download Options for Repeat Use ###

If you are a repeat user of **transmission-cli**, it may be worth your time to be familiar with some of its command line options.

The "-w /path/to/download-directory" option specifies the directory where a downloaded file will be saved.

The "-f /path/to/finish-script" option sets a script to run when current download is completed. Recall that transmission-cli, by default, continues running even after a file is fully downloaded. If you want to auto-terminate transmission-cli upon successful download, you can use this option. The following simple finish script will do.

    #!/bin/sh
    sleep 10
    killall transmission-cli

If you want to allocate limited upload/download bandwidth to transmission-cli, you can use "-d <download-speed-in-KB/s> and "-u <upload-speed-in-KB/s> options. If you want to allow unlimited bandwidth instead, simply specify "-D" or "-U" option without any value.

Here is a more advanced usage example of transmission-cli. In this example, the CLI client will automatically exit upon successful download. Download rate is unlimited while upload rate is capped at 50KB/s.

    $ transmission-cli -w ~/iso -D -u 50 -f ~/finish.sh ubuntu-14.10-desktop-amd64.iso.torrent 

![](https://farm6.staticflickr.com/5599/15434697690_e9a19f0d97_z.jpg)

### Verify the Integrity of a Downloaded ISO Image ###

When you download an ISO image, especially from many unknown peers in the BitTorrent network, it is always recommended to verify the integrity of the downloaded image.

In case of Ubuntu releases, Canonical provides several checksum files (e.g., MD5SUM, SHA1SUMS and SHA256SUMS) for verification purpose. Let's use SHA256SUMS in this example.

![](https://farm4.staticflickr.com/3943/15434697700_3b3e6077ee_z.jpg)

First, download the following two files.

    $ wget http://releases.ubuntu.com/14.10/SHA256SUMS
    $ wget http://releases.ubuntu.com/14.10/SHA256SUMS.gpg

The first file is a SHA256 checksum file for ISO images, while the second file (*.gpg) is a signature of the checksum file. The purpose of the second file is to verify the validity of the checksum file itself.

Let's verify the validity of SHA256SUMS file by running this command:

    $ gpg --verify SHA256SUMS.gpg SHA256SUMS 

----------

    gpg: Signature made Thu 23 Oct 2014 09:36:00 AM EDT using DSA key ID FBB75451
    gpg: Can't check signature: public key not found

If you are getting the above error, this is because you have not imported the public key used to generate the signature. So now let's import the required public key.

To do that, you need to know the "key ID" of the public key, which is shown in the output of gpg command above. In this example, the key ID is "FBB75451". Run the following command to import the public key from the official Ubuntu keyserver.

    $ gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys FBB75451 

![](https://farm4.staticflickr.com/3953/15620291035_bcdb3cffb9_z.jpg)

Now that the public key has been imported, go ahead and re-run the previous command to verify the signature.

    gpg --verify SHA256SUMS.gpg SHA256SUMS 

![](https://farm6.staticflickr.com/5600/15433651369_d22905e65b_z.jpg)

This time you will not see "public key not found" error. If the SHA256SUMS file is valid, you will see "Good signature from <official source>" message. Note that you will also see a warning message saying that "This key is not certified with a trusted signature". Basically this warning message is telling you that you have not [assigned any explicit trust][3] to the imported public key. To avoid this warning, you could choose to assign your full trust to the imported public key, but you should do that only after the key has been fully vetted in some other means. Otherwise, you can ignore the warning for now.

After verifying the integrity of SHA256SUMS file, the final last step is to compare the SHA256 checksum of the downloade ISO image against the corresponding checksum value in SHA256SUMS file. For that you can use sha256sum command line tool.

For your convenience, the following one-liner compares the SHA256 checksums and reports the result.

     $ sha256sum -c <(grep ubuntu-14.10-desktop-amd64.iso SHA256SUMS) 

----------

    ubuntu-14.10-desktop-amd64.iso: OK

If you see the above output, that means that two checksum values match. So the integrity of the downloaded ISO image has been successfully verified.

--------------------------------------------------------------------------------

via: http://xmodulo.com/download-iso-image-bittorrent-command-line.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://www.transmissionbt.com/
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[3]:http://xmodulo.com/verify-authenticity-integrity-downloaded-file.html