[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Implementing 'focus and reply' for Fastmail with JMAP)
[#]: via: (https://jvns.ca/blog/2020/08/18/implementing--focus-and-reply--for-fastmail/)
[#]: author: (Julia Evans https://jvns.ca/)

Implementing 'focus and reply' for Fastmail with JMAP
======

Last month I switched my email to Fastmail. One fun thing about Fastmail is that they built a new protocol called [JMAP][1] which is much easier to use than IMAP. So over the last couple of days I built a fun tiny email feature for myself to use with JMAP.

The point of this post is mostly to give a simple end-to-end example of how to use the JMAP API becuase I couldn’t find a lot of examples when I was figuring it out. [Here’s the github repo][2] and a [gist which shows how to authenticate &amp; make your first request][3].

### cool feature from Hey: focus &amp; reply

I tried the <https://hey.com> email service for a little bit when it came out. It wasn’t for me, but I liked their “focus and reply” feature. Here’s a screenshot of what it looks like (from a video on their [marketing site page for the feature][4])

![][5]

Basically it makes replying to a lot of emails in a batch a little simpler. So I thought – can I use JMAP to implement this focus &amp; reply feature from Hey?

### step 0: make the feature simpler

I was a bit too scared to actually send email to start (read-only is safe!), so I decided to start by just making a UI that would show me all the emails I needed to reply to and give me a text box to fill in the replies. Then I could copy and paste the replies into my webmail client to send them. This is a little janky, but I don’t mind it for now.

Here’s an example of what that looks like:

![][6]

### step 0.5: have a “Reply Later” folder in Fastmail

I already had a folder named “Reply Later” in Fastmail, where I manually filed away emails that I needed to reply to but hadn’t gotten to yet. So I had a data source to use! Hooray. Time to start coding.

### step 1: get started with JMAP

I couldn’t find a quickstart guide for using JMAP with Fastmail and I was confused about how to do it for quite a while, so part of my goal with this blog post is to give an example of how to get started. I put all the code you need to make your first API request in a gist: [fastmail-jmap-quickstart.js][3]

You can authenticate all your requests with HTTP Basic authentication with your username and a Fastmail app password.

Here’s the basics of how it works.

  1. Make a GET request to <https://jmap.fastmail.com/.well-known/jmap>. This gives you a “session” in response, gives you your account ID. You need this account ID for all the other API calls. I found this a bit surprising because I usually expect things in `.well-known` to be static files, but this one is a dynamic endpoint that you authenticate to with HTTP Basic authentication. (using your email / app password)
  2. Use that account ID to make requests to the JMAP API at <https://jmap.fastmail.com/api/>



One thing that threw me off about JMAP at first is that you have to wrap all your API requsts with

```
{
    "using": [ "urn:ietf:params:jmap:core", "urn:ietf:params:jmap:mail" ],
    "methodCalls": YOUR_REQUEST_HERE
}
```

For example, this is a request to get a list of all your mailboxes (folders). I think `"0"` is the ID of the request:

```
{
    "using": [ "urn:ietf:params:jmap:core", "urn:ietf:params:jmap:mail" ],
    "methodCalls": [[ "Mailbox/get", {
        "accountId": accountId,
        "ids": null
    }, "0" ]]
}
```

The API wasn’t that intuitive at first, but I was able to figure how to do what I wanted to by reading the spec at <https://jmap.io>.

### step 2: get all my emails

Here’s [the query I used to get my emails from JMAP][7]. I basically just copied this from the examples in the JMAP documentation, but I think it’s interesting that it’s not just 1 query, it’s actually 5 different chained queries that build on top of each other. For example, you have:

```
[ "Email/query", {
    "accountId": accountId,
        // todo: actually do the reply later thing
        "filter": { "inMailbox": mailbox_id },
        "sort": [{ "property": "receivedAt", "isAscending": false }],
        "collapseThreads": true,
        "position": 0,
        "limit": 20,
        "calculateTotal": true
}, "t0" ],
[ "Email/get", {
    "accountId": accountId,
    "#ids": {
        "resultOf": "t0",
        "name": "Email/query",
        "path": "/ids"
    },
    "properties": [ "threadId" ]
}, "t1" ],
...
```

This queries for a list of all the email IDs in a specific mailbox (my “reply later” mailbox), calls it `t0`, and then uses the results of `t0` to request all of those emails.

One of the big ideas in JMAP seems to be this chaining – it really reduces latency if you can do all your work in a single request.

### step 3: render the emails!

Once I had all the emails, rendering them was pretty easy – I just used vue.js + Tailwind. The whole thing came out to [170 lines of not-particularly-well-organized Javascript][8].

### the results

It works! It’s already helped me reply to some emails. The github repo is <https://github.com/jvns/focus-reply-fastmail>.

there are at least 2 problems with this code (and probably more):

  1. it’s storing passwords in local storage, which I think is not a good security practice.
  2. it had some XSS vulnerabilities, which I think I’ve finally fixed by putting the plaintext email in a `<pre>` (so that newlines come through) and escaping any HTML entities in there. (`<pre>{{email}}</pre>`, in Vue)



### fastmail seems to use JMAP in a different way than this

I got curious so I used the Network tab to look at how Fastmail’s web interfaces uses jmap.

  1. Fastmail’s webmail interface doesn’t seem to use <https://jmap.fastmail.com/> – instead it uses <https://www.fastmail.com/jmap/api>. Maybe it’s just a proxy they use so that the requests are being made to the same origin? Unclear.
  2. It also authenticates in a different way, using `Authorization: Bearer`. It seems like this might be a better way to authenticate, but I haven’t found any information about how to get a `Bearer` authentication like this to use instead of using an app password.
  3. The requests it sends are sometimes compressed with deflate for some reason (instead of gzip), which I guess is fine but it means it’s impossible to look at them in dev tools because Firefox doesn’t understand deflate. Weird!



### some links to resources

  * [JMAP crash course][9] (which I only found after I’d already finished doing this but looks very useful!)
  * Fastmail has [some JMAP sample code on github][10]
  * <https://jmap.io/> for the specs
  * <https://github.com/cure53/DOMPurify> is an HTML sanitizer which looks useful for preventing XSS



### this seems like a fun way to do email experiments!

I think the idea that anyone can just use JMAP to make fun email UI experiments without dealing with the Hard Parts of email is really fun!

And it’s really cool that I could get this to work 100% as a frontend app, without any server code at all! All the email data is accessible via JMAP, so it seems extremely possible to just do everything with JMAP requests from the client.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/08/18/implementing--focus-and-reply--for-fastmail/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jmap.io/
[2]: https://github.com/jvns/focus-reply-fastmail
[3]: https://gist.github.com/jvns/738eda48bff8c4dd2a5e349b8df7c7a8
[4]: https://hey.com/features/reply-mode/
[5]: https://jvns.ca/images/original-feature-screenshot.png
[6]: https://jvns.ca/images/focus-reply.png
[7]: https://github.com/jvns/focus-reply-fastmail/blob/726f9ae90a0cab746115a1f645596cd26e7dcafc/focus-and-reply.js#L38-L74
[8]: https://github.com/jvns/focus-reply-fastmail/blob/726f9ae90a0cab746115a1f645596cd26e7dcafc/focus-and-reply.js
[9]: https://jmap.topicbox.com/groups/fastmail-dev-beta/T83594f41ca76f56c/jmap-crash-course
[10]: https://github.com/fastmail/JMAP-Samples
