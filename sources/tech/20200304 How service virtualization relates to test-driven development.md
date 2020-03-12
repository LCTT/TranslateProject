[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How service virtualization relates to test-driven development)
[#]: via: (https://opensource.com/article/20/3/service-virtualization-test-driven-development)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

How service virtualization relates to test-driven development
======
Mountebank simulates services you're dependent on so autonomous teams
can continue development activities without having to wait on anyone.
![Person using a laptop][1]

The agile approach to software development relies on service virtualization to give each IT team autonomy. This approach removes blockages and allows autonomous teams to continue development activities without having to wait on anyone. That way, integration testing can commence as soon as teams start iterating/sprinting.

### How automated services work

Any automated service is available to consumers via a published endpoint. This means services can be automated only if they're made available online.

Any consumer wishing to leverage available automated services must be capable of sending requests to that service's endpoint via an HTTP protocol. Some of those services will, upon receiving the request via the HTTP protocol, respond by simply sending back some data. Other services may respond to receiving a request via HTTP protocol by actually performing some work. For example, a service may create a resource (for example, create an order), update a resource (update an order), or delete a resource (cancel an order).

All those activities get triggered via the HTTP protocol. In the simplest of cases, the action instigated by the service consumer is GET (e.g., HTTP GET). That request may arrive with some query values; those values will get used by the service to narrow down the search (such as "search for order number 12345 and return the data").

In more elaborate cases, a request may arrive with the instruction to POST some values; a service will accept that request and expect some values to be associated with it. Those values are usually called the payload. When the service accepts an HTTP POST request containing the payload, it will attempt to process it. It may or may not succeed in processing it, but either way, it will respond to the service consumer with a status code and an optional status message. That way, service consumers will be notified of the success/failure of their request so that they can decide what the next step should be.

### What is service virtualization?

Now that we understand how automated services work, it should be easier to understand how to virtualize them. In a nutshell, it is possible to simulate any service that is published on a hosting site. Instead of sending HTTP requests directly to the service provider's endpoint, you can interject a fake, pretend service that simulates the behavior of the real service.

From the service consumer's standpoint, it makes absolutely no difference whether it is interacting with a real or a fake service. The interaction remains identical.

### Virtualize one service

OK, enough talking, I'll roll up my sleeves and show how to do it in practical terms. Suppose your team is starting a new project and receives requirements in the form of a fully fleshed user story:

#### Authenticate user

_As a new app_
_I want to authenticate the user_
_Because we want to ensure proper security for the app_

#### Acceptance criteria

**Scenario #1:** _New app successfully authenticates the user_
Given that the user has navigated to the login page
And the user has submitted credentials
When new app receives login request
Then new app successfully authenticates the user
And new app displays response message "User successfully logged in."

**Scenario #2:** _New app cannot authenticate the user on the first attempt_
Given that the user has navigated to the login page
And the user has submitted credentials
When new app receives login request
Then new app fails to successfully authenticate the user
And new app displays response message "Incorrect login. You have 2 more attempts left."

**Scenario #3:** _New app cannot authenticate the user on the second attempt_
Given that the user has navigated to the login page
And the user has submitted credentials
When new app receives login request
Then new app fails to successfully authenticate the user
And new app displays response message "Incorrect login. You have 1 more attempt left."

**Scenario #4:** _New app cannot authenticate the user on the third attempt_
Given that the user has navigated to the login page
And the user has submitted credentials
When new app receives login request
Then new app fails to successfully authenticate the user
And new app displays response message "Incorrect login. You have no more attempts left."

The first thing to do when starting the work on this user story is to create the so-called "walking skeleton" (for this exercise, I will be using the standard **.Net Core** platform plus **xUnit.net** I discussed in my previous articles ([starting with this one][2] with [another example here][3]). Please refer to them for technical details on how to install, configure, and run the required tools.

Create the walking skeleton infrastructure by opening the command line and typing:


```
`mkdir AuthenticateUser`
```

Then move inside the **AuthenticateUser** folder:


```
`cd AuthenticateUser`
```

And create a separate folder for tests:


```
`mkdir tests`
```

Move into the **tests** folder (**cd tests**) and initiate the **xUnit** framework:


```
`dotnet new xunit`
```

Now move one folder up (back to **AuthenticateUser**) and create the app folder:


```
mkdir app
cd app
```

Create the scaffold necessary for C# code:


```
`dotnet new classlib`
```

The walking skeleton is now ready! Open the editor of your choice and start coding.

### Write a failing test first

In the spirit of TDD, start by writing the failing test (refer to the [previous article][4] to learn why is it important to see your test fail before attempting to make it pass):


```
using System;
using Xunit;
using app;

namespace tests {
    public class UnitTest1 {
        Authenticate auth = [new][5] Authenticate();

        [Fact]
        public void SuccessLogin(){
            var given = "credentials";
            var expected = "Successful login.";
            var actual = auth.Login(given);
            Assert.Equal(expected, actual);
        }
    }
}
```

This test states that if someone supplies some credentials (i.e., a secret username and password) to the **Login** method of the **Authenticate** component when it processes the request, it is expected to return the message "Successful login."

Of course, this is functionality that does not exist yet—the instantiated **Authenticate** module in the **SuccessLogin()** module hasn't been written yet. So you might as well go ahead and take the first stab at writing the desired functionality. Create a new file (**Authenticate.cs**) in the **app** folder and add the following code:


```
using System;

namespace app {
    public class Authenticate {
        public string Login(string credentials) {
            return "Not implemented";
        }
    }
}
```

Now, navigate to the **tests** folder and run:


```
`dotnet test`
```

![Output of dotnet.test][6]

The test fails because it was expecting a "Successful login" output but instead got the "Not implemented" output.

### Increasing complexity for day two operations

Now that you have created the "happy path" expectation and made it fail, it is time to work on implementing the functionality that will make the failing test pass. The following day, you attend the standup and report that you have started on the "Authenticate user" story. You let the team know that you have created the first failing test for the "happy path," and today, the plan is to implement the code to make the failing test pass.

You explain your intention to first create a **User** table containing the **username**, **password**, and other pertinent attributes. But the scrum master interrupts and explains that the **User** module is being handled by another team. It would be bad practice to duplicate the maintenance of users, as the information will quickly get out of sync. So instead of building the **User** module (which would include the authentication logic), you are to leverage the authentication services that the **User** team is working on.

That's great news because it saves you the trouble of having to write a lot of code to implement the **User** processing. Emboldened, you enthusiastically announce that you will quickly cobble up a function that will take user credentials and send them to the service that the **User** team has built.

Alas, your intentions get squashed again as you learn that the **User** team hasn't started building the **User authentication** service yet. They're still in the process of assigning user stories to the backlog. Disheartened, you resign to the fact that it will be at least a few days (if not weeks?) before you can start working on the **User authentication** story.

The scrum master then says that there is no reason to wait for the **User authentication** service to be built and deployed to testing. You could start developing the authentication functionality right away. But how can you do that?

The scrum master offers a simple suggestion: leverage service virtualization. Since all specifications for the **User** module have been solidified and signed off, you have a solid, non-volatile contract to build your solution against. The contract published by the **User** services team states that in order to authenticate a user, specific expectations must be fulfilled:

  1. A client wishing to authenticate a user should send an **HTTP POST** request to the endpoint <http://some-domain.com/api/v1/users/login>.
  2. The **HTTP POST** sent to the above endpoint must have a **JSON** payload that contains the user credentials (i.e., username and password).
  3. Upon receiving the request, the service will attempt to log the user in. If the username and password match the information on record, the service will return an **HTTP** response containing status code 200 with the body of the response containing the message "User successfully logged in."



So, now that you know the contract details, you can start building the solution. Here's the code that connects to the endpoint, sends the **HTTP POST** request, and receives the **HTTP** response:


```
using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace app {
    public class Authenticate {
        HttpClient client = [new][5] HttpClient();
        string endPoint = "<http://some-domain.com/api/v1/users/login>";

        public string Login(string credentials) {
            Task&lt;string&gt; response = CheckLogin(credentials);
            return response.Result;
        }

        private async Task&lt;string&gt; CheckLogin(string credentials) {
            var values = [new][5] Dictionary&lt;string, string&gt;{{"credentials", credentials}};
            var content = [new][5] FormUrlEncodedContent(values);
            var response = await client.PostAsync(endPoint, content);
            return await response.Content.ReadAsStringAsync();
        }
    }
}
```

This code won't work because <http://some-domain.com> does not exist (yet). Are you stuck now, waiting for the other team to eventually build and deploy that service?

Not really. Service virtualization to rescue! Let's pretend that the service is already there and continue the development.

### How to virtualize a service

One way to virtualize the **User authentication** service would be to write a new app (the new API) and run it locally. This API will mirror the contract specified by the real **User authentication** API and will only return hard-coded stubbed data (it will be a fake service).

Sounds like a good plan. Again, the team pushes back during the standup, questioning the need for writing, building, testing, and deploying a brand new app just to accomplish this fake functionality. It kind of wouldn't be worth the trouble because, by the time you deliver that new fake app, the other team would probably be ready with the real service.

So you've reached an impasse. It looks like you are forced to wait on your dependency to materialize. You've failed to control your dependencies; you now have no recourse but to work in a sequential fashion.

Not so fast! There is a great new tool called [mountebank][7] that is ideal for virtualizing any service. Using this tool, you can quickly stand up a local server that listens on a port you specify and takes orders. To make it simulate a service, you only have to tell it which port to listen to and which protocol to handle. The choice of protocols is:

  * HTTP
  * HTTPS
  * SMTP
  * TCP



In this case, you need the HTTP protocol. First, install mountebank—if you have **npm** on your computer, you can simply type on the command line:


```
`npm install -g mountebank`
```

After it's installed, run mountebank by typing:


```
`mb`
```

At startup, mountebank will show:

![mountebank startup][8]

Now you're ready to virtualize an HTTP service. In this case, the **User authentication** service expects to receive an HTTP POST request; here is how the implemented code sends an HTTP POST request:


```
`var response = await client.PostAsync(endPoint, content);`
```

You now have to establish that **endPoint**. Ideally, all virtualized services should be propped in the **localhost** server to ensure quick execution of integration tests.

To do that, you need to configure the **imposter**. In its bare-bones form, the **imposter** is a simple JSON collection of key-value pairs containing the definition of a port and a protocol:


```
{
    "port": 3001,
    "protocol": "http"
}
```

This imposter is configured to handle the HTTP protocol and to listen to incoming requests on port 3001.

Just listening to incoming HTTP requests on port 3001 is not going to do much. Once the request arrives at that port, mountebank needs to be told what to do with that request. In other words, you are virtualizing not only the availability of a service on a specific port but also the way that virtualized service is going to respond to the request.

To accomplish that level of service virtualization, you need to tell mountebank how to configure stubs. Each stub consists of two components:

  1. A collection of predicates
  2. A collection of expected responses



A predicate (sometimes called a matcher) narrows down the scope of the incoming request. For example, using the HTTP protocol, you can expect more than one type of method (e.g., GET, POST, PUT, DELETE, PATCH, etc.). In most service-virtualization scenarios, we are interested in simulating the behavior that is specific to a particular HTTP method. This scenario is about responding to the HTTP POST request, so you need to configure your stub to match on HTTP POST requests only:


```
{
    "port": 3001,
    "protocol": "http",
    "stubs": [
        {
            "predicates": [
                {
                    "equals": {
                        "method": "post"
                    }
                }
            ]
        }
    ]
}
```

This imposter defines one predicate that matches (using the keyword **equals**) on the HTTP POST request only.

Now take a closer look at the **endPoint** value, as defined in the implemented code:


```
`string endPoint = "http://localhost:3001/api/v1/users/login";`
```

In addition to listening to port 3001 (as defined in <http://localhost:3001>), the **endPoint** is more specific, in that it expects the incoming HTTP POST request to go to the /api/v1/users/login path. How do you tell mountebank to only match exactly on the /api/v1/users/login path? By adding the path key-value pair to the stub's predicate:


```
{
    "port": 3001,
    "protocol": "http",
    "stubs": [
        {
            "predicates": [
                {
                    "equals": {
                        "method": "post",
                        "path": "/api/v1/users/login"
                    }
                }
            ]
        }
    ]
}
```

This imposter now knows that HTTP requests arriving at port 3001 must be a POST method and must point at the /api/v1/users/login path. The only thing left to simulate is the expected HTTP response.

Add the response to the JSON imposter:


```
{
    "port": 3001,
    "protocol": "http",
    "stubs": [
        {
            "predicates": [
                {
                    "equals": {
                        "method": "post",
                        "path": "/api/v1/users/login"
                    }
                }
            ],
            "responses": [
                {
                    "is": {
                        "statusCode": 200,
                        "body": "Successful login."
                    }
                }
            ]
        }
    ]
}
```

With mountebank imposters, you define responses as a collection of JSON key-value pairs. In most cases, it is sufficient to simply state that a response is a **statusCode** and a **body**. This case is simulating the "happy path" response that has the status code **OK (200)** and the body containing a simple message **Successful login** (as specified in the acceptance criteria).

### How to run virtualized services?

OK, now that you have virtualized the **User authentication** service (at least its "happy path"), how do you run it?

Remember that you have already started mountebank, and it reported that it is running in memory as the <http://localhost> domain. Mountebank is listening on port 2525 and taking orders.

Great, now you have to tell mountebank that you have the imposter ready. How do you do that? Send an HTTP POST request to <http://localhost:2525/imposters>. The requests body must contain the JSON you created above. There are a few techniques available to send that request. If you're versed in [curl][9], using it to send HTTP POST requests would be the simplest, quickest way to stand up the imposter. But many people prefer a more user-friendly way to send the HTTP POST to mountebank.

The easy way to do that is to use [Postman][10]. If you download and install Postman, you can point it at <http://localhost:2525/imposters>, select the POST method from the pulldown menu, and copy and paste the imposter JSON into the raw body.

When you click Send, the imposter will be created, and you should get Status 201 (Created).

![Postman output][11]

Your virtualized service is now running! You can verify it by navigating to the **tests** folder and running the **dotnet test** command:

![dotnet test output][12]

### Conclusion

This demo shows how easy it is to remove blockages and control dependencies by simulating services you're dependent on. Mountebank is a fantastic tool that easily and cheaply simulates all kinds of very elaborate, sophisticated services.

In this installment, I just had time to illustrate how to virtualize a simple "happy path" service. If you go back to the actual user story, you will notice that its acceptance criteria contain several "less happy" paths (cases when someone is repeatedly trying to log in using invalid credentials). It's a bit trickier to properly virtualize and test those use cases, so I've left that exercise for the next installment in this series.

How will you use service virtualization to solve your testing needs? I would love to hear about it in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/service-virtualization-test-driven-development

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/19/8/mutation-testing-evolution-tdd
[3]: https://opensource.com/article/19/9/mutation-testing-example-tdd
[4]: https://opensource.com/article/20/2/automate-unit-tests
[5]: http://www.google.com/search?q=new+msdn.microsoft.com
[6]: https://opensource.com/sites/default/files/uploads/dotnet-test.png (Output of dotnet.test)
[7]: http://www.mbtest.org/
[8]: https://opensource.com/sites/default/files/uploads/mountebank-startup.png (mountebank startup)
[9]: https://curl.haxx.se/
[10]: https://www.postman.com/
[11]: https://opensource.com/sites/default/files/uploads/status-201.png (Postman output)
[12]: https://opensource.com/sites/default/files/uploads/dotnet-test2.png (dotnet test output)
