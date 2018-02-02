Create and manage MacOS LaunchAgents using Go
============================================================

If you have ever tried writing a daemon for MacOS you have met with `launchd`. For those that don’t have the experience, think of it as a framework for starting, stopping and managing daemons, applications, processes, and scripts. If you have any *nix experience the word daemon should not be too alien to you.

For those unfamiliar, a daemon is a program running in the background without requiring user input. A typical daemon might, for instance, perform daily maintenance tasks or scan a device for malware when connected.

This post is aimed at folks that know a little bit about what daemons are, what is the common way of using them and know a bit about Go. Also, if you have ever written a daemon for any other *nix system, you will have a good idea of what we are going to talk here. If you are an absolute beginner in Go or systems this might prove to be an overwhelming article. Still, feel free to give it a shot and let me know how it goes.

If you ever find yourself wanting to write a MacOS daemon with Go you would like to know most of the stuff we are going to talk about in this article. Without further ado, let’s dive in.

### What is `launchd` and how it works?

`launchd` is a unified service-management framework, that starts, stops and manages daemons, applications, processes, and scripts in MacOS.

One of its key features is that it differentiates between agents and daemons. In `launchd` land, an agent runs on behalf of the logged in user while a daemon runs on behalf of the root user or any specified user.

### Defining agents and daemons

An agent/daemon is defined in an XML file, which states the properties of the program that will execute, among a list of other properties. Another aspect to keep in mind is that `launchd` decides if a program will be treated as a daemon or an agent by where the program XML is located.

Over at [launchd.info][3], there’s a simple table that shows where you would (or not) place your program’s XML:

```
+----------------+-------------------------------+----------------------------------------------------+| Type           | Location                      | Run on behalf of                                   |+----------------+-------------------------------+----------------------------------------------------+| User Agents    | ~/Library/LaunchAgents        | Currently logged in user                           || Global Agents  | /Library/LaunchAgents         | Currently logged in user                           || Global Daemons | /Library/LaunchDaemons        | root or the user specified with the key 'UserName' || System Agents  | /System/Library/LaunchAgents  | Currently logged in user                           || System Daemons | /System/Library/LaunchDaemons | root or the user specified with the key 'UserName' |+----------------+-------------------------------+----------------------------------------------------+
```

This means that when we set our XML file in, for example, the `/Library/LaunchAgents` path our process will be treated as a global agent. The main difference between the daemons and agents is that LaunchDaemons will run as root, and are generally background processes. On the other hand, LaunchAgents are jobs that will run as a user or in the context of userland. These may be scripts or other foreground items and they also have access to the MacOS UI (e.g. you can send notifications, control the windows, etc.)

So, how do we define an agent? Let’s take a look at a simple XML file that `launchd`understands:

```
<!--- Example blatantly ripped off from http://www.launchd.info/ --><?xml version="1.0" encoding="UTF-8"?><!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0">	<dict>		<key>Label</key>		<string>com.example.app</string>		<key>Program</key>		<string>/Users/Me/Scripts/cleanup.sh</string>		<key>RunAtLoad</key>		<true/>	</dict></plist>
```

The XML is quite self-explanatory, unless it’s the first time you are seeing an XML file. The file has three main properties, with values. In fact, if you take a better look you will see the `dict` keyword which means `dictionary`. This actually means that the XML represents a key-value structure, so in Go it would look like:

```
map[string]string{        "Label":     "com.example.app",        "Program":   "/Users/Me/Scripts/cleanup.sh",        "RunAtLoad": "true",}
```

Let’s look at each of the keys:

1.  `Label` - The job definition or the name of the job. This is the unique identifier for the job within the `launchd` instance. Usually, the label (and hence the name) is written in [Reverse domain name notation][1].

2.  `Program` - This key defines what the job should start, in our case a script with the path `/Users/Me/Scripts/cleanup.sh`.

3.  `RunAtLoad` - This key specifies when the job should be run, in this case right after it’s loaded.

As you can see, the keys used in this XML file are quite self-explanatory. This is the case for the remaining 30-40 keys that `launchd` supports. Last but not least these files although have an XML syntax, in fact, they have a `.plist` extension (which means `Property List`). Makes a lot of sense, right?

### `launchd` v.s. `launchctl`

