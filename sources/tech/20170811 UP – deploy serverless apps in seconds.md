translating----geekpi

UP – deploy serverless apps in seconds
============================================================

![](https://cdn-images-1.medium.com/max/2000/1*8KijrYCm1j0_XvrACQD_fQ.png)

Last year I wrote [Blueprints for Up][1], describing how most of the building blocks are available to create a great serverless experience on AWS with minimal effort. This post talks about the initial alpha release of [Up][2].

Why focus on serverless? For starters it’s cost-effective since you pay on-demand, only for what you use. Serverless options are self-healing, as each request is isolated and considered to be “stateless.” And finally it scales indefinitely with ease — there are no machines or clusters to manage. Deploy your code and you’re done.

Roughly a month ago I decided to start working on it over at [apex/up][3], and wrote the first small serverless sample application [tj/gh-polls][4] for live SVG GitHub user polls. It worked well and costs less than $1/month to serve millions of polls, so I thought I’d go ahead with the project and see if I can offer open-source and commercial variants.

The long-term goal is to provide a “Bring your own Heroku” of sorts, supporting many platforms. While Platform-as-a-Service is nothing new, the serverless ecosystem is making this kind of program increasingly trivial. This said, AWS and others often suffer in terms of UX due to the flexibility they provide. Up abstracts the complexity away, while still providing you with a virtually ops-free solution.

### Installation

You can install Up with the following command, and view the [temporary documentation][5] to get started. Or if you’re sketched out by install scripts, grab a [binary release][6]. (Keep in mind that this project is still early on.)

```
curl -sfL https://raw.githubusercontent.com/apex/up/master/install.sh | sh
```

To upgrade to the latest version at any time just run:

```
up upgrade
```

You may also install via NPM:

```
npm install -g up
```

### Features

What features does the early alpha provide? Let’s take a look! Keep in mind that Up is not a hosted service, so you’ll need an AWS account and [AWS credentials][8]. If you’re not familiar at all with AWS you may want to hold off until that process is streamlined.

The first question I always get is: how does up(1) differ from [apex(1)][9]? Apex focuses on deploying functions, for pipelines and event processing, while Up focuses on apps, apis, and static sites, aka single deployable units. Apex does not provision API Gateway, SSL certs, or DNS for you, nor does it provide URL rewriting, script injection and so on.

#### Single command serverless apps

Up lets you deploy apps, apis, and static sites with a single command. To create an application all you need is a single file, in the case of Node.js, an `./app.js` listening on `PORT` which is provided by Up. Note that if you’re using a `package.json` Up will detect and utilize the `start` and `build`scripts.

```
const http = require('http')
const { PORT = 3000 } = process.env
```

```
http.createServer((req, res) => {
  res.end('Hello World\n')
}).listen(PORT)
```

Additional [runtimes][10] are supported out of the box, such as `main.go` for Golang, so you can deploy Golang, Python, Crystal, or Node.js applications in seconds.

```
package main
```

```
import (
 "fmt"
 "log"
 "net/http"
 "os"
)
```

```
func main() {
 addr := ":" + os.Getenv("PORT")
 http.HandleFunc("/", hello)
 log.Fatal(http.ListenAndServe(addr, nil))
}
```

```
func hello(w http.ResponseWriter, r *http.Request) {
 fmt.Fprintln(w, "Hello World from Go")
}
```

To deploy the application type `up` to create the resources required, and deploy the application itself. There are no smoke and mirrors here, once it says “complete”, you’re done, the app is immediately available — there is no remote build process.

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/2000/1*tBYR5HXeDDVkb_Pv2MCj1A.png)

The subsequent deploys will be even quicker since the stack is already provisioned:

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/2000/1*2w2WHDTfTT-7GsMtNPklXw.png)

Test out your app with `up url --open` to view it in the browser, `up url --copy` to save the URL to the clipboard, or try it with curl:

```
curl `up url`
Hello World
```

