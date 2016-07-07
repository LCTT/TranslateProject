Microservices with Python RabbitMQ and Nameko
==============================================

>"Micro-services is the new black" - Splitting the project in to independently scalable services is the currently the best option to ensure the evolution of the code. In Python there is a Framework called "Nameko" which makes it very easy and powerful.

### Micro services

>The term "Microservice Architecture" has sprung up over the last few years to describe a particular way of designing software applications as suites of independently deployable services. - M. Fowler

I recommend reading the [Fowler's posts][1] to understand the theory behind it.

#### Ok I so what does it mean?

In brief a Micro Service Architecture exists when your system is divided in small (single context bound) responsibilities blocks, those blocks doesn't know each other, they only have a common point of communication, generally a message queue, and does know the communication protocol and interfaces.

#### Give me a real-life example

>The code is available on github: <http://github.com/rochacbruno/nameko-example> take a look at service and api folders for more info.

Consider you have an REST API, that API has an endpoint receiving some data and you need to perform some kind of computation with that data, instead of blocking the caller you can do it asynchronously, return an status "OK - Your request will be processed" to the caller and do it in a background task.

Also you want to send an email notification when the computation is finished without blocking the main computing process, so it is better to delegate the "email sending" to another service.

#### Scenario

![](http://brunorocha.org/static/media/microservices/micro_services.png)

### Show me the code!

Lets create the system to understand it in practice.

#### Environment

We need an environment with:

- A running RabbitMQ
- Python VirtualEnv for services
- Python VirtualEnv for API

#### Rabbit

The easiest way to have a RabbitMQ in development environment is running its official docker container, considering you have Docker installed run:

```
docker run -d --hostname my-rabbit --name some-rabbit -p 15672:15672 -p 5672:5672 rabbitmq:3-management
```

Go to the browser and access <http://localhost:15672> using credentials guest:guest if you can login to RabbitMQ dashboard it means you have it running locally for development.

![](http://brunorocha.org/static/media/microservices/RabbitMQManagement.png)

#### The Service environment

Now lets create the Micro Services to consume our tasks. We'll have a service for computing and another for mail, follow the steps.

In a shell create the root project directory

```
$ mkdir myproject
$ cd myproject
```

Create and activate a virtualenv (you can also use virtualenv-wrapper)

```
$ virtualenv service_env
$ source service_env/bin/activate
```

Install nameko framework and yagmail

```
(service_env)$ pip install nameko
(service_env)$ pip install yagmail
```

#### The service code

Now having that virtualenv prepared (consider you can run service in a server and API in another) lets code the nameko RPC Services.

We are going to put both services in a single python module, but you can also split in separate modules and also run them in separate servers if needed.

In a file called `service.py`

```
import yagmail
from nameko.rpc import rpc, RpcProxy


class Mail(object):
    name = "mail"

    @rpc
    def send(self, to, subject, contents):
        yag = yagmail.SMTP('myname@gmail.com', 'mypassword')
        # read the above credentials from a safe place.
        # Tip: take a look at Dynaconf setting module
        yag.send(to=to.encode('utf-8), 
                 subject=subject.encode('utf-8), 
                 contents=[contents.encode('utf-8)])


class Compute(object):
    name = "compute"
    mail = RpcProxy('mail')    

    @rpc
    def compute(self, operation, value, other, email):
        operations = {'sum': lambda x, y: int(x) + int(y),
                      'mul': lambda x, y: int(x) * int(y),
                      'div': lambda x, y: int(x) / int(y),
                      'sub': lambda x, y: int(x) - int(y)}
        try:
            result = operations[operation](value, other)
        except Exception as e:
            self.mail.send.async(email, "An error occurred", str(e))
            raise
        else:
            self.mail.send.async(
                email, 
                "Your operation is complete!", 
                "The result is: %s" % result
            )
            return result
```

Now with the above services definition we need to run it as a Nameko RPC service.

>NOTE: We are going to run it in a console and leave it running, but in production it is recommended to put the service to run using supervisord or an alternative.

Run the service and let it running in a shell

```
(service_env)$ nameko run service --broker amqp://guest:guest@localhost
starting services: mail, compute
Connected to amqp://guest:**@127.0.0.1:5672//
Connected to amqp://guest:**@127.0.0.1:5672//
```

#### Testing it

Go to another shell (with the same virtenv) and test it using nameko shell

```
(service_env)$ nameko shell --broker amqp://guest:guest@localhost
Nameko Python 2.7.9 (default, Apr  2 2015, 15:33:21) 
[GCC 4.9.2] shell on linux2
Broker: amqp://guest:guest@localhost
>>>
```

You are now in the RPC client testing shell exposing the n.rpc object, play with it

```
>>> n.rpc.mail.send("name@email.com", "testing", "Just testing")
```

The above should sent an email and we can also call compute service to test it, note that it also spawns an async mail sending with result.

```
>>> n.rpc.compute.compute('sum', 30, 10, "name@email.com")
40
>>> n.rpc.compute.compute('sub', 30, 10, "name@email.com")
20
>>> n.rpc.compute.compute('mul', 30, 10, "name@email.com")
300
>>> n.rpc.compute.compute('div', 30, 10, "name@email.com")
3
```

### Calling the micro-service through the API

In a different shell (or even a different server) prepare the API environment

Create and activate a virtualenv (you can also use virtualenv-wrapper)

```
$ virtualenv api_env
$ source api_env/bin/activate
```

Install Nameko, Flask and Flasgger

```
(api_env)$ pip install nameko
(api_env)$ pip install flask
(api_env)$ pip install flasgger
```

>NOTE: In api you dont need the yagmail because it is service responsability

Lets say you have the following code in a file `api.py`

```
from flask import Flask, request
from flasgger import Swagger
from nameko.standalone.rpc import ClusterRpcProxy

app = Flask(__name__)
Swagger(app)
CONFIG = {'AMQP_URI': "amqp://guest:guest@localhost"}


@app.route('/compute', methods=['POST'])
def compute():
    """
    Micro Service Based Compute and Mail API
    This API is made with Flask, Flasgger and Nameko
    ---
    parameters:
      - name: body
        in: body
        required: true
        schema:
          id: data
          properties:
            operation:
              type: string
              enum:
                - sum
                - mul
                - sub
                - div
            email:
              type: string
            value:
              type: integer
            other:
              type: integer
    responses:
      200:
        description: Please wait the calculation, you'll receive an email with results
    """
    operation = request.json.get('operation')
    value = request.json.get('value')
    other = request.json.get('other')
    email = request.json.get('email')
    msg = "Please wait the calculation, you'll receive an email with results"
    subject = "API Notification"
    with ClusterRpcProxy(CONFIG) as rpc:
        # asynchronously spawning and email notification
        rpc.mail.send.async(email, subject, msg)
        # asynchronously spawning the compute task
        result = rpc.compute.compute.async(operation, value, other, email)
        return msg, 200

app.run(debug=True)
```

Put the above API to run in a different shell or server

```
(api_env) $ python api.py 
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
```
 
and then access the url <http://localhost:5000/apidocs/index.html> you will see the Flasgger UI and you can interact with the api and start producing tasks on queue to the service to consume.

![](http://brunorocha.org/static/media/microservices/Flasgger_API_documentation.png)

>NOTE: You can see the shell where service is running for logging, prints and error messages. You can also access the RabbitMQ dashboard to see if there is some message in process there.

There is a lot of more advanced things you can do with Nameko framework you can find more information on <https://nameko.readthedocs.org/en/stable/>

Let's Micro Serve!


--------------------------------------------------------------------------------

via: http://brunorocha.org/python/microservices-with-python-rabbitmq-and-nameko.html

作者: [Bruno Rocha][a]
译者: [译者ID](https://github.com/译者ID)
校对: [校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://facebook.com/rochacbruno
[1]:http://martinfowler.com/articles/microservices.html