Before we continue with our little exercise of creating daemons/agents with Go, let’s first see how `launchd` allows us to control these jobs. While `launchd`’s job is to boot the system and to load and maintain services, there is a different command used for jobs management - `launchctl`. With `launchd` facilitating jobs, the control of services is centralized in the `launchctl` command.

`launchctl` has a long list of subcommands that we can use. For example, loading or unloading a job is done via:

```
launchctl unload/load ~/Library/LaunchAgents/com.example.app.plist
```

Or, starting/stopping a job is done via:

```
launchctl start/stop ~/Library/LaunchAgents/com.example.app.plist
```

To get any confusion out of the way, `load` and `start` are different. While `start`only starts the agent/daemon, `load` loads the job and it might also start it if the job is configured to run on load. This is achieved by setting the `RunAtLoad` property in the property list XML of the job:

```
<!--- Example blatantly ripped off from http://www.launchd.info/ --><?xml version="1.0" encoding="UTF-8"?><!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0">	<dict>		<key>Label</key>		<string>com.example.app</string>		<key>Program</key>		<string>/Users/Me/Scripts/cleanup.sh</string>		<key>RunAtLoad</key><true/>	</dict></plist>
```

If you would like to see what other commands `launchctl` supports, you can run`man launchctl` in your terminal and see the options in detail.

### Automating with Go

After getting the basics of `launchd` and `launctl` out of the way, why don’t we see how we can add an agent to any Go package? For our example, we are going to write a simple way of plugging in a `launchd` agent for any of your Go packages.

As we already established before, `launchd` speaks in XML. Or, rather, it understands XML files, called  _property lists_  (or `.plist`). This means, for our Go package to have an agent running on MacOS, it will need to tell `launchd` “hey, `launchd`, run this thing!”. And since `launch` speaks only in `.plist`, that means our package needs to be capable of generating XML files.

### Templates in Go

While one could have a hardcoded `.plist` file in their project and copy it across to the `~/Library/LaunchAgents` path, a more programmatical way to do this would be to use a template to generate these XML files. The good thing is Go’s standard library has us covered - the `text/template` package ([docs][4]) does exactly what we need.

In a nutshell, `text/template` implements data-driven templates for generating textual output. Or in other words, you give it a template and a data structure, it will mash them up together and produce a nice and clean text file. Perfect.

Let’s say the `.plist` we need to generate in our case is the following:

```
<?xml version='1.0' encoding='UTF-8'?><!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\" ><plist version='1.0'>  <dict>    <key>Label</key><string>Ticker</string>    <key>Program</key><string>/usr/local/bin/ticker</string>    <key>StandardOutPath</key><string>/tmp/ticker.out.log</string>    <key>StandardErrorPath</key><string>/tmp/ticker.err.log</string>    <key>KeepAlive</key><true/>    <key>RunAtLoad</key><true/>  </dict></plist>
```

We want to keep it quite simple in our little exercise. It will contain only six properties: `Label`, `Program`, `StandardOutPath`, `StandardErrorPath`, `KeepAlive` and `RunAtLoad`. To generate such a XML, its template would look something like this:

```
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\" >
<plist version='1.0'>
  <dict>
    <key>Label</key><string>{{.Label}}</string>
    <key>Program</key><string>{{.Program}}</string>
    <key>StandardOutPath</key><string>/tmp/{{.Label}}.out.log</string>
    <key>StandardErrorPath</key><string>/tmp/{{.Label}}.err.log</string>
    <key>KeepAlive</key><{{.KeepAlive}}/>
    <key>RunAtLoad</key><{{.RunAtLoad}}/>
  </dict>
</plist>

```

As you can see, the difference between the two XMLs is that the second one has the double curly braces with expressions in them in places where the first XML has some sort of a value. These are called “actions”, which can be data evaluations or control structures and are delimited by “ and “. Any of the text outside actions is copied to the output untouched.

### Injecting your data

Now that we have our template with its glorious XML and curly braces (or actions), let’s see how we can inject our data into it. Since things are generally simple in Go, especially when it comes to its standard library, you should not worry - this will be easy!

To keep thing simple, we will store the whole XML template in a plain old string. Yes, weird, I know. The best way would be to store it in a file and read it from there, or embed it in the binary itself, but in our little example let’s keep it simple:

```
// template.go
package main

func Template() string {
	return `
