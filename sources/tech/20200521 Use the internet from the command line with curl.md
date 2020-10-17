[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use the internet from the command line with curl)
[#]: via: (https://opensource.com/article/20/5/curl-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Use the internet from the command line with curl
======
Download our new curl cheat sheet. Curl is a fast and efficient way to
pull the information you need from the internet without using a
graphical interface.
![Cheat Sheet cover image][1]

Curl is commonly considered a non-interactive web browser. That means it's able to pull information from the internet and display it in your terminal or save it to a file. This is literally what web browsers, such as Firefox or Chromium, do except they _render_ the information by default, while curl downloads and displays raw information. In reality, the curl command does much more and has the ability to transfer data to or from a server using one of many supported protocols, including HTTP, FTP, SFTP, IMAP, POP3, LDAP, SMB, SMTP, and many more. It's a useful tool for the average terminal user, a vital convenience for the sysadmin, and a quality assurance tool for microservices and cloud developers.

Curl is designed to work without user interaction, so unlike Firefox, you must think about your interaction with online data from start to finish. For instance, if you want to view a web page in Firefox, you launch a Firefox window. After Firefox is open, you type the website you want to visit into the URL field or a search engine. Then you navigate to the site and click on the page you want to see.

The same concepts apply to curl, except you do it all at once: you launch curl at the same time you feed it the internet location you want and tell it whether you want to the data to be saved in your terminal or to a file. The complexity increases when you have to interact with a site that requires authentication or with an API, but once you learn the **curl** command syntax, it becomes second nature. To help you get the hang of it, we collected the pertinent syntax information in a handy [cheat sheet][2].

### Download a file with curl

You can download a file with the **curl** command by providing a link to a specific URL. If you provide a URL that defaults to **index.html**, then the index page is downloaded, and the file you downloaded is displayed on your terminal screen. You can pipe the output to less or tail or any other command:


```
$ curl "<http://example.com>" | tail -n 4
    &lt;h1&gt;Example Domain&lt;/h1&gt;
    &lt;p&gt;This domain is for use in illustrative examples in documents. You may use this domain in literature without prior coordination or asking for permission.&lt;/p&gt;
    &lt;p&gt;&lt;a href="[https://www.iana.org/domains/example"\&gt;More][3] information...&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;&lt;/body&gt;&lt;/html&gt;
```

Because some URLs contain special characters that your shell normally interprets, it's safest to surround your URL in quotation marks.

Some files don't translate well to being displayed in a terminal. You can use the **\--remote-name** option to cause the file to be saved according to what it's called on the server:


```
$ curl --remote-name "<https://example.com/linux-distro.iso>"
$ ls
linux-distro.iso
```

Alternatively, you can use the **\--output** option to name your download whatever you want:


```
`curl "http://example.com/foo.html" --output bar.html`
```

### List contents of a remote directory with curl

Because curl is non-interactive, it's difficult to browse a page for downloadable elements. Provided that the remote server you're connecting to allows it, you can use **curl** to list the contents of a directory:


```
`$ curl --list-only "https://example.com/foo/"`
```

### Continue a partial download

If you're downloading a very large file, you might find that you have to interrupt the download. Curl is intelligent enough to determine where you left off and continue the download. That means the next time you're downloading a 4GB Linux distribution ISO and something goes wrong, you never have to go back to the start. The syntax for **\--continue-at** is a little unusual: if you know the byte count where your download was interrupted, you can provide it; otherwise, you can use a lone dash (**-**) to tell curl to detect it automatically:


```
`$ curl --remote-name --continue-at - "https://example.com/linux-distro.iso"`
```

### Download a sequence of files

If you need to download several files—rather than just one big file—curl can help with that. Assuming you know the location and file-name pattern of the files you want to download, you can use curl's sequencing notation: the start and end point between a range of integers, in brackets. For the output filename, use **#1** to indicate the first variable:


```
`$ curl "https://example.com/file_[1-4].webp" --output "file_#1.webp"`
```

If you need to use another variable to represent another sequence, denote each variable in the order it appears in the command. For example, in this command, **#1** refers to the directories **images_000** through **images_009**, while **#2** refers to the files **file_1.webp** through **file_4.webp**:


```
$ curl "<https://example.com/images\_00\[0-9\]/file\_\[1-4\].webp>" \
\--output "file_#1-#2.webp"
```

### Download all PNG files from a site

You can do some rudimentary web scraping to find what you want to download, too, using only **curl** and **grep**. For instance, say you need to download all images associated with a web page you're archiving. First, download the page referencing the images. Pipe the page to grep with a search for the image type you're targeting (PNG in this example). Finally, create a **while** loop to construct a download URL and to save the files to your computer:


```
$ curl <https://example.com> |\
grep --only-matching 'src="[^"]*.[png]"' |\
cut -d\" -f2 |\
while read i; do \
curl <https://example.com/"${i}>" -o "${i##*/}"; \
done
```

This is just an example, but it demonstrates how flexible curl can be when combined with a Unix pipe and some clever, but basic, parsing.

### Fetch HTML headers

Protocols used for data exchange have a lot of metadata embedded in the packets that computers send to communicate. HTTP headers are components of the initial portion of data. It can be helpful to view these headers (especially the response code) when troubleshooting your connection to a site:


```
curl --head "<https://example.com>"
HTTP/2 200
accept-ranges: bytes
age: 485487
cache-control: max-age=604800
content-type: text/html; charset=UTF-8
date: Sun, 26 Apr 2020 09:02:09 GMT
etag: "3147526947"
expires: Sun, 03 May 2020 09:02:09 GMT
last-modified: Thu, 17 Oct 2019 07:18:26 GMT
server: ECS (sjc/4E76)
x-cache: HIT
content-length: 1256
```

### Fail quickly

A 200 response is the usual HTTP indicator of success, so it's what you usually expect when you contact a server. The famous 404 response indicates that a page can't be found, and 500 means there was a server error.

To see what errors are happening during negotiation, add the **\--show-error** flag:


```
`$ curl --head --show-error "http://opensource.ga"`
```

These can be difficult for you to fix unless you have access to the server you're contacting, but curl generally tries its best to resolve the location you point it to. Sometimes when testing things over a network, seemingly endless retries just waste time, so you can force curl to exit upon failure quickly with the **\--fail-early** option:


```
`curl --fail-early "http://opensource.ga"`
```

### Redirect query as specified by a 3xx response

The 300 series of responses, however, are more flexible. Specifically, the 301 response means that a URL has been moved permanently to a different location. It's a common way for a website admin to relocate content while leaving a "trail" so people visiting the old location can still find it. Curl doesn't follow a 301 redirect by default, but you can make it continue on to a 301 destination by using the **\--location** option:


```
$ curl "<https://iana.org>" | grep title
&lt;title&gt;301 Moved Permanently&lt;/title&gt;
$ curl --location "<https://iana.org>"
&lt;title&gt;Internet Assigned Numbers Authority&lt;/title&gt;
```

### Expand a shortened URL

The **\--location** option is useful when you want to look at shortened URLs before visiting them. Shortened URLs can be useful for social networks with character limits (of course, this may not be an issue if you use a [modern and open source social network][4]) or for print media in which users can't just copy and paste a long URL. However, they can also be a little dangerous because their destination is, by nature, concealed. By combining the **\--head** option to view just the HTTP headers and the **\--location** option to unravel the final destination of a URL, you can peek into a shortened URL without loading the full resource:


```
$ curl --head --location \
"<https://bit.ly/2yDyS4T>"
```

### [Download our curl cheat sheet][2]

Once you practice thinking about the process of exploring the web as a single command, curl becomes a fast and efficient way to pull the information you need from the internet without bothering with a graphical interface. To help you build it into your usual workflow, we've created a [curl cheat sheet][2] with common curl uses and syntax, including an overview of using it to query an API.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/curl-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/downloads/curl-command-cheat-sheet
[3]: https://www.iana.org/domains/example"\>More
[4]: https://opensource.com/article/17/4/guide-to-mastodon
