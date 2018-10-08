全面教程：在 RxJS 中创建流
================================

![](https://cdn-images-1.medium.com/max/900/1*hj8mGnl5tM_lAlx5_vqS-Q.jpeg)

对大多数开发者来说，与 RxJS 的初次接触是通过库的形式，就像 Angular。一些函数会返回<ruby>流<rt>stream</rt></ruby>，要使用它们就得把注意力放在操作符上。

有些时候，混用响应式和非响应式代码似乎很有用。然后大家就开始热衷流的创造。不论是在编写异步代码或者是数据处理时，流都是一个不错的方案。

RxJS 提供很多方式来创建流。不管你遇到的是什么情况，都会有一个完美的创建流的方式。你可能根本用不上它们，但了解它们可以节省你的时间，让你少码一些代码。

我把所有可能的方法，按它们的主要目的，放在四个分类当中：

*   流式化现有数据
*   生成数据
*   使用现有 API 进行交互
*   选择现有的流，并结合起来

注意：示例用的是 RxJS 6，可能会以前的版本有所不同。已知的区别是你导入函数的方式不同了。

RxJS 6

```
import {of, from} from 'rxjs';

of(...);
from(...);
```

RxJS < 6

```
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/observable/of';
import 'rxjs/add/observable/from';

Observable.of(...);
Observable.from(...);

//或

import { of } from 'rxjs/observable/of';
import { from } from 'rxjs/observable/from';

of(...);
from(...);
```

流的图示中的标记：

*   `|` 表示流结束了
*   `X` 表示流出现错误并被终结
*   `...` 表示流的走向不定

### 流式化已有数据

你有一些数据，想把它们放到流中。有三种方式，并且都允许你把调度器当作最后一个参数传入（你如果想深入了解调度器，可以看看我的 [上一篇文章][5]）。这些生成的流都是静态的。

#### of

如果只有一个或者一些不同的元素，使用 `of`：

```
of(1,2,3)
  .subscribe();
```

```
// 结果
// 1 2 3 |
```

#### from

如果有一个数组或者 _可迭代的对象_ ，而且你想要其中的所有元素发送到流中，使用 `from`。你也可以用它来把一个 promise 对象变成可观测的。

```
const foo = [1,2,3];

from(foo)
  .subscribe();
```

```
// 结果
// 1 2 3 |
```

#### pairs

流式化一个对象的键/值对。用这个对象表示字典时特别有用。

```
const foo = { a: 1, b: 2};

pairs(foo)
  .subscribe();
```

```
// 结果
// [a,1] [b,2] |
```

#### 那么其他的数据结构呢？

也许你的数据存储在自定义的结构中，而它又没有实现 _可迭代的对象_ 接口，又或者说你的结构是递归的、树状的。也许下面某种选择适合这些情况：

1.   先将数据提取到数组里
2.   使用下一节将会讲到的 `generate` 函数，遍历所有数据
3.   创建一个自定义流（见下一节）
4.   创建一个迭代器

稍后会讲到选项 2 和 3 ，因此这里的重点是创建一个迭代器。我们可以对一个 _可迭代的对象_ 调用 `from` 创建一个流。 _可迭代的对象_ 是一个对象，可以产生一个迭代器（如果你对细节感兴趣，参考 [这篇 mdn 文章][6]）。

创建一个迭代器的简单方式是 <ruby>[生成函数][7]<rt>generator function</rt></ruby>。当你调用一个生成函数时，它返回一个对象，该对象同时遵循 _可迭代的对象_ 接口和 _迭代器_ 接口。

```
// 自定义的数据结构
class List {
  add(element) ...
  get(index) ...
  get size() ...
  ...
}

function* listIterator(list) {
  for (let i = 0; i<list.size; i++) {
    yield list.get(i);
  }
}

const myList = new List();
myList.add(1);
myList.add(3);

from(listIterator(myList))
  .subscribe(console.log);
```

```
// 结果
// 1 3 |    
```

调用 `listIterator` 函数时，返回值是一个 _可迭代的对象_ / _迭代器_ 。函数里面的代码在调用 `subscribe` 前不会执行。

### 生成数据

你知道要发送哪些数据，但想（或者必须）动态生成它。所有函数的最后一个参数都可以用来接收一个调度器。他们产生静态的流。

#### 范围（`range`）

从初始值开始，发送一系列数字，直到完成了指定次数的迭代。

```
range(10, 2)  // 从 10 开始，发送两个值
  .subscribe();
```

```
// 结果
// 10 11 |
```

#### 间隔（`interval`） / 定时器（`timer`）

有点像范围，但定时器是周期性的发送累加的数字（就是说，不是立即发送）。两者的区别在于在于定时器允许你为第一个元素设定一个延迟。也可以只产生一个值，只要不指定周期。

```
interval(1000) // 每 1000ms = 1 秒 发送数据
  .subscribe()
```

```
// 结果
// 0  1  2  3  4 ...
```

```
delay(5000, 1000) // 和上面相同，在开始前先等待 5000ms

delay(5000)
.subscribe(i => console.log("foo");
// 5 秒后打印 foo
```

大多数定时器将会用来周期性的处理数据：

```
interval(10000).pipe(
  flatMap(i => fetch("https://server/stockTicker")
).subscribe(updateChart)
```

这段代码每 10 秒获取一次数据，更新屏幕。

#### 生成（`generate `）

这是个更加复杂的函数，允许你发送一系列任意类型的对象。它有一些重载，这里你看到的是最有意思的部分：

```
generate(
  0,           // 从这个值开始
  x => x < 10, // 条件：只要值小于 10，就一直发送
  x => x*2     // 迭代：前一个值加倍
).subscribe();
```

```
// 结果
// 1 2 4 8 |
```

你也可以用它来迭代值，如果一个结构没有实现 _可迭代的对象_ 接口。我们用前面的列表例子来进行演示：

```
const myList = new List();
myList.add(1);
myList.add(3);

generate(
  0,                  // 从这个值开始
  i => i < list.size, // 条件：发送数据，直到遍历完整个列表
  i => ++i,           // 迭代：获取下一个索引
  i => list.get(i)    // 选择器：从列表中取值
).subscribe();
```

```
// 结果
// 1 3 |
```

如你所见，我添加了另一个参数：选择器。它和 `map` 操作符作用类似，将生成的值转换为更有用的东西。

### 空的流

有时候你要传递或返回一个不用发送任何数据的流。有三个函数分别用于不同的情况。你可以给这三个函数传递调度器。`empty` 和 `throwError` 接收一个调度器参数。

#### `empty`

创建一个空的流，一个值也不发送。

```
empty()
  .subscribe();
```

```
// 结果
// |
```

#### `never`

创建一个永远不会结束的流，仍然不发送值。

```
never()
  .subscribe();
```

```
// 结果
// ...
```

#### `throwError`

创建一个流，流出现错误，不发送数据。

```
throwError('error')
  .subscribe();
```

```
// 结果
// X
```

### 挂钩已有的 API

不是所有的库和所有你之前写的代码使用或者支持流。幸运的是 RxJS 提供函数用来桥接非响应式和响应式代码。这一节仅仅讨论 RxJS 为桥接代码提供的模版。

你可能还对这篇出自 [Ben Lesh][9] 的 [全面的文章][8] 感兴趣，这篇文章讲了几乎所有能与 promises 交互操作的方式。

#### `from`

我们已经用过它，把它列在这里是因为，它可以封装一个含有 observable 对象的 promise 对象。

```
from(new Promise(resolve => resolve(1)))
  .subscribe();
```

```
// 结果
// 1 |
```

#### fromEvent

fromEvent 为 DOM 元素添加一个事件监听器，我确定你知道这个。但你可能不知道的是，也可以通过其它类型来添加事件监听器，例如，一个 jQuery 对象。

```
const element = $('#fooButton'); // 从 DOM 元素中创建一个 jQuery 对象

from(element, 'click')
  .subscribe();
```

```
// 结果
// clickEvent ...
```

#### fromEventPattern

要理解为什么有 fromEvent 了还需要 fromEventPattern，我们得先理解 fromEvent 是如何工作的。看这段代码：

```
from(document, 'click')
  .subscribe();
```

这告诉 RxJS 我们想要监听 document 中的点击事件。在提交过程中，RxJS 发现 document 是一个 _EventTarget_ 类型，因此它可以调用它的 `addEventListener` 方法。如果我们传入的是一个 jQuery 对象而非 document，那么 RxJs 知道它得调用 _on_ 方法。

这个例子用的是 _fromEventPattern_ ，和 _fromEvent_ 的工作基本上一样：

```
function addClickHandler(handler) {
  document.addEventListener('click', handler);
}

function removeClickHandler(handler) {
  document.removeEventListener('click', handler);
}

fromEventPattern(
  addClickHandler,
  removeClickHandler,
)
.subscribe(console.log);

// 等效于
fromEvent(document, 'click')
```

RxJS 自动创建实际的监听器（ _handler_ ）你的工作是添加或者移除监听器。_fromEventPattern_ 的目的基本上是告诉 RxJS 如何注册和移除事件监听器。

现在想象一下你使用了一个库，你可以调用一个叫做 _registerListener_ 的方法。我们不能再用 _fromEvent_，因为它并不知道该怎么处理这个对象。

```
const listeners = [];

class Foo {
  registerListener(listener) {
    listeners.push(listener);
  }

  emit(value) {
    listeners.forEach(listener => listener(value));
  }
}

const foo = new Foo();

fromEventPattern(listener => foo.registerListener(listener))
  .subscribe();

foo.emit(1);
```

```
// 结果
// 1 ...
```

当我们调用 `foo.emit(1)` 时，RxJS 中的监听器将被调用，然后它就能把值发送到流中。

你也可以用它来监听多个事件类型，或者结合所有可以通过回调进行通讯的 API，例如，WebWorker API:

```
const myWorker = new Worker('worker.js');

fromEventPattern(
  handler => { myWorker.onmessage = handler },
  handler => { myWorker.onmessage = undefined }
)
.subscribe();
```

```
// 结果
// workerMessage ...
```

#### bindCallback

它和 fromEventPattern 相似，但它能用于单个值。就在回调函数被调用时，流就结束了。用法当然也不一样 —— 你可以用 bindCallBack 封装函数，然后它就会在调用时魔术般的返回一个流：

```
function foo(value, callback) {
  callback(value);
}

// 没有流
foo(1, console.log); //prints 1 in the console

// 有流
const reactiveFoo = bindCallback(foo); 
// 当我们调用 reactiveFoo 时，它返回一个 observable 对象

reactiveFoo(1)
  .subscribe(console.log); // 在控制台打印 1
```

```
// 结果
// 1 |
```

#### websocket

是的，你完全可以创建一个 websocket 连接然后把它暴露给流：

```
import { webSocket } from 'rxjs/webSocket'; 

let socket$ = webSocket('ws://localhost:8081');

// 接收消息
socket$.subscribe(
  (msg) => console.log('message received: ' + msg),
  (err) => console.log(err),
  () => console.log('complete') * );

// 发送消息
socket$.next(JSON.stringify({ op: 'hello' }));
```

把 websocket 功能添加到你的应用中真的很简单。_websocket_ 创建一个 subject。这意味着你可以订阅它，通过调用 `next` 来获得消息和发送消息。

#### ajax

如你所知：类似于 websocket，提供 AJAX 查询的功能。你可能用了一个带有 AJAX 功能的库或者框架。或者你没有用，那么我建议使用 fetch（或者必要的话用 polyfill），把返回的 promise 封装到一个 observable 对象中（参考稍后会讲到的 `defer` 函数）。

### 定制流

有时候已有的函数用起来并不是足够灵活。或者你需要对订阅有更强的控制。

#### 主题（`Subject`）

`Subject` 是一个特殊的对象，它使得你的能够把数据发送到流中，并且能够控制数据。`Subject` 本身就是一个可观察对象，但如果你想要把流暴露给其它代码，建议你使用 `asObservable` 方法。这样你就不能意外调用原始方法。

```
const subject = new Subject();
const observable = subject.asObservable();

observable.subscribe();

subject.next(1);
subject.next(2);
subject.complete();
```

```
// 结果
// 1 2 |
```

注意在订阅前发送的值将会“丢失”：

```
const subject = new Subject();
const observable = subject.asObservable();

subject.next(1);

observable.subscribe(console.log);

subject.next(2);
subject.complete();
```

```
// 结果
// 2
```

除了常规的 `Subject`，RxJS 还提供了三种特殊的版本。

`AsyncSubject` 在结束后只发送最后的一个值。

```
const subject = new AsyncSubject();
const observable = subject.asObservable();

observable.subscribe(console.log);

subject.next(1);
subject.next(2);
subject.complete();
```

```
// 输出
// 2
```

`BehaviorSubject` 使得你能够提供一个（默认的）值，如果当前没有其它值发送的话，这个值会被发送给每个订阅者。否则订阅者收到最后一个发送的值。

```
const subject = new BehaviorSubject(1);
const observable = subject.asObservable();

const subscription1 = observable.subscribe(console.log);

subject.next(2);
subscription1.unsubscribe();
```

```
// 输出
// 1
// 2
```

```
const subscription2 = observable.subscribe(console.log);

// 输出
// 2
```

`ReplaySubject` 存储一定数量、或一定时间或所有的发送过的值。所有新的订阅者将会获得所有存储了的值。

```
const subject = new ReplaySubject();
const observable = subject.asObservable();

subject.next(1);

observable.subscribe(console.log);

subject.next(2);
subject.complete();
```

```
// 输出
// 1
// 2
```

你可以在 [ReactiveX 文档][10]（它提供了一些其它的连接） 里面找到更多关于 `Subject` 的信息。[Ben Lesh][11] 在 [On The Subject Of Subjects][12] 上面提供了一些关于 `Subject` 的理解，[Nicholas Jamieson][13] 在 [in RxJS: Understanding Subjects][14] 上也提供了一些理解。

#### 可观察对象

你可以简单地用 new 操作符创建一个可观察对象。通过你传入的函数，你可以控制流，只要有人订阅了或者它接收到一个可以当成 `Subject` 使用的观察者，这个函数就会被调用，比如，调用 `next`、`complet` 和 `error`。

让我们回顾一下列表示例：

```
const myList = new List();
myList.add(1);
myList.add(3);

new Observable(observer => {
  for (let i = 0; i<list.size; i++) {
    observer.next(list.get(i));
  }

  observer.complete();
})
.subscribe();
```

```
// 结果
// 1 3 |
```

这个函数可以返回一个 `unsubcribe` 函数，当有订阅者取消订阅时这个函数就会被调用。你可以用它来清楚或者执行一些收尾操作。

```
new Observable(observer => {
  // 流式化

  return () => {
                 //clean up
               };
})
.subscribe();
```

#### 继承可观察对象

在有可用的操作符前，这是一种实现自定义操作符的方式。RxJS 在内部扩展了 _可观察对象_ 。`Subject` 就是一个例子，另一个是 `publisher` 操作符。它返回一个 `ConnectableObservable` 对象，该对象提供额外的方法 `connect`。

#### 实现 `Subscribable` 接口

有时候你已经用一个对象来保存状态，并且能够发送值。如果你实现了 `Subscribable` 接口，你可以把它转换成一个可观察对象。`Subscribable` 接口中只有一个 `subscribe` 方法。

```
interface Subscribable<T> {  subscribe(observerOrNext?: PartialObserver<T> | ((value: T) => void), error?: (error: any) => void, complete?: () => void): Unsubscribable}
```

### 结合和选择现有的流

知道怎么创建一个独立的流还不够。有时候你有好几个流但其实只需要一个。有些函数也可作为操作符，所以我不打算在这里深入展开。推荐看看 [Max NgWizard K][16] 所写的一篇 [文章][15]，它还包含一些有趣的动画。

还有一个建议：你可以通过拖拽元素的方式交互式的使用结合操作，参考 [RxMarbles][17]。

#### ObservableInput 类型

期望接收流的操作符和函数通常不单独和可观察对象一起工作。相反，它们实际上期望的参数类型是 ObservableInput，定义如下：

```
type ObservableInput<T> = SubscribableOrPromise<T> | ArrayLike<T> | Iterable<T>;
```

这意味着你可以传递一个 promises 或者数组却不需要事先把他们转换成可观察对象。

#### defer

主要的目的是把一个 observable 对象的创建延迟（`defer`）到有人想要订阅的时间。在以下情况，这很有用：

*   创建可观察对象的开销较大
*   你想要给每个订阅者新的可观察对象
*   你想要在订阅时候选择不同的可观察对象
*   有些代码必须在订阅之后执行

最后一点包含了一个并不起眼的用例：Promises（`defer` 也可以返回一个 promise 对象）。看看这个用到了 fetch API 的例子：

```
function getUser(id) {
  console.log("fetching data");
  return fetch(`https://server/user/${id}`);
}