<?xml version='1.0' encoding='UTF-8'?>
 <!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\" >
 <plist version='1.0'>
   <dict>
     <key>Label</key><string>{{.Label}}</string>
     <key>Program</key><string>{{.Program}}</string>
     <key>StandardOutPath</key><string>/tmp/{{.Label}}.out.log</string>
     <key>StandardErrorPath</key><string>/tmp/{{.Label}}.err.log</string>
     <key>KeepAlive</key><{{.KeepAlive}}/>
     <key>RunAtLoad</key><{{.RunAtLoad}}/>
   </dict>
</plist>
`
}

```

And the program that will use our little template function:

```
// main.gopackage mainimport (	"log"	"os"	"text/template")func main() {	data := struct {		Label     string		Program   string		KeepAlive bool		RunAtLoad bool	}{		Label:     "ticker",		Program:   "/usr/local/bin/ticker",		KeepAlive: true,		RunAtLoad: true,	}	t := template.Must(template.New("launchdConfig").Parse(Template()))	err := t.Execute(os.Stdout, data)	if err != nil {		log.Fatalf("Template generation failed: %s", err)	}}
```

So, what happens there, in the `main` function? It’s actually quite simple:

1.  We declare a small `struct`, which has only the properties that will be needed in the template, and we immediately initialize it with the values for our program.

2.  We build a new template, using the `template.New` function, with the name`launchdConfig`. Then, we invoke the `Parse` function on it, which takes the XML template as an argument.

3.  We invoke the `template.Must` function, which takes our built template as argument. From the documentation, `template.Must` is a helper that wraps a call to a function returning `(*Template, error)` and panics if the error is non-`nil`. Actually, `template.Must` is built to, in a way, validate if the template can be understood by the `text/template` package.

4.  Finally, we invoke `Execute` on our built template, which takes a data structure and applies its attributes to the actions in the template. Then it sends the output to `os.Stdout`, which does the trick for our example. Of course, the output can be sent to any struct that implements the `io.Writer` interface, like a file (`os.File`).

### Make and load my `.plist`

Instead of sending all this nice XML to standard out, let’s throw in an open file descriptor to the `Execute` function and finally save our `.plist` file in`~/Library/LaunchAgents`. There are a couple of main points we need to change.

First, getting the location of the binary. Since it’s a Go binary, and we will install it via `go install`, we can assume that the path will be at `$GOPATH/bin`. Second, since we don’t know the actual `$HOME` of the current user, we will have to get it through the environment. Both of these can be done via `os.Getenv` ([docs][5]) which takes a variable name and returns its value.

```
// main.gopackage mainimport (	"log"	"os"	"text/template")func main() {	data := struct {		Label     string		Program   string		KeepAlive bool		RunAtLoad bool	}{		Label:     "com.ieftimov.ticker", // Reverse-DNS naming convention		Program:   fmt.Sprintf("%s/bin/ticker", os.Getenv("GOPATH")),		KeepAlive: true,		RunAtLoad: true,	}        plistPath := fmt.Sprintf("%s/Library/LaunchAgents/%s.plist", os.Getenv("HOME"), data.Label)        f, err := os.Open(plistPath)	t := template.Must(template.New("launchdConfig").Parse(Template()))	err := t.Execute(f, data)	if err != nil {		log.Fatalf("Template generation failed: %s", err)	}}
```

That’s about it. The first part, about setting the correct `Program` property, is done by concatenating the name of the program and `$GOPATH`:

```
fmt.Sprintf("%s/bin/ticker", os.Getenv("GOPATH"))// Output: /Users/<username>/go/bin/ticker
```

The second part is slightly more complex, and it’s done by concatenating three strings, the `$HOME` environment variable, the `Label` property of the program and the `/Library/LaunchAgents` string:

```
fmt.Sprintf("%s/Library/LaunchAgents/%s.plist", os.Getenv("HOME"), data.Label)// Output: /Users/<username>/Library/LaunchAgents/com.ieftimov.ticker.plist
```

By having these two paths, opening the file and writing to it is very trivial - we open the file via `os.Open` and we pass in the `os.File` structure to `t.Execute` which writes to the file descriptor.

### What about the Launch Agent?

We will keep this one simple as well. Let’s throw in a command to our package, make it installable via `go install` (not that there’s much to it) and make it runnable by our `.plist` file:

