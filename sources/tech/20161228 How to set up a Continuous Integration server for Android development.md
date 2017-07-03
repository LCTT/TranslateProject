如何在安卓开发中搭建一个连续集成服务器
============================================================

我最近买了新 MacBook Pro 作为我的安卓开发主力，我的老式的 MacBookPro（2011发布，16GB 500G的固态硬盘，内核是i5，主频4GHz，64位），我也没卖，我打算用它搭建一个连续集成服务器．

写这篇文章我主要想总结一下安装步骤，好给自己以后作参考，当然，这篇文章也是给同行看的，只要他们感兴趣．好了，现在开始：

*	１．让 Ubuntu 成功运行 SDK （Software Development Kit)
*	２．安装 Jenkins CI ，将其作为服务器．这样，我们可以拉取，编译，运行 已经上传到 Github 的 Android 项目
*	３．安装 Docker.我们使用 Docker　来运行
* 	４．Android app　配置需求

### 第一步－安装 Ubuntu：

我个人比较倾向于使用 Ubuntu 作为持续集成中的 SO，怎么说呢，谁让 Ubuntu 的社区热情呢！你问什么都有人回答，这样可轻松不少．我推荐大家用 LTS （长期技术支持）的最新版．已经有很多教程教大家怎么安装了，我就不废话了，贴个下载链接就行了．

[Install Ubuntu Desktop 16.04 LTS][1]

有人可能很奇怪：用什么桌面版，服务器版多好．额，这个嘛，萝卜青菜，各有所爱．我倒不在乎 UI 占用的那点运算资源．相反，用那一点资源换来可用性,我觉得挺值的．

### 第二步－远程管理：

#### SSH 服务器

Ubuntu 桌面版默认安装配置并没有 ssh 服务器，所以你想用的话就只好自己安装．

```
$ sudo apt-get install openssh-server
```

#### 虚拟远程桌面

可能你的持续集成服务器在你的路由器后面，而不是你的工作环境后面，甚至还可能远离你数里．你可以用不同的远程桌面解决，不得不说，IMHO NoMachine在这方面表现的最好，它只需要你的 ssh 证书就可以工作了（显然你要先把它安装在 CI 和你的机器中

[NoMachine - Free Remote Access For Everybody
Free remote access and desktop sharing software. Access your computer to work on files and transfer documents, watch…www.nomachine.com][2][][3]</section>


### 第三步－配置环境：

这里我打算安装 Java8，Git，和 Android SDK

#### SDKMAN!:

有许多超级厉害的命令行工具让你可以安装各种流行的 SDK（软件开发包）比如说，Gradle,Groovy, Grails, Kotlin, Scala...)，这样在各个版本中进行选择就容易,顺手多了．

[SDKMAN! the Software Development Kit Manager
SDKMAN! is a tool for managing parallel versions of multiple Software Development Kits on most Unix based systems. It…sdkman.io][4][][5]

社区最近又增加了对 JAVA8 的支持，所以我不太喜欢烂大街的 webupd8 库，而是更倾向于安装 Java ．在你安装开始前，务必要想清你要不要安装 SDKMAN，话说回来，最好还是装上，因为我们以后应该会用到．

执行以下命令即可安装 SDKMAN

```
$ curl -s "https://get.sdkman.io" | bash
```


#### Oracle JAVA8:

因为我们已经安装了 SDKMAN，所以安装 JAVA8 就相当简单了

```
$ sdk install java
```

Or using the webupd8 repository:
或者使用 webupd8 这个源

