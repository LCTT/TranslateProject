Linux FAQs with Answers--How to install Go language on Linux
================================================================================
Go (also called "golang") is an open-source programming language initially developed by Google. It was born with several design principles in mind: simplicity, safety, and speed. The Go language distribution comes with various tools for debugging, testing, profiling and code-vetting. Nowadays the Go language and its tool chain are available in the base repositories of most Linux distributions, making it easy to install them with a default package manager.

### Install Go Language on Ubuntu, Debian or Linux Mint ###

The following **apt-get** command will install Go language and its development tools on Debian-based distributions.

    $ sudo apt-get install golang

Check the version of Go language to verify installation.

    $ go version

----------

    go version go1.2.1 linux/amd64

Depending on your need, you may want to install additional Go tools using apt-get.

    $ sudo apt-cache search golang

![](https://farm8.staticflickr.com/7430/15812762183_f094e3bf92_c.jpg)

### Install Go Language on Fedora, CentOS/RHEL ###

The following yum command will install Go language and its development tools on Red Hat based distributions.

    $ sudo yum install golang

Check the version of Go language to verify installation.

    $ go version 

----------

    go version go1.3.3 linux/amd64

Depending on your need, you can install additional Go tools using yum.

    $ yum search golang 

![](https://farm8.staticflickr.com/7373/16432817805_775010dc18_c.jpg)

### Install Go Language from the Official Website ###

Sometimes the version of Go language that comes with your Linux distribution may not be up-to-date. In that case, you can install the latest Go language from its official website. Here is how you can do it.

Go to the [official source][1] of Go language, and download pre-built binaries.

**For 64-bit Linux:**

    $ wget https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz

**For 32-bit Linux:**

    $ wget https://storage.googleapis.com/golang/go1.4.1.linux-386.tar.gz

**Install the binaries under /usr/local.**

    $ sudo tar -xzf go1.4.1.linux-xxx.tar.gz -C /usr/local

Update the PATH environment variable system-wide by appending the following line in /etc/profile.

    $ sudo vi /etc/profile 

----------

    export PATH=$PATH:/usr/local/go/bin

If you installed Go in a custom location other than /usr/local, you also need to set GOROOT environment variable to point to the custom location.

    $ sudo vi /etc/profile

----------

    export GOROOT=/path/to/custom/location

Check the version of Go language.

    $ go version

----------

    go version go1.4.1 linux/amd64

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-go-language-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://golang.org/dl/