To delete the app and its resources just type `up stack delete`:

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/2000/1*FUdhBTtDHaZ2CEPHR7PGqg.png)

Deploy to the staging or production environments using `up staging` or `up production` , and `up url --open production` for example. Note that custom domains are not yet available, [they will be shortly][11]. Later you’ll also be able to “promote” a release to other stages.

#### Reverse proxy

One feature which makes Up unique is that it doesn’t just simply deploy your code, it places a Golang reverse proxy in front of your application. This provides many features such as URL rewriting, redirection, script injection and more, which we’ll look at further in the post.

#### Infrastructure as code

Up follows modern best practices in terms of configuration, as all changes to the infrastructure can be previewed before applying, and the use of IAM policies can also restrict developer access to prevent mishaps. A side benefit is that it helps self-document your infrastructure as well.

Here’s an example of configuring some (dummy) DNS records and free SSL certificates via AWS ACM which utilizes LetsEncrypt.

```
{
  "name": "app",
  "dns": {
    "myapp.com": [
      {
        "name": "myapp.com",
        "type": "A",
        "ttl": 300,
        "value": ["35.161.83.243"]
      },
      {
        "name": "blog.myapp.com",
        "type": "CNAME",
        "ttl": 300,
        "value": ["34.209.172.67"]
      },
      {
        "name": "api.myapp.com",
        "type": "A",
        "ttl": 300,
        "value": ["54.187.185.18"]
      }
    ]
  },
  "certs": [
    {
      "domains": ["myapp.com", "*.myapp.com"]
    }
  ]
}
```

When you deploy the application the first time via `up` all the permissions required, API Gateway, Lambda function, ACM certs, Route53 DNS records and others are created for you.

[ChangeSets][12] are not yet implemented but you will be able to preview further changes with `up stack plan` and commit them with `up stack apply`, much like you would with Terraform.

Check out the [configuration documentation][13] for more information.

#### Global deploys

The `regions` array allows you to specify target regions for your app. For example if you’re only interested in a single region you’d use:

```
{
  "regions": ["us-west-2"]
}
```

If your customers are concentrated in North America, you may want to use all of the US and CA regions:

```
{
  "regions": ["us-*", "ca-*"]
}
```

Lastly of course you can target all 14 regions currently supported:

```
{
  "regions": ["*"]
}
```

Multi-region support is still a work-in-progress as a few new AWS features are required to tie things together.

#### Static file serving

Up supports static file serving out of the box, with HTTP cache support, so you can use CloudFront or any other CDN in front of your application to dramatically reduce latency.

By default the working directory is served (`.`) when `type` is “static”, however you may provide a `static.dir` as well:

```
{  "name": "app",  "type": "static",  "static": {    "dir": "public"  }}
```

#### Build hooks

The build hooks allow you to define custom actions when deploying or performing other operations. A common example would be to bundle Node.js apps using Webpack or Browserify, greatly reducing the file size, as node_modules is  _huge_ .

```
{
  "name": "app",
  "hooks": {
    "build": "browserify --node server.js > app.js",
    "clean": "rm app.js"
  }
}
```

#### Script and stylesheet injection

Up allows you to inject scripts and styles, either inline or paths in a declarative manner. It even supports a number of “canned” scripts for Google Analytics and [Segment][14], just copy & paste your write key.

```
{
  "name": "site",
  "type": "static",
  "inject": {
    "head": [
      {
        "type": "segment",
        "value": "API_KEY"
      },
      {
        "type": "inline style",
        "file": "/css/primer.css"
      }
    ],
    "body": [
      {
        "type": "script",
        "value": "/app.js"
      }
    ]
  }
}
```

#### Rewrites and redirects

Up supports redirects and URL rewriting via the `redirects` object, which maps path patterns to a new location. If `status` is omitted (or 200) then it is a rewrite, otherwise it is a redirect.

