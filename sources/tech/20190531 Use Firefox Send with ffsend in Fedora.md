[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Firefox Send with ffsend in Fedora)
[#]: via: (https://fedoramagazine.org/use-firefox-send-with-ffsend-in-fedora/)
[#]: author: (Sylvia Sánchez https://fedoramagazine.org/author/lailah/)

Use Firefox Send with ffsend in Fedora
======

![][1]

_ffsend_ is the command line client of Firefox Send. This article will show how Firefox Send and _ffsend_ work. It’ll also detail how it can be installed and used in Fedora.

### What are Firefox Send and ffsend ?

Firefox Send is a file sharing tool from Mozilla that allows sending encrypted files to other users. You can install Send on your own server, or use the Mozilla-hosted link [send.firefox.com][2]. The hosted version officially supports files up to 1 GB, and links that expire after a configurable download count (default of 1) or 24 hours, and then all the files on the Send server are deleted. This tool is still _in experimental phase_ , and therefore shouldn’t be used in production or to share important or sensitive data.

While Firefox Send is the tool itself and can be used with a web interface, _ffsend_ is a command-line utility you can use with scripts and arguments. It has a wide range of configuration options and can be left working in the background without any human intervention.

### How does it work?

FFSend can both upload and download files. The remote host can use either the Firefox tool or another web browser to download the file. Neither Firefox Send nor _ffsend_ require the use of Firefox.

It’s important to highlight that _ffsend_ uses client-side encryption. This means that files are encrypted _before_ they’re uploaded. You share secrets together with the link, so be careful when sharing, because anyone with the link will be able to download the file. As an extra layer of protection, you can protect the file with a password by using the following argument:

```
ffsend password URL -p PASSWORD
```

### Other features

There are a few other features worth mentioning. Here’s a list:

  * Configurable download limit, between 1 and 20 times, before the link expires
  * Built-in extract and archiving functions
  * Track history of shared files
  * Inspect or delete shared files
  * Folders can be shared as well, either as they are or as compressed files
  * Generate a QR code, for easier download on a mobile phone



### How to install in Fedora

While Fedora Send works with Firefox without installing anything extra, you’ll need to install the CLI tool to use _ffsend_. This tool is in the official repositories, so you only need a simple _dnf_ command [with][3] _[sudo][3]_.

```
$ sudo dnf install ffsend
```

After that, you can use _ffsend_ from the terminal .

### Upload a file

Uploading a file is a simple as

```
$ ffsend upload /etc/os-release
Upload complete
Share link:  https://send.firefox.com/download/05826227d70b9a4b/#RM_HSBq6kuyeBem8Z013mg
```

The file now can be easily share using the Share link URL.

## Downloading a file

Downloading a file is as simple as uploading.

```
$ ffsend download https://send.firefox.com/download/05826227d70b9a4b/#RM_HSBq6kuyeBem8Z013mg
Download complete
```

Before downloading a file it might be useful to check if the file exist and get information about it. _ffsend_ provides 2 handy commands for that.

```
$ ffsend exists https://send.firefox.com/download/88a6324e2a99ebb6/#YRJDh8ZDQsnZL2KZIA-PaQ
Exists: true
Password: false
$ ffsend info https://send.firefox.com/download/88a6324e2a99ebb6/#YRJDh8ZDQsnZL2KZIA-PaQ
ID:         88a6324e2a99ebb6
Downloads:  0 of 1
Expiry:     23h59m (86388s
```

## Upload history

_ffsend_ also provides a way to check the history of the uploads made with the tools. This can be really useful if you upload a lot of files during a scripted tasks for example and you want to keep track of each files download status.

```
$ ffsend history
LINK                                            EXPIRY
 1  https://send.firefox.com/download/#8TJ9QNw  23h59m
 2  https://send.firefox.com/download/KZIA-PaQ  23h54m
```

## Delete a file

Another useful feature is the possibility to delete a file.

```
ffsend delete https://send.firefox.com/download/2d9faa7f34bb1478/#phITKvaYBjCGSRI8TJ9QNw
```

Firefox Send is a great service and the _ffsend_ tools makes it really convenient to use from the terminal. More examples and documentation is available on _ffsend_ ‘s [Gitlab repository][4].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-firefox-send-with-ffsend-in-fedora/

作者：[Sylvia Sánchez][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lailah/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/firefox-send-816x345.png
[2]: http://send.firefox.com/
[3]: https://fedoramagazine.org/howto-use-sudo/
[4]: https://gitlab.com/timvisee/ffsend
