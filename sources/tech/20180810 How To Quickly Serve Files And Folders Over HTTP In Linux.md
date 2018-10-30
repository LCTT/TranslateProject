translating---geekpi

How To Quickly Serve Files And Folders Over HTTP In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/http-720x340.png)

Today, I came across a whole bunch of methods to serve a single file or entire directory with other systems in your local area network via a web browser. I tested all of them in my Ubuntu test machine, and everything worked just fine as described below. If you ever wondered how to easily and quickly serve files and folders over HTTP in Unix-like operating systems, one of the following methods will definitely help.

### Serve Files And Folders Over HTTP In Linux

**Disclaimer:** All the methods given here are meant to be used within a secure local area network. Since these methods doesn’t have any security mechanism, it is **not recommended to use them in production**. You have been warned!

#### Method 1 – Using simpleHTTPserver (Python)

We already have written a brief guide to setup a simple http server to share files and directories instantly in the following link. If you have a system with Python installed, this method is quite handy.

#### Method 2 – Using Quickserve (Python)

This method is specifically for Arch Linux and its variants. Check the following link for more details.

#### Method 3 – Using Ruby**

In this method, we use Ruby to serve files and folders over HTTP in Unix-like systems. Install Ruby and Rails as described in the following link.

Once Ruby installed, go to the directory, for example ostechnix, that you want to share over the network:
```
$ cd ostechnix

```

And, run the following command:
```
$ ruby -run -ehttpd . -p8000
[2018-08-10 16:02:55] INFO WEBrick 1.4.2
[2018-08-10 16:02:55] INFO ruby 2.5.1 (2018-03-29) [x86_64-linux]
[2018-08-10 16:02:55] INFO WEBrick::HTTPServer#start: pid=5859 port=8000

```

Make sure the port 8000 is opened in your router or firewall . If the port has already been used by some other services use different port.

You can now access the contents of this folder from any remote system using URL – **http:// <IP-address>:8000/**.

![](https://www.ostechnix.com/wp-content/uploads/2018/08/ruby-http-server.png)

To stop sharing press **CTRL+C**.

#### Method 4 – Using Http-server (NodeJS)

[**Http-server**][1] is a simple, production ready command line http-server written in NodeJS. It requires zero configuration and can be used to instantly share files and directories via web browser.

Install NodeJS as described below.

Once NodeJS installed, run the following command to install http-server.
```
$ npm install -g http-server

```

Now, go to any directory and share its contents over HTTP as shown below.
```
$ cd ostechnix

$ http-server -p 8000
Starting up http-server, serving ./
Available on:
 http://127.0.0.1:8000
 http://192.168.225.24:8000
 http://192.168.225.20:8000
Hit CTRL-C to stop the server

```

Now, you can access the contents of this directory from local or remote systems in the network using URL – **http:// <ip-address>:8000**.

![](http://www.ostechnix.com/wp-content/uploads/2018/08/nodejs-http-server.png)

To stop sharing, press **CTRL+C**.

#### Method 5 – Using Miniserve (Rust)

[**Miniserve**][2] is yet another command line utility that allows you to quickly serve files over HTTP. It is very fast, easy-to-use, and cross-platform utility written in **Rust** programming language. Unlike the above utilities/methods, it provides authentication support, so you can setup username and password to the shares.

Install Rust in your Linux system as described in the following link.

After installing Rust, run the following command to install miniserve:
```
$ cargo install miniserve

```

Alternatively, you can download the binaries from [**the releases page**][3] and make it executable.
```
$ chmod +x miniserve-linux

```

And, then you can run it using command (assuming miniserve binary file is downloaded in the current working directory):
```
$ ./miniserve-linux <path-to-share>

```

**Usage**

To serve a directory:
```
$ miniserve <path-to-directory>

```

**Example:**
```
$ miniserve /home/sk/ostechnix/
miniserve v0.2.0
Serving path /home/sk/ostechnix at http://[::]:8080, http://localhost:8080
Quit by pressing CTRL-C

```

Now, you can access the share from local system itself using URL – **<http://localhost:8080>** and/or from remote system with URL – **http:// <ip-address>:8080**.

To serve a single file:
```
$ miniserve <path-to-file>

```

**Example:**
```
$ miniserve ostechnix/file.txt

```

Serve file/folder with username and password:
```
$ miniserve --auth joe:123 <path-to-share>

```

Bind to multiple interfaces:
```
$ miniserve -i 192.168.225.1 -i 10.10.0.1 -i ::1 -- <path-to-share>

```

As you can see, I have given only 5 methods. But, there are few more methods given in the link attached at the end of this guide. Go and test them as well. Also, bookmark and revisit it from time to time to check if there are any new additions to the list in future.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-quickly-serve-files-and-folders-over-http-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.npmjs.com/package/http-server
[2]:https://github.com/svenstaro/miniserve
[3]:https://github.com/svenstaro/miniserve/releases