```
{
  "name": "app",
  "type": "static",
  "redirects": {
    "/blog": {
      "location": "https://blog.apex.sh/",
      "status": 301
    },
    "/docs/:section/guides/:guide": {
      "location": "/help/:section/:guide",
      "status": 302
    },
    "/store/*": {
      "location": "/shop/:splat"
    }
  }
}
```

A common use-case for rewrites is for SPAs (Single Page Apps), where you want to serve the `index.html` file regardless of the path. Unless of course the file exists.

```
{
  "name": "app",
  "type": "static",
  "redirects": {
    "/*": {
      "location": "/",
      "status": 200
    }
  }
}
```

If you want to force the rule regardless of a file existing, just add `"force": true` .

#### Environment variables

Secrets will be in the next release, however for now plain-text environment variables are supported:

```
{
  "name": "api",
  "environment": {
    "API_FEATURE_FOO": "1",
    "API_FEATURE_BAR": "0"
  }
}
```

#### CORS support

The [CORS][16] support allows you to to specify which (if any) domains can access your API from the browser. If you wish to allow any site to access your API, just enable it:

```
{
  "cors": {
    "enable": true
  }
}
```

You can also customize access, for example restricting API access to your front-end or SPA only.

```
{
  "cors": {
    "allowed_origins": ["https://myapp.com"],
    "allowed_methods": ["HEAD", "GET", "POST", "PUT", "DELETE"],
    "allowed_headers": ["Content-Type", "Authorization"]
  }
}
```

#### Logging

For the low price of $0.5/GB you can utilize CloudWatch logs for structured log querying and tailing. Up implements a custom [query language][18] used to improve upon what CloudWatch provides, purpose-built for querying structured JSON logs.

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/2000/1*hrON4pH_WzN6CajaiU-ZYw.png)

You can query existing logs:

```
up logs
```

Tail live logs:

```
up logs -f
```

Or filter on either of them, for example only showing 200 GET / HEAD requests that take more than 5 milliseconds to complete:

```
up logs 'method in ("GET", "HEAD") status = 200 duration >= 5'
```

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/1600/1*Nhc5eiMM24gbiICFW7kBLg.png)

The query language is quite flexible, here are some more examples from `up help logs`

```
Show logs from the past 5 minutes.
$ up logs
```

```
Show logs from the past 30 minutes.
$ up logs -s 30m
```

```
Show logs from the past 5 hours.
$ up logs -s 5h
```

```
Show live log output.
$ up logs -f
```

```
Show error logs.
$ up logs error
```

```
Show error and fatal logs.
$ up logs 'error or fatal'
```

```
Show non-info logs.
$ up logs 'not info'
```

```
Show logs with a specific message.
$ up logs 'message = "user login"'
```

```
Show 200 responses with latency above 150ms.
$ up logs 'status = 200 duration > 150'
```

```
Show 4xx and 5xx responses.
$ up logs 'status >= 400'
```

```
Show emails containing @apex.sh.
$ up logs 'user.email contains "@apex.sh"'
```

```
Show emails ending with @apex.sh.
$ up logs 'user.email = "*@apex.sh"'
```

```
Show emails starting with tj@.
$ up logs 'user.email = "tj@*"'
```

```
Show errors from /tobi and /loki
$ up logs 'error and (path = "/tobi" or path = "/loki")'
```

```
Show the same as above with 'in'
$ up logs 'error and path in ("/tobi", "/loki")'
```

```
Show logs with a more complex query.
$ up logs 'method in ("POST", "PUT") ip = "207.*" status = 200 duration >= 50'
```

```
Pipe JSON error logs to the jq tool.
$ up logs error | jq
```

Note that the `and` keyword is implied, though you can use it if you prefer.

#### Cold start times

This is a property of AWS Lambda as a platform, but the cold start times are typically well below 1 second, and in the future I plan on providing an option to keep them warm.

#### Config validation

The `up config` command outputs the resolved configuration, complete with defaults and inferred runtime settings – it also serves the dual purpose of validating configuration, as any error will result in exit > 0.

#### Crash recovery

