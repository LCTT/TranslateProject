如何为安卓开发搭建一个持续集成（CI）服务器
============================================================

我最近买了新 MacBook Pro 作为我的主要的安卓开发机，我的老式的 MacBookPro（13 寸，2011 年后期发布，16GB 内存， 500G 的固态硬盘，内核是 i5，主频 2.4GHz，64 位），我也没卖，我清理了它，并把他变成了一个 MacOS 和Ubuntu 双引导的持续集成（CI）服务器。

写这篇文章我主要想总结一下安装步骤，好给自己以后作参考，当然，这篇文章也是给同行看的，只要他们感兴趣。好了，现在开始：

1. 配置一个新的 Ubuntu ，以便运行 Android SDK。
2. 安装 Jenkins CI 服务来拉取、编译、运行测试托管在 Github 的多模块 Android 项目。
3. 安装 Docker 并在容器中运行 MySQL 服务器和 SonarQube。来运行由 Jenkins 触发的静态代码分析。
4. Android app  配置需求。

### 第一步－安装 Ubuntu：

我将使用 Ubuntu 作为持续集成的 SO，因为 Ubuntu 有一个强大的社区，它可以解决你遇到的任何问题，而且我个人推荐总是使用 LTS 版本，当前是  16.04 LTS。已经有很多教程教大家在各种硬件上怎么安装了，我就不废话了，贴个下载链接就行了。

- [下载 Ubuntu Desktop 16.04 LTS][1]

有人可能很奇怪：用什么桌面版，服务器版多好。额，这个嘛，萝卜青菜，各有所爱。我倒不在乎 UI 占用的那点运算资源。相反，用那一点资源换来生产力的提升我觉得挺值的。

### 第二步－远程管理：

#### SSH 服务器

Ubuntu 桌面版默认安装并没有 ssh 服务器，所以你想远程通过命令行管理的话就只好自己安装。

```
$ sudo apt-get install openssh-server
```

#### NoMachine 远程桌面

可能你的持续集成服务器没有挨着你，而是在你的路由器后面，或者其它屋子，甚至还可能远离你数里。我试过各种远程桌面方案，不得不说，IMHO NoMachine 在这方面表现的最好，它只需要你的 ssh 证书就可以工作了（显然你要先把它安装在 CI 和你的机器中）。

- [NoMachine - 任何人都能用的免费的远程访问工具][3]

### 第三步－配置环境：

这里我打算安装 Java8，Git，和 Android SDK，Jenkins 需要它们来拉取、编译和运行 android 项目。

#### SDKMAN!

这个超级厉害的命令行工具让你可以安装各种流行的 SDK（比如说，Gradle、Groovy、Grails、Kotlin、 Scala……），并可以以容易方便的方式列出它们和在各个并行版本中切换。

- [SDKMAN! - SDK 管理器][5]

它们最近又增加了对 JAVA8 的支持，所以我使用它来安装 Java，而是用流行的 webupd8 仓库。所以在你安装开始前，务必要想清你要不要安装 SDKMAN，话说回来，最好还是装上，因为我们以后应该会用到。

安装 SDKMAN! 很容易，执行以下命令即可：

```
$ curl -s "https://get.sdkman.io" | bash
```

#### Oracle JAVA8

因为我们已经安装了 SDKMAN! ，所以安装 JAVA8 就相当简单了：

```
$ sdk install java
```

或者使用 webupd8 这个仓库：

- [在 Ubuntu 或 Linux Mint 上通过 PPA 仓库安装 Oracle Java 8 [JDK8]][6]

#### Git:

安装git的命令也非常直观，就不废话了。

```
$ sudo apt install git
```

#### Android SDK

这下面这篇文章的底部

- [下载 Android Studio 和 SDK Tools | Android Studio][8]

你可以找到 “Get just the command line tools” 等字样，复制这个链接。比如：

```
https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
```

下载，然后解压到 `/opt/android-sdk-linux` 下：

```
$ cd /opt
$ sudo wget https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
$ sudo unzip tools_r25.2.3-linux.zip -d android-sdk-linux
```

我们使用 root 用户创建了该目录，所以我们需要重新授权来使我们的主要用户对它可读可写。

