写一个 JavaScript 框架：比 setTimeout 更棒的定时执行
===================

这是 [JavaScript 框架系列][2]的第二章。在这一章里，我打算讲一下在浏览器里的异步代码不同执行方式。你将了解定时器和事件循环之间的不同差异，比如 setTimeout 和 Promises。

这个系列是关于一个开源的客户端框架，叫做 NX。在这个系列里，我主要解释一下写该框架不得不克服的主要困难。如果你对 NX 感兴趣可以参观我们的 [主页][1]。

这个系列包含以下几个章节：

1. [项目结构][2]
2. 定时执行 (当前章节)
3. [沙箱代码评估][3]
4. [数据绑定介绍](https://blog.risingstack.com/writing-a-javascript-framework-data-binding-dirty-checking/)
5. [数据绑定与 ES6 代理](https://blog.risingstack.com/writing-a-javascript-framework-data-binding-es6-proxy/)
6. 自定义元素
7. 客户端路由

### 异步代码执行

你可能比较熟悉 `Promise`、`process.nextTick()`、`setTimeout()`，或许还有 `requestAnimationFrame()` 这些异步执行代码的方式。它们内部都使用了事件循环，但是它们在精确计时方面有一些不同。

在这一章里，我将解释它们之间的不同，然后给大家演示怎样在一个类似 NX 这样的先进框架里面实现一个定时系统。不用我们重新做一个，我们将使用原生的事件循环来达到我们的目的。

### 事件循环

事件循环甚至没有在 [ES6 规范](http://www.ecma-international.org/ecma-262/6.0/)里提到。JavaScript 自身只有任务（Job）和任务队列（job queue）。更加复杂的事件循环是在 NodeJS 和 HTML5 规范里分别定义的，因为这篇是针对前端的，我会在详细说明后者。

事件循环可以被看做某个条件的循环。它不停的寻找新的任务来运行。这个循环中的一次迭代叫做一个滴答（tick）。在一次滴答期间执行的代码称为一次任务（task）。

```
while (eventLoop.waitForTask()) {  
  eventLoop.processNextTask()
}
```
任务是同步代码，它可以在循环中调度其它任务。一个简单的调用新任务的方式是 `setTimeout(taskFn)`。不管怎样， 任务可能有很多来源，比如用户事件、网络或者 DOM 操作。

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_event_lopp_with_tasks-1470127590983.svg)

### 任务队列

更复杂一些的是，事件循环可以有多个任务队列。这里有两个约束条件，相同任务源的事件必须在相同的队列，以及任务必须按插入的顺序进行处理。除此之外，浏览器可以做任何它想做的事情。例如，它可以决定接下来处理哪个任务队列。

```
while (eventLoop.waitForTask()) {  
  const taskQueue = eventLoop.selectTaskQueue()
  if (taskQueue.hasNextTask()) {
    taskQueue.processNextTask()
  }
}
```

用这个模型，我们不能精确的控制定时。如果用 `setTimeout()`浏览器可能决定先运行完其它几个队列才运行我们的队列。

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_event_loop_with_task_queues-1470127624172.svg)

### 微任务队列

幸运的是，事件循环还提供了一个叫做微任务（microtask）队列的单一队列。当前任务结束的时候，微任务队列会清空每个滴答里的任务。

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

最简单的调用微任务的方法是 `Promise.resolve().then(microtaskFn)`。微任务按照插入顺序进行处理，并且由于仅存在一个微任务队列，浏览器不会把时间弄乱了。

此外，微任务可以调度新的微任务，它将插入到同一个队列，并在同一个滴答内处理。

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_event_loop_with_microtask_queue-1470127679393.svg)

### 绘制（Rendering）

最后是绘制（Rendering）调度，不同于事件处理和分解，绘制并不是在单独的后台任务完成的。它是一个可以运行在每个循环滴答结束时的算法。

在这里浏览器又有了许多自由：它可能在每个任务以后绘制，但是它也可能在好几百个任务都执行了以后也不绘制。