```
// cmd/ticker/main.gopackage tickerimport (  "time"  "fmt")func main() {    for range time.Tick(30 * time.Second) {            fmt.Println("tick!")    }}
```

This the `ticker` program will use `time.Tick`, to execute an action every 30 seconds. Since this will be an infinite loop, `launchd` will kick off the program on boot (because `RunAtLoad` is set to `true` in the `.plist` file) and will keep it running. But, to make the program controllable from the operating system, we need to make the program react to some OS signals, like `SIGINT` or `SIGTERM`.

### Understanding and handling OS signals

While there’s quite a bit to be learned about OS signals, in our example we will scratch a bit off the surface. (If you know a lot about inter-process communication this might be too much of an oversimplification to you - and I apologize up front. Feel free to drop some links on the topic in the comments so others can learn more!)

The best way to think about a signal is that it’s a message from the operating system or another process, to a process. It is an asynchronous notification sent to a process or to a specific thread within the same process to notify it of an event that occurred.

There are quite a bit of various signals that can be sent to a process (or a thread), like `SIGKILL` (which kills a process), `SIGSTOP` (stop), `SIGTERM` (termination), `SIGILL`and so on and so forth. There’s an exhaustive list of signal types on [Wikipedia’s page][6]on signals.

To get back to `launchd`, if we look at its documentation about stopping a job we will notice the following:

> Stopping a job will send the signal `SIGTERM` to the process. Should this not stop the process launchd will wait `ExitTimeOut` seconds (20 seconds by default) before sending `SIGKILL`.

Pretty self-explanatory, right? We need to handle one signal - `SIGTERM`. Why not `SIGKILL`? Because `SIGKILL` is a special signal that cannot be caught - it kills the process without any chance for a graceful shutdown, no questions asked. That’s why there’s a termination signal and a “kill” signal.

Let’s throw in a bit of signal handling in our code, so our program knows that it needs to exit when it gets told to do so:

```
package mainimport (	"fmt"	"os"	"os/signal"	"syscall"	"time")func main() {	sigs := make(chan os.Signal, 1)	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)	go func() {		<-sigs		os.Exit(0)	}()	for range time.Tick(30 * time.Second) {		fmt.Println("tick!")	}}
```

In the new version, the agent program has two new packages imported: `os/signal`and `syscall`. `os/signal` implements access to incoming signals, that are primarily used on Unix-like systems. Since in this article we are specifically interested in MacOS, this is exactly what we need.

Package `syscall` contains an interface to the low-level operating system primitives. An important note about `syscall` is that it is locked down since Go v1.4\. This means that any code outside of the standard library that uses the `syscall` package should be migrated to use the new `golang.org/x/sys` [package][7]. Since we are using **only**the signals constants of `syscall` we can get away with this.

(If you want to read more about the package lockdown, you can see [the rationale on locking it down][8] by the Go team and the new [golang.org/s/sys][9] package.)

Having the basics of the packages out of the way, let’s go step by step through the new lines of code added:

1.  We make a buffered channel of type `os.Signal`, with a size of `1`. `os.Signal`is a type that represents an operating system signal.

2.  We call `signal.Notify` with the new channel as an argument, plus`syscall.SIGINT` and `syscall.SIGTERM`. This function states “when the OS sends a `SIGINT` or a `SIGTERM` signal to this program, send the signal to the channel”. This allows us to somehow handle the sent OS signal.

3.  The new goroutine that we spawn waits for any of the signals to arrive through the channel. Since we know that any of the signals that will arrive are about shutting down the program, after receiving any signal we use `os.Exit(0)`([docs][2]) to gracefully stop the program. One caveat here is that if we had any `defer`red calls they would not be run.

Now `launchd` can run the agent program and we can `load` and `unload`, `start`and `stop` it using `launchctl`.

### Putting it all together

Now that we have all the pieces ready, we need to put them together to a good use. Our application will consist of two binaries - a CLI tool and an agent (daemon). Both of the programs will be stored in separate subdirectories of the `cmd` directory.

The CLI tool:

