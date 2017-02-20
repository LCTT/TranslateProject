# Go Serverless with Apex and Compose's MongoDB

_Apex is tooling that wraps the development and deployment experience for AWS Lambda functions. It provides a local command line tool which can create security contexts, deploy functions, and even tail cloud logs. While AWS's Lambda service treats each function as an independent unit, Apex provides a framework which treats a set of functions as a project. Plus, it even extends the service to languages beyond just Java, Javascript, and Python such as Go._

Two years ago the creator of Express, the almost de facto web framework for NodeJS, said [goodbye][12] to the Node community and turned his attention to Go, the backend services language from Google, and Lambdas, the Functions as a Service offering from AWS. While one developer's actions don't make a trend, it is interesting to look at the project he has been working on named [Apex][13] because it may portend some changes in how a good portion of the web will be delivered in the future.

##### What is a Lambda?

Currently, if one doesn't run their own hardware they pay to run some kind of virtual server in the cloud. On it they deploy a complete stack such as Node, Express, and a custom application. Or if they have gone further with something like a Heroku or Bluemix, then they deploy their full application to some preconfigured container that already has Node setup and they just deploy the application's code.

The next step up the abstraction ladder is to deploy just the functions themselves to the cloud without even a full application. These functions can then be triggered by a variety of external events. For example, AWS's API Gateway service can proxy HTTP requests as events to these functions and the Function as a Service provider will execute the mapped function on demand.

###### Getting Started with Apex

Apex is a command line tool which wraps the AWS CLI (Command Line Interface). So, the first step to getting started with Apex is to ensure that you have the command line tools from AWS installed and configured (see [AWS CLI Getting Started][14] or [Apex documentation][15]).

Next install Apex:

`curl https://raw.githubusercontent.com/apex/apex/master/install.sh | sh`

Then create a directory for your new project and run:

`apex init`

 ![apexInit](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620758/nzjk1pi1rce1yarbp6xl.png) 

This sets up some of the necessary security policies and even appends the project name to the functions since the Lambda namespace is flat. It also creates some config and the functions directory with a default "Hello World" style function in Javascript.

 ![tree](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620765/bbsb8h6nkc9nx2qs0foa.png) 

One of the nice things about Apex/Lambdas is that creating a function is really straightforward. Create a new directory with the name of your function and then in that create the program. To use Go, you could create a directory named `simpleGo` then in that create a small `main` program:

 ![tree2](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620769/lthziblpv8iod2muyqwn.png) 

```
//  serverless/functions/simpleGo/main.go
package main

import (  
    "encoding/json"
    "github.com/apex/go-apex"
    "log"
)

type helloEvent struct {  
    Hello string `json:"hello"`
}

func main() {  
    apex.HandleFunc(func(event json.RawMessage, ctx *apex.Context) (interface{}, error) {
        var h helloEvent
        if err := json.Unmarshal(event, &h); err != nil {
            return nil, err
        }
        log.Print("event.hello:", h.Hello)
        return h, nil
    })
}
```

Apex uses a NodeJS shim, since Node is a supported runtime of Lambda, to call the binary which is created from the above program. It passes the `event` into the binary's STDIN and takes the `value` returned from the binary's STDOUT. It logs via STDERR. The `apex.HandleFunc` manages all of the piping for you. Really it is a very simple solution in the Unix tradition. You can even test it from the command line locally with a `go run main.go`:

 ![goRun](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620784/ddb0vkcef50pnjgfdqn7.png) 

Deploying to the cloud is trivial with Apex:

 ![apexDeploy](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620790/x6l8qg2vticpxhzi7kl3.png) 

Notice that it namespaced your function, managed versioning, and even had a place for some `env` things which we could have used for multiple development environments like `staging` and `production`.

Executing on the cloud is trivial too with `apex invoke`:

 ![apexInvoke](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620796/jccxskukvy5utgegy2hr.png) 

And we can even tail some logs:

 ![apexLog](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620802/ym3z6w8ojmrq7pucr5bp.png) 

Those are results from AWS CloudWatch. They are available in the AWS UI but when developing it is much faster to follow them like this in another terminal.

##### What's Inside?

It is instructive to see inside the artifact that is actually deployed. Apex packages up the shim and everything needed for the function to run. Plus, it goes ahead and configures things like the entry point and security roles:

 ![lambdaConfig](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620812/zz6qwocvuhhl4lq6bf4p.png) 

The Lambda service actually accepts a zip archive with all of the dependencies which it deploys to the servers that execute the function. We can use `apex build <functionName>` to create an archive locally which we can then unzip to explore:

 ![apexBuild](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620818/ybidaj2i2ijurjbcqrx2.png) 

The `_apex_index.js handle` function is the original entry point. It sets up some environment variables and then calls into `index.js`. 
The `index.js` spawns a child process of the `main` Go binary and wires everything together.

