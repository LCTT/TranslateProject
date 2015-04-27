Setting up a private Docker registry
搭建一个私有的Docker registry
================================================================================
![](http://cocoahunter.com/content/images/2015/01/docker2.jpg)

[TL;DR] This is the second post in a series of 3 on how my company moved its infrastructure from PaaS to Docker based deployment.
这是系列的第二篇文章，这系列讲述了我的公司如何把基础服务从PaaS迁移到Docker上

- [First part][1]: where I talk about the process we went thru before approaching Docker;
- 第一篇文章里我谈到了接触Docker之前的经历；
- [Third pard][2]: where I show how to automate the entire process of building images and deploying a Rails app with Docker.
- 第三篇文章里我展示如何使创建images的过程自动化以及如何用Docker部署一个Rails应用。

----------

Why would you want ot set up a provate registry? Well, for starters, Docker Hub only allows you to have one free private repo. Other companies are beginning to offer similar services, but they are all not very cheap. In addition, if you need to deploy production ready applications built with Docker, you might not want to publish those images on the public Docker Hub.

你为什么想要搭建一个私有的registry呢？嗯，Docker Hub（一个Docker公共仓库）只允许你拥有一个免费的私有版本库（repo）。其他的公司提供类似服务，但是价格可不便宜。另外，如果你需要部署一个基于Docker的应用产品，恐怕你不希望这些images在开放的Docker Hub被公开吧！
This is a very pragmatic approach to dealing with the intricacies of setting up a private Docker registry. For the tutorial we will be using a small 512MB instance on DigitalOcean (from now on DO). I also assume you already know the basics of Docker since I will be concentrating on some more complicated stuff.

这篇文章提供了一个非常务实的方法来处理搭建私有Docke registry时出现的各种错综复杂的情况。我们将会使用一个运行于DigitalOcean（之后简称为DO）的非常小巧的512MB实例。并且我会假定你已经了解了Docker的基本概念，因为我必须集中精力在复杂的事情上！
### Local set up ###

###本地搭建###
First of all you need to install **boot2docker** and docker CLI. If you already have your basic Docker environment up and running, you can just skip to the next section.

首先你需要安装**boot2docker**以及docker CLI。如果你已经搭建好了基本的Docker环境，你可以直接跳过这一步。
From the terminal run the following command[1][3]:

从终端运行以下命令[1][3]:
    brew install boot2docker docker  

If everything is ok[2][4], you will now be able to start the VM inside which Docker will run with the following command:

如果一切顺利[2][4]，你现在将能够启动VM，在VM当中输入下列命令：
    boot2docker up  

Follow the instructions, copy and paste the export commands that boot2docker will print in the terminal. If you now run `docker ps` you should be greeted by the following line
按照说明，复制粘贴book2docker打印在终端的export命令。现在运行`docker ps`命令，终端将有以下显示。

    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES  

Ok, Docker is ready to go. This will be enough for the moment. Let's go back to setting up the registry.
好了，Docker已经准备就绪。我们回过头去搭建registry。

### Creating the server ###
###创建服务器###
Log into you DO account and create a new Droplet by selecting an image with Docker pre-installed[^n].
登录进你的DO账号，选择一个提前安装好Docker的映像文件，创建一个新的Drople。

![](http://cocoahunter.com/content/images/2015/01/Screenshot-2015-01-20-18-26-14.png)

You should receive your root credentials via email. Log into your instance and run `docker ps` to see if eveything is ok.

你将会以邮件的方式收到一个根用户凭证。登录进去，然后运行`docker ps`命令来查看系统状态。
### Setting up AWS S3 ###
### 搭建AWS S3 ###

We are going to use Amazon Simple Storage Service (S3) as the storage layer for our registry / repository. We will need to create a bucket and user credentials to allow our docker container accessing it.
我们现在将使用Amazo Simple Storage Service（S3）作为我们registry/repository的存储层。我们讲需要创建一个桶(bucket)以及用户凭证（user credentials）来允许我们的docker容器访问它。
Login into your AWS account (if you don't have one you can set one up at [http://aws.amazon.com/][5]) and from the console select S3 (Simple Storage Service). 

登录到我们的AWS账号（如果没有，就申请一个[http://aws.amazon.com/][5]），在控制台选择S3（Simpole Storage Service）

![](http://cocoahunter.com/content/images/2015/01/Screenshot-2015-01-20-19-29-21.png)

Click on **Create Bucket**, enter a unique name for your bucket (and write it down, we're gonna need it later), then click on **Create**. 

点击 **Create Bucket**，为你的桶输入一个名字（把它写下来，我们一会需要用到它），然后点击**Create**。

![](http://cocoahunter.com/content/images/2015/01/Screenshot-2015-01-20-19-22-50.png)

That's it! We're done setting up the storage part.

OK!我们已经搭建好存储部分了。

### Setup AWS access credentials ###
### 安装AWS访问凭证###

We are now going to create a new user. Go back to your AWS console and select IAM (Identity & Access Management). 

我们现在将要创建一个新的用户。退回到AWS控制台然后选择IAM（Identity & Access Management)。

![](http://cocoahunter.com/content/images/2015/01/Screenshot-2015-01-20-19-29-08.png)

In the dashboard, on the left side of the webpage, you should click on Users. Then select **Create New Users**.

在dashboard的左边，点击Users。然后选择 **Create New Users**。

You should be presented with the following screen: 

如图所示：

![](http://cocoahunter.com/content/images/2015/01/Screenshot-2015-01-20-19-31-42.png)

Enter a name for your user (e.g. docker-registry) and click on Create. Write down (or download the csv file with) your Access Key and Secret Access Key that we'll need when running the Docker container. Go back to your users list and select the one you just created.

输入你的用户名（例如 docker-registry）然后点击Create。写下（或者下载csv文件）你的Access Key以及Secret Access Key。回到你的用户列表然后选择你刚刚创建的用户。
Under the Permission section, click on Attach User Policy. In the next screen, you will be presented with multiple choices: select Custom Policy.

在Permission section下面，点击Attach User Policy。之后，选择Custom Policy。

![](http://cocoahunter.com/content/images/2015/01/Screenshot-2015-01-20-19-41-21.png)

Here's the content of the custom policy:
custom policy的内容如下：

    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "SomeStatement",
          "Effect": "Allow",
          "Action": [
            "s3:*"
          ],
          "Resource": [
            "arn:aws:s3:::docker-registry-bucket-name/*",       
            "arn:aws:s3:::docker-registry-bucket-name"
          ]
        }
      ]
    }

This will allow the user (i.e. the registry) to manage (read/write) content on the bucket (make sure to use the bucket name you previously defined when setting up AWS S3). To sum it up: when you'll be pushing Docker images from your local machine to your repository, the server will be able to upload them to S3.

### Installing the registry ###

Now let's head back to our DO server and SSH into it. We are going to use[^n] one of the [official Docker registry images][6]. 

Let's start our registry with the following command: 

    docker run \  
             -e SETTINGS_FLAVOR=s3 \
             -e AWS_BUCKET=bucket-name \
             -e STORAGE_PATH=/registry \
             -e AWS_KEY=your_aws_key \
             -e AWS_SECRET=your_aws_secret \
             -e SEARCH_BACKEND=sqlalchemy \
             -p 5000:5000 \
             --name registry \
             -d \
             registry

Docker should pull the required fs layers from the Docker Hub and eventually start the daemonised container.

### Testing the registry ###

If everything worked out, you should now be able to test the registry by pinging it and by searching its content (though for the time being it's still empty).

Our registry is very basic and it does not provide any means of authentication. Since there are no easy ways of adding authentication (at least none that I'm aware of that are easy enough to implment in order to justify the effort), I've decided that the easiest way of querying / pulling / pushing the registry is an unsecure (over HTTP) connection tunneled thru SSH.

Opening an SSH tunnel from your local machine is straightforward:

    ssh -N -L 5000:localhost:5000 root@your_registry.com

The command is tunnelling connections over SSH from port 5000 of the registry server (which is the one we exposed with the `docker run` command in the previous paragraph) to port 5000 on the localhost.

If you now browse to the following address [http://localhost:5000/v1/_ping][7] you should get the following very simple response

    {}

This just means that the registry is working correctly. You can also list the whole content of the registry by browsing to [http://localhost:5000/v1/search][8] that will get you a similar response:

    {
      "num_results": 2,
      "query": "",
      "results": [
        {
          "description": "",
          "name": "username/first-repo"
        },
        {
          "description": "",
          "name": "username/second-repo"
        }
      ]
    }

### Building an image ###

Let's now try and build a very simple Docker image to test our newly installed registry. On your local machine, create a Dockerfile with the following content[^n]:

    # Base image with ruby 2.2.0
    FROM ruby:2.2.0
    
    MAINTAINER Michelangelo Chasseur <michelangelo.chasseur@touchwa.re>  

...and build it:

    docker build -t localhost:5000/username/repo-name .  

The `localhost:5000` part is especially important: the first part of the name of a Docker image will tell the `docker push` command the endpoint towards which we are trying to push our image. In our case, since we are connecting to our remote private registry via an SSH tunnel, `localhost:5000` represents exactly the reference to our registry.

If everything works as expected, when the command returns, you should be able to list your newly created image with the `docker images` command. Run it and see it for yourself.

### Pushing to the registry ###

Now comes the trickier part. It took a me a while to realize what I'm about to describe, so just be patient if you don't get it the first time you read and try to follow along. I know that all this stuff will seem pretty complicated (and it would be if you didn't automate the process), but I promise in the end it will all make sense. In the next post I will show a couple of shell scripts and Rake tasks that will automate the whole process and will let you deploy a Rails to your registry app with a single easy command.

The docker command you are running from your terminal is actually using the boot2docker VM to run the containers and do all the magic stuff. So when we run a command like `docker push some_repo` what is actually happening is that it's the boot2docker VM that is reacing out for the registry, not our localhost.

This is an extremely important point to understand: in order to push the Docker image to the remote private registry, the SSH tunnel needs to be established from the boot2docker VM and not from your local machine. 

There are a couple of ways to go with it. I will show you the shortest one (which is not probably the easiest to understand, but it's the one that will let us automate the process with shell scripts).

First of all though we need to sort one last thing with SSH.

### Setting up SSH ###

Let's add our boot2docker SSH key to our remote server (registry) known hosts. We can do so using the ssh-copy-id utility that you can install with the following command shouldn't you already have it:

    brew install ssh-copy-id  

Then run: 

    ssh-copy-id -i /Users/username/.ssh/id_boot2docker root@your-registry.com  

Make sure to substitute `/Users/username/.ssh/id_boot2docker` with the correct path of your ssh key.

This will allow us to connect via SSH to our remote registry without being prompted for the password.

Finally let's test it out:

    boot2docker ssh "ssh -o 'StrictHostKeyChecking no' -i /Users/michelangelo/.ssh/id_boot2docker -N -L 5000:localhost:5000 root@registry.touchwa.re &" &  

To break things out a little bit:

- `boot2docker ssh` lets you pass a command as a parameter that will be executed by the boot2docker VM;
- the final `&` indicates that we want our command to be executed in the background;
- `ssh -o 'StrictHostKeyChecking no' -i /Users/michelangelo/.ssh/id_boot2docker -N -L 5000:localhost:5000 root@registry.touchwa.re &` is the actual command our boot2docker VM will run; 
    - the `-o 'StrictHostKeyChecking no'` will make sure that we are not prompted with security questions;
    - the `-i /Users/michelangelo/.ssh/id_boot2docker` indicates which SSH key we want our VM to use for authentication purposes (note that this should be the key you added to your remote registry in the previous step);
    - finally we are opening a tunnel on mapping port 5000 to localhost:5000.

### Pulling from another server ###

You should now be able to push your image to the remote registry by simply issuing the following command:

    docker push localhost:5000/username/repo_name  

In the [next post][9] we'll se how to automate some of this stuff and we'll containerize a real Rails application. Stay tuned!

P.S. Please use the comments to let me know of any inconsistencies or fallacies in my tutorial. Hope you enjoyed it!

1. I'm also assuming you are running on OS X.
1. For a complete list of instructions to set up your docker environment and requirements, please visit [http://boot2docker.io/][10]
1. Select Image > Applications > Docker 1.4.1 on 14.04 at the time of this writing.
1. [https://github.com/docker/docker-registry/][11]
1. This is just a stub, in the next post I will show you how to bundle a Rails application into a Docker container.

--------------------------------------------------------------------------------

via: http://cocoahunter.com/2015/01/23/docker-2/

作者：[Michelangelo Chasseur][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://cocoahunter.com/author/michelangelo/
[1]:http://cocoahunter.com/2015/01/23/docker-1/
[2]:http://cocoahunter.com/2015/01/23/docker-3/
[3]:http://cocoahunter.com/2015/01/23/docker-2/#fn:1
[4]:http://cocoahunter.com/2015/01/23/docker-2/#fn:2
[5]:http://aws.amazon.com/
[6]:https://registry.hub.docker.com/_/registry/
[7]:http://localhost:5000/v1/_ping
[8]:http://localhost:5000/v1/search
[9]:http://cocoahunter.com/2015/01/23/docker-3/
[10]:http://boot2docker.io/
[11]:https://github.com/docker/docker-registry/
