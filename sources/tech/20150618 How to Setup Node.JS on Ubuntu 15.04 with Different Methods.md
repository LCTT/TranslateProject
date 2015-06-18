translating by NearTan

How to Setup Node.JS on Ubuntu 15.04 with Different Methods
================================================================================
This is such an important article to guide you about the installation and setup of Node.js on Ubuntu 15.04. Node.js is basically a server side java script programming to provide you bindings for enabling the input and output socket bios and streams. It has a high through put and non-blocking IO in a single threaded event loop. It’s also a platform layer that provides the functionality to interact with the Operating system to write file, read files and to do networking operations. So in this article we will perform different installation methods to setup Node.Js on Ubuntu 15.04 server.

### Methods to Install Node.JS ###

Their are different ways to install Node.Js and we can prefer to choose any one. Following are some important ways to install Node.Js that we will use to guide you about their each setup on Ubuntu 15.04 so make sure to remove the previous previous packages to avoid from any package conflict.

- Installation of Node.JS from Source Code
- Installation of Node.JS from Package Manager
- Installation of Node.JS from Github Repository
- Installation of Node.JS with NVM

### 1) Installing from Source Code ###

Let's start with installation of Node.JS from the Source Code, so make sure that your system is up to date and dependent packages are pre installed. So follow the below steps and start the setup.

#### STEP 1: System Update ####

Use following commands and update Operating system and ten install the required packages are necessary for Node.JS setup.

    root@ubuntu-15:~# apt-get update

    root@ubuntu-15:~# apt-get install python gcc make g++

#### STEP 2: Get Source Code of Node.JS ####

After we had installed the dependent packages now from the official web link of Node.JS just download its source code package and extract it as in following commands.

    root@ubuntu-15:~# wget http://nodejs.org/dist/v0.12.4/node-v0.12.4.tar.gz
    root@ubuntu-15:~# tar zxvf node-v0.12.4.tar.gz

#### STEP 3: Starting Installation ####

Now move to the source code directory and execute the .configuration file

