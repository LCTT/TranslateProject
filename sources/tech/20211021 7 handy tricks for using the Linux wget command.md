[#]: subject: "7 handy tricks for using the Linux wget command"
[#]: via: "https://opensource.com/article/21/10/linux-wget-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "zengyi1001"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

7 handy tricks for using the Linux wget command
======
Download files from the internet in your Linux terminal. Get the most
out of the wget command with our new cheat sheet.
![Computer screen with files or windows open][1]

Wget is a free utility to download files from the web. It gets data from the Internet and saves it to a file or displays it in your terminal. This is literally also what web browsers do, such as Firefox or Chromium, except by default, they _render_ the information in a graphical window and usually require a user to be actively controlling them. The `wget` utility is designed to be non-interactive, meaning you can script or schedule `wget` to download files whether you're at your computer or not.

### Download a file with wget

You can download a file with `wget` by providing a link to a specific URL. If you provide a URL that defaults to `index.html`, then the index page gets downloaded. By default, the file is downloaded into a file of the same name in your current working directory.


```
$ wget <http://example.com>
\--2021-09-20 17:23:47-- <http://example.com/>
Resolving example.com... 93.184.216.34, 2606:2800:220:1:248:1893:25c8:1946
Connecting to example.com|93.184.216.34|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1256 (1.2K) [text/html]
Saving to: 'index.html'
```

You can make `wget` send the data to standard out (`stdout`) instead by using the `--output-document` with a dash `-` character:


```
$ wget <http://example.com> \--output-document - | head -n4
&lt;!doctype html&gt;
&lt;html&gt;
&lt;head&gt;
   &lt;title&gt;Example Domain&lt;/title&gt;
```

You can use the `--output-document` option (`-O` for short) to name your download whatever you want:


```
`$ wget http://example.com --output-document foo.html`
```

### Continue a partial download

If you're downloading a very large file, you might find that you have to interrupt the download. With the `--continue` (`-c` for short), `wget` can determine where the download left off and continue the file transfer. That means the next time you download a 4 GB Linux distribution ISO you don't ever have to go back to the start when something goes wrong.


```
`$ wget --continue https://example.com/linux-distro.iso`
```

### Download a sequence of files

If it's not one big file but several files that you need to download, `wget` can help you with that. Assuming you know the location and filename pattern of the files you want to download, you can use Bash syntax to specify the start and end points between a range of integers to represent a sequence of filenames:


```
`$ wget http://example.com/file_{1..4}.webp`
```

### Mirror a whole site

You can download an entire site, including its directory structure, using the `--mirror` option. This option is the same as running `--recursive --level inf --timestamping --no-remove-listing`, which means it's infinitely recursive, so you're getting everything on the domain you specify. Depending on how old the website is, that could mean you're getting a lot more content than you realize.

If you're using `wget` to archive a site, then the options `--no-cookies --page-requisites --convert-links` are also useful to ensure that every page is fresh, complete, and that the site copy is more or less self-contained.

### Modify HTML headers

Protocols used for data exchange have a lot of metadata embedded in the packets computers send to communicate. HTTP headers are components of the initial portion of data. When you browse a website, your browser sends HTTP request headers. Use the `--debug` option to see what header information `wget` sends with each request:


```
$ wget --debug example.com
\---request begin---
GET / HTTP/1.1
User-Agent: Wget/1.19.5 (linux-gnu)
Accept: */*
Accept-Encoding: identity
Host: example.com
Connection: Keep-Alive

\---request end---
```

You can modify your request header with the `--header` option. For instance, it's sometimes useful to mimic a specific browser, either for testing or to account for poorly coded sites that only work correctly for specific user agents.

To identify as Microsoft Edge running on Windows:


```
`$ wget --debug --header="User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/91.0.864.59" http://example.com`
```

You can also masquerade as a specific mobile device:


```
$ wget --debug \
\--header="User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 13_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Mobile/15E148 Safari/604.1" \
<http://example.com>
```

### Viewing response headers

In the same way header information is sent with browser requests, header information is also included in responses. You can see response headers with the `--debug` option:


```
$ wget --debug example.com
[...]
\---response begin---
HTTP/1.1 200 OK
Accept-Ranges: bytes
Age: 188102
Cache-Control: max-age=604800
Content-Type: text/html; charset=UTF-8
Etag: "3147526947"
Server: ECS (sab/574F)
Vary: Accept-Encoding
X-Cache: HIT
Content-Length: 1256

\---response end---
200 OK
Registered socket 3 for persistent reuse.
URI content encoding = 'UTF-8'
Length: 1256 (1.2K) [text/html]
Saving to: 'index.html'
```

### Responding to a 301 response

A 200 response code means that everything has worked as expected. A 301 response, on the other hand, means that an URL has been moved permanently to a different location. It's a common way for a website admin to relocate content while leaving a "trail" so people visiting the old location can still find it. By default, `wget` follows redirects, and that's probably what you normally want it to do.

However, you can control what `wget` does when it encounters a 301 response with the `--max-redirect` option. You can set it to `0` to follow no redirects:


```
$ wget --max-redirect 0 <http://iana.org>
\--2021-09-21 11:01:35-- <http://iana.org/>
Resolving iana.org... 192.0.43.8, 2001:500:88:200::8
Connecting to iana.org|192.0.43.8|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: <https://www.iana.org/> [following]
0 redirections exceeded.
```

Alternately, you can set it to some other number to control how many redirects `wget` follows.

#### Expand a shortened URL

The `--max-redirect` option is useful for looking at shortened URLs before actually visiting them. Shortened URLs can be useful for print media, in which users can't just copy and paste a long URL, or on social networks with character limits (this isn't as much of an issue on a modern and [open source social network like Mastodon][2]). However, they can also be a little dangerous because their destination is, by nature, concealed. By combining the `--head` option to view just the HTTP headers, and the `--location` option to unravel the final destination of an URL, you can peek into a shortened URL without loading the full resource:


```
$ wget --max-redirect 0 "<https://bit.ly/2yDyS4T>"
\--2021-09-21 11:32:04-- <https://bit.ly/2yDyS4T>
Resolving bit.ly... 67.199.248.10, 67.199.248.11
Connecting to bit.ly|67.199.248.10|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: <http://example.com/> [following]
0 redirections exceeded.
```

The penultimate line of output, starting with **Location**, reveals the intended destination.

### Use wget

Once you practice thinking about the process of exploring the web as a single command, `wget` becomes a fast and efficient way to pull information you need from the Internet without bothering with a graphical interface. To help you build it into your usual workflow, we've created a cheat sheet with common `wget` uses and syntax, including an overview of using it to query an API. [**Download the Linux `wget` cheat sheet here.**][3]

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-wget-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/17/4/guide-to-mastodon
[3]: https://opensource.com/downloads/linux-wget-cheat-sheet
