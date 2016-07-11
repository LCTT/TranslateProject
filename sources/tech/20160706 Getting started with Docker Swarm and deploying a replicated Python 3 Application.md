MikeCoder 2016.07.10 Translating

教程:开始学习如何使用 Docker Swarm 部署可扩展的 Python3 应用
==============

[Ben Firshman][2]最近在[Dockercon][1]做了一个关于使用 Docker 构建无服务应用的演讲，你可以在[这查看详情][3](可以和视频一起)。之后，我写了[一篇文章][4]关于如何使用[AWS Lambda][5]构建微服务系统。

今天，我想展示给你的就是如何使用[Docker Swarm][6]然后部署一个简单的 Python Falcon REST 应用。尽管，我不会使用[dockerrun][7]或者是其他无服务特性。你可能会惊讶，使用 Docker Swarm 部署(替换)一个 Python(Java, Go 都一样) 应用是如此的简单。

注意：这展示的部分步骤是截取自[Swarm Tutorial][8]。我已经修改了部分章节，并且[在 Vagrant 的帮助文档][9]中添加了构建本地测试环境的文档。请确保，你使用的是1.12或以上版本的 Docker 引擎。我写这篇文章的时候，使用的是1.12RC2版本的 Docker。注意的是，这只是一个测试版本，只会可能还会有修改。

你要做的第一件事，就是你要保证你正确的安装了[Vagrant][10]，如果你想本地运行的话。你也可以按如下步骤使用你最喜欢的云服务提供商部署 Docker Swarm 虚拟机系统。

我们将会使用这三台 VM:一个简单的 Docker Swarm 管理平台和两台 worker。

安全注意事项:Vagrantfile 代码中包含了部分位于 Docker 测试服务器上的 shell 脚本。这是一个隐藏的安全问题。如果你没有权限的话。请确保你会在运行代码之前[审查这部分的脚本][11]。

```
$ git clone https://github.com/chadlung/vagrant-docker-swarm
$ cd vagrant-docker-swarm
$ vagrant plugin install vagrant-vbguest
$ vagrant up
```

Vagrant up 命令可能会花很长的时间来执行。

SSH 登陆进入 manager1 虚拟机:

```
$ vagrant ssh manager1
```

在 manager1 的终端中执行如下命令:

```
$ sudo docker swarm init --listen-addr 192.168.99.100:2377
```

现在还没有 worker 注册上来:

```
$ sudo docker node ls
```

Let’s register the two workers. Use two new terminal sessions (leave the manager1 session running):
通过两个新的终端会话(退出 manager1 的登陆后)，我们注册两个 worker。

```
$ vagrant ssh worker1
```

在 worker1 上执行如下命令:

```
$ sudo docker swarm join 192.168.99.100:2377
```

在 worker2 上重复这些命令。

在 manager1 上执行这个命令:

```
$ docker node ls
```

你将会看到：

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-3.15.25-PM.png)

开始在 manager1 的终端里，部署一个简单的服务。

```
sudo docker service create --replicas 1 --name pinger alpine ping google.com
```

这个命令将会部署一个服务，他会从 worker 机器中的一台 ping google.com。(manager 也可以运行服务，不过[这也可以被禁止][12])如果你只是想 worker 运行容器的话)。可以使用如下命令，查看哪些节点正在执行服务:

```
$ sudo docker service tasks pinger
```

结果回合这个比较类似:

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-5.23.05-PM.png)

所以，我们知道了服务正跑在 worker1 上。我们可以回到 worker1 的会话里，然后进入正在运行的容器:

```
$ sudo docker ps
```

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-5.25.02-PM.png)

你可以看到容器的 id 是: ae56769b9d4d

在我的例子中，我运行的是如下的代码:

```
$ sudo docker attach ae56769b9d4d
```

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-5.26.49-PM.png)

你可以仅仅只用 CTRL-C 来停止服务。

回到 manager1，并且移除 pinger 服务。

```
$ sudo docker service rm pinger
```

现在，我们将会部署可复制的 Python 应用。请记住，为了保持文章的简洁，而且容易复制，所以部署的是一个简单的应用。

你需要做的第一件事就是将镜像放到[Docker Hub][13]上，或者使用我[已经上传的一个][14]。这是一个简单的 Python 3 Falcon REST 应用。他有一个简单的入口: /hello 带一个 value 参数。

[chadlung/hello-app][15]的 Python 代码看起来像这样:

```
import json
from wsgiref import simple_server
 
import falcon
 
 
class HelloResource(object):
    def on_get(self, req, resp):
        try:
            value = req.get_param('value')
 
            resp.content_type = 'application/json'
            resp.status = falcon.HTTP_200
            resp.body = json.dumps({'message': str(value)})
        except Exception as ex:
            resp.status = falcon.HTTP_500
            resp.body = str(ex)
 
 
if __name__ == '__main__':
    app = falcon.API()
    hello_resource = HelloResource()
    app.add_route('/hello', hello_resource)
    httpd = simple_server.make_server('0.0.0.0', 8080, app)
    httpd.serve_forever()
```

