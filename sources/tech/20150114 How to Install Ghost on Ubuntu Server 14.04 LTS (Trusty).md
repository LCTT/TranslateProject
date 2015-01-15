Translating-----geekpi

How to Install Ghost on Ubuntu Server 14.04 LTS (Trusty)
================================================================================
Today, we will install Ghost, a blogging platform in an Ubuntu Server 14.04 LTS (Trusty).

Ghost is the most amazing publishing platform which is beautifully designed, easy to use, and free for everyone. It is Free and Open Source Software (FOSS), its source code is available in github. The interface is intended to be simple, and an analytics dashboard is planned, as of January 2014. Editing is facilitated using a split screen display.

So, here are the steps-wise tutorial below on how to setup Ghost on Ubuntu Server:

### 1. Updating Ubuntu ###

The first step will be to run through the Ubuntu software updates and install a couple of extra packages that will be needed.

    sudo apt-get update
    sudo apt-get upgrade -y
    sudo aptitude install -y build-essential zip vim wget

### 2. Download and Install the Node.js Source Code ###

    wget http://nodejs.org/dist/node-latest.tar.gz
    tar -xzf node-latest.tar.gz
    cd node-v*

Now, we'll install Node.js by the following commands:

    ./configure
    make
    sudo make install

### 3. Download and Install Ghost ###

    sudo mkdir -p /var/www/
    cd /var/www/
    sudo wget https://ghost.org/zip/ghost-latest.zip
    sudo unzip -d ghost ghost-latest.zip
    cd ghost/
    sudo npm install --production

### 4.Configuring Ghost ###

    sudo nano config.example.js

In the "Production" section, change the following:

    host: '127.0.0.1',

to

    host: '0.0.0.0',

### Create Ghost User ###

    sudo adduser --shell /bin/bash --gecos 'Ghost application' ghost
    sudo chown -R ghost:ghost /var/www/ghost/

Now to start Ghost, you will need to log into your "ghost" user.

    su - ghost
    cd /var/www/ghost/

Now that you are logged in with your "ghost" user you can start Ghost:

    npm start --production

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-ghost-ubuntu-server-14-04/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/