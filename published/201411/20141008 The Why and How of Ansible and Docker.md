Ansible和Docker的作用和用法
================================================================================
在 [Docker][1] 和 [Ansible][2] 的技术社区内存在着很多好玩的东西，我希望在你阅读完这篇文章后也能像我们一样热爱它们。当然，你也会收获一些实践知识，那就是如何通过部署 Ansible 和 Docker 来为 Rails 应用搭建一个完整的服务器环境。

也许有人会问：你怎么不去用 Heroku？首先，我可以在任何供应商提供的主机上运行 Docker 和 Ansible；其次，相比于方便性，我更偏向于喜欢灵活性。我可以在这种组合中运行任何程序，而不仅仅是 web 应用。最后，我骨子里是一个工匠，我非常了解如何把零件拼凑在一起工作。Heroku 的基础模块是 Linux Container，而 Docker 表现出来的多功能性也是基于这种技术。事实上，Docker 的其中一个座右铭是：容器化是新虚拟化技术。

### 为什么使用 Ansible？ ###

我重度使用 Chef 已经有4年了（LCTT：Chef 是与 puppet 类似的配置管理工具），**基础设施即代码**的观念让我觉得非常无聊。我花费大量时间来管理代码，而不是管理基础设施本身。不论多小的改变，都需要相当大的努力来实现它。使用 [Ansible][3]，你可以一手掌握拥有可描述性数据的基础架构，另一只手掌握不同组件之间的交互作用。这种更简单的操作模式让我把精力集中在如何将我的技术设施私有化，提高了我的工作效率。与 Unix 的模式一样，Ansible 提供大量功能简单的模块，我们可以组合这些模块，达到不同的工作要求。

除了 Python 和 SSH，Ansible 不再依赖其他软件，在它的远端主机上不需要部署代理，也不会留下任何运行痕迹。更厉害的是，它提供一套内建的、可扩展的模块库文件，通过它你可以控制所有的一切：包管理器、云服务供应商、数据库等等等等。

### 为什么要使用 Docker？ ###

[Docker][4] 的定位是：提供最可靠、最方便的方式来部署服务。这些服务可以是 mysqld，可以是 redis，可以是 Rails 应用。先聊聊 git 吧，它的快照功能让它可以以最有效的方式发布代码，Docker 的处理方法与它类似。它保证应用可以无视主机环境，随心所欲地跑起来。

一种最普遍的误解是人们总是把 Docker 容器看成是一个虚拟机，当然，我表示理解你们的误解。Docker 满足[单一功能原则][5]，在一个容器里面只跑一个进程，所以一次修改只会影响一个进程，而这些进程可以被重用。这种模型参考了 Unix 的哲学思想，当前还处于试验阶段，并且正变得越来越稳定。

### 设置选项 ###

不需要离开终端，我就可以使用 Ansible 来在这些云平台中生成实例：Amazon Web Services，Linode，Rackspace 以及 DigitalOcean。如果想要更详细的信息，我于1分25秒内在位于阿姆斯特丹的2号数据中心上创建了一个 2GB 的 DigitalOcean 虚拟机。另外的1分50秒用于系统配置，包括设置 Docker 和其他个人选项。当我完成这些基本设定后，就可以部署我的应用了。值得一提的是这个过程中我没有配置任何数据库或程序开发语言，Docker 已经帮我把应用所需要的事情都安排好了。

Ansible 通过 SSH 为远端主机发送命令。我保存在本地 ssh 代理上面的 SSH 密钥会通过 Ansible 提供的 SSH 会话分享到远端主机。当我把应用代码从远端 clone 下来，或者上传到远端时，我就不再需要提供 git 所需的证书了，我的 ssh 代理会帮我通过 git 主机的身份验证程序的。

### Docker 和应用的依赖性 ###

我发现有一点挺有意思的：大部分开发者非常了解他们的应用需要什么版本的编程语言，这些语言依赖关系有多种形式：Python 的包、Ruby 的打包系统 gems、node.js 的模块等等，但与数据库或消息队列这种重要的概念相比起来，这些语言就处于很随便的境地了——随便给我个编程语言环境，我都能把数据库和消息队列系统跑起来。我认为这是 DevOps 运动（它旨在促进开发与运维团队的和谐相处）的动机之一，开发者负责搭建应用所需要的环境。Docker 使这个任务变得简单明了直截了当，它为现有环境加了实用的一层配置。

我的应用依赖于 MySQL 5.5和 Redis 2.8，依赖关系放在“.docker_container_dependencies”文件里面：

    gerhard/mysql:5.5
    gerhard/redis:2.8

Ansible 会查看这个文件，并且通知 Docker 加载正确的镜像，然后在容器中启动。它还会把这些服务容器链接到应用容器。如果你想知道 Docker 容器的链接功能是怎么工作的，可以参考[Docker 0.6.5 发布通知][6].

