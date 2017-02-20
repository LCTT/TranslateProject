使用 Docker Swarm 部署可扩展的 Python3 应用
==============

[Ben Firshman][2] 最近在 [Dockercon][1] 做了一个关于使用 Docker 构建无服务应用的演讲，你可以在[这里查看详情][3]（还有视频）。之后，我写了一篇关于如何使用 [AWS Lambda][5] 构建微服务系统的[文章][4]。

今天，我想展示给你的就是如何使用 [Docker Swarm][6] 部署一个简单的 Python Falcon REST 应用。这里我不会使用[dockerrun][7] 或者是其他无服务特性，你可能会惊讶，使用 Docker Swarm 部署（复制）一个 Python（Java、Go 都一样）应用是如此的简单。

注意：这展示的部分步骤是截取自 [Swarm Tutorial][8]，我已经修改了部分内容，并且[增加了一个 Vagrant Helper 的仓库][9]来启动一个可以让 Docker Swarm 工作起来的本地测试环境。请确保你使用的是 1.12 或以上版本的 Docker Engine。我写这篇文章的时候，使用的是 1.12RC2 版本。注意的是，这只是一个测试版本，可能还会有修改。

你要做的第一件事，就是如果你想本地运行的话，你要保证 [Vagrant][10] 已经正确的安装和运行了。你也可以按如下步骤使用你最喜欢的云服务提供商部署 Docker Swarm 虚拟机系统。

我们将会使用这三台 VM：一个简单的 Docker Swarm 管理平台和两台 worker。

安全注意事项：Vagrantfile 代码中包含了部分位于 Docker 测试服务器上的 shell 脚本。这是一个潜在的安全问题，它会运行你不能控制的脚本，所以请确保你会在运行代码之前[审查过这部分的脚本][11]。

```
$ git clone https://github.com/chadlung/vagrant-docker-swarm
$ cd vagrant-docker-swarm
$ vagrant plugin install vagrant-vbguest
$ vagrant up
```

Vagrant up 命令需要一些时间才能完成。

SSH 登陆进入 manager1 虚拟机：

```
$ vagrant ssh manager1
```

在 manager1 的 ssh 终端会话中执行如下命令：

```
$ sudo docker swarm init --listen-addr 192.168.99.100:2377
```

现在还没有 worker 注册上来：

```
$ sudo docker node ls
```

让我们注册两个新的 worker，请打开两个新的终端会话（保持 manager1 会话继续运行）：

```
$ vagrant ssh worker1
```

在 worker1 的 ssh 终端会话上执行如下命令：

```
$ sudo docker swarm join 192.168.99.100:2377
```

在 worker2 的 ssh 终端会话上重复这些命令。

在 manager1 终端上执行如下命令：

```
$ docker node ls
```

你将会看到：

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-3.15.25-PM.png)

在 manager1 的终端里部署一个简单的服务。

```
sudo docker service create --replicas 1 --name pinger alpine ping google.com
```

这个命令将会部署一个服务，它会从 worker 之一 ping google.com。（或者 manager，manager 也可以运行服务，不过如果你只是想 worker 运行容器的话，[也可以禁用这一点][12]）。可以使用如下命令，查看哪些节点正在执行服务:

```
$ sudo docker service tasks pinger
```

结果会和这个比较类似：

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-5.23.05-PM.png)

所以，我们知道了服务正跑在 worker1 上。我们可以回到 worker1 的会话里，然后进入正在运行的容器：

```
$ sudo docker ps
```

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-5.25.02-PM.png)

你可以看到容器的 id 是: ae56769b9d4d，在我的例子中，我运行如下的代码：

```
$ sudo docker attach ae56769b9d4d
```

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-5.26.49-PM.png)

你可以按下 CTRL-C 来停止服务。

回到 manager1，然后移除这个 pinger 服务。

```
$ sudo docker service rm pinger
```

现在，我们将会部署可复制的 Python 应用。注意，为了保持文章的简洁，而且容易复制，所以部署的是一个简单的应用。

你需要做的第一件事就是将镜像放到 [Docker Hub][13]上，或者使用我[已经上传的一个][14]。这是一个简单的 Python 3 Falcon REST 应用。它有一个简单的入口: /hello 带一个 value 参数。

放在 [chadlung/hello-app][15] 上的 Python 代码看起来像这样：

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

Dockerfile 很简单：

```
FROM python:3.4.4
 
RUN pip install -U pip
RUN pip install -U falcon
 
EXPOSE 8080
 
COPY . /hello-app
WORKDIR /hello-app
 
CMD ["python", "app.py"]
```

上面表示的意思很简单，如果你想，你可以在本地运行该进行来访问这个入口： <http://127.0.0.1:8080/hello?value=Fred>

这将返回如下结果：

```
{"message": "Fred"}
```

在 Docker Hub 上构建和部署这个 hello-app（修改成你自己的 Docker Hub 仓库或者[使用这个][15]）：

```
$ sudo docker build . -t chadlung/hello-app:2
$ sudo docker push chadlung/hello-app:2
```

现在，我们可以将应用部署到之前的 Docker Swarm 了。登录 manager1 的 ssh 终端会话，并且执行：

```
$ sudo docker service create -p 8080:8080 --replicas 2 --name hello-app chadlung/hello-app:2
$ sudo docker service inspect --pretty hello-app
$ sudo docker service tasks hello-app
```

现在，我们已经可以测试了。使用任何一个 Swarm 节点的 IP 来访问 /hello 入口。在本例中，我在 manager1 的终端里使用 curl 命令：

注意，Swarm 中的所有的 IP 都可以，不管这个服务是运行在一台还是更多的节点上。

```
$ curl -v -X GET "http://192.168.99.100:8080/hello?value=Chad"
$ curl -v -X GET "http://192.168.99.101:8080/hello?value=Test"
$ curl -v -X GET "http://192.168.99.102:8080/hello?value=Docker"
```

结果：

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

从浏览器中访问其他节点：

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-6.54.31-PM.png)

如果你想看运行的所有服务，你可以在 manager1 节点上运行如下代码：

```
$ sudo docker service ls
```

如果你想添加可视化控制平台，你可以安装 [Docker Swarm Visualizer][16]（这对于展示非常方便）。在 manager1 的终端中执行如下代码：

```
$ sudo docker run -it -d -p 5000:5000 -e HOST=192.168.99.100 -e PORT=5000 -v /var/run/docker.sock:/var/run/docker.sock manomarks/visualizer)
```

打开你的浏览器，并且访问： <http://192.168.99.100:5000/>

结果如下（假设已经运行了两个 Docker Swarm 服务）：

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-30-at-2.37.28-PM.png)

要停止运行 hello-app（已经在两个节点上运行了），可以在 manager1 上执行这个代码：

```
$ sudo docker service rm hello-app
```

如果想停止 Visualizer， 那么在 manager1 的终端中执行：

```
$ sudo docker ps
```

获得容器的 ID，这里是： f71fec0d3ce1，从 manager1 的终端会话中执行这个代码：

```
$ sudo docker stop f71fec0d3ce1
```

祝你成功使用 Docker Swarm。这篇文章主要是以 1.12 版本来进行描述的。

--------------------------------------------------------------------------------

via: http://www.giantflyingsaucer.com/blog/?p=5923

作者：[Chad Lung][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[wxy](https://github.com/wxy)

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