```
$ sudo chown -R YOUR_USERNAME:YOUR_USERNAME android-sdk-linux/
```

然后，在 `~/.bashrc` 文件下设置 SDK 的环境变量

```
$ cd
$ nano .bashrc
```

在文件底部写入这些行（注意，但要在 SDKMAN! 配置文件前）:

```
export ANDROID_HOME="/opt/android-sdk-linux"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
```

关闭此终端，再打开一个新的终端看看环境变量是否正确生效：

```
$ echo $ANDROID_HOME
/opt/android-sdk-linux
```

然后我们启动图形界面的 Android SDK 管理器，并安装你所需的平台和依赖：
```
$ android
```

 ![](https://cdn-images-1.medium.com/max/1000/1*Q4o_LpfC5A3evFUwd62MOQ.png) 
 
*运行 Android SDK Manager 的图形交互界面*


### 第四步－Jenkins 服务器

这里，我要讲讲怎么安装、配置该服务器，并创建 Jenkin 任务来拉取、构建和测试 Android 项目，并怎样获取控制台输出。

#### 安装 Jenkins

你可以在下面的链接找到 Jenkins 服务器相关信息：

- [Jenkins][12]

我们有许多办法运行 Jenkins，比如说运行 .war 文件，作为 Linux 服务，作为 Docker 容器等等。

我起初是想把它当做 Docker 容器运行，但是后来我意识到正确地配置代码文件夹、android-sdk 文件夹的可见性，和插到运行的 Android 测试机上的物理设备的 USB 可见性简直是一场噩梦。

少操点心，我最终决定以服务的方式，增加 Stable 仓库的 key 来通过 apt 安装和更新。

```
$ wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
```

编辑 `source.list`，写入这一行：

```
$ sudo nano /etc/apt/sources.list
```

```
#Jenkin Stable
deb https://pkg.jenkins.io/debian-stable binary/
```

然后安装：

```
sudo apt-get update
sudo apt-get install jenkins
```

在你的用户组里面增加 `jenkins` ，允许其读写 Android SDK 文件夹。

```
$ sudo usermod -a -G 你的用户组 jenkins
```

Jenkins 服务在开机引导时就会被启动，并可通过 http://localhost:8080 访问：

安装完毕会有一些安全预警信息，跟着引导程序走，你的 Jenkins 就会运行了。

 ![](https://cdn-images-1.medium.com/max/1000/1*gN6-ncU7mRdQWL3wmlS_5g.png)
 
*启用安装成功的 Jenkins 服务器。*

#### Jenkins 配置

启用成功后，会有提示程序提示你安装插件，单击 “Select plugins to Install” 就可以开始浏览所有插件，然后选择你要安装的插件就 OK 了 。

* [JUnit 插件][16]
* [JaCoCo 插件][18]
* [EnvInject 插件][20]
* [GitHub 插件][22]

![](https://cdn-images-1.medium.com/max/1000/1*xvG06qRSCvfw5OQgQleG0A.png)
 
*安装 Jenkins 插件*

创建管理员用户，并完成安装。

要完成安全需要配置环境变量 `ANDROID_HOME`，`JAVA_HOME`。

点击 Manage Jenkins，接着 Configure System。

滚动文件至底部，在全局属性模块中找到环境变量，并增加 `ANDROID_HOMOE`，和 `JAVA_HOME` 变量。


 ![](https://cdn-images-1.medium.com/max/1000/1*rpgkUsqWhkHk4xOKCGPcvw.png) 

*给所有 Jenkins 任务增加全局变量*

#### 创建 Jenkins 任务

一个 Jenkins 任务定义了一系列不间断的操作。如果你跟随本篇引导的话，那么你可以使用我已经在 GitHub 上为你准备了一个 Android 练习项目，你可以使用这个来试试手。它只是一个多模块的 app，带有单元测试、Android 测试，包括 JaCoCo、SonarQube 插件。

- [pamartineza/helloJenkins][24]

首先创建一个新的 Freestyle 任务项目，取名为 `Hello_Android`。不要在名字中使用空格，这样可以避免与 SonarQube 不兼容的问题。

![](https://cdn-images-1.medium.com/max/1000/1*ITE7xIrbsrChWv45PSlPPw.png) 

*创建一个 Freestyle Jenkins 任务*

接下来就是配置了，我给每一部分都做了截屏。

**概况**

这部分比较繁琐，你可以在这里变更任务的名字、增加简介。如果你使用 GitHub 项目，你还可以写下项目的 URL（不要 *.git，这是 url 的部分，不是仓库的）。

![](https://cdn-images-1.medium.com/max/1000/1*7QF2pfgM73FVIWTfQhcbEA.png) 

*项目 Url 配置*

**源代码管理**

这时候我们就要选择我们的 CVS 作为 Git，并且增加仓库的 url（这次就要包括 *.git）然后选择分支拉取。因为这是一个公开的 GitHub 仓库，我们就不需要提交证书了，否则的话就要设置账号和密码。

相比于使用你的带有完全权限的公开仓库，我更倾向于为你的私有库创建一个新的只读用户来专门配给 Jenkins 任务使用。

另外，如果你已经使用了双因子认证，Jenkins 就无法拉取代码，所以为 Jenkins 专门创建一个用户可以直接从私有库中拉取代码。

 ![](https://cdn-images-1.medium.com/max/1000/1*wkzdL70XrCzIpXDsHPA2Pg.png) 

*配置仓库*

**构建触发器**

你可以手动开始构建，也可以远程地、周期性地、或者在另一个任务构建完成之后开始构建，只要这些改变可以被检测到。

最好的情况肯定是一旦你更改了某些地方，就会立刻触发构建事件，Github 为此提供了一个名叫 webhooks 的系统。

- [Webhooks | GitHub 开发者指南][26]

这样，我们就可以配置来发送这些事件到 CI 服务器，然后触发构建。显然，我们的 CI 服务器必须要联网，并且可以与 GitHub 服务器通信。

你的 CI 服务器也许为了安全只限于内网使用，那么解决办法就只有集中周期性的提交。我就是只有工作时才打开 CI，我把它设置为每十五分钟轮询一次。轮询时间可以通过 CRON 语法设置，如果你不熟悉，请点击右侧的帮助按钮获取带有例子的丰富文档。

![](https://cdn-images-1.medium.com/max/1000/1*eONz8DAwJ9PW7uc8VQw7wQ.png) 

*仓库轮询配置*

**构建环境**

这里我推荐设置构建超时来避免 Jenkings 占用内存和 CPU ，毕竟有时候有意外发生。当然，你还可以插入环境变量和密码等等。

![](https://cdn-images-1.medium.com/max/1000/1*Y6FgbIQq8pMk6D72Sr9KdQ.png) 

*构建超时*

**构建**

现在是见证魔法的时刻了，增加一个 Build 步骤，引入 Gradle 脚本，选择 Gradle Wrapper (默认情况下，Android 项目带有 Gradle Wrapper，不要忘记把它检入到 Git ），然后定义你要执行哪些任务：

1. clean：清除之前构建的所有历史输出，这样可以确保没有东西缓存，从头构建。
2. asseembleDebug： 生成调试 .apk 文件。
3. test：在所有模块上执行 JUnit 测试。
4. connectedDebugAndroidTest：在连接到 CI 的实体机上执行安卓测试单元（也可以使用安装了安卓模拟器的 Jenkins 插件，但是它不支持所有型号，而且相当麻烦）。

![](https://cdn-images-1.medium.com/max/1000/1*D0HDPOUYCWzsWKiLv4LrBA.png) 

*配置 Gradle*

**构建后操作**

我们将要增加“发布 JUnit 测试报告”，这一步由 JUnit 插件提供，其搜集由 JUnit 测试结果生成的 XML 文件，它会生成漂亮的图表来按时间展示测试结果。

我们 app 模块中，测试运行结果的路径是： `app/build/test-results/debug/*.xml`。

在多模块项目中，其它的“纯” Java 模块中测试结果在这里：`*/build/test-results/*.xml`。

![](https://cdn-images-1.medium.com/max/1000/1*ZQtamiQ_8PzAFBd-pMfvdg.png) 

还要增加“记录 JaCoCo 覆盖率报告”，它要创建一张显示代码覆盖率的图表。

![](https://cdn-images-1.medium.com/max/1000/1*wKaFykDl0qg-c79QwRTR2w.png) 

#### 运行 Jenkins 任务

只要有任何改变提交到仓库，我们的测试任务将每十五分钟执行一次，但是如果你不想等的话，或者你只是想验证一下配置的改变，你也可以手动运行。单击“现在构建”按钮，当前的构建将出现在构建历史中，点击它可以查看细节。

![](https://cdn-images-1.medium.com/max/1000/1*vKi-BGQ2blimaoTl7PTXtQ.png) 
 
*手动执行任务*

最有趣的部分是控制台输出，你可以看到 Jenkins 是如何拉取代码并执行我们之前定义的 Gradle 项目，例如 clean。

![](https://cdn-images-1.medium.com/max/1000/1*dbtmlSr2owrj_CQfGXjdsw.png) 

*控制台输出的开始部分*

如果一切都正常的话，控制台将会有如下输出 (任何仓库连接问题，单元测试或 Android 测试的失败都将导致构建失败)。

![](https://cdn-images-1.medium.com/max/1000/1*WpOH-aHuuNRDYmY710ecLQ.png) 

*哈哈哈哈，构建成功，测试结果符合预期*

### 第五步－SonarQube

这部分我会讲讲如何安装、配置 SonarQube ，并配以使用 Docker 作为容器的 MySQL 数据库。

- [Continuous Code Quality | SonarQube][28]

SonarQube 是个代码静态分析工具，它可以帮助开发者写出干净的代码、检测错误和学习最佳体验。它还可以跟踪代码覆盖、测试结果、功能需求等等。SonarQube 检测到的问题可以使用插件十分容易的导入到 Android Studion/IntelliJ 中去。

- [JetBrains Plugin Repository :: SonarQube Community Plugin][30]

#### 安装 Docker

安装 Docker 十分容易，按照下面的教程即可：

- [在 Ubuntu 上安装 Docker][32]

#### 生成容器

**MySQL**

我们先搭建一个 MySQL5.7.17 服务器容器，命名为 `mysqlserver`，它将在开机引导时启动，带有一个在你的家目录下的本地卷，带有密码，服务暴露在 localhost:3306 上（把命令中的 `YOUR_USER` 和 `YOUR_MYSQL_PASSWORD` 替换为你自己账号密码）。

```
$ docker run --name mysqlserver --restart=always -v /home/YOUR_USER/mysqlVolume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=YOUR_MYSQL_PASSWORD -p 3306:3306 -d mysql:5.7.17
```

**phpMyAdmin**

想要优雅简单地管理 MySQL服务器，我强烈推荐 phpMyAdmin。你只要建立个容器，命名为 `phpmyadmin`，然后链接到我们的 `mysqlserver` 容器，它会在开机引导时启动，它暴露在 localhost:9090。使用最新的版本。

```
$ docker run --name phpmyadmin --restart=always --link mysqlserver:db -p 9090:80 -d phpmyadmin/phpmyadmin
```

你可以用你的 mysql 密码 `YOUR_MYSQL_PASSWORD` ，以 root 身份登录 localhost:9090 的 phpMyAdmin 界面，并创建一个数据库 sonar，使用`uft8_general_ci` 字符集。此外，也创建一个 sonar 的新用户，密码 `YOUR_SONAR_PASSWORD`，并给它 sonar 数据库的权限。

**SonarQube**

现在我们已经创建好了我们的 SonarQube 容器，就叫 `sonarqube`，它会在机器引导时启动，自动链接搭配我们的数据库，服务暴露在 localhost:9090，使用 5.6.4 版本。

```
$ docker run --name sonarqube --restart=always --link mysqlserver:db -p 9000:9000 -p 9092:9092 -e "SONARQUBE_JDBC_URL=jdbc:mysql://db:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance" -e "SONARQUBE_JDBC_USER=sonar" -e "SONARQUBE_JDBC_PASSWORD=YOUR_SONAR_PASSWORD" -d sonarqube:5.6.4
```

#### 配置 SonarQube

如果一起都正常，你将在 localhost:9000 看到如下页面：

![](https://cdn-images-1.medium.com/max/1000/1*tcgww8PENXdyrLS3K95ZEw.png) 

好了，让我们来配置必要的插件和基本的配置文件：

1. 在页面的右上角可以登录（默认的管理员账号和密码是 admin/admin）。
2. 进入到 Administration，然后点击 System，接下来是 Updata Center，最后是 Updates Only。
	*  如果需要的话，更新 Java 插件。
3. 现在启用，并安装以下插件
	*   Android （提供 Android lint 规则）
	*   Checkstyle
	*   Findbugs
	*   XML
4. 返回顶部，点击重启按钮完成整个安装。

#### SonarQube 配置文件

我们刚刚安装的插件可以定义配置文件，可以用一套规则去衡量项目的代码质量。

同一时间一个项目只能使用一个配置文件。但是我们可以定义父配置文件并继承规则，所以要对我们的项目执行所有的规则，我们可以创建定制的配置文件并链状串联所有配置文件。

就这么干，点击 Quality Profiles ，跳转到 Create ，然后命名，比如 CustomAndroidProfile。

将 Android Lint 作为父级，然后选择 Android Lint 配置，增加 FindBugs Security Minial 作为上一级，继续此步骤，直到你完成父级继承方案，并且设置 CustomAndroidProfile 作为默认。

![](https://cdn-images-1.medium.com/max/1000/1*w2CvH8uAOUcvajzjsOoCgQ.png) 

*继承链*

#### 运行 Sonarqube 分析器

现在我们的 SonarQube 已经正式配置完毕，我们需要添加一个 Gradle 任务 `sonarqube`  到我们的 Jenkins 任务。我们在最后执行。

![](https://cdn-images-1.medium.com/max/1000/1*EDAjalNzmdU-ptjhWzuCcQ.png) 

再次运行 Jenkins 任务，一旦运行完毕，我们可以在 localhost:9090 中看到我们的 sonarQube 控制面板。

![](https://cdn-images-1.medium.com/max/1000/1*n7dKdPXyUPj1AZe6ujL3vw.png) 

*分析结果的显示*

点击项目名称我们可以进入到不同的显示界面，最重要的可能就是问题界面了。

在下一屏，我将展示一个主要问题，它是一个空构造器方法。就我个人而言，使用 SonarQube 最大的好处就是当我点击“...”时可以在屏幕底部显示解释。这是一个学习编程十分有用的技能。

![](https://cdn-images-1.medium.com/max/1000/1*KKM9T2qHzanraAetghYCqg.png) 

### 第六步 附加：配置其他 Android 应用

想要配置 Android 应用得到覆盖率和 sonarqube 的结果，只要安装 JaCoCo 和 Sonarqube 插件就可以了。你也可以在我的示例中得到更多信息

- [pamartineza/helloJenkins][34]

你也可以看看我在云上测试的文章：

- [使用 Jenkins CI 服务器在云设备上运行 Android 测试][36]

### 最后

啊，你终于走到头了，希望你觉得本文有点用处。你要是发现了任何错误，有任何疑问，别迟疑，赶紧评论。我拼了老命也要帮你。哦，忘了提醒，好东西要和朋友分享。

--------------------------------------------------------------------------------

作者简介：

![](https://cdn-images-1.medium.com/fit/c/60/60/0*DQl4jAoi2wXr6S3p.jpg)

Entrepreneur & CEO at GreenLionSoft · Android Lead @MadridMBC & @Shoptimix · Android, OpenSource and OpenData promoter · Runner · Traveller

--------------------------------------------------------------------------------

via: https://medium.com/@pamartineza/how-to-set-up-a-continuous-integration-server-for-android-development-ubuntu-jenkins-sonarqube-43c1ed6b08d3#.x6jhcpg98

作者：[Pablo A. Martínez][a]
译者：[Taylor1024](https://github.com/Taylor1024)
校对：[wxy](https://github.com/wxy)

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
[36]:https://pamartinezandres.com/running-android-tests-on-cloud-devices-using-a-jenkins-ci-server-firebase-test-lab-amazon-device-b67cb4b16c40