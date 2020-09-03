[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Kubernetes saved my desktop application)
[#]: via: (https://opensource.com/article/20/4/kubernetes-desktop-application)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

How Kubernetes saved my desktop application
======
Keep this fix in mind if you have a broken Java desktop application but
aren't a crypto expert.
![Puzzle pieces coming together to form a computer screen][1]

Recently, fellow Opensource.com scribe James Farrell wrote a wonderful article entitled _[How Ansible brought peace to my home][2]_. In addition to the great article, I really liked the title, one of those unexpected phrases that I’m sure brought a smile to many faces.

I recently had a weird but positive experience of my own that begs a similar sort of unexpected label. I’ve been grappling with a difficult problem that arose when upgrading some server and networking infrastructure that broke a Java application I’ve been supporting since the early 2000s. Strangely enough, I found the solution in what appears to be a very informative and excellent article on Kubernetes, of all things.

Without further ado, here is my problem:

![][3]

I’m guessing that most readers will look at that message and think things like, "I hope there’s more info in the log file," or "I’m really glad I’ve never received a message like that."

Unfortunately, there isn’t a lot of info in the log file, just the same message, in fact. In an effort to debug this, I did three things:

  1. I searched online for the message. Interestingly, or perhaps ominously, there were only 200 or so hits on this string, [one of which suggested][4] [turn][4][ing][4] [on more debugging output][4], which involved adding the setting


```
**-Djavax.net.debug=ssl:handshake:verbose**[/code] to the **java** command running the application.

  2. I tried that suggestion, which resulted in a lot of output (good), most of which only vaguely made sense to me as I’m no kind of expert in the underlying bits of stuff like SSL. But one thing I did notice is that there was no information regarding a response from the server in the midst of all of that output;

  3. So I searched some more.




Another interesting part of this problem is that the code ran fine when executed by the Java command bundled in the OpenJDK, but failed with this error when using a customized runtime [created from the same OpenJDK in this way][5]. So the relatively modest number of apparently similar problems turned up from search #1 above were actually not all that relevant since they all seemed to be dealing mostly with bad SSL certificates on the server in conjunction with the PostgreSQL JDBC’s ability to check the server’s credentials.

I should also mention that it took me quite some time to realize that the problem was introduced by using the custom Java runtime, as I managed to check many other possibilities along the way (and indeed, I did fix a few minor bugs while I was at it). My efforts included things like getting the latest OpenJDK, checking and re-checking all the URLs in case one had a typo, and so forth.

As often happens, after putting the problem aside for a few hours, an idea occurred to me—perhaps I was missing some module in the customized Java runtime. While I didn’t receive any errors directly suggesting that problem, the observable fact that the standard OpenJDK environment worked while the custom one failed seemed to hint at that possibility. I took a quick look in the **jmods/** folder in the OpenJDK installation, but there are some 70 modules there and nothing jumped out at me.

But again, what seemed odd was, with debugging turned on (see #1 above), there was no indication of what the server would accept, just what the client mostly couldn’t offer, many lines like this:
```
`Ignoring unavailable cipher suite: TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA`
```
So I was at least thinking by this time that maybe what was missing was the module that offered those kinds of cipher suites. So I started searching with strings like "jdbc crypto," and in the midst of that, the most unlikely article showed up: [Optimizing Kubernetes Services—Part 2: Spring Web][6], written by [Juan Medina][7]. Midway down the article, I spotted the following:

![][8]

Huh! Imagine that, his script is creating a custom Java runtime, just like mine. But he says he needs to add in manually the module **jdk.crypto.ec** in order t