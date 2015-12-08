Install Wetty on Centos/RHEL 6.X
================================================================================
![](http://www.unixmen.com/wp-content/uploads/2015/11/Terminal.png)

What is Wetty?

As a system administrator, you probably connect to remote servers using a program such as GNOME Terminal (or the like) if you’re on a Linux desktop, or a SSH client such as Putty if you have a Windows machine, while you perform other tasks like browsing the web or checking your email.

### Step 1: Install epel repo ###

    # wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
    # rpm -ivh epel-release-6-8.noarch.rpm

### Step 2: Install dependencies ###

    # yum install epel-release git nodejs npm -y

### Step 3: After installing these dependencies, clone the GitHub repository ###

    # git clone https://github.com/krishnasrinivas/wetty

### Step 4: Run Wetty ###

    # cd wetty
    # npm install

### Step 5: Starting Wetty and Access Linux Terminal from Web Browser ###

    # node app.js -p 8080

### Step 6: Wetty through HTTPS ###

    # openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes (complete this)

### Step 7: launch Wetty via HTTPS ###

    # nohup node app.js --sslkey key.pem --sslcert cert.pem -p 8080 &

### Step 8: Add an user for wetty ###

    # useradd <username>
    # Passwd <username>

### Step 9: Access wetty ###

    http://Your_IP-Address:8080
    give the credential have created before for wetty and access

Enjoy

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-wetty-centosrhel-6-x/

作者：[Debojyoti Das][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/debjyoti/