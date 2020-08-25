[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (OnionShare: An Open-Source Tool to Share Files Securely Over Tor Network)
[#]: via: (https://itsfoss.com/onionshare/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

OnionShare: An Open-Source Tool to Share Files Securely Over Tor Network
======

_**Brief: OnionShare is a free and open-source tool that utilizes the Tor network to share files securely and anonymously.**_

You might have already come across a lot of online services to share files securely but it may not be completely anonymous.

Also, you do have to rely on a centralized service to share your files and if the service decides to shut down like [Firefox Send][1] — you can’t really depend on it to safely share files all the time.

All things considered, OnionShare is an amazing open-source tool that lets you share files using the [Tor Onion service][2]. It should be an amazing alternative to all the cloud file sharing services.

Let’s take a look at what it offers and how it works.

![][3]

### OnionShare: Share files anonymously over Tor

[OnionShare][4] is an interesting open-source tool that’s available for Linux, Windows, and macOS.

It lets you securely share files directly from your computer to the receiver without revealing your identity in the process. You don’t have to sign up for any account — nor does it rely on any centralized storage service.

It is basically peer-to-peer over the Tor network. The receiver only needs to have a [Tor browser][5] to download/upload files to your computer. I’d also recommend you to go through our [Tor guide][6] to explore more about it if you’re curious.

Let’s take a look at the features.

### Features of OnionShare

For an average user who just wants security and anonymity, there’s no tweak required. However, you do have some advanced options if you need.

  * Cross-platform support (Windows, macOS, and Linux)
  * Send files
  * Receive files
  * Command-line options
  * Publish onion sites
  * Ability to use bridges (if your tor connection isn’t working)
  * Ability to use a persistent URL for sharing (advanced users)
  * Stealth mode (more secure)



You can go through the [official user guide][7] on GitHub to learn more about them.

### Installing OnionShare on Linux

You should find OnionShare listed in your software center to get it installed. If it’s not there, you can add the PPA using the commands below on Ubuntu-based distros:

```
sudo add-apt-repository ppa:micahflee/ppa
sudo apt update
sudo apt install -y onionshare
```

If you’re looking to install it on other Linux distributions, you can visit the [official website][4] for installation instructions on Fedora and build instructions as well.

[Download OnionShare][4]

### How does OnionShare Work?

After you get it installed, everything is pretty self-explanatory and easy-to-use. But, if you want a heads up, let me show you how it works.

Once, it loads up and connects to the Tor network

#### Sharing a File

![][8]

You just have to add the file(s) that you want to share from your computer and then click on “**Start sharing**“.

Once you’re done, the status at the bottom-right should say “**Sharing**” and an **OnionShare address** will be generated (copied to clipboard automatically) as shown in the image below:

![][9]

All the receiver needs now is the OnionShare address that should look like this:

```
http://onionshare:[email protected]
```

And, a Tor browser to start downloading the files.

It’s worth noting that once the download completes (file transfer is done), the file sharing stops. You will also be notified of the same when that happens.

So, if you have to share it again or with someone else, you will have to re-share it and send the new OnionShare address to the receiver.

#### Allow Receiving Files

If you want to generate a URL that lets someone upload files directly to your computer (be careful with whom you share it), you can just click on the **Receive Files** tab after you launch OnionShare.

![][10]

You just have to click on the “**Start Receive Mode**” button to get started. Next, you will get an OnionShare address (just like while sharing a file).

The receiver has to access it using the Tor browser and start uploading files. Here’s how it should look like:

![][11]

Even though you will be notified of the file transfer when someone is uploading to your computer, you need to manually stop the receiving mode when you’re done.

#### Downloading/Uploading Files

Considering that you have a Tor browser installed, you just need to hit the OnionShare address in the URL address, confirm log in (press OK) and here’s how it should look like:

![][12]

Similarly, when you get an address to upload files, it should look like this:

![][13]

#### Publish Onion Sites

You can simply add the files to host a static onion website if you want. Of course, just because it’s peer-to-peer connection, it’ll be very slow to load up while it transfers every file from your computer.

![][14]

I tried using a [free template][15] to test it out and it works great (but very slow). So, it may depend on your network connection.

### **Wrapping Up**

In addition to all the features mentioned above, you can also use the command line and opt for some advanced tweaks if needed.

OnionShare is indeed an impressive open-source tool that makes it easy to share files anonymously without needing any special tweaks.

Have you tried OnionShare yet? Is there something similar to this that you know of? Let me know in the comments below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/onionshare/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/firefox-send/
[2]: https://community.torproject.org/onion-services/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-screenshot.jpg?resize=800%2C629&ssl=1
[4]: https://onionshare.org/
[5]: https://itsfoss.com/install-tar-browser-linux/
[6]: https://itsfoss.com/tor-guide/
[7]: https://github.com/micahflee/onionshare/wiki
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-share.png?resize=800%2C604&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-file-shared.jpg?resize=800%2C532&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-receive-files.jpg?resize=800%2C655&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-receive-mode.jpg?resize=800%2C529&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-download.jpg?resize=800%2C499&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-upload.jpg?resize=800%2C542&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-onion-site.jpg?resize=800%2C366&ssl=1
[15]: https://www.styleshout.com/free-templates/kards/
