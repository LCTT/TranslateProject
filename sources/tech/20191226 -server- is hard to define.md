[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: ("server" is hard to define)
[#]: via: (https://jvns.ca/blog/2019/12/26/whats-a-server/)
[#]: author: (Julia Evans https://jvns.ca/)

"server" is hard to define
======

Somebody asked me recently what a server was, and I had a harder time explaining it than I expected! I thought I was going to be able to give some kind of simple pithy answer but it kind of got away from me. So here’s an short exploration of what the word “server” can mean:

### a server responds to requests

A server definitely responds to requests. A few examples:

webserver:

```
Me: "please give me google.com"
Server: "here is the HTML for that webpage"
```

bittorrent server:

```
Me: "I would like this chunk of the good wife season 2"
Server: "here are some of the  bytes from that .avi file!"
```

mail server:

```
Me: "can you send this email to [email protected]"
Server: "I sent it!"
```

But what is a server actually specifically exactly?

### a server is a program

My first instinct is to say “a server is a program” because for example a “the wordpress server” is a PHP program, so let’s start with that.

A server is usually a program that listens on a **port** (like 80). For example, if we’re talking about a Rails webserver, then the program is a Ruby program that’s listening on a port for HTTP requests.

For example, we can start a Python server to serve files out of the current directory.

```
$ python3 -m http.server &
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ..
```

and send requests to it with `curl`:

```
$ curl localhost:8000/config.yaml
baseurl: https://jvns.ca
disablePathToLower: true
languageCode: en-us
title: Julia Evans
author: Julia Evans
...
```

### a server might be a virtual machine

But often when I talk about “a server” at work, I’ll use it in a sentence like “I’m going to SSH to that server to see what’s going on with it”, or “wow, that server is swapping a lot, that’s bad!“.

So in those cases clearly I don’t mean a program when I say “that server” (you can’t ssh to a program, though the ssh server that runs on the VM is itself a program!), I mean the AWS instance that the server program is running on. That AWS instance is a virtual machine, which looks like a computer in a lot of ways (it’s running an operating system!) but it isn’t a physical computer.

### a server might be a container

Similarly to how your server might be a virtual machine, it could also be a container running in a virtual machine. So “the server is running out of memory” could mean “the container is running out of memory and crashing” which really means “we set a cgroup memory limit on this container and the programs in the container with that cgroup exceeded the limit so the Linux kernel OOM killed them”.

But containers make everything a lot more complicated so I think we should stop there for now.

### a server is a computer

But also when you **buy** a server from Dell or some other computer company, you’re not buying a virtual machine, you’re buying an actual physical machine.

Usually these computers are in building datacenters. For example in this video you can see thousands of servers in a Google datacenter.

The computers in this datacenter don’t look like the computers in my house! They’re short and wide because they’re designed to fit into these giant racks of servers. For example if you search Newegg for [1U server][1] you’ll find servers that are 1 “[rack unit][2]” high, and a rack unit is 1.75 inches. There are also 2U servers which are twice as high.

Here’s a picture of a 1U server I found on Newegg:

![][3]

I’ve only seen a server rack once at the [Internet Archive][4] which is in what used to be a church in San Francisco, and it was really cool to realize – wow, when I use the Wayback Machine it’s using the actual computers in this room!

### “the server” might be 1000 computers

Next, let’s say we’re talking about how Gmail works. You might ask “hey, when I search my email to find my boarding pass, does that happen in the frontend or on the server?”.

The answer is “it happens on the server”, but what’s “the server” here? There’s not just one computer or program or virtual machine that searches your Gmail, there are probably lots of computers and programs at Google that are reponsible for that and they’re probably distributed across many datacenters all over the world.

And even if we’re just talking about doing 1 search, there could easily be 20 different computers in 3 different countries involved in just running that 1 search.

So the words “the server” in “oh yeah, that happens on the server” mean something kind of complicated here – what you’re actually saying is something “well the browser makes a request, and that request does _something_, but I’m not really going to worry about what because the important thing is just that the browser made a request and got some kind of response back.”

### what happens when I search my email for a boarding pass?

When I search for “boarding” in my email, the Javascript running on the frontend puts together this request. It’s mostly indecipherable but it definitely contains the word “boarding”:

```
{
  "1": {
    "1": 79,
    "2": 101,
    "4": "boarding",
    "5": {
      "5": 0,
      "12": "1577376926313",
      "13": -18000000
    },
    "6": "itemlist-ViewType(79)-5",
    "7": 1,
    "8": 2000,
    "10": 0,
    "14": 1,
    "16": {
      "1": 1,
      "2": 0,
      "3": 0,
      "7": 1
    },
    "19": 1
  },
  "3": {
    "1": "0",
    "2": 5,
    "5": 1,
    "6": 1,
    "7": 1
  }
}
```

We get a response back which is large and complicated and definitely contains search results from my email about boarding passes. Here’s an excerpt:

```
"your electronic boarding pass. You could also be asked to display this \nmessage to airport security. * PLEASE NOTE: A printable",
"the attached boarding pass to present at the airport. Manage your booking \nBooking Details Passenger: JULIA EVANS Booking",
"Electronic boarding pass is not offered for your flight. Click the link \nbelow to access the PRINTABLE VERSION of your boarding",
"Save time at the airport Save time at the airport Web version",
"GET YOUR BOARDING PASS IN ADVANCE > You can now check in for your flight \nand you will receive a boarding pass > allowing",
"Save time at the airport Save time at the airport Web version",
"Booking Confirmation Booking Reference: xxxxxx Date of issue: xxxxxxxxxxxx \nSelect Seats eUpgrade",
"your electronic boarding pass. You could also be asked to display this \nmessage to airport security. * PLEASE NOTE: A printable",
"your electronic boarding pass. You could also be asked to display this \nmessage to airport security. * PLEASE NOTE: A printable",
"Save time at the airport Save time at the airport Web version",
"house was boarded up during the last round of bombings. I have no spatial \nimagination and cannot picture the house in three",
"Booking Confirmation Booking Reference: xxxxxx Date of issue: xxxxxxxxxxxx \nSelect Seats eUpgrade"
"required when boarding a flight to Canada. For more details, please visit \nCanada.ca/eTA . - Terms and Conditions of Sale",
"Your KLM boarding pass(s) on XXXXXX To: [image: KLM SkyTeam] Boarding \ninformation Thank you for checking in! Attached you",
"Boarding information Thank you for checking in! Attached you will find your \nboarding pass and/or other documents. Below",
"jetBlue® Your upcoming trip to SEATTLE, WA on xxxxxxxxxxx Flight status \nBaggage info Airport info TAG",
"your electronic boarding pass. You could also be asked to display this \nmessage to airport security. * PLEASE NOTE: A printable"
```

That request got sent to 172.217.13.197:443, which corresponds to some edge server near me. There were probably many other computers involved in searching my email than just the first one who got my request, but the nice thing about this is that we don’t need to care exactly what happened behind the scenes! The browser sent a request, and it got search results back, and it doesn’t need to know what servers.

We can just say “it happens on the server” and not worry too much about the ambiguity of what exactly that means (until something weird goes wrong :)).

### the meaning of “server” depends on the context

So we’ve arrived somewhere a little bit interesting – at first when I thought about the question “what’s a server?” I really thought there was going to be a single simple answer! But it turns out that if you look at sentences where we use the word “server” it can actually refer to a lot of different things in a way that can be confusing:

  * “Let me just ssh into the server and see what’s going on” =&gt; a virtual machine (or possibly a computer)
  * “I sent a SIGTERM to the server and that fixed the problem” =&gt; a program
  * “Let’s look at the server code” =&gt; a program
  * “Let’s buy 20 of those 2U servers” =&gt; a computer
  * “We need to add more server capacity” =&gt; a program and a virtual machine probably
  * “That happens on the server” =&gt; possibly some complex distributed system



--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/12/26/whats-a-server/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://www.newegg.com/p/pl?d=1u+server
[2]: https://en.wikipedia.org/wiki/Rack_unit
[3]: https://c1.neweggimages.com/NeweggImage/ProductImage/11-152-136-02.jpg
[4]: https://archive.org/
