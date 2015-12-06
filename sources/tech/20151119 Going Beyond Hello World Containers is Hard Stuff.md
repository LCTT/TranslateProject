translating by ezio

Going Beyond Hello World Containers is Hard Stuff

================================================================================
In [my previous post][1], I provided the basic concepts behind Linux container technology. I wrote as much for you as I did for me. Containers are new to me. And I figured having the opportunity to blog about the subject would provide the motivation to really learn the stuff.
在[我的上一篇文章里][1]， 我介绍了Linux 容器背后的技术的概念。我写了我知道的一切。容器对我来说也是比较新的概念。我写这篇文章的目的就是鼓励我真正的来学习这些东西。

I intend to learn by doing. First get the concepts down, then get hands-on and write about it as I go. I assumed there must be a lot of Hello World type stuff out there to give me up to speed with the basics. Then, I could take things a bit further and build a microservice container or something.
我打算在使用中学习。首先实践，然后上手并记录下我是怎么走过来的。我假设这里肯定有很多想"Hello World" 这种类型的知识帮助我快速的掌握基础。然后我能够更进一步，构建一个微服务容器或者其它东西。

I mean, it can’t be that hard, right?
我的意思是还会比着更难吗，对吧？

Wrong.
错了。

Maybe it’s easy for someone who spends significant amount of their life immersed in operations work. But for me, getting started with this stuff turned out to be hard to the point of posting my frustrations to Facebook...
可能对某些人来说这很简单，因为他们会耗费大量的时间专注在操作工作上。但是对我来说实际上是很困难的，可以从我在Facebook 上的状态展示出来的挫折感就可以看出了。

But, there is good news: I got it to work! And it’s always nice being able to make lemonade from lemons. So I am going to share the story of how I made my first microservice container with you. Maybe my pain will save you some time.
但是还有一个好消息：我最终让它工作了。而且他工作的还不错。所以我准备分享向你分享我如何制作我的第一个微服务容器。我的痛苦可能会节省你不少时间呢。

If you've ever found yourself in a situation like this, fear not: folks like me are here to deal with the problems so you don't have to!

Let’s begin.
如果你曾经发现或者从来都没有发现自己处在这种境地：像我这样的人在这里解决一些你不需要解决的问题。

让我们开始吧。


### 一个缩略图微服务 ###

The microservice I designed was simple in concept. Post a digital image in JPG or PNG format to an HTTP endpoint and get back a a 100px wide thumbnail.
我设计的微服务在理论上很简单。以JPG 或者PNG 格式在HTTP 终端发布一张数字照片，然后获得一个100像素宽的缩略图。

Here’s what that looks like:
下面是它实际的效果：

