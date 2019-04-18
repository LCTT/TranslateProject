[#]: collector: (lujun9972)
[#]: translator: (zgj1024)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (HTTPie – A Modern Command Line HTTP Client For Curl And Wget Alternative)
[#]: via: (https://www.2daygeek.com/httpie-curl-wget-alternative-http-client-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

HTTPie – A Modern Command Line HTTP Client For Curl And Wget Alternative
======

Most of the time we use Curl Command or Wget Command for file download and other purpose.

We had written **[best command line download manager][1]** in the past. You can navigate those articles by clicking the corresponding URLs.

  * **[aria2 – A Command Line Multi-Protocol Download Tool For Linux][2]**
  * **[Axel – A Lightweight Command Line Download Accelerator For Linux][3]**
  * **[Wget – A Standard Command Line Download Utility For Linux][4]**
  * **[curl – A Nifty Command Line Download Tool For Linux][5]**



Today we are going to discuss about the same kind of topic. The utility name is HTTPie.

It’s modern command line http client and best alternative for curl and wget commands.

### What Is HTTPie?

HTTPie (pronounced aitch-tee-tee-pie) is a command line HTTP client.

The httpie tool is a modern command line http client which makes CLI interaction with web services.

It provides a simple http command that allows for sending arbitrary HTTP requests using a simple and natural syntax, and displays colorized output.

HTTPie can be used for testing, debugging, and generally interacting with HTTP servers.

### Main Features

  * Expressive and intuitive syntax
  * Formatted and colorized terminal output
  * Built-in JSON support
  * Forms and file uploads
  * HTTPS, proxies, and authentication
  * Arbitrary request data
  * Custom headers
  * Persistent sessions
  * Wget-like downloads
  * Python 2.7 and 3.x support



### How To Install HTTPie In Linux?

Most Linux distributions provide a package that can be installed using the system package manager.

For **`Fedora`** system, use **[DNF Command][6]** to install httpie.

```
$ sudo dnf install httpie
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][7]** or **[APT Command][8]** to install httpie.

```
$ sudo apt install httpie
```

For **`Arch Linux`** based systems, use **[Pacman Command][9]** to install httpie.

```
$ sudo pacman -S httpie
```

For **`RHEL/CentOS`** systems, use **[YUM Command][10]** to install httpie.

```
$ sudo yum install httpie
```

For **`openSUSE Leap`** system, use **[Zypper Command][11]** to install httpie.

```
$ sudo zypper install httpie
```

### 1) How To Request A URL Using HTTPie?

The basic usage of httpie is to request a website URL as an argument.

```
# http 2daygeek.com
HTTP/1.1 301 Moved Permanently
CF-RAY: 4c4a618d0c02ce6d-LHR
Cache-Control: max-age=3600
Connection: keep-alive
Date: Tue, 09 Apr 2019 06:21:28 GMT
Expires: Tue, 09 Apr 2019 07:21:28 GMT
Location: https://2daygeek.com/
Server: cloudflare
Transfer-Encoding: chunked
Vary: Accept-Encoding
```

### 2) How To Download A File Using HTTPie?

You can download a file using HTTPie with the `--download` parameter. This is similar to wget command.

```
# http --download https://www.2daygeek.com/wp-content/uploads/2019/04/Anbox-Easy-Way-To-Run-Android-Apps-On-Linux.png
HTTP/1.1 200 OK
Accept-Ranges: bytes
CF-Cache-Status: HIT
CF-RAY: 4c4a65d5ca360a66-LHR
Cache-Control: public, max-age=7200
Connection: keep-alive
Content-Length: 32066
Content-Type: image/png
Date: Tue, 09 Apr 2019 06:24:23 GMT
Expect-CT: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
Expires: Tue, 09 Apr 2019 08:24:23 GMT
Last-Modified: Mon, 08 Apr 2019 04:54:25 GMT
Server: cloudflare
Set-Cookie: __cfduid=dd2034b2f95ae42047e082f59f2b964f71554791063; expires=Wed, 08-Apr-20 06:24:23 GMT; path=/; domain=.2daygeek.com; HttpOnly; Secure
Vary: Accept-Encoding

Downloading 31.31 kB to "Anbox-Easy-Way-To-Run-Android-Apps-On-Linux.png"
Done. 31.31 kB in 0.01187s (2.58 MB/s)
```

Alternatively you can save the output file with different name by using `-o` parameter.

```
# http --download https://www.2daygeek.com/wp-content/uploads/2019/04/Anbox-Easy-Way-To-Run-Android-Apps-On-Linux.png -o Anbox-1.png
HTTP/1.1 200 OK
Accept-Ranges: bytes
CF-Cache-Status: HIT
CF-RAY: 4c4a68194daa0a66-LHR
Cache-Control: public, max-age=7200
Connection: keep-alive
Content-Length: 32066
Content-Type: image/png
Date: Tue, 09 Apr 2019 06:25:56 GMT
Expect-CT: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
Expires: Tue, 09 Apr 2019 08:25:56 GMT
Last-Modified: Mon, 08 Apr 2019 04:54:25 GMT
Server: cloudflare
Set-Cookie: __cfduid=d3eea753081690f9a2d36495a74407dd71554791156; expires=Wed, 08-Apr-20 06:25:56 GMT; path=/; domain=.2daygeek.com; HttpOnly; Secure
Vary: Accept-Encoding

Downloading 31.31 kB to "Anbox-1.png"
Done. 31.31 kB in 0.01551s (1.97 MB/s)
```

### 3) How To Resume Partial Download Using HTTPie?

You can resume the download using HTTPie with the `-c` parameter.

```
# http --download --continue https://speed.hetzner.de/100MB.bin -o 100MB.bin
HTTP/1.1 206 Partial Content
Connection: keep-alive
Content-Length: 100442112
Content-Range: bytes 4415488-104857599/104857600
Content-Type: application/octet-stream
Date: Tue, 09 Apr 2019 06:32:52 GMT
ETag: "5253f0fd-6400000"
Last-Modified: Tue, 08 Oct 2013 11:48:13 GMT
Server: nginx
Strict-Transport-Security: max-age=15768000; includeSubDomains

Downloading 100.00 MB to "100MB.bin"
 |  24.14 %   24.14 MB    1.12 MB/s  0:01:07 ETA^C
```

You can verify the same in the below output.

```
[email protected]:/var/log# ls -lhtr 100MB.bin
-rw-r--r-- 1 root root 25M Apr  9 01:33 100MB.bin
```

### 5) How To Upload A File Using HTTPie?

You can upload a file using HTTPie with the `less-than symbol "<"` symbol.

```
$ http https://transfer.sh < Anbox-1.png
```

### 6) How To Download A File Using HTTPie With Redirect Symbol ">"?

You can download a file using HTTPie with the `redirect ">"` symbol.

```
# http https://www.2daygeek.com/wp-content/uploads/2019/03/How-To-Install-And-Enable-Flatpak-Support-On-Linux-1.png > Flatpak.png

# ls -ltrh Flatpak.png
-rw-r--r-- 1 root root 47K Apr  9 01:44 Flatpak.png
```

### 7) Send a HTTP GET Method?

You can send a HTTP GET method in the request. The GET method is used to retrieve information from the given server using a given URI.

```
# http GET httpie.org
HTTP/1.1 301 Moved Permanently
CF-RAY: 4c4a83a3f90dcbe6-SIN
Cache-Control: max-age=3600
Connection: keep-alive
Date: Tue, 09 Apr 2019 06:44:44 GMT
Expires: Tue, 09 Apr 2019 07:44:44 GMT
Location: https://httpie.org/
Server: cloudflare
Transfer-Encoding: chunked
Vary: Accept-Encoding
```

### 8) Submit A Form?

Use the following format to Submit a forms. A POST request is used to send data to the server, for example, customer information, file upload, etc. using HTML forms.

```
# http -f POST Ubuntu18.2daygeek.com hello='World'
HTTP/1.1 200 OK
Accept-Ranges: bytes
Connection: Keep-Alive
Content-Encoding: gzip
Content-Length: 3138
Content-Type: text/html
Date: Tue, 09 Apr 2019 06:48:12 GMT
ETag: "2aa6-5844bf1b047fc-gzip"
Keep-Alive: timeout=5, max=100
Last-Modified: Sun, 17 Mar 2019 15:29:55 GMT
Server: Apache/2.4.29 (Ubuntu)
Vary: Accept-Encoding
```

Run the following command to see the request that is being sent.

```
# http -v Ubuntu18.2daygeek.com
GET / HTTP/1.1
Accept: */*
Accept-Encoding: gzip, deflate
Connection: keep-alive
Host: ubuntu18.2daygeek.com
User-Agent: HTTPie/0.9.8

hello=World

HTTP/1.1 200 OK
Accept-Ranges: bytes
Connection: Keep-Alive
Content-Encoding: gzip
Content-Length: 3138
Content-Type: text/html
Date: Tue, 09 Apr 2019 06:48:30 GMT
ETag: "2aa6-5844bf1b047fc-gzip"
Keep-Alive: timeout=5, max=100
Last-Modified: Sun, 17 Mar 2019 15:29:55 GMT
Server: Apache/2.4.29 (Ubuntu)
Vary: Accept-Encoding
```

### 9) HTTP Authentication?

The currently supported authentication schemes are Basic and Digest

Basic auth

```
$ http -a username:password example.org
```

Digest auth

```
$ http -A digest -a username:password example.org
```

Password prompt

```
$ http -a username example.org
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/httpie-curl-wget-alternative-http-client-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/best-4-command-line-download-managers-accelerators-for-linux/
[2]: https://www.2daygeek.com/aria2-linux-command-line-download-utility-tool/
[3]: https://www.2daygeek.com/axel-linux-command-line-download-accelerator/
[4]: https://www.2daygeek.com/wget-linux-command-line-download-utility-tool/
[5]: https://www.2daygeek.com/curl-linux-command-line-download-manager/
[6]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[7]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[8]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[9]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[10]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[11]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