##### Go Further with `mgo`

The Golang driver for MongoDB is called `mgo`. Using Apex to create a function that connects to Compose's MongoDB is almost as straightforward as the `simpleGo`function which we have been reviewing. Here we'll create a new function by adding a directory called `mgoGo` and creating another `main.go`:

```
// serverless/functions/mgoGo/main.go

package main

import (  
    "crypto/tls"
    "encoding/json"
    "github.com/apex/go-apex"
    "gopkg.in/mgo.v2"
    "log"
    "net"
)

type person struct {  
  Name  string `json:"name"`
  Email string `json:"email"`
}

func main() {  
    apex.HandleFunc(func(event json.RawMessage, ctx *apex.Context) (interface{}, error) {
        tlsConfig := &tls.Config{}
        tlsConfig.InsecureSkipVerify = true

        //connect URL:
        // "mongodb://<username>:<password>@<hostname>:<port>,<hostname>:<port>/<db-name>
        dialInfo, err := mgo.ParseURL("mongodb://apex:mountain@aws-us-west-2-portal.0.dblayer.com:15188, aws-us-west-2-portal.1.dblayer.com:15188/signups")
        dialInfo.DialServer = func(addr *mgo.ServerAddr) (net.Conn, error) {
            conn, err := tls.Dial("tcp", addr.String(), tlsConfig)
            return conn, err
        }
        session, err := mgo.DialWithInfo(dialInfo)
        if err != nil {
            log.Fatal("uh oh. bad Dial.")
            panic(err)
        }
        defer session.Close()
        log.Print("Connected!")

    var p person
    if err := json.Unmarshal(event, &p); err != nil {
            log.Fatal(err)
    }

        c := session.DB("signups").C("people")
        err = c.Insert(&p) 
        if err != nil {
            log.Fatal(err)
        }

    log.Print("Created: ", p.Name," - ", p.Email)
        return p, nil
    })
}
```

Post deploy. We can invoke with the correct kind of event to mimic calling an API:

 ![apexMgo](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620829/jeprb3r6qrgjkzblkhho.png) 

The net result is to `insert` into [MongoDB on Compose][16]:

 ![composeDeploy](https://res.cloudinary.com/dyyck73ly/image/upload/v1475620833/vdy8hjiwxpe02evgqwcm.png) 

##### So Much More...

While we have covered a lot of ground so far with Apex there are many more things to explore. There is integration with [Terraform][17]. You could deliver a polyglot language project with Javascript, Java, Python and Go if you so desired. You could configure multiple environments for things like development, staging, and production. You could tweak the runtime resources by sizing memory and timeouts which effects pricing. And you could hook functions up to the API Gateway to deliver an HTTP API or use something like SNS (Simple Notification Service) to build pipelines of functions in the cloud.

Like most things, Apex and Lambdas aren't perfect for every scenario. Functions with high IO waits defeat the purpose of paying for compute time. But, adding a tool to your toolbox that requires no infrastructure management on your part at all makes good sense.

--------------------------------------------------------------------------------

作者简介: 

Hays Hutton writes code and then writes about it. Love this article? Head over to [Hays Hutton’s author page][a] and keep reading.

--------------------------------------------------------------------------------

via: https://www.compose.com/articles/go-serverless-with-apex-and-composes-mongodb/

作者：[Hays Hutton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.compose.com/articles/author/hays-hutton/
[1]:https://twitter.com/share?text=Go%20Serverless%20with%20Apex%20and%20Compose%27s%20MongoDB&url=https://www.compose.com/articles/go-serverless-with-apex-and-composes-mongodb/&via=composeio
[2]:https://www.facebook.com/sharer/sharer.php?u=https://www.compose.com/articles/go-serverless-with-apex-and-composes-mongodb/
[3]:https://plus.google.com/share?url=https://www.compose.com/articles/go-serverless-with-apex-and-composes-mongodb/
[4]:http://news.ycombinator.com/submitlink?u=https://www.compose.com/articles/go-serverless-with-apex-and-composes-mongodb/&t=Go%20Serverless%20with%20Apex%20and%20Compose%27s%20MongoDB
[5]:https://www.compose.com/articles/rss/
[6]:https://unsplash.com/@esaiastann
[7]:https://www.compose.com/articles
[8]:https://www.compose.com/articles/tag/go/
[9]:https://www.compose.com/articles/tag/mgo/
[10]:https://www.compose.com/articles/tag/mongodb/
[11]:https://www.compose.com/articles/go-serverless-with-apex-and-composes-mongodb/#search
[12]:https://medium.com/@tjholowaychuk/farewell-node-js-4ba9e7f3e52b#.dc9vkeybx
[13]:http://apex.run/
[14]:http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html
[15]:http://apex.run/
[16]:https://www.compose.com/articles/composes-new-primetime-mongodb/
[17]:https://www.terraform.io/
