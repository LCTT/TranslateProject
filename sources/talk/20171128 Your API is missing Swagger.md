Your API is missing Swagger
======

![](https://ryanmccue.ca/content/images/2017/11/top-20mobileapps--3-.png)

We have all struggled through thrown together, convoluted API documentation. It is frustrating, and in the worst case, can lead to bad requests. The process of understanding an API is something most developers go through on a regular basis, so it is any wonder that the majority of APIs have horrific documentation.

[Swagger][1] is the solution to this problem. Swagger came out in 2011 and is an open source software framework which has many tools that help developers design, build, document, and consume RESTful APIs. Designing an API using Swagger, or documenting it after with Swagger helps everyone consumers of your API seamlessly. One of the amazing features which many people do not know about Swagger is that you can actually **generate** a client from it! That's right, if a service you're consuming has Swagger documentation you can generate a client to consume it!

All major languages support Swagger and connect it to your API. Depending on the language you're writing your API in you can have the Swagger documentation generated from the actual code. Here are some of the standout Swagger libraries I've seen recently.

### Golang

Golang has a couple great tools for integrating Swagger into your API. The first is [go-swagger][2], which is a tool that lets you generate the scaffolding for an API from a Swagger file. This is a fundamentally different way of thinking about APIs. Instead of building the endpoints and thinking about new ones on the fly, go-swagger gets you to think through your API before you write a single line of code. This can help visualize what you want the API to do first. Another tool which Golang has is called [Goa][3]. A quote from their website sums up what Goa is:

> goa provides a novel approach for developing microservices that saves time when working on independent services and helps with keeping the overall system consistent. goa uses code generation to handle both the boilerplate and ancillary artifacts such as documentation, client modules, and client tools.

They take designing the API before implementing it to a new level. Goa has a DSL to help you programmatically describe your entire API, from endpoints to payloads, to responses. From this DSL Goa generates a Swagger file for anyone that consumes your API, and it will enforce your endpoints output the correct data, which will keep your API and documentation in sync. This is counter-intuitive when you start, but after actually implementing an API with Goa, you will not know how you ever did it before.

### Python

[Flask][4] has a great extension for building an API with Swagger called [Flask-RESTPlus][5].

> If you are familiar with Flask, Flask-RESTPlus should be easy to pick up. It provides a coherent collection of decorators and tools to describe your API and expose its documentation properly using Swagger.

It uses python decorators to generate swagger documentation and can be used to enforce endpoint output similar to Goa. It can be very powerful and makes generating swagger from an API stupid easy.

### NodeJS

Finally, NodeJS has a powerful tool for working with Swagger called [swagger-js-codegen][6]. It can generate both servers and clients from a swagger file.

> This package generates a nodejs, reactjs or angularjs class from a swagger specification file. The code is generated using mustache templates and is quality checked by jshint and beautified by js-beautify.

It is not quite as easy to use as Goa and Flask-RESTPlus, but if Node is your thing, this will do the job. It shines when it comes to generating frontend code to interface with your API, which is perfect if you're developing a web app to go along with the API.

### Conclusion

Swagger is a simple yet powerful representation of your RESTful API. When used properly it can help flush out your API design and make it easier to consume. Harnessing its full power can save you time by forming and visualizing your API before you write a line of code, then generate the boilerplate surrounding the core logic. And with tools like [Goa][3], [Flask-RESTPlus][5], and [swagger-js-codegen][6] which will make the whole experience of architecting and implementing an API painless, there is no excuse not to have Swagger.

--------------------------------------------------------------------------------

via: https://ryanmccue.ca/your-api-is-missing-swagger/

作者：[Ryan McCue][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://ryanmccue.ca/author/ryan/
[1]:http://swagger.io
[2]:https://github.com/go-swagger/go-swagger
[3]:https://goa.design/
[4]:http://flask.pocoo.org/
[5]:https://github.com/noirbizarre/flask-restplus
[6]:https://github.com/wcandillon/swagger-js-codegen
