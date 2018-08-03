Getting started with Standard Notes for encrypted note-taking
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK)

[Standard Notes][1] is a simple, encrypted notes app that aims to make dealing with your notes the easiest thing you'll do all day. When you sign up for a free sync account, your notes are automatically encrypted and seamlessly synced with all your devices.

There are two key factors that differentiate Standard Notes from other, commercial software solutions:

  1. The server and client are both completely open source.
  2. The company is built on sustainable business practices and focuses on product development.



When you combine open source with ethical business practices, you get a software product that has the potential to serve you for decades. You start to feel ownership in the product rather than feeling like just another transaction for an IPO-bound company.

In this article, I’ll describe how to deploy your own Standard Notes open source syncing server on a Linux machine. You’ll then be able to use your server with our published applications for Linux, Windows, Android, Mac, iOS, and the web.

If you don’t want to host your own server and are ready to start using Standard Notes right away, you can use our public syncing server. Simply head on over to [Standard Notes][1] to get started.

### Hosting your own Standard Notes server

Get the [Standard File Rails app][2] running on your Linux box and expose it via [NGINX][3] or any other web server.

### Getting started

These instructions are based on setting up our syncing server on a fresh [CentOS][4]-like installation. You can use a hosting service like [AWS][5] or [DigitalOcean][6] to launch your server, or even run it locally on your own machine.

  1. Update your system:
  
```
     sudo yum update

```

  2. Install [RVM][7] (Ruby Version Manager):

```
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable

```

  3. Begin using RVM in current session:
```
    source /home/ec2-user/.rvm/scripts/rvm

```

  4. Install [Ruby][8]:
  
```
     rvm install ruby

```

This should install the latest version of Ruby (2.3 at the time of this writing.)

Note that at least Ruby 2.2.2 is required for Rails 5.

  5. Use Ruby:
```
     rvm use ruby

```

  6. Install [Bundler][9]:

```
   gem install bundler --no-ri --no-rdoc

```

  7. Install [mysql-devel][10]:
```
     sudo yum install mysql-devel

```

  8. Install [MySQL][11] (optional; you can also use a hosted db through [Amazon RDS][12], which is recommended):
```
    sudo yum install mysql56-server

    sudo service mysqld start

    sudo mysql_secure_installation

    sudo chkconfig mysqld on

```

Create a database:

```
    mysql -u root -p

    > create database standard_file;

    > quit;

```

  9. Install [Passenger][13]:
```
    sudo yum install rubygems

    gem install rubygems-update --no-rdoc --no-ri

    update_rubygems

    gem install passenger --no-rdoc --no-ri

```

  10. Remove system NGINX installation if installed (you’ll use Passenger’s instead):
```
    sudo yum remove nginx
    sudo rm -rf /etc/nginx
```

  11. Configure Passenger:
```
    sudo chmod o+x "/home/ec2-user"

    sudo yum install libcurl-devel

    rvmsudo passenger-install-nginx-module

    rvmsudo passenger-config validate-install

```

  12. Install Git:
```
    sudo yum install git

```

  13. Set up HTTPS/SSL for your server (free using [Let'sEncrypt][14]; required if using the secure client on [https://app.standardnotes.org][15]):
```
    sudo chown ec2-user /opt

    cd /opt

    git clone https://github.com/letsencrypt/letsencrypt

    cd letsencrypt

```

Run the setup wizard:
```
    ./letsencrypt-auto certonly --standalone --debug

```

Note the location of the certificates, typically `/etc/letsencrypt/live/domain.com/fullchain.pem`

  14. Configure NGINX:
```
    sudo vim /opt/nginx/conf/nginx.conf

```

Add this to the bottom of the file, inside the last curly brace:
```
    server {

        listen 443 ssl default_server;

        ssl_certificate /etc/letsencrypt/live/domain.com/fullchain.pem;

        ssl_certificate_key /etc/letsencrypt/live/domain.com/privkey.pem;

        server_name domain.com;

        passenger_enabled on;

        passenger_app_env production;

        root /home/ec2-user/ruby-server/public;

      }

```

  15. Make sure you are in your home directory and clone the Standard File [ruby-server][2] project:
```
    cd ~

    git clone https://github.com/standardfile/ruby-server.git

    cd ruby-server

```

  16. Set up project:
```
    bundle install

    bower install

    rails assets:precompile

```

  17. Create a .env file for your environment variables. The Rails app will automatically load these when it starts.

```
    vim .env

```

Insert:
```
    RAILS_ENV=production

    SECRET_KEY_BASE=use "bundle exec rake secret"



    DB_HOST=localhost

    DB_PORT=3306

    DB_DATABASE=standard_file

    DB_USERNAME=root

    DB_PASSWORD=

```

  18. Setup database:
```
    rails db:migrate

```

  19. Start NGINX:
```
    sudo /opt/nginx/sbin/nginx

```

Tip: you will need to restart NGINX whenever you make changes to your environment variables or the NGINX configuration:
```
    sudo /opt/nginx/sbin/nginx -s reload

```

  20. You’re done!




### Using your new server

Now that you have your server running, you can plug it into any of the Standard Notes applications and sign into it.

**On the Standard Notes web or desktop app:**

Click Account, then Register. Choose "Advanced Options" and you’ll see a field for Sync Server. Enter your server’s URL here.

**On the Standard Notes Android or iOS app:**

Open the Settings window, click "Advanced Options" when signing in or registering, and enter your server URL in the Sync Server field.

For help or questions with your Standard Notes server, join our [Slack group][16] in the #dev channel, or visit our [help page][17] for frequently asked questions and other topics.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/getting-started-standard-notes

作者：[Mo Bitar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mobitar
[1]:https://standardnotes.org/
[2]:https://github.com/standardfile/ruby-server
[3]:https://www.nginx.com/
[4]:https://www.centos.org/
[5]:https://aws.amazon.com/
[6]:https://www.digitalocean.com/
[7]:https://rvm.io/
[8]:https://www.ruby-lang.org/en/
[9]:https://bundler.io/
[10]:https://rpmfind.net/linux/rpm2html/search.php?query=mysql-devel
[11]:https://www.mysql.com/
[12]:https://aws.amazon.com/rds/
[13]:https://www.phusionpassenger.com/
[14]:https://letsencrypt.org/
[15]:https://app.standardnotes.org/
[16]:https://standardnotes.org/slack
[17]:https://standardnotes.org/help
