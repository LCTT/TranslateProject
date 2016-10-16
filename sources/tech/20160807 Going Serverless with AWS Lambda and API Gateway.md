Going Serverless with AWS Lambda and API Gateway
============================
通过AWS的Lambda和API网关实现Serverless
============================

Lately, there's been a lot of buzz in the computing world about "serverless". Serverless is a concept wherein you don't manage any servers yourself but instead provide your code or executables to a service that executes them for you. This is execution-as-a-service. It introduces many opportunities and also presents its own unique set of challenges.
近来, 计算机领域出现了很多关于"serverless"的讨论。serverless是一个新的概念，它能帮你执行你的代码或可执行程序，而你无需自己管理服务器。这就是所谓的执行作为一个服务。它带来了许多机会，也呈现了自己独特的挑战。

A brief digression on computing
简短回忆下计算机的发展

In the beginning, there was... well. It's a little complicated. At the very beginning, we had mechanical computers. Then along came ENIAC. Things really don't start to get "mass production", however, until the advent of mainframes.
很早的时候，只有机器计算机，后来又有了ENIAC(Electronic Numerical Integrator And Computer)，但是都没有大规模生产。直到大型机出现后，计算机才快速发展。

```
1950s - Mainframes
1960s - Minicomputers
1994 - Rack servers
2001 - Blade servers
2000s - Virtual servers
2006 - Cloud servers
2013 - Containers
2014 - Serverless
```
1950s - 大型机
1960s - 微型机
1994 - 机架服务器
2001 - 刀片服务器
2000s - 虚拟服务器
2006 - 服务器云化
2013 - 容器化
2014 - Serverless(计算资源服务化)

>These are rough release/popularity dates. Argue amongst yourselves about the timeline.
注:这些日期是大概的发布或是流行时间，不要和我争论这些时间的准确性。

The progression here seems to be a trend toward executing smaller and smaller units of functionality. Each step down generally represents a decrease in the operational overhead and an increase in the operational flexibility.
从变化的趋势来看，计算在执行越来越小的功能单元。每一次变化通常都代表了运维负担的减小和运维灵活性的增加。

### The possibilities
### 机会

Yay! Serverless! But. What advantages do we gain by going serverless? And what challenges do we face?
最新的进展是Serverlss! 但是, serverless能给我们带来什么好处? 我们要面临什么挑战呢?

No billing when there is no execution. In my mind, this is a huge selling point. When no one is using your site or your API, you aren't paying for. No ongoing infrastructure costs. Pay only for what you need. In some ways, this is the fulfillment of the cloud computing promise "pay only for what you use".
没有运行代码时不需要付费. 我认为，这是个巨大的卖点。当没有人访问你的站点或用你的API,你不需要付钱，也没有基础设备成本。仅仅支付你需要的部分。换句话说，这兑现了云计算的承诺:"仅仅支付你真正用的资源".

No servers to maintain or secure. Server maintenance and security is handled by your vendor (you could, of course, host serverless yourself, but in some ways this seems like a step in the wrong direction). Since your execution times are also limited, the patching of security issues is also simplified since there is nothing to restart. This should all be handled seamlessly by your vendor.
不需要维护服务器，也不需要考虑服务器安全。服务器的维护和安全将由你的供应商来处理(当然，你也可以架设自己的serverless，只是这似乎不是正确的选择方向).由于你的执行时间有限，安全补丁也被简化了，因为没有什么需要重启。这些都应该由你的服务供应商无缝地处理。

Unlimited scalability. This is another big one. Let's say you write the next Pokémon Go. Instead of your site being down every couple of days, serverless lets you just keep growing and growing. A double-edged sword, for sure (with great scalability comes great... bills), but if your service's profitability depends on being up, then serverless can help enable that.
无限的可扩展性.这是又一个大的好处。假设你又开发了一个Pokemon Go, 与其频繁地把站点下线维护，不如用serverless来不断地扩展。当然，这也是个双刃剑，大量的账单也会随之而来。如果你的业务的利润和站点的可用性强相关的话，serverless确实能帮上忙。

Forced microservices architecture. This one really goes both ways. Microservices seem to be a good way to build flexible, scalable, and fault-tolerant architectures. On the other hand, if your business' services aren't designed this way, you're going to have difficulty adding serverless into your existing architecture.
强制的微服务架构。这也是有两面性，微服务似乎是一种好的构建灵活可扩展的，故障容忍架构的方式。另一方面，如果你的业务没有按照这种方式设计，你将很难在已有的架构中引入serverless.

### But now your stuck on their platform

Limited range of environments. You get what the vendor gives. You want to go serverless in Rust? You're probably out of luck.

Limited preinstalled packages. You get what the vendor pre-installs. But you may be able to supply your own.

Limited execution time. Your function can only run for so long. If you have to process a 1TB file you will likely need to 1) use a work around or 2) use something else.

Forced microservices architecture. See above.

Limited insight and ability to instrument. Just what is your code doing? With serverless, it is basically impossible to drop in a debugger and ride along. You still have the ability to log and emit metrics the usual way but these generally can only take you so far. Some of the most difficult problems may be out of reach when the occur in a serverless environment.

### The playing field

Since the introduction of AWS Lambda in 2014, the number of offerings has expanded quite a bit. Here are a few popular ones:

- AWS Lambda - The Original
- OpenWhisk - Available on IBM's Bluemix cloud
- Google Cloud Functions
- Azure Functions