幸运的是，我们有 `requestAnimationFrame()`，它在下一个绘制之前执行传递的函数。我们最终的事件模型像这样：

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

现在用我们所知道知识来创建定时系统！

### 利用事件循环

和大多数现代框架一样，[NX][1] 也是基于 DOM 操作和数据绑定的。批量操作和异步执行以取得更好的性能表现。基于以上理由我们用 `Promises`、 `MutationObservers` 和 `requestAnimationFrame()`。

我们所期望的定时器是这样的：

1. 代码来自于开发者
2. 数据绑定和 DOM 操作由 NX 来执行
3. 开发者定义事件钩子
4. 浏览器进行绘制

#### 步骤 1

NX 寄存器对象基于 [ES6 代理](https://ponyfoo.com/articles/es6-proxies-in-depth) 以及 DOM 变动基于[MutationObserver](https://davidwalsh.name/mutationobserver-api) （变动观测器）同步运行（下一节详细介绍）。 它作为一个微任务延迟直到步骤 2 执行以后才做出反应。这个延迟已经在 `Promise.resolve().then(reaction)` 进行了对象转换，并且它将通过变动观测器自动运行。

#### 步骤 2

来自开发者的代码（任务）运行完成。微任务由 NX 开始执行所注册。 因为它们是微任务，所以按序执行。注意，我们仍然在同一个滴答循环中。

#### 步骤 3

开发者通过 `requestAnimationFrame(hook)` 通知 NX 运行钩子。这可能在滴答循环后发生。重要的是，钩子运行在下一次绘制之前和所有数据操作之后，并且 DOM 和 CSS 改变都已经完成。

#### 步骤 4

浏览器绘制下一个视图。这也有可能发生在滴答循环之后，但是绝对不会发生在一个滴答的步骤 3 之前。

### 牢记在心里的事情

我们在原生的事件循环之上实现了一个简单而有效的定时系统。理论上讲它运行的很好，但是还是很脆弱，一个轻微的错误可能会导致很严重的 BUG。

在一个复杂的系统当中，最重要的就是建立一定的规则并在以后保持它们。在 NX 中有以下规则：

1. 永远不用 `setTimeout(fn, 0)` 来进行内部操作
2. 用相同的方法来注册微任务
3. 微任务仅供内部操作
4. 不要干预开发者钩子运行时间

#### 规则 1 和 2

数据反射和 DOM 操作将按照操作顺序执行。这样只要不混合就可以很好的延迟它们的执行。混合执行会出现莫名其妙的问题。

`setTimeout(fn, 0)` 的行为完全不可预测。使用不同的方法注册微任务也会发生混乱。例如，下面的例子中 microtask2 不会正确地在 microtask1 之前运行。

```
Promise.resolve().then().then(microtask1)  
Promise.resolve().then(microtask2) 
```

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_microtask_registration_method-1470127727609.svg)

#### 规则 3 和 4

分离开发者的代码执行和内部操作的时间窗口是非常重要的。混合这两种行为会导致不可预测的事情发生，并且它会需要开发者了解框架内部。我想很多前台开发者已经有过类似经历。

### 结论

如果你对 NX 框架感兴趣，可以参观我们的[主页][1]。还可以在 GIT 上找到我们的[源代码][5]。

在下一节我们再见，我们将讨论 [沙盒化代码执行][4]！

你也可以给我们留言。

--------------------------------------------------------------------------------

via: https://blog.risingstack.com/writing-a-javascript-framework-execution-timing-beyond-settimeout/

作者：[Bertalan Miklos][a]
译者：[kokialoves](https://github.com/kokialoves)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.risingstack.com/author/bertalan/
[1]: http://nx-framework.com/
[2]: https://blog.risingstack.com/writing-a-javascript-framework-project-structuring/
[3]: https://blog.risingstack.com/writing-a-javascript-framework-sandboxed-code-evaluation/
[4]: https://blog.risingstack.com/writing-a-javascript-framework-sandboxed-code-evaluation/
[5]: https://github.com/RisingStack/nx-framework
