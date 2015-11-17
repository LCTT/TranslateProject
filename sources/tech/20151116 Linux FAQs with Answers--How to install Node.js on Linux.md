translation by strugglingyouth

Linux FAQs with Answers--How to install Node.js on Linux
================================================================================
> **Question**: How can I install Node.js on [insert your Linux distro]?

[Node.js][1] is a server-side software platform built on Google's V8 JavaScript engine. Node.js has become a popular choice for building high-performance server-side applications all in JavaScript. What makes Node.js even more attractive for backend server development is the [huge ecosystem][2] of Node.js libraries and applications. Node.js comes with a command line utility called npm which allows you to easily install, version-control, and manage dependencies of Node.js libraries and applications from the vast npm online repository.

In this tutorial, I will describe **how to install Node.js on major Linux distros including Debian, Ubuntu, Fedora and CentOS**.

Node.js is available as a pre-built package on some distros (e.g., Fedora or Ubuntu), while you need to install it from its source on other distros. As Node.js is fast evolving, it is recommended to install the latest Node.js from its source, instead of installing an outdated pre-built package. The lasted Node.js comes with npm (Node.js package manager) bundled, allowing you to install external Node.js modules easily.

### Install Node.js on Debian ###

Starting from Debian 8 (Jessie), Node.js is available in the official repositories. Thus you can install it with:

    $ sudo apt-get install npm

On Debian 7 (Wheezy) or earlier, you can install Node.js from its source as follows.

    $ sudo apt-get install python g++ make
    $ wget http://nodejs.org/dist/node-latest.tar.gz
    $ tar xvfvz node-latest.tar.gz
    $ cd node-v0.10.21 (replace a version with your own)
    $ ./configure
    $ make
    $ sudo make install

### Install Node.js on Ubuntu or Linux Mint ###

Node.js is included in Ubuntu (13.04 and higher). Thus installation is straightforward. The following will install Node.js and npm.

    $ sudo apt-get install npm
    $ sudo ln -s /usr/bin/nodejs /usr/bin/node

While stock Ubuntu ships Node.js, you can install a more recent version from [its PPA][3].

    $ sudo apt-get install python-software-properties python g++ make
    $ sudo add-apt-repository -y ppa:chris-lea/node.js
    $ sudo apt-get update
    $ sudo apt-get install npm

### Install Node.js on Fedora ###

Node.js is included in the base repository of Fedora. Therefore you can use yum to install Node.js on Fedora.

    $ sudo yum install npm

If you want to install the latest version of Node.js, you can build it from its source as follows.

    $ sudo yum groupinstall 'Development Tools'
    $ wget http://nodejs.org/dist/node-latest.tar.gz
    $ tar xvfvz node-latest.tar.gz
    $ cd node-v0.10.21 (replace a version with your own)
    $ ./configure
    $ make
    $ sudo make install

### Install Node.js on CentOS or RHEL ###

To install Node.js with yum package manager on CentOS, first enable EPEL repository, and then run:

    $ sudo yum install npm

If you want to build the latest Node.js on CentOS, follow the same procedure as in Fedora.

### Install Node.js on Arch Linux ###

Node.js is available in the Arch Linux community repository. Thus installation is as simple as running:

    $ sudo pacman -S nodejs npm

### Check the Version of Node.js ###

Once you have installed Node.js, you can check Node.js version as follows.

    $ node --version 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-node-js-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://nodejs.org/
[2]:https://www.npmjs.com/
[3]:https://launchpad.net/~chris-lea/+archive/node.js
