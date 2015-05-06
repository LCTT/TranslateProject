
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

创建一个基础控制器：

    $ rails g controller welcome index

……然后编辑 `routes.rb` ，以便让工程的根指向我们新创建的welcome#index方法：（这句话理解不太理解）

    root 'welcome#index'  

在终端运行 `rails s` ，然后打开浏览器，登录[http://localhost:3000][3]，你会进入到索引界面当中。我们不准备给应用加上多么神奇的东西，这只是一个基础实例，用来验证当我们将要创建并部署容器的时候，一切运行正常。

### 安装webserver ###

我们打算使用Unicorn当做我们的webserver。在Gemfile中添加 `gem 'unicorn'`和 `gem 'foreman'`然后将它bundle起来(运行 `bundle install`命令）。

在Rails应用启动的伺候，需要配置Unicorn，所以我们将一个**unicorn.rb**文件放在**config**目录下。[这里有一个Unicorn配置文件的例子][4]你可以直接复制粘贴Gist的内容。

Let's also add a Procfile with the following content inside the root of the project so that we will be able to start the app with foreman:
接下来，在工程的根目录下添加一个Procfile，以便可以使用foreman启动应用，内容为下：

    web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb  

现在运行**foreman start**命令启动应用，一切都将正常运行，并且你将能够在[http://localhost:5000][5]上看到一个正在运行的应用。

### 创建一个Docker映像 ###

现在我们创建一个映像来运行我们的应用。在Rails工程的跟目录下，创建一个名为**Dockerfile**的文件，然后粘贴进以下内容：

    # Base image with ruby 2.2.0
    FROM ruby:2.2.0
    
    # Install required libraries and dependencies
    RUN apt-get update && apt-get install -qy nodejs postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
    
    # Set Rails version
    ENV RAILS_VERSION 4.1.1
    
    # Install Rails
    RUN gem install rails --version "$RAILS_VERSION"
    
    # Create directory from where the code will run 
    RUN mkdir -p /usr/src/app  
    WORKDIR /usr/src/app
    
    # Make webserver reachable to the outside world
    EXPOSE 3000
    
    # Set ENV variables
    ENV PORT=3000
    
    # Start the web app
    CMD ["foreman","start"]
    
    # Install the necessary gems 
    ADD Gemfile /usr/src/app/Gemfile  
    ADD Gemfile.lock /usr/src/app/Gemfile.lock  
    RUN bundle install --without development test
    
    # Add rails project (from same dir as Dockerfile) to project directory
    ADD ./ /usr/src/app
    
    # Run rake tasks
    RUN RAILS_ENV=production rake db:create db:migrate  

使用提供的Dockerfile，执行下列命令创建一个映像[1][7]:

    $ docker build -t localhost:5000/your_username/docker-test .

然后，如果一切正常，长日志输出的最后一行应该类似于：

    Successfully built 82e48769506c  
    $ docker images
    REPOSITORY                                       TAG                 IMAGE ID            CREATED              VIRTUAL SIZE  
    localhost:5000/your_username/docker-test         latest              82e48769506c        About a minute ago   884.2 MB  

来运行容器吧！

    $ docker run -d -p 3000:3000 --name docker-test localhost:5000/your_username/docker-test

You should be able to reach your Rails app running inside the Docker container at port 3000 of your boot2docker VM[2][8] (in my case [http://192.168.59.103:3000][6]).
通过你的boot2docker虚拟机[2][8]的3000号端口（我的是[http://192.168.59.103:3000][6]），你可以观察你的Rails应用。

### 使用shell脚本进行自动化部署 ###
 
前面的文章（指文章1和文章2）已经告诉了你如何将新创建的映像推送到私有registry中，并将其部署在服务器上，所以我们跳过这一部分直接开始自动化进程。

我们将要定义3个shell脚本，然后最后使用rake将它们捆绑在一起。

### 清除 ###

每当我们创建映像的时候，

- 停止并重启boot2docker；
- 去除Docker孤儿映像（那些没有标签，并且不再被容器所使用的映像们）。

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

### 创建 ###

创建的过程基本上和之前我们所做的（docker build）内容相似。在工程的根目录下创建一个**build.sh**脚本，填写如下内容：

    docker build -t localhost:5000/your_username/docker-test .  

给脚本执行权限。

### 部署 ###

最后，创建一个**deploy.sh**脚本，在里面填进如下内容：

    # Open SSH connection from boot2docker to private registry
    boot2docker ssh "ssh -o 'StrictHostKeyChecking no' -i /Users/username/.ssh/id_boot2docker -N -L 5000:localhost:5000 root@your-registry.com &" &
    
    # Wait to make sure the SSH tunnel is open before pushing...
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

如果你不理解这其中的含义，请先仔细阅读这部分[part 2][9]。

给脚本加上执行权限。

### 使用rake将以上所有绑定 ###

现在的情况是，每次你想要部署你的应用时，你都需要单独运行这三个脚本。

1. clean
1. build
1. deploy / push

这一点都不费工夫，可是事实上开发者比你想象的要懒得多！那么咱们就索性再懒一点！

我们最后再把工作好好整理一番，我们现在要将三个脚本捆绑在一起，通过rake。

为了更简单一点，你可以在工程根目录下已经存在的Rakefile中添加几行代码，打开Rakefile文件——pun intended——把下列内容粘贴进去。


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

接下来就是见证奇迹的时刻了。一旦映像文件被上传（第一次可能花费较长的时间），你就可以ssh登录产品服务器，并且（通过SSH管道）把docker映像拉取到服务器并运行了。多么简单！

也许你需要一段时间来习惯，但是一旦成功，它几乎与用Heroku部署一样简单。

备注：像往常一样，请让我了解到你的意见。我不敢保证这种方法是最好，最快，或者最安全的Docker开发的方法，但是这东西对我们确实奏效。

- 确保**boot2docker**已经启动并在运行当中。
- 如果你不了解你的boot2docker虚拟地址，输入` $ boot2docker ip`命令查看。
- 点击[here][10]，教你怎样搭建私有的registry。

--------------------------------------------------------------------------------

via: http://cocoahunter.com/2015/01/23/docker-3/

作者：[Michelangelo Chasseur][a]
译者：[DongShuaike](https://github.com/DongShuaike)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://cocoahunter.com/author/michelangelo/
[1]:http://cocoahunter.com/docker-1
[2]:http://cocoahunter.com/2015/01/23/docker-2/
[3]:http://localhost:3000/
[4]:https://gist.github.com/chasseurmic/0dad4d692ff499761b20
[5]:http://localhost:5000/
[6]:http://192.168.59.103:3000/
[7]:http://cocoahunter.com/2015/01/23/docker-3/#fn:1
[8]:http://cocoahunter.com/2015/01/23/docker-3/#fn:2
[9]:http://cocoahunter.com/2015/01/23/docker-2/
[10]:http://cocoahunter.com/2015/01/23/docker-2/
