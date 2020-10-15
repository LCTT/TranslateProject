[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (2 Ways to Download Files From Linux Terminal)
[#]: via: (https://itsfoss.com/download-files-from-linux-terminal/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

2 Ways to Download Files From Linux Terminal
======

If you are stuck to the Linux terminal, say on a server, how do you download a file from the terminal?

There is no download command in Linux but there are a couple of Linux commands for downloading file.

In this terminal trick, you’ll learn two ways to download file using command line in Linux.

I am using Ubuntu here but apart from the installation, rest of the commands are equally valid for all other Linux distributions.

### Download files from Linux terminal using wget command

![][1]

[wget][2] is perhaps the most used command line download manager for Linux and UNIX-like systems. You can download a single file, multiple files, entire directory or even an entire website using wget.

wget is non-interactive and can easily work in the background. This means you can easily use it in scripts or even build tools like [uGet download manager][3].

Let’s see how to use wget to download file from terminal.

#### Installing wget

Most Linux distributions come with wget preinstalled. It is also available in the repository of most distributions and you can easily install it using your distribution’s package manager.

On Ubuntu and Debian based distribution, you can use the [apt package manager][4] command:

```
sudo apt install wget
```

#### Download a file or webpage using wget

You just need to provide the URL of the file or webpage. It will download the file with its original name in the directory you are in.

```
wget URL
```

![][5]

To download multiple files, you’ll have to save their URLs in a text file and provide that text file as input to wget like this:

```
wget -i download_files.txt
```

#### Download files with a different name using wget

You’ll notice that a webpage is almost always saved as index.html with wget. It will be a good idea to provide custom name to downloaded file.

You can use the -O (uppercase O) option to provide the output filename while downloading.

```
wget -O filename URL
```

![][6]

#### Download a folder using wget

Suppose you are browsing an FTP server and you need to download an entire directory, you can use the recursive option

```
wget -r ftp://server-address.com/directory
```

#### Download an entire website using wget

Yes, you can totally do that. You can mirror an entire website with wget. By downloading an entire website I mean the entire public facing website structure.

While you can use the mirror option -m directly, it will be a good idea add:

  * –convert-links : links are converted so that internal links are pointed to downloaded resource instead of web
  * –page-requisites: downloads additional things like style sheets so that the pages look better offline



```
wget -m --convert-links --page-requisites website_address
```

![][7]

#### Bonus Tip: Resume incomplete downloads

If you aborted the download by pressing C for some reasons, you can resume the previous download with option -c.

```
wget -c
```

### Download files from Linux command line using curl

Like wget, [curl][8] is also one of the most popular commands to download files in Linux terminal. There are so many ways to [use curl extensively][9] but I’ll focus on only the simple downloading here.

#### Installing curl

Though curl doesn’t come preinstalled, it is available in the official repositories of most distributions. You can use your distribution’s package manager to install it.

To [install curl on Ubuntu][10] and other Debian based distributions, use the following command:

```
sudo apt install curl
```

#### Download files or webpage using curl

If you use curl without any option with a URL, it will read the file and print it on the terminal screen.

To download a file using curl command in Linux terminal, you’ll have to use the -O (uppercase O) option:

```
curl -O URL
```

![][11]

It is simpler to download multiple files in Linux with curl. You just have to specify multiple URLs:

```
curl -O URL1 URL2 URL3
```

Keep in mind that curl is not as simple as wget. While wget saves webpages as index.html, curl will complain of remote file not having a name for webpages. You’ll have to save it with a custom name as described in the next section.

#### Download files with a different name

It could be confusing but to provide a custom name for the downloaded file (instead of the original source name), you’ll have to use -o (lowercase O) option:

```
curl -o filename URL
```

![][12]

Some times, curl wouldn’t just download the file as you expect it to. You’ll have to use option -L (for location) to download it correctly. This is because some times the links redirect to some other link and with option -L, it follows the final link.

#### Pause and resume download with curl

Like wget, you can also resume a paused download using curl with option -c:

```
curl -c URL
```

**Conclusion**

As always, there are multiple ways to do the same thing in Linux. Downloading files from the terminal is no different.

wget and curl are just two of the most popular commands for downloading files in Linux. There are more such command line tools. Terminal based web-browsers like [elinks][13], [w3m][14] etc can also be used for downloading files in command line.

Personally, for a simple download, I prefer using wget over curl. It is simpler and less confusing because you may have a difficult time figuring out why curl could not download a file in the expected format.

Your feedback and suggestions are welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/download-files-from-linux-terminal/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/Download-Files-from-Linux-terminal.png?resize=800%2C450&ssl=1
[2]: https://www.gnu.org/software/wget/
[3]: https://itsfoss.com/install-latest-uget-ubuntu-linux-mint/
[4]: https://itsfoss.com/apt-command-guide/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/download-file-in-linux-terminal-using-wget.png?resize=795%2C418&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/download-file-in-linux-terminal-using-wget-2.png?resize=795%2C418&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/download-entire-website-using-wget.png?resize=795%2C418&ssl=1
[8]: https://curl.haxx.se/
[9]: https://linuxhandbook.com/curl-command-examples/
[10]: https://itsfoss.com/install-curl-ubuntu/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/download-files-in-linux-using-curl.png?resize=795%2C418&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/download-files-in-linux-using-curl-1.png?resize=795%2C418&ssl=1
[13]: http://elinks.or.cz/
[14]: http://w3m.sourceforge.net/