Another benefit of using Up as a reverse proxy is performing crash recovery — restarting your server upon crashes and re-attempting the request before responding to the client with an error.

For example suppose your Node.js application crashes with an uncaught exception due to an intermittent database issue, Up can retry this request before ever responding to the client. Later this behaviour will be more customizable.

#### Continuous integration friendly

It’s hard to call this a feature, but thanks to Golang’s relatively small and isolated binaries, you can install Up in a CI in a second or two.

#### HTTP/2

Up supports HTTP/2 out of the box via API Gateway, reducing the latency for serving apps and sites with with many assets. I’ll do more comprehensive testing against many platforms in the future, but Up’s latency is already favourable:

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/1600/1*psg0kJND1UCryXEa0D3VBA.jpeg)

#### Error pages

Up provides a default error page which you may customize with `error_pages` if you’d like to provide a support email or tweak the color.

```
{  "name": "site",  "type": "static",  "error_pages": {    "variables": {      "support_email": "support@apex.sh",      "color": "#228ae6"    }  }}
```

By default it looks like this:

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/2000/1*_Mdj6uTCGvYTCoXsNOSD6w.png)

If you’d like to provide custom templates you may create one or more of the following files. The most specific file takes precedence.

*   `error.html` – Matches any 4xx or 5xx

*   `5xx.html` – Matches any 5xx error

*   `4xx.html` – Matches any 4xx error

*   `CODE.html` – Matches a specific code such as 404.html

Check out the [docs][22] to read more about templating.

### Scaling and cost

So you’ve made it this far, but how well does Up scale? Currently API Gateway and AWS are the target platform, so you’re not required to make any changes in order to scale, just deploy your code and it’s done. You pay only for what you actually use, on-demand, and no manual intervention is required for scaling.

AWS offers 1,000,000 requests per month for free, but you can use [http://serverlesscalc.com][23] to plug in your expected traffic. In the future Up will provide additional platforms, so that if one becomes prohibitively expensive, you can migrate to another!

### The Future

That’s all for now! It may not look like much, but it’s clocking-in above 10,000 lines of code already, and I’ve just begun development. Take a look at the issue queue for a small look at what to expect in the future, assuming the project becomes sustainable.

If you find the free version useful please consider donating on [OpenCollective][24], as I do not make any money working on it. I will be working on early access to the Pro version shortly, with a discounted annual price for early adopters. Either the Pro or Enterprise editions will provide the source as well, so internal hotfixes and customizations can be made.

--------------------------------------------------------------------------------

via: https://medium.freecodecamp.org/up-b3db1ca930ee

作者：[TJ Holowaychuk ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.freecodecamp.org/@tjholowaychuk?source=post_header_lockup
[1]:https://medium.com/@tjholowaychuk/blueprints-for-up-1-5f8197179275
[2]:https://github.com/apex/up
[3]:https://github.com/apex/up
[4]:https://github.com/tj/gh-polls
[5]:https://github.com/apex/up/tree/master/docs
[6]:https://github.com/apex/up/releases
[7]:https://raw.githubusercontent.com/apex/up/master/install.sh
[8]:https://github.com/apex/up/blob/master/docs/aws-credentials.md
[9]:https://github.com/apex/apex
[10]:https://github.com/apex/up/blob/master/docs/runtimes.md
[11]:https://github.com/apex/up/issues/166
[12]:https://github.com/apex/up/issues/115
[13]:https://github.com/apex/up/blob/master/docs/configuration.md
[14]:https://segment.com/
[15]:https://blog.apex.sh/
[16]:https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS
[17]:https://myapp.com/
[18]:https://github.com/apex/up/blob/master/internal/logs/parser/grammar.peg
[19]:http://twitter.com/apex
[20]:http://twitter.com/apex
[21]:http://twitter.com/apex
[22]:https://github.com/apex/up/blob/master/docs/configuration.md#error-pages
[23]:http://serverlesscalc.com/
[24]:https://opencollective.com/apex-up