Dockerfile 很简单:

```
FROM python:3.4.4
 
RUN pip install -U pip
RUN pip install -U falcon
 
EXPOSE 8080
 
COPY . /hello-app
WORKDIR /hello-app
 
CMD ["python", "app.py"]
```

再一次说明，这是非常详细的奖惩，如果你想，你也可以在本地访问这个入口: <http://127.0.0.1:8080/hello?value=Fred>

这将返回如下结果:

```
{"message": "Fred"}
```

在 Docker Hub 上构建和部署这个 hello-app（修改成你自己的 Docker Hub 仓库或者[这个][15]）:

```
$ sudo docker build . -t chadlung/hello-app:2
$ sudo docker push chadlung/hello-app:2
```

现在，我们可以将应用部署到之前的 Docker Swarm 了。登陆 manager1 终端，并且执行:

```
$ sudo docker service create -p 8080:8080 --replicas 2 --name hello-app chadlung/hello-app:2
$ sudo docker service inspect --pretty hello-app
$ sudo docker service tasks hello-app
```

现在，我们已经可以测试了。使用任何一个节点 Swarm 的 IP，来访问/hello 的入口，在本例中，我在 Manager1 的终端里使用 curl 命令:

注意,在 Swarm 中的所有 IP 都可以工作，即使这个服务只运行在一台或者更多的节点上。

```
$ curl -v -X GET "http://192.168.99.100:8080/hello?value=Chad"
$ curl -v -X GET "http://192.168.99.101:8080/hello?value=Test"
$ curl -v -X GET "http://192.168.99.102:8080/hello?value=Docker"
```

结果就是:

```
* Hostname was NOT found in DNS cache
*   Trying 192.168.99.101...
* Connected to 192.168.99.101 (192.168.99.101) port 8080 (#0)
> GET /hello?value=Chad HTTP/1.1
> User-Agent: curl/7.35.0
> Host: 192.168.99.101:8080
> Accept: */*
> 
* HTTP 1.0, assume close after body
< HTTP/1.0 200 OK
< Date: Tue, 28 Jun 2016 23:52:55 GMT
< Server: WSGIServer/0.2 CPython/3.4.4
< content-type: application/json
< content-length: 19
< 
{"message": "Chad"}
```

从浏览器中访问其他节点:

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-6.54.31-PM.png)

如果你想看运行的所有服务，你可以在 manager1 节点上运行如下代码:

```
$ sudo docker service ls
```

如果你想添加可视化控制平台，你可以安装[Docker Swarm Visualizer][16](这非常简单上手)。在 manager1 的终端中执行如下代码:

![]($ sudo docker run -it -d -p 5000:5000 -e HOST=192.168.99.100 -e PORT=5000 -v /var/run/docker.sock:/var/run/docker.sock manomarks/visualizer)

打开你的浏览器，并且访问: <http://192.168.99.100:5000/>

结果(假设已经运行了两个 Docker Swarm 服务):

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-30-at-2.37.28-PM.png)

停止运行 hello-app(已经在两个节点上运行了)，可以在 manager1 上执行这个代码:

```
$ sudo docker service rm hello-app
```

如果想停止， 那么在 manager1 的终端中执行：

```
$ sudo docker ps
```

获得容器的 ID,这里是: f71fec0d3ce1

从 manager1 的终端会话中执行这个代码:

```
$ sudo docker stop f71fec0d3ce1
```

祝你使用 Docker Swarm。这篇文章主要是以1.12版本来进行描述的。

--------------------------------------------------------------------------------

via: http://www.giantflyingsaucer.com/blog/?p=5923

作者：[Chad Lung][a]
译者：[译者ID](https://github.com/MikeCoder)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.giantflyingsaucer.com/blog/?author=2
[1]: http://dockercon.com/
[2]: https://blog.docker.com/author/bfirshman/
[3]: https://blog.docker.com/author/bfirshman/
[4]: http://www.giantflyingsaucer.com/blog/?p=5730
[5]: https://aws.amazon.com/lambda/
[6]: https://docs.docker.com/swarm/
[7]: https://github.com/bfirsh/dockerrun
[8]: https://docs.docker.com/engine/swarm/swarm-tutorial/
[9]: https://github.com/chadlung/vagrant-docker-swarm
[10]: https://www.vagrantup.com/
[11]: https://test.docker.com/
[12]: https://docs.docker.com/engine/reference/commandline/swarm_init/
[13]: https://hub.docker.com/
[14]: https://hub.docker.com/r/chadlung/hello-app/
[15]: https://hub.docker.com/r/chadlung/hello-app/
[16]: https://github.com/ManoMarks/docker-swarm-visualizer
