How to Setup Node JS v4.0.0 on Ubuntu 14.04 / 15.04
================================================================================
Hi everyone, Node.JS Version 4.0.0 has been out, the popular server-side JavaScript platform has combines the Node.js and io.js code bases. This release represents the combined efforts encapsulated in both the Node.js project and the io.js project that are now combined in a single codebase. The most important change is this Node.js is ships with version 4.5 of Google's V8 JavaScript engine, which is the same version that ships with the current Chrome browser. So, being able to more closely track V8’s releases means Node.js runs JavaScript faster, more securely, and with the ability to use many desirable ES6 language features.

![Node JS](http://blog.linoxide.com/wp-content/uploads/2015/09/nodejs.png)

Node.js 4.0.0 aims to provide an easy update path for current users of io.js and node as there are no major API changes. Let’s see how you can easily get it installed and setup on Ubuntu server by following this simple article.

### Basic System Setup ###

Node works perfectly on Linux, Macintosh, and Solaris operating systems and among the Linux operating systems it has the best results using Ubuntu OS. That's why we are to setup it Ubuntu 15.04 while the same steps can be followed using Ubuntu 14.04.

#### 1) System Resources ####

The basic system resources for Node depend upon the size of your infrastructure requirements. So, here in this tutorial we will setup Node with 1 GB RAM, 1 GHz Processor and 10 GB of available disk space with minimal installation packages installed on the server that is no web or database server packages are installed.

#### 2) System Update ####

It always been recommended to keep your system upto date with latest patches and updates, so before we move to the installation on Node, let's login to your server with super user privileges and run update command.

    # apt-get update

#### 3) Installing Dependencies ####

Node JS only requires some basic system and software utilities to be present on your server, for its successful installation like 'make' 'gcc' and 'wget'. Let's run the below command to get them installed if they are not already present.

    # apt-get install python gcc make g++ wget

### Download Latest Node JS v4.0.0 ###

Let's download the latest Node JS version 4.0.0 by following this link of [Node JS Download Page][1].

![nodejs download](http://blog.linoxide.com/wp-content/uploads/2015/09/download.png)

We will copy the link location of its latest package and download it using 'wget' command as shown.

    # wget https://nodejs.org/download/rc/v4.0.0-rc.1/node-v4.0.0-rc.1.tar.gz

Once download completes, unpack using 'tar' command as shown.

    # tar -zxvf node-v4.0.0-rc.1.tar.gz

![wget nodejs](http://blog.linoxide.com/wp-content/uploads/2015/09/wget.png)

### Installing Node JS v4.0.0 ###

Now we have to start the installation of Node JS from its downloaded source code. So, change your directory and configure the source code by running its configuration script before compiling it on your ubuntu server.

    root@ubuntu-15:~/node-v4.0.0-rc.1# ./configure

![Installing NodeJS](http://blog.linoxide.com/wp-content/uploads/2015/09/configure.png)

Now run the 'make install' command to compile the Node JS installation package as shown.

    root@ubuntu-15:~/node-v4.0.0-rc.1# make install

The make command will take a couple of minutes while compiling its binaries so after executinf above command, wait for a while and keep calm.

### Testing Node JS Installation ###

Once the compilation process is complete, we will test it if every thing went fine. Let's run the following command to confirm the installed version of Node JS.

    root@ubuntu-15:~# node -v
    v4.0.0-pre

By executing 'node' without any arguments from the command-line you will be dropped into the REPL (Read-Eval-Print-Loop) that has simplistic emacs line-editing where you can interactively run JavaScript and see the results.

![node version](http://blog.linoxide.com/wp-content/uploads/2015/09/node.png)

### Writing Test Program ###

We can also try out a very simple console program to test the successful installation and proper working of Node JS. To do so we will create a file named "test.js" and write the following code into it and save the changes made in the file as shown.

    root@ubuntu-15:~# vim test.js
    var util = require("util");
    console.log("Hello! This is a Node Test Program");
    :wq!

Now in order to run the above program, from the command prompt run the below command.

    root@ubuntu-15:~# node test.js

![Node Program](http://blog.linoxide.com/wp-content/uploads/2015/09/node-test.png)

So, upon successful installation we will get the output as shown in the screen, where as in the above program it loads the "util" class into a variable "util" and then uses the "util" object to perform the console tasks. While the console.log is a command similar to the cout in C++.

### Conclusion ###

That’s it. Hope this gives you a good idea of Node.js going with Node.js on Ubuntu. If you are new to developing applications with Node.js. After all we can say that we can expect significant performance gains with Node JS Version 4.0.0.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-node-js-4-0-ubuntu-14-04-15-04/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:https://nodejs.org/download/rc/v4.0.0-rc.1/