const userPromise = getUser(1);
console.log("I don't want that request now");

// 其它地方
userPromise.then(response => console.log("done");
```

```
// 输出
// fetching data
// I don't want that request now
// done
```

只要流在你订阅的时候执行了，promise 就会立即执行。我们调用 `getUser` 的瞬间，就发送了一个请求，哪怕我们这个时候不想发送请求。当然，我们可以使用 `from` 来把一个 promise 对象转换成可观察对象，但我们传递的 promise 对象已经创建或执行了。`defer` 让我们能够等到订阅才发送这个请求：

```
const user$ = defer(() => getUser(1));

console.log("I don't want that request now");

// 其它地方
user$.subscribe(response => console.log("done");
```

```
// 输出
// I don't want that request now
// fetching data
// done
```

#### iif

 `iif` 包含了一个关于 `defer` 的特殊用例：在订阅时选择两个流中的一个：

```
iif(
  () => new Date().getHours() < 12,
  of("AM"),
  of("PM")
)
.subscribe();
```

```
// 结果
// AM before noon, PM afterwards
```

引用该文档：

> 实际上 [iif][3] 能够轻松地用 [defer][4] 实现，它仅仅是出于方便和可读性的目的。

#### onErrorResumeNext

开启第一个流并且在失败的时候继续进行下一个流。错误被忽略掉。

```
const stream1$ = of(1, 2).pipe(
  tap(i => { if(i>1) throw 'error'}) //fail after first element
);

const stream2$ = of(3,4);

onErrorResumeNext(stream1$, stream2$)
  .subscribe(console.log);
```

```
// 结果
// 1 3 4 |
```

如果你有多个 web 服务，这就很有用了。万一主服务器开启失败，那么备份的服务就能自动调用。

#### forkJoin

它让流并行运行，当流结束时发送存在数组中的最后的值。由于每个流只有最后一个值被发送，它一般用在只发送一个元素的流的情况，就像 HTTP 请求。你让请求并行运行，在所有流收到响应时执行某些任务。

```
function handleResponses([user, account]) {
  // 执行某些任务
}

forkJoin(
  fetch("https://server/user/1"),
  fetch("https://server/account/1")
)
.subscribe(handleResponses);
```

#### merge / concat

发送每一个从可观察对象源中发出的值。

`merge` 接收一个参数，让你定义有多少流能被同时订阅。默认是无限制的。设为 1 就意味着监听一个源流，在它结束的时候订阅下一个。由于这是一个常见的场景，RxJS 为你提供了一个显示的函数：`concat`。

```
merge(
  interval(1000).pipe(mapTo("Stream 1"), take(2)),
  interval(1200).pipe(mapTo("Stream 2"), take(2)),
  timer(0, 1000).pipe(mapTo("Stream 3"), take(2)),
  2 //two concurrent streams
)
.subscribe();

// 只订阅流 1 和流 2

// 输出
// Stream 1 -> after 1000ms
// Stream 2 -> after 1200ms
// Stream 1 -> after 2000ms

// 流 1 结束后，开始订阅流 3

// 输出
// Stream 3 -> after 0 ms
// Stream 2 -> after 400 ms (2400ms from beginning)
// Stream 3 -> after 1000ms

merge(
  interval(1000).pipe(mapTo("Stream 1"), take(2)),
  interval(1200).pipe(mapTo("Stream 2"), take(2))
  1
)
// 等效于
concat(
  interval(1000).pipe(mapTo("Stream 1"), take(2)),
  interval(1200).pipe(mapTo("Stream 2"), take(2))
)

// 输出
// Stream 1 -> after 1000ms
// Stream 1 -> after 2000ms
// Stream 2 -> after 3200ms
// Stream 2 -> after 4400ms
```

#### zip / combineLatest

`merge` 和 `concat` 一个接一个的发送所有从源流中读到的值，而 `zip` 和 `combineLatest` 是把每个流中的一个值结合起来一起发送。`zip` 结合所有源流中发送的第一个值。如果流的内容相关联，那么这就很有用。

```
zip(
  interval(1000),
  interval(1200),
)
.subscribe();
```

```
// 结果
// [0, 0] [1, 1] [2, 2] ...
```

`combineLatest` 与之类似，但结合的是源流中发送的最后一个值。直到所有源流至少发送一个值之后才会触发事件。这之后每次源流发送一个值，它都会把这个值与其他流发送的最后一个值结合起来。

```
combineLatest(
  interval(1000),
  interval(1200),
)
.subscribe();
```

```
// 结果
// [0, 0] [1, 0] [1, 1] [2, 1] ...
```

两个函数都让允许传递一个选择器函数，把元素结合成其它对象而不是数组：

```
zip(
  interval(1000),
  interval(1200),
  (e1, e2) -> e1 + e2
)
.subscribe();
```

```
// 结果
// 0 2 4 6 ...
```

#### race

选择第一个发送数据的流。产生的流基本是最快的。

```
race(
  interval(1000),
  of("foo")
)
.subscribe();
```

```
// 结果
// foo |
```

由于 `of` 立即产生一个值，因此它是最快的流，然而这个流就被选中了。

### 总结

已经有很多创建可观察对象的方式了。如果你想要创造响应式的 API 或者想用响应式的 API 结合传统 API，那么了解这些方法很重要。

我已经向你展示了所有可用的方法，但它们其实还有很多内容可以讲。如果你想更加深入地了解，我极力推荐你查阅 [文档][20] 或者阅读相关文章。

[RxViz][21] 是另一种值得了解的有意思的方式。你编写 RxJS 代码，产生的流可以用图形或动画进行显示。

--------------------------------------------------------------------------------

via: https://blog.angularindepth.com/the-extensive-guide-to-creating-streams-in-rxjs-aaa02baaff9a

作者：[Oliver Flaggl][a]
译者：[BriFuture](https://github.com/BriFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.angularindepth.com/@abetteroliver
[1]:https://rxjs-dev.firebaseapp.com/api/index/Subscribable
[2]:https://rxjs-dev.firebaseapp.com/api/index/Subscribable#subscribe
[3]:https://rxjs-dev.firebaseapp.com/api/index/iif
[4]:https://rxjs-dev.firebaseapp.com/api/index/defer
[5]:https://itnext.io/concurrency-and-asynchronous-behavior-with-rxjs-11b0c4b22597
[6]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols
[7]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*
[8]:https://medium.com/@benlesh/rxjs-observable-interop-with-promises-and-async-await-bebb05306875
[9]:https://medium.com/@benlesh
[10]:http://reactivex.io/documentation/subject.html
[11]:https://medium.com/@benlesh
[12]:https://medium.com/@benlesh/on-the-subject-of-subjects-in-rxjs-2b08b7198b93
[13]:https://medium.com/@cartant
[14]:https://blog.angularindepth.com/rxjs-understanding-subjects-5c585188c3e1
[15]:https://blog.angularindepth.com/learn-to-combine-rxjs-sequences-with-super-intuitive-interactive-diagrams-20fce8e6511
[16]:https://medium.com/@maximus.koretskyi
[17]:http://rxmarbles.com/#merge
[18]:https://rxjs-dev.firebaseapp.com/api/index/ObservableInput
[19]:https://rxjs-dev.firebaseapp.com/api/index/SubscribableOrPromise
[20]:http://reactivex.io/documentation/operators.html#creating
[21]:https://rxviz.com/