![container-diagram-0](https://deis.com/images/blog-images/containers-hard-0.png)

I decide to use a NodeJS for my code and version of [ImageMagick][2] to do the thumbnail transformation.
我决定使用NodeJS 作为我的开发语言，使用[ImageMagick][2] 来转换缩略图。

I did my first version of the service, using the logic shown here:
我的服务的第一版的逻辑如下所示：

![container-diagram-1](https://deis.com/images/blog-images/containers-hard-1.png)

I download the [Docker Toolbox][3] which installs an the Docker Quickstart Terminal. Docker Quickstart Terminal makes creating containers easier. The terminal fires up a Linux virtual machine that has Docker installed, allowing you to run Docker commands from within a terminal.
我下载了[Docker Toolbox][3]，用它安装了Docker 的快速启动终端。Docker 快速启动终端使得创建容器更简单了。终端会启动一个装好了Docker 的Linux 虚拟机，它允许你在一个终端里运行Docker 命令。

In my case, I am running on OS X. But there’s a Windows version too.
虽然在我的例子里，我的操作系统是Mac OS X。但是Windows 下也有相同的工具。

I am going to use Docker Quickstart Terminal to build a container image for my microservice and run a container from that image.
我准备使用Docker 快速启动终端里为我的微服务创建一个容器镜像，然后从这个镜像运行容器。

The Docker Quickstart Terminal runs in your regular terminal, like so:
Docker 快速启动终端就运行在你使用的普通终端里，就像这样：

![container-diagram-2](https://deis.com/images/blog-images/containers-hard-2.png)

###  第一个小问题和第一个大问题###

So I fiddled around with NodeJS and ImageMagick and I got the service to work on my local machine.
所以我用NodeJS 和ImageMagick 瞎搞了一通然后让我的服务在本地运行起来了。

Then, I created the Dockerfile, which is the configuration script Docker uses to build your container. (I’ll go more into builds and Dockerfile more later on.)
然后我创建了Dockerfile，这是Docker 用来构建容器的配置脚本。（我会在后面深入介绍构建和Dockerfile）

Here’s the build command I ran on the Docker Quickstart Terminal:
这是我运行Docker 快速启动终端的命令：

    $ docker build -t thumbnailer:0.1

I got this response:
获得如下回应：

    docker: "build" requires 1 argument.

Huh.
呃。

After 15 minutes I realized: I forgot to put a period . as the last argument!
我估摸着过了15分钟：我忘记了在末尾参数输入一个点`.`。
It needs to be:
正确的指令应该是这样的：

    $ docker build -t thumbnailer:0.1 .

But this wasn’t the end of my problems.
但是这不是我最后一个问题。

I got the image to build and then I typed [the the `run` command][4] on the Docker Quickstart Terminal to fire up a container based on the image, called `thumbnailer:0.1`:
我让这个镜像构建好了，然后我Docker 快速启动终端输入了[`run` 命令][4]来启动容器，名字叫`thumbnailer:0.1`:

    $ docker run -d -p 3001:3000 thumbnailer:0.1

The `-p 3001:3000` argument makes it so the NodeJS microservice running on port 3000 within the container binds to port 3001 on the host virtual machine.
参数`-p 3001:3000` 让NodeJS 微服务在Docker 内运行在端口3000，而在主机上则是3001。

Looks so good so far, right?
到目前卡起来都很好，对吧？

Wrong. Things are about to get pretty bad.
错了。事情要马上变糟了。

I determined the IP address of the virtual machine created by Docker Quickstart Terminal by running the `docker-machine` command:
我指定了在Docker 快速启动中端里用命令`docker-machine` 运行的Docker 虚拟机的ip地址：

    $ docker-machine ip default

This returns the IP address of the default virtual machine, the one that is run under the Docker Quickstart Terminal. For me, this IP address was 192.168.99.100.
这句话返回了默认虚拟机的IP地址，即运行docker 的虚拟机。对于我来说，这个ip 地址是192.168.99.100。

I browsed to http://192.168.99.100:3001/ and got the file upload page I built:
我浏览网页http://192.168.99.100:3001/ ，然后找到了我创建的上传图片的网页：

![container-diagram-3](https://deis.com/images/blog-images/containers-hard-3.png)

I selected a file and clicked the Upload Image button.
我选择了一个文件，然后点击上传图片的按钮。

But it didn’t work.
但是它并没有工作。

The terminal is telling me it can’t find the `/upload` directory my microservice requires.
终端告诉我他无法找到我的微服务需要的`/upload` 目录。

Now, keep in mind, I had been at this for about a day—between the fiddling and research. I’m feeling a little frustrated by this point.
现在开始记住，我已经在此耗费了将近一天的时间－从浪费时间到研究问题。我此时感到了一些挫折感。

Then, a brain spark flew. Somewhere along the line remembered reading a microservice should not do any data persistence on its own! Saving data should be the job of another service.
然后灵光一闪。某人记起来微服务不应该自己做任何数据持久化的工作！保存数据应该是另一个服务的工作。

So what if the container can’t find the `/upload` directory? The real issue is: my microservice has a fundamentally flawed design.

Let’s take another look:

![container-diagram-4](https://deis.com/images/blog-images/containers-hard-4.png)

Why am I saving a file to disk? Microservices are supposed to be fast. Why not do all my work in memory? Using memory buffers will make the "I can’t find no stickin’ directory" error go away and will increase the performance of my app dramatically.

So that’s what I did. And here’s what the plan was:

![container-diagram-5](https://deis.com/images/blog-images/containers-hard-5.png)

Here’s the NodeJS I wrote to do all the in-memory work for creating a thumbnail:

    // Bind to the packages
    var express = require('express');
    var router = express.Router();
    var path = require('path'); // used for file path
    var im = require("imagemagick");
    
    // Simple get that allows you test that you can access the thumbnail process
    router.get('/', function (req, res, next) {
     res.status(200).send('Thumbnailer processor is up and running');
    });
    
    // This is the POST handler. It will take the uploaded file and make a thumbnail from the 
    // submitted byte array. I know, it's not rocket science, but it serves a purpose
    router.post('/', function (req, res, next) {
     req.pipe(req.busboy);
     req.busboy.on('file', function (fieldname, file, filename) {
       var ext = path.extname(filename)
    
       // Make sure that only png and jpg is allowed 
       if(ext.toLowerCase() != '.jpg' && ext.toLowerCase() != '.png'){
         res.status(406).send("Service accepts only jpg or png files");
       }
    
       var bytes = [];
    
       // put the bytes from the request into a byte array 
       file.on('data', function(data) {
         for (var i = 0; i < data.length; ++i) {
           bytes.push(data[i]);
         }
         console.log('File [' + fieldname + '] got bytes ' + bytes.length + ' bytes');
       });
    
       // Once the request is finished pushing the file bytes into the array, put the bytes in 
       // a buffer and process that buffer with the imagemagick resize function
       file.on('end', function() {
         var buffer = new Buffer(bytes,'binary');
         console.log('Bytes  got ' + bytes.length + ' bytes');
    
         //resize
         im.resize({
             srcData: buffer,
             height: 100
         }, function(err, stdout, stderr){
           if (err){
             throw err;
           }
           // get the extension without the period
           var typ = path.extname(filename).replace('.','');
           res.setHeader("content-type", "image/" + typ);
           res.status(200);
           // send the image back as a response
           res.send(new Buffer(stdout,'binary'));
         });
       });
     });
    });
    
    module.exports = router;

Okay, so we’re back on track and everything is hunky dory on my local machine. I go to sleep.

But, before I do I test the microservice code running as standard Node app on localhost...

![Containers Hard](https://deis.com/images/blog-images/containers-hard-6.png)

It works fine. Now all I needed to do was get it working in a container.

The next day I woke up, grabbed some coffee, and built an image—not forgetting to put in the period!

    $ docker build -t thumbnailer:01 .

I am building from the root directory of my thumbnailer project. The build command uses the Dockerfile that is in the root directory. That’s how it goes: put the Dockerfile in the same place you want to run build and the Dockerfile will be used by default.

Here is the text of the Dockerfile I was using:

    FROM ubuntu:latest
    MAINTAINER bob@CogArtTech.com
    
    RUN apt-get update
    RUN apt-get install -y nodejs nodejs-legacy npm
    RUN apt-get install imagemagick libmagickcore-dev libmagickwand-dev
    RUN apt-get clean
    
    COPY ./package.json src/
    
    RUN cd src && npm install
    
    COPY . /src
    
    WORKDIR src/
    
    CMD npm start

What could go wrong?

### The Second Big Problem ###

I ran the `build` command and I got this error:

    Do you want to continue? [Y/n] Abort.
    
    The command '/bin/sh -c apt-get install imagemagick libmagickcore-dev libmagickwand-dev' returned a non-zero code: 1

I figured something was wrong with the microservice. I went back to my machine, fired up the service on localhost, and uploaded a file.

Then I got this error from NodeJS:

    Error: spawn convert ENOENT

What’s going on? This worked the other night!

I searched and searched, for every permutation of the error I could think of. After about four hours of replacing different node modules here and there, I figured: why not restart the machine?

I did. And guess what? The error went away!

Go figure.

### Putting the Genie Back in the Bottle ###

So, back to the original quest: I needed to get this build working.

I removed all of the containers running on the VM, using [the `rm` command][5]:

    $ docker rm -f $(docker ps -a -q)

The `-f` flag here force removes running images.

Then I removed all of my Docker images, using [the `rmi` command][6]:

    $ docker rmi if $(docker images | tail -n +2 | awk '{print $3}')

I go through the whole process of rebuilding the image, installing the container and try to get the microservice running. Then after about an hour of self-doubt and accompanying frustration, I thought to myself: maybe this isn’t a problem with the microservice.

So, I looked that the the error again:

    Do you want to continue? [Y/n] Abort.
    
    The command '/bin/sh -c apt-get install imagemagick libmagickcore-dev libmagickwand-dev' returned a non-zero code: 1

Then it hit me: the build is looking for a Y input from the keyboard! But, this is a non-interactive Dockerfile script. There is no keyboard.

I went back to the Dockerfile, and there it was:

    RUN apt-get update
    RUN apt-get install -y nodejs nodejs-legacy npm
    RUN apt-get install imagemagick libmagickcore-dev libmagickwand-dev
    RUN apt-get clean

The second `apt-get` command is missing the `-y` flag which causes "yes" to be given automatically where usually it would be prompted for.

I added the missing `-y` to the command:

    RUN apt-get update
    RUN apt-get install -y nodejs nodejs-legacy npm
    RUN apt-get install -y imagemagick libmagickcore-dev libmagickwand-dev
    RUN apt-get clean

And guess what: after two days of trial and tribulation, it worked! Two whole days!

So, I did my build:

    $ docker build -t thumbnailer:0.1 .

I fired up the container:

    $ docker run -d -p 3001:3000 thumbnailer:0.1

Got the IP address of the Virtual Machine:

    $ docker-machine ip default

Went to my browser and entered http://192.168.99.100:3001/ into the address bar.

The upload page loaded.

I selected an image, and this is what I got:

![container-diagram-7](https://deis.com/images/blog-images/containers-hard-7.png)

It worked!

Inside a container, for the first time!

### So What Does It All Mean? ###

A long time ago, I accepted the fact when it comes to tech, sometimes even the easy stuff is hard. Along with that, I abandoned the desire to be the smartest guy in the room. Still, the last few days trying get basic competency with containers has been, at times, a journey of self doubt.

But, you wanna know something? It’s 2 AM on an early morning as I write this, and every nerve wracking hour has been worth it. Why? Because you gotta put in the time. This stuff is hard and it does not come easy for anyone. And don’t forget: you’re learning tech and tech runs the world!

P.S. Check out this two part video of Hello World containers, check out [Raziel Tabib’s][7] excellent work in this video...

注：youtube视频
<iframe width="560" height="315" src="https://www.youtube.com/embed/PJ95WY2DqXo" frameborder="0" allowfullscreen></iframe>

And don't miss part two...

注：youtube视频
<iframe width="560" height="315" src="https://www.youtube.com/embed/lss2rZ3Ppuk" frameborder="0" allowfullscreen></iframe>

--------------------------------------------------------------------------------

via: https://deis.com/blog/2015/beyond-hello-world-containers-hard-stuff

作者：[Bob Reselman][a]
译者：[Ezio](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://deis.com/blog
[1]:http://deis.com/blog/2015/developer-journey-linux-containers
[2]:https://github.com/rsms/node-imagemagick
[3]:https://www.docker.com/toolbox
[4]:https://docs.docker.com/reference/commandline/run/
[5]:https://docs.docker.com/reference/commandline/rm/
[6]:https://docs.docker.com/reference/commandline/rmi/
[7]:http://twitter.com/RazielTabib
