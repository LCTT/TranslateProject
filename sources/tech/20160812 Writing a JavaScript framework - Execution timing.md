[translating by kokialoves]
Writing a JavaScript framework - Execution timing, beyond setTimeout
===================

This is the second chapter of the Writing a JavaScript framework series. In this chapter, I am going to explain the different ways of executing asynchronous code in the browser. You will read about the event loop and the differences between timing techniques, like setTimeout and Promises.

The series is about an open-source client-side framework, called NX. During the series, I explain the main difficulties I had to overcome while writing the framework. If you are interested in NX please visit the [home page][1].

The series includes the following chapters:

The series includes the following chapters:

1. [Project structuring][2]
2. Execution timing (current chapter)
3. [Sandboxed code evaluation][3]
4. Data binding (part 1)
5. Data binding (part 2)
6. Custom elements
7. Client side routing

### Async code execution

Most of you are probably familiar with Promise, process.nextTick(), setTimeout() and maybe requestAnimationFrame() as ways of executing asynchronous code. They all use the event loop internally, but they behave quite differently regarding precise timing.

In this chapter, I will explain the differences, then show you how to implement a timing system that a modern framework, like NX requires. Instead of reinventing the wheel we will use the native event loop to achieve our goals.

### The event loop

The event loop is not even mentioned in the ES6 spec. JavaScript only has jobs and job queues on its own. A more complex event loop is specified separately by NodeJS and the HTML5 spec. Since this series is about the front-end I will explain the latter one here.

The event loop is called a loop for a reason. It is infinitely looping and looking for new tasks to execute. A single iteration of this loop is called a tick. The code executed during a tick is called a task.

```
while (eventLoop.waitForTask()) {  
  eventLoop.processNextTask()
}
```

Tasks are synchronous pieces of code that may schedule other tasks in the loop. An easy programmatic way to schedule a new task is setTimeout(taskFn). However, tasks may come from several other sources like user events, networking or DOM manipulation.

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_event_lopp_with_tasks-1470127590983.svg)

### Task queues

To complicate things a bit, the event loop can have multiple task queues. The only two restrictions are that events from the same task source must belong to the same queue and tasks must be processed in insertion order in every queue. Apart from these, the user agent is free to do as it wills. For example, it may decide which task queue to process next.

```
while (eventLoop.waitForTask()) {  
  const taskQueue = eventLoop.selectTaskQueue()
  if (taskQueue.hasNextTask()) {
    taskQueue.processNextTask()
  }
}
```

With this model, we loose precise control over timing. The browser may decide to totally empty several other queues before it gets to our task scheduled with setTimeout().

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_event_loop_with_task_queues-1470127624172.svg)

### The microtask queue

Fortunately, the event loop also has a single queue called the microtask queue. The microtask queue is completely emptied in every tick after the current task finished executing.


```
while (eventLoop.waitForTask()) {  
  const taskQueue = eventLoop.selectTaskQueue()
  if (taskQueue.hasNextTask()) {
    taskQueue.processNextTask()
  }

  const microtaskQueue = eventLoop.microTaskQueue
  while (microtaskQueue.hasNextMicrotask()) {
    microtaskQueue.processNextMicrotask()
  }
}
```

The easiest way to schedule a microtask is Promise.resolve().then(microtaskFn). Microtasks are processed in insertion order, and since there is only one microtask queue, the user agent can't mess with us this time.

Moreover, microtasks can schedule new microtasks that will be inserted in the same queue and processed in the same tick.

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_event_loop_with_microtask_queue-1470127679393.svg)

### Rendering

The last thing missing is the rendering schedule. Unlike event handling or parsing, rendering is not done by separate background tasks. It is an algorithm that may run at the end of every loop tick.

The user agent has a lot of freedom again: It may render after every task, but it may decide to let hundreds of tasks execute without rendering.

Fortunately, there is requestAnimationFrame(), that executes the passed function right before the next render. Our final event loop model looks like this.

