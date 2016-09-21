写一个比setTimeout更棒的javascript框架
===================

这是JavaScript框架系列的第二章. 在这一章里, 我打算讲一下浏览器的异步代码不同执行方式. 你将了解定时器和事件循环直接的不同差异, 比如 setTimeout 和 Promises.

这个系列是一个开源的客户端框架, 叫做 NX. 在这个系列里, 我主要解释一下写该框架不得不客服的主要困难. 如果你对NX感兴趣可以参观我们的 [主页][1].

这个系列包含以下几个章节:

1. [项目结构][2]
2. 定时执行 (当前章节)
3. [沙箱代码评估][3]
4. 数据绑定 (part 1)
5. 数据绑定 (part 2)
6. 自定义元素
7. 客户端侧路由

### 异步代码执行

你可能比较熟悉 Promise, process.nextTick(), setTimeout() and maybe requestAnimationFrame() 这些作为异步执行的代码. 它们都是内部事件循环, 但是他们确实有一些不同.

在这一章里, 我将解释它们之间的不同, 然后给大家演示一个先进的定时系统框架, 像NX 这样的框架. 不用我们重新做一个,我们将使用原生的内部循环来达到我们的目的.

### 事件循环

事件循环甚至没有在ES6里提到. JavaScript只有jobs 和 job queues. 更加复杂的事件循环是在NodeJS 和HTML5里分别指定的. 我会在后面详细说明.

事件循环叫做一个理由的循环. 它不停的寻找新的任务来运行. 这个循环中的一次事件叫做tick. 运行tick期间的代码叫做task.

```
while (eventLoop.waitForTask()) {  
  eventLoop.processNextTask()
}
```

Tasks 是同步代码他可以在其它的循环中调用. 一个简单的调用新任务的方式是setTimeout(taskFn). 不管怎样, tasks可能有很多比如 用户事件, networking 或者 DOM 操作.

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_event_lopp_with_tasks-1470127590983.svg)

### 任务队列

简单来说, 事件循环可以有多个任务队列. 这里有两个约束条件,相同数据源的事件必须在相同的队列以及任务必须做插入顺序处理. 除此之外, 浏览器可以做任何他想做的事情. 例如, 它可以决定接下来处理哪个任务队列.

```
while (eventLoop.waitForTask()) {  
  const taskQueue = eventLoop.selectTaskQueue()
  if (taskQueue.hasNextTask()) {
    taskQueue.processNextTask()
  }
}
```

用这个模型, 我们不能精确的控制定时. 如果用setTimeout()浏览器可能决定先运行完其它几个队列才运行我们的队列.

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_event_loop_with_task_queues-1470127624172.svg)

### The microtask queue

幸运的是, 事件循环还提供了单个队列叫做microtask队列. 当前任务结束的时候microtask队列会清空每个tick里的任务.


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

最简单的调用microtask的方法是Promise.resolve().then(microtaskFn). Microtasks做插入顺序的处理, 并且由于仅存在一个microtask队列, 现在浏览器对于我们来说并不是杂乱无章的了.

此外, microtasks 可以安排新的 microtasks插入到相同的队列.

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_event_loop_with_microtask_queue-1470127679393.svg)

### 绘制

最后是绘制调度. 不同于事件处理和分解, 绘制并不是在后台任务完成的. 它是在每个循环tick结束时运行的算法.

在这里浏览器又有了许多自由: 他可能在每个任务以后绘制, 但是他也肯能在好几百个任务都执行了以后也不绘制.

幸运的是, 我们有 requestAnimationFrame(), 它表示在下一个绘制之前执行. 我们最终的模型像这样.

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

现在用我们所知道知识来创建定时系统!

### 利用事件循环

和大多数现代框架一样, NX 也是基于 DOM 操作和 后台数据绑定的.在批操作和异步执行方面有更好的性能表现. 基于以上理由我们用 Promises, MutationObservers and requestAnimationFrame().

我们所期望的定时器是这样的:

1. 代码来自于开发者
2. 数据绑定和DOM操作由NX来执行
3. developer定义HOOKS
4. 浏览器进行绘制

#### 步骤 1

NX 寄存器对象基于ES6转变 以及 DOM转换基于MutationObserver(变动观测器)同步运行(下一节详细介绍). 它作为一个microtasks延迟直到步骤 2 执行以后才有反应. 这个延迟已经在 Promise.resolve().then(reaction) 进行了对象转换, 并且它将通过变动观测器自动运行.

#### 步骤 2

开发人员完成了代码(任务). NX的microtask反应注册器开始运行. 当它们进入队列运行. 注意我们仍然在同一个tick循环中.

#### 步骤 3

开发者通过requestAnimationFrame(hook)通知NX运行hooks. 这可能在tick循环后发生. 重要的是hooks运行在下一次绘制之前和所以数据操作之后, 并且DOM和CSS改变都已经完成 .

#### 步骤 4

浏览器绘制下一个视图. 这也有可能发生在tick循环之后, 但是绝对不会发生在步骤3的tick之前.

### 牢记在心里的事情

我们实现了一简单而有效的定时系统. 理论上讲它运行的很好, 但是还是很脆弱, 一个轻微的错误可能会导致很严重的BUG.

在一个复杂的系统当中, 最重要的就是建立一定的规则并在以后保持它们. 在NX中有以下规则.

1. 永远不用setTimeout(fn, 0)来进行内部操作
2. 用相同的方法来注册microtasks
3. microtasks仅供内部操作
4. 不要干预开发者hook运行时间

#### 规则 1 和 2

序列化数据和DOM操作. 这样只要不混合就可以很好的延迟它们. 混合执行会出现莫名其妙的问题. 

setTimeout(fn, 0) 完全不可预测. 使用不同的方法注册microtasks也会发生混乱. 例如 下面的例子中microtask2不会在 microtask1之前正确运行.

```
Promise.resolve().then().then(microtask1)  
Promise.resolve().then(microtask2) 
```

![](https://risingstack-blog.s3.amazonaws.com/2016/Aug/Execution_timing_microtask_registration_method-1470127727609.svg)

#### 规则 3 和 4

分离开发者的代码执行和内部操作是非常重要的. 混合这两种行为会导致不可预测的事情发生, 并且它会迫使开发者了解框架内部. 我想很多前台开发者已经有过类似经历.

### 结论

如果你对 NX 框架感兴趣, 可以参观我们的主页. 还可以再GIT上找到我们的源代码 [NX source code][5] .

在下一节我们再见 [sandboxed code evaluation][4]!

你也可以给我们留言.

--------------------------------------------------------------------------------

via: https://blog.risingstack.com/writing-a-javascript-framework-execution-timing-beyond-settimeout/?utm_source=javascriptweekly&utm_medium=email

作者：[Bertalan Miklos][a]
译者：[kokialoves](https://github.com/kokialoves)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.risingstack.com/author/bertalan/
[1]: http://nx-framework.com/
[2]: https://blog.risingstack.com/writing-a-javascript-framework-project-structuring/
[3]: https://blog.risingstack.com/writing-a-javascript-framework-sandboxed-code-evaluation/
[4]: https://blog.risingstack.com/writing-a-javascript-framework-sandboxed-code-evaluation/
[5]: https://github.com/RisingStack/nx-framework
