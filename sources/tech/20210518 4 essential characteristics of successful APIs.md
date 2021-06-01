[#]: subject: (4 essential characteristics of successful APIs)
[#]: via: (https://opensource.com/article/21/5/successful-apis)
[#]: author: (Tom Wilson https://opensource.com/users/tomwillson4014)
[#]: collector: (lujun9972)
[#]: translator: (ywxgod)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

4 essential characteristics of successful APIs
======
An API needs to do much more than "just work."
![Looking at a map][1]

If you are building an application that uses some variation of a client/server model, you need an application programming interface (API). An API is a clearly defined boundary between one process and another. A common boundary in web applications is a REST/JSON API.

While developers may be mainly focused on making the API work (or function), there are some "non-functional" requirements that need their attention. Four _must-have_ non-functional requirements for all APIs are:

  * Security
  * Documentation
  * Validation
  * Testing



### Security

Security is an essential requirement in software development. There are four areas for API developers to include regarding security:

  1. HTTPS/SSL certificates
  2. Cross-origin resource sharing
  3. Authentication and JSON Web Tokens
  4. Authorizations and scopes



#### 1\. HTTPS/SSL certificates

The gold standard for the web is HTTPS using SSL certificates, and [Let's Encrypt][2] can help you achieve this. It is a free, automated, and open certificate authority from the non-profit Internet Security Research Group (ISRG).

Let's Encrypt's software generates central authority certificates for your domain. These certificates ensure payloads of data from your API to the client are encrypted from point to point.

Let's Encrypt supports several deployment options for certificate management; check out its [documentation][3] to find the right solution for your needs.

#### 2\. Cross-origin resource sharing

CORS is a browser-specific security policy preflight check. If your API server is not in the same domain as the requesting client's domain, you will need to deal with CORS. For example, if your server is running on **api.domain-a.com **and gets a client request from **domain-b.com**, CORS sends an HTTP precheck request to see if your API service will accept client-side requests from the client's domain.

[According to MDN][4]:

> "Cross-origin resource sharing (CORS) is an HTTP-header based mechanism that allows a server to indicate any other origins (domain, scheme, or port) than its own from which a browser should permit loading of resources."

![CORS principles][5]

([MDN Web Docs][4], [CC-BY-SA 2.5][6])

There are many helper libraries for [Node.js][7] to [help API developers with CORS][8].

#### 3\. Authentication and JSON Web Tokens

There are several approaches to validate an authenticated user in your API, but one of the best ways is to use JSON Web Tokens (JWT). These tokens are signed using various types of well-known cryptographic libraries.

When a client logs in, an identity-management service provides the client with a JWT. The client can then use this token to make requests to the API. The API has access to a public key or a secret that it uses to verify the token.

There are several libraries available to help verify tokens, including [jsonwebtoken][9]. For more information about JWT and the libraries that support it in every language, check out [JWT.io][10]. 

![JWT verification example][11]

(Tom Wilson, [Hyper63 blog][12])

#### 4\. Authorizations and scopes

Authentication (or identity verification) is important, but so is authorization, i.e., _does the verified client have the privilege to execute this request?_ This is where **scopes** are valuable. When the client authenticates with the identity management server and a JWT token is created, having the identity management service provide the scopes for the given authenticated client can enable the API service to determine if this verified client request can be performed without having to perform an additional costly lookup to an access control list.

A scope is a text block (usually space-delimited) that describes the access capability of an API endpoint. Normally, scopes are broken down between Resources and Actions. This pattern works well for REST/JSON APIs since they are very similarly structured in a RESOURCE:ACTION format (e.g., ARTICLE:WRITE or ARTICLE:READ, where ARTICLE is the resource and READ and WRITE are the actions).

This allows the API to focus on function and not roles or users. The identity access management service can relate roles and users to scopes, then provide the scopes to the client in a verified JWT.

#### Summary

When building and deploying APIs, security should always be one of the most important requirements. While security is a broad topic, addressing these four areas will position your API well for production environments.

### Documentation

_What's worse than no documentation? Outdated documentation._

Developers have a love–hate relationship with documentation. Still, documentation is a crucial part of an API's definition of success. Developers need to know how to use the API, and the documentation you create plays a huge role in educating developers on how to best use it.

There are three areas to focus on in API documentation:

  1. Developer onboarding (READMEs)
  2. Technical reference (Specifications)
  3. Usage (Getting started and other guides)



#### 1\. Developer onboarding

When building an API service, you need to specify things like: What does the API do? How do you set up a developer environment? How do you test the service? How do you submit an issue? How do you deploy it?

The usual way to answer these questions is with a README file. It is the file in your code repository that gives developers a starting point for working with your project.

A README should contain:

  * A description of the API
  * Links to technical references and guides
  * How to set up the project as a developer
  * How to test the project
  * How to deploy the project
  * Dependency management
  * Contribution guide
  * Code of conduct
  * License
  * Gratitude



Be concise in your README; you do not have to explain every aspect but give enough information so that developers can drill deeper as they become familiar with your project.

#### 2\. Technical reference

In a REST/JSON API, every endpoint is a specific function with a purpose. It is important to have technical documentation that specifies each endpoint; defines the description, inputs, and outputs that can occur; and provides examples for various clients.

REST/JSON has a specification standard called [OpenAPI][13], which can guide you through the details required to document an API. OpenAPI can also generate presentation documentation for your API.

#### 3\. Usage

Your API's users want more than just technical specifications. They want to know how to use your API in specific situations or cases. Most potential users have a problem and they are looking to your API to solve it.

A great way to introduce users to your API is with a "getting started" page. This can walk the user through a simple use case that gets them up to speed quickly on the benefits of your API.

#### Summary

Documentation is a key component of any successful API. When creating documentation, think about the three areas of focus—onboarding, technical, and usage—cover those bases, and you will have a well-documented API.

### Validation

One of the most often overlooked aspects of API development is validation. Validation is the process of verifying input from external sources. These sources might be a client sending JSON or a service responding to your request. More than just checking types, ensuring that the data is what it is supposed to be can eliminate many potential problems. Understanding your boundaries and what you do and don't have control over is an important aspect of validation.

The best strategy is to validate at the edges before your logic takes place. When a client sends your API some data, apply validation before you do anything else with that data. Make sure an email is an actual email address, a date is properly formatted, a string meets length requirements.

This simple check will add safety and consistency to your application. Also, when you receive data from a service, like a database or a cache, revalidate it to make sure the returned result meets your data checks.

You can always validate by hand or use utility function libraries like [Lodash][14] or [Ramda][15]. These work great for small data objects. Validation libraries like [Joi][16], [Yup][17], or [Zod][18] work even better, as they contain common validations that can save time and effort and create a very readable schema. If you need something language-agnostic, look at [JSON Schema][19].

#### Summary

Validation is not sexy, but it can save a ton of time that would otherwise be spent troubleshooting and writing data migration scripts. Don't make the mistake of trusting your client to send clean data; you don't want bad data leaked into your business logic or persistent data store. Take the time and validate your API endpoints and service responses. While it may cause some frustration upfront, it is much easier to loosen the reigns than to tighten them later.

### Testing

Testing is a best practice for software development and should be a primary non-functional requirement. Defining a test strategy can be a challenge for any project, including APIs. Always understand your constraints and define your strategy accordingly.

Integration testing is one of the most effective methods for testing APIs. In this pattern, the development team creates a test to cover some part of the application flow, from one specific point to another. A great integration test flow includes testing the API's entry point and mocking the request point to the service. By picking those two points, you cover the entire logic, from the beginning of the API request to the service request, and the mock service gives you a response to hand back to the API response.

Although it uses mocks, this method allows you to focus on the code in the logic layer and not depend on back-end services or presentation logic to run the test. Having no dependencies makes running the test much more reliable, easier to automate, and simpler to include in your continuous integration pipeline.

One setup I use for integration testing uses [Tape][20], [Test-server][21], and [Fetch-mock][22]. These libraries enable me to run isolated tests against API endpoints from the request to the response, with Fetch-mock catching the outbound request to the persistence layer.

#### Summary

While all types of testing and type checking are beneficial to APIs, integration testing offers the largest benefit in terms of effectiveness vs. time to build and manage. Using tools like Fetch-mock can provide clean mocking scenarios at the service boundary.

### Focus on the fundamentals

As you design and build your application and API, make sure to include these four fundamentals. These are not the only non-functional requirements to consider; others include application monitoring, logging, and API management. Even so, security, documentation, validation, and testing are crucial focus points for designing and building a successful API for any use case.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/successful-apis

作者：[Tom Wilson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tomwillson4014
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png?itok=L0BQHgjr (Looking at a map)
[2]: https://letsencrypt.org/
[3]: https://letsencrypt.org/docs/
[4]: https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
[5]: https://opensource.com/sites/default/files/uploads/cors_principle_1.png (CORS principles)
[6]: https://creativecommons.org/licenses/by-sa/2.5/
[7]: https://nodejs.org
[8]: https://www.npmjs.com/search?q=CORS
[9]: https://github.com/auth0/node-jsonwebtoken
[10]: https://jwt.io
[11]: https://opensource.com/sites/default/files/uploads/jwt-verify-example.png (JWT verification example)
[12]: https://blog.hyper63.com/content/images/2021/03/jwt-verify-example.png
[13]: https://spec.openapis.org/oas/v3.1.0
[14]: https://lodash.com
[15]: https://ramdajs.com/
[16]: https://joi.dev/
[17]: https://github.com/jquense/yup
[18]: https://github.com/colinhacks/zod/tree/v3
[19]: https://json-schema.org/
[20]: https://github.com/substack/tape
[21]: https://github.com/twilson63/test-server
[22]: http://www.wheresrhys.co.uk/fetch-mock/
