[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (ffsend – Easily And Securely Share Files From Linux Command Line Using Firefox Send Client)
[#]: via: (https://www.2daygeek.com/ffsend-securely-share-files-folders-from-linux-command-line-using-firefox-send-client/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

ffsend – Easily And Securely Share Files From Linux Command Line Using Firefox Send Client
======

Linux users were preferred to go with scp or rsync for files or folders copy.

However, so many new options are coming to Linux because it’s a opensource.

Anyone can develop a secure software for Linux.

We had written multiple articles in our site in the past about this topic.

Even, today we are going to discuss the same kind of topic called ffsend.

Those are **[OnionShare][1]** , **[Magic Wormhole][2]** , **[Transfer.sh][3]** and **[Dcp – Dat Copy][4]**.

### What’s ffsend?

[ffsend][5] is a command line Firefox Send client that allow users to transfer and receive files and folders through command line.

It allow us to easily and securely share files and directories from the command line through a safe, private and encrypted link using a single simple command.

Files are shared using the Send service and the allowed file size is up to 2GB.

Others are able to download these files with this tool, or through their web browser.

All files are always encrypted on the client, and secrets are never shared with the remote host.

Additionally you can add a password for the file upload.

The uploaded files will be removed after the download (default count is 1 up to 10) or after 24 hours. This will make sure that your files does not remain online forever.

This tool is currently in the alpha phase. Use at your own risk. Also, only limited installation options are available right now.

### ffsend Features:

  * Fully featured and friendly command line tool
  * Upload and download files and directories securely
  * Always encrypted on the client
  * Additional password protection, generation and configurable download limits
  * Built-in file and directory archiving and extraction
  * History tracking your files for easy management
  * Ability to use your own Send host
  * Inspect or delete shared files
  * Accurate error reporting
  * Low memory footprint, due to encryption and download/upload streaming
  * Intended to be used in scripts without interaction



### How To Install ffsend in Linux?

There is no package for each distributions except Debian and Arch Linux systems. However, we can easily get this utility by downloading the prebuilt appropriate binaries file based on the operating system and architecture.

Run the below command to download the latest available version for your operating system.

```
$ wget https://github.com/timvisee/ffsend/releases/download/v0.1.2/ffsend-v0.1.2-linux-x64.tar.gz
```

Extract the tar archive using the following command.

```
$ tar -xvf ffsend-v0.1.2-linux-x64.tar.gz
```

Run the following command to identify your path variable.

```
$ echo $PATH
/home/daygeek/.cargo/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
```

As i told previously, just move the executable file to your path directory.

```
$ sudo mv ffsend /usr/local/sbin
```

Run the `ffsend` command alone to get the basic usage information.

```
$ ffsend
ffsend 0.1.2
Usage: ffsend [FLAGS] ...

Easily and securely share files from the command line.
A fully featured Firefox Send client.

Missing subcommand. Here are the most used:
 ffsend upload ...
 ffsend download ...

To show all subcommands, features and other help:
 ffsend help [SUBCOMMAND]
```

For Arch Linux based users can easily install it with help of **[AUR Helper][6]** , as this package is available in AUR repository.

```
$ yay -S ffsend
```

For **`Debian/Ubuntu`** systems, use **[DPKG Command][7]** to install ffsend.

```
$ wget https://github.com/timvisee/ffsend/releases/download/v0.1.2/ffsend_0.1.2_amd64.deb
$ sudo dpkg -i ffsend_0.1.2_amd64.deb
```

### How To Send A File Using ffsend?

It’s not complicated. We can easily send a file using simple syntax.

**Syntax:**

```
$ ffsend upload [/Path/to/the/file/name]
```

In the following example, we are going to upload a file called `passwd-up1.sh`. Once you upload the file then you will be getting the unique URL.

```
$ ffsend upload passwd-up1.sh --copy
Upload complete
Share link: https://send.firefox.com/download/a4062553f4/#yy2_VyPaUMG5HwXZzYRmpQ
```

![][9]

Just download the above unique URL to get the file in any remote system.

**Syntax:**

```
$ ffsend download [Generated URL]
```

Output for the above command.

```
$ ffsend download https://send.firefox.com/download/a4062553f4/#yy2_VyPaUMG5HwXZzYRmpQ
Download complete
```

![][10]

Use the following syntax format for directory upload.

```
$ ffsend upload [/Path/to/the/Directory] --copy
```

In this example, we are going to upload `2g` directory.

```
$ ffsend upload /home/daygeek/2g --copy
You've selected a directory, only a single file may be uploaded.
Archive the directory into a single file? [Y/n]: y
Archiving...
Upload complete
Share link: https://send.firefox.com/download/90aa5cfe67/#hrwu6oXZRG2DNh8vOc3BGg
```

Just download the above generated the unique URL to get a folder in any remote system.

```
$ ffsend download https://send.firefox.com/download/90aa5cfe67/#hrwu6oXZRG2DNh8vOc3BGg
You're downloading an archive, extract it into the selected directory? [Y/n]: y
Extracting...
Download complete
```

As this already send files through a safe, private, and encrypted link. However, if you would like to add a additional security at your level. Yes, you can add a password for a file.

```
$ ffsend upload file-copy-rsync.sh --copy --password
Password:
Upload complete
Share link: https://send.firefox.com/download/0742d24515/#P7gcNiwZJ87vF8cumU71zA
```

It will prompt you to update a password when you are trying to download a file in the remote system.

```
$ ffsend download https://send.firefox.com/download/0742d24515/#P7gcNiwZJ87vF8cumU71zA
This file is protected with a password.
Password:
Download complete
```

Alternatively you can limit a download speed by providing the download speed while uploading a file.

```
$ ffsend upload file-copy-scp.sh --copy --downloads 10
Upload complete
Share link: https://send.firefox.com/download/23cb923c4e/#LVg6K0CIb7Y9KfJRNZDQGw
```

Just download the above unique URL to get a file in any remote system.

```
ffsend download https://send.firefox.com/download/23cb923c4e/#LVg6K0CIb7Y9KfJRNZDQGw
Download complete
```

If you want to see more details about the file, use the following format. It will shows you the file name, file size, Download counts and when it will going to expire.

**Syntax:**

```
$ ffsend info [Generated URL]

$ ffsend info https://send.firefox.com/download/23cb923c4e/#LVg6K0CIb7Y9KfJRNZDQGw
ID: 23cb923c4e
Name: file-copy-scp.sh
Size: 115 B
MIME: application/x-sh
Downloads: 3 of 10
Expiry: 23h58m (86280s)
```

You can view your transaction history using the following format.

```
$ ffsend history
# LINK EXPIRY
1 https://send.firefox.com/download/23cb923c4e/#LVg6K0CIb7Y9KfJRNZDQGw 23h57m
2 https://send.firefox.com/download/0742d24515/#P7gcNiwZJ87vF8cumU71zA 23h55m
3 https://send.firefox.com/download/90aa5cfe67/#hrwu6oXZRG2DNh8vOc3BGg 23h52m
4 https://send.firefox.com/download/a4062553f4/#yy2_VyPaUMG5HwXZzYRmpQ 23h46m
5 https://send.firefox.com/download/74ff30e43e/#NYfDOUp_Ai-RKg5g0fCZXw 23h44m
6 https://send.firefox.com/download/69afaab1f9/#5z51_94jtxcUCJNNvf6RcA 23h43m
```

If you don’t want the link anymore then we can delete it.

**Syntax:**

```
$ ffsend delete [Generated URL]

$ ffsend delete https://send.firefox.com/download/69afaab1f9/#5z51_94jtxcUCJNNvf6RcA
File deleted
```

Alternatively this can be done using firefox browser by opening the page <https://send.firefox.com/>.

Just drag and drop a file to upload it.
![][11]

Once the file is downloaded, it will show you that 100% download completed.
![][12]

To check other possible options, navigate to man page or help page.

```
$ ffsend --help
ffsend 0.1.2
Tim Visee
Easily and securely share files from the command line.
A fully featured Firefox Send client.

USAGE:
 ffsend [FLAGS] [OPTIONS] [SUBCOMMAND]

FLAGS:
 -f, --force Force the action, ignore warnings
 -h, --help Prints help information
 -i, --incognito Don't update local history for actions
 -I, --no-interact Not interactive, do not prompt
 -q, --quiet Produce output suitable for logging and automation
 -V, --version Prints version information
 -v, --verbose Enable verbose information and logging
 -y, --yes Assume yes for prompts

OPTIONS:
 -H, --history Use the specified history file [env: FFSEND_HISTORY]
 -t, --timeout Request timeout (0 to disable) [env: FFSEND_TIMEOUT]
 -T, --transfer-timeout Transfer timeout (0 to disable) [env: FFSEND_TRANSFER_TIMEOUT]

SUBCOMMANDS:
 upload Upload files [aliases: u, up]
 download Download files [aliases: d, down]
 debug View debug information [aliases: dbg]
 delete Delete a shared file [aliases: del]
 exists Check whether a remote file exists [aliases: e]
 help Prints this message or the help of the given subcommand(s)
 history View file history [aliases: h]
 info Fetch info about a shared file [aliases: i]
 parameters Change parameters of a shared file [aliases: params]
 password Change the password of a shared file [aliases: pass, p]

The public Send service that is used as default host is provided by Mozilla.
This application is not affiliated with Mozilla, Firefox or Firefox Send.
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/ffsend-securely-share-files-folders-from-linux-command-line-using-firefox-send-client/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/onionshare-secure-way-to-share-files-sharing-tool-linux/
[2]: https://www.2daygeek.com/wormhole-securely-share-files-from-linux-command-line/
[3]: https://www.2daygeek.com/transfer-sh-easy-fast-way-share-files-over-internet-from-command-line/
[4]: https://www.2daygeek.com/dcp-dat-copy-secure-way-to-transfer-files-between-linux-systems/
[5]: https://github.com/timvisee/ffsend
[6]: https://www.2daygeek.com/category/aur-helper/
[7]: https://www.2daygeek.com/dpkg-command-to-manage-packages-on-debian-ubuntu-linux-mint-systems/
[8]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[9]: https://www.2daygeek.com/wp-content/uploads/2019/01/ffsend-easily-and-securely-share-files-from-linux-command-line-using-firefox-send-client-1.png
[10]: https://www.2daygeek.com/wp-content/uploads/2019/01/ffsend-easily-and-securely-share-files-from-linux-command-line-using-firefox-send-client-2.png
[11]: https://www.2daygeek.com/wp-content/uploads/2019/01/ffsend-easily-and-securely-share-files-from-linux-command-line-using-firefox-send-client-3.png
[12]: https://www.2daygeek.com/wp-content/uploads/2019/01/ffsend-easily-and-securely-share-files-from-linux-command-line-using-firefox-send-client-4.png
