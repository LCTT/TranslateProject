How To Setup Static File Server Instantly
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/serve-720x340.png)
Ever wanted to share your files or project over network, but don’t know how to do? No worries! Here is a simple utility named **“serve”** to share your files instantly over network. This simple utility will instantly turn your system into a static file server, allowing you to serve your files over network. You can access the files from any devices regardless of their operating system. All you need is a web browser. This utility also can be used to serve static websites. It is formerly known as “list” and “micro-list”, but now the name has been changed to “serve”, which is much more suitable for the purpose of this utility.

### Setup Static File Server Using Serve

To install “serve”, you need to install NodeJS and NPM first. Refer the following link to install NodeJS and NPM in your Linux box.

Once NodeJS and NPM installed, run the following command to install “serve”.
```
$ npm install -g serve

```

Done! Now is the time to serve the files or folders.

The typical syntax to use “serve” is:
```
$ serve [options] <path-to-files-or-folders>

```

### Serve Specific files or folders

For example, let us share the contents of the **Documents** directory. To do so, run:
```
$ serve Documents/

```

Sample output would be:

![][2]

As you can see in the above screenshot, the contents of the given directory have been served over network via two URLs.

To access the contents from the local system itself, all you have to do is open your web browser and navigate to **<http://localhost:5000/>** URL.

![][3]

The Serve utility displays the contents of the given directory in a simple layout. You can download (right click on the files and choose “Save link as..”) or just view them in the browser.

If you want to open local address automatically in the browser, use **-o** flag.
```
$ serve -o Documents/

```

Once you run the above command, The Serve utility will open your web browser automatically and display the contents of the shared item.

Similarly, to access the shared directory from a remote system over network, type **<http://192.168.43.192:5000>** in the browser’s address bar. Replace 192.168.43.192 with your system’s IP.

**Serve contents via different port**

As you may noticed, The serve utility uses port **5000** by default. So, make sure the port 5000 is allowed in your firewall or router. If it is blocked for some reason, you can serve the contents using different port using **-p** flag.
```
$ serve -p 1234 Documents/

```

The above command will serve the contents of Documents directory via port **1234**.

![][4]

To serve a file, instead of a folder, just give it’s full path like below.
```
$ serve Documents/Papers/notes.txt

```

The contents of the shared directory can be accessed by any user on the network as long as they know the path.

**Serve the entire $HOME directory**

Open your Terminal and type:
```
$ serve

```

This will share the contents of your entire $HOME directory over network.

To stop the sharing, press **CTRL+C**.

**Serve selective files or folders**

You may not want to share all files or directories, but only a few in a directory. You can do this by excluding the files or directories using **-i** flag.
```
$ serve -i Downloads/

```

The above command will serve entire file system except **Downloads** directory.

**Serve contents only on localhost**

Sometimes, you want to serve the contents only on the local system itself, not on the entire network. To do so, use **-l** flag as shown below:
```
$ serve -l Documents/

```

This command will serve the **Documents** directory only on localhost.

![][5]

This can be useful when you’re working on a shared server. All users in the in the system can access the share, but not the remote users.

**Serve content using SSL**

Since we serve the contents over the local network, we need not to use SSL. However, Serve utility has the ability to shares contents using SSL using **–ssl** flag.
```
$ serve --ssl Documents/

```

![][6]

To access the shares via web browser use “<https://localhost:5000”> or “<https://ip:5000”>.

![][7]

**Serve contents with authentication**

In all above examples, we served the contents without any authentication. So anyone on the network can access them without any authentication. You might feel some contents should be accessed with username and password.

To do so, use:
```
$ SERVE_USER=ostechnix SERVE_PASSWORD=123456 serve --auth

```

Now the users need to enter the username (i.e **ostechnix** in our case) and password (123456) to access the shares.

![][8]

The Serve utility has some other features, such as disable [**Gzip compression**][9], setup * CORS headers to allow requests from any origin, prevent copy address automatically to clipboard etc. You can read the complete help section by running the following command:
```
$ serve help

```

And, that’s all for now. Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-setup-static-file-server-instantly/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-2.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-4.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-3.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-6.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-5-1.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/04/serve-7-1.png
[9]:https://www.ostechnix.com/how-to-compress-and-decompress-files-in-linux/