我的应用包括一个 Dockerfile，它详细指定了 Ruby Docker 镜像的信息，这里面的步骤能够保证把正确的 Ruby 版本加载到镜像中。

    FROM howareyou/ruby:2.0.0-p353
    
    ADD ./ /terrabox
    
    RUN \
      . /.profile ;\
      rm -fr /terrabox/.git ;\
      cd /terrabox ;\
      bundle install --local ;\
      echo '. /.profile && cd /terrabox && RAILS_ENV=test bundle exec rake db:create db:migrate && bundle exec rspec' > /test-terrabox ;\
      echo '. /.profile && cd /terrabox && export RAILS_ENV=production && rake db:create db:migrate && bundle exec unicorn -c config/unicorn.rails.conf.rb' > /run-terrabox ;\
    # END RUN
    
    ENTRYPOINT ["/bin/bash"]
    CMD ["/run-terrabox"]
    
    EXPOSE 3000

第一步是复制应用的所有代码到 Docker 镜像，加载上一个镜像的全局环境变量。这个例子中的 Ruby Docker 镜像会加载 PATH 配置，这个配置能确保镜像加载正确的 Ruby 版本。

接下来，删除 git 历史，Docker 容器不需要它们。我安装了所有 Ruby 的 gems，创建一个名为“/test-terrabox”的命令，这个命令会被名为“test-only”的容器执行。这个步骤的目的是能正确解决应用和它的依赖关系，让 Docker 容器正确链接起来，保证在真正的应用容器启动前能通过所有测试项目。

CMD 这个步骤是在新的 web 应用容器启动后执行的。在测试环节结束后马上就执行`/run-terrabox`命令进行编译。

最后，Dockerfile 为应用指定了一个端口号，将容器内部端口号为3000的端口映射到主机（运行着 Docker 的机器）的一个随机分配的端口上。当 Docker 容器里面的应用需要响应来自外界的请求时，这个端口可用于反向代理或负载均衡。

### Docker 容器内运行 Rails 应用 ###

没有本地 Docker 镜像，从零开始部署一个中级规模的 Rails 应用大概需要100个 gems，进行100次整体测试，在使用2个核心实例和2GB内存的情况下，这些操作需要花费8分16秒。装上 Ruby、MySQL 和 Redis Docker 镜像后，部署应用花费了4分45秒。另外，如果从一个已存在的主应用镜像编译出一个新的 Docker 应用镜像出来，只需花费2分23秒。综上所述，部署一套新的 Rails 应用，解决其所有依赖关系（包括 MySQL 和 Redis），只需花我2分钟多一点的时间就够了。

需要指出的一点是，我的应用上运行着一套完全测试套件，跑完测试需要花费额外1分钟时间。尽管是无意的，Docker 可以变成一套简单的持续集成环境，当测试失败后，Docker 会把“test-only”这个容器保留下来，用于分析出错原因。我可以在1分钟之内和我的客户一起验证新代码，保证不同版本的应用之间是完全隔离的，同操作系统也是隔离的。传统虚拟机启动系统时需要花费好几分钟，Docker 容器只花几秒。另外，一旦一个 Dockedr 镜像编译出来，并且针对我的某个版本的应用的测试都被通过，我就可以把这个镜像提交到一个私有的 Docker Registry 上，可以被其他 Docker 主机下载下来并启动一个新的 Docker 容器，而这不过需要几秒钟时间。

### 总结 ###

Ansible 让我重新看到管理基础设施的乐趣。Docker 让我有充分的信心能稳定处理应用部署过程中最重要的步骤——交付环节。双剑合璧，威力无穷。

从无到有搭建一个完整的 Rails 应用可以在12分钟内完成，这种速度放在任何场合都是令人印象深刻的。能获得一个免费的持续集成环境，可以查看不同版本的应用之间的区别，不会影响到同主机上已经在运行的应用，这些功能强大到难以置信，让我感到很兴奋。在文章的最后，我只希望你能感受到我的兴奋！

我在2014年1月伦敦 Docker 会议上讲过这个主题，[已经分享到 Speakerdeck][7]了。

如果想获得更多的关于 Ansible 和 Docker 的内容，请订阅 [changlog 周报][8]，它会在每周六推送一周最有价值的关于这两个主题的新闻链接。

如果你想为我们的 Changlog 写一篇文章，请[使用 Draft repo][9]，他们会帮到你的。

下次见，[Gerhard][a]。

--------------------------------------------------------------------------------

via: http://thechangelog.com/ansible-docker/

作者：[Gerhard Lazu][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://twitter.com/gerhardlazu
[1]:https://www.docker.io/
[2]:https://github.com/ansible/ansible
[3]:http://ansible.com/
[4]:http://docker.io/
[5]:http://en.wikipedia.org/wiki/Single_responsibility_principle
[6]:http://blog.docker.io/2013/10/docker-0-6-5-links-container-naming-advanced-port-redirects-host-integration/
[7]:https://speakerdeck.com/gerhardlazu/ansible-and-docker-the-path-to-continuous-delivery-part-1
[8]:http://thechangelog.com/weekly/
[9]:https://github.com/thechangelog/draft
