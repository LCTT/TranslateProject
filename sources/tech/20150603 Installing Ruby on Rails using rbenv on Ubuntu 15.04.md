translating----geekpi


Installing Ruby on Rails using rbenv on Ubuntu 15.04
================================================================================
This article we will learn about how to Install Ruby on Rails with rbenv on Ubuntu 15.04. We choose Ubuntu as operating system because Ubuntu is one of Linux distribution that easy to use with a lots of package support and complete documentations , so I think this is the right choice. If you don't install the latest version Ubuntu yet, you can [download the ISO file][1] to start off.

### Installing Ruby ###

First thing we need to update ubuntu packages and install some dependencies for Ruby.

    sudo apt-get update
    sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

There are three methods to install Ruby such rbenv, rvm and from the source. Each have their own benefits, but these days many developers prefer to use rbenv installation method than rvm or from source. We will install the latest version of Ruby, version 2.2.2.

Installing with rbenv is a simple two step process. First you install rbenv, and then ruby-build :

    cd
    git clone git://github.com/sstephenson/rbenv.git .rbenv
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    exec $SHELL

    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    exec $SHELL

    git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

    rbenv install 2.2.2
    rbenv global 2.2.2
    ruby -v

We need to install Bundler but before that we tell Rubygems not to install the documentation for each package locally.

    echo "gem: --no-ri --no-rdoc" > ~/.gemrc
    gem install bundler

### Configuring GIT ###

Before configuring GIT you have to create github account first, you can register [Git][2]. We need Git for our version control system so we are going to set it up to match our Github account.

Replace **Name** and **Email address** in the following steps with the ones you used for your Github account.

    git config --global color.ui true
    git config --global user.name "YOUR NAME"
    git config --global user.email "YOUR@EMAIL.com"
    ssh-keygen -t rsa -C "YOUR@EMAIL.com"

After that take the newly generated SSH key and add it to your Github account. And then you need to copy and paste the output  of the following command and [paste it here][3].

    cat ~/.ssh/id_rsa.pub

If you done of this, check and see if it worked

    ssh -T git@github.com

You should get a message like this

    Hi excid3! You've successfully authenticated, but GitHub does not provide shell access.

### Installing Rails ###

We need to install javascript runtime like NodeJS because these days Rails ships with so many dependencies. With this way we can combines and minify your javascript to provide a faster production environment.

We need to add PPA repository for installing nodeJS

    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install nodejs

If you find a problem while updating repository packages, you should try to do this command :

    # Note the new setup script name for Node.js v0.12
    curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

    # Then install with:
    sudo apt-get install -y nodejs

Next step, follow this command :

    gem install rails -v 4.2.1

Because we are using rbenv, make the rails executable available with the following command below

    rbenv rehash

To make sure the Rails have installed correcly, you can run the rails -v and this will show like this

    rails -v
    # Rails 4.2.1

For some reason your environment may not be setup properly if you get different result.

### Setting Up MySQL ###

You may already be familiar with MySQL, you can install MySQL server and client from Ubuntu repository. You will set the password for the root user on installation process. This information will go into your Rails app's database.yml file in the future. Follow the command line below :

    sudo apt-get install mysql-server mysql-client libmysqlclient-dev

Installing the libmysqlclient-dev gives you the necessary files to compile the mysql2 gem which is what Rails will use to connect to MySQL when you setup your Rails app.

### Last Step ###

Let's try to create your first Rails Application :

    # Use MySQL

    rails new myapp -d mysql

    # Move into the application directory

    cd myapp

    # Create Database

    rake db:create

    rails server

Visit http://localhost:3000 to view your new website. Now you have got machine setup and ready to build some Rails application.

![](http://blog.linoxide.com/wp-content/uploads/2015/05/localhost_3000.png)

If you received an error message when you create database that said Access denied for user 'root'@'localhost' (Using password: NO) then you need to update your config/database.yml file to match the database **username** and **password**. 

    # Edit your database.yml in config folder

    nano config/database.yml

and then fill the password field with your MySQL root password.

![](http://blog.linoxide.com/wp-content/uploads/2015/05/root_passw.png)

Exit (Ctrl+X) and save.

### Conclusion ###

Rails is written in Ruby, the programming language which is also used alongside Rails. Ruby on Rails can be installed in three methods such rbenv, rvm and from the source on Ubuntu 15.04. Here in this tutorial we've used rbenv method and MySQL as database. If any question or suggestion, please write them in the comment below.


--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/installing-ruby-rails-using-rbenv-ubuntu-15-04/

作者：[Obet][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/obetp/
[1]:http://release.ubuntu.com/15.04
[2]:http://github.com
[3]:https://github.com/settings/ssh
