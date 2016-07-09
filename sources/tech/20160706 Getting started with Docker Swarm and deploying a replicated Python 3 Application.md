Tutorial: Getting started with Docker Swarm and deploying a replicated Python 3 Application
==============

At [Dockercon][1] recently [Ben Firshman][2] did a very cool presentation on building serverless apps with Docker, you can [read about it here][3] (along with watching the video). A little while back [I wrote an article][4] on building a microservice with [AWS Lambda][5].

Today, I want to show you how to use [Docker Swarm][6] and then deploy a simple Python Falcon REST app. Although I won’t be using [dockerrun][7] or the serverless capabilities I think you might be surprised how easy it is to deploy (replicated) Python applications (actually any sort of application: Java, Go, etc.) with Docker Swarm.


Note: Some of the steps I’ll show you are taken from the [Swarm Tutorial][8]. I’ve modified some things and [added a Vagrant helper repo][9] to spin up a local testing environment for Docker Swarm to utilize. Keep in mind you must be using Docker Engine 1.12 or later. At the time of this article I am using RC2 of 1.12. Keep in mind this is all build on beta software at this time, things can change.

The first thing you will want to do is to ensure you have [Vagrant][10] properly installed and working if you want to run this locally. You can also follow the steps for the most part and spin up the Docker Swarm VMs on your preferred cloud provider.

We are going to spin up three VMs: A single docker swarm manager and two workers.

Security Note: The Vagrantfile uses a shell script located on Docker’s test server. This is a potential security issue to run scripts you don’t have control over so make sure to [review the script][11] prior to running.

```
$ git clone https://github.com/chadlung/vagrant-docker-swarm
$ cd vagrant-docker-swarm
$ vagrant plugin install vagrant-vbguest
$ vagrant up
```

The vagrant up command will take some time to complete.

SSH into the manager1 VM:

```
$ vagrant ssh manager1
```

Run the following command in the manager1 ssh terminal session:

```
$ sudo docker swarm init --listen-addr 192.168.99.100:2377
```

There will be no workers registered yet:

```
$ sudo docker node ls
```

Let’s register the two workers. Use two new terminal sessions (leave the manager1 session running):

```
$ vagrant ssh worker1
```

Run the following command in the worker1 ssh terminal session:

```
$ sudo docker swarm join 192.168.99.100:2377
```

Repeat those commands used for worker1 but substitute worker2.

From the manager1 terminal run:

```
$ docker node ls
```

You should see:

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-3.15.25-PM.png)

On the manager1 terminal let’s deploy a simple service.

```
sudo docker service create --replicas 1 --name pinger alpine ping google.com
```

That will deploy a service that will ping google.com to one of the workers (or manager, the manager can also run services but this [can also be disabled][12] if you only want workers to run containers). To see which node got the service run this:

```
$ sudo docker service tasks pinger
```

Result will be similar to this:

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-5.23.05-PM.png)

So we know its on worker1. Let’s go to the terminal session for worker1 and attach to the running container:

```
$ sudo docker ps
```

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-5.25.02-PM.png)

You can see the container id is: ae56769b9d4d

In my case I run:

```
$ sudo docker attach ae56769b9d4d
```

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-5.26.49-PM.png)

You can just CTRL-C to stop the pinging.

Go back to the manager1 terminal session and remove the pinger service:

```
$ sudo docker service rm pinger
```

Now we will move onto deploying a replicated Python app part of this article. Please keep in mind in order to keep this article simple and easy to follow this will be a bare bones trivial service.

The first thing you will need to do is to either add your own image to [Docker Hub][13] or use [the one I already have][14]. Its a simple Python 3 Falcon REST app that has one endpoint: /hello with a param of value=SOME_STRING

The Python code for the [chadlung/hello-app][15] image looks like this:

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

The Dockerfile is as simple as:

```
FROM python:3.4.4
 
RUN pip install -U pip
RUN pip install -U falcon
 
EXPOSE 8080
 
COPY . /hello-app
WORKDIR /hello-app
 
CMD ["python", "app.py"]
```

Again, this is meant to be very trivial. You can hit the endpoint by running the image locally if you want: <http://127.0.0.1:8080/hello?value=Fred>

This gives you back:

```
{"message": "Fred"}
```

Build and deploy the hellp-app to Docker Hub (modify below to use your own Docker Hub repo or [use this one][15]):

```
$ sudo docker build . -t chadlung/hello-app:2
$ sudo docker push chadlung/hello-app:2
```

Now we want to deploy this to the Docker Swarm we set up earlier. Go into the manager1 terminal session and run:

```
$ sudo docker service create -p 8080:8080 --replicas 2 --name hello-app chadlung/hello-app:2
$ sudo docker service inspect --pretty hello-app
$ sudo docker service tasks hello-app
```

Now we are ready to test it out. Using any of the node’s IPs in the swarm hit the /hello endpoint. In my case I will just cURL from the manager1 terminal:

Remember, all IPs in the swarm will work even if the service is only running on one or more nodes.

```
$ curl -v -X GET "http://192.168.99.100:8080/hello?value=Chad"
$ curl -v -X GET "http://192.168.99.101:8080/hello?value=Test"
$ curl -v -X GET "http://192.168.99.102:8080/hello?value=Docker"
```

Results:

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

Calling the other node from my web browser:

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-28-at-6.54.31-PM.png)

If you want to see all the services running try this from the manager1 node:

```
$ sudo docker service ls
```
If you want to add some visualization to all this you can install [Docker Swarm Visualizer][16] (this is very handy for presentations, etc.). From the manager1 terminal session run the following:

![]($ sudo docker run -it -d -p 5000:5000 -e HOST=192.168.99.100 -e PORT=5000 -v /var/run/docker.sock:/var/run/docker.sock manomarks/visualizer)

Simply open a browser now and point it at: <http://192.168.99.100:5000/>

Results (assuming running two Docker Swarm services):

![](http://www.giantflyingsaucer.com/blog/wp-content/uploads/2016/06/Screen-Shot-2016-06-30-at-2.37.28-PM.png)

To stop the hello-app (which was replicated to two nodes) run this from the manager1 terminal session:

```
$ sudo docker service rm hello-app
```

To stop the Visualizer run this from the manager1 terminal session:

```
$ sudo docker ps
```

Get the container id, in my case it was: f71fec0d3ce1

Run this from the manager1 terminal session::

```
$ sudo docker stop f71fec0d3ce1
```

Good luck with Docker Swarm and keep in kind this article was based on the release candidate of version 1.12.

--------------------------------------------------------------------------------

via: http://www.giantflyingsaucer.com/blog/?p=5923

作者：[Chad Lung][a]
译者：[译者ID](https://github.com/译者ID)
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