While all of these have their relative strengths and weaknesses (like, C# support on Azure or tight integration on any vendor's platform) the biggest player here is AWS.

### Building your first API with AWS Lambda and API Gateway

Let's give serverless a whirl, shall we? We'll be using AWS Lambda and API Gateway offerings to build an API that returns "Guru Meditations" as spoken by Jimmy.

All of the code is available on [GitHub][1].

API Documentation:

```
POST /
{
    "status": "success",
    "meditation": "did u mention banana cognac shower"
}
```

### How we'll structure things

The layout:

```
.
├── LICENSE
├── README.md
├── server
│   ├── __init__.py
│   ├── meditate.py
│   └── swagger.json
├── setup.py
├── tests
│   └── test_server
│       └── test_meditate.py
└── tools
    ├── deploy.py
    ├── serve.py
    ├── serve.sh
    ├── setup.sh
    └── zip.sh
```

Things in AWS (for a more detailed view as to what is happening here, consult the source of tools/deploy.py):

- API. The thing that were actually building. It is represented as a separate object in AWS.
- Execution Role. Every function executes as a particular role in AWS. Ours will be meditations.
- Role Policy. Every function executes as a role, and every role needs permission to do things. Our lambda function doesn't do much, so we'll just add some logging permissions.
- Lambda Function. The thing that runs our code.
- Swagger. Swagger is a specification of an API. API Gateway supports consuming a swagger definition to configure most resources for that API.
- Deployments. API Gateway provides for the notion of deployments. We won't be using more than one of these for our API here (i.e., everything is production, yolo, etc.), but know that they exist and for a real production-ready service you will probably want to use development and staging environments.
- Monitoring. In case our service crashes (or begins to accumulate a hefty bill from usage) we'll want to add some monitoring in the form of cloudwatch alarms for errors and billing. Note that you should modify tools/deploy.py to set your email correctly.

### the codes

The lambda function itself will be returning guru meditations at random from a hardcoded list and is very simple:

```
import logging
import random


logger = logging.getLogger()
logger.setLevel(logging.INFO)


def handler(event, context):

    logger.info(u"received request with id '{}'".format(context.aws_request_id))

    meditations = [
    "off to a regex/",
    "the count of machines abides",
    "you wouldn't fax a bat",
    "HAZARDOUS CHEMICALS + RKELLY",
    "your solution requires a blood eagle",
    "testing is broken because I'm lazy",
    "did u mention banana cognac shower",
    ]

    meditation = random.choice(meditations)

    return {
        "status": "success",
        "meditation": meditation,
    }
```

### The deploy.py script

This one is rather long (sadly) and I won't be including it here. It basically goes through each of the items under "Things in AWS" and ensures each item exists.

Let's deploy this shit

Just run `./tools/deploy.py`.

Well. Almost. There seems to be some issue applying privileges that I can't seem to figure out. Your lambda function will fail to execute because API Gateway does not have permissions to execute your function. The specific error should be "Execution failed due to configuration error: Invalid permissions on Lambda function". I am not sure how to add these using botocore. You can work around this issue by going to the AWS console (sadness), locating your API, going to the / POST endpoint, going to integration request, clicking the pencil icon next to "Lambda Function" to edit it, and then saving it. You'll get a popup stating "You are about to give API Gateway permission to invoke your Lambda function". Click "OK".

When you're finished with that, take the URL that ./tools/deploy.py printed and call it like so to see your new API in action:

```
$ curl -X POST https://a1b2c3d4.execute-api.us-east-1.amazonaws.com/prod/
{"status": "success", "meditation": "the count of machines abides"}
```

### Running Locally

One unfortunate thing about AWS Lambda is that there isn't really a good way to run your code locally. In our case, we will use a simple flask server to host the appropriate endpoint locally and handle calling our handler function:

```
from __future__ import absolute_import

from flask import Flask, jsonify

from server.meditate import handler


app = Flask(__name__)

@app.route("/", methods=["POST"])
def index():

    class FakeContext(object):
        aws_request_id = "XXX"

    return jsonify(**handler(None, FakeContext()))

app.run(host="0.0.0.0")
```

You can run this in the repo with ./tools/serve.sh. Invoke like:

```
$ curl -X POST http://localhost:5000/
{
    "meditation": "your solution requires a blood eagle",
    "status": "success"
}
```

### Testing

You should always test your code. The way we'll be doing this is importing and running our handler function. This is really just plain vanilla python testing:

```
from __future__ import absolute_import

import unittest

from server.meditate import handler


class SubmitTestCase(unittest.TestCase):

    def test_submit(self):

        class FakeContext(object):

            aws_request_id = "XXX"

        response = handler(None, FakeContext())

        self.assertEquals(response["status"], "success")
        self.assertTrue("meditation" in response)
```

You can run the tests in the repo with nose2.

### Other possibilities

Seamless integration with AWS services. Using boto, you can pretty simply connect to any of AWS other services. You simply allow your execution role access to these services using IAM and you're on your way. You can get/put files from S3, connect to Dynamo DB, invoke other lambda functions, etc. etc. The list goes on.

Accessing a database. You can easily access remote databases as well. Connect to the database at the top of your lambda handler's module. Execute queries on the connection from within the handler function itself. You will (very likely) have to upload the associated package contents from where it is installed locally for this to work. You may also need to statically compile certain libraries.

Calling other webservices. API Gateway is also a way to translate the output from one web service into a different form. You can take advantage of this to proxy calls through to a different webservice or provide backwards compatibility when a service changes.

--------------------------------------------------------------------------------

via: http://blog.ryankelly.us/2016/08/07/going-serverless-with-aws-lambda-and-api-gateway.html?utm_source=webopsweekly&utm_medium=email

作者：[Ryan Kelly][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://github.com/f0rk/blog.ryankelly.us/
[1]: https://github.com/f0rk/meditations
