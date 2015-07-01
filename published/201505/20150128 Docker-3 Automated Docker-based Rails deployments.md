自动化部署基于Docker的Rails应用
================================================================================
![](http://cocoahunter.com/content/images/2015/01/docker3.jpeg)

[TL;DR] 这是系列文章的第三篇，讲述了我的公司是如何将基础设施从PaaS移植到Docker上的。

- [第一部分][1]:谈论了我接触Docker之前的经历；
- [第二部分][2]:一步步搭建一个安全而又私有的registry。

----------

在系列文章的最后一篇里，我们将用一个实例来学习如何自动化整个部署过程。

### 基本的Rails应用程序###

现在让我们启动一个基本的Rails应用。为了更好的展示，我使用Ruby 2.2.0和Rails 4.1.1

在终端运行：

    $ rvm use 2.2.0
    $ rails new  && cd docker-test

创建一个基本的控制器：

    $ rails g controller welcome index

……，然后编辑 `routes.rb` ，以便让该项目的根指向我们新创建的welcome#index方法：

    root 'welcome#index'  

在终端运行 `rails s` ，然后打开浏览器，登录[http://localhost:3000][3]，你会进入到索引界面当中。我们不准备给应用加上多么神奇的东西，这只是一个基础的实例，当我们将要创建并部署容器的时候，用它来验证一切是否运行正常。

### 安装webserver ###

我们打算使用Unicorn当做我们的webserver。在Gemfile中添加 `gem 'unicorn'`和 `gem 'foreman'`然后将它bundle起来(运行 `bundle install`命令）。

启动Rails应用时，需要先配置好Unicorn，所以我们将一个**unicorn.rb**文件放在**config**目录下。[这里有一个Unicorn配置文件的例子][4]，你可以直接复制粘贴Gist的内容。

接下来，在项目的根目录下添加一个Procfile，以便可以使用foreman启动应用，内容为下：

    web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb  

现在运行**foreman start**命令启动应用，一切都将正常运行，并且你将能够在[http://localhost:5000][5]上看到一个正在运行的应用。

### 构建一个Docker镜像 ###

现在我们构建一个镜像来运行我们的应用。在这个Rails项目的根目录下，创建一个名为**Dockerfile**的文件，然后粘贴进以下内容：

    # 基于镜像 ruby 2.2.0
    FROM ruby:2.2.0
    
    # 安装所需的库和依赖
    RUN apt-get update && apt-get install -qy nodejs postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
    
    # 设置 Rails 版本
    ENV RAILS_VERSION 4.1.1
    
    # 安装 Rails
    RUN gem install rails --version "$RAILS_VERSION"
    
    # 创建代码所运行的目录 
    RUN mkdir -p /usr/src/app  
    WORKDIR /usr/src/app
    
    # 使 webserver 可以在容器外面访问
    EXPOSE 3000
    
    # 设置环境变量
    ENV PORT=3000
    
    # 启动 web 应用
    CMD ["foreman","start"]
    
    # 安装所需的 gems 
    ADD Gemfile /usr/src/app/Gemfile  
    ADD Gemfile.lock /usr/src/app/Gemfile.lock  
    RUN bundle install --without development test
    
    # 将 rails 项目（和 Dockerfile 同一个目录）添加到项目目录
    ADD ./ /usr/src/app
    
    # 运行 rake 任务
    RUN RAILS_ENV=production rake db:create db:migrate  

使用上述Dockerfile，执行下列命令创建一个镜像（确保**boot2docker**已经启动并在运行当中）:

    $ docker build -t localhost:5000/your_username/docker-test .

然后，如果一切正常，长长的日志输出的最后一行应该类似于：

    Successfully built 82e48769506c  
    $ docker images
    REPOSITORY                                       TAG                 IMAGE ID            CREATED              VIRTUAL SIZE  
    localhost:5000/your_username/docker-test         latest              82e48769506c        About a minute ago   884.2 MB  

让我们运行一下容器试试！

    $ docker run -d -p 3000:3000 --name docker-test localhost:5000/your_username/docker-test

通过你的boot2docker虚拟机的3000号端口（我的是[http://192.168.59.103:3000][6]），你可以观察你的Rails应用。（如果不清楚你的boot2docker虚拟地址，输入` $ boot2docker ip`命令查看。）

### 使用shell脚本进行自动化部署 ###
 
前面的文章（指文章1和文章2）已经告诉了你如何将新创建的镜像推送到私有registry中，并将其部署在服务器上，所以我们跳过这一部分直接开始自动化进程。

我们将要定义3个shell脚本，然后最后使用rake将它们捆绑在一起。

### 清除 ###

每当我们创建镜像的时候，

- 停止并重启boot2docker；
- 去除Docker孤儿镜像（那些没有标签，并且不再被容器所使用的镜像们）。

在你的工程根目录下的**clean.sh**文件中输入下列命令。

    echo Restarting boot2docker...  
    boot2docker down  
    boot2docker up
    
    echo Exporting Docker variables...  
    sleep 1  
    export DOCKER_HOST=tcp://192.168.59.103:2376  
    export DOCKER_CERT_PATH=/Users/user/.boot2docker/certs/boot2docker-vm  
    export DOCKER_TLS_VERIFY=1
    
    sleep 1  
    echo Removing orphaned images without tags...  
    docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi  

给脚本加上执行权限：

    $ chmod +x clean.sh

### 构建 ###

构建的过程基本上和之前我们所做的（docker build）内容相似。在工程的根目录下创建一个**build.sh**脚本，填写如下内容：

    docker build -t localhost:5000/your_username/docker-test .  

记得给脚本执行权限。

### 部署 ###

最后，创建一个**deploy.sh**脚本，在里面填进如下内容：

    # 打开 boot2docker 到私有注册库的 SSH 连接
    boot2docker ssh "ssh -o 'StrictHostKeyChecking no' -i /Users/username/.ssh/id_boot2docker -N -L 5000:localhost:5000 root@your-registry.com &" &
    
    # 在推送前先确认该 SSH 通道是开放的。
    echo Waiting 5 seconds before pushing image.
    
    echo 5...  
    sleep 1  
    echo 4...  
    sleep 1  
    echo 3...  
    sleep 1  
    echo 2...  
    sleep 1  
    echo 1...  
    sleep 1
    
    # Push image onto remote registry / repo
    echo Starting push!  
    docker push localhost:5000/username/docker-test  

如果你不理解这其中的含义，请先仔细阅读这部分[第二部分][2]。

给脚本加上执行权限。

### 使用rake将以上所有绑定 ###

现在的情况是，每次你想要部署你的应用时，你都需要单独运行这三个脚本。

1. clean
1. build
1. deploy / push

这一点都不费工夫，可是事实上开发者比你想象的要懒得多！那么咱们就索性再懒一点！

我们最后再把工作好好整理一番，我们现在要将三个脚本通过rake捆绑在一起。

为了更简单一点，你可以在工程根目录下已经存在的Rakefile中添加几行代码，打开Rakefile文件，把下列内容粘贴进去。

    namespace :docker do  
      desc "Remove docker container"
      task :clean do
        sh './clean.sh'
      end
    
      desc "Build Docker image"
      task :build => [:clean] do
        sh './build.sh'
      end
    
      desc "Deploy Docker image"
      task :deploy => [:build] do
        sh './deploy.sh'
      end
    end  

即使你不清楚rake的语法（其实你真应该去了解一下，这玩意太酷了！），上面的内容也是很显然的吧。我们在一个命名空间（docker）里声明了三个任务。

三个任务是：

- rake docker:clean
- rake docker:build
- rake docker:deploy

Deploy独立于build，build独立于clean。所以每次我们输入命令运行的时候。

    $ rake docker:deploy

所有的脚本都会按照顺序执行。

### 测试 ###

现在我们来看看是否一切正常，你只需要在app的代码里做一个小改动：

    $ rake docker:deploy

接下来就是见证奇迹的时刻了。一旦镜像文件被上传（第一次可能花费较长的时间），你就可以ssh登录产品服务器，并且（通过SSH管道）把docker镜像拉取到服务器并运行了。多么简单！

也许你需要一段时间来习惯，但是一旦成功，它几乎与用Heroku部署一样简单。

备注：像往常一样，请让我了解到你的意见。我不敢保证这种方法是最好，最快，或者最安全的Docker开发的方法，但是这东西对我们确实奏效。

--------------------------------------------------------------------------------

via: http://cocoahunter.com/2015/01/23/docker-3/

作者：[Michelangelo Chasseur][a]
译者：[DongShuaike](https://github.com/DongShuaike)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://cocoahunter.com/author/michelangelo/
[1]:https://linux.cn/article-5339-1.html
[2]:https://linux.cn/article-5379-1.html
[3]:http://localhost:3000/
[4]:https://gist.github.com/chasseurmic/0dad4d692ff499761b20
[5]:http://localhost:5000/
[6]:http://192.168.59.103:3000/

