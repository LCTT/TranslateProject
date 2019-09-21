Troubleshooting Node.js Issues with llnode
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/node_1920.jpg?itok=Cwd2YtPd)

The llnode plugin lets you inspect Node.js processes and core dumps; it adds the ability to inspect JavaScript stack frames, objects, source code and more. At [Node+JS Interactive][1], Matheus Marchini, Node.js Collaborator and Lead Software Engineer at Sthima, will host a [workshop][2] on how to use llnode to find and fix issues quickly and reliably, without bloating your application with logs or compromising performance. He explains more in this interview.

**Linux.com: What are some common issues that happen with a Node.js application in production?**

**Matheus Marchini:** One of the most common issues Node.js developers might experience -- either in production or during development -- are unhandled exceptions. They happen when your code throws an error, and this error is not properly handled. There's a variation of this issue with Promises, although in this case, the problem is worse: if a Promise is rejected but there's no handler for that rejection, the application might enter into an undefined state and it can start to misbehave.

The application might also crash when it's using too much memory. This usually happens when there's a memory leak in the application, although we usually don't have classic memory leaks in Node.js. Instead of unreferenced objects, we might have objects that are not used anymore but are still retained by another object, leading the Garbage Collector to ignore them. If this happens with several objects, we can quickly exhaust our available memory.

Memory is not the only resource that might get exhausted. Given the asynchronous nature of Node.js and how it scales for a large number of requests, the application might start to run out on other resources such as opened file descriptions and a number of concurrent connections to a database.

Infinite loops are not that common because we usually catch those during development, but every once in a while one manages to slip through our tests and get into our production servers. These are pretty catastrophic because they will block the main thread, rendering the entire application unresponsive.

The last issues I'd like to point out are performance issues. Those can happen for a variety of reasons, ranging from unoptimized function to I/O latency.

**Linux.com: Are there any quick tests you can do to determine what might be happening with your Node.js application?**

**Marchini:** Node.js and V8 have several tools and features built-in which developers can use to find issues faster. For example, if you're facing performance issues, you might want to use the built-in [V8 CpuProfiler][3]. Memory issues can be tracked down with [V8 Sampling Heap Profiler][4]. All of these options are interesting because you can open their results in Chrome DevTools and get some nice graphical visualizations by default.

If you are using native modules on your project, V8 built-in tools might not give you enough insights, since they focus only on JavaScript metrics. As an alternative to V8 CpuProfiler, you can use system profiler tools, such as [perf for Linux][5] and Dtrace for FreeBSD / OS X. You can grab the result from these tools and turn them into flamegraphs, making it easier to find which functions are taking more time to process.

You can use third-party tools as well: [node-report][6] is an amazing first failure data capture which doesn't introduce a significant overhead. When your application crashes, it will generate a report with detailed information about the state of the system, including environment variables, flags used, operating system details, etc. You can also generate this report on demand, and it is extremely useful when asking for help in forums, for example. The best part is that, after installing it through npm, you can enable it with a flag -- no need to make changes in your code!

But one of the tools I'm most amazed by is [llnode][7].

**Linux.com: When would you want to use something like llnode; and what exactly is it?**

**Marchini:** **** llnode is useful when debugging infinite loops, uncaught exceptions or out of memory issues since it allows you to inspect the state of your application when it crashed. How does llnode do this? You can tell Node.js and your operating system to take a core dump of your application when it crashes and load it into llnode. llnode will analyze this core dump and give you useful information such as how many objects were allocated in the heap, the complete stack trace for the process (including native calls and V8 internals), pending requests and handlers in the event loop queue, etc.

The most impressive feature llnode has is its ability to inspect objects and functions: you can see which variables are available for a given function, look at the function's code and inspect which properties your objects have with their respective values. For example, you can look up which variables are available for your HTTP handler function and which parameters it received. You can also look at headers and the payload of a given request.

llnode is a plugin for [lldb][8], and it uses lldb features alongside hints provided by V8 and Node.js to recreate the process heap. It uses a few heuristics, too, so results might not be entirely correct sometimes. But most of the times the results are good enough -- and way better than not using any tool.

This technique -- which is called post-mortem debugging -- is not something new, though, and it has been part of the Node.js project since 2012. This is a common technique used by C and C++ developers, but not many dynamic runtimes support it. I'm happy we can say Node.js is one of those runtimes.

**Linux.com: What are some key items folks should know before adding llnode to their environment?**

**Marchini:** To install and use llnode you'll need to have lldb installed on your system. If you're on OS X, lldb is installed as part of Xcode. On Linux, you can install it from your distribution's repository. We recommend using LLDB 3.9 or later.

You'll also have to set up your environment to generate core dumps. First, remember to set the flag --abort-on-uncaught-exception when running a Node.js application, otherwise, Node.js won't generate a core dump when an uncaught exception happens. You'll also need to tell your operating system to generate core dumps when an application crashes. The most common way to do that is by running `ulimit -c unlimited`, but this will only apply to your current shell session. If you're using a process manager such as systemd I suggest looking at the process manager docs. You can also generate on-demand core dumps of a running process with tools such as gcore.

**Linux.com: What can we expect from llnode in the future?**

**Marchini:** llnode collaborators are working on several features and improvements to make the project more accessible for developers less familiar with native debugging tools. To accomplish that, we're improving the overall user experience as well as the project's documentation and installation process. Future versions will include colorized output, more reliable output for some commands and a simplified mode focused on JavaScript information. We are also working on a JavaScript API which can be used to automate some analysis, create graphical user interfaces, etc.

If this project sounds interesting to you, and you would like to get involved, feel free join the conversation in [our issues tracker][9] or contact me on social [@mmarkini][10]. I would love to help you get started!

Learn more at [Node+JS Interactive][1], coming up October 10-12, 2018 in Vancouver, Canada.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/9/troubleshooting-nodejs-issues-llnode

作者：[The Linux Foundation][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/ericstephenbrown
[1]: https://events.linuxfoundation.org/events/node-js-interactive-2018/?utm_source=Linux.com&utm_medium=article&utm_campaign=jsint18
[2]: http://sched.co/G285
[3]: https://nodejs.org/api/inspector.html#inspector_cpu_profiler
[4]: https://github.com/v8/sampling-heap-profiler
[5]: http://www.brendangregg.com/blog/2014-09-17/node-flame-graphs-on-linux.html
[6]: https://github.com/nodejs/node-report
[7]: https://github.com/nodejs/llnode
[8]: https://lldb.llvm.org/
[9]: https://github.com/nodejs/llnode/issues
[10]: https://twitter.com/mmarkini
