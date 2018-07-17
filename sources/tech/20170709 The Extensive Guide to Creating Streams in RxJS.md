BriFuture is translating

The Extensive Guide to Creating Streams in RxJS
============================================================

![](https://cdn-images-1.medium.com/max/900/1*hj8mGnl5tM_lAlx5_vqS-Q.jpeg)

For most developers the first contact with RxJS is established by libraries, like Angular. Some functions return streams and to make use of them the focus naturally is on operators.

At some point mixing reactive and some of the non-reactive code seems practical. Then people get interested in creating streams themselves. Whenever you are dealing with asynchronous code or data processing, chances are that streams are a good option.

RxJS offers numerous ways to create streams. Whatever situation you are facing, there is one perfect way for you to create a stream. You may not need them all, but knowing them can save you time and some code.

I have put all possible options into four categories, based on their main purpose:

*   Stream existing data

*   Generate data

*   Interoperate with existing APIs

*   Combine and select from existing streams

Note: The examples use RxJS 6 and can be different from older versions. Something that’s different for sure is the way you import the functions.

RxJS 6

```
import {of, from} from 'rxjs';
```

```
of(...);
from(...);
```

RxJS < 6

```
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/observable/of';
import 'rxjs/add/observable/from';
```

```
Observable.of(...);
Observable.from(...);
```

```
//or
```

```
import { of } from 'rxjs/observable/of';
import { from } from 'rxjs/observable/from';
```

```
of(...);
from(...);
```

A note on the stream diagrams:

*   | means the stream completes

*   X means the stream terminates with an error

*   … means the stream goes on indefinitely

* * *

### Stream Existing Data

You have some data and want to feed them into a stream. There are three flavors, all of which also allow you to provide a scheduler as the last argument (If you want to know more about schedulers you can take a look at my [previous article][5]). All resulting streams will be cold.

#### of

Use  _of_  if you have only one element or a few separate ones.

```
of(1,2,3)
  .subscribe();
```

```
// Produces
// 1 2 3 |
```

#### from

Use  _from_  if you have an array or  _Iterable_  and want all elements in it emitted to the stream. You can also use it to convert a promise to an observable.

```
const foo = [1,2,3];
```

```
from(foo)
  .subscribe();
```

```
// Produces
// 1 2 3 |
```

#### pairs

Streams key/value pairs of an object. Particularly useful if the object represents a dictionary.

```
const foo = { a: 1, b: 2};
```

```
pairs(foo)
  .subscribe();
```

```
// Produces
// [a,1] [b,2] |
```

#### What about other data structures?

Maybe your data is stored in a custom structure that does not implement the  _Iterable_  protocol or you have a recursive, tree-like structure. In those cases one of following options might be suitable:

*   Extract data to an array first

*   Use the  _generate_  function from the next section to iterate over the data

*   Create a custom stream (see that section)

*   Create an iterator

Options 2 and 3 are explained later, so I focus on creating an iterator here. We can create a stream from an  _iterable_  by calling  _from_ . An  _iterable_  is an object that can deliver an iterator (see [this mdn article][6] if you are interested in the details).

One simple way to create an iterator is a [generator function][7]. When you invoke a generator function, it returns an object that conforms to both the  _iterable_ protocol and the  _iterator_  protocol.

```
//Our custom data structure
class List {
  add(element) ...
  get(index) ...
  get size() ...
  ...
}
```

```
function* listIterator(list) {
  for (let i = 0; i<list.size; i++) {
    yield list.get(i);
  }
}
```

```
const myList = new List();
myList.add(1);
myList.add(3);
```

```
from(listIterator(myList))
  .subscribe(console.log);
```

```
// Produces
// 1 3 |    
```

When we call the `listIterator` function an  _iterable_  /  _iterator_  is returned. The code inside the function is not executed before we call  _subscribe_ .

* * *

### Generate Data

You know what data to emit but want / have to generate it on the fly. All functions accept a scheduler as last argument. They produce cold streams.

#### range

Emits sequential numbers beginning with a start value and going on for a defined number of iterations.

```
range(10, 2) //start with 10 and emit two values
  .subscribe();
```

```
// Produces
// 10 11 |
```

#### interval / timer

Somewhat similar to  _range_ , but emits incremental numbers periodically (i.e. not at once). The difference between the two is that  _timer_  allows you to define a delay for the first element. It also allows you to produce just a single value by not specifying a period.

```
interval(1000) //emit every 1000ms = 1 second
  .subscribe()
```

```
// Produces
// 0  1  2  3  4 ...
```

```
delay(5000, 1000) //the same as above but waits 5000ms before it starts
```

```
delay(5000)
.subscribe(i => console.log("foo");
//prints foo after 5 seconds
```

Most of the time interval will be used to process data periodically:

```
interval(10000).pipe(
  flatMap(i => fetch("https://server/stockTicker")
).subscribe(updateChart)
```

This will get new data every 10 seconds and update the screen.

#### generate

A more complex function that allows you to emit a sequence of any type. It has some overloads and I show you the most interesting one(s):

```
generate(
  0,           // start with this value
  x => x < 10, // condition: emit as long as a value is less than 10
  x => x*2     // iteration: double the previous value
).subscribe();
```

```
// Produces
// 1 2 4 8 |
```

You can also use it to iterate over values, if a structure does not implement the  _Iterable_  interface. Let’s try that with our list example from before:

```
const myList = new List();
myList.add(1);
myList.add(3);
```

```
generate(
  0,                  // start with this value
  i => i < list.size, // condition: emit until we have processed the whole list
  i => ++i,           // iteration: get next index
  i => list.get(i)    // selection: get value from list 
).subscribe();
```

```
// Produces
// 1 3 |
```

As you can see I have added another argument: The selector. It works like the  _map_  operator and converts the generated value to something more useful.

* * *

### Empty Streams

Sometimes you need to pass or return a stream that does not emit any data. There are three functions, one for every possible situation. You can pass a scheduler to all functions.  _empty_  and  _throwError_  accept a scheduler as argument.

#### empty

Creates a stream that completes without emitting a value.

```
empty()
  .subscribe();
```

```
// Produces
// |
```

#### never

Creates a stream that never completes, but also never emits anything.

```
never()
  .subscribe();
```

```
// Produces
// ...
```

#### throwError

Creates a stream that fails without emitting a value.

```
throwError('error')
  .subscribe();
```

```
// Produces
// X
```

* * *

### Hook into existing APIs

Not all libraries and all of your legacy code use or support streams. Luckily RxJS provides functions to bridge non-reactive and reactive code. This section discusses only patterns provided by RxJS for exactly that purpose.

You may also be interested in this [extensive article][8] from [Ben Lesh][9] covering probably every possible way to interoperate with promises.

#### from

We already had that and I list it here too because it can be used to wrap a promise into an observable.

```
from(new Promise(resolve => resolve(1)))
  .subscribe();
```

```
// Produces
// 1 |
```

#### fromEvent

Adds an event listener to a DOM element and I am pretty sure you know that. What you may not know is that you can also use it with other types, e.g. a jQuery object.

```
const element = $('#fooButton'); // creates a jQuery object for a DOM element
```

```
from(element, 'click')
  .subscribe();
```

```
// Produces
// clickEvent ...
```

#### fromEventPattern

In order to understand why we need this one if we already have fromEvent, we need to understand how fromEvent works. Take this code:

```
from(document, 'click')
  .subscribe();
```

It tells RxJS that we want to listen to click events from the document. During subscription RxJS finds out that document is an  _EventTarget_  type, hence it can call  _addEventListener_  on it. If we pass a jQuery object instead of document, then RxJS knows that it has to call  _on_  instead.

This example using  _fromEventPattern_  basically does the same as  _fromEvent_ :

```
function addClickHandler(handler) {
  document.addEventListener('click', handler);
}
```

```
function removeClickHandler(handler) {
  document.removeEventListener('click', handler);
}
```

```
fromEventPattern(
  addClickHandler,
  removeClickHandler,
)
.subscribe(console.log);
```

```
//is equivalent to
fromEvent(document, 'click')
```

RxJS itself creates the actual listener ( _handler_ ) and your job is to add and remove it. The purpose of  _fromEventPattern_  is basically to tell RxJS how to register and remove event listeners.

Now imagine you use a library where you have to call a method named  _registerListener_ . We no longer can use  _fromEvent_  because it doesn’t know how to deal with it.

```
const listeners = [];
```

```
class Foo {
  registerListener(listener) {
    listeners.push(listener);
  }
```

```
  emit(value) {
    listeners.forEach(listener => listener(value));
  }
}
```

```
const foo = new Foo();
```

```
fromEventPattern(listener => foo.registerListener(listener))
  .subscribe();
```

```
foo.emit(1);
```

```
// Produces
// 1 ...
```

When we call foo.emit(1) the listener from RxJS is called and it can emit the value to the stream.

You could also use it to listen to more than one event type or connect with any API that communicates via callbacks, e.g. the WebWorker API:

```
const myWorker = new Worker('worker.js');
```

```
fromEventPattern(
  handler => { myWorker.onmessage = handler },
  handler => { myWorker.onmessage = undefined }
)
.subscribe();
```

```
// Produces
// workerMessage ...
```

#### bindCallback

This is similar to fromEventPattern, but it’s only meant for single values. That is the stream completes after the callback has been invoked . The usage is different as well – You wrap the function with bindCallback, then it magically returns a stream when it‘s called:

```
function foo(value, callback) {
  callback(value);
}
```

```
// without streams
foo(1, console.log); //prints 1 in the console
```

```
// with streams
const reactiveFoo = bindCallback(foo); 
//when we call reactiveFoo it returns an observable
```

```
reactiveFoo(1)
  .subscribe(console.log); //prints 1 in the console
```

```
// Produces
// 1 |
```

#### websocket

Yes, you can actually create a websocket connection and expose it as stream:

```
import { webSocket } from 'rxjs/webSocket'; 
```

```
let socket$ = webSocket('ws://localhost:8081');
```

```
//receive messages
socket$.subscribe(
  (msg) => console.log('message received: ' + msg),
  (err) => console.log(err),
  () => console.log('complete') * );
```

```
//send message
socket$.next(JSON.stringify({ op: 'hello' }));
```

It’s really that easy to add websocket support to your application.  _websocket_ creates a subject. That means you can both subscribe to it in order to receive messages and send messages through it by calling  _next_ .

#### ajax

Just so you know it: Similar to websocket and offers support for AJAX requests. You probably use a library or framework with built-in AJAX support anyway. And if you don’t then I recommend using fetch (and a polyfill if necessary) instead and wrap the returned promise into an observable (see also the  _defer_  function below).

* * *

### Custom Streams

Sometimes the already presented functions are not flexible enough. Or you need more control over subscriptions.

#### Subject

A subject is a special object that allows you to emit data to the stream and control it. The subject itself is also an observable, but if you want to expose the stream to other code it’s recommended to use the  _asObservable_  method. That way you cannot accidentally call the source methods.

```
const subject = new Subject();
const observable = subject.asObservable();
```

```
observable.subscribe();
```

```
subject.next(1);
subject.next(2);
subject.complete();
```

```
// Produces
// 1 2 |
```

Note that values emitted before subscriptions are “lost”:

```
const subject = new Subject();
const observable = subject.asObservable();
```

```
subject.next(1);
```

```
observable.subscribe(console.log);
```

```
subject.next(2);
subject.complete();
```

```
// Prints
// 2
```

In addition to the regular subject RxJS provides three specialized versions.

The  _AsyncSubject_  emits only the last value after completion.

```
const subject = new AsyncSubject();
const observable = subject.asObservable();
```

```
observable.subscribe(console.log);
```

```
subject.next(1);
subject.next(2);
subject.complete();
```

```
// Prints
// 2
```

The  _BehaviorSubject_  allows you to provide a (default) value that will be emitted to every subscriber if no other value has been emitted so far. Otherwise subscribers receive the last emitted value.

```
const subject = new BehaviorSubject(1);
const observable = subject.asObservable();
```

```
const subscription1 = observable.subscribe(console.log);
```

```
subject.next(2);
subscription1.unsubscribe();
```

```
// Prints
// 1
// 2
```

```
const subscription2 = observable.subscribe(console.log);
```

```
// Prints
// 2
```

The  _ReplaySubject_  stores all emitted values up to a certain number, time or infinitely. All new subscribers will then get all stored values.

```
const subject = new ReplaySubject();
const observable = subject.asObservable();
```

```
subject.next(1);
```

```
observable.subscribe(console.log);
```

```
subject.next(2);
subject.complete();
```

```
// Prints
// 1
// 2
```

You can find more information on subjects in the [ReactiveX documentation][10](that also offers additional links). [Ben Lesh][11] offers some insights on subjects in [On The Subject Of Subjects][12], as does [Nicholas Jamieson][13] [in RxJS: Understanding Subjects][14].

#### Observable

You can create an observable by simply using the the new operator. With the function you pass in you can control the stream. That function is called whenever someone subscribe and it receives an observer that you can use like a subject, i.e. call next, complete and error.

Let’s revisit our list example:

```
const myList = new List();
myList.add(1);
myList.add(3);
```

```
new Observable(observer => {
  for (let i = 0; i<list.size; i++) {
    observer.next(list.get(i));
  }
```

```
  observer.complete();
})
.subscribe();
```

```
// Produces
// 1 3 |
```

The function can return an unsubscribe function that is called when the subscriber cancels the subscription. You can use it to clean up or execute some finishing action.

```
new Observable(observer => {
  //stream it, baby!
```

```
  return () => {
                 //clean up
               };
})
.subscribe();
```

#### Subclass Observable

Before the advent of lettable operators this was a way to implement custom operators. RxJS extends  _Observable_  internally. One example is  _Subject_ , another is the  _publish_  operator. It returns a  _ConnectableObservable_  that provides the additional method  _connect_ .

#### Implement Subscribable

Sometimes you already have an object that holds state and can emit values. You can turn it into an observable if you implement the Subscribable interface that consists of only a subscribe method.

```
interface Subscribable<T> {  subscribe(observerOrNext?: PartialObserver<T> | ((value: T) => void), error?: (error: any) => void, complete?: () => void): Unsubscribable}
```

* * *

### Combine and Select Existing Streams

Knowing how to create individual streams is not enough. Sometimes you are confronted with several streams but you only need one. Some of the functions are also available as operators, that’s why I won’t go too deep here. I can recommend an [article][15] from [Max NgWizard K][16] that even contains some fancy animations.

One more recommendation: You can interactively play with combination operators on [RxMarbles][17] by dragging around elements.

#### The ObservableInput type

Operators and functions that expect a stream (or an array of streams) usually do not only work with observables. Instead they actually expect the argument to be of the type ObservableInput that is defined as follows:

```
type ObservableInput<T> = SubscribableOrPromise<T> | ArrayLike<T> | Iterable<T>;
```

That means you can e.g. pass promises or arrays without needing to convert them to observables first!

#### defer

The main purpose is to defer the creation of an observable to the time when someone wants to subscribe. This is useful if

*   the creation of the observable is computationally expensive

*   you want a new observable for each subscriber

*   you want to choose between different observables at subscription time

*   some code must not be executed before subscription

The last point includes one not so obvious use case: Promises (defer can also return a promise). Take this example using the fetch API:

```
function getUser(id) {
  console.log("fetching data");
  return fetch(`https://server/user/${id}`);
}
```

```
const userPromise = getUser(1);
console.log("I don't want that request now");
```

```
//somewhere else
userPromise.then(response => console.log("done");
```

```
// Prints
// fetching data
// I don't want that request now
// done
```

Promises are executed immediately, whereas streams are executed when you subscribe. The very moment we call getUser, a request is sent even if we did not want that at that point. Sure, we can use from to convert a promise to an observable, but the promise we pass has already been created / executed. defer allows us to wait until subscription:

```
const user$ = defer(() => getUser(1));
```

```
console.log("I don't want that request now");
```

```
//somewhere else
user$.subscribe(response => console.log("done");
```

```
// Prints
// I don't want that request now
// fetching data
// done
```

#### iif

 _iif_  covers a special use case of  _defer_ : Deciding between two streams at subscription time:

```
iif(
  () => new Date().getHours() < 12,
  of("AM"),
  of("PM")
)
.subscribe();
```

```
// Produces
// AM before noon, PM afterwards
```

To quote the documentation:

> Actually `[iif][3]` can be easily implemented with `[defer][4]`and exists only for convenience and readability reasons.

#### onErrorResumeNext

Starts the first stream and if it fails continues with the next stream. The error is ignored.

```
const stream1$ = of(1, 2).pipe(
  tap(i => { if(i>1) throw 'error'}) //fail after first element
);
```

```
const stream2$ = of(3,4);
```

```
onErrorResumeNext(stream1$, stream2$)
  .subscribe(console.log);
```

```
// Produces
// 1 3 4 |
```

This can be useful if you have more than one web service. In case the main one fails the backup service can be called automatically.

#### forkJoin

Lets streams run concurrently and emits their last values in an array when they are completed. Since only the last values of each streams are emitted it’s typically used for streams that only emit a single element, like HTTP requests. You want the requests run in parallel and do something when all have responses.

```
function handleResponses([user, account]) {
  // do something
}
```

```
forkJoin(
  fetch("https://server/user/1"),
  fetch("https://server/account/1")
)
.subscribe(handleResponses);
```

#### merge / concat

Emits every value that is emitted by one of the source observables.

 _merge_  supports a parameter that let’s you define how many source streams are subscribed to concurrently. The default is unlimited. A value of 1 would mean listen to one source stream and when it’s completed subscribe to the next one. Since that is a very common scenario you RxJS provides an explicit function:  _concat_ .

```
merge(
  interval(1000).pipe(mapTo("Stream 1"), take(2)),
  interval(1200).pipe(mapTo("Stream 2"), take(2)),
  timer(0, 1000).pipe(mapTo("Stream 3"), take(2)),
  2 //two concurrent streams
)
.subscribe();
```

```
// Subscribes to stream 1 and 2 only
```

```
// prints
// Stream 1 -> after 1000ms
// Stream 2 -> after 1200ms
// Stream 1 -> after 2000ms
```

```
// Stream 1 has completed, now subscribe to stream 3
```

```
// prints
// Stream 3 -> after 0 ms
// Stream 2 -> after 400 ms (2400ms from beginning)
// Stream 3 -> after 1000ms
```

```

merge(
  interval(1000).pipe(mapTo("Stream 1"), take(2)),
  interval(1200).pipe(mapTo("Stream 2"), take(2))
  1
)
// is equal to
concat(
  interval(1000).pipe(mapTo("Stream 1"), take(2)),
  interval(1200).pipe(mapTo("Stream 2"), take(2))
)
```

```
// prints
// Stream 1 -> after 1000ms
// Stream 1 -> after 2000ms
// Stream 2 -> after 3200ms
// Stream 2 -> after 4400ms
```

#### zip / combineLatest

While  _merge_  and  _concat_  emit all values from the source streams individually, zip and combineLatest combine one value of each source stream and emit them together.  _zip_  combines the first values emitted by all(!) source streams, the second values and so on. This is useful if the contents of the streams are related.

```
zip(
  interval(1000),
  interval(1200),
)
.subscribe();
```

```
// Produces
// [0, 0] [1, 1] [2, 2] ...
```

 _combineLatest_  is similar but combines the latest values emitted by the source streams. Nothing happens until all source streams have emitted at least one value. From then on every time a source stream emits a value, it is combined with the last values of the other streams.

```
combineLatest(
  interval(1000),
  interval(1200),
)
.subscribe();
```

```
// Produces
// [0, 0] [1, 0] [1, 1] [2, 1] ...
```

Both functions allow you to pass a selector function that can combine the elements to something else than an array:

```
zip(
  interval(1000),
  interval(1200),
  (e1, e2) -> e1 + e2
)
.subscribe();
```

```
// Produces
// 0 2 4 6 ...
```

#### race

The first stream that emits a value is selected. So the resulting stream is essentially the fastest stream.

```
race(
  interval(1000),
  of("foo")
)
.subscribe();
```

```
// Produces
// foo |
```

Since  _of_  produces a value immediately it’s the faster stream and the stream that gets selected.

* * *

### Conclusion

That have been a lot of ways to create observables. Knowing them is essential if you want to create reactive APIs or want to combine legacy APIs with reactive ones.

I have presented you all options but much more could be said about all of them. If you want to dive deeper I highly recommend consulting the [documentation][20] or reading the suggested articles.

Another interesting way to get insight is [RxViz][21]. You write RxJS code and the resulting streams are then displayed graphically and animated.

--------------------------------------------------------------------------------

via: https://blog.angularindepth.com/the-extensive-guide-to-creating-streams-in-rxjs-aaa02baaff9a

作者：[Oliver Flaggl][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
