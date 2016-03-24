在Ubuntu 15.04中安装Ruby on Rails
================================================================================

本篇我们会学习如何用rbenv在Ubuntu 15.04中安装Ruby on Rails。我们选择Ubuntu作为操作系统是因为Ubuntu是Linux发行版中自带很多包和完整文档的操作系统，因此我认为这是正确的选择。如果你还没有安装最新的Ubuntu，你可以从[下载iso文件][1]开始。

### 安装 Ruby ###

我们要做的第一件事是更新Ubuntu包并且为Ruby安装一些依赖。

    sudo apt-get update
    sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

有三种方法来安装Ruby：rbenv、rvm和从源码安装。每种都有各自的好处，但是近来开发者们更倾向使用rbenv而不是rvm和源码来安装。我们将安装最新的Ruby版本，2.2.2。

用rbenv来安装只有简单的两步。第一步安装rbenv，接着是ruby-build：

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

我们需要安装Bundler，但是我们要在安装之前告诉rubygems不要为每个包安装本地文档。

    echo "gem: --no-ri --no-rdoc" > ~/.gemrc
    gem install bundler

### 配置 GIT ###

配置git之前，你要创建一个github账号，你可以注册一个[github 账号][2]。我们需要git作为版本控制系统，因此我们要设置它来匹配github账号。

用户的github账号来替换下面的**Name** 和 **Email address** 。

    git config --global color.ui true
    git config --global user.name "YOUR NAME"
    git config --global user.email "YOUR@EMAIL.com"
    ssh-keygen -t rsa -C "YOUR@EMAIL.com"

接下来用新生成的ssh key添加到github账号中。这样你需要复制下面命令的输出并[粘贴在Github的设置页面里面][3]。

    cat ~/.ssh/id_rsa.pub

如果你做完了，检查是否已经成功。

    ssh -T git@github.com

你应该得到下面这样的信息。

    Hi excid3! You've successfully authenticated, but GitHub does not provide shell access.

### 安装 Rails ###

我们需要安装像NodeJS这样的javascript运行时环境，因为近来Rails的依赖越来越多了。这样我们可以合并和压缩你的javascript，从而提供一个更快的生产环境。

我们需要添加PPA来安装nodeJS。

    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install nodejs

如果在更新时遇到了问题，你可以试试这个命令：

    # Note the new setup script name for Node.js v0.12
    curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

    # Then install with:
    sudo apt-get install -y nodejs

下一步，用这个命令安装 rails：

    gem install rails -v 4.2.1

因为我们正在使用rbenv，用下面的命令来让rails的执行程序可以使用。

    rbenv rehash

要确保rails已经正确安装，你可以运行rails -v，显示如下：

    rails -v
    # Rails 4.2.1

如果你得到的是不同的结果可能是环境没有设置正确。

### 设置 MySQL ###

或许你已经熟悉MySQL了，你可以从Ubuntu的仓库中安装MySQL的客户端与服务端。你可以在安装时设置root用户密码。这个信息将来会进入你rails程序的database.yml文件中。用下面的命令来安装mysql。

    sudo apt-get install mysql-server mysql-client libmysqlclient-dev

安装libmysqlclient-dev用于mysql2 gem的编译；在设置rails程序时，rails通过它来连接mysql。

### 最后一步 ###

让我们尝试创建你的第一个rails程序：

    # 使用 MySQL 数据库

    rails new myapp -d mysql

    # 进入到应用目录

    cd myapp

    # 创建数据库

    rake db:create

    rails server

访问http://localhost:3000来访问你的新网站。现在你的电脑上已经可以构建rails程序了。

![](http://blog.linoxide.com/wp-content/uploads/2015/05/localhost_3000.png)

如果你在创建数据库时遇到了“Access denied for user 'root'@'localhost' (Using password: NO)”这个错误信息，你需要更新你的config/database.yml文件来匹配数据库的**用户名**和**密码**。

    # Edit your database.yml in config folder

    nano config/database.yml

接着填入MySql root用户的密码。

![](http://blog.linoxide.com/wp-content/uploads/2015/05/root_passw.png)

退出 (Ctrl+X)并保存。

### 总结 ###

Rails是用Ruby写的， 也是随着rails一起使用的编程语言。在Ubuntu 15.04中Ruby on Rails可以用rbenv、 rvm和源码的方式来安装。本篇我们使用的是rbenv方式并用了MySQL作为数据库。有任何的问题或建议，请在评论栏指出。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/installing-ruby-rails-using-rbenv-ubuntu-15-04/

作者：[Obet][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/obetp/
[1]:http://release.ubuntu.com/15.04
[2]:http://github.com
[3]:https://github.com/settings/ssh
