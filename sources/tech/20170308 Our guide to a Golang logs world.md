Our guide to a Golang logs world
============================================================

 ![golang logo](https://logmatic.io/wp-content/uploads/2017/03/golang-logo.png) 

Do you ever get tired of solutions that use convoluted languages, that are complex to deploy, and for which building takes forever? Golang is the solution to these very issues, being as fast as C and as simple as Python.

But how do you monitor your application with Golang logs? There are no exceptions in Golang, only errors. Your first impression might thus be that developing a Golang logging strategy is not going to be such a straightforward affair. The lack of exceptions is not in fact that troublesome, as exceptions have lost their exceptionality in many programming languages: they are often overused to the point of being overlooked.

We’ll first cover here Golang logging basics before going the extra mile and discuss Golang logs standardization, metadatas significance, and minimization of Golang logging impact on performance.
By then, you’ll be able to track a user’s behavior across your application, quickly identify failing components in your project as well as monitor overall performance and user’s happiness.

### I. Basic Golang logging

### 1) Use Golang “log” library

Golang provides you with a native [logging library][3] simply called “log”. Its logger is perfectly suited to track simple behaviors such as adding a timestamp before an error message by using the available [flags][4].

Here is a basic example of how to log an error in Golang:

```
package main

import (
	"log"
	"errors"
	"fmt"
	)

func main() {
   /* local variable definition */
  ...

   /* function for division which return an error if divide by 0 */
   ret,err = div(a, b)
if err != nil {
 log.Fatal(err)
	}
	fmt.Println(ret)
}
```

And here comes what you get if you try to divide by 0:

 ![golang code](https://logmatic.io/wp-content/uploads/2017/03/golang-code.png) 

In order to quickly test a function in Golang you can use the [go playground][5].

To make sure your logs are easily accessible at all times, we recommend to write them in a file:

```
package main
import (
        "log"
        "os"
)
func main() {
        //create your file with desired read/write permissions
        f, err := os.OpenFile("filename", os.O_WRONLY|os.O_CREATE|os.O_APPEND, 0644)
        if err != nil {
                log.Fatal(err)
        }   
        //defer to close when you're done with it, not because you think it's idiomatic!
        defer f.Close()
        //set output of logs to f
        log.SetOutput(f)
        //test case
        log.Println("check to make sure it works")
}
```

You can find a complete tutorial for Golang log library [here][6] and find the complete list of available functions within their “log” [library][7].

So now you should be all set to log errors and their root causes.

But logs can also help you piece an activity stream together, identify an error context that needs fixing or investigate how a single request is impacting several layers and API’s in your system.
And to get this enhanced type of vision, you first need to enrich your Golang logs with as much context as possible as well as standardize the format you use across your project. This is when Golang native library reaches its limits. The most widely used libraries are then [glog][8] and [logrus][9]. It must be said though that many good libraries are available. So if you’re already using one that uses JSON format you don’t necessarily have to change library, as we’ll explain just below.

### II. A consistent format for your Golang logs

### 1) The structuring advantage of JSON format

Structuring your Golang logs in one project or across multiples microservices is probably the hardest part of the journey, even though it  _could_  seem trivial once done. Structuring your logs is what makes them especially readable by machines (cf our [collecting logs best practices blogpost][10]). Flexibility and hierarchy are at the very core of the JSON format, so information can be easily parsed and manipulated by humans as well as by machines.

Here is an example of how to log in JSON format with the [Logrus/Logmatic.io][11] library:

```
package main
import (
  log "github.com/Sirupsen/logrus"
  "github.com/logmatic/logmatic-go"
)
func main() {
    // use JSONFormatter
    log.SetFormatter(&logmatic.JSONFormatter{})
        // log an event as usual with logrus
    log.WithFields(log.Fields{"string": "foo", "int": 1, "float": 1.1 }).Info("My first ssl event from golang")
}
```

Which comes out as:

```
{	
    "date":"2016-05-09T10:56:00+02:00",
    "float":1.1,
    "int":1,
    "level":"info",
    "message":"My first ssl event from golang",
    "String":"foo"
}
```

### 2) Standardization of Golang logs

It really is a shame when the same error encountered in different parts of your code is registered differently in logs. Picture for example not being able to determine a web page loading status because of an error on one variable. One developer logged:

```
message: 'unknown error: cannot determine loading status from unknown error: missing or invalid arg value client'</span>
```

While the other registered:

```
unknown error: cannot determine loading status - invalid client</span>
```

A good solution to enforce logs standardization is to create an interface between your code and the logging library. This standardization interface would contain pre-defined log messages for all possible behavior you want to add in your logs. Doing so prevent custom log messages that would not match your desired standard format…. And in so doing facilitates log investigation.

 ![interface function](https://logmatic.io/wp-content/uploads/2017/03/functions-interface.png) 

As log formats are centralized it becomes way easier to keep them up to date. If a new type of issue arises it only requires to be added in one interface for every team member to use the exact same message.

The most basic example would be to add the logger name and id before Golang log messages. Your code would then send “events” to your standardization interface that would in turn transform them into Golang log messages.

The most basic example would be to add the logger name and the id before the Golang log message. Your code would then send “events” to this interface that would transform them into Golang log messages:

```
// The main part, we define all messages right here.
// The Event struct is pretty simple. We maintain an Id to be sure to
// retrieve simply all messages once they are logged
var (
	invalidArgMessage = Event{1, "Invalid arg: %s"}
	invalidArgValueMessage = Event{2, "Invalid arg value: %s => %v"}
	missingArgMessage = Event{3, "Missing arg: %s"}
)

// And here we were, all log events that can be used in our app
func (l *Logger)InvalidArg(name string) {
	l.entry.Errorf(invalidArgMessage.toString(), name)
}
func (l *Logger)InvalidArgValue(name string, value interface{}) {
	l.entry.WithField("arg." + name, value).Errorf(invalidArgValueMessage.toString(), name, value)
}
func (l *Logger)MissingArg(name string) {
	l.entry.Errorf(missingArgMessage.toString(), name)
}
```

So if we use the previous example of the invalid argument value, we would get similar log messages:

```
time="2017-02-24T23:12:31+01:00" level=error msg="LoadPageLogger00003 - Missing arg: client - cannot determine loading status" arg.client=<nil> logger.name=LoadPageLogger
```

And in JSON format:

```
{"arg.client":null,"level":"error","logger.name":"LoadPageLogger","msg":"LoadPageLogger00003 - Missing arg: client - cannot determine loading status", "time":"2017-02-24T23:14:28+01:00"}
```

### III. The power of context in Golang logs

Now that the Golang logs are written in a structured and standardized format, time has come to decide which context and other relevant information should be added to them. Context and metadatas are critical in order to be able to extract insights from your logs such as following a user activity or its workflow.

For instance the Hostname, appname and session parameters could be added as follows using the JSON format of the logrus library:

```
// For metadata, a common pattern is to re-use fields between logging statements  by re-using
  contextualizedLog := log.WithFields(log.Fields{
    "hostname": "staging-1",
    "appname": "foo-app",
    "session": "1ce3f6v"
  })
contextualizedLog.Info("Simple event with global metadata")
```

Metadatas can be seen as javascript breadcrumbs. To better illustrate how important they are, let’s have a look at the use of metadatas among several Golang microservices. You’ll clearly see how decisive it is to track users on your application. This is because you do not simply need to know that an error occurred, but also on which instance and what pattern created the error. So let’s imagine we have two microservices which are sequentially called. The contextual information is transmitted and stored in the headers:

```
func helloMicroService1(w http.ResponseWriter, r *http.Request) {
client := &http.Client{}
// This service is responsible to received all incoming user requests
// So, we are checking if it's a new user session or a another call from
// an existing session
session := r.Header.Get("x-session")
if ( session == "") {
session = generateSessionId()
// log something for the new session
}
// Track Id is unique per request, so in each case we generate one
track := generateTrackId()
// Call your 2nd microservice, add the session/track
reqService2, _ := http.NewRequest("GET", "http://localhost:8082/", nil)
reqService2.Header.Add("x-session", session)
reqService2.Header.Add("x-track", track)
resService2, _ := client.Do(reqService2)
….
```

So when the second service is called:

```
func helloMicroService2(w http.ResponseWriter, r *http.Request) {
// Like for the microservice, we check the session and generate a new track
session := r.Header.Get("x-session")
track := generateTrackId()
// This time, we check if a track id is already set in the request,
// if yes, it becomes the parent track
parent := r.Header.Get("x-track")
if (session == "") {
w.Header().Set("x-parent", parent)
}
// Add meta to the response
w.Header().Set("x-session", session)
w.Header().Set("x-track", track)
if (parent == "") {
w.Header().Set("x-parent", track)
}
// Write the response body
w.WriteHeader(http.StatusOK)
io.WriteString(w, fmt.Sprintf(aResponseMessage, 2, session, track, parent))
}
```

Context and information relative to the initial query are now available in the second microservice and a log message in JSON format looks like the following ones:

In the first micro service:

```
{"appname":"go-logging","level":"debug","msg":"hello from ms 1","session":"eUBrVfdw","time":"2017-03-02T15:29:26+01:00","track":"UzWHRihF"}
```

Then in the second:

```
{"appname":"go-logging","level":"debug","msg":"hello from ms 2","parent":"UzWHRihF","session":"eUBrVfdw","time":"2017-03-02T15:29:26+01:00","track":"DPRHBMuE"}
```

In the case of an error occurring in the second micro service, we are now able – thanks to the contextual information hold in the Golang logs – to determine how it was called and what pattern created the error.

If you wish to dig deeper on Golang tracking possibilities, there are several libraries that offer tracking features such as [Opentracing][12]. This specific library delivers an easy way to add tracing implementations in complex (or simple) architecture. It allows you to track user queries across the different steps of any process as done below:

 ![client transaction](https://logmatic.io/wp-content/uploads/2017/03/client-transaction.png) 

### IV. Performance impact of Golang logging

### 1) Do not log in Gorountine

It is tempting to create a new logger per goroutine. But it should not be done. Goroutine is a lightweight thread manager and is used to accomplish a “simple” task. It should not therefore be in charge of logging. It could lead to concurrency issues as using log.New() in each goroutine would duplicate the interface and all loggers would concurrently try to access the same io.Writer.
Moreover libraries usually use a specific goroutine for the log writing to limit the impact on your performances and avoid concurrencial calls to the io.Writer.

### 2) Work with asynchronous libraries

If it is true that many Golang logging libraries are available, it’s important to note that most of them are synchronous (pseudo asynchronous in fact). The reason for this being probably that so far no one had any serious impact on their performance due to logging.

But as Kjell Hedström showed in [his experiment][13] using several threads that created millions of logs, asynchronous Golang logging could lead to 40% performance increase in the worst case scenario. So logging comes at a cost, and can have consequences on your application performance. In case you do not handle such volume of logs, using pseudo asynchronous Golang logging library might be efficient enough. But if you’re dealing with large amounts of logs or are keen on performance, Kjell Hedström asynchronous solution is interesting (despite the fact that you would probably have to develop it a bit as it only contains the minimum required features).

### 3) Use severity levels to manage your Golang logs volume

Some logging libraries allow you to enable or disable specific loggers, which can come in handy. You might not need some specific levels of logs once in production for example. Here is an example of how to disable a logger in the glog library where loggers are defined as boolean:

```
type Log bool
func (l Log) Println(args ...interface{}) {
    fmt.Println(args...)
}
var debug Log = false
if debug {
    debug.Println("DEBUGGING")
}
```

You can then define those boolean parameters in a configuration file and use them to enable or disable loggers.

Golang logging can be expensive without a good Golang logging strategy. Developers should resist to the temptation of logging almost everything – even if much is interesting! If the purpose of logging is to gather as much information as possible, it has to be done properly in order to avoid the white noise of logs containing useless elements.

### V. Centralize Golang logs

 ![centralize go logs](https://logmatic.io/wp-content/uploads/2017/03/source-selector-1024x460-1.png) 
If your application is deployed on several servers, the hassle of connecting to each one of them to investigate a phenomenon can be avoided. Log centralization does make a difference.

Using log shippers such as Nxlog for windows, Rsyslog for linux (as it is installed by default) or Logstash and FluentD is the best way to do so. Log shippers only purpose is to send logs, and so they manage connection failures or other issues you could face very well.

There is even a [Golang syslog package][14] that takes care of sending Golang logs to the syslog daemon for you.

### Hope you enjoyed your Golang logs tour

Thinking about your Golang logging strategy at the beginning of your project is important. Tracking a user is much easier if overall context can be accessed from anywhere in the code. Reading logs from different services when they are not standardized is painful. Planning ahead to spread the same user or request id through several microservices will later on allow you to easily filter the information and follow an activity across your system.

Whether you’re building a large Golang project or several microservices also impacts your logging strategy. The main components of a large project should have their specific Golang logger named after their functionality. This enables you to instantly spot from which part of the code the logs are coming from. However with microservices or small Golang projects, fewer core components require their own logger. In each case though, the number of loggers should be kept below the number of core functionalities.

You’re now all set to quantify decisions about performance and user’s happiness with your Golang logs!

 _Is there a specific coding language you want to read about? Let us know on Twitter [][1][@logmatic][2]._ 


--------------------------------------------------------------------------------

via: https://logmatic.io/blog/our-guide-to-a-golang-logs-world/

作者：[Nils][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://logmatic.io/blog/our-guide-to-a-golang-logs-world/
[1]:https://twitter.com/logmatic?lang=en
[2]:http://twitter.com/logmatic
[3]:https://golang.org/pkg/log/
[4]:https://golang.org/pkg/log/#pkg-constants
[5]:https://play.golang.org/
[6]:https://www.goinggo.net/2013/11/using-log-package-in-go.html
[7]:https://golang.org/pkg/log/
[8]:https://github.com/google/glog
[9]:https://github.com/sirupsen/logrus
[10]:https://logmatic.io/blog/beyond-application-monitoring-discover-logging-best-practices/
[11]:https://github.com/logmatic/logmatic-go
[12]:https://github.com/opentracing/opentracing-go
[13]:https://sites.google.com/site/kjellhedstrom2/g2log-efficient-background-io-processign-with-c11/g2log-vs-google-s-glog-performance-comparison
[14]:https://golang.org/pkg/log/syslog/