![NodeJS Configure](http://blog.linoxide.com/wp-content/uploads/2015/06/13.png)

    root@ubuntu-15:~# ls
    node-v0.12.4 node-v0.12.4.tar.gz
    root@ubuntu-15:~# cd node-v0.12.4/
    root@ubuntu-15:~/node-v0.12.4# ./configure
    root@ubuntu-15:~/node-v0.12.4# make install

### Testing after Installation of Node.Js from Source Code ###

Once the installation is done after running make installa command, we check its version and test that Node.Js is working fine by executing some test out puts.

    root@ubuntu-15:~/node-v0.12.4# node -v
    v0.12.4

![Node.Js Test](http://blog.linoxide.com/wp-content/uploads/2015/06/21.png)

Create a new file with .js extension execute it with Node command.

    root@ubuntu-15:~/node-v0.12.4# touch helo_test.js
    root@ubuntu-15:~/node-v0.12.4# vim helo_test.js
    console.log('Hello World');

Now execute it with Node command.

    root@ubuntu-15:~/node-v0.12.4# node helo_test.js
    Hello World

The out put shows that we had successfully installed Node.JS on Ubuntu 15.04 which is now ready to create applications on it using java scripts.

### 2) Installing from Package Manager ###

The installation of Node.JS through Package Manager is also a very simple process to setup on Ubuntu through NodeSource by adding its Personal Package Archives (PPA).

We will go through the following steps to install Node.JS through PPA.

#### STEP 1: Get the Source Code using Curl ####

Before getting the source code by using the Curl command we must update our system and then run the curl command to fetch the NodeSource into local repository.

    root@ubuntu-15:~#apt-get update
    root@ubuntu-15:~# curl -sL https://deb.nodesource.com/setup | sudo bash -

The curl will execute the following tasks.

    ## Installing the NodeSource Node.js 0.10 repo...
    ## Populating apt-get cache...
    ## Confirming "vivid" is supported...
    ## Adding the NodeSource signing key to your keyring...
    ## Creating apt sources list file for the NodeSource Node.js 0.10 repo...
    ## Running `apt-get update` for you...
    Fetched 6,411 B in 5s (1,077 B/s)
    Reading package lists... Done
    ## Run `apt-get install nodejs` (as root) to install Node.js 0.10 and npm

#### STEP 2: Installation of NodeJS and NPM ####

As per the output of Curl we had fetched the NodeSource to our local repository now through apt-get commands we will install the NodeJS and NPM packages.

    root@ubuntu-15:~# apt-get install nodejs

![NodeJS Install](http://blog.linoxide.com/wp-content/uploads/2015/06/31.png)

#### STEP 3: Installing Build Essentials Tool ####

To compile and install native addons from npm we may also need to install build tools using following command as.

    root@ubuntu-15:~# apt-get install -y build-essential

### Testing With Node.JS Shell ###

Testing of Node.Js is similar to the one that we did after installation from the source Code.
so lets start with the node command as follow and get its output result to see if Node.JS is fully functional.

    root@ubuntu-15:~# node
    > console.log('Node.js Installed Using Package Manager');
    Node.js Installed Using Package Manager

----------

    root@ubuntu-15:~# node
    > a = [1,2,3,4,5]
    [ 1, 2, 3, 4, 5 ]
    > typeof a
    'object'
    > 5 + 2
    7
    >
    (^C again to quit)
    >
    root@ubuntu-15:~#

### REPL For Your NodeJS Apps ###

REPL is the Node.js shell, any valid Javascript which can be written in a script can be passed to the REPL. So lets see how REPL works with NodeJS.

    root@ubuntu-15:~# node
    > var repl = require("repl");
    undefined
    > repl.start("> ");

    Press Enter and it will show out put like this:
    > { domain: null,
    _events: {},
    _maxListeners: 10,
    useGlobal: false,
    ignoreUndefined: false,
    eval: [Function],
    inputStream:
    { _connecting: false,
    _handle:
    { fd: 0,
    writeQueueSize: 0,
    owner: [Circular],
    onread: [Function: onread],
    reading: true },
    _readableState:
    { highWaterMark: 0,
    buffer: [],
    length: 0,
    pipes: null,
    ...
    ...

Here is the list of command line help that we can use to work with REPL.

![REPL Manual](http://blog.linoxide.com/wp-content/uploads/2015/06/4.png)

### Working with NodeJS Packet Manager ###

NPM is simple CLI tool for ensuring that a given node script runs continuously. It helps to Install and manage dependencies through the file package.json. We will start its using init command as.

    root@ubuntu-15:~# npm init

![NPM starting](http://blog.linoxide.com/wp-content/uploads/2015/06/51.png)

### 3) Installing from Github Repository ###

In this method to install Node.JS we will consider few simple steps to directory clone the Node.JS repository from the github.

Before the start of configurations through the the cloned package of Node.JS make sure that we must have following dependent packages installed with us.

    root@ubuntu-15:~# apt-get install g++ curl make libssl-dev apache2-utils git-core

Now start the clone with git command and change the directory to its configuration file.

    root@ubuntu-15:~# git clone git://github.com/ry/node.git
    root@ubuntu-15:~# cd node/

![Git Clone NodeJS](http://blog.linoxide.com/wp-content/uploads/2015/06/61.png)

To install from the cloned repository now lets run the .config command and then make install to complete the setup of Node.Js .

    root@ubuntu-15:~# ./configure

![Configure Node](http://blog.linoxide.com/wp-content/uploads/2015/06/7.png)

Run the make install command that will takes few minutes so be patient and get it ready finalize the setup on Node.JS package for you.

    root@ubuntu-15:~/node# make install

    root@ubuntu-15:~/node# node -v
    v0.13.0-pre

### Testing with Node.JS ###

    root@ubuntu-15:~/node# node
    > a = [1,2,3,4,5,6,7]
    [ 1, 2, 3, 4, 5, 6, 7 ]
    > typeof a
    'object'
    > 6 + 5
    11
    >
    (^C again to quit)
    >
    root@ubuntu-15:~/node#

### 4) Installing Node.JS Using Node Version Manager ###

In this last method we show you we can easily install Node.JS with NVM method. This is one of the best method to install and configure Node.JS it provides us with facility to control versions.

So before starting with this method make sure that the previously installed package is not already present there if you are working on the same machine.

#### STEP 1: Installing Prerequisites ####

Let's start with the system update and then install the following prerequisites for the Ubuntu Server to setup Node.JS using NodeJS Versions Manager System. Using the Curl command we will get NVM from the git to our local repository.

    root@ubuntu-15:~# apt-get install build-essential libssl-dev
    root@ubuntu-15:~# curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh

![NVM Curl](http://blog.linoxide.com/wp-content/uploads/2015/06/81.png)

#### STEP 2: Update Home Environment ####

After the curl command downloads the necessary packages for the NVM in the home directory of the user it also make changes to the bash profile. so in order to update those change and get access to NVM we must relogin to the terminal or we can update it using the source command as below.

    root@ubuntu-15:~# source ~/.profile

Now we can use the NVM to choose the default NVM version or by moving to the previous version of NVM that we can do so by using the following commands.

    root@ubuntu-15:~# nvm ls
    root@ubuntu-15:~# nvm alias default 0.12.4

![NVM Default](http://blog.linoxide.com/wp-content/uploads/2015/06/91.png)

#### STEP 3: Using NodeJS Versions Manager ####

We have successfully setup the NodeJS with NVM package and now can use it with its useful commands.

![NVM Manual](http://blog.linoxide.com/wp-content/uploads/2015/06/101.png)

### CONCLUSION ###

Now we are ready to go with building server side applications with Node.JS and you are free to choose the best installation setup of your choice as we had done with four optional installations of Node.Js on the latest version of Ubuntu 15.04 with priority installation sequence, now its up to you to follow the one of your own choice and start coding with NodeJS.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-node-js-ubuntu-15-04-different-methods/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/