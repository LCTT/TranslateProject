bestony is translate


Javascript Framework Comparison with Examples (React, Vue & Hyperapp)
============================================================

In [my previous article][5], I tried to explain why I think [Hyperapp][6] is a viable alternative to [React][7] or [Vue][8] and the reasons I found it easier to get started with it. Lots of people criticized that piece, as it was opinionated and didn’t give the other frameworks a proper chance to shine. So, in this article, I’m going to try to compare these three frameworks as objectively as possible, by providing some minimal examples to showcase their capabilities.

#### The infamous counter example

A counter is probably one of the most used examples in reactive programming and is dead simple to understand:

*   You need to have a variable to keep track of the counter’s `count`.

*   You need two methods to increment and decrement the `count` variable.

*   You need a way to render said `count` variable and present it to the user.

*   You need two buttons hooked up to your two methods to alter the `count`variable when the user interacts with them.

Here’s the above implementation in all three frameworks:


![](https://cdn-images-1.medium.com/max/2000/1*SqyC-DRj22wZRBiI-NOiwA.png)
Counter example in React, Vue and Hyperapp

There’s probably quite a lot to take in here, especially if you’re not familiar with one or more of them, so let’s deconstruct the code step-by-step:

*   All three frameworks have some `import` statements at the top.

*   React prefers the Object-Oriented paradigm, by creating a `class` for the `Counter` component. Vue follows a similar pattern by creating a new instance of the `Vue` class and passing information to it. Finally, Hyperapp sticks to the functional paradigm, while entirely separating `view`, `state`and `actions` from each other.

*   As far as the `count` variable is concerned, React instantiates it inside the component’s constructor, while Vue and Hyperapp simply set a property in their `data` and `state` respectively.

*   Moving forward, one notices that React and Vue have very similar methods for interacting with the `count` variable. React uses the `setState`method inherited from `React.Component` to alter its state, while Vue directly alters `this.count`. Hyperapp has its methods written using the ES6 fat arrow syntax and, as far as I can tell, is the only framework that prefers this syntax, due to React and Vue’s need to use `this` inside their methods. Hyperapp’s methods, on the other hand, require the state as an argument, meaning that it might be possible to reuse them in a different context.

*   The rendering part of all three frameworks is virtually the same. The only minor differences are that Vue needs a function, `h`, to be passed to the renderer, the fact that Hyperapp uses `onclick` instead of `onClick` and the way the `count` variable is referenced based on the way state is implemented in each framework.

*   Finally, all three frameworks are mounted to the `#app` element. Each framework has a slightly different syntax, with Vue being the most straightforward one and providing the most versatility by working with an element selector instead of element.

#### Counter example verdict

Comparing all three frameworks side-by-side, Hyperapp needs the fewest lines of code to implement a counter and it’s the only framework that goes for a functional approach. However, Vue’s code seems to be slightly shorter in absolute length, while the element selector mounting is a great addition. React’s code seems to be the most verbose, but that doesn’t mean the code isn’t just as easy to understand.

* * *

#### Working with asynchronous code

Chances are you’re gonna have to deal with asynchronous code. One of the most common asynchronous operations is sending requests to an API. For the purposes of this example, I will use a [placeholder API][9] with some dummy data and render a list of posts. The rundown of what has to be done is the following:

*   Store an array of `posts` in state.

*   Use a method to call `fetch()` with the proper URL, wait for the data, convert to JSON and finally update the `posts` variable with the received data.

*   Render a button that will call the method that fetches the posts.

*   Render the keyed list of `posts`.


![](https://cdn-images-1.medium.com/max/2000/1*aubSG-bpe4g20EOJ_99CFA.png)
Fetching data from a RESTful API

Let’s break down the above code and compare the three frameworks:

*   Similar to the counter example above, storing the state, rendering the view and mounting are very similar between all three frameworks. The differences are the same ones that were discussed above.

*   Fetching the data with `fetch()` is quite simple and works as expected across all three frameworks. The key difference here, however, is that Hyperapp handles asynchronous actions a little bit differently than the other two. Instead of modifying state directly inside the asynchronous action, the action will call a different, synchronous action when the data has been received and converted to JSON. This makes the core more functional and easier to break down into smaller and potentially reusable units, while it avoids some callback nesting problems that might arise.

*   As far as code length is concerned, Hyperapp still needs the fewest lines of code to achieve the same result, but Vue’s code seems a little less verbose and has the shortest absolute length in characters.

#### Asynchronous code verdict

Asynchronous operations are quite easy no matter which framework you choose. Hyperapp might force you down the route of writing functional and more modular code when working with asynchronous actions, but the other two frameworks can definitely do that, too and offer you more of a choice in that respect.

* * *

#### The To-Do List item component

Probably the most famous example in reactive programming, the To-Do List has been implemented using pretty much every single framework in existence. I’m not going to implement the whole thing here, just a stateless component to showcase how all three frameworks can help create smaller reusable building blocks for your web applications.


![](https://cdn-images-1.medium.com/max/1600/1*3-v6XHigZe_5VfPvcR6nyQ.png)
Sample TodoItem implementations

The above image showcases one technique for each framework and an extra one for React. Here’s what we notice reading through all four of them:

*   React is the most flexible one in terms of coding patterns. It supports functional components, as well as class components. And it also supports the Hyperapp component you can see in the bottom right, straight out of the box, no changes required.

*   Hyperapp also supports the functional React component implementation, meaning there is a lot of space for experimentation between the two.

*   Vue comes last here, having a reasonably odd syntax that is not immediately understandable even for someone experienced with the other two.

*   In terms of length, all of the samples are of very similar length, with React being slightly more verbose in some approaches.

#### To-Do List item verdict

Vue takes a little bit to get used to, as its templates are a bit different from the other two frameworks. React is extremely flexible, supporting a handful of different approaches to creating components, while Hyperapp keeps everything simple and provides compatibility with React if you want to make the switch at some point.

* * *

#### Lifecycle method comparison

Another key consideration is what component lifecycle events each framework lets you subscribe to and handle according to your needs. Here’s a table I created from the API reference of each one:


![](https://cdn-images-1.medium.com/max/1600/1*yj4H9pYnagZ7b1pyRE-wmQ.png)
Lifecycle method comparison

*   Vue has the most lifecycle hooks, offering the chance to handle anything that is happening either before or after a lifecycle event has fired. This can come in handy for managing more complex components.

*   React and Hyperapp’s lifecycle hooks are quite similar, with React bundling the `unmount` and `destroy` events together, while Hyperapp bundles the `create` and `mount` events as one. Both offer a decent amount of control in handling lifecycle events.

*   Vue doesn’t handle `unmount` at all (as far as I understand it), instead relying on the `destroy` event to fire later down the line in the component lifecycle. React doesn’t handle the `destroy` event, instead opting to only handle the `unmount` event. Finally, Hyperapp doesn’t handle the `create`event, solely relying on the `mount` event instead. Depending on your needs and experience, these differences might be important to remember when designing around a component’s lifecycle events.

#### Lifecycle method comparison verdict

Overall, lifecycle hooks are provided in every framework and they help you deal with many things during a component’s lifecycle. All three frameworks offer hooks for all of their lifecycle events with minor differences among them, which could stem from the underlying differences in implementation and approach. Vue is certainly a step ahead by offering more granular event handling, allowing you to handle lifecycle events either before or after they are fired.

* * *

#### Performance comparison

Apart from ease-of-use and coding techniques, performance is also one of the key considerations for most developers, especially when working with more complex apps. [js-framework-benchmark][10] is a great resource for comparing frameworks, so let’s see what the numbers say for each set of benchmarks:


![](https://cdn-images-1.medium.com/max/1600/1*ojtkwrkY4NETUmPsfQYDYA.png)
Table operations benchmark

*   Non-keyed operations are a lot faster compared to keyed operations across all three frameworks.

*   Non-keyed React is the most performant of all six variations and it scores an impressive performance across all benchmarks.

*   Keyed Vue only has a slight advantage over keyed React, while non-keyed Vue is significantly less performant than non-keyed React.

*   Vue and Hyperapp seem to have some trouble with the partial update benchmark, while React seems to be well-optimized for that specific operation in comparison.


![](https://cdn-images-1.medium.com/max/1600/1*YFIM2Rd93jDnEZmqw_k3cw.png)
Startup metrics benchmark

*   Hyperapp is the most lightweight of the three frameworks, while React and Vue have a very minor size difference.

*   Hyperapp has a faster bootup time, which is definitely due to its tiny size and minimalistic API.

*   Vue outperforms React by a very small margin in terms of startup time.


![](https://cdn-images-1.medium.com/max/1600/1*WVtufoJUvyjkaeEl2hz2sQ.png)
Memory allocation benchmark

*   Hyperapp is the least resource-heavy of the three, requiring less memory for any operation compared to the other two.

*   Resource consumption is not very high across the board and all three frameworks should perform similarly on modern hardware.

#### Performance comparison verdict

If performance is an issue, you should consider what kind of app you are working on and what your needs are. It seems like Vue and React work best for more complex apps, while Hyperapp is better suited to smaller apps, with less data to process and apps that require a really fast startup or need to work on lower-end hardware.

Keep in mind, however, that these benchmarks are far from representative of the average use-case, so you might see rather different results in a real-life scenario.

* * *

#### Additional notes

Comparing React, Vue and Hyperapp might feel like comparing apples and oranges in many ways. There are some additional considerations concerning these frameworks that could very well help you decide on one over the other two:

*   React circumvents the issue of adjacent JSX elements having to be wrapped in a parent element by introducing [fragments][1], elements that let you group a list of children without adding extra nodes to the DOM.

*   React also provides you with [higher-order components][2], while Vue provides you with [mixins][3] for reusing component functionality.

*   Vue allows for better separation of concerns by separating structure and functionality with the utilization of [templates][4].

*   Hyperapp feels like a lower-level API compared to the other two and its code is a lot shorter, allowing for more versatility if you feel like tweaking it and learning how it works.

* * *

#### Conclusion

I think if you’ve read this far, you already know which tool is better suited to your needs. After all, this was not a discussion of which one is best, but rather a discussion on which one is a better fit for each situation. To sum it all up:

*   React is a very powerful tool, it has a large community of developers around it and will probably help you land a job. It’s not particularly difficult to get into, but it will definitely take a lot of time to master. However, it is great across the board and is worth your time.

*   Vue might seem a bit odd if you have used another Javascript framework in the past, but is also a very interesting tool to use. It’s a viable alternative to React and might be worth learning, if React isn’t your cup of tea. It has some cool features built-in and its community is growing, possibly even faster than React’s.

*   Finally, Hyperapp is a cool little framework for smaller projects and a great place for beginners to start. It provides fewer tools to work with than React or Vue, but it can help you prototype quickly and understand a lot of the fundamentals. A lot of the code you write for it is compatible with the other two frameworks either out of the box or with slight changes, so you can switch frameworks as soon as you feel confident in one of the others.

--------------------------------------------------------------------------------

作者简介：

Web developer who loves to code, creator of 30 seconds of code (https://30secondsofcode.org/) and the mini.css framework (http://minicss.org).

--------------------------------------------------------------------------------

via: https://hackernoon.com/javascript-framework-comparison-with-examples-react-vue-hyperapp-97f064fb468d

作者：[Angelos Chalaris ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://hackernoon.com/@chalarangelo?source=post_header_lockup
[1]:https://reactjs.org/docs/fragments.html
[2]:https://reactjs.org/docs/higher-order-components.html
[3]:https://vuejs.org/v2/guide/mixins.html
[4]:https://vuejs.org/v2/guide/syntax.html
[5]:https://hackernoon.com/i-abandonded-react-in-favor-of-hyperapp-heres-why-df65638f8a79
[6]:https://hyperapp.js.org/
[7]:https://reactjs.org/
[8]:https://vuejs.org/
[9]:https://jsonplaceholder.typicode.com/
[10]:https://github.com/krausest/js-framework-benchmark