[Install Oracle Java 8 In Ubuntu Or Linux Mint Via PPA Repository [JDK8]
Oracle Java 8 is now stable. Below you'll find instructions on how to install it in Ubuntu or Debian via a PPA…www.webupd8.org][6][][7]
Oracle Java 8 不太稳定，在文章底部你可以找到相关指导，教你如何在 Ubuntu 或者 Debian 下通过 PPA 安装．

#### Git:

安装git的命令也非常直观，就不废话了

```
$ sudo apt install git
```


#### Android SDK:

这下面这篇文章的底部

[Download Android Studio and SDK Tools | Android Studio
Download the official Android IDE and developer tools to build apps for Android phones, tablets, wearables, TVs, and…developer.android.com][8][][9]

你可以找到 "Get just the command line tools" 等字样，复制这个链接．比如：

```
https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
```

下载，然后解压到 /opt/android-sdk-linux 下

```
$ cd /opt
```

```
$ sudo wget https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
```

```
$ sudo unzip tools_r25.2.3-linux.zip -d android-sdk-linux
```

我们限定了目录权限为 root，所以想要一般情况下使用，还是要重新授权．

```
$ sudo chown -R YOUR_USERNAME:YOUR_USERNAME android-sdk-linux/
```

然后，在 /.bashr 文件下　增加 SDK 的环境变量

```
$ cd
$ nano .bashrc
```

在底部写入这些行：（注意，但要在 SDKMAN 配置文件前）

```
export ANDROID_HOME="/opt/android-sdk-linux"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
```

关闭此终端，再打开一个看看环境变量是否生效

```
$ echo $ANDROID_HOME
/opt/android-sdk-linux
```

```
$ android
```

 ![](https://cdn-images-1.medium.com/max/1000/1*Q4o_LpfC5A3evFUwd62MOQ.png) 
 
运行 Android SDK Manager 的图形交互界面


### Step 4 _ Jenkins 服务器

这里，我要讲讲怎么安装，配置服务器，并创建可拉取的 Jenkin Jobs,

#### 安装 Jenkins

你可以在下面的链接找到 Jenkins server 相关信息

[Jenkins
Jenkins is an open source automation serverjenkins.io][12][][13]

我们有许多办法运行 Jenkins，比如说Linux服务器下就可以运行 .war 文件，作为 Docker 容器．等等.....

我起初是想把它当做 Docker 容器运行，但是后来我意识到在实体机上配置代码文件夹，android-sdk文件夹和 USB 设备的可见性简直是一场噩梦．

少操点心，我最终决定给它增加 Stable 源当一个服务器用，自动安装，自动更新．

```
$ wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
```

编辑 source.list，写入这一行

```
$ sudo nano /etc/apt/sources.list
```

```
#Jenkin Stable
deb https://pkg.jenkins.io/debian-stable binary/
```

然后安装

```
sudo apt-get update
sudo apt-get install jenkins
```

在用户组里面增加 _jenkins_ ，允许其读写 Android SDK 文件夹

```
$ sudo usermod -a -G YOUR_USERNAME jenkins
```

Jenkins 服务在开机引导时就会被加载到内存，对外默认开放本机 8080 端口

安装完毕会有一些安全预警信息，没什么好讲的，跟着引导程序走，人家说啥你做啥就行了．引导结束，你的 Jenkins就会运行了．

 ![](https://cdn-images-1.medium.com/max/1000/1*gN6-ncU7mRdQWL3wmlS_5g.png)
 
启用安装成功的 Jenkins 服务器．

#### Jenkins 配置

启用成功后，会有提示程序提示你安装插件，单击 "Select plugins to Install"就可以开始浏览所有插件，然后选择你要安装的插件就OK了．

*   JUnit

[JUnit Plugin - Jenkins - Jenkins Wiki
The JUnit plugin provides a publisher that consumes XML test reports generated during the builds and provides some…wiki.jenkins-ci.org][16][][17]

*   JaCoCo

[JaCoCo Plugin - Jenkins - Jenkins Wiki
In order to get the coverage data published to Jenkins, you need to add a JaCoCo publisher and configure it so it will…wiki.jenkins-ci.org][18][][19]

*   EnvInject

[EnvInject Plugin - Jenkins - Jenkins Wiki
Only previous environment variables are available for polling Some plugins provide polling mechanisms (such as SCM…wiki.jenkins-ci.org][20][][21]

*   GitHub plugins

[GitHub Plugin - Jenkins - Jenkins Wiki
This plugin requires that you have an HTTP URL reachable from GitHub, which means it's reachable from the whole…wiki.jenkins-ci.org][22][][23]


 ![](https://cdn-images-1.medium.com/max/1000/1*xvG06qRSCvfw5OQgQleG0A.png)
 
安装 Jenkins 插件

创建管理员用户，并完成安装

配置环境变量 ANDROID_HOME,JAVA_HOME

点击 Manage Jenkins，接着 Configure System

Scroll down and at Global properties section check the Environment variables box and add _ANDROID_HOME_ and _JAVA_HOME_
滚动文件至底部，在全局属性模块中复核环境变量，并增加 _ANDROID_HOMOE_，和_JAVA_HOME_变量


 ![](https://cdn-images-1.medium.com/max/1000/1*rpgkUsqWhkHk4xOKCGPcvw.png) 

给所有 Jenkins 工作(jobs)增加全局变量．

#### 创建 Jenkins Job

一个 Jenkins Job 定义了一系列不间断的操作．如果你跟随本篇引导的话，那么你可以使用我已经在 GitHub 上为你准备了一个 Android 练习项目，你可以使用这个来试试手．它只是一个复合模块的 app,包括多个方面，比如单元测试，Android测试，和 JaCoCo，SonarQube插件．


[pamartineza/helloJenkins
helloJenkins - Hello Jenkins project for CI configuration testgithub.com][24][][25]

首先创建一个新的 Job 项目，取名为 _Hello_Android_．不要使用空格，这样可以避免与 SonarQube 不兼容的问题．


 ![](https://cdn-images-1.medium.com/max/1000/1*ITE7xIrbsrChWv45PSlPPw.png) 

创建一个 Freestyle Jenkins Job

接下来就是配置了，我给每一块都增加了截屏

概况

这部分比较繁琐，你可以在这里变更 Job 的名字，增加简介．如果你使用 GitHub 项目，你还可以写下项目的 URL（不要 *.git，是 web 的 url，不是 repo）


 ![](https://cdn-images-1.medium.com/max/1000/1*7QF2pfgM73FVIWTfQhcbEA.png) 

项目 Url 配置

源代码管理

这时候我们就要选择我们的 CVS 作为 Git，并且增加源的 url（这次就要包括 *.git）然后选择分支拉取.因为这是一个公开的 GitHub 库，我们就不需要提交证书了，否则的话就要设置账号和密码

相比于使用自己的公用仓库我更倾向于创建一个只读的私人仓库专门配给 Jenkins Job 使用

另外，如果你已经使用了 Two-Factor 认证，Jenkins 就无法拉取代码．所以为 Jenkins 专门开启一个库很有必要，这样可以直接从私人库中拉取代码


 ![](https://cdn-images-1.medium.com/max/1000/1*wkzdL70XrCzIpXDsHPA2Pg.png) 

配置仓库

构建 (build) 触发器

你可以手动开始构建,也可以远程，周期性地，或者在另一个 Job　构建完成之后开始构建，只要这些改变可以被检测到．

最好的情况肯定是一旦你更改了某些地方，就会立刻触发构建事件，Github为此提供了名叫 webhooks 的回调函数


[Webhooks | GitHub Developer Guide
Webhooks allow you to build or set up integrations which subscribe to certain events on GitHub.com. When one of those…developer.github.com][26][][27]

这样，我们就可以发送这些事件到 CI 服务器，然后触发构建．显然，我们的 CI 服务器必须要联网，并且可以与 GitHub 服务器通信．

你的 CI 服务器为了安全只限于内网使用，那么解决办法就只有集中周期性的提交．我就是只有工作时才打开 CI，我把它设置为每十五分钟上交一次．集中时间可以通过 CRON 语法设置，如果你不熟悉，请点击案例文件的右侧的帮助按钮．



 ![](https://cdn-images-1.medium.com/max/1000/1*eONz8DAwJ9PW7uc8VQw7wQ.png) 

源的集中配置

构建环境

这里我推荐设置超时模块避免 Jenkings 禁用内存和 CPU ，毕竟有时候有意外发生．当然，你还可以设置环境变量和密码等等．


 ![](https://cdn-images-1.medium.com/max/1000/1*Y6FgbIQq8pMk6D72Sr9KdQ.png) 

构建超时

Build:

神奇的事情发生了，使用 Gradle 脚本，增加 Build 步骤，选择 Gradle Wrapper (默认情况下，Gradle Wrapper 配置了 Android 项目，不要忘记在 Git 上检查一下）然后选择你要执行的任务

1. clean: 清除所有历史输出，这样可以刷新缓存
2. asseembleDebug: 生成调试 .apk 文件 (Android application 文件)
3. test:在所有模块上执行 JUnit 测试文件
4. connectteDebugAndroidTest:在实体机上执行安卓测试单元，连接到 CI (也可以使用安装了 Jenkins 插件的安卓模拟器，但是它不支持所有型号，而且相当麻烦)

 ![](https://cdn-images-1.medium.com/max/1000/1*D0HDPOUYCWzsWKiLv4LrBA.png) 

配置 Gradle 

我们将要增加 JUnit 测试报告．JUnit插件需要这一步，再搜集由 JUnit 测试结果生成的 XML 文件，这样我们就能即时知道测试结果的变化．


这我们 app 模块中，测试运行结果的路径是:

app/build/test-results/debug/*.xml

在其他 "纯净模式" 下，综合模块的测试结果在这里:

*/build/test-results/*.xml


 ![](https://cdn-images-1.medium.com/max/1000/1*ZQtamiQ_8PzAFBd-pMfvdg.png) 


还要增加记录报告，表明将要创建一张显示代码作用域的表单．

 ![](https://cdn-images-1.medium.com/max/1000/1*wKaFykDl0qg-c79QwRTR2w.png) 


#### 运行 Jenkins Job

只要有任何改变提交到仓库，它们就会在十五分钟之内被执行，但是如果你不想等的话，或者你只是想验证一下配置的改变，你也可以手动运行．单击构建按钮，这样你就可以在构建历史中找到它，接着单击就可以了．


 ![](https://cdn-images-1.medium.com/max/1000/1*vKi-BGQ2blimaoTl7PTXtQ.png) 
 
手动执行 Job

最有趣的部分是控制台输出 (console output) 你可以看到 Jenkins 是如何开始执行我们的 Gradle 项目

 ![](https://cdn-images-1.medium.com/max/1000/1*dbtmlSr2owrj_CQfGXjdsw.png) 

控制台输出的开始

你要是做的正确的话，控制台将会有如下输出 (任何源连接问题，测试单元的失败都将导致构建不可用)


 ![](https://cdn-images-1.medium.com/max/1000/1*WpOH-aHuuNRDYmY710ecLQ.png) 

哈哈哈哈，构建成功，测试结果符合预期

### 第五步－SonarQube

这部分我会讲讲如何安装，配置 SonarQube 和使用 Docker 作为容器的 MySQL 数据库

[Continuous Code Quality | SonarQube
The leading open source platform for continuous code qualitywww.sonarqube.org][28][][29]

SonarQube 是个代码静态分析工具，它可以帮助开发者写出干净，优雅的代码．它还可以跟踪代码规模，测试结果，功能需求等等．SonarQube检测到的问题可以使用插件十分容易的导入到 Android Studion/IntelliJ 中去.

[JetBrains Plugin Repository :: SonarQube Community Plugin
Edit descriptionplugins.jetbrains.com][30][][31]</section>


#### 安装 Docker

安装 Docker 十分容易，按照下面的教程即可

[Install Docker on Ubuntu
Instructions for installing Docker on Ubuntudocs.docker.com][32][][33]

#### 生成容器 (Containers)

MySQL:

我们先搭建一个 MySQL5.7.17服务器容器，命名为 _mysqlserver．在你的家目录下建立一个本地文件夹，使用如下命令让服务在开机引导时候就被加载．把命令中的 YOUR_USER 和 YOUR_MYSQL_PASSWORD 替换为你自己账号密码．

```
$ docker run --name mysqlserver --restart=always -v /home/YOUR_USER/mysqlVolume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=YOUR_MYSQL_PASSWORD -p 3306:3306 -d mysql:5.7.17
```


phpMyAdmin:

想要优雅简单地管理 MySQL服务器，我强烈推荐phpMyAdmin．你只要建立个容器，命名为 _phpmyadin，然后指向你的 mysqlserver容器，这样也会在开机引导时加载，你可以在 localhost:9090 找到它．

```
$ docker run --name phpmyadmin --restart=always --link mysqlserver:db -p 9090:80 -d phpmyadmin/phpmyadmin
```

你可以在 localhost:9090 用你的 mysql 密码，以 root 身份登录，然后你需要创建一个数据库，_sonar_with_uft8_general_ci


SonarQube:
现在我们已经创建好了我们的 SonarQube 容器，就叫 sonarqube，它会自启动，自动连接我们的数据库，你可以在 localhost:9090 使用 5.6.4（长期技术支持）版本

```
$ docker run --name sonarqube --restart=always --link mysqlserver:db -p 9000:9000 -p 9092:9092 -e "SONARQUBE_JDBC_URL=jdbc:mysql://db:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance" -e "SONARQUBE_JDBC_USER=sonar" -e "SONARQUBE_JDBC_PASSWORD=YOUR_SONAR_PASSWORD" -d sonarqube:5.6.4
```


#### 配置 SonarQube

如果你配置成功，你将在 localhost:9000 看到如下页面


 ![](https://cdn-images-1.medium.com/max/1000/1*tcgww8PENXdyrLS3K95ZEw.png) 

好了，让我们来配置必要的插件和基本的配置文件

1. 在页面的右上角可以登录（默认的管理员账号和密码是 admin/admin）
2. 进入到管理员 (Administration)，然后点击 System，接下来是 Updata Center，最后是 Updates Only

*   Update Java plugin if necessary

3. 现在启用，并安装以下插件

*   Android (provides Android lint rules)
*   Checkstyle
*   Findbugs
*   XML

4. 返回顶部，点击重启按钮完成整个安装．


#### SonarQube 配置文件

我们刚刚安装的插件可以定义配置文件，这里有一套规则去衡量项目的代码质量

同一时间只有一个项目只能使用一个配置文件．但是我们可以抽象配置文件，让配置的实例集成这些规则（借用 OOP 概念)，所以想在一个项目中灵活地使用配置，我们可以创建个性化配置，约束所有的配置．

就这么干，点击 Quality Profiles ,跳转到 Create ，然后命名，比如 CustomAndroidProfile

将 Android Lint 作为父级，然后选择 Android Lint 配置，增加 FindBugs Security Minial 作为上一级，当你得到父级继承，并且设置 CustomAndroidProfile 作为默认主题的时候，你就完成了．


 ![](https://cdn-images-1.medium.com/max/1000/1*w2CvH8uAOUcvajzjsOoCgQ.png) 


#### 运行 Sonarqube 分析器

现在我们的 SonarQube 已经正式配置完毕，我们需要添加一个 Gradle 任务，_sonarqube_到我们的 Jenkins Job．我们在最后执行.

 ![](https://cdn-images-1.medium.com/max/1000/1*EDAjalNzmdU-ptjhWzuCcQ.png) 

再次运行 Jenkins Job，一旦运行完毕，我们可以在 localhost:9090 中找到我们的 sonarQube 控制面板


 ![](https://cdn-images-1.medium.com/max/1000/1*n7dKdPXyUPj1AZe6ujL3vw.png) 

分析结果的显示

长按项目名称我们可以进入到相应的显示界面，最重要的可能就是问题界面了
我将展示一个空构造方法下的主要问题细节．就我个人而言，使用 SonarQube 最大的好处就是可以显示分析结果．这是一个学习编程十分有用的技能．


 ![](https://cdn-images-1.medium.com/max/1000/1*KKM9T2qHzanraAetghYCqg.png) 


### 第六步　小贴士：配置其他 Android apps

想要配置 Android app 得到 sonarqube　结果，只要安装 JaCoCo和Sonarqube 插件就可以了．你也可以在我的示例中得到更多信息

[pamartineza/helloJenkins
helloJenkins - Hello Jenkins project for CI configuration testgithub.com][34][][35]

### 最后

啊，你终于走到头了，希望你觉得本文有点用处．你要是发现了任何错误，有任何疑问，别迟疑，赶紧评论．我拼了老命也要帮你．哦，忘了提醒，好东西要和朋友分享．

--------------------------------------------------------------------------------

作者简介：

![](https://cdn-images-1.medium.com/fit/c/60/60/0*DQl4jAoi2wXr6S3p.jpg)

Entrepreneur & CEO at GreenLionSoft · Android Lead @MadridMBC & @Shoptimix · Android, OpenSource and OpenData promoter · Runner · Traveller

--------------------------------------------------------------------------------

via: https://medium.com/@pamartineza/how-to-set-up-a-continuous-integration-server-for-android-development-ubuntu-jenkins-sonarqube-43c1ed6b08d3#.x6jhcpg98

作者：[Pablo A. Martínez][a]
译者：[Taylor1024](https://github.com/Taylor1024)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@pamartineza
[1]:https://www.ubuntu.com/download/desktop
[2]:https://www.nomachine.com/download
[3]:https://www.nomachine.com/download
[4]:http://sdkman.io/
[5]:http://sdkman.io/
[6]:http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
[7]:http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
[8]:https://developer.android.com/studio/index.html
[9]:https://developer.android.com/studio/index.html
[10]:https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
[11]:https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
[12]:https://jenkins.io/
[13]:https://jenkins.io/
[14]:https://pkg.jenkins.io/debian-stable/jenkins.io.key
[15]:http://localhost:8080/
[16]:https://wiki.jenkins-ci.org/display/JENKINS/JUnit+Plugin
[17]:https://wiki.jenkins-ci.org/display/JENKINS/JUnit+Plugin
[18]:https://wiki.jenkins-ci.org/display/JENKINS/JaCoCo+Plugin
[19]:https://wiki.jenkins-ci.org/display/JENKINS/JaCoCo+Plugin
[20]:https://wiki.jenkins-ci.org/display/JENKINS/EnvInject+Plugin
[21]:https://wiki.jenkins-ci.org/display/JENKINS/EnvInject+Plugin
[22]:https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin
[23]:https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin
[24]:https://github.com/pamartineza/helloJenkins
[25]:https://github.com/pamartineza/helloJenkins
[26]:https://developer.github.com/webhooks/
[27]:https://developer.github.com/webhooks/
[28]:https://www.sonarqube.org/
[29]:https://www.sonarqube.org/
[30]:https://plugins.jetbrains.com/idea/plugin/7238-sonarqube-community-plugin
[31]:https://plugins.jetbrains.com/idea/plugin/7238-sonarqube-community-plugin
[32]:https://docs.docker.com/engine/installation/linux/ubuntulinux/
[33]:https://docs.docker.com/engine/installation/linux/ubuntulinux/
[34]:https://github.com/pamartineza/helloJenkins
[35]:https://github.com/pamartineza/helloJenkins
