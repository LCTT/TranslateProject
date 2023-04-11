[#]: collector: (lujun9972)
[#]: translator: (Drwhooooo)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Server-sent events: a simple way to stream events from a server)
[#]: via: (https://jvns.ca/blog/2021/01/12/day-36--server-sent-events-are-cool--and-a-fun-bug/)
[#]: author: (Julia Evans https://jvns.ca/)

Server-sent events: a simple way to stream events from a server
======

hello! Yesterday I learned about a cool new way of streaming events from a server I hadn’t heard of before: [server-sent events][1]! They seem like a simpler alternative to websockets if you only need to have the server send events.

I’m going to talk about what they’re for, how they work, and a couple of bugs I ran into while using them yesterday.

### the problem: streaming updates from a server

Right now I have a web service that starts virtual machines, and the client polls the server until the virtual machine is up. But I didn’t want to be doing polling.

Instead, I wanted to stream updates from the server. I told Kamal I was going to implement websockets to do this, and he suggested that server-sent events might be a simpler alternative!

I was like WHAT IS THAT??? It sounded like some weird fancy thing, and I’d never heard of it before. So I looked it up.

### server-sent events are just HTTP requests

Here’s how server-sent events work. I was SO DELIGHTED to learn that they’re just HTTP requests.

  1. The client makes a GET request to (for example) `https://yoursite.com/events`
  2. The client sets `Connection: keep-alive` so that we can have a long-lived connection
  3. The server sets a `Content-Type: text/event-stream` header
  4. The server starts sending events that look like this:



```
event: status
data: one
```

For example, here’s what some server-sent events look like when I make a request with curl:

```
$ curl -N 'http://localhost:3000/sessions/15/stream'
event: panda
data: one

event: panda
data: two

event: panda
data: three

event: elephant
data: four
```

The server can send the events slowly over time, and the client can read them as they arrive. You can also put JSON in the events, like `data: {'name': 'ahmed'}`

The wire protocol is really simple (just set `event:` and `data:` and maybe `id:` and `retry:` if you want), so you don’t need any fancy server libraries to implement server-sent events.

### the Javascript code is also super simple (just use `EventSource`)

Here’s what the browser Javascript code to stream server-sent events looks like. (I got this example from the [MDN page on server-sent events][2])

You can either subscribe to all events, or have different handlers for different types of events. Here I have a handler that just receives events with type `panda` (like our server was sending in the previous section).

```
const evtSource = new EventSource("/sessions/15/stream", { withCredentials: true })
evtSource.addEventListener("panda", function(event) {
  console.log("status", event)
});
```

### the client can’t send updates in the middle

Unlike websockets, server-sent events don’t allow a lot of back-and-forth communication. (it’s in the name – the **server** sends all the events). The client makes one request at the beginning, and then the server sends a bunch of responses.

### if the HTTP connection ends, it’s automatically restarted

One big difference between making an HTTP request with `EventSource` and a regular HTTP request is this note from the MDN docs:

> By default, if the connection between the client and server closes, the connection is restarted. The connection is terminated with the .close() method.

This is pretty weird, and I was really thrown off it by it at first: I opened a connection, I closed it on the server side, and a couple of seconds later the client made another request to my streaming endpoint!

I think the idea here is that maybe the connection might get accidentally disconnected before it’s done, so the client automatically reopens it to prevent that.

So you have to explicitly close the connection by calling `.close()` if you don’t want the client to keep retrying.

### there are a few other features

You can also set `id:` and `retry:` fields in server-sent events. It looks like if you set `id`s on the events the server sends then when reconnecting, the client will send a `Last-Event-ID` header with the last ID it received. Cool!

I found the [W3C page on server-sent events][3] to be surprisingly readable.

### two bugs I ran into while setting up server-sent events

I ran into a couple of problems using server-sent events with Rails that I thought were kinda interesting. One of them was actually caused by nginx, and the other one was caused by rails.

**problem 1: I couldn’t pause in between sending events**

I had this weird bug where if I did:

```
def handler
    # SSE is Rails' built in server-sent events thing
    sse = SSE.new(response.stream, event: "status")
    sse.write('event')
    sleep 1
    sse.write('another event')
end
```

It would write the first event, but not the second event. I was SO MYSTIFIED by this and went on a whole digression trying to understand how `sleep` in Ruby works. But Cass (another Recurser) pointed me to a [Stack Overflow question][4] where someone else had the same problem, which contained a surprising-to-me answer!

It turned out that the problem was that my Rails server was behind nginx, and that nginx seemingly by default uses HTTP/1.0 to make requests to upstreams by default (why? in 2021? really? I’m sure there’s a good reason, probably backwards compatibility or something).

So the client (nginx) would just close the connection after the first event sent by the server. I think the reason why it worked if I _didn’t_ pause between sending the 2 events was basically that the server was racing with the client to send the second part of the response before the connection closed, and if I sent it fast enough then the server won the race.

I’m not sure exactly why using HTTP/1.0 made the client close the connection (maybe because the server writes 2 newlines at the end of each event?), but because server-sent events are a pretty new thing it’s not that surprising that they’re not supported by HTTP/1.0 (which is Very Old).

Setting `proxy_http_version 1.1` fixed that problem. Hooray!

**problem 2: events were being buffered**

Once I sorted that out, I had a second problem. This one was actually super easy to debug because Cass had already suggested [this other stackoverflow answer][5] as a solution to the previous problem, and while that wasn’t what was causing Problem 1, it DID explain Problem 2.

The problem was with this example code:

```
def handler
    response.headers['Content-Type'] = 'text/event-stream'
    # Turn off buffering in nginx
    response.headers['X-Accel-Buffering'] = 'no'
    sse = SSE.new(response.stream, event: "status")
    10.times do
        sse.write('event')
        sleep 1
    end
end
```

I expected it to return 1 event per second for 10 seconds, but instead it waited 10 seconds and returned 10 events all at once. That’s not how we want streaming to work!

This turned out to because the Rack ETag middleware wanted to calculate an ETag (a hash of the response), and to do that it needed to have the whole response. So I needed to disable ETag generation.

The Stack Overflow answer recommended disabling the Rack ETag middleware entirely, but I didn’t want to do that so I went and looked at the [linked github issue][6].

That github issue suggested a workaround I could apply to just the streaming endpoint, which was to set the `Last-Modified` header, which apparently bypasses the ETag middleware for some reason.

So I set

```
headers['Last-Modified'] = Time.now.httpdate
```

and it worked!!!

I also turned off buffering in nginx by setting the header `X-Accel-Buffering: no`. I’m not 100% sure I needed to do that but it seems safer.

### stack overflow is amazing

At first I was really 100% committed to debugging both of those bugs from first principles. Cass (another Recurser) pointed me to those two Stack Overflow threads and at first I was skeptical of the solutions those threads were suggesting (I thought “I’m not using HTTP/1.0! And what does the ETag header have to do with anything??“).

But it turned out that I _was_ accidentally using HTTP/1.0, and that the Rack ETag middleware _was_ causing me problems.

So maybe the moral of that story is that sometimes computers interact in weird ways, other people have experienced computers interacting in the exact same weird ways in the past, and Stack Overflow sometimes has answers about why :)

I do think it’s important to not just randomly try things from Stack Overflow (which nobody was suggesting in this case of course!). For both of these I really had to think about them to understand what was happening and why changing those settings made sense.

### that’s all!

Today I’m going to keep working on implementing server-sent events, because I spent a lot of yesterday being distracted by the above bugs. It’s always such a delight to learn about a new easy-to-use web technology that I’d never heard of.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/01/12/day-36--server-sent-events-are-cool--and-a-fun-bug/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://html.spec.whatwg.org/multipage/server-sent-events.html
[2]: https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events
[3]: https://html.spec.whatwg.org/multipage/server-sent-events.html#event-stream-interpretation
[4]: https://stackoverflow.com/questions/25660399/sse-eventsource-closes-after-first-chunk-of-data-rails-4-puma-nginx
[5]: https://stackoverflow.com/questions/63432012/server-sent-events-in-rails-not-delivered-asynchronously/65127528#65127528
[6]: https://github.com/rack/rack/issues/1619
