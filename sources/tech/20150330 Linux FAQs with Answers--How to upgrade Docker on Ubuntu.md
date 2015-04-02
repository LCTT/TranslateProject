Translating----geekpi

Linux FAQs with Answers--How to upgrade Docker on Ubuntu
================================================================================
> **Question**: I installed Docker on Ubuntu using its standard repositories. However, the default Docker installation does not meet the version requirement for my another application that relies on Docker. How can I upgrade Docker to the latest version on Ubuntu?

Since Docker was first released in 2013, it has been fast evolving into a full-blown open platform for distributed applications. To meet the industry's expection, Docker is being aggressively developed and constantly upgraded with new features. Chances are that the stock Docker that comes with your Ubuntu distribution is quickly outdated. For example, Ubuntu 14.10 Utopic comes with Docker version 1.2.0, while the latest Docker version is 1.5.0.

![](https://farm9.staticflickr.com/8730/16351300024_9acb9086da_b.jpg)

For those of you who want to stay up-to-date with Docker's latest developments, Canonical maintains a separate PPA for Docker. Using this PPA repository, you can easily upgrade Docker to the latest version on Ubuntu.

Here is how to set up Docker PPA and upgrade Docker.

    $ sudo add-apt-repository ppa:docker-maint/testing
    $ sudo apt-get update
    $ sudo apt-get install docker.io

Now check the version of installed Docker:

    $ docker --version

----------

    Docker version 1.5.0-dev, build a78ce5c

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/upgrade-docker-ubuntu.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
