[#]: subject: "Transfer files between your phone and Linux with this open source tool"
[#]: via: "https://opensource.com/article/21/11/transfer-files-phone-linux"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Transfer files between your phone and Linux with this open source tool
======
The qrcp project offers a way to quickly copy files from your iPhone or
Android device to your Linux computer and vice versa.
![A person looking at a phone][1]

Are you looking for a way to quickly copy files from your iPhone or Android mobile device to your Linux computer or from your Linux computer to your devices? I recently discovered an open source application that's easy to install and makes transferring files as simple as a QR code.

The `qrcp` project provides a command that generates a QR code in your terminal that allows you to send or receive files to your computer over the network.

### Install qrcp on Linux, Windows, or Mac

The developer, Claudio d'Angelis, has released the `qrcp` application with an MIT license. I found it easy to install and easy to use. It's available for Linux, Windows, and macOS, and can be downloaded as an RPM, DEB, or tarball. There are builds for nearly every platform, including the Raspberry Pi.

If you want to install it on Linux, download either the RPM or DEB and use your package manager to perform a local install. For example, on Fedora, CentOS, or Mageia, or similar:


```
`$ sudo dnf install ./qrcp*rpm`
```

If you just want to try it, you can download the tar.gz archive and run it locally:


```


$ tar --extract --file qrcp*tar.gz
$ ./qrcp version
qrcp 0.x.y

```

### Set up qrcp

You can view all of the available `qrcp` options by using the `--help` option:


```


$ qrcp --help
$ ./qrcp --help
Usage:
 qrcp [flags]
 qrcp [command]

Available Commands:
 completion  Generate completion script
 config      Configure qrcp
 help        Help about any command
 receive     Receive one or more files
 send        Send a file(s) or directories from this host
 version     Print version number and build information.
[...]

```

You can configure the application by editing the default configuration file located at `~/.config/qrcp/config.json` using your favorite editor or invoking the configuration wizard from the command line:


```
`$ qrcp config`
```

The first step is to create a configuration file. The `qrcp config` command takes you through this process, but there are a few tricky questions.

The first question asks you for a fully-qualified domain name. If you're using `qrcp` on a local network that doesn't use fully-qualified domain names (or if you don't know one way or the other), then leave this blank. The `qrcp` command will use your local IP address instead.

The next question prompts you for a port. Most firewalls block non-standard ports, but it's not uncommon to recognize port 8080 as Internet traffic. If your firewall blocks port 8080, then you'll still have to add an exception. Assuming your system uses `firewalld`, you can allow traffic on port 8080 with this command:


```
`$ sudo firewall-cmd --add-port 8080/tcp --permanent`
```

Decline the option to keep the network connection alive after the transfer is complete and let `qrcp` generate a random path.

Assuming you're on a trusted network, use an HTTP (not HTTPS) connection, so you don't have to configure TLS.

The configuration is stored in `~/.config/qrcp/config.json` and is editable after the fact, so if you change your mind about any setting, it's easy to update.

The updated configuration looks like this:


```


{
  "fqdn": "",
  "interface": "wlp0s20f3",
  "port": 8080,
  "keepAlive": false,
  "path": "",
  "secure": false,
  "tls-key": "",
  "tls-cert": "",
  "output": "/home/don"

```

### Transfer files with qrcp

Now you're ready to send a file from your Linux computer to your mobile device. In this example, I used my iPhone, which infamously offers no support Linux at all. The process is exactly the same on an Android device.

Here's how I do it. First, I create an example file on my computer:


```
`$ echo "Hello world"> ~/example.txt`
```

Next, I use the `send` subcommand to send the file from my Linux computer to my mobile:


```
`Linux~$ qrcp send example.txt`
```

![example of sending a file][2]

Example of sending a file using qrcp send example.txt (CC BY-SA 4.0)

I open my camera application (on Android, I use a privacy-friendly dedicated QR scanner) and the iPhone scans the QR code and launches Safari on my phone. Finally, I click on the **Download** button.

![example download][3]

Download the example.txt file (CC BY-SA 4.0)

### Receiving files with qrcp

Receiving files is just as easy, except the command is slightly different:


```
`$ qrcp receive`
```

![example of receiving a file][4]

Receive a file using the grcp receive command (CC BY-SA 4.0)

I scan the QR code, and it once again launches the Safari browser on my phone, but this time it appears a bit different because I'm sending files from my iPhone to the Linux computer.

![example of selecting a file][5]

Select a file to transfer (CC BY-SA 4.0)

I click on **Choose Files**, which allows me to choose the file I want to send.

![file appears in default location][6]

The file is downloaded to the default location (CC BY-SA 4.0)

After sending the file, it's found in the default location specified in my configuration.

### Try qrcp

The project documentation is brief but adequate, and it's supported by a community of developers in addition to Claudio d'Angelis, who originally came up with the idea. The community welcomes you to join them, and the application will change the way you look at file transfers to and from your mobile devices. Try it out!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/transfer-files-phone-linux

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd (A person looking at a phone)
[2]: https://opensource.com/sites/default/files/send-example.png
[3]: https://opensource.com/sites/default/files/download-example.png
[4]: https://opensource.com/sites/default/files/receive-file.png
[5]: https://opensource.com/sites/default/files/select-file.jpg
[6]: https://opensource.com/sites/default/files/default-location.png
