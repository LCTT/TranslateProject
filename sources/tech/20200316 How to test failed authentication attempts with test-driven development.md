[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to test failed authentication attempts with test-driven development)
[#]: via: (https://opensource.com/article/20/3/failed-authentication-attempts-tdd)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

How to test failed authentication attempts with test-driven development
======
Mountebank makes it easier to test the "less happy path" in your code.
![Programming keyboard.][1]

Testing often begins with what we hope happens. In my [previous article][2], I demonstrated how to virtualize a service you depend on when processing the "happy path" scenario (that is, testing the outcome of a successful login attempt). But we all know that software fails in spectacular and unexpected ways. Now's the time to take a closer look into how to process the "less happy paths": what happens when someone tries to log in with the wrong credentials?

In the first article linked above, I walked through building a user authentication module. (Now is a good time to review that code and get it up and running.) This module does not do all the heavy lifting; it mostly relies on another service to do those tougher tasks—enable user registration, store the user accounts, and authenticate the users. The module will only be sending HTTP POST requests to this additional service's endpoint; in this case, **/api/v1/users/login**.

What do you do if the service you're dependent on hasn't been built yet? This scenario creates a blockage. In the previous post, I explored how to remove that blockage by using service virtualization enabled by [mountebank][3], a powerful test environment.

This article walks through the steps required to enable the processing of user authentication in cases when a user repeatedly attempts to log in. The third-party authentication service allows only three attempts to log in, after which it ceases to service the HTTP request arriving from the offending domain.

### How to simulate repeat requests

Mountebank makes it very easy to simulate a service that listens on a network port, matches the method and the path defined in the request, then handles it by sending back an HTTP response. To follow along, be sure to get mountebank running as we [did in the previous article][2]. As I explained there, these values are declared as JSONs that are posted to **<http://localhost:2525/imposters>**, mountebank's endpoint for processing authentication requests.

But the challenge now is how to simulate the scenario when the HTTP request keeps hitting the same endpoint from the same domain. This is necessary to simulate a user who submits invalid credentials (username and password), is informed they are invalid, tries different credentials, and is repeatedly rejected (or foolishly attempts to log in with the same credentials that failed on previous attempts). Eventually (in this case, after a third failed attempt), the user is barred from additional tries.

Writing executable code to simulate such a scenario would have to model very elaborate processing. However, when using mountebank, this type of simulated processing is extremely simple to accomplish. It is done by creating a rolling buffer of responses, and mountebank responds in the order the buffer was created. Here is an example of one way to simulate repeat requests in mountebank:


```
{
    "port": 3001,
    "protocol": "http",
    "name": "authentication imposter",
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
                        "body": "Successfully logged in."
                    }
                },
                {
                    "is": {
                        "statusCode": 400,
                        "body": "Incorrect login. You have 2 more attempts left."
                    }
                },
                {
                    "is": {
                        "statusCode": 400,
                        "body": "Incorrect login. You have 1 more attempt left."
                    }
                },
                {
                    "is": {
                        "statusCode": 400,
                        "body": "Incorrect login. You have no more attempts left."
                    }
                }
            ]
        }
    ]
}
```

The rolling buffer is simply an unlimited collection of JSON responses where each response is represented with two key-value pairs: **statusCode** and **body**. In this case, four responses are defined. The first response is the happy path (i.e., user successfully logged in), and the remaining three responses represent failed use cases (i.e., wrong credentials result in status code 400 and corresponding error messages).

### How to test repeat requests

Modify the tests as follows:


```
using System;
using Xunit;
using app;
namespace tests
{
    public class UnitTest1
    {
        Authenticate auth = [new][4] Authenticate();
        [Fact]
        public void SuccessfulLogin()
        {
            var given = "valid credentials";
            var expected = " Successfully logged in.";
            var actual= auth.Login(given);
            Assert.Equal(expected, actual);
        }
        [Fact]
        public void FirstFailedLogin()
        {
            var given = "invalid credentials";
            var expected = "Incorrect login. You have 2 more attempts left.";
            var actual = auth.Login(given);
            Assert.Equal(expected, actual);
        }
        [Fact]
        public void SecondFailedLogin()
        {
            var given = “invalid credentials";
            var expected = "Incorrect login. You have 1 more attempt left.";
            var actual = auth.Login(given);
            Assert.Equal(expected, actual);
        }
        [Fact]
        public void ThirdFailedLogin()
        {
            var given = " invalid credentials";
            var expected = "Incorrect login. You have no more attempts left.";
            var actual = auth.Login(given);
            Assert.Equal(expected, actual);
        }
    }
}
```

Now, run the tests to confirm that your code still works:

![Failed test][5]

Whoa! The tests now all fail. Why?

If you take a closer look, you'll see a revealing pattern:

![Reason for failed test][6]

Notice that ThirdFailedLogin is executed first, followed by the SuccessfulLogin, followed by FirstFailedLogin, followed by SecondFailedLogin. What's going on here? Why is the third test running before the first test?

The testing framework ([xUnit][7]) is executing all tests in parallel, and the sequence of execution is unpredictable. You need tests to run in order, which means you cannot test these scenarios using the vanilla xUnit toolkit.

### How to run tests in the right sequence

To force your tests to run in a certain sequence that you define (instead of running in an unpredictable order), you need to extend the vanilla xUnit toolkit with the NuGet [Xunit.Extensions.Ordering][8] package. Install the package on the command line with:


```
`$ dotnet add package Xunit.Extensions.Ordering --version 1.4.5`
```

or add it to your **tests.csproj** config file:


```
`<PackageReference Include="Xunit.Extensions.Ordering" Version="1.4.5" />`
```

Once that's taken care of, make some modifications to your **./tests/UnitTests1.cs** file. Add these four lines at the beginning of your **UnitTests1.cs **file:


```
using Xunit.Extensions.Ordering;
[assembly: CollectionBehavior(DisableTestParallelization = true)]
[assembly: TestCaseOrderer("Xunit.Extensions.Ordering.TestCaseOrderer", "Xunit.Extensions.Ordering")]
[assembly: TestCollectionOrderer("Xunit.Extensions.Ordering.CollectionOrderer", "Xunit.Extensions.Ordering")]
```

Now you can specify the order you want your tests to run. Initially, simulate the happy path (i.e., the **SuccessfulLogin()**) by annotating the test with:


```
[Fact, Order(1)]
public void SuccessfulLogin() {
```

After you test a successful login, test the first failed login:


```
[Fact, Order(2)]
public void FirstFailedLogin()
```

And so on. You can add the order of the test runs by simply adding the **Order(x)** (where **x** denotes the order you want the test to run) annotation to your Fact.

This annotation guarantees that your tests will run in the exact order you want them to run, and now you can (finally!) completely test your integration scenario.

The final version of your test is:


```
using System;
using Xunit;
using app;
using Xunit.Extensions.Ordering;
[assembly: CollectionBehavior(DisableTestParallelization = true)]
[assembly: TestCaseOrderer("Xunit.Extensions.Ordering.TestCaseOrderer", "Xunit.Extensions.Ordering")]
[assembly: TestCollectionOrderer("Xunit.Extensions.Ordering.CollectionOrderer", "Xunit.Extensions.Ordering")]
namespace tests
{
    public class UnitTest1
    {
        Authenticate auth = [new][4] Authenticate();
        [Fact, Order(1)]
        public void SuccessfulLogin()
        {
            var given = "[elon_musk@tesla.com][9]";
            var expected = "Successfully logged in.";
            var actual= auth.Login(given);
            Assert.Equal(expected, actual);
        }
        [Fact, Order(2)]
        public void FirstFailedLogin()
        {
            var given = "[mickey@tesla.com][10]";
            var expected = "Incorrect login. You have 2 more attempts left.";
            var actual = auth.Login(given);
            Assert.Equal(expected, actual);
        }
        [Fact, Order(3)]
        public void SecondFailedLogin()
        {
            var given = "[mickey@tesla.com][10]";
            var expected = "Incorrect login. You have 1 more attempt left.";
            var actual = auth.Login(given);
            Assert.Equal(expected, actual);
        }
        [Fact, Order(4)]
        public void ThirdFailedLogin()
        {
            var given = "[mickey@tesla.com][10]";
            var expected = "Incorrect login. You have no more attempts left.";
            var actual = auth.Login(given);
            Assert.Equal(expected, actual);
        }
    }
}
```

Run the test again—everything passes!

![Passing test][11]

### What are you testing exactly?

This article has focused on test-driven development (TDD), but let's review it from another methodology, Extreme Programming (XP). XP defines two types of tests:

  1. Programmer tests
  2. Customer tests



So far, in this series of articles on TDD, I have focused on the first type of tests (i.e., programmer tests). In this and the previous article, I switched my lenses to examine the most efficient ways of doing customer tests.

The important point is that programmer (or producer) tests are focused on precision work. We often refer to these precision tests as "micro tests," while others may call them "unit tests." Customer tests, on the other hand, are more focused on a bigger picture; we sometimes refer to them as "approximation tests" or "end-to-end tests."

### Conclusion

This article demonstrated how to write a suite of approximation tests that integrate several discrete steps and ensure that the code can handle all edge cases, including simulating the customer experience when repeatedly attempting to log in and failing to obtain the necessary clearance. This combination of TDD and tools like xUnit and mountebank can lead to well-tested and thus more reliable application development.

In future articles, I'll look into other usages of mountebank for writing customer (or approximation) tests.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/failed-authentication-attempts-tdd

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A (Programming keyboard.)
[2]: https://opensource.com/article/20/3/service-virtualization-test-driven-development
[3]: http://www.mbtest.org/
[4]: http://www.google.com/search?q=new+msdn.microsoft.com
[5]: https://opensource.com/sites/default/files/uploads/testfails_0.png (Failed test)
[6]: https://opensource.com/sites/default/files/uploads/failurepattern.png (Reason for failed test)
[7]: https://xunit.net/
[8]: https://www.nuget.org/packages/Xunit.Extensions.Ordering/#
[9]: mailto:elon_musk@tesla.com
[10]: mailto:mickey@tesla.com
[11]: https://opensource.com/sites/default/files/uploads/testpasses.png (Passing test)