```
while (eventLoop.waitForTask()) {  
  const taskQueue = eventLoop.selectTaskQueue()
  if (taskQueue.hasNextTask()) {
    taskQueue.processNextTask()
  }

  const microtaskQueue = eventLoop.microTaskQueue
  while (microtaskQueue.hasNextMicrotask()) {
    microtaskQueue.processNextMicrotask()
  }

  if (shouldRender()) {
    applyScrollResizeAndCSS()
    runAnimationFrames()
    render()
  }
}
```

Now let’s use all this knowledge to build a timing system!

### Using the event loop

As most modern frameworks, NX deals with DOM manipulation and data binding in the background. It batches operations and executes them asynchronously for better performance. To time these things right it relies on Promises, MutationObservers and requestAnimationFrame().

The desired timing is this:

1. Code from the developer
2. Data binding and DOM manipulation reactions by NX
3. Hooks defined by the developer
4. Rendering by the user agent

#### Step 1

NX registers object mutations with ES6 Proxies and DOM mutations with a MutationObserver synchronously (more about these in the next chapters). It delays the reactions as microtasks until step 2 for optimized performance. This delay is done by Promise.resolve().then(reaction) for object mutations, and handled automatically by the MutationObserver as it uses microtasks internally.

#### Step 2

The code (task) from the developer finished running. The microtask reactions registered by NX start executing. Since they are microtasks they run in order. Note that we are still in the same loop tick.

#### Step 3

NX runs the hooks passed by the developer using requestAnimationFrame(hook). This may happen in a later loop tick. The important thing is that the hooks run before the next render and after all data, DOM and CSS changes are processed.

#### Step 4

The browser renders the next view. This may also happen in a later loop tick, but it never happens before the previous steps in a tick.

### Things to keep in mind

We just implemented a simple but effective timing system on top of the native event loop. It works well in theory, but timing is a delicate thing, and slight mistakes can cause some very strange bugs.

In a complex system, it is important to set up some rules about the timing and keep to them later. For NX I have the following rules.

1. Never use setTimeout(fn, 0) for internal operations
2. Register microtasks with the same method
3. Reserve microtasks for internal operations only
4. Do not pollute the developer hook execution time window with anything else

#### Rule 1 and 2

Reactions on data and DOM manipulation should execute in the order the manipulations happened. It is okay to delay them as long as their execution order is not mixed up. Mixing execution order makes things unpredictable and difficult to reason about. 

setTimeout(fn, 0) is totally unpredictable. Registering microtasks with different methods also leads to mixed up execution order. For example microtask2 would incorrectly execute before microtask1 in the example below.

```
Promise.resolve().then().then(microtask1)  
Promise.resolve().then(microtask2) 
```

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_microtask_registration_method-1470127727609.svg)

#### Rule 3 and 4

Separating the time window of the developer code execution and the internal operations is important. Mixing these two would start to cause seemingly unpredictable behavior, and it would eventually force developers to learn about the internal working of the framework. I think many front-end developers have experiences like this already.

### Conclusion

If you are interested in the NX framework, please visit the home page. Adventurous readers can find the [NX source code][5] in this Github repository.

I hope you found this a good read, see you next time when I’ll discuss [sandboxed code evaluation][4]!

If you have any thoughts on the topic, please share them in the comments.

--------------------------------------------------------------------------------

via: https://blog.risingstack.com/writing-a-javascript-framework-execution-timing-beyond-settimeout/?utm_source=javascriptweekly&utm_medium=email

作者：[Bertalan Miklos][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.risingstack.com/author/bertalan/
[1]: http://nx-framework.com/
[2]: https://blog.risingstack.com/writing-a-javascript-framework-project-structuring/
[3]: https://blog.risingstack.com/writing-a-javascript-framework-sandboxed-code-evaluation/
[4]: https://blog.risingstack.com/writing-a-javascript-framework-sandboxed-code-evaluation/
[5]: https://github.com/RisingStack/nx-framework
