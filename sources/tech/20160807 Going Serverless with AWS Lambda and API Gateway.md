Going Serverless with AWS Lambda and API Gateway
============================

Lately, there's been a lot of buzz in the computing world about "serverless". Serverless is a concept wherein you don't manage any servers yourself but instead provide your code or executables to a service that executes them for you. This is execution-as-a-service. It introduces many opportunities and also presents its own unique set of challenges.

A brief digression on computing

In the beginning, there was... well. It's a little complicated. At the very beginning, we had mechanical computers. Then along came ENIAC. Things really don't start to get "mass production", however, until the advent of mainframes.

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

>These are rough release/popularity dates. Argue amongst yourselves about the timeline.

The progression here seems to be a trend toward executing smaller and smaller units of functionality. Each step down generally represents a decrease in the operational overhead and an increase in the operational flexibility.

### The possibilities

Yay! Serverless! But. What advantages do we gain by going serverless? And what challenges do we face?

No billing when there is no execution. In my mind, this is a huge selling point. When no one is using your site or your API, you aren't paying for. No ongoing infrastructure costs. Pay only for what you need. In some ways, this is the fulfillment of the cloud computing promise "pay only for what you use".

No servers to maintain or secure. Server maintenance and security is handled by your vendor (you could, of course, host serverless yourself, but in some ways this seems like a step in the wrong direction). Since your execution times are also limited, the patching of security issues is also simplified since there is nothing to restart. This should all be handled seamlessly by your vendor.

Unlimited scalability. This is another big one. Let's say you write the next Pokémon Go. Instead of your site being down every couple of days, serverless lets you just keep growing and growing. A double-edged sword, for sure (with great scalability comes great... bills), but if your service's profitability depends on being up, then serverless can help enable that.

Forced microservices architecture. This one really goes both ways. Microservices seem to be a good way to build flexible, scalable, and fault-tolerant architectures. On the other hand, if your business' services aren't designed this way, you're going to have difficulty adding serverless into your existing architecture.

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