```
// cmd/cli/main.gopackage mainimport (	"log"	"os"	"text/template")func main() {	data := struct {		Label     string		Program   string		KeepAlive bool		RunAtLoad bool	}{		Label:     "com.ieftimov.ticker", // Reverse-DNS naming convention		Program:   fmt.Sprintf("%s/bin/ticker", os.Getenv("GOPATH")),		KeepAlive: true,		RunAtLoad: true,	}        plistPath := fmt.Sprintf("%s/Library/LaunchAgents/%s.plist", os.Getenv("HOME"), data.Label)        f, err := os.Open(plistPath)	t := template.Must(template.New("launchdConfig").Parse(Template()))	err := t.Execute(f, data)	if err != nil {		log.Fatalf("Template generation failed: %s", err)	}}
```

And the ticker program:

```
// cmd/ticker/main.gopackage mainimport (	"fmt"	"os"	"os/signal"	"syscall"	"time")func main() {	sigs := make(chan os.Signal, 1)	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)	go func() {		<-sigs		os.Exit(0)	}()	for range time.Tick(30 * time.Second) {		fmt.Println("tick!")	}}
```

To install them both, we need to run `go install ./...` in the project root. The command will install all the sub-packages that are located within the project. This will leave us with two available binaries, installed in the `$GOPATH/bin` path.

To install our launch agent, we need to run only the CLI tool, via the `cli` command. This will generate the `.plist` file and place it in the `~/Library/LaunchAgents`path. We don’t need to touch the `ticker` binary - that one will be managed by `launchd`.

To load the newly created `.plist` file, we need to run:

```
launchctl load ~/Library/LaunchAgents/com.ieftimov.ticker.plist
```

When we run it, we will not see anything immediately, but after 30 seconds the ticker will add a `tick!` line in `/tmp/ticker.out.log`. We can `tail` the file to see the new lines being added. If we want to unload the agent, we can use:

```
launchctl unload ~/Library/LaunchAgents/com.ieftimov.ticker.plist
```

This will unload the launch agent and will stop the ticker from running. Remember the signal handling we added? This is the case where it’s being used! Also, we could have automated the (un)loading of the file via the CLI tool but for simplicity, we left it out. You can try to improve the CLI tool by making it a bit smarter with subcommands and flags, as a follow-up exercise from this tutorial.

Finally, if you decide to completely delete the launch agent, you can remove the`.plist` file:

```
rm ~/Library/LaunchAgents/com.ieftimov.ticker.plist
```

### In closing

As part of this (quite long!) article, we saw how we can work with `launchd` and Golang. We took a detour, like learning about `launchd` and `launchctl`, generating XML files using the `text/template` package, we took a look at OS signals and how we can gracefully shutdown a Go program by handling the `SIGINT` and `SIGTERM`signals. There was quite a bit to learn and see, but we got to the end.

Of course, we only scratched the surface with this article. For example, `launchd` is quite an interesting tool. You can use it also like `crontab` because it allows running programs at explicit time/date combinations or on specific days. Or, for example, the XML template can be embedded in the program binary using tools like [`go-bindata`][10], instead of hardcoding it in a function. Also, you explore more about signals, how they work and how Go implements these low-level primitives so you can use them with ease in your programs. The options are plenty, feel free to explore!

If you have found any mistakes in the article, feel free to drop a comment below - I will appreciate it a ton. I find learning through teaching (blogging) a very pleasant experience and would like to have all the details fully correct in my posts.

--------------------------------------------------------------------------------

作者简介：

Backend engineer, interested in Ruby, Go, microservices, building resilient architectures and solving challenges at scale. I coach at Rails Girls in Amsterdam, maintain a list of small gems and often contribute to Open Source. 
This is where I write about software development, programming languages and everything else that interests me.

---------------------


via: https://ieftimov.com/create-manage-macos-launchd-agents-golang

作者：[Ilija Eftimov ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://ieftimov.com/about
[1]:https://ieftimov.com/en.wikipedia.org/wiki/Reverse_domain_name_notation
[2]:https://godoc.org/os#Exit
[3]:https://launchd.info/
[4]:https://godoc.org/text/template
[5]:https://godoc.org/os#Getenv
[6]:https://en.wikipedia.org/wiki/Signal_(IPC)
[7]:https://golang.org/x/sys
[8]:https://docs.google.com/document/d/1QXzI9I1pOfZPujQzxhyRy6EeHYTQitKKjHfpq0zpxZs/edit
[9]:https://golang.org/x/sys
[10]:https://github.com/jteeuwen/go-bindata