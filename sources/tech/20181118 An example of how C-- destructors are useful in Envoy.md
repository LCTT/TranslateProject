[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An example of how C++ destructors are useful in Envoy)
[#]: via: (https://jvns.ca/blog/2018/11/18/c---destructors---really-useful/)
[#]: author: (Julia Evans https://jvns.ca/)

An example of how C++ destructors are useful in Envoy
======

For a while now I’ve been working with a C++ project (Envoy), and sometimes I need to contribute to it, so my C++ skills have gone from “nonexistent” to “really minimal”. I’ve learned what an initializer list is and that a method starting with `~` is a destructor. I almost know what an lvalue and an rvalue are but not quite.

But the other day when writing some C++ code I figured out something exciting about how to use destructors that I hadn’t realized! (the tl;dr of this post for people who know C++ is “julia finally understands what RAII is and that it is useful” :))

### what’s a destructor?

C++ has objects. When an C++ object goes out of scope, the compiler inserts a call to its destructor. So if you have some code like

```
function do_thing() {
  Thing x{}; // this calls the Thing constructor
  return 2;
}
```

there will be a call to x’s destructor at the end of the `do_thing` function. so the code c++ generates looks something like:

  * make new thing
  * call the new thing’s destructor
  * return 2



Obviously destructors are way more complicated like this. They need to get called when there are exceptions! And sometimes they get called manually. And for lots of other reasons too. But there are 10 million things to know about C++ and that is not what we’re doing today, we are just talking about one thing.

### what happens in a destructor?

A lot of the time memory gets freed, which is how you avoid having memory leaks. But that’s not what we’re talking about in this post! We are talking about something more interesting.

### the thing we’re interested in: Envoy circuit breakers

So I’ve been working with Envoy a lot. 3 second Envoy refresher: it’s a HTTP proxy, your application makes requests to Envoy, which then proxies the request to the servers the application wants to talk to.

One very useful feature Envoy has is this thing called “circuit breakers”. Basically the idea with is that if your application makes 50 billion connections to a service, that will probably overwhelm the service. So Envoy keeps track how many TCP connections you’ve made to a service, and will stop you from making new requests if you hit the limit. The default `max_connection` limit

### how do you track connection count?

To maintain a circuit breaker on the number of TCP connections, that means you need to keep an accurate count of how many TCP connections are currently open! How do you do that? Well, the way it works is to maintain a `connections` counter and:

  * every time a connection is opened, increment the counter
  * every time a connection is destroyed (because of a reset / timeout / whatever), decrement the counter
  * when creating a new connection, check that the `connections` counter is not over the limit



that’s all! And incrementing the counter when creating a new connection is pretty easy. But how do you make sure that the counter gets _decremented_ wheh the connection is destroyed? Connections can be destroyed in a lot of ways (they can time out! they can be closed by Envoy! they can be closed by the server! maybe something else I haven’t thought of could happen!) and it seems very easy to accidentally miss a way of closing them.

### destructors to the rescue

The way Envoy solves this problem is to create a connection object (called `ActiveClient` in the HTTP connection pool) for every connection.

Then it:

  * increments the counter in the constructor ([code][1])
  * decrements the counter in the destructor ([code][2])
  * checks the counter when a new connection is created ([code][3])



The beauty of this is that now you don’t need to make sure that the counter gets decremented in all the right places, you now just need to organize your code so that the `ActiveClient` object’s destructor gets called when the connection has closed.

Where does the `ActiveClient` destructor get called in Envoy? Well, Envoy maintains 2 lists of clients (`ready_clients` and `busy_clients`), and when a connection gets closed, Envoy removes the client from those lists. And when it does that, it doesn’t need to do any extra cleanup!! In C++, anytime a object is removed from a list, its destructor is called. So `client.removeFromList(ready_clients_);` takes care of all the cleanup. And there’s no chance of forgetting to decrement the counter!! It will definitely always happen unless you accidentally leave the object on one of these lists, which would be a bug anyway because the connection is closed :)

### RAII

This pattern Envoy is using here is an extremely common C++ programming pattern called “resource acquisition is initialization”. I find that name very confusing but that’s what it’s called. basically the way it works is:

  * identify a resource (like “connection”) where a lot of things need to happen when the connection is initialized / finished
  * make a class for that connection
  * put all the initialization / finishing code in the constructor / destructor
  * make sure the object’s destructor method gets called when appropriate! (by removing it from a vector / having it go out of scope)



Previously I knew about using this pattern for kind of obvious things (make sure all the memory gets freed in the destructor, or make sure file descriptors get closed). But I didn’t realize it was also useful for cases that are slightly less obviously a resource like “decrement a counter”.

The reason this pattern works is because the C++ compiler/standard library does a bunch of work to make sure that destructors get called when you’re done with an object – the compiler inserts destructor calls at the end of each block of code, after exceptions, and many standard library collections make sure destructors are called when you remove an object from a collection.

### RAII gives you prompt, deterministic, and hard-to-screw-up cleanup of resources

The exciting thing here is that this programming pattern gives you a way to schedule cleaning up resources that’s:

  * easy to ensure always happens (when the object goes away, it always happens, even if there was an exception!)
  * prompt &amp; determinstic (it happens right away and it’s guaranteed to happen!)



### what languages have RAII?

C++ and Rust have RAII. Probably other languages too. Java, Python, Go, and garbage collected languages in general do not. In a garbage collected language you can often set up destructors to be run when the object is GC’d. But often (like in this case, which the connection count) you want things to be cleaned up **right away** when the object is no longer in use, not some indeterminate period later whenever GC happens to run.

Python context managers are a related idea, you could do something like:

```
with conn_pool.connection() as conn:
    do stuff
```

### that’s all for now!

Hopefully this explanation of RAII is interesting and mostly correct. Thanks to Kamal for clarifying some RAII things for me!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/11/18/c---destructors---really-useful/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/envoyproxy/envoy/blob/200b0e41641be46471c2ce3d230aae395fda7ded/source/common/http/http1/conn_pool.cc#L301
[2]: https://github.com/envoyproxy/envoy/blob/200b0e41641be46471c2ce3d230aae395fda7ded/source/common/http/http1/conn_pool.cc#L315
[3]: https://github.com/envoyproxy/envoy/blob/200b0e41641be46471c2ce3d230aae395fda7ded/source/common/http/http1/conn_pool.cc#L